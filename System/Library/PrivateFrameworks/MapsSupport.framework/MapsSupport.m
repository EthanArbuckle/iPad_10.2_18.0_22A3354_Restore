void sub_1B39C28A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B39C368C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL MSPSharedTripReceivingAvailable()
{
  uint64_t v0;
  _BOOL8 v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v0 = _MSPSharedTripCurrentFeatureAvailability();
  v2 = (~(_DWORD)v0 & 0x1010101) == 0 && BYTE6(v0) != 0;
  v3 = v0 & 0xFFFFFFFFFFFFFFLL;
  if (!_MSPSharedTripFeatureAvailabilityEqual(MSPSharedTripReceivingAvailable_lastLoggedAvailability | ((unint64_t)((unsigned __int16)word_1ED328294 | (byte_1ED328296 << 16)) << 32), v0 & 0xFFFFFFFFFFFFFFLL))
  {
    MSPSharedTripReceivingAvailable_lastLoggedAvailability = v3;
    word_1ED328294 = WORD2(v3);
    byte_1ED328296 = BYTE6(v3);
    MSPGetSharedTripLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if (v2)
        v5 = "Available";
      else
        v5 = "Not Available";
      _MSPSharedTripFeatureAvailabilityToString(v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 136315394;
      v9 = v5;
      v10 = 2114;
      v11 = v6;
      _os_log_impl(&dword_1B39C0000, v4, OS_LOG_TYPE_INFO, "Trip Receiving is %s: %{public}@", (uint8_t *)&v8, 0x16u);

    }
  }
  return v2;
}

id _MSPSharedTripFeatureAvailabilityToString(uint64_t a1)
{
  void *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  const __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;

  v1 = (void *)MEMORY[0x1E0CB3940];
  if ((a1 & 1) != 0)
    v2 = CFSTR("YES");
  else
    v2 = CFSTR("NO");
  if ((a1 & 0x100) != 0)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  if ((a1 & 0x10000) != 0)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if ((a1 & 0x1000000) != 0)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if ((a1 & 0x100000000) != 0)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if ((a1 & 0x10000000000) != 0)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if ((a1 & 0x1000000000000) != 0)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = v7;
  v10 = v6;
  v11 = v5;
  v12 = v4;
  v13 = v3;
  v14 = v2;
  objc_msgSend(v1, "stringWithFormat:", CFSTR("serverEnabled: %@, userEnabled: %@, hasValidAccount: %@, mapsIsInstalled: %@, hasContactsAuthorisation: %@, processEntitledToShare: %@, processEntitledToReceive: %@"), v14, v13, v12, v11, v10, v9, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

BOOL _MSPSharedTripFeatureAvailabilityEqual(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;
  _BOOL4 v4;
  _BOOL4 v5;

  v2 = a2 ^ a1;
  v3 = WORD1(a1) & 1;
  v4 = (BYTE4(a1) & 1) == v3 && ((a2 ^ a1) & 0x1000000000000) == 0;
  if ((v2 & 0x10000000000) != 0)
    v4 = 0;
  v5 = v3 == (WORD1(a2) & 1) && v4;
  if ((v2 & 0x1000000) != 0)
    v5 = 0;
  return (v2 & 0x101) == 0 && v5;
}

uint64_t _MSPSharedTripCurrentFeatureAvailability()
{
  void *v0;
  unsigned int BOOL;
  int v2;
  void *v3;
  void *v4;
  int v5;
  _BOOL4 v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  +[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL = GEOConfigGetBOOL();
  v2 = GEOConfigGetBOOL();
  +[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharingIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasValidAccount");

  v6 = +[MSPMapsInstallState isMapsAppInstalled](MSPMapsInstallState, "isMapsAppInstalled");
  v7 = objc_msgSend(MEMORY[0x1E0C97298], "_maps_isAuthorized");
  v8 = objc_msgSend(v0, "entitledToShareTrip");
  v9 = objc_msgSend(v0, "entitledToReceiveTrips");

  v10 = 0x1000000000000;
  if (!v9)
    v10 = 0;
  v11 = 0x10000000000;
  if (!v8)
    v11 = 0;
  v12 = 0x100000000;
  if (!v7)
    v12 = 0;
  v13 = 0x1000000;
  if (!v6)
    v13 = 0;
  v14 = 0x10000;
  if (!v5)
    v14 = 0;
  v15 = 256;
  if (!v2)
    v15 = 0;
  return v15 | BOOL | v14 | v13 | v12 | v11 | v10;
}

void sub_1B39C4160(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B39C44F8(_Unwind_Exception *a1)
{
  void *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v4 - 72));
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B39C4788(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t MSPSharedTripEnabled()
{
  uint64_t result;

  result = GEOConfigGetBOOL();
  if ((_DWORD)result)
    return GEOConfigGetBOOL();
  return result;
}

void sub_1B39C4C10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location,id a24)
{
  id *v24;
  id *v25;
  id *v26;
  id *v27;

  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a24);
  _Unwind_Resume(a1);
}

id MSPGetSharedTripLog()
{
  if (MSPGetSharedTripLog_onceToken != -1)
    dispatch_once(&MSPGetSharedTripLog_onceToken, &__block_literal_global_9);
  return (id)MSPGetSharedTripLog_log;
}

void sub_1B39C5064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location,id a25)
{
  id *v25;
  id *v26;
  id *v27;
  id *v28;

  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a25);
  _Unwind_Resume(a1);
}

const __CFString *MSPSharedTripNotificationTypeAsString(unint64_t a1)
{
  if (a1 > 6)
    return CFSTR("Unknown");
  else
    return off_1E6651AF0[a1];
}

BOOL MSPPlaceDisplayReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 3)
        break;
      if ((v10 >> 3) == 2)
      {
        v17 = objc_alloc_init(MEMORY[0x1E0D271E8]);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark() || (objc_msgSend(v17, "readFrom:", a2, 0, 0) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if (!*(_QWORD *)(a1 + 8))
      {
        v19 = objc_alloc_init(MEMORY[0x1E0D82BB0]);
        v20 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v19;

      }
      if ((PBUnknownFieldAdd() & 1) == 0)
        return 0;
LABEL_28:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v18 = objc_claimAutoreleasedReturnValue();
    v17 = *(id *)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v18;
LABEL_24:

    goto LABEL_28;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1B39CCCC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B39CD710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL MSPTransitStorageLineItemReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  MSPTransitStorageLine *v17;
  id v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = objc_alloc_init(MSPTransitStorageLine);
        objc_storeStrong((id *)(a1 + 24), v17);
        if (PBReaderPlaceMark() && (MSPTransitStorageLineReadFrom((uint64_t)v17, a2) & 1) != 0)
          goto LABEL_34;
        goto LABEL_37;
      case 2u:
        v17 = (MSPTransitStorageLine *)objc_alloc_init(MEMORY[0x1E0D27208]);
        objc_storeStrong((id *)(a1 + 32), v17);
        if (!PBReaderPlaceMark() || !-[MSPTransitStorageLine readFrom:](v17, "readFrom:", a2, 0, 0))
          goto LABEL_37;
        goto LABEL_34;
      case 3u:
        v17 = objc_alloc_init(MSPTransitStorageAttribution);
        objc_storeStrong((id *)(a1 + 40), v17);
        if (!PBReaderPlaceMark() || (MSPTransitStorageAttributionReadFrom(v17, a2) & 1) == 0)
          goto LABEL_37;
        goto LABEL_34;
      case 4u:
        v17 = objc_alloc_init(MSPTransitStorageIncident);
        objc_msgSend((id)a1, "addIncidents:", v17);
        if (PBReaderPlaceMark() && (MSPTransitStorageIncidentReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
LABEL_34:
          PBReaderRecallMark();

LABEL_35:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_37:

        return 0;
      default:
        if (!*(_QWORD *)(a1 + 8))
        {
          v18 = objc_alloc_init(MEMORY[0x1E0D82BB0]);
          v19 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v18;

        }
        if ((PBUnknownFieldAdd() & 1) == 0)
          return 0;
        goto LABEL_35;
    }
  }
}

BOOL MSPCollectionItemStorageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 48;
          goto LABEL_24;
        case 2u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_24;
        case 3u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_24;
        case 4u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_24;
        case 5u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
LABEL_24:
          v19 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          goto LABEL_25;
        default:
          if (!*(_QWORD *)(a1 + 8))
          {
            v20 = objc_alloc_init(MEMORY[0x1E0D82BB0]);
            v21 = *(void **)(a1 + 8);
            *(_QWORD *)(a1 + 8) = v20;

          }
          if ((PBUnknownFieldAdd() & 1) == 0)
            return 0;
LABEL_25:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          break;
      }
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL MSPTransitStorageIconReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  BOOL v23;
  int *v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  id v45;
  void *v46;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 36) |= 0x10u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            {
              v24 = &OBJC_IVAR___MSPTransitStorageIcon__iconType;
              goto LABEL_63;
            }
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              break;
            v17 += 7;
            v23 = v18++ > 8;
            if (v23)
            {
              LODWORD(v19) = 0;
              v24 = &OBJC_IVAR___MSPTransitStorageIcon__iconType;
              goto LABEL_66;
            }
          }
          v24 = &OBJC_IVAR___MSPTransitStorageIcon__iconType;
          goto LABEL_64;
        case 2u:
          v25 = 0;
          v26 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 36) |= 1u;
          while (2)
          {
            v27 = *v3;
            v28 = *(_QWORD *)(a2 + v27);
            if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
            {
              v24 = &OBJC_IVAR___MSPTransitStorageIcon__cartoID;
              goto LABEL_63;
            }
            v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
            *(_QWORD *)(a2 + v27) = v28 + 1;
            v19 |= (unint64_t)(v29 & 0x7F) << v25;
            if (v29 < 0)
            {
              v25 += 7;
              v23 = v26++ > 8;
              if (v23)
              {
                LODWORD(v19) = 0;
                v24 = &OBJC_IVAR___MSPTransitStorageIcon__cartoID;
                goto LABEL_66;
              }
              continue;
            }
            break;
          }
          v24 = &OBJC_IVAR___MSPTransitStorageIcon__cartoID;
          goto LABEL_64;
        case 3u:
          v30 = 0;
          v31 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 36) |= 2u;
          while (2)
          {
            v32 = *v3;
            v33 = *(_QWORD *)(a2 + v32);
            if (v33 == -1 || v33 >= *(_QWORD *)(a2 + *v4))
            {
              v24 = &OBJC_IVAR___MSPTransitStorageIcon__defaultTransitType;
              goto LABEL_63;
            }
            v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
            *(_QWORD *)(a2 + v32) = v33 + 1;
            v19 |= (unint64_t)(v34 & 0x7F) << v30;
            if (v34 < 0)
            {
              v30 += 7;
              v23 = v31++ > 8;
              if (v23)
              {
                LODWORD(v19) = 0;
                v24 = &OBJC_IVAR___MSPTransitStorageIcon__defaultTransitType;
                goto LABEL_66;
              }
              continue;
            }
            break;
          }
          v24 = &OBJC_IVAR___MSPTransitStorageIcon__defaultTransitType;
          goto LABEL_64;
        case 4u:
          v35 = 0;
          v36 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 36) |= 4u;
          while (2)
          {
            v37 = *v3;
            v38 = *(_QWORD *)(a2 + v37);
            if (v38 == -1 || v38 >= *(_QWORD *)(a2 + *v4))
            {
              v24 = &OBJC_IVAR___MSPTransitStorageIcon__iconAttributeKey;
              goto LABEL_63;
            }
            v39 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v38);
            *(_QWORD *)(a2 + v37) = v38 + 1;
            v19 |= (unint64_t)(v39 & 0x7F) << v35;
            if (v39 < 0)
            {
              v35 += 7;
              v23 = v36++ > 8;
              if (v23)
              {
                LODWORD(v19) = 0;
                v24 = &OBJC_IVAR___MSPTransitStorageIcon__iconAttributeKey;
                goto LABEL_66;
              }
              continue;
            }
            break;
          }
          v24 = &OBJC_IVAR___MSPTransitStorageIcon__iconAttributeKey;
          goto LABEL_64;
        case 5u:
          v40 = 0;
          v41 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 36) |= 8u;
          break;
        default:
          if (!*(_QWORD *)(a1 + 8))
          {
            v45 = objc_alloc_init(MEMORY[0x1E0D82BB0]);
            v46 = *(void **)(a1 + 8);
            *(_QWORD *)(a1 + 8) = v45;

          }
          if ((PBUnknownFieldAdd() & 1) != 0)
            continue;
          return 0;
      }
      while (1)
      {
        v42 = *v3;
        v43 = *(_QWORD *)(a2 + v42);
        if (v43 == -1 || v43 >= *(_QWORD *)(a2 + *v4))
          break;
        v44 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v43);
        *(_QWORD *)(a2 + v42) = v43 + 1;
        v19 |= (unint64_t)(v44 & 0x7F) << v40;
        if ((v44 & 0x80) == 0)
        {
          v24 = &OBJC_IVAR___MSPTransitStorageIcon__iconAttributeValue;
          goto LABEL_64;
        }
        v40 += 7;
        v23 = v41++ > 8;
        if (v23)
        {
          LODWORD(v19) = 0;
          v24 = &OBJC_IVAR___MSPTransitStorageIcon__iconAttributeValue;
          goto LABEL_66;
        }
      }
      v24 = &OBJC_IVAR___MSPTransitStorageIcon__iconAttributeValue;
LABEL_63:
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_64:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v19) = 0;
LABEL_66:
      *(_DWORD *)(a1 + *v24) = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1B39DA1C4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1B39DA678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B39DA888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B39E12CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

BOOL MSPRidesharingTripReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
      {
        v17 = objc_alloc_init(MEMORY[0x1E0D26FF8]);
        v18 = 16;
      }
      else
      {
        if ((v10 >> 3) != 1)
        {
          if (!*(_QWORD *)(a1 + 8))
          {
            v19 = objc_alloc_init(MEMORY[0x1E0D82BB0]);
            v20 = *(void **)(a1 + 8);
            *(_QWORD *)(a1 + 8) = v19;

          }
          if ((PBUnknownFieldAdd() & 1) == 0)
            return 0;
          continue;
        }
        v17 = objc_alloc_init(MEMORY[0x1E0D26FF8]);
        v18 = 24;
      }
      objc_storeStrong((id *)(a1 + v18), v17);
      if (!PBReaderPlaceMark() || (objc_msgSend(v17, "readFrom:", a2, 0, 0) & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark();

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t MSPTransitStorageAttributionReadFrom(_QWORD *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  void *v17;
  id v18;
  void *v19;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(a1, "addProviderNames:", v17);

      }
      else
      {
        if (!a1[1])
        {
          v18 = objc_alloc_init(MEMORY[0x1E0D82BB0]);
          v19 = (void *)a1[1];
          a1[1] = v18;

        }
        result = PBUnknownFieldAdd();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t MSPDroppedPinReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t result;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v18 = objc_alloc_init(MEMORY[0x1E0D27140]);
        v19 = 32;
        goto LABEL_25;
      case 2u:
        v18 = objc_alloc_init(MEMORY[0x1E0D27208]);
        v19 = 40;
LABEL_25:
        objc_storeStrong((id *)(a1 + v19), v18);
        if (PBReaderPlaceMark() && (objc_msgSend(v18, "readFrom:", a2, 0, 0) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_44:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 3u:
        *(_BYTE *)(a1 + 48) |= 1u;
        v23 = *v3;
        v24 = *(_QWORD *)(a2 + v23);
        if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v25 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v25 = 0;
        }
        *(_QWORD *)(a1 + 16) = v25;
        goto LABEL_44;
      case 4u:
        v26 = 0;
        v27 = 0;
        v28 = 0;
        *(_BYTE *)(a1 + 48) |= 2u;
        while (2)
        {
          v29 = *v3;
          v30 = *(_QWORD *)(a2 + v29);
          v31 = v30 + 1;
          if (v30 == -1 || v31 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
            *(_QWORD *)(a2 + v29) = v31;
            v28 |= (unint64_t)(v32 & 0x7F) << v26;
            if (v32 < 0)
            {
              v26 += 7;
              v15 = v27++ >= 9;
              if (v15)
              {
                LODWORD(v28) = 0;
                goto LABEL_41;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v28) = 0;
LABEL_41:
        *(_DWORD *)(a1 + 24) = v28;
        goto LABEL_44;
      default:
        if (!*(_QWORD *)(a1 + 8))
        {
          v20 = objc_alloc_init(MEMORY[0x1E0D82BB0]);
          v21 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v20;

        }
        result = PBUnknownFieldAdd();
        if (!(_DWORD)result)
          return result;
        goto LABEL_44;
    }
  }
}

uint64_t MSPPinnedPlaceStorageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  id v23;
  void *v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  MSPPinnedPlaceContactStorage *v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  void *v35;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 64) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_48;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_50;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_48:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_50:
        *(_DWORD *)(a1 + 56) = v19;
        goto LABEL_55;
      case 2u:
        PBReaderReadString();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = 32;
        goto LABEL_46;
      case 3u:
        PBReaderReadString();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = 24;
        goto LABEL_46;
      case 4u:
        v28 = (MSPPinnedPlaceContactStorage *)objc_alloc_init(MEMORY[0x1E0D271E8]);
        objc_storeStrong((id *)(a1 + 40), v28);
        if (!PBReaderPlaceMark()
          || !-[MSPPinnedPlaceContactStorage readFrom:](v28, "readFrom:", a2, 0, 0))
        {
          goto LABEL_57;
        }
        goto LABEL_37;
      case 5u:
        v28 = objc_alloc_init(MSPPinnedPlaceContactStorage);
        objc_msgSend((id)a1, "addContactStorage:", v28);
        if (PBReaderPlaceMark() && MSPPinnedPlaceContactStorageReadFrom((uint64_t)v28, a2))
        {
LABEL_37:
          PBReaderRecallMark();

LABEL_55:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_57:

        return 0;
      case 6u:
        v29 = 0;
        v30 = 0;
        v31 = 0;
        *(_BYTE *)(a1 + 64) |= 2u;
        while (2)
        {
          v32 = *v3;
          v33 = *(_QWORD *)(a2 + v32);
          if (v33 == -1 || v33 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
            *(_QWORD *)(a2 + v32) = v33 + 1;
            v31 |= (unint64_t)(v34 & 0x7F) << v29;
            if (v34 < 0)
            {
              v29 += 7;
              v14 = v30++ >= 9;
              if (v14)
              {
                v31 = 0;
                goto LABEL_54;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v31 = 0;
LABEL_54:
        *(_BYTE *)(a1 + 60) = v31 != 0;
        goto LABEL_55;
      case 7u:
        PBReaderReadString();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = 48;
LABEL_46:
        v35 = *(void **)(a1 + v27);
        *(_QWORD *)(a1 + v27) = v26;

        goto LABEL_55;
      default:
        if (!*(_QWORD *)(a1 + 8))
        {
          v23 = objc_alloc_init(MEMORY[0x1E0D82BB0]);
          v24 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v23;

        }
        result = PBUnknownFieldAdd();
        if (!(_DWORD)result)
          return result;
        goto LABEL_55;
    }
  }
}

uint64_t MSPSharedTripVirtualReceiverIsValid(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "hasPrefix:", CFSTR("maps-share-eta-test:")))
    v2 = objc_msgSend(v1, "containsString:", CFSTR("name"));
  else
    v2 = 0;

  return v2;
}

__CFString *MSPSharedTripVirtualReceiverHandleGetName(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (objc_msgSend(v1, "hasPrefix:", CFSTR("maps-share-eta-test://")))
  {
    v2 = v1;
  }
  else
  {
    if ((objc_msgSend(v1, "hasPrefix:", CFSTR("maps-share-eta-test:")) & 1) == 0)
    {

LABEL_8:
      v1 = v1;
      objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("/"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)IDSCopyAddressDestinationForDestination();
      if (!MSPSharedTripVirtualReceiverIsValid(v5) || objc_msgSend(v4, "count") != 2)
      {

        v8 = CFSTR("Unknown");
        goto LABEL_31;
      }

      v6 = (void *)IDSCopyAddressDestinationForDestination();
      v1 = v6;
      if (objc_msgSend(v1, "hasPrefix:", CFSTR("maps-share-eta-test://")))
      {
        v7 = v1;
      }
      else
      {
        if (!objc_msgSend(v1, "hasPrefix:", CFSTR("maps-share-eta-test:")))
        {
          v3 = 0;
          goto LABEL_17;
        }
        objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("maps-share-eta-test:"), CFSTR("maps-share-eta-test://"));
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      v3 = v7;
LABEL_17:

      goto LABEL_18;
    }
    objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("maps-share-eta-test:"), CFSTR("maps-share-eta-test://"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;

  if (!v3)
    goto LABEL_8;
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v9, "queryItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v20 = v9;
    v21 = v3;
    v13 = *(_QWORD *)v23;
    v8 = CFSTR("Unknown");
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v15, "name", v20, v21);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("name"));

        if ((v17 & 1) != 0)
        {
          objc_msgSend(v15, "value");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringByRemovingURLEscapes");
          v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

          goto LABEL_28;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v12)
        continue;
      break;
    }
LABEL_28:
    v9 = v20;
    v3 = v21;
  }
  else
  {
    v8 = CFSTR("Unknown");
  }

LABEL_31:
  return v8;
}

id MSPSharedTripVirtualReceiverHandleGetReceiverCapabilities(void *a1)
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  MSPSharedTripVirtualReceiverHandleGetReceiverCapabilityVersions(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v7), "unsignedIntegerValue");
        if (v8)
        {
          if (v8 == 1)
          {
            +[MSPSharedTripReceiverCapabilities starskyReceiverCapabilities](MSPSharedTripReceiverCapabilities, "starskyReceiverCapabilities");
            v9 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v8 != 2)
              goto LABEL_13;
            +[MSPSharedTripReceiverCapabilities sydromeReceiverCapabilities](MSPSharedTripReceiverCapabilities, "sydromeReceiverCapabilities");
            v9 = objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          +[MSPSharedTripReceiverCapabilities legacyReceiverCapabilities](MSPSharedTripReceiverCapabilities, "legacyReceiverCapabilities");
          v9 = objc_claimAutoreleasedReturnValue();
        }
        v10 = (void *)v9;
        objc_msgSend(v2, "addObject:", v9);

LABEL_13:
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  v11 = (void *)objc_msgSend(v2, "copy");

  return v11;
}

id MSPSharedTripVirtualReceiverHandleGetReceiverCapabilityVersions(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[3];

  v30[1] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (MSPSharedTripVirtualReceiverHandleGetCapabilityType(v1) == 4)
  {
    v2 = v1;
    objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("/"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)IDSCopyAddressDestinationForDestination();
    if (MSPSharedTripVirtualReceiverIsValid(v4) && objc_msgSend(v3, "count") == 2)
    {

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", MSPSharedTripVirturalReceiverDeviceHandleGetReceiverCapabilityVersion(v2));
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v30[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_28:
      v7 = (void *)v6;

      goto LABEL_29;
    }

    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = v2;
    if (objc_msgSend(v8, "hasPrefix:", CFSTR("maps-share-eta-test://")))
    {
      v9 = v8;
    }
    else
    {
      if ((objc_msgSend(v8, "hasPrefix:", CFSTR("maps-share-eta-test:")) & 1) == 0)
      {

LABEL_25:
        if (!objc_msgSend(v5, "count"))
          objc_msgSend(v5, "addObject:", &unk_1E666C4C8);
        v6 = objc_msgSend(v5, "copy");
        goto LABEL_28;
      }
      objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("maps-share-eta-test:"), CFSTR("maps-share-eta-test://"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    if (v10)
    {
      v24 = v1;
      objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", v10);
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "queryItems");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v26 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            objc_msgSend(v16, "name");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("capabilities"));

            if (v18)
            {
              objc_msgSend(v16, "value");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v19, "length"))
              {
                v20 = objc_msgSend(v19, "unsignedIntValue");
                if (v20 <= 2)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "addObject:", v21);

                }
              }

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v13);
      }

      v1 = v24;
    }
    goto LABEL_25;
  }
  v7 = (void *)MEMORY[0x1E0C9AA60];
LABEL_29:

  return v7;
}

uint64_t MSPSharedTripVirtualReceiverHandleGetCapabilityType(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (objc_msgSend(v1, "hasPrefix:", CFSTR("maps-share-eta-test://")))
  {
    v2 = v1;
  }
  else
  {
    if ((objc_msgSend(v1, "hasPrefix:", CFSTR("maps-share-eta-test:")) & 1) == 0)
    {

      goto LABEL_20;
    }
    objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("maps-share-eta-test:"), CFSTR("maps-share-eta-test://"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;

  if (!v3)
  {
LABEL_20:
    v16 = v1;
    objc_msgSend(v16, "componentsSeparatedByString:", CFSTR("/"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)IDSCopyAddressDestinationForDestination();
    if (MSPSharedTripVirtualReceiverIsValid(v18) && objc_msgSend(v17, "count") == 2)
    {

      v15 = 4;
    }
    else
    {

      v15 = 0;
    }
    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v4, "queryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v20 = v4;
    v21 = v3;
    v8 = *(_QWORD *)v23;
LABEL_8:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v9);
      objc_msgSend(v10, "name", v20, v21);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("type"));

      if (v12)
      {
        objc_msgSend(v10, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "isEqualToString:", CFSTR("maps")) & 1) != 0)
        {
          v15 = 4;
LABEL_26:

LABEL_28:
          v4 = v20;
          v3 = v21;
          goto LABEL_29;
        }
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("messages")))
        {
          v15 = 3;
          goto LABEL_26;
        }
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("sms"));

        if ((v14 & 1) != 0)
        {
          v15 = 2;
          goto LABEL_28;
        }
      }
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v7)
          goto LABEL_8;
        v4 = v20;
        v3 = v21;
        break;
      }
    }
  }
  v15 = 4;
LABEL_29:

LABEL_30:
  return v15;
}

uint64_t MSPSharedTripVirturalReceiverDeviceHandleGetReceiverCapabilityVersion(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = objc_msgSend(&unk_1E666C6D8, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v11;
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v4)
        objc_enumerationMutation(&unk_1E666C6D8);
      v6 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v5), "unsignedIntegerValue");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("version-%lu"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v1, "rangeOfString:", v7);

      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
        break;
      if (v3 == ++v5)
      {
        v3 = objc_msgSend(&unk_1E666C6D8, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v3)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v6 = 2;
  }

  return v6;
}

id MSPSharedTripVirtualReceiverHandleMake(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@?"), CFSTR("maps-share-eta-test:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = (void *)MEMORY[0x1E0CB3940];
  v23 = v5;
  objc_msgSend(v5, "stringByAddingPercentEscapesUsingEncoding:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("name=%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v11);

  if ((unint64_t)(a2 - 2) <= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type=%@"), off_1E6652080[a2 - 2]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v12);

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v18, "unsignedIntegerValue");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("capabilities=%lu"), objc_msgSend(v18, "unsignedIntegerValue"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v19);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v15);
  }

  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("&"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:", v20);

  if (MSPSharedTripVirtualReceiverIsValid(v7))
    v21 = (void *)objc_msgSend(v7, "copy");
  else
    v21 = 0;

  return v21;
}

id MSPSharedTripVirturalReceiverDeviceHandleMake(void *a1, uint64_t a2)
{
  id v3;
  void *v4;

  v3 = a1;
  if (MSPSharedTripVirtualReceiverIsValid(v3))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("token:version-%lu/%@"), a2, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id MSPSharedTripGetVirtualReceivers(void *a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (MSPSharedTripVirtualReceiverIsValid(v8))
          objc_msgSend(v2, "addObject:", v8, (_QWORD)v11);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_msgSend(v2, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id MSPSharedTripGetRealReceivers(void *a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((MSPSharedTripVirtualReceiverIsValid(v8) & 1) == 0)
          objc_msgSend(v2, "addObject:", v8, (_QWORD)v11);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_msgSend(v2, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t MSPTransitStorageShieldReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  id v27;
  void *v28;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v17 == 2)
      {
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 40) |= 1u;
        while (1)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
            break;
          v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
          *(_QWORD *)(a2 + v24) = v25 + 1;
          v23 |= (unint64_t)(v26 & 0x7F) << v21;
          if ((v26 & 0x80) == 0)
            goto LABEL_36;
          v21 += 7;
          v14 = v22++ >= 9;
          if (v14)
          {
            v23 = 0;
            goto LABEL_38;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_36:
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_38:
        *(_QWORD *)(a1 + 16) = v23;
        goto LABEL_39;
      }
      if ((_DWORD)v17 == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 32;
LABEL_23:
        v20 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_39;
      }
      if (!*(_QWORD *)(a1 + 8))
      {
        v27 = objc_alloc_init(MEMORY[0x1E0D82BB0]);
        v28 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v27;

      }
      result = PBUnknownFieldAdd();
      if (!(_DWORD)result)
        return result;
LABEL_39:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = 24;
    goto LABEL_23;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t MSPExcludePathFromBackup(void *a1)
{
  id v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (id)*MEMORY[0x1E0C9AC90];
  v3 = (id)*MEMORY[0x1E0C9AC98];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = *MEMORY[0x1E0C999D8];
  v19[1] = v2;
  v20[0] = MEMORY[0x1E0C9AAA0];
  v20[1] = MEMORY[0x1E0C9AAB0];
  v19[2] = v3;
  v20[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v6 = objc_msgSend(v4, "setResourceValues:error:", v5, &v12);
  v7 = v12;

  if (v7)
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = objc_msgSend(v7, "code");
      objc_msgSend(v1, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v14 = v9;
      v15 = 2114;
      v16 = v10;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_DEBUG, "Failed (error %ld) to exclude file from backup: %{public}@ (%@)", buf, 0x20u);

    }
  }

  return v6;
}

uint64_t MSPIncludePathInBackup(void *a1)
{
  id v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (id)*MEMORY[0x1E0C9AC90];
  v3 = (id)*MEMORY[0x1E0C9AC98];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = *MEMORY[0x1E0C999D8];
  v19[1] = v2;
  v20[0] = MEMORY[0x1E0C9AAA0];
  v20[1] = MEMORY[0x1E0C9AAA0];
  v19[2] = v3;
  v20[2] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v6 = objc_msgSend(v4, "setResourceValues:error:", v5, &v12);
  v7 = v12;

  if (v7)
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = objc_msgSend(v7, "code");
      objc_msgSend(v1, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v14 = v9;
      v15 = 2114;
      v16 = v10;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_DEBUG, "Failed (error %ld) to include file in backup: %{public}@ (%@)", buf, 0x20u);

    }
  }

  return v6;
}

uint64_t MSPIsExcludedFromBackup(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v1 = *MEMORY[0x1E0C9AC90];
  v2 = *MEMORY[0x1E0C9AC98];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v1;
  v10[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resourceValuesForKeys:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "BOOLValue"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void MSPMapsPathsSourceApplicationsChangeCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("bundleIDs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v9 = v6;

  v7 = v9;
  if (v9)
  {
    v8 = objc_msgSend(v9, "containsObject:", CFSTR("com.apple.Maps"));
    v7 = v9;
    if (v8)
    {
      dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_211);
      v7 = v9;
    }
  }

}

void sub_1B39EA87C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getNRPairedDeviceRegistryClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!qword_1ED328388)
  {
    qword_1ED328388 = _sl_dlopen();
    if (!qword_1ED328388)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("NRPairedDeviceRegistry");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  qword_1ED328380 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t DeviceIdentityLibrary()
{
  uint64_t v0;
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = DeviceIdentityLibraryCore_frameworkLibrary;
  v7 = DeviceIdentityLibraryCore_frameworkLibrary;
  if (!DeviceIdentityLibraryCore_frameworkLibrary)
  {
    v8 = xmmword_1E6652288;
    v9 = *(_OWORD *)&off_1E6652298;
    v1 = _sl_dlopen();
    v5[3] = v1;
    DeviceIdentityLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (void *)abort_report_np();
    __break(1u);
    free(v3);
  }
  return v0;
}

void sub_1B39ECC6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void MSPUGCFetchClientCertificateWithCompletion(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t UInteger;
  id v11;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  v11 = a1;
  LOBYTE(a1) = GEOConfigGetBOOL();
  UInteger = GEOConfigGetUInteger();
  MSPUGCFetchClientCertificate(v11, v9, v8, (char)a1, v7, (double)(unint64_t)(60 * UInteger));

}

void MSPUGCFetchClientCertificate(void *a1, void *a2, void *a3, char a4, void *a5, double a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  dispatch_queue_t v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  _QWORD block[4];
  id v21;
  id v22;
  dispatch_queue_t v23;
  id v24;
  id v25;
  double v26;
  char v27;
  uint8_t buf[16];

  v11 = a1;
  v12 = a2;
  v13 = a3;
  v14 = a5;
  if (!v14)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_WORD *)buf = 0;
    v18 = MEMORY[0x1E0C81028];
    v19 = "Assertion failed: completion != ((void *)0)";
LABEL_9:
    _os_log_fault_impl(&dword_1B39C0000, v18, OS_LOG_TYPE_FAULT, v19, buf, 2u);
    goto LABEL_4;
  }
  if (!v12)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_WORD *)buf = 0;
    v18 = MEMORY[0x1E0C81028];
    v19 = "Assertion failed: dataToSign != ((void *)0)";
    goto LABEL_9;
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = dispatch_queue_create("com.apple.maps.UGCBAACertificateFetching", v15);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __MSPUGCFetchClientCertificate_block_invoke;
  block[3] = &unk_1E66522D8;
  v21 = v11;
  v27 = a4;
  v26 = a6;
  v22 = v13;
  v23 = v16;
  v25 = v14;
  v24 = v12;
  v17 = v16;
  dispatch_async(v17, block);

LABEL_4:
}

void sub_1B39ED6BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MSPGetUGCBAAUtilitiesLog()
{
  if (qword_1ED3283F0 != -1)
    dispatch_once(&qword_1ED3283F0, &__block_literal_global_5);
  return (id)qword_1ED3283E8;
}

void MSPUGCPerformLogDiscardForCurrentSessionWithCompletion(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  id v19;

  v9 = (void *)MEMORY[0x1E0CB34D0];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = a1;
  objc_msgSend(v9, "mainBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0D26D08]);

  if ((v16 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D27698], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setShareSessionWithMaps:", 1);

  }
  objc_msgSend(MEMORY[0x1E0D27698], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "mapsUserSessionEntity");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  MSPUGCPerformLogDiscardForSessionEntityWithCompletion(v13, v19, a2, v12, v11, v10);
}

void MSPUGCPerformLogDiscardForSessionEntityWithCompletion(void *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  NSObject *v17;
  __CFString *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  _QWORD *v23;
  id v24;
  uint64_t v25;
  __CFString *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  id v37;
  id v38;
  id v39;
  NSObject *v40;
  _QWORD v41[4];
  NSObject *v42;
  id v43;
  id v44;
  id v45;
  os_signpost_id_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE buf[24];
  void *v51;
  id v52;
  id v53;
  _QWORD v54[4];

  v54[2] = *MEMORY[0x1E0C80C00];
  v11 = a1;
  v12 = a2;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (a3 == 2)
    v16 = 2;
  else
    v16 = a3 == 1;
  v17 = v13;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = off_1E6652368[v16];
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v18;
    _os_log_impl(&dword_1B39C0000, v17, OS_LOG_TYPE_INFO, "%@ - LogDiscard for trigger %@", buf, 0x16u);

  }
  v19 = os_signpost_id_generate(v17);
  v20 = v17;
  v21 = v20;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B39C0000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "BAACertificateRequest", (const char *)&unk_1B3A3EAC5, buf, 2u);
  }

  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __MSPUGCPerformLogDiscardForSessionEntityWithCompletion_block_invoke;
  v41[3] = &unk_1E6652300;
  v40 = v21;
  v42 = v40;
  v46 = v19;
  v39 = v14;
  v43 = v39;
  v47 = v16;
  v44 = v11;
  v38 = v15;
  v45 = v38;
  v22 = v44;
  v23 = v41;
  v24 = v12;
  objc_msgSend(v24, "sessionUUIDString");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
    v26 = (__CFString *)v25;
  else
    v26 = &stru_1E6655688;
  v54[0] = CFSTR("com.apple.Maps.LogDiscard");
  v54[1] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "componentsJoinedByString:", CFSTR(":"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_msgSend(v24, "sessionID");
  v31 = v30;

  v48 = v29;
  v49 = v31;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v48, 16);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v32, "copy");
  v35 = v48;
  v34 = v49;
  MSPGetUGCBAAUtilitiesLog();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134283777;
    *(_QWORD *)&buf[4] = v35;
    *(_WORD *)&buf[12] = 2049;
    *(_QWORD *)&buf[14] = v34;
    _os_log_impl(&dword_1B39C0000, v36, OS_LOG_TYPE_INFO, "Received high %{private}llu and low %{private}llu", buf, 0x16u);
  }

  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __UGCFetchLogDiscardCertificatesForSessionWithCompletion_block_invoke;
  v51 = &unk_1E6652348;
  v52 = v22;
  v53 = v23;
  v37 = v22;
  MSPUGCFetchClientCertificateWithCompletion(v28, v32, v33, buf);

}

void MSPUGCPerformLogDiscardForSessionWithCompletion(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7)
{
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v13 = (objc_class *)MEMORY[0x1E0D276A0];
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a1;
  v18 = (id)objc_msgSend([v13 alloc], "initWithSessionID:sessionCreationTime:sequenceNumber:", a2, a3, 0, 0.0);
  MSPUGCPerformLogDiscardForSessionEntityWithCompletion(v17, v18, a4, v16, v15, v14);

}

uint64_t MSPTransitStorageArtworkReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  id v28;
  void *v29;
  uint64_t result;
  MSPTransitStorageShield *v31;
  uint64_t v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 60) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_54;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_56;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_54:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_56:
        v41 = 24;
        goto LABEL_61;
      case 2u:
        v23 = 0;
        v24 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 60) |= 2u;
        while (2)
        {
          v25 = *v3;
          v26 = *(_QWORD *)(a2 + v25);
          if (v26 == -1 || v26 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v26);
            *(_QWORD *)(a2 + v25) = v26 + 1;
            v19 |= (unint64_t)(v27 & 0x7F) << v23;
            if (v27 < 0)
            {
              v23 += 7;
              v14 = v24++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_60;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_60:
        v41 = 28;
LABEL_61:
        *(_DWORD *)(a1 + v41) = v19;
        goto LABEL_66;
      case 0xAu:
        v31 = objc_alloc_init(MSPTransitStorageShield);
        v32 = 48;
        goto LABEL_42;
      case 0xBu:
        v31 = objc_alloc_init(MSPTransitStorageIcon);
        objc_storeStrong((id *)(a1 + 32), v31);
        if (!PBReaderPlaceMark() || !MSPTransitStorageIconReadFrom((uint64_t)v31, a2))
          goto LABEL_68;
        goto LABEL_44;
      case 0xCu:
        v31 = objc_alloc_init(MSPTransitStorageShield);
        v32 = 40;
LABEL_42:
        objc_storeStrong((id *)(a1 + v32), v31);
        if (PBReaderPlaceMark() && (MSPTransitStorageShieldReadFrom((uint64_t)v31, a2) & 1) != 0)
        {
LABEL_44:
          PBReaderRecallMark();

LABEL_66:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_68:

        return 0;
      case 0xDu:
        v33 = 0;
        v34 = 0;
        v35 = 0;
        *(_BYTE *)(a1 + 60) |= 4u;
        while (2)
        {
          v36 = *v3;
          v37 = *(_QWORD *)(a2 + v36);
          if (v37 == -1 || v37 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v37);
            *(_QWORD *)(a2 + v36) = v37 + 1;
            v35 |= (unint64_t)(v38 & 0x7F) << v33;
            if (v38 < 0)
            {
              v33 += 7;
              v14 = v34++ >= 9;
              if (v14)
              {
                v35 = 0;
                goto LABEL_65;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v35 = 0;
LABEL_65:
        *(_BYTE *)(a1 + 56) = v35 != 0;
        goto LABEL_66;
      case 0xEu:
        PBReaderReadString();
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v39;

        goto LABEL_66;
      default:
        if (!*(_QWORD *)(a1 + 8))
        {
          v28 = objc_alloc_init(MEMORY[0x1E0D82BB0]);
          v29 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v28;

        }
        result = PBUnknownFieldAdd();
        if (!(_DWORD)result)
          return result;
        goto LABEL_66;
    }
  }
}

uint64_t MSPTransitStorageIncidentReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  id v23;
  void *v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  char v45;
  unsigned int v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  MSPTransitStorageIncidentEntity *v61;
  uint64_t v62;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 108) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_83;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_85;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_83:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_85:
        *(_QWORD *)(a1 + 16) = v19;
        goto LABEL_107;
      case 2u:
        PBReaderReadString();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = 96;
        goto LABEL_36;
      case 3u:
        PBReaderReadString();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = 88;
        goto LABEL_36;
      case 4u:
        PBReaderReadString();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = 40;
        goto LABEL_36;
      case 5u:
        PBReaderReadString();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = 64;
        goto LABEL_36;
      case 6u:
        PBReaderReadString();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = 72;
        goto LABEL_36;
      case 7u:
        PBReaderReadString();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = 56;
LABEL_36:
        v28 = *(void **)(a1 + v27);
        *(_QWORD *)(a1 + v27) = v26;

        goto LABEL_107;
      case 8u:
        v29 = 0;
        v30 = 0;
        v31 = 0;
        *(_BYTE *)(a1 + 108) |= 0x20u;
        while (2)
        {
          v32 = *v3;
          v33 = *(_QWORD *)(a2 + v32);
          if (v33 == -1 || v33 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
            *(_QWORD *)(a2 + v32) = v33 + 1;
            v31 |= (unint64_t)(v34 & 0x7F) << v29;
            if (v34 < 0)
            {
              v29 += 7;
              v14 = v30++ >= 9;
              if (v14)
              {
                LODWORD(v31) = 0;
                goto LABEL_89;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v31) = 0;
LABEL_89:
        v62 = 80;
        goto LABEL_106;
      case 9u:
        v35 = 0;
        v36 = 0;
        v31 = 0;
        *(_BYTE *)(a1 + 108) |= 4u;
        while (2)
        {
          v37 = *v3;
          v38 = *(_QWORD *)(a2 + v37);
          if (v38 == -1 || v38 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v39 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v38);
            *(_QWORD *)(a2 + v37) = v38 + 1;
            v31 |= (unint64_t)(v39 & 0x7F) << v35;
            if (v39 < 0)
            {
              v35 += 7;
              v14 = v36++ >= 9;
              if (v14)
              {
                LODWORD(v31) = 0;
                goto LABEL_93;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v31) = 0;
LABEL_93:
        v62 = 36;
        goto LABEL_106;
      case 0xAu:
        v40 = 0;
        v41 = 0;
        v31 = 0;
        *(_BYTE *)(a1 + 108) |= 8u;
        while (2)
        {
          v42 = *v3;
          v43 = *(_QWORD *)(a2 + v42);
          if (v43 == -1 || v43 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v44 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v43);
            *(_QWORD *)(a2 + v42) = v43 + 1;
            v31 |= (unint64_t)(v44 & 0x7F) << v40;
            if (v44 < 0)
            {
              v40 += 7;
              v14 = v41++ >= 9;
              if (v14)
              {
                LODWORD(v31) = 0;
                goto LABEL_97;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v31) = 0;
LABEL_97:
        v62 = 48;
        goto LABEL_106;
      case 0xBu:
        v45 = 0;
        v46 = 0;
        v31 = 0;
        *(_BYTE *)(a1 + 108) |= 2u;
        while (2)
        {
          v47 = *v3;
          v48 = *(_QWORD *)(a2 + v47);
          if (v48 == -1 || v48 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v49 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v48);
            *(_QWORD *)(a2 + v47) = v48 + 1;
            v31 |= (unint64_t)(v49 & 0x7F) << v45;
            if (v49 < 0)
            {
              v45 += 7;
              v14 = v46++ >= 9;
              if (v14)
              {
                LODWORD(v31) = 0;
                goto LABEL_101;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v31) = 0;
LABEL_101:
        v62 = 32;
        goto LABEL_106;
      case 0xCu:
        v50 = 0;
        v51 = 0;
        v31 = 0;
        *(_BYTE *)(a1 + 108) |= 0x10u;
        while (2)
        {
          v52 = *v3;
          v53 = *(_QWORD *)(a2 + v52);
          if (v53 == -1 || v53 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v54 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v53);
            *(_QWORD *)(a2 + v52) = v53 + 1;
            v31 |= (unint64_t)(v54 & 0x7F) << v50;
            if (v54 < 0)
            {
              v50 += 7;
              v14 = v51++ >= 9;
              if (v14)
              {
                LODWORD(v31) = 0;
                goto LABEL_105;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v31) = 0;
LABEL_105:
        v62 = 52;
LABEL_106:
        *(_DWORD *)(a1 + v62) = v31;
        goto LABEL_107;
      case 0xDu:
        v55 = 0;
        v56 = 0;
        v57 = 0;
        *(_BYTE *)(a1 + 108) |= 0x40u;
        while (2)
        {
          v58 = *v3;
          v59 = *(_QWORD *)(a2 + v58);
          if (v59 == -1 || v59 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v60 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v59);
            *(_QWORD *)(a2 + v58) = v59 + 1;
            v57 |= (unint64_t)(v60 & 0x7F) << v55;
            if (v60 < 0)
            {
              v55 += 7;
              v14 = v56++ >= 9;
              if (v14)
              {
                v57 = 0;
                goto LABEL_112;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v57 = 0;
LABEL_112:
        *(_BYTE *)(a1 + 104) = v57 != 0;
        goto LABEL_107;
      case 0xEu:
        v61 = objc_alloc_init(MSPTransitStorageIncidentEntity);
        objc_msgSend((id)a1, "addAffectedEntities:", v61);
        if (PBReaderPlaceMark() && (MSPTransitStorageIncidentEntityReadFrom((uint64_t)v61, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_107:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        if (!*(_QWORD *)(a1 + 8))
        {
          v23 = objc_alloc_init(MEMORY[0x1E0D82BB0]);
          v24 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v23;

        }
        result = PBUnknownFieldAdd();
        if (!(_DWORD)result)
          return result;
        goto LABEL_107;
    }
  }
}

uint64_t GEOConfigMSPGetUserDefaultStringKeysForWatchSync()
{
  return MEMORY[0x1E0C9AA60];
}

uint64_t GEOConfigMSPGetConfigStoreStringKeysForWatchSync()
{
  return MEMORY[0x1E0C9AA60];
}

void sub_1B39F30B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1B39F3118(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B39F31D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1B39F3D50(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t MSPTransitStorageSystemReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  MSPTransitStorageArtwork *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v24 = objc_alloc_init(MSPTransitStorageArtwork);
        objc_storeStrong((id *)(a1 + 24), v24);
        if (!PBReaderPlaceMark() || (MSPTransitStorageArtworkReadFrom((uint64_t)v24, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((_DWORD)v17 == 2)
      {
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 32);
        *(_QWORD *)(a1 + 32) = v25;

      }
      else if ((_DWORD)v17 == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 40) |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_37;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            v20 = 0;
            goto LABEL_39;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_39:
        *(_QWORD *)(a1 + 16) = v20;
      }
      else
      {
        if (!*(_QWORD *)(a1 + 8))
        {
          v27 = objc_alloc_init(MEMORY[0x1E0D82BB0]);
          v28 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v27;

        }
        result = PBUnknownFieldAdd();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL MSPCollectionItemReplicaStorageReadFrom(_QWORD *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  MSPCollectionItemStorage *v18;
  id v19;
  void *v20;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (MSPCollectionItemStorage *)a1[2];
        a1[2] = v17;
LABEL_24:

        goto LABEL_28;
      }
      if (!a1[1])
      {
        v19 = objc_alloc_init(MEMORY[0x1E0D82BB0]);
        v20 = (void *)a1[1];
        a1[1] = v19;

      }
      if ((PBUnknownFieldAdd() & 1) == 0)
        return 0;
LABEL_28:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v18 = objc_alloc_init(MSPCollectionItemStorage);
    objc_msgSend(a1, "addRecords:", v18);
    if (!PBReaderPlaceMark() || !MSPCollectionItemStorageReadFrom((uint64_t)v18, a2))
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t MSPCompanionSyncedItemReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t result;
  MSPBookmarkStorage *v22;
  uint64_t v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 48);
        *(_QWORD *)(a1 + 48) = v17;

        goto LABEL_41;
      case 2u:
        v22 = objc_alloc_init(MSPBookmarkStorage);
        v23 = 16;
        goto LABEL_27;
      case 3u:
        v22 = objc_alloc_init(MSPPinStorage);
        v23 = 32;
        goto LABEL_27;
      case 4u:
        v22 = objc_alloc_init(MSPHistoryEntryStorage);
        v23 = 40;
LABEL_27:
        objc_storeStrong((id *)(a1 + v23), v22);
        if (PBReaderPlaceMark() && -[MSPBookmarkStorage readFrom:](v22, "readFrom:", a2, 0, 0))
        {
          PBReaderRecallMark();

LABEL_41:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 5u:
        v24 = 0;
        v25 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + 56) |= 1u;
        while (2)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
            *(_QWORD *)(a2 + v27) = v28 + 1;
            v26 |= (unint64_t)(v29 & 0x7F) << v24;
            if (v29 < 0)
            {
              v24 += 7;
              v14 = v25++ >= 9;
              if (v14)
              {
                LODWORD(v26) = 0;
                goto LABEL_40;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v26) = 0;
LABEL_40:
        *(_DWORD *)(a1 + 24) = v26;
        goto LABEL_41;
      default:
        if (!*(_QWORD *)(a1 + 8))
        {
          v19 = objc_alloc_init(MEMORY[0x1E0D82BB0]);
          v20 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v19;

        }
        result = PBUnknownFieldAdd();
        if (!(_DWORD)result)
          return result;
        goto LABEL_41;
    }
  }
}

uint64_t MSPDirectionsSearchReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  id v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  id v24;
  void *v25;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 28) |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_35;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            v20 = 0;
            goto LABEL_37;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_35:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_37:
        *(_BYTE *)(a1 + 24) = v20 != 0;
      }
      else if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(MEMORY[0x1E0D27590]);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark() || (objc_msgSend(v17, "readFrom:", a2, 0, 0) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        if (!*(_QWORD *)(a1 + 8))
        {
          v24 = objc_alloc_init(MEMORY[0x1E0D82BB0]);
          v25 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v24;

        }
        result = PBUnknownFieldAdd();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t MSPPinStorageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t result;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  MSPDroppedPin *v35;
  uint64_t v36;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(void **)(a1 + 40);
        *(_QWORD *)(a1 + 40) = v18;

        goto LABEL_49;
      case 2u:
        *(_BYTE *)(a1 + 52) |= 1u;
        v23 = *v3;
        v24 = *(_QWORD *)(a2 + v23);
        if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v25 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v25 = 0;
        }
        v36 = 16;
        goto LABEL_48;
      case 3u:
        *(_BYTE *)(a1 + 52) |= 2u;
        v26 = *v3;
        v27 = *(_QWORD *)(a2 + v26);
        if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v25 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v27);
          *(_QWORD *)(a2 + v26) = v27 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v25 = 0;
        }
        v36 = 24;
LABEL_48:
        *(_QWORD *)(a1 + v36) = v25;
        goto LABEL_49;
      case 4u:
        v28 = 0;
        v29 = 0;
        v30 = 0;
        *(_BYTE *)(a1 + 52) |= 4u;
        while (2)
        {
          v31 = *v3;
          v32 = *(_QWORD *)(a2 + v31);
          v33 = v32 + 1;
          if (v32 == -1 || v33 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v32);
            *(_QWORD *)(a2 + v31) = v33;
            v30 |= (unint64_t)(v34 & 0x7F) << v28;
            if (v34 < 0)
            {
              v28 += 7;
              v15 = v29++ >= 9;
              if (v15)
              {
                LODWORD(v30) = 0;
                goto LABEL_43;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v30) = 0;
LABEL_43:
        *(_DWORD *)(a1 + 48) = v30;
        goto LABEL_49;
      case 5u:
        v35 = objc_alloc_init(MSPDroppedPin);
        objc_storeStrong((id *)(a1 + 32), v35);
        if (PBReaderPlaceMark() && (MSPDroppedPinReadFrom((uint64_t)v35, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_49:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        if (!*(_QWORD *)(a1 + 8))
        {
          v20 = objc_alloc_init(MEMORY[0x1E0D82BB0]);
          v21 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v20;

        }
        result = PBUnknownFieldAdd();
        if (!(_DWORD)result)
          return result;
        goto LABEL_49;
    }
  }
}

void sub_1B39F7DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

BOOL MSPPinnedPlaceContactStorageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v17 == 2)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 32;
        goto LABEL_24;
      }
      if ((_DWORD)v17 == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 16;
LABEL_24:
        v20 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_28;
      }
      if (!*(_QWORD *)(a1 + 8))
      {
        v21 = objc_alloc_init(MEMORY[0x1E0D82BB0]);
        v22 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v21;

      }
      if ((PBUnknownFieldAdd() & 1) == 0)
        return 0;
LABEL_28:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = 24;
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id MSPHistoryEntryMakeFromStorage(uint64_t a1)
{
  void *v1;
  void *v2;

  +[MSPMutableHistoryEntry mutableHistoryEntryForStorage:](MSPMutableHistoryEntry, "mutableHistoryEntryForStorage:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "transferToImmutableIfValidWithError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id MSPSerializedRepresentationForHistoryEntriesArray(void *a1, uint64_t a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "storage", (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  MSPPropertyListFromHistoryEntryStorageArray(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v12, 200, 0, a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id MSPHistoryEntriesArrayMakeFromSerializedRepresentation(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a1, 0, 0, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
      v14 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
LABEL_16:
    v14 = 0;
    goto LABEL_21;
  }
  MSPHistoryEntryStorageArrayFromPropertyList(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          MSPHistoryEntryMakeFromStorage(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v7, "addObject:", v13, (_QWORD)v16);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    v14 = (void *)objc_msgSend(v7, "copy");
  }
  else if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v14 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

LABEL_21:
  return v14;
}

void sub_1B39FBBDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  _Block_object_dispose(&a44, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

uint64_t MSPTransitLineBookmarkReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  MSPTransitStorageLine *v17;
  id v18;
  void *v19;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(MSPTransitStorageLine);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark() || (MSPTransitStorageLineReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        if (!*(_QWORD *)(a1 + 8))
        {
          v18 = objc_alloc_init(MEMORY[0x1E0D82BB0]);
          v19 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v18;

        }
        result = PBUnknownFieldAdd();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id MSPGetSharedTripIDSTransportLog()
{
  if (MSPGetSharedTripIDSTransportLog_onceToken != -1)
    dispatch_once(&MSPGetSharedTripIDSTransportLog_onceToken, &__block_literal_global_3);
  return (id)MSPGetSharedTripIDSTransportLog_log;
}

id MSPGetSharedTripNavEventsLog()
{
  if (MSPGetSharedTripNavEventsLog_onceToken != -1)
    dispatch_once(&MSPGetSharedTripNavEventsLog_onceToken, &__block_literal_global_5);
  return (id)MSPGetSharedTripNavEventsLog_log;
}

id MSPGetSharedTripStorageLog()
{
  if (MSPGetSharedTripStorageLog_onceToken != -1)
    dispatch_once(&MSPGetSharedTripStorageLog_onceToken, &__block_literal_global_7_0);
  return (id)MSPGetSharedTripStorageLog_log;
}

void sub_1B39FFEBC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3A002F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3A00390(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3A00548(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3A006F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3A00AF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1B3A00DD8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3A00F9C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3A0123C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,char a23)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_1B3A0141C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3A01538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1B3A01818(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B3A01A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 64), 8);
  _Unwind_Resume(a1);
}

id MapsMap(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, _QWORD, uint64_t);
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (v3)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v6);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), v9 + v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v5, "addObject:", v12, (_QWORD)v15);

          ++v11;
        }
        while (v8 != v11);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v9 += v11;
      }
      while (v8);
    }

    v13 = (void *)objc_msgSend(v5, "copy");
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

uint64_t MSPPinReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  MSPDroppedPin *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          LODWORD(v10) = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v10) = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 & 0x7FFF8) == 8)
      {
        v17 = objc_alloc_init(MSPDroppedPin);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (MSPDroppedPinReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t MSPRouteBookmarkReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  id v17;
  id v18;
  void *v19;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(MEMORY[0x1E0D27590]);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark() || (objc_msgSend(v17, "readFrom:", a2, 0, 0) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        if (!*(_QWORD *)(a1 + 8))
        {
          v18 = objc_alloc_init(MEMORY[0x1E0D82BB0]);
          v19 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v18;

        }
        result = PBUnknownFieldAdd();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL MSPQuerySearchReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 40;
        goto LABEL_26;
      case 2u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 24;
        goto LABEL_26;
      case 3u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
LABEL_26:
        v21 = *(id *)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;
        goto LABEL_30;
      case 4u:
        v21 = objc_alloc_init(MEMORY[0x1E0D27208]);
        objc_storeStrong((id *)(a1 + 32), v21);
        if (PBReaderPlaceMark() && (objc_msgSend(v21, "readFrom:", a2, 0, 0) & 1) != 0)
        {
          PBReaderRecallMark();
LABEL_30:

LABEL_31:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        if (!*(_QWORD *)(a1 + 8))
        {
          v19 = objc_alloc_init(MEMORY[0x1E0D82BB0]);
          v20 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v19;

        }
        if ((PBUnknownFieldAdd() & 1) == 0)
          return 0;
        goto LABEL_31;
    }
  }
}

uint64_t MSPHistoryEntryStorageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  id v32;
  void *v33;
  uint64_t result;
  MSPQuerySearch *v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  uint64_t v43;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 92) |= 4u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          v23 = v22 + 1;
          if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0)
            goto LABEL_60;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_62;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_60:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_62:
        *(_DWORD *)(a1 + 72) = v20;
        goto LABEL_72;
      case 2u:
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 40);
        *(_QWORD *)(a1 + 40) = v25;

        goto LABEL_72;
      case 3u:
        *(_BYTE *)(a1 + 92) |= 2u;
        v27 = *v3;
        v28 = *(_QWORD *)(a2 + v27);
        if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v28);
          *(_QWORD *)(a2 + v27) = v28 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v29 = 0;
        }
        v43 = 24;
        goto LABEL_71;
      case 4u:
        *(_BYTE *)(a1 + 92) |= 1u;
        v30 = *v3;
        v31 = *(_QWORD *)(a2 + v30);
        if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v31);
          *(_QWORD *)(a2 + v30) = v31 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v29 = 0;
        }
        v43 = 16;
LABEL_71:
        *(_QWORD *)(a1 + v43) = v29;
        goto LABEL_72;
      case 6u:
        v35 = objc_alloc_init(MSPQuerySearch);
        objc_storeStrong((id *)(a1 + 56), v35);
        if (!PBReaderPlaceMark() || !MSPQuerySearchReadFrom((uint64_t)v35, a2))
          goto LABEL_74;
        goto LABEL_51;
      case 7u:
        v35 = objc_alloc_init(MSPDirectionsSearch);
        objc_storeStrong((id *)(a1 + 32), v35);
        if (!PBReaderPlaceMark() || (MSPDirectionsSearchReadFrom((uint64_t)v35, a2) & 1) == 0)
          goto LABEL_74;
        goto LABEL_51;
      case 8u:
        v35 = objc_alloc_init(MSPPlaceDisplay);
        objc_storeStrong((id *)(a1 + 48), v35);
        if (!PBReaderPlaceMark() || !MSPPlaceDisplayReadFrom((uint64_t)v35, a2))
          goto LABEL_74;
        goto LABEL_51;
      case 9u:
        v35 = objc_alloc_init(MSPTransitStorageLineItem);
        objc_storeStrong((id *)(a1 + 80), v35);
        if (!PBReaderPlaceMark() || !-[MSPQuerySearch readFrom:](v35, "readFrom:", a2, 0, 0))
          goto LABEL_74;
        goto LABEL_51;
      case 0xAu:
        v35 = objc_alloc_init(MSPRidesharingTrip);
        objc_storeStrong((id *)(a1 + 64), v35);
        if (PBReaderPlaceMark() && MSPRidesharingTripReadFrom((uint64_t)v35, a2))
        {
LABEL_51:
          PBReaderRecallMark();

LABEL_72:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_74:

        return 0;
      case 0xBu:
        v36 = 0;
        v37 = 0;
        v38 = 0;
        *(_BYTE *)(a1 + 92) |= 8u;
        while (2)
        {
          v39 = *v3;
          v40 = *(_QWORD *)(a2 + v39);
          v41 = v40 + 1;
          if (v40 == -1 || v41 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v42 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v40);
            *(_QWORD *)(a2 + v39) = v41;
            v38 |= (unint64_t)(v42 & 0x7F) << v36;
            if (v42 < 0)
            {
              v36 += 7;
              v15 = v37++ >= 9;
              if (v15)
              {
                v38 = 0;
                goto LABEL_66;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v38 = 0;
LABEL_66:
        *(_BYTE *)(a1 + 88) = v38 != 0;
        goto LABEL_72;
      default:
        if (!*(_QWORD *)(a1 + 8))
        {
          v32 = objc_alloc_init(MEMORY[0x1E0D82BB0]);
          v33 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v32;

        }
        result = PBUnknownFieldAdd();
        if (!(_DWORD)result)
          return result;
        goto LABEL_72;
    }
  }
}

MSPAuthFeedbackReportTicket *MSPWalletRAPAuthenticatedFeedbackTicket(void *a1, uint64_t a2)
{
  id v3;
  MSPAuthFeedbackReportTicket *v4;
  void *v5;
  MSPAuthFeedbackReportTicket *v6;
  NSObject *v7;
  _QWORD v9[5];
  uint8_t buf[16];

  v3 = a1;
  if (a2)
  {
    v4 = [MSPAuthFeedbackReportTicket alloc];
    objc_msgSend(v3, "requestParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MSPBaseFeedbackReportTicket initWithFeedbackRequestParameters:traits:userInfoType:](v4, "initWithFeedbackRequestParameters:traits:userInfoType:", v5, 0, a2);

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __MSPWalletRAPAuthenticatedFeedbackTicket_block_invoke;
    v9[3] = &__block_descriptor_40_e30_v16__0__GEORPFeedbackRequest_8l;
    v9[4] = a2;
    -[MSPBaseFeedbackReportTicket setWillSubmitRequestBlock:](v6, "setWillSubmitRequestBlock:", v9);
  }
  else
  {
    if (qword_1ED328440 != -1)
      dispatch_once(&qword_1ED328440, &__block_literal_global_11);
    v7 = _MergedGlobals_43;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_43, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B39C0000, v7, OS_LOG_TYPE_ERROR, "userInfoType can't be None", buf, 2u);
    }
    v6 = 0;
  }

  return v6;
}

MSPUnauthFeedbackReportTicket *MSPWalletRAPUnauthenticatedFeedbackTicket(void *a1, uint64_t a2)
{
  id v3;
  MSPUnauthFeedbackReportTicket *v4;
  void *v5;
  MSPUnauthFeedbackReportTicket *v6;
  _QWORD v8[5];

  v3 = a1;
  v4 = [MSPUnauthFeedbackReportTicket alloc];
  objc_msgSend(v3, "requestParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[MSPBaseFeedbackReportTicket initWithFeedbackRequestParameters:traits:userInfoType:](v4, "initWithFeedbackRequestParameters:traits:userInfoType:", v5, 0, a2);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __MSPWalletRAPUnauthenticatedFeedbackTicket_block_invoke;
  v8[3] = &__block_descriptor_40_e30_v16__0__GEORPFeedbackRequest_8l;
  v8[4] = a2;
  -[MSPBaseFeedbackReportTicket setWillSubmitRequestBlock:](v6, "setWillSubmitRequestBlock:", v8);
  return v6;
}

id MSPGetSharedTripCapabilityFetcherLog()
{
  if (qword_1ED328460 != -1)
    dispatch_once(&qword_1ED328460, &__block_literal_global_174);
  return (id)qword_1ED328458;
}

void sub_1B3A073D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_1B3A09854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3A09A00(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3A09C44(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3A0A1F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1B3A0A644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1B3A0ADA0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class __getSYServiceClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!qword_1ED328470)
  {
    qword_1ED328470 = _sl_dlopen();
    if (!qword_1ED328470)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SYService");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  _MergedGlobals_45 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getNRPairedDeviceRegistryClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!qword_1ED328480)
  {
    qword_1ED328480 = _sl_dlopen();
    if (!qword_1ED328480)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("NRPairedDeviceRegistry");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  qword_1ED328478 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id MSPPropertyListFromBookmarkStorageArray(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "arrayByApplyingSelector:", sel_data);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = CFSTR("MSPBookmarks");
  v5[1] = CFSTR("MSPBookmarksVersion");
  v6[0] = v1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", MSPBookmarksVersion_Fall2014toFall2016);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id MSPBookmarkStorageArrayFromPropertyList(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  MSPBookmarkStorage *v20;
  MSPBookmarkStorage *v21;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("MSPBookmarksVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", MSPBookmarksVersion_Fall2014toFall2016);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  v7 = 0;
  if (v6)
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("MSPBookmarks"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    if (v10)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v12 = v10;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v26;
        v23 = v10;
        v24 = v4;
        while (2)
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v26 != v15)
              objc_enumerationMutation(v12);
            v17 = *(id *)(*((_QWORD *)&v25 + 1) + 8 * v16);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v18 = v17;
            else
              v18 = 0;
            v19 = v18;

            if (!v19)
              goto LABEL_24;
            v20 = -[MSPBookmarkStorage initWithData:]([MSPBookmarkStorage alloc], "initWithData:", v19);
            if (!v20)
            {

LABEL_24:
              v7 = 0;
              v10 = v23;
              v4 = v24;
              goto LABEL_25;
            }
            v21 = v20;
            objc_msgSend(v11, "addObject:", v20);

            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          v10 = v23;
          v4 = v24;
          if (v14)
            continue;
          break;
        }
      }

      v7 = v11;
LABEL_25:

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

id MSPPropertyListFromHistoryEntryStorageArray(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "arrayByApplyingSelector:", sel_data);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = CFSTR("MSPHistory");
  v5[1] = CFSTR("MSPHistoryVersion");
  v6[0] = v1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", MSPHistoryVersion_Fall2014toFall2016);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id MSPHistoryEntryStorageArrayFromPropertyList(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  MSPHistoryEntryStorage *v20;
  MSPHistoryEntryStorage *v21;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("MSPHistoryVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", MSPHistoryVersion_Fall2014toFall2016);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  v7 = 0;
  if (v6)
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("MSPHistory"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    if (v10)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v12 = v10;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v26;
        v23 = v10;
        v24 = v4;
        while (2)
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v26 != v15)
              objc_enumerationMutation(v12);
            v17 = *(id *)(*((_QWORD *)&v25 + 1) + 8 * v16);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v18 = v17;
            else
              v18 = 0;
            v19 = v18;

            if (!v19)
              goto LABEL_24;
            v20 = -[MSPHistoryEntryStorage initWithData:]([MSPHistoryEntryStorage alloc], "initWithData:", v19);
            if (!v20)
            {

LABEL_24:
              v7 = 0;
              v10 = v23;
              v4 = v24;
              goto LABEL_25;
            }
            v21 = v20;
            objc_msgSend(v11, "addObject:", v20);

            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          v10 = v23;
          v4 = v24;
          if (v14)
            continue;
          break;
        }
      }

      v7 = v11;
LABEL_25:

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

uint64_t MSPSharingRestorationStorageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  BOOL v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t result;
  uint64_t v25;
  void *v26;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (2)
    {
      if (!*(_BYTE *)(a2 + *v5))
      {
        v8 = 0;
        v9 = 0;
        v10 = 0;
        while (1)
        {
          v11 = *v3;
          v12 = *(_QWORD *)(a2 + v11);
          v13 = v12 + 1;
          if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
            break;
          v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
          *(_QWORD *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0)
            goto LABEL_12;
          v8 += 7;
          if (v9++ >= 9)
          {
            v10 = 0;
            v16 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
        v16 = *(unsigned __int8 *)(a2 + *v5);
        if (*(_BYTE *)(a2 + *v5))
          v10 = 0;
LABEL_14:
        if (v16)
          v17 = 1;
        else
          v17 = (v10 & 7) == 4;
        if (!v17)
        {
          switch((v10 >> 3))
          {
            case 1u:
              *(_BYTE *)(a1 + 48) |= 1u;
              v18 = *v3;
              v19 = *(_QWORD *)(a2 + v18);
              if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(_QWORD *)(a2 + *v4))
              {
                v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v19);
                *(_QWORD *)(a2 + v18) = v19 + 8;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v20 = 0;
              }
              *(_QWORD *)(a1 + 16) = v20;
              goto LABEL_34;
            case 2u:
              PBReaderReadString();
              v25 = objc_claimAutoreleasedReturnValue();
              v26 = *(void **)(a1 + 24);
              *(_QWORD *)(a1 + 24) = v25;

              goto LABEL_34;
            case 3u:
              PBReaderReadString();
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
                objc_msgSend((id)a1, "addMapsIdentifier:", v21);
              goto LABEL_26;
            case 4u:
              PBReaderReadString();
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
                objc_msgSend((id)a1, "addMessagesIdentifier:", v21);
LABEL_26:

              goto LABEL_34;
            default:
              if (!*(_QWORD *)(a1 + 8))
              {
                v22 = objc_alloc_init(MEMORY[0x1E0D82BB0]);
                v23 = *(void **)(a1 + 8);
                *(_QWORD *)(a1 + 8) = v22;

              }
              result = PBUnknownFieldAdd();
              if (!(_DWORD)result)
                return result;
LABEL_34:
              if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
                return *(_BYTE *)(a2 + *v5) == 0;
              continue;
          }
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL MSPCollectionStorageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 48;
          goto LABEL_24;
        case 2u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_24;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_24;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_24;
        case 5u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
LABEL_24:
          v19 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          goto LABEL_25;
        default:
          if (!*(_QWORD *)(a1 + 8))
          {
            v20 = objc_alloc_init(MEMORY[0x1E0D82BB0]);
            v21 = *(void **)(a1 + 8);
            *(_QWORD *)(a1 + 8) = v20;

          }
          if ((PBUnknownFieldAdd() & 1) == 0)
            return 0;
LABEL_25:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          break;
      }
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1B3A0D624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_1B3A0DED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3A0E580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
  _Block_object_dispose(&a48, 8);
  _Block_object_dispose(&a52, 8);
  _Block_object_dispose(&a58, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

uint64_t MSPTransitStorageLineReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  id v23;
  void *v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  MSPTransitStorageArtwork *v29;
  uint64_t v30;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 88) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_49;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_51;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_49:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_51:
        *(_QWORD *)(a1 + 16) = v19;
        goto LABEL_46;
      case 2u:
        PBReaderReadString();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = 72;
        goto LABEL_32;
      case 3u:
        PBReaderReadString();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = 48;
LABEL_32:
        v28 = *(void **)(a1 + v27);
        *(_QWORD *)(a1 + v27) = v26;

        goto LABEL_46;
      case 4u:
        v29 = objc_alloc_init(MSPTransitStorageArtwork);
        v30 = 32;
        goto LABEL_43;
      case 5u:
        v29 = objc_alloc_init(MSPTransitStorageArtwork);
        v30 = 64;
        goto LABEL_43;
      case 6u:
        v29 = objc_alloc_init(MSPTransitStorageSystem);
        objc_storeStrong((id *)(a1 + 80), v29);
        if (!PBReaderPlaceMark() || (MSPTransitStorageSystemReadFrom((uint64_t)v29, a2) & 1) == 0)
          goto LABEL_53;
        goto LABEL_45;
      case 7u:
        v29 = objc_alloc_init(MSPTransitStorageArtwork);
        v30 = 24;
        goto LABEL_43;
      case 8u:
        v29 = (MSPTransitStorageArtwork *)objc_alloc_init(MEMORY[0x1E0D27140]);
        objc_storeStrong((id *)(a1 + 56), v29);
        if (!PBReaderPlaceMark()
          || !-[MSPTransitStorageArtwork readFrom:](v29, "readFrom:", a2, 0, 0))
        {
          goto LABEL_53;
        }
        goto LABEL_45;
      case 9u:
        v29 = objc_alloc_init(MSPTransitStorageArtwork);
        v30 = 40;
LABEL_43:
        objc_storeStrong((id *)(a1 + v30), v29);
        if (PBReaderPlaceMark() && (MSPTransitStorageArtworkReadFrom((uint64_t)v29, a2) & 1) != 0)
        {
LABEL_45:
          PBReaderRecallMark();

LABEL_46:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_53:

        return 0;
      default:
        if (!*(_QWORD *)(a1 + 8))
        {
          v23 = objc_alloc_init(MEMORY[0x1E0D82BB0]);
          v24 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v23;

        }
        result = PBUnknownFieldAdd();
        if (!(_DWORD)result)
          return result;
        goto LABEL_46;
    }
  }
}

void _MSPLogForContainer(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  objc_class *v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = a1;
  if ((_MSPShouldLog & 1) == 0)
  {
    v11 = (objc_class *)MEMORY[0x1E0CB3940];
    v12 = a2;
    v13 = (void *)objc_msgSend([v11 alloc], "initWithFormat:arguments:", v12, &a9);

    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218499;
      v17 = v10;
      v18 = 2113;
      v19 = (id)objc_opt_class();
      v20 = 2113;
      v21 = v13;
      v15 = v19;
      _os_log_impl(&dword_1B39C0000, v14, OS_LOG_TYPE_DEBUG, "MSPContainer: [%p (%{private}@)] -- %{private}@", buf, 0x20u);

    }
  }

}

void sub_1B3A10B10(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1B3A10CD0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B3A110A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3A11C38(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B3A122BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3A125C8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 152));
  _Unwind_Resume(a1);
}

void sub_1B3A12AA8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B3A12DF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3A136D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a65;
  id *v65;
  id *v66;

  objc_destroyWeak(v65);
  objc_destroyWeak(v66);
  _Block_object_dispose(&a65, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_1B3A13EC8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3A13F34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3A14120(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3A141FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3A1428C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3A145DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B3A14884(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t MSPPlaceBookmarkReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t result;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  void *v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = objc_alloc_init(MEMORY[0x1E0D271E8]);
        v18 = 32;
        goto LABEL_33;
      case 2u:
        v22 = 0;
        v23 = 0;
        v24 = 0;
        *(_BYTE *)(a1 + 56) |= 2u;
        while (2)
        {
          v25 = *v3;
          v26 = *(_QWORD *)(a2 + v25);
          if (v26 == -1 || v26 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v26);
            *(_QWORD *)(a2 + v25) = v26 + 1;
            v24 |= (unint64_t)(v27 & 0x7F) << v22;
            if (v27 < 0)
            {
              v22 += 7;
              v14 = v23++ >= 9;
              if (v14)
              {
                LODWORD(v24) = 0;
                goto LABEL_46;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v24) = 0;
LABEL_46:
        v35 = 40;
        goto LABEL_51;
      case 3u:
        PBReaderReadString();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = *(void **)(a1 + 48);
        *(_QWORD *)(a1 + 48) = v28;

        goto LABEL_52;
      case 4u:
        v17 = objc_alloc_init(MEMORY[0x1E0D27140]);
        v18 = 16;
LABEL_33:
        objc_storeStrong((id *)(a1 + v18), v17);
        if (PBReaderPlaceMark() && (objc_msgSend(v17, "readFrom:", a2, 0, 0) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_52:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 5u:
        v30 = 0;
        v31 = 0;
        v24 = 0;
        *(_BYTE *)(a1 + 56) |= 1u;
        while (2)
        {
          v32 = *v3;
          v33 = *(_QWORD *)(a2 + v32);
          if (v33 == -1 || v33 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
            *(_QWORD *)(a2 + v32) = v33 + 1;
            v24 |= (unint64_t)(v34 & 0x7F) << v30;
            if (v34 < 0)
            {
              v30 += 7;
              v14 = v31++ >= 9;
              if (v14)
              {
                LODWORD(v24) = 0;
                goto LABEL_50;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v24) = 0;
LABEL_50:
        v35 = 24;
LABEL_51:
        *(_DWORD *)(a1 + v35) = v24;
        goto LABEL_52;
      default:
        if (!*(_QWORD *)(a1 + 8))
        {
          v19 = objc_alloc_init(MEMORY[0x1E0D82BB0]);
          v20 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v19;

        }
        result = PBUnknownFieldAdd();
        if (!(_DWORD)result)
          return result;
        goto LABEL_52;
    }
  }
}

void sub_1B3A1764C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL MSPSharedTripSharingAvailable()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  void *v5;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v0 = _MSPSharedTripCurrentFeatureAvailability();
  v1 = v0 & 0x10101010101;
  v2 = v0 & 0xFFFFFFFFFFFFFFLL;
  if (!_MSPSharedTripFeatureAvailabilityEqual(MSPSharedTripSharingAvailable_lastLoggedAvailability | ((unint64_t)((unsigned __int16)word_1ED3282A4 | (byte_1ED3282A6 << 16)) << 32), v0 & 0xFFFFFFFFFFFFFFLL))
  {
    MSPSharedTripSharingAvailable_lastLoggedAvailability = v2;
    LOBYTE(word_1ED3282A4) = BYTE4(v2);
    HIBYTE(word_1ED3282A4) = BYTE5(v2);
    byte_1ED3282A6 = BYTE6(v2);
    MSPGetSharedTripLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      if (v1 == 0x10101010101)
        v4 = "Available";
      else
        v4 = "Not Available";
      _MSPSharedTripFeatureAvailabilityToString(v2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 136315394;
      v8 = v4;
      v9 = 2114;
      v10 = v5;
      _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_INFO, "Trip Sharing is %s: %{public}@", (uint8_t *)&v7, 0x16u);

    }
  }
  return v1 == 0x10101010101;
}

uint64_t MSPSharedTripUserEnabled()
{
  return GEOConfigGetBOOL();
}

uint64_t MSPSharedTripNetworkEnabled()
{
  return GEOConfigGetBOOL();
}

uint64_t MSPSharedTripSharingSupportedForTransportType(uint64_t a1)
{
  unint64_t UInteger;
  uint64_t result;

  UInteger = GEOConfigGetUInteger();
  result = 0;
  switch(a1)
  {
    case 1:
      result = UInteger & 1;
      break;
    case 2:
      result = (UInteger >> 1) & 1;
      break;
    case 3:
      result = (UInteger >> 3) & 1;
      break;
    case 5:
      result = (UInteger >> 2) & 1;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t MSPSharedTripReceiverDetailViewSupportedForTransportType(uint64_t a1)
{
  unint64_t UInteger;
  uint64_t result;

  UInteger = GEOConfigGetUInteger();
  result = 0;
  switch(a1)
  {
    case 1:
      result = UInteger & 1;
      break;
    case 2:
      result = (UInteger >> 1) & 1;
      break;
    case 3:
      result = (UInteger >> 3) & 1;
      break;
    case 5:
      result = (UInteger >> 2) & 1;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t MSPTransitStorageIncidentEntityReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t result;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  id v31;
  void *v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      v16 = v10 & 7;
      if (v15 || v16 == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        if (v16 == 2)
        {
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
          {
            v25 = 0;
            v26 = 0;
            v27 = 0;
            while (1)
            {
              v28 = *v3;
              v29 = *(_QWORD *)(a2 + v28);
              if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
                break;
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v29 + 1;
              v27 |= (unint64_t)(v30 & 0x7F) << v25;
              if (v30 < 0)
              {
                v25 += 7;
                v14 = v26++ >= 9;
                if (!v14)
                  continue;
              }
              goto LABEL_39;
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
            PBRepeatedUInt64Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          v33 = 0;
          v34 = 0;
          v35 = 0;
          while (1)
          {
            v36 = *v3;
            v37 = *(_QWORD *)(a2 + v36);
            if (v37 == -1 || v37 >= *(_QWORD *)(a2 + *v4))
              break;
            v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v37);
            *(_QWORD *)(a2 + v36) = v37 + 1;
            v35 |= (unint64_t)(v38 & 0x7F) << v33;
            if (v38 < 0)
            {
              v33 += 7;
              v14 = v34++ >= 9;
              if (!v14)
                continue;
            }
            goto LABEL_57;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_57:
          PBRepeatedUInt64Add();
        }
      }
      else if ((v10 >> 3) == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 48) |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_45;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            v20 = 0;
            goto LABEL_47;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_45:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_47:
        *(_QWORD *)(a1 + 40) = v20;
      }
      else
      {
        if (!*(_QWORD *)(a1 + 8))
        {
          v31 = objc_alloc_init(MEMORY[0x1E0D82BB0]);
          v32 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v31;

        }
        if ((PBUnknownFieldAdd() & 1) == 0)
          return 0;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id MSPGetMSPAuthFeedbackReportTicketLog()
{
  if (qword_1ED328490 != -1)
    dispatch_once(&qword_1ED328490, &__block_literal_global_15);
  return (id)_MergedGlobals_46;
}

BOOL MSPRegionBookmarkReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(MEMORY[0x1E0D27208]);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark() || (objc_msgSend(v17, "readFrom:", a2, 0, 0) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if (!*(_QWORD *)(a1 + 8))
      {
        v19 = objc_alloc_init(MEMORY[0x1E0D82BB0]);
        v20 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v19;

      }
      if ((PBUnknownFieldAdd() & 1) == 0)
        return 0;
LABEL_28:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v18 = objc_claimAutoreleasedReturnValue();
    v17 = *(id *)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v18;
LABEL_24:

    goto LABEL_28;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id MSPBundle()
{
  if (qword_1ED3284A0 != -1)
    dispatch_once(&qword_1ED3284A0, &__block_literal_global_16);
  return (id)_MergedGlobals_47;
}

uint64_t MSPBookmarkStorageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  id v25;
  void *v26;
  uint64_t result;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  MSPPlaceBookmark *v35;
  uint64_t v36;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 76) |= 4u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          v23 = v22 + 1;
          if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0)
            goto LABEL_50;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_52;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_50:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_52:
        *(_DWORD *)(a1 + 72) = v20;
        goto LABEL_58;
      case 2u:
        PBReaderReadString();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = *(void **)(a1 + 32);
        *(_QWORD *)(a1 + 32) = v28;

        goto LABEL_58;
      case 3u:
        *(_BYTE *)(a1 + 76) |= 1u;
        v30 = *v3;
        v31 = *(_QWORD *)(a2 + v30);
        if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v32 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v31);
          *(_QWORD *)(a2 + v30) = v31 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v32 = 0;
        }
        v36 = 16;
        goto LABEL_57;
      case 4u:
        *(_BYTE *)(a1 + 76) |= 2u;
        v33 = *v3;
        v34 = *(_QWORD *)(a2 + v33);
        if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v32 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v34);
          *(_QWORD *)(a2 + v33) = v34 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v32 = 0;
        }
        v36 = 24;
LABEL_57:
        *(_QWORD *)(a1 + v36) = v32;
        goto LABEL_58;
      case 5u:
        v35 = objc_alloc_init(MSPPlaceBookmark);
        objc_storeStrong((id *)(a1 + 40), v35);
        if (!PBReaderPlaceMark() || (MSPPlaceBookmarkReadFrom((uint64_t)v35, a2) & 1) == 0)
          goto LABEL_60;
        goto LABEL_48;
      case 6u:
        v35 = objc_alloc_init(MSPRouteBookmark);
        objc_storeStrong((id *)(a1 + 56), v35);
        if (!PBReaderPlaceMark() || (MSPRouteBookmarkReadFrom((uint64_t)v35, a2) & 1) == 0)
          goto LABEL_60;
        goto LABEL_48;
      case 7u:
        v35 = objc_alloc_init(MSPRegionBookmark);
        objc_storeStrong((id *)(a1 + 48), v35);
        if (!PBReaderPlaceMark() || !MSPRegionBookmarkReadFrom((uint64_t)v35, a2))
          goto LABEL_60;
        goto LABEL_48;
      case 8u:
        v35 = objc_alloc_init(MSPTransitLineBookmark);
        objc_storeStrong((id *)(a1 + 64), v35);
        if (PBReaderPlaceMark() && (MSPTransitLineBookmarkReadFrom((uint64_t)v35, a2) & 1) != 0)
        {
LABEL_48:
          PBReaderRecallMark();

LABEL_58:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_60:

        return 0;
      default:
        if (!*(_QWORD *)(a1 + 8))
        {
          v25 = objc_alloc_init(MEMORY[0x1E0D82BB0]);
          v26 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v25;

        }
        result = PBUnknownFieldAdd();
        if (!(_DWORD)result)
          return result;
        goto LABEL_58;
    }
  }
}

void sub_1B3A20614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_1B3A20FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MSPGetMSPFeedbackSubmissionTicketLog()
{
  if (qword_1ED3284B0 != -1)
    dispatch_once(&qword_1ED3284B0, &__block_literal_global_17);
  return (id)_MergedGlobals_48;
}

uint64_t MSPGroupSessionStorageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t result;
  id v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 32;
        goto LABEL_40;
      case 2u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 64;
        goto LABEL_40;
      case 3u:
        v23 = objc_alloc_init(MEMORY[0x1E0D27540]);
        objc_storeStrong((id *)(a1 + 96), v23);
        if (PBReaderPlaceMark() && (objc_msgSend(v23, "readFrom:", a2, 0, 0) & 1) != 0)
        {
          PBReaderRecallMark();
LABEL_43:

LABEL_44:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 4u:
        *(_BYTE *)(a1 + 104) |= 1u;
        v24 = *v3;
        v25 = *(_QWORD *)(a2 + v24);
        if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v26 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v25);
          *(_QWORD *)(a2 + v24) = v25 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v26 = 0;
        }
        *(_QWORD *)(a1 + 16) = v26;
        goto LABEL_44;
      case 5u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 24;
        goto LABEL_40;
      case 6u:
        PBReaderReadString();
        v23 = (id)objc_claimAutoreleasedReturnValue();
        if (v23)
          objc_msgSend((id)a1, "addMinimalStrategyIdentifier:", v23);
        goto LABEL_43;
      case 7u:
        PBReaderReadString();
        v23 = (id)objc_claimAutoreleasedReturnValue();
        if (v23)
          objc_msgSend((id)a1, "addLiveStrategyIdentifier:", v23);
        goto LABEL_43;
      case 8u:
        PBReaderReadString();
        v23 = (id)objc_claimAutoreleasedReturnValue();
        if (v23)
          objc_msgSend((id)a1, "addMessageStrategyIdentifier:", v23);
        goto LABEL_43;
      case 9u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 80;
        goto LABEL_40;
      case 0xAu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 72;
LABEL_40:
        v27 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_44;
      case 0xBu:
        PBReaderReadString();
        v23 = (id)objc_claimAutoreleasedReturnValue();
        if (v23)
          objc_msgSend((id)a1, "addSmsStrategyIdentifier:", v23);
        goto LABEL_43;
      default:
        if (!*(_QWORD *)(a1 + 8))
        {
          v20 = objc_alloc_init(MEMORY[0x1E0D82BB0]);
          v21 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v20;

        }
        result = PBUnknownFieldAdd();
        if (!(_DWORD)result)
          return result;
        goto LABEL_44;
    }
  }
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void sub_1B3A26380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3A27214(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1B3A27A14(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B3A280E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3A28384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3A28A84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3A29444(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3A29944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3A2BFF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B3A2E094(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B3A2E360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3A2E5B8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B3A2E834(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1B3A2EA74(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B3A2EEDC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988C8]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

uint64_t CMFBlockListIsItemBlocked()
{
  return MEMORY[0x1E0D13268]();
}

uint64_t CreateCMFItemFromString()
{
  return MEMORY[0x1E0D132B8]();
}

uint64_t GEOConfigGetBOOL()
{
  return MEMORY[0x1E0D26498]();
}

uint64_t GEOConfigGetDouble()
{
  return MEMORY[0x1E0D264B0]();
}

uint64_t GEOConfigGetUInteger()
{
  return MEMORY[0x1E0D264D0]();
}

uint64_t GEOConfigRemoveBlockListener()
{
  return MEMORY[0x1E0D264F0]();
}

uint64_t GEOConfigSetBOOL()
{
  return MEMORY[0x1E0D26508]();
}

uint64_t GEOFindOrCreateLog()
{
  return MEMORY[0x1E0D265D0]();
}

uint64_t GEOMapItemIsEqualToMapItemForPurpose()
{
  return MEMORY[0x1E0D26658]();
}

uint64_t GEONavigationListenerStateAsString()
{
  return MEMORY[0x1E0D26738]();
}

uint64_t GEOPolylineCoordinateEqual()
{
  return MEMORY[0x1E0D26A20]();
}

uint64_t GEOPolylineCoordinateIsInvalid()
{
  return MEMORY[0x1E0D26A50]();
}

uint64_t GEOPolylineCoordinateIsValid()
{
  return MEMORY[0x1E0D26A58]();
}

uint64_t IDSCopyAddressDestinationForDestination()
{
  return MEMORY[0x1E0D33DC0]();
}

uint64_t IDSCopyBestGuessIDForID()
{
  return MEMORY[0x1E0D33DC8]();
}

uint64_t IDSCopyIDForEmailAddress()
{
  return MEMORY[0x1E0D33DF0]();
}

uint64_t IDSCopyIDForPhoneNumber()
{
  return MEMORY[0x1E0D33DF8]();
}

uint64_t IDSCopyRawAddressForDestination()
{
  return MEMORY[0x1E0D33E28]();
}

uint64_t IDSIDHasToken()
{
  return MEMORY[0x1E0D34058]();
}

uint64_t IMSPISendMessageWithAttachments()
{
  return MEMORY[0x1E0D356D0]();
}

uint64_t MNDisplayETAAndRemainingMinutes()
{
  return MEMORY[0x1E0D518E8]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1E0D82C38]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1E0D82C68]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1E0D82CB8]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1E0D82CC0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

uint64_t PBRepeatedUInt64Add()
{
  return MEMORY[0x1E0D82E80]();
}

uint64_t PBRepeatedUInt64Clear()
{
  return MEMORY[0x1E0D82E88]();
}

uint64_t PBRepeatedUInt64Copy()
{
  return MEMORY[0x1E0D82E90]();
}

uint64_t PBRepeatedUInt64Hash()
{
  return MEMORY[0x1E0D82E98]();
}

uint64_t PBRepeatedUInt64IsEqual()
{
  return MEMORY[0x1E0D82EA0]();
}

uint64_t PBRepeatedUInt64NSArray()
{
  return MEMORY[0x1E0D82EA8]();
}

uint64_t PBRepeatedUInt64Set()
{
  return MEMORY[0x1E0D82EB0]();
}

uint64_t PBUnknownFieldAdd()
{
  return MEMORY[0x1E0D82EB8]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x1E0CD5F60](certificate);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0CD6390](key, algorithm, dataToSign, error);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFPreferencesCopyAppValueWithContainer()
{
  return MEMORY[0x1E0C9A308]();
}

uint64_t _CFPreferencesSetAppValueWithContainer()
{
  return MEMORY[0x1E0C9A378]();
}

uint64_t _CFPreferencesSynchronizeWithContainer()
{
  return MEMORY[0x1E0C9A3A0]();
}

uint64_t _GEOConfigAddBlockListenerForKey()
{
  return MEMORY[0x1E0D277B0]();
}

uint64_t _GEOConfigHasValue()
{
  return MEMORY[0x1E0D277C0]();
}

uint64_t _GEOConfigRemoveValue()
{
  return MEMORY[0x1E0D277D0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C28](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C82E58](queue);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t geo_get_global_queue()
{
  return MEMORY[0x1E0D278F0]();
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

uint64_t tcc_identity_create()
{
  return MEMORY[0x1E0DB1290]();
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1E0C85A08](uu1, uu2);
}

