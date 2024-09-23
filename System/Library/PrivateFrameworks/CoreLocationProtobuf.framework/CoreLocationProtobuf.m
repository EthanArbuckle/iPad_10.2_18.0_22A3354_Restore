BOOL CLPAccessoryMetaReadFrom(uint64_t a1, uint64_t a2)
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
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
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
      v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v18 == 2)
      {
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = 16;
        goto LABEL_24;
      }
      if ((_DWORD)v18 == 1)
      {
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = 8;
LABEL_24:
        v21 = *(void **)(a1 + v20);
        *(_QWORD *)(a1 + v20) = v19;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = 24;
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPAltimeterCollectionRequestReadFrom(uint64_t a1, uint64_t a2)
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
  CLPMeta *v18;
  uint64_t result;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  uint64_t v32;

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
        v18 = objc_alloc_init(CLPMeta);
        objc_storeStrong((id *)(a1 + 56), v18);
        if (PBReaderPlaceMark() && (CLPMetaReadFrom((uint64_t)v18, a2) & 1) != 0)
          goto LABEL_50;
        goto LABEL_62;
      case 2u:
        *(_BYTE *)(a1 + 80) |= 1u;
        v20 = *v3;
        v21 = *(_QWORD *)(a2 + v20);
        if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v22 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v22 = 0;
        }
        v32 = 8;
        goto LABEL_59;
      case 3u:
        *(_BYTE *)(a1 + 80) |= 2u;
        v23 = *v3;
        v24 = *(_QWORD *)(a2 + v23);
        if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v22 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v22 = 0;
        }
        v32 = 16;
LABEL_59:
        *(_QWORD *)(a1 + v32) = v22;
        goto LABEL_60;
      case 4u:
        v25 = 0;
        v26 = 0;
        v27 = 0;
        *(_BYTE *)(a1 + 80) |= 4u;
        while (2)
        {
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          v30 = v29 + 1;
          if (v29 == -1 || v30 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
            *(_QWORD *)(a2 + v28) = v30;
            v27 |= (unint64_t)(v31 & 0x7F) << v25;
            if (v31 < 0)
            {
              v25 += 7;
              v15 = v26++ >= 9;
              if (v15)
              {
                LODWORD(v27) = 0;
                goto LABEL_54;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v27) = 0;
LABEL_54:
        *(_DWORD *)(a1 + 24) = v27;
        goto LABEL_60;
      case 5u:
        v18 = objc_alloc_init(CLPContext);
        objc_storeStrong((id *)(a1 + 32), v18);
        if (!PBReaderPlaceMark() || (CLPContextReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_62;
        goto LABEL_50;
      case 6u:
        v18 = objc_alloc_init(CLPLocation);
        objc_storeStrong((id *)(a1 + 40), v18);
        goto LABEL_48;
      case 7u:
        v18 = objc_alloc_init(CLPIndoorPressure);
        objc_msgSend((id)a1, "addPressure:", v18);
        if (!PBReaderPlaceMark() || (CLPIndoorPressureReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_62;
        goto LABEL_50;
      case 8u:
        v18 = objc_alloc_init(CLPIndoorWifiScan);
        objc_msgSend((id)a1, "addWifiScan:", v18);
        if (!PBReaderPlaceMark() || (CLPIndoorWifiScanReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_62;
        goto LABEL_50;
      case 9u:
        v18 = objc_alloc_init(CLPLocation);
        objc_msgSend((id)a1, "addLocations:", v18);
LABEL_48:
        if (PBReaderPlaceMark() && (CLPLocationReadFrom((uint64_t)v18, a2) & 1) != 0)
        {
LABEL_50:
          PBReaderRecallMark();

LABEL_60:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_62:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_60;
    }
  }
}

uint64_t CLPMetaReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v19;
  uint64_t result;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  void *v28;
  CLPRegulatoryDomainEstimate *v29;

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
        v19 = 24;
        goto LABEL_31;
      case 2u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 40;
        goto LABEL_31;
      case 3u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 48) |= 1u;
        while (2)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          v26 = v25 + 1;
          if (v25 == -1 || v26 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v26;
            v23 |= (unint64_t)(v27 & 0x7F) << v21;
            if (v27 < 0)
            {
              v21 += 7;
              v15 = v22++ >= 9;
              if (v15)
              {
                v23 = 0;
                goto LABEL_38;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_38:
        *(_QWORD *)(a1 + 8) = v23;
        goto LABEL_39;
      case 4u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 16;
LABEL_31:
        v28 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_39;
      case 5u:
        v29 = objc_alloc_init(CLPRegulatoryDomainEstimate);
        objc_msgSend((id)a1, "addRegulatoryDomainEstimates:", v29);
        if (PBReaderPlaceMark() && (CLPRegulatoryDomainEstimateReadFrom((uint64_t)v29, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_39:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_39;
    }
  }
}

uint64_t CLPContextReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t result;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
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
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 28) |= 1u;
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
              goto LABEL_44;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              LODWORD(v20) = 0;
              goto LABEL_46;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_44:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_46:
          v41 = 16;
          goto LABEL_55;
        case 2u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 28) |= 4u;
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
                  v28 = 0;
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v28 = 0;
LABEL_50:
          *(_BYTE *)(a1 + 24) = v28 != 0;
          continue;
        case 3u:
          v33 = 0;
          v34 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 28) |= 2u;
          break;
        case 4u:
          PBReaderReadString();
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v39;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v35 = *v3;
        v36 = *(_QWORD *)(a2 + v35);
        v37 = v36 + 1;
        if (v36 == -1 || v37 > *(_QWORD *)(a2 + *v4))
          break;
        v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
        *(_QWORD *)(a2 + v35) = v37;
        v20 |= (unint64_t)(v38 & 0x7F) << v33;
        if ((v38 & 0x80) == 0)
          goto LABEL_52;
        v33 += 7;
        v15 = v34++ >= 9;
        if (v15)
        {
          LODWORD(v20) = 0;
          goto LABEL_54;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_52:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v20) = 0;
LABEL_54:
      v41 = 20;
LABEL_55:
      *(_DWORD *)(a1 + v41) = v20;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPLocationReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v16;
  int v17;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  int v26;
  uint64_t result;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  char v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  char v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  char v57;
  unsigned int v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char v62;
  char v63;
  unsigned int v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char v68;
  CLPMotionActivity *v69;
  char v70;
  unsigned int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  char v76;
  char v77;
  unsigned int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  unint64_t v88;
  char v89;
  unsigned int v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  char v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  unint64_t v100;
  char v101;
  unsigned int v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  char v107;
  char v108;
  unsigned int v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  char v114;
  uint64_t v115;
  BOOL v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;

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
        v16 = *v5;
        v17 = *(unsigned __int8 *)(a2 + v16);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *v5;
    v17 = *(unsigned __int8 *)(a2 + v16);
    if (*(_BYTE *)(a2 + v16))
      v10 = 0;
LABEL_14:
    if (v17 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v19 = *v3;
        v20 = *(_QWORD *)(a2 + v19);
        if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v21 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v20);
          *(_QWORD *)(a2 + v19) = v20 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + v16) = 1;
          v21 = 0;
        }
        v118 = 8;
        goto LABEL_212;
      case 2u:
        v22 = *v3;
        v23 = *(_QWORD *)(a2 + v22);
        if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v21 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v23 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + v16) = 1;
          v21 = 0;
        }
        v118 = 16;
        goto LABEL_212;
      case 3u:
        v24 = *v3;
        v25 = *(_QWORD *)(a2 + v24);
        if (v25 <= 0xFFFFFFFFFFFFFFFBLL && v25 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v26 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v25);
          *(_QWORD *)(a2 + v24) = v25 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + v16) = 1;
          v26 = 0;
        }
        v119 = 84;
        goto LABEL_223;
      case 5u:
        *(_DWORD *)(a1 + 184) |= 1u;
        v28 = *v3;
        v29 = *(_QWORD *)(a2 + v28);
        if (v29 <= 0xFFFFFFFFFFFFFFFBLL && v29 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v26 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v29);
          *(_QWORD *)(a2 + v28) = v29 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v26 = 0;
        }
        v119 = 32;
        goto LABEL_223;
      case 6u:
        *(_DWORD *)(a1 + 184) |= 0x4000u;
        v30 = *v3;
        v31 = *(_QWORD *)(a2 + v30);
        if (v31 <= 0xFFFFFFFFFFFFFFFBLL && v31 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v26 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v31);
          *(_QWORD *)(a2 + v30) = v31 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v26 = 0;
        }
        v119 = 176;
        goto LABEL_223;
      case 7u:
        *(_DWORD *)(a1 + 184) |= 0x1000u;
        v32 = *v3;
        v33 = *(_QWORD *)(a2 + v32);
        if (v33 <= 0xFFFFFFFFFFFFFFFBLL && v33 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v26 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v33);
          *(_QWORD *)(a2 + v32) = v33 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v26 = 0;
        }
        v119 = 160;
        goto LABEL_223;
      case 8u:
        *(_DWORD *)(a1 + 184) |= 4u;
        v34 = *v3;
        v35 = *(_QWORD *)(a2 + v34);
        if (v35 <= 0xFFFFFFFFFFFFFFFBLL && v35 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v26 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v35);
          *(_QWORD *)(a2 + v34) = v35 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v26 = 0;
        }
        v119 = 60;
        goto LABEL_223;
      case 9u:
        v36 = *v3;
        v37 = *(_QWORD *)(a2 + v36);
        if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v21 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v37);
          *(_QWORD *)(a2 + v36) = v37 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + v16) = 1;
          v21 = 0;
        }
        v118 = 24;
LABEL_212:
        *(_QWORD *)(a1 + v118) = v21;
        goto LABEL_224;
      case 0xAu:
        v38 = 0;
        v39 = 0;
        v40 = 0;
        *(_DWORD *)(a1 + 184) |= 2u;
        while (2)
        {
          v41 = *v3;
          v42 = *(_QWORD *)(a2 + v41);
          v43 = v42 + 1;
          if (v42 == -1 || v43 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v44 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
            *(_QWORD *)(a2 + v41) = v43;
            v40 |= (unint64_t)(v44 & 0x7F) << v38;
            if (v44 < 0)
            {
              v38 += 7;
              v15 = v39++ >= 9;
              if (v15)
              {
                LODWORD(v40) = 0;
                goto LABEL_157;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v40) = 0;
LABEL_157:
        v115 = 56;
        goto LABEL_186;
      case 0xBu:
        v45 = 0;
        v46 = 0;
        v40 = 0;
        *(_DWORD *)(a1 + 184) |= 0x400u;
        while (2)
        {
          v47 = *v3;
          v48 = *(_QWORD *)(a2 + v47);
          v49 = v48 + 1;
          if (v48 == -1 || v49 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v50 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v48);
            *(_QWORD *)(a2 + v47) = v49;
            v40 |= (unint64_t)(v50 & 0x7F) << v45;
            if (v50 < 0)
            {
              v45 += 7;
              v15 = v46++ >= 9;
              if (v15)
              {
                LODWORD(v40) = 0;
                goto LABEL_161;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v40) = 0;
LABEL_161:
        v115 = 116;
        goto LABEL_186;
      case 0xCu:
        v51 = 0;
        v52 = 0;
        v40 = 0;
        *(_DWORD *)(a1 + 184) |= 0x200u;
        while (2)
        {
          v53 = *v3;
          v54 = *(_QWORD *)(a2 + v53);
          v55 = v54 + 1;
          if (v54 == -1 || v55 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v56 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v54);
            *(_QWORD *)(a2 + v53) = v55;
            v40 |= (unint64_t)(v56 & 0x7F) << v51;
            if (v56 < 0)
            {
              v51 += 7;
              v15 = v52++ >= 9;
              if (v15)
              {
                LODWORD(v40) = 0;
                goto LABEL_165;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v40) = 0;
LABEL_165:
        v115 = 112;
        goto LABEL_186;
      case 0xDu:
        v57 = 0;
        v58 = 0;
        v40 = 0;
        *(_DWORD *)(a1 + 184) |= 0x800u;
        while (2)
        {
          v59 = *v3;
          v60 = *(_QWORD *)(a2 + v59);
          v61 = v60 + 1;
          if (v60 == -1 || v61 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v62 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v60);
            *(_QWORD *)(a2 + v59) = v61;
            v40 |= (unint64_t)(v62 & 0x7F) << v57;
            if (v62 < 0)
            {
              v57 += 7;
              v15 = v58++ >= 9;
              if (v15)
              {
                LODWORD(v40) = 0;
                goto LABEL_169;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v40) = 0;
LABEL_169:
        v115 = 136;
        goto LABEL_186;
      case 0xEu:
        v63 = 0;
        v64 = 0;
        v40 = 0;
        *(_DWORD *)(a1 + 184) |= 0x10u;
        while (2)
        {
          v65 = *v3;
          v66 = *(_QWORD *)(a2 + v65);
          v67 = v66 + 1;
          if (v66 == -1 || v67 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v68 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v66);
            *(_QWORD *)(a2 + v65) = v67;
            v40 |= (unint64_t)(v68 & 0x7F) << v63;
            if (v68 < 0)
            {
              v63 += 7;
              v15 = v64++ >= 9;
              if (v15)
              {
                LODWORD(v40) = 0;
                goto LABEL_173;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v40) = 0;
LABEL_173:
        v115 = 80;
        goto LABEL_186;
      case 0xFu:
        PBReaderReadString();
        v69 = (CLPMotionActivity *)objc_claimAutoreleasedReturnValue();
        if (v69)
          objc_msgSend((id)a1, "addAppBundleIdIndices:", v69);
        goto LABEL_153;
      case 0x10u:
        v70 = 0;
        v71 = 0;
        v72 = 0;
        *(_DWORD *)(a1 + 184) |= 0x40000u;
        while (2)
        {
          v73 = *v3;
          v74 = *(_QWORD *)(a2 + v73);
          v75 = v74 + 1;
          if (v74 == -1 || v75 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v76 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v74);
            *(_QWORD *)(a2 + v73) = v75;
            v72 |= (unint64_t)(v76 & 0x7F) << v70;
            if (v76 < 0)
            {
              v70 += 7;
              v15 = v71++ >= 9;
              if (v15)
              {
                v72 = 0;
                goto LABEL_177;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v72 = 0;
LABEL_177:
        v116 = v72 != 0;
        v117 = 183;
        goto LABEL_195;
      case 0x11u:
        v77 = 0;
        v78 = 0;
        v79 = 0;
        *(_DWORD *)(a1 + 184) |= 0x20000u;
        while (2)
        {
          v80 = *v3;
          v81 = *(_QWORD *)(a2 + v80);
          v82 = v81 + 1;
          if (v81 == -1 || v82 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v83 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v81);
            *(_QWORD *)(a2 + v80) = v82;
            v79 |= (unint64_t)(v83 & 0x7F) << v77;
            if (v83 < 0)
            {
              v77 += 7;
              v15 = v78++ >= 9;
              if (v15)
              {
                v79 = 0;
                goto LABEL_181;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v79 = 0;
LABEL_181:
        v116 = v79 != 0;
        v117 = 182;
        goto LABEL_195;
      case 0x12u:
        v69 = objc_alloc_init(CLPMotionActivity);
        v84 = 144;
        goto LABEL_99;
      case 0x13u:
        v69 = objc_alloc_init(CLPMotionActivity);
        v84 = 104;
        goto LABEL_99;
      case 0x14u:
        v69 = objc_alloc_init(CLPMotionActivity);
        v84 = 72;
LABEL_99:
        objc_storeStrong((id *)(a1 + v84), v69);
        if (!PBReaderPlaceMark() || !CLPMotionActivityReadFrom((uint64_t)v69, a2))
          goto LABEL_226;
        goto LABEL_152;
      case 0x15u:
        *(_DWORD *)(a1 + 184) |= 8u;
        v85 = *v3;
        v86 = *(_QWORD *)(a2 + v85);
        if (v86 <= 0xFFFFFFFFFFFFFFFBLL && v86 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v26 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v86);
          *(_QWORD *)(a2 + v85) = v86 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v26 = 0;
        }
        v119 = 64;
        goto LABEL_223;
      case 0x16u:
        *(_DWORD *)(a1 + 184) |= 0x2000u;
        v87 = *v3;
        v88 = *(_QWORD *)(a2 + v87);
        if (v88 <= 0xFFFFFFFFFFFFFFFBLL && v88 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v26 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v88);
          *(_QWORD *)(a2 + v87) = v88 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v26 = 0;
        }
        v119 = 164;
        goto LABEL_223;
      case 0x17u:
        v89 = 0;
        v90 = 0;
        v40 = 0;
        *(_DWORD *)(a1 + 184) |= 0x100u;
        while (2)
        {
          v91 = *v3;
          v92 = *(_QWORD *)(a2 + v91);
          v93 = v92 + 1;
          if (v92 == -1 || v93 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v94 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v92);
            *(_QWORD *)(a2 + v91) = v93;
            v40 |= (unint64_t)(v94 & 0x7F) << v89;
            if (v94 < 0)
            {
              v89 += 7;
              v15 = v90++ >= 9;
              if (v15)
              {
                LODWORD(v40) = 0;
                goto LABEL_185;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v40) = 0;
LABEL_185:
        v115 = 100;
LABEL_186:
        *(_DWORD *)(a1 + v115) = v40;
        goto LABEL_224;
      case 0x18u:
        *(_DWORD *)(a1 + 184) |= 0x20u;
        v95 = *v3;
        v96 = *(_QWORD *)(a2 + v95);
        if (v96 <= 0xFFFFFFFFFFFFFFFBLL && v96 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v26 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v96);
          *(_QWORD *)(a2 + v95) = v96 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v26 = 0;
        }
        v119 = 88;
        goto LABEL_223;
      case 0x19u:
        *(_DWORD *)(a1 + 184) |= 0x80u;
        v97 = *v3;
        v98 = *(_QWORD *)(a2 + v97);
        if (v98 <= 0xFFFFFFFFFFFFFFFBLL && v98 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v26 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v98);
          *(_QWORD *)(a2 + v97) = v98 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v26 = 0;
        }
        v119 = 96;
        goto LABEL_223;
      case 0x1Au:
        *(_DWORD *)(a1 + 184) |= 0x40u;
        v99 = *v3;
        v100 = *(_QWORD *)(a2 + v99);
        if (v100 <= 0xFFFFFFFFFFFFFFFBLL && v100 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v26 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v100);
          *(_QWORD *)(a2 + v99) = v100 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v26 = 0;
        }
        v119 = 92;
LABEL_223:
        *(_DWORD *)(a1 + v119) = v26;
        goto LABEL_224;
      case 0x1Bu:
        v69 = objc_alloc_init(CLPSatelliteReport);
        objc_storeStrong((id *)(a1 + 152), v69);
        if (!PBReaderPlaceMark() || !CLPSatelliteReportReadFrom((uint64_t)v69, a2))
          goto LABEL_226;
        goto LABEL_152;
      case 0x1Cu:
        v101 = 0;
        v102 = 0;
        v103 = 0;
        *(_DWORD *)(a1 + 184) |= 0x8000u;
        while (2)
        {
          v104 = *v3;
          v105 = *(_QWORD *)(a2 + v104);
          v106 = v105 + 1;
          if (v105 == -1 || v106 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v107 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v105);
            *(_QWORD *)(a2 + v104) = v106;
            v103 |= (unint64_t)(v107 & 0x7F) << v101;
            if (v107 < 0)
            {
              v101 += 7;
              v15 = v102++ >= 9;
              if (v15)
              {
                v103 = 0;
                goto LABEL_190;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v103 = 0;
LABEL_190:
        v116 = v103 != 0;
        v117 = 180;
        goto LABEL_195;
      case 0x1Du:
        v69 = objc_alloc_init(CLPPipelineDiagnosticReport);
        objc_storeStrong((id *)(a1 + 120), v69);
        if (!PBReaderPlaceMark() || (CLPPipelineDiagnosticReportReadFrom((uint64_t)v69, a2) & 1) == 0)
          goto LABEL_226;
        goto LABEL_152;
      case 0x1Eu:
        v69 = objc_alloc_init(CLPBaroCalibrationIndication);
        objc_storeStrong((id *)(a1 + 48), v69);
        if (!PBReaderPlaceMark() || (CLPBaroCalibrationIndicationReadFrom((uint64_t)v69, a2) & 1) == 0)
          goto LABEL_226;
        goto LABEL_152;
      case 0x1Fu:
        v69 = objc_alloc_init(CLPLocationProcessingMetadata);
        objc_storeStrong((id *)(a1 + 128), v69);
        if (!PBReaderPlaceMark() || (CLPLocationProcessingMetadataReadFrom((uint64_t)v69, a2) & 1) == 0)
          goto LABEL_226;
        goto LABEL_152;
      case 0x20u:
        v108 = 0;
        v109 = 0;
        v110 = 0;
        *(_DWORD *)(a1 + 184) |= 0x10000u;
        while (2)
        {
          v111 = *v3;
          v112 = *(_QWORD *)(a2 + v111);
          v113 = v112 + 1;
          if (v112 == -1 || v113 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v114 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v112);
            *(_QWORD *)(a2 + v111) = v113;
            v110 |= (unint64_t)(v114 & 0x7F) << v108;
            if (v114 < 0)
            {
              v108 += 7;
              v15 = v109++ >= 9;
              if (v15)
              {
                v110 = 0;
                goto LABEL_194;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v110 = 0;
LABEL_194:
        v116 = v110 != 0;
        v117 = 181;
LABEL_195:
        *(_BYTE *)(a1 + v117) = v116;
        goto LABEL_224;
      case 0x21u:
        v69 = objc_alloc_init(CLPVehicleType);
        objc_storeStrong((id *)(a1 + 168), v69);
        if (PBReaderPlaceMark() && (CLPVehicleTypeReadFrom((uint64_t)v69, a2) & 1) != 0)
        {
LABEL_152:
          PBReaderRecallMark();
LABEL_153:

LABEL_224:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_226:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_224;
    }
  }
}

uint64_t CLPIndoorPressureReadFrom(uint64_t a1, uint64_t a2)
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
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t result;
  uint64_t v28;

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
      v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        *(_BYTE *)(a1 + 24) |= 4u;
        v22 = *v3;
        v23 = *(_QWORD *)(a2 + v22);
        if (v23 <= 0xFFFFFFFFFFFFFFFBLL && v23 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v24 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v23 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v24 = 0;
        }
        v28 = 20;
      }
      else
      {
        if ((_DWORD)v18 != 2)
        {
          if ((_DWORD)v18 == 1)
          {
            *(_BYTE *)(a1 + 24) |= 1u;
            v19 = *v3;
            v20 = *(_QWORD *)(a2 + v19);
            if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(_QWORD *)(a2 + *v4))
            {
              v21 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v20);
              *(_QWORD *)(a2 + v19) = v20 + 8;
            }
            else
            {
              *(_BYTE *)(a2 + *v5) = 1;
              v21 = 0;
            }
            *(_QWORD *)(a1 + 8) = v21;
          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        *(_BYTE *)(a1 + 24) |= 2u;
        v25 = *v3;
        v26 = *(_QWORD *)(a2 + v25);
        if (v26 <= 0xFFFFFFFFFFFFFFFBLL && v26 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v24 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v26);
          *(_QWORD *)(a2 + v25) = v26 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v24 = 0;
        }
        v28 = 16;
      }
      *(_DWORD *)(a1 + v28) = v24;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPIndoorWifiScanReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v16;
  int v17;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  uint64_t v44;
  unint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;

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
          v16 = *v5;
          v17 = *(unsigned __int8 *)(a2 + v16);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *v5;
      v17 = *(unsigned __int8 *)(a2 + v16);
      if (*(_BYTE *)(a2 + v16))
        v10 = 0;
LABEL_14:
      if (v17 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v19 = *v3;
          v20 = *(_QWORD *)(a2 + v19);
          if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v21 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v20);
            *(_QWORD *)(a2 + v19) = v20 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + v16) = 1;
            v21 = 0;
          }
          v48 = 16;
          goto LABEL_68;
        case 2u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 40;
          goto LABEL_50;
        case 3u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            v30 = v29 + 1;
            if (v29 == -1 || v30 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v30;
              v27 |= (unint64_t)(v31 & 0x7F) << v25;
              if (v31 < 0)
              {
                v25 += 7;
                v15 = v26++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_54;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v27) = 0;
LABEL_54:
          v47 = 32;
          goto LABEL_63;
        case 4u:
          v32 = 0;
          v33 = 0;
          v27 = 0;
          *(_BYTE *)(a1 + 52) |= 2u;
          while (2)
          {
            v34 = *v3;
            v35 = *(_QWORD *)(a2 + v34);
            v36 = v35 + 1;
            if (v35 == -1 || v36 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
              *(_QWORD *)(a2 + v34) = v36;
              v27 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v15 = v33++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_58;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v27) = 0;
LABEL_58:
          v47 = 36;
          goto LABEL_63;
        case 5u:
          v38 = 0;
          v39 = 0;
          v27 = 0;
          break;
        case 6u:
          *(_BYTE *)(a1 + 52) |= 1u;
          v44 = *v3;
          v45 = *(_QWORD *)(a2 + v44);
          if (v45 <= 0xFFFFFFFFFFFFFFF7 && v45 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v21 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v45);
            *(_QWORD *)(a2 + v44) = v45 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v21 = 0;
          }
          v48 = 8;
LABEL_68:
          *(_QWORD *)(a1 + v48) = v21;
          continue;
        case 7u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 24;
LABEL_50:
          v46 = *(void **)(a1 + v24);
          *(_QWORD *)(a1 + v24) = v23;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v40 = *v3;
        v41 = *(_QWORD *)(a2 + v40);
        v42 = v41 + 1;
        if (v41 == -1 || v42 > *(_QWORD *)(a2 + *v4))
          break;
        v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v41);
        *(_QWORD *)(a2 + v40) = v42;
        v27 |= (unint64_t)(v43 & 0x7F) << v38;
        if ((v43 & 0x80) == 0)
          goto LABEL_60;
        v38 += 7;
        v15 = v39++ >= 9;
        if (v15)
        {
          LODWORD(v27) = 0;
          goto LABEL_62;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_60:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v27) = 0;
LABEL_62:
      v47 = 48;
LABEL_63:
      *(_DWORD *)(a1 + v47) = v27;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL CLPAppCollectionRequestReadFrom(uint64_t a1, uint64_t a2)
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
  unint64_t v18;
  CLPAppLocation *v19;
  uint64_t v20;

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
      v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v18 == 2)
      {
        v19 = objc_alloc_init(CLPAppLocation);
        objc_msgSend((id)a1, "addAppLocation:", v19);
        if (!PBReaderPlaceMark() || (CLPAppLocationReadFrom((uint64_t)v19, a2) & 1) == 0)
        {
LABEL_33:

          return 0;
        }
LABEL_27:
        PBReaderRecallMark();
LABEL_28:

        goto LABEL_30;
      }
      if ((_DWORD)v18 == 1)
      {
        v19 = objc_alloc_init(CLPMeta);
        objc_storeStrong((id *)(a1 + 16), v19);
        if (!PBReaderPlaceMark() || (CLPMetaReadFrom((uint64_t)v19, a2) & 1) == 0)
          goto LABEL_33;
        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_30:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadData();
    v20 = objc_claimAutoreleasedReturnValue();
    v19 = *(CLPAppLocation **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v20;
    goto LABEL_28;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPAppLocationReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t result;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  CLPLocation *v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  uint64_t v50;

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
        v19 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v18;

        goto LABEL_73;
      case 2u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        while (2)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          v26 = v25 + 1;
          if (v25 == -1 || v26 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v26;
            v23 |= (unint64_t)(v27 & 0x7F) << v21;
            if (v27 < 0)
            {
              v21 += 7;
              v15 = v22++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_59;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_59:
        v50 = 24;
        goto LABEL_72;
      case 3u:
        *(_BYTE *)(a1 + 52) |= 1u;
        v28 = *v3;
        v29 = *(_QWORD *)(a2 + v28);
        if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v30 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v29);
          *(_QWORD *)(a2 + v28) = v29 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v30 = 0;
        }
        *(_QWORD *)(a1 + 8) = v30;
        goto LABEL_73;
      case 4u:
        v31 = objc_alloc_init(CLPLocation);
        objc_storeStrong((id *)(a1 + 32), v31);
        if (PBReaderPlaceMark() && (CLPLocationReadFrom((uint64_t)v31, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_73:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 5u:
        v32 = 0;
        v33 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 52) |= 8u;
        while (2)
        {
          v34 = *v3;
          v35 = *(_QWORD *)(a2 + v34);
          v36 = v35 + 1;
          if (v35 == -1 || v36 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
            *(_QWORD *)(a2 + v34) = v36;
            v23 |= (unint64_t)(v37 & 0x7F) << v32;
            if (v37 < 0)
            {
              v32 += 7;
              v15 = v33++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_63;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_63:
        v50 = 48;
        goto LABEL_72;
      case 6u:
        v38 = 0;
        v39 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 52) |= 4u;
        while (2)
        {
          v40 = *v3;
          v41 = *(_QWORD *)(a2 + v40);
          v42 = v41 + 1;
          if (v41 == -1 || v42 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v41);
            *(_QWORD *)(a2 + v40) = v42;
            v23 |= (unint64_t)(v43 & 0x7F) << v38;
            if (v43 < 0)
            {
              v38 += 7;
              v15 = v39++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_67;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_67:
        v50 = 44;
        goto LABEL_72;
      case 7u:
        v44 = 0;
        v45 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 52) |= 2u;
        while (2)
        {
          v46 = *v3;
          v47 = *(_QWORD *)(a2 + v46);
          v48 = v47 + 1;
          if (v47 == -1 || v48 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v49 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v47);
            *(_QWORD *)(a2 + v46) = v48;
            v23 |= (unint64_t)(v49 & 0x7F) << v44;
            if (v49 < 0)
            {
              v44 += 7;
              v15 = v45++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_71;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_71:
        v50 = 40;
LABEL_72:
        *(_DWORD *)(a1 + v50) = v23;
        goto LABEL_73;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_73;
    }
  }
}

uint64_t CLPAppCollectionResponseReadFrom(uint64_t a1, uint64_t a2)
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
        break;
      if ((v10 >> 3) == 2)
      {
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v25;

      }
      else if ((v10 >> 3) == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
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
            goto LABEL_31;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v20 = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_33:
        *(_BYTE *)(a1 + 16) = v20 != 0;
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

uint64_t CLPBaroCalibrationIndicationReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t result;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  BOOL v50;
  uint64_t v51;

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
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 24) |= 4u;
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
              goto LABEL_53;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_55;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_53:
          if (*(_BYTE *)(a2 + *v5))
            v20 = 0;
LABEL_55:
          v50 = v20 != 0;
          v51 = 20;
          goto LABEL_64;
        case 2u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 24) |= 8u;
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
                  v28 = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v28 = 0;
LABEL_59:
          v50 = v28 != 0;
          v51 = 21;
          goto LABEL_64;
        case 3u:
          v33 = 0;
          v34 = 0;
          v35 = 0;
          *(_BYTE *)(a1 + 24) |= 0x10u;
          while (2)
          {
            v36 = *v3;
            v37 = *(_QWORD *)(a2 + v36);
            v38 = v37 + 1;
            if (v37 == -1 || v38 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v39 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v37);
              *(_QWORD *)(a2 + v36) = v38;
              v35 |= (unint64_t)(v39 & 0x7F) << v33;
              if (v39 < 0)
              {
                v33 += 7;
                v15 = v34++ >= 9;
                if (v15)
                {
                  v35 = 0;
                  goto LABEL_63;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v35 = 0;
LABEL_63:
          v50 = v35 != 0;
          v51 = 22;
LABEL_64:
          *(_BYTE *)(a1 + v51) = v50;
          continue;
        case 4u:
          *(_BYTE *)(a1 + 24) |= 1u;
          v40 = *v3;
          v41 = *(_QWORD *)(a2 + v40);
          if (v41 <= 0xFFFFFFFFFFFFFFF7 && v41 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v42 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v41);
            *(_QWORD *)(a2 + v40) = v41 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v42 = 0;
          }
          *(_QWORD *)(a1 + 8) = v42;
          continue;
        case 5u:
          v43 = 0;
          v44 = 0;
          v45 = 0;
          *(_BYTE *)(a1 + 24) |= 2u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v46 = *v3;
        v47 = *(_QWORD *)(a2 + v46);
        v48 = v47 + 1;
        if (v47 == -1 || v48 > *(_QWORD *)(a2 + *v4))
          break;
        v49 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v47);
        *(_QWORD *)(a2 + v46) = v48;
        v45 |= (unint64_t)(v49 & 0x7F) << v43;
        if ((v49 & 0x80) == 0)
          goto LABEL_66;
        v43 += 7;
        v15 = v44++ >= 9;
        if (v15)
        {
          LODWORD(v45) = 0;
          goto LABEL_68;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_66:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v45) = 0;
LABEL_68:
      *(_DWORD *)(a1 + 16) = v45;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPBundleIdReadFrom(uint64_t a1, uint64_t a2)
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
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
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
      v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 16;
      }
      else
      {
        if ((_DWORD)v18 != 2)
        {
          if ((_DWORD)v18 == 1)
          {
            *(_BYTE *)(a1 + 32) |= 1u;
            v19 = *v3;
            v20 = *(_QWORD *)(a2 + v19);
            if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(_QWORD *)(a2 + *v4))
            {
              v21 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v20);
              *(_QWORD *)(a2 + v19) = v20 + 8;
            }
            else
            {
              *(_BYTE *)(a2 + *v5) = 1;
              v21 = 0;
            }
            *(_QWORD *)(a1 + 8) = v21;
          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 24;
      }
      v24 = *(void **)(a1 + v23);
      *(_QWORD *)(a1 + v23) = v22;

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPCalibratedPressureCollectionRequestReadFrom(uint64_t a1, uint64_t a2)
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
  unint64_t v19;
  int v20;
  uint64_t result;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  CLPMotionActivity *v51;
  char v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  char v59;
  unsigned int v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char v64;
  char v65;
  unsigned int v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

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
        *(_DWORD *)(a1 + 112) |= 0x100u;
        v18 = *v3;
        v19 = *(_QWORD *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFFBLL && v19 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v20 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v19);
          *(_QWORD *)(a2 + v18) = v19 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v20 = 0;
        }
        v72 = 72;
        goto LABEL_134;
      case 2u:
        *(_DWORD *)(a1 + 112) |= 0x200u;
        v22 = *v3;
        v23 = *(_QWORD *)(a2 + v22);
        if (v23 <= 0xFFFFFFFFFFFFFFFBLL && v23 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v20 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v23 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v20 = 0;
        }
        v72 = 76;
        goto LABEL_134;
      case 3u:
        *(_DWORD *)(a1 + 112) |= 0x40u;
        v24 = *v3;
        v25 = *(_QWORD *)(a2 + v24);
        if (v25 <= 0xFFFFFFFFFFFFFFFBLL && v25 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v20 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v25);
          *(_QWORD *)(a2 + v24) = v25 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v20 = 0;
        }
        v72 = 56;
        goto LABEL_134;
      case 4u:
        *(_DWORD *)(a1 + 112) |= 0x80u;
        v26 = *v3;
        v27 = *(_QWORD *)(a2 + v26);
        if (v27 <= 0xFFFFFFFFFFFFFFFBLL && v27 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v20 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v27);
          *(_QWORD *)(a2 + v26) = v27 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v20 = 0;
        }
        v72 = 60;
        goto LABEL_134;
      case 5u:
        *(_DWORD *)(a1 + 112) |= 8u;
        v28 = *v3;
        v29 = *(_QWORD *)(a2 + v28);
        if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v30 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v29);
          *(_QWORD *)(a2 + v28) = v29 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v30 = 0;
        }
        v73 = 32;
        goto LABEL_137;
      case 6u:
        *(_DWORD *)(a1 + 112) |= 1u;
        v31 = *v3;
        v32 = *(_QWORD *)(a2 + v31);
        if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v30 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v32);
          *(_QWORD *)(a2 + v31) = v32 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v30 = 0;
        }
        v73 = 8;
        goto LABEL_137;
      case 7u:
        *(_DWORD *)(a1 + 112) |= 2u;
        v33 = *v3;
        v34 = *(_QWORD *)(a2 + v33);
        if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v30 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v34);
          *(_QWORD *)(a2 + v33) = v34 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v30 = 0;
        }
        v73 = 16;
        goto LABEL_137;
      case 8u:
        *(_DWORD *)(a1 + 112) |= 0x400u;
        v35 = *v3;
        v36 = *(_QWORD *)(a2 + v35);
        if (v36 <= 0xFFFFFFFFFFFFFFFBLL && v36 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v20 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v36);
          *(_QWORD *)(a2 + v35) = v36 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v20 = 0;
        }
        v72 = 80;
        goto LABEL_134;
      case 9u:
        *(_DWORD *)(a1 + 112) |= 0x10u;
        v37 = *v3;
        v38 = *(_QWORD *)(a2 + v37);
        if (v38 <= 0xFFFFFFFFFFFFFFFBLL && v38 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v20 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v38);
          *(_QWORD *)(a2 + v37) = v38 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v20 = 0;
        }
        v72 = 48;
        goto LABEL_134;
      case 0xAu:
        *(_DWORD *)(a1 + 112) |= 0x20u;
        v39 = *v3;
        v40 = *(_QWORD *)(a2 + v39);
        if (v40 <= 0xFFFFFFFFFFFFFFFBLL && v40 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v20 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v40);
          *(_QWORD *)(a2 + v39) = v40 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v20 = 0;
        }
        v72 = 52;
        goto LABEL_134;
      case 0xBu:
        *(_DWORD *)(a1 + 112) |= 0x10000u;
        v41 = *v3;
        v42 = *(_QWORD *)(a2 + v41);
        if (v42 <= 0xFFFFFFFFFFFFFFFBLL && v42 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v20 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v42);
          *(_QWORD *)(a2 + v41) = v42 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v20 = 0;
        }
        v72 = 104;
        goto LABEL_134;
      case 0xCu:
        *(_DWORD *)(a1 + 112) |= 0x20000u;
        v43 = *v3;
        v44 = *(_QWORD *)(a2 + v43);
        if (v44 <= 0xFFFFFFFFFFFFFFFBLL && v44 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v20 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v44);
          *(_QWORD *)(a2 + v43) = v44 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v20 = 0;
        }
        v72 = 108;
        goto LABEL_134;
      case 0xDu:
        *(_DWORD *)(a1 + 112) |= 0x2000u;
        v45 = *v3;
        v46 = *(_QWORD *)(a2 + v45);
        if (v46 <= 0xFFFFFFFFFFFFFFFBLL && v46 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v20 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v46);
          *(_QWORD *)(a2 + v45) = v46 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v20 = 0;
        }
        v72 = 92;
        goto LABEL_134;
      case 0xEu:
        *(_DWORD *)(a1 + 112) |= 0x4000u;
        v47 = *v3;
        v48 = *(_QWORD *)(a2 + v47);
        if (v48 <= 0xFFFFFFFFFFFFFFFBLL && v48 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v20 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v48);
          *(_QWORD *)(a2 + v47) = v48 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v20 = 0;
        }
        v72 = 96;
LABEL_134:
        *(_DWORD *)(a1 + v72) = v20;
        goto LABEL_138;
      case 0xFu:
        *(_DWORD *)(a1 + 112) |= 4u;
        v49 = *v3;
        v50 = *(_QWORD *)(a2 + v49);
        if (v50 <= 0xFFFFFFFFFFFFFFF7 && v50 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v30 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v50);
          *(_QWORD *)(a2 + v49) = v50 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v30 = 0;
        }
        v73 = 24;
LABEL_137:
        *(_QWORD *)(a1 + v73) = v30;
        goto LABEL_138;
      case 0x10u:
        v51 = objc_alloc_init(CLPMotionActivity);
        objc_storeStrong((id *)(a1 + 40), v51);
        if (!PBReaderPlaceMark() || !CLPMotionActivityReadFrom((uint64_t)v51, a2))
          goto LABEL_140;
        goto LABEL_78;
      case 0x11u:
        v52 = 0;
        v53 = 0;
        v54 = 0;
        *(_DWORD *)(a1 + 112) |= 0x8000u;
        while (2)
        {
          v55 = *v3;
          v56 = *(_QWORD *)(a2 + v55);
          v57 = v56 + 1;
          if (v56 == -1 || v57 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v58 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v56);
            *(_QWORD *)(a2 + v55) = v57;
            v54 |= (unint64_t)(v58 & 0x7F) << v52;
            if (v58 < 0)
            {
              v52 += 7;
              v15 = v53++ >= 9;
              if (v15)
              {
                LODWORD(v54) = 0;
                goto LABEL_96;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v54) = 0;
LABEL_96:
        v71 = 100;
        goto LABEL_105;
      case 0x12u:
        v51 = objc_alloc_init(CLPBaroCalibrationIndication);
        objc_storeStrong((id *)(a1 + 64), v51);
        if (PBReaderPlaceMark() && (CLPBaroCalibrationIndicationReadFrom((uint64_t)v51, a2) & 1) != 0)
        {
LABEL_78:
          PBReaderRecallMark();

LABEL_138:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_140:

        return 0;
      case 0x13u:
        v59 = 0;
        v60 = 0;
        v54 = 0;
        *(_DWORD *)(a1 + 112) |= 0x800u;
        while (2)
        {
          v61 = *v3;
          v62 = *(_QWORD *)(a2 + v61);
          v63 = v62 + 1;
          if (v62 == -1 || v63 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v64 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v62);
            *(_QWORD *)(a2 + v61) = v63;
            v54 |= (unint64_t)(v64 & 0x7F) << v59;
            if (v64 < 0)
            {
              v59 += 7;
              v15 = v60++ >= 9;
              if (v15)
              {
                LODWORD(v54) = 0;
                goto LABEL_100;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v54) = 0;
LABEL_100:
        v71 = 84;
        goto LABEL_105;
      case 0x14u:
        v65 = 0;
        v66 = 0;
        v54 = 0;
        *(_DWORD *)(a1 + 112) |= 0x1000u;
        while (2)
        {
          v67 = *v3;
          v68 = *(_QWORD *)(a2 + v67);
          v69 = v68 + 1;
          if (v68 == -1 || v69 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v70 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v68);
            *(_QWORD *)(a2 + v67) = v69;
            v54 |= (unint64_t)(v70 & 0x7F) << v65;
            if (v70 < 0)
            {
              v65 += 7;
              v15 = v66++ >= 9;
              if (v15)
              {
                LODWORD(v54) = 0;
                goto LABEL_104;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v54) = 0;
LABEL_104:
        v71 = 88;
LABEL_105:
        *(_DWORD *)(a1 + v71) = v54;
        goto LABEL_138;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_138;
    }
  }
}

BOOL CLPMotionActivityReadFrom(uint64_t a1, uint64_t a2)
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
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  BOOL v25;
  int *v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;

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
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 16) |= 2u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          v23 = v22 + 1;
          if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
          {
            v26 = &OBJC_IVAR___CLPMotionActivity__type;
            goto LABEL_38;
          }
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0)
            break;
          v18 += 7;
          v25 = v19++ > 8;
          if (v25)
          {
            LODWORD(v20) = 0;
            v26 = &OBJC_IVAR___CLPMotionActivity__type;
            goto LABEL_41;
          }
        }
        v26 = &OBJC_IVAR___CLPMotionActivity__type;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_41:
        *(_DWORD *)(a1 + *v26) = v20;
        goto LABEL_42;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_42:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v27 = 0;
    v28 = 0;
    v20 = 0;
    *(_BYTE *)(a1 + 16) |= 1u;
    while (1)
    {
      v29 = *v3;
      v30 = *(_QWORD *)(a2 + v29);
      v31 = v30 + 1;
      if (v30 == -1 || v31 > *(_QWORD *)(a2 + *v4))
        break;
      v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
      *(_QWORD *)(a2 + v29) = v31;
      v20 |= (unint64_t)(v32 & 0x7F) << v27;
      if ((v32 & 0x80) == 0)
      {
        v26 = &OBJC_IVAR___CLPMotionActivity__confidence;
        goto LABEL_39;
      }
      v27 += 7;
      v25 = v28++ > 8;
      if (v25)
      {
        LODWORD(v20) = 0;
        v26 = &OBJC_IVAR___CLPMotionActivity__confidence;
        goto LABEL_41;
      }
    }
    v26 = &OBJC_IVAR___CLPMotionActivity__confidence;
LABEL_38:
    *(_BYTE *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL CLPCdmaCellNeighborReadFrom(uint64_t a1, uint64_t a2)
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
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  BOOL v25;
  int *v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  char v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  char v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char v50;

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
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 28) |= 8u;
          while (1)
          {
            v21 = *v3;
            v22 = *(_QWORD *)(a2 + v21);
            v23 = v22 + 1;
            if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
            {
              v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__pnoffset;
              goto LABEL_61;
            }
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v23;
            v20 |= (unint64_t)(v24 & 0x7F) << v18;
            if ((v24 & 0x80) == 0)
              break;
            v18 += 7;
            v25 = v19++ > 8;
            if (v25)
            {
              LODWORD(v20) = 0;
              v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__pnoffset;
              goto LABEL_64;
            }
          }
          v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__pnoffset;
          goto LABEL_62;
        case 2u:
          v27 = 0;
          v28 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 28) |= 4u;
          while (2)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            v31 = v30 + 1;
            if (v30 == -1 || v31 > *(_QWORD *)(a2 + *v4))
            {
              v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__pilotPhase;
              goto LABEL_61;
            }
            v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
            *(_QWORD *)(a2 + v29) = v31;
            v20 |= (unint64_t)(v32 & 0x7F) << v27;
            if (v32 < 0)
            {
              v27 += 7;
              v25 = v28++ > 8;
              if (v25)
              {
                LODWORD(v20) = 0;
                v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__pilotPhase;
                goto LABEL_64;
              }
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__pilotPhase;
          goto LABEL_62;
        case 3u:
          v33 = 0;
          v34 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 28) |= 2u;
          while (2)
          {
            v35 = *v3;
            v36 = *(_QWORD *)(a2 + v35);
            v37 = v36 + 1;
            if (v36 == -1 || v37 > *(_QWORD *)(a2 + *v4))
            {
              v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__ecn0;
              goto LABEL_61;
            }
            v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
            *(_QWORD *)(a2 + v35) = v37;
            v20 |= (unint64_t)(v38 & 0x7F) << v33;
            if (v38 < 0)
            {
              v33 += 7;
              v25 = v34++ > 8;
              if (v25)
              {
                LODWORD(v20) = 0;
                v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__ecn0;
                goto LABEL_64;
              }
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__ecn0;
          goto LABEL_62;
        case 4u:
          v39 = 0;
          v40 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 28) |= 0x10u;
          while (2)
          {
            v41 = *v3;
            v42 = *(_QWORD *)(a2 + v41);
            v43 = v42 + 1;
            if (v42 == -1 || v43 > *(_QWORD *)(a2 + *v4))
            {
              v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__rscp;
              goto LABEL_61;
            }
            v44 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
            *(_QWORD *)(a2 + v41) = v43;
            v20 |= (unint64_t)(v44 & 0x7F) << v39;
            if (v44 < 0)
            {
              v39 += 7;
              v25 = v40++ > 8;
              if (v25)
              {
                LODWORD(v20) = 0;
                v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__rscp;
                goto LABEL_64;
              }
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__rscp;
          goto LABEL_62;
        case 5u:
          v45 = 0;
          v46 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 28) |= 1u;
          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) != 0)
            continue;
          return 0;
      }
      while (1)
      {
        v47 = *v3;
        v48 = *(_QWORD *)(a2 + v47);
        v49 = v48 + 1;
        if (v48 == -1 || v49 > *(_QWORD *)(a2 + *v4))
          break;
        v50 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v48);
        *(_QWORD *)(a2 + v47) = v49;
        v20 |= (unint64_t)(v50 & 0x7F) << v45;
        if ((v50 & 0x80) == 0)
        {
          v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__channel;
          goto LABEL_62;
        }
        v45 += 7;
        v25 = v46++ > 8;
        if (v25)
        {
          LODWORD(v20) = 0;
          v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__channel;
          goto LABEL_64;
        }
      }
      v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__channel;
LABEL_61:
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_62:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v20) = 0;
LABEL_64:
      *(_DWORD *)(a1 + *v26) = -(v20 & 1) ^ ((int)v20 >> 1);
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPCdmaCellTowerLocationReadFrom(uint64_t a1, uint64_t a2)
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
  int v17;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  unsigned int v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char v72;
  char v73;
  unsigned int v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char v78;
  char v79;
  unsigned int v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  char v84;
  char v85;
  unsigned int v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  char v90;
  char v91;
  unsigned int v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  char v96;
  CLPLocation *v97;
  char v98;
  unsigned int v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char v103;
  char v104;
  unsigned int v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  char v109;
  char v110;
  unsigned int v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  char v115;
  uint64_t result;
  char v117;
  unsigned int v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  char v123;
  char v124;
  unsigned int v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  char v130;
  char v131;
  unsigned int v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  unint64_t v136;
  char v137;
  char v138;
  unsigned int v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  unint64_t v143;
  char v144;
  void *v145;
  uint64_t v146;
  int v147;
  uint64_t v148;
  char v149;
  unsigned int v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  unint64_t v154;
  char v155;
  uint64_t v156;

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
    v17 = v10 & 7;
    if (v16 || v17 == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v19 = 0;
        v20 = 0;
        v21 = 0;
        while (1)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          v24 = v23 + 1;
          if (v23 == -1 || v24 > *(_QWORD *)(a2 + *v4))
            break;
          v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v24;
          v21 |= (unint64_t)(v25 & 0x7F) << v19;
          if ((v25 & 0x80) == 0)
            goto LABEL_180;
          v19 += 7;
          v15 = v20++ >= 9;
          if (v15)
          {
            LODWORD(v21) = 0;
            goto LABEL_182;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_180:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_182:
        v146 = 108;
        goto LABEL_235;
      case 2u:
        v26 = 0;
        v27 = 0;
        v21 = 0;
        while (2)
        {
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          v30 = v29 + 1;
          if (v29 == -1 || v30 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
            *(_QWORD *)(a2 + v28) = v30;
            v21 |= (unint64_t)(v31 & 0x7F) << v26;
            if (v31 < 0)
            {
              v26 += 7;
              v15 = v27++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_186;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_186:
        v146 = 112;
        goto LABEL_235;
      case 3u:
        v32 = 0;
        v33 = 0;
        v21 = 0;
        while (2)
        {
          v34 = *v3;
          v35 = *(_QWORD *)(a2 + v34);
          v36 = v35 + 1;
          if (v35 == -1 || v36 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
            *(_QWORD *)(a2 + v34) = v36;
            v21 |= (unint64_t)(v37 & 0x7F) << v32;
            if (v37 < 0)
            {
              v32 += 7;
              v15 = v33++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_190;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_190:
        v146 = 192;
        goto LABEL_235;
      case 4u:
        v38 = 0;
        v39 = 0;
        v21 = 0;
        while (2)
        {
          v40 = *v3;
          v41 = *(_QWORD *)(a2 + v40);
          v42 = v41 + 1;
          if (v41 == -1 || v42 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v41);
            *(_QWORD *)(a2 + v40) = v42;
            v21 |= (unint64_t)(v43 & 0x7F) << v38;
            if (v43 < 0)
            {
              v38 += 7;
              v15 = v39++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_194;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_194:
        v146 = 136;
        goto LABEL_235;
      case 5u:
        v44 = 0;
        v45 = 0;
        v21 = 0;
        while (2)
        {
          v46 = *v3;
          v47 = *(_QWORD *)(a2 + v46);
          v48 = v47 + 1;
          if (v47 == -1 || v48 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v49 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v47);
            *(_QWORD *)(a2 + v46) = v48;
            v21 |= (unint64_t)(v49 & 0x7F) << v44;
            if (v49 < 0)
            {
              v44 += 7;
              v15 = v45++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_198;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_198:
        v146 = 76;
        goto LABEL_235;
      case 6u:
        *(_WORD *)(a1 + 204) |= 1u;
        v50 = *v3;
        v51 = *(_QWORD *)(a2 + v50);
        if (v51 <= 0xFFFFFFFFFFFFFFF7 && v51 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v52 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v51);
          *(_QWORD *)(a2 + v50) = v51 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v52 = 0;
        }
        v156 = 32;
        goto LABEL_267;
      case 7u:
        *(_WORD *)(a1 + 204) |= 2u;
        v53 = *v3;
        v54 = *(_QWORD *)(a2 + v53);
        if (v54 <= 0xFFFFFFFFFFFFFFF7 && v54 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v52 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v54);
          *(_QWORD *)(a2 + v53) = v54 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v52 = 0;
        }
        v156 = 40;
        goto LABEL_267;
      case 8u:
        v55 = 0;
        v56 = 0;
        v21 = 0;
        *(_WORD *)(a1 + 204) |= 0x4000u;
        while (2)
        {
          v57 = *v3;
          v58 = *(_QWORD *)(a2 + v57);
          v59 = v58 + 1;
          if (v58 == -1 || v59 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v60 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v58);
            *(_QWORD *)(a2 + v57) = v59;
            v21 |= (unint64_t)(v60 & 0x7F) << v55;
            if (v60 < 0)
            {
              v55 += 7;
              v15 = v56++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_202;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_202:
        v146 = 196;
        goto LABEL_235;
      case 9u:
        PBReaderReadString();
        v61 = objc_claimAutoreleasedReturnValue();
        v62 = 168;
        goto LABEL_178;
      case 0xAu:
        *(_WORD *)(a1 + 204) |= 4u;
        v63 = *v3;
        v64 = *(_QWORD *)(a2 + v63);
        if (v64 <= 0xFFFFFFFFFFFFFFF7 && v64 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v52 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v64);
          *(_QWORD *)(a2 + v63) = v64 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v52 = 0;
        }
        v156 = 48;
        goto LABEL_267;
      case 0xBu:
        *(_WORD *)(a1 + 204) |= 8u;
        v65 = *v3;
        v66 = *(_QWORD *)(a2 + v65);
        if (v66 <= 0xFFFFFFFFFFFFFFF7 && v66 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v52 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v66);
          *(_QWORD *)(a2 + v65) = v66 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v52 = 0;
        }
        v156 = 56;
LABEL_267:
        *(_QWORD *)(a1 + v156) = v52;
        goto LABEL_268;
      case 0xCu:
        v67 = 0;
        v68 = 0;
        v21 = 0;
        *(_WORD *)(a1 + 204) |= 0x10u;
        while (2)
        {
          v69 = *v3;
          v70 = *(_QWORD *)(a2 + v69);
          v71 = v70 + 1;
          if (v70 == -1 || v71 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v72 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v70);
            *(_QWORD *)(a2 + v69) = v71;
            v21 |= (unint64_t)(v72 & 0x7F) << v67;
            if (v72 < 0)
            {
              v67 += 7;
              v15 = v68++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_206;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_206:
        v146 = 72;
        goto LABEL_235;
      case 0xDu:
        v73 = 0;
        v74 = 0;
        v21 = 0;
        *(_WORD *)(a1 + 204) |= 0x800u;
        while (2)
        {
          v75 = *v3;
          v76 = *(_QWORD *)(a2 + v75);
          v77 = v76 + 1;
          if (v76 == -1 || v77 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v78 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v76);
            *(_QWORD *)(a2 + v75) = v77;
            v21 |= (unint64_t)(v78 & 0x7F) << v73;
            if (v78 < 0)
            {
              v73 += 7;
              v15 = v74++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_210;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_210:
        v146 = 156;
        goto LABEL_235;
      case 0xEu:
        v79 = 0;
        v80 = 0;
        v21 = 0;
        *(_WORD *)(a1 + 204) |= 0x20u;
        while (2)
        {
          v81 = *v3;
          v82 = *(_QWORD *)(a2 + v81);
          v83 = v82 + 1;
          if (v82 == -1 || v83 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v84 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v82);
            *(_QWORD *)(a2 + v81) = v83;
            v21 |= (unint64_t)(v84 & 0x7F) << v79;
            if (v84 < 0)
            {
              v79 += 7;
              v15 = v80++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_214;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_214:
        v146 = 80;
        goto LABEL_235;
      case 0xFu:
        v85 = 0;
        v86 = 0;
        v21 = 0;
        *(_WORD *)(a1 + 204) |= 0x400u;
        while (2)
        {
          v87 = *v3;
          v88 = *(_QWORD *)(a2 + v87);
          v89 = v88 + 1;
          if (v88 == -1 || v89 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v90 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v88);
            *(_QWORD *)(a2 + v87) = v89;
            v21 |= (unint64_t)(v90 & 0x7F) << v85;
            if (v90 < 0)
            {
              v85 += 7;
              v15 = v86++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_218;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_218:
        v146 = 152;
        goto LABEL_235;
      case 0x10u:
        v91 = 0;
        v92 = 0;
        v21 = 0;
        *(_WORD *)(a1 + 204) |= 0x40u;
        while (2)
        {
          v93 = *v3;
          v94 = *(_QWORD *)(a2 + v93);
          v95 = v94 + 1;
          if (v94 == -1 || v95 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v96 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v94);
            *(_QWORD *)(a2 + v93) = v95;
            v21 |= (unint64_t)(v96 & 0x7F) << v91;
            if (v96 < 0)
            {
              v91 += 7;
              v15 = v92++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_222;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_222:
        v146 = 84;
        goto LABEL_235;
      case 0x11u:
        v97 = objc_alloc_init(CLPLocation);
        objc_storeStrong((id *)(a1 + 96), v97);
        if (!PBReaderPlaceMark() || (CLPLocationReadFrom((uint64_t)v97, a2) & 1) == 0)
          goto LABEL_271;
        goto LABEL_169;
      case 0x12u:
        PBReaderReadString();
        v61 = objc_claimAutoreleasedReturnValue();
        v62 = 64;
        goto LABEL_178;
      case 0x13u:
        v98 = 0;
        v99 = 0;
        v21 = 0;
        *(_WORD *)(a1 + 204) |= 0x2000u;
        while (2)
        {
          v100 = *v3;
          v101 = *(_QWORD *)(a2 + v100);
          v102 = v101 + 1;
          if (v101 == -1 || v102 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v103 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v101);
            *(_QWORD *)(a2 + v100) = v102;
            v21 |= (unint64_t)(v103 & 0x7F) << v98;
            if (v103 < 0)
            {
              v98 += 7;
              v15 = v99++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_226;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_226:
        v146 = 176;
        goto LABEL_235;
      case 0x14u:
        PBReaderReadString();
        v61 = objc_claimAutoreleasedReturnValue();
        v62 = 144;
        goto LABEL_178;
      case 0x15u:
        v104 = 0;
        v105 = 0;
        v21 = 0;
        *(_WORD *)(a1 + 204) |= 0x200u;
        while (2)
        {
          v106 = *v3;
          v107 = *(_QWORD *)(a2 + v106);
          v108 = v107 + 1;
          if (v107 == -1 || v108 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v109 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v107);
            *(_QWORD *)(a2 + v106) = v108;
            v21 |= (unint64_t)(v109 & 0x7F) << v104;
            if (v109 < 0)
            {
              v104 += 7;
              v15 = v105++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_230;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_230:
        v146 = 104;
        goto LABEL_235;
      case 0x16u:
        v110 = 0;
        v111 = 0;
        v21 = 0;
        *(_WORD *)(a1 + 204) |= 0x80u;
        while (2)
        {
          v112 = *v3;
          v113 = *(_QWORD *)(a2 + v112);
          v114 = v113 + 1;
          if (v113 == -1 || v114 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v115 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v113);
            *(_QWORD *)(a2 + v112) = v114;
            v21 |= (unint64_t)(v115 & 0x7F) << v110;
            if (v115 < 0)
            {
              v110 += 7;
              v15 = v111++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_234;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_234:
        v146 = 88;
LABEL_235:
        *(_DWORD *)(a1 + v146) = v21;
        goto LABEL_268;
      case 0x17u:
        if (v17 == 2)
        {
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
          {
            v117 = 0;
            v118 = 0;
            v119 = 0;
            while (1)
            {
              v120 = *v3;
              v121 = *(_QWORD *)(a2 + v120);
              v122 = v121 + 1;
              if (v121 == -1 || v122 > *(_QWORD *)(a2 + *v4))
                break;
              v123 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v121);
              *(_QWORD *)(a2 + v120) = v122;
              v119 |= (unint64_t)(v123 & 0x7F) << v117;
              if (v123 < 0)
              {
                v117 += 7;
                v15 = v118++ >= 9;
                if (!v15)
                  continue;
              }
              goto LABEL_147;
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_147:
            PBRepeatedInt32Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          v149 = 0;
          v150 = 0;
          v151 = 0;
          while (1)
          {
            v152 = *v3;
            v153 = *(_QWORD *)(a2 + v152);
            v154 = v153 + 1;
            if (v153 == -1 || v154 > *(_QWORD *)(a2 + *v4))
              break;
            v155 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v153);
            *(_QWORD *)(a2 + v152) = v154;
            v151 |= (unint64_t)(v155 & 0x7F) << v149;
            if (v155 < 0)
            {
              v149 += 7;
              v15 = v150++ >= 9;
              if (!v15)
                continue;
            }
            goto LABEL_258;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_258:
          PBRepeatedInt32Add();
        }
        goto LABEL_268;
      case 0x19u:
        v124 = 0;
        v125 = 0;
        v126 = 0;
        *(_WORD *)(a1 + 204) |= 0x100u;
        while (2)
        {
          v127 = *v3;
          v128 = *(_QWORD *)(a2 + v127);
          v129 = v128 + 1;
          if (v128 == -1 || v129 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v130 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v128);
            *(_QWORD *)(a2 + v127) = v129;
            v126 |= (unint64_t)(v130 & 0x7F) << v124;
            if (v130 < 0)
            {
              v124 += 7;
              v15 = v125++ >= 9;
              if (v15)
              {
                LODWORD(v126) = 0;
                goto LABEL_239;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v126) = 0;
LABEL_239:
        v147 = -(v126 & 1) ^ ((int)v126 >> 1);
        v148 = 92;
        goto LABEL_244;
      case 0x1Au:
        v131 = 0;
        v132 = 0;
        v133 = 0;
        *(_WORD *)(a1 + 204) |= 0x1000u;
        while (2)
        {
          v134 = *v3;
          v135 = *(_QWORD *)(a2 + v134);
          v136 = v135 + 1;
          if (v135 == -1 || v136 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v137 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v135);
            *(_QWORD *)(a2 + v134) = v136;
            v133 |= (unint64_t)(v137 & 0x7F) << v131;
            if (v137 < 0)
            {
              v131 += 7;
              v15 = v132++ >= 9;
              if (v15)
              {
                LODWORD(v133) = 0;
                goto LABEL_243;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v133) = 0;
LABEL_243:
        v147 = -(v133 & 1) ^ ((int)v133 >> 1);
        v148 = 160;
LABEL_244:
        *(_DWORD *)(a1 + v148) = v147;
        goto LABEL_268;
      case 0x1Eu:
        v97 = objc_alloc_init(CLPCdmaCellNeighbor);
        objc_msgSend((id)a1, "addNeighbor:", v97);
        if (!PBReaderPlaceMark() || !CLPCdmaCellNeighborReadFrom((uint64_t)v97, a2))
          goto LABEL_271;
        goto LABEL_169;
      case 0x1Fu:
        v97 = objc_alloc_init(CLPCellNeighborsGroup);
        objc_storeStrong((id *)(a1 + 120), v97);
        if (PBReaderPlaceMark() && CLPCellNeighborsGroupReadFrom(v97, a2))
        {
LABEL_169:
          PBReaderRecallMark();

LABEL_268:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_271:

        return 0;
      case 0x20u:
        v138 = 0;
        v139 = 0;
        v140 = 0;
        *(_WORD *)(a1 + 204) |= 0x8000u;
        while (2)
        {
          v141 = *v3;
          v142 = *(_QWORD *)(a2 + v141);
          v143 = v142 + 1;
          if (v142 == -1 || v143 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v144 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v142);
            *(_QWORD *)(a2 + v141) = v143;
            v140 |= (unint64_t)(v144 & 0x7F) << v138;
            if (v144 < 0)
            {
              v138 += 7;
              v15 = v139++ >= 9;
              if (v15)
              {
                v140 = 0;
                goto LABEL_248;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v140 = 0;
LABEL_248:
        *(_BYTE *)(a1 + 200) = v140 != 0;
        goto LABEL_268;
      case 0x21u:
        PBReaderReadString();
        v61 = objc_claimAutoreleasedReturnValue();
        v62 = 184;
LABEL_178:
        v145 = *(void **)(a1 + v62);
        *(_QWORD *)(a1 + v62) = v61;

        goto LABEL_268;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_268;
    }
  }
}

BOOL CLPCellNeighborsGroupReadFrom(void *a1, uint64_t a2)
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
  CLPCellNeighbor *v18;

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
        v18 = objc_alloc_init(CLPCellNeighbor);
        objc_msgSend(a1, "addGsmNeighbors:", v18);
        goto LABEL_23;
      case 2u:
        v18 = objc_alloc_init(CLPCellNeighbor);
        objc_msgSend(a1, "addScdmaNeighbors:", v18);
LABEL_23:
        if (!PBReaderPlaceMark() || !CLPCellNeighborReadFrom((uint64_t)v18, a2))
          goto LABEL_38;
        goto LABEL_34;
      case 3u:
        v18 = objc_alloc_init(CLPCdmaCellNeighbor);
        objc_msgSend(a1, "addCdmaNeighbors:", v18);
        if (!PBReaderPlaceMark() || !CLPCdmaCellNeighborReadFrom((uint64_t)v18, a2))
          goto LABEL_38;
        goto LABEL_34;
      case 4u:
        v18 = objc_alloc_init(CLPLteCellNeighbor);
        objc_msgSend(a1, "addLteNeighbors:", v18);
        if (!PBReaderPlaceMark() || !CLPLteCellNeighborReadFrom((uint64_t)v18, a2))
          goto LABEL_38;
        goto LABEL_34;
      case 5u:
        v18 = objc_alloc_init(CLPNRCellNeighbor);
        objc_msgSend(a1, "addNrNeighbors:", v18);
        if (PBReaderPlaceMark() && CLPNRCellNeighborReadFrom((uint64_t)v18, a2))
        {
LABEL_34:
          PBReaderRecallMark();

LABEL_35:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_38:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_35;
    }
  }
}

BOOL CLPCellNeighborReadFrom(uint64_t a1, uint64_t a2)
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
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  BOOL v25;
  int *v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  char v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  char v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char v50;

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
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 28) |= 0x10u;
          while (1)
          {
            v21 = *v3;
            v22 = *(_QWORD *)(a2 + v21);
            v23 = v22 + 1;
            if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
            {
              v26 = &OBJC_IVAR___CLPCellNeighbor__uarfcn;
              goto LABEL_61;
            }
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v23;
            v20 |= (unint64_t)(v24 & 0x7F) << v18;
            if ((v24 & 0x80) == 0)
              break;
            v18 += 7;
            v25 = v19++ > 8;
            if (v25)
            {
              LODWORD(v20) = 0;
              v26 = &OBJC_IVAR___CLPCellNeighbor__uarfcn;
              goto LABEL_64;
            }
          }
          v26 = &OBJC_IVAR___CLPCellNeighbor__uarfcn;
          goto LABEL_62;
        case 2u:
          v27 = 0;
          v28 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 28) |= 2u;
          while (2)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            v31 = v30 + 1;
            if (v30 == -1 || v31 > *(_QWORD *)(a2 + *v4))
            {
              v26 = &OBJC_IVAR___CLPCellNeighbor__psc;
              goto LABEL_61;
            }
            v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
            *(_QWORD *)(a2 + v29) = v31;
            v20 |= (unint64_t)(v32 & 0x7F) << v27;
            if (v32 < 0)
            {
              v27 += 7;
              v25 = v28++ > 8;
              if (v25)
              {
                LODWORD(v20) = 0;
                v26 = &OBJC_IVAR___CLPCellNeighbor__psc;
                goto LABEL_64;
              }
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___CLPCellNeighbor__psc;
          goto LABEL_62;
        case 3u:
          v33 = 0;
          v34 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 28) |= 8u;
          while (2)
          {
            v35 = *v3;
            v36 = *(_QWORD *)(a2 + v35);
            v37 = v36 + 1;
            if (v36 == -1 || v37 > *(_QWORD *)(a2 + *v4))
            {
              v26 = &OBJC_IVAR___CLPCellNeighbor__rssi;
              goto LABEL_61;
            }
            v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
            *(_QWORD *)(a2 + v35) = v37;
            v20 |= (unint64_t)(v38 & 0x7F) << v33;
            if (v38 < 0)
            {
              v33 += 7;
              v25 = v34++ > 8;
              if (v25)
              {
                LODWORD(v20) = 0;
                v26 = &OBJC_IVAR___CLPCellNeighbor__rssi;
                goto LABEL_64;
              }
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___CLPCellNeighbor__rssi;
          goto LABEL_62;
        case 4u:
          v39 = 0;
          v40 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 28) |= 1u;
          while (2)
          {
            v41 = *v3;
            v42 = *(_QWORD *)(a2 + v41);
            v43 = v42 + 1;
            if (v42 == -1 || v43 > *(_QWORD *)(a2 + *v4))
            {
              v26 = &OBJC_IVAR___CLPCellNeighbor__ecn0;
              goto LABEL_61;
            }
            v44 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
            *(_QWORD *)(a2 + v41) = v43;
            v20 |= (unint64_t)(v44 & 0x7F) << v39;
            if (v44 < 0)
            {
              v39 += 7;
              v25 = v40++ > 8;
              if (v25)
              {
                LODWORD(v20) = 0;
                v26 = &OBJC_IVAR___CLPCellNeighbor__ecn0;
                goto LABEL_64;
              }
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___CLPCellNeighbor__ecn0;
          goto LABEL_62;
        case 5u:
          v45 = 0;
          v46 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 28) |= 4u;
          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) != 0)
            continue;
          return 0;
      }
      while (1)
      {
        v47 = *v3;
        v48 = *(_QWORD *)(a2 + v47);
        v49 = v48 + 1;
        if (v48 == -1 || v49 > *(_QWORD *)(a2 + *v4))
          break;
        v50 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v48);
        *(_QWORD *)(a2 + v47) = v49;
        v20 |= (unint64_t)(v50 & 0x7F) << v45;
        if ((v50 & 0x80) == 0)
        {
          v26 = &OBJC_IVAR___CLPCellNeighbor__rscp;
          goto LABEL_62;
        }
        v45 += 7;
        v25 = v46++ > 8;
        if (v25)
        {
          LODWORD(v20) = 0;
          v26 = &OBJC_IVAR___CLPCellNeighbor__rscp;
          goto LABEL_64;
        }
      }
      v26 = &OBJC_IVAR___CLPCellNeighbor__rscp;
LABEL_61:
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_62:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v20) = 0;
LABEL_64:
      *(_DWORD *)(a1 + *v26) = -(v20 & 1) ^ ((int)v20 >> 1);
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL CLPLteCellNeighborReadFrom(uint64_t a1, uint64_t a2)
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
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  char v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  int *v67;

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
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 40) |= 0x80u;
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
              goto LABEL_78;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              LODWORD(v20) = 0;
              goto LABEL_80;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_78:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_80:
          LODWORD(v20) = -(v20 & 1) ^ ((int)v20 >> 1);
          v67 = &OBJC_IVAR___CLPLteCellNeighbor__uarfcn;
          goto LABEL_109;
        case 2u:
          v25 = 0;
          v26 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 40) |= 0x10u;
          while (2)
          {
            v27 = *v3;
            v28 = *(_QWORD *)(a2 + v27);
            v29 = v28 + 1;
            if (v28 == -1 || v29 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
              *(_QWORD *)(a2 + v27) = v29;
              v20 |= (unint64_t)(v30 & 0x7F) << v25;
              if (v30 < 0)
              {
                v25 += 7;
                v15 = v26++ >= 9;
                if (v15)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_84;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_84:
          LODWORD(v20) = -(v20 & 1) ^ ((int)v20 >> 1);
          v67 = &OBJC_IVAR___CLPLteCellNeighbor__pid;
          goto LABEL_109;
        case 3u:
          v31 = 0;
          v32 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 40) |= 0x40u;
          while (2)
          {
            v33 = *v3;
            v34 = *(_QWORD *)(a2 + v33);
            v35 = v34 + 1;
            if (v34 == -1 || v35 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
              *(_QWORD *)(a2 + v33) = v35;
              v20 |= (unint64_t)(v36 & 0x7F) << v31;
              if (v36 < 0)
              {
                v31 += 7;
                v15 = v32++ >= 9;
                if (v15)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_88;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_88:
          LODWORD(v20) = -(v20 & 1) ^ ((int)v20 >> 1);
          v67 = &OBJC_IVAR___CLPLteCellNeighbor__rssi;
          goto LABEL_109;
        case 4u:
          v37 = 0;
          v38 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 40) |= 2u;
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
              v20 |= (unint64_t)(v42 & 0x7F) << v37;
              if (v42 < 0)
              {
                v37 += 7;
                v15 = v38++ >= 9;
                if (v15)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_92;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_92:
          LODWORD(v20) = -(v20 & 1) ^ ((int)v20 >> 1);
          v67 = &OBJC_IVAR___CLPLteCellNeighbor__ecn0;
          goto LABEL_109;
        case 5u:
          v43 = 0;
          v44 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 40) |= 0x20u;
          while (2)
          {
            v45 = *v3;
            v46 = *(_QWORD *)(a2 + v45);
            v47 = v46 + 1;
            if (v46 == -1 || v47 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v48 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v46);
              *(_QWORD *)(a2 + v45) = v47;
              v20 |= (unint64_t)(v48 & 0x7F) << v43;
              if (v48 < 0)
              {
                v43 += 7;
                v15 = v44++ >= 9;
                if (v15)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_96;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_96:
          LODWORD(v20) = -(v20 & 1) ^ ((int)v20 >> 1);
          v67 = &OBJC_IVAR___CLPLteCellNeighbor__rscp;
          goto LABEL_109;
        case 6u:
          v49 = 0;
          v50 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 40) |= 1u;
          while (2)
          {
            v51 = *v3;
            v52 = *(_QWORD *)(a2 + v51);
            v53 = v52 + 1;
            if (v52 == -1 || v53 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v54 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v52);
              *(_QWORD *)(a2 + v51) = v53;
              v20 |= (unint64_t)(v54 & 0x7F) << v49;
              if (v54 < 0)
              {
                v49 += 7;
                v15 = v50++ >= 9;
                if (v15)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_100;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_100:
          v67 = &OBJC_IVAR___CLPLteCellNeighbor__bandwidth;
          goto LABEL_109;
        case 7u:
          v55 = 0;
          v56 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 40) |= 8u;
          while (2)
          {
            v57 = *v3;
            v58 = *(_QWORD *)(a2 + v57);
            v59 = v58 + 1;
            if (v58 == -1 || v59 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v60 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v58);
              *(_QWORD *)(a2 + v57) = v59;
              v20 |= (unint64_t)(v60 & 0x7F) << v55;
              if (v60 < 0)
              {
                v55 += 7;
                v15 = v56++ >= 9;
                if (v15)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_104;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_104:
          v67 = &OBJC_IVAR___CLPLteCellNeighbor__neighborType;
          goto LABEL_109;
        case 8u:
          v61 = 0;
          v62 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 40) |= 4u;
          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) != 0)
            continue;
          return 0;
      }
      while (1)
      {
        v63 = *v3;
        v64 = *(_QWORD *)(a2 + v63);
        v65 = v64 + 1;
        if (v64 == -1 || v65 > *(_QWORD *)(a2 + *v4))
          break;
        v66 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v64);
        *(_QWORD *)(a2 + v63) = v65;
        v20 |= (unint64_t)(v66 & 0x7F) << v61;
        if ((v66 & 0x80) == 0)
          goto LABEL_106;
        v61 += 7;
        v15 = v62++ >= 9;
        if (v15)
        {
          LODWORD(v20) = 0;
          goto LABEL_108;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_106:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v20) = 0;
LABEL_108:
      v67 = &OBJC_IVAR___CLPLteCellNeighbor__maxThroughput;
LABEL_109:
      *(_DWORD *)(a1 + *v67) = v20;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL CLPNRCellNeighborReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int *v4;
  int *v5;
  int *v6;
  unint64_t v8;
  int *v9;
  int *v10;
  int *v11;
  int *v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  BOOL v20;
  int v21;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  int *v30;
  int *v31;
  uint64_t v32;
  unint64_t v33;
  int *v34;
  uint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  char v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  char v67;
  unsigned int v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char v72;
  char v73;
  unsigned int v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char v78;
  char v79;
  unsigned int v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  char v84;
  char v85;
  unsigned int v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  char v90;
  char v91;
  unsigned int v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  char v96;
  int *v97;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v8 = 0x1EFE30000uLL;
    v9 = &OBJC_IVAR___CLPNRCellNeighbor__nrarfcn;
    v10 = (int *)MEMORY[0x1E0D82BB8];
    v11 = &OBJC_IVAR___CLPNRCellNeighbor__pid;
    v12 = &OBJC_IVAR___CLPNRCellNeighbor__rssi;
    do
    {
      if (*(_BYTE *)(a2 + *v6))
        break;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      while (1)
      {
        v16 = *v4;
        v17 = *(_QWORD *)(a2 + v16);
        v18 = v17 + 1;
        if (v17 == -1 || v18 > *(_QWORD *)(a2 + *v5))
          break;
        v19 = *(_BYTE *)(*(_QWORD *)(a2 + *v10) + v17);
        *(_QWORD *)(a2 + v16) = v18;
        v15 |= (unint64_t)(v19 & 0x7F) << v13;
        if ((v19 & 0x80) == 0)
          goto LABEL_12;
        v13 += 7;
        v20 = v14++ >= 9;
        if (v20)
        {
          v15 = 0;
          v21 = *(unsigned __int8 *)(a2 + *v6);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v6) = 1;
LABEL_12:
      v21 = *(unsigned __int8 *)(a2 + *v6);
      if (*(_BYTE *)(a2 + *v6))
        v15 = 0;
LABEL_14:
      if (v21 || (v15 & 7) == 4)
        break;
      switch((v15 >> 3))
      {
        case 1u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          *(_WORD *)(a1 + *(int *)(v8 + 3664)) |= 0x20u;
          while (1)
          {
            v26 = *v4;
            v27 = *(_QWORD *)(a2 + v26);
            v28 = v27 + 1;
            if (v27 == -1 || v28 > *(_QWORD *)(a2 + *v5))
              break;
            v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v10) + v27);
            *(_QWORD *)(a2 + v26) = v28;
            v25 |= (unint64_t)(v29 & 0x7F) << v23;
            if ((v29 & 0x80) == 0)
              goto LABEL_99;
            v23 += 7;
            v20 = v24++ >= 9;
            if (v20)
            {
              LODWORD(v25) = 0;
              goto LABEL_101;
            }
          }
          *(_BYTE *)(a2 + *v6) = 1;
LABEL_99:
          if (*(_BYTE *)(a2 + *v6))
            LODWORD(v25) = 0;
LABEL_101:
          LODWORD(v25) = -(v25 & 1) ^ ((int)v25 >> 1);
          v97 = v9;
          goto LABEL_142;
        case 2u:
          v37 = 0;
          v38 = 0;
          v25 = 0;
          *(_WORD *)(a1 + *(int *)(v8 + 3664)) |= 0x40u;
          while (2)
          {
            v39 = *v4;
            v40 = *(_QWORD *)(a2 + v39);
            v41 = v40 + 1;
            if (v40 == -1 || v41 > *(_QWORD *)(a2 + *v5))
            {
              *(_BYTE *)(a2 + *v6) = 1;
            }
            else
            {
              v42 = *(_BYTE *)(*(_QWORD *)(a2 + *v10) + v40);
              *(_QWORD *)(a2 + v39) = v41;
              v25 |= (unint64_t)(v42 & 0x7F) << v37;
              if (v42 < 0)
              {
                v37 += 7;
                v20 = v38++ >= 9;
                if (v20)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_105;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v6))
            LODWORD(v25) = 0;
LABEL_105:
          LODWORD(v25) = -(v25 & 1) ^ ((int)v25 >> 1);
          v97 = v11;
          goto LABEL_142;
        case 3u:
          v43 = 0;
          v44 = 0;
          v25 = 0;
          *(_WORD *)(a1 + *(int *)(v8 + 3664)) |= 0x100u;
          while (2)
          {
            v45 = *v4;
            v46 = *(_QWORD *)(a2 + v45);
            v47 = v46 + 1;
            if (v46 == -1 || v47 > *(_QWORD *)(a2 + *v5))
            {
              *(_BYTE *)(a2 + *v6) = 1;
            }
            else
            {
              v48 = *(_BYTE *)(*(_QWORD *)(a2 + *v10) + v46);
              *(_QWORD *)(a2 + v45) = v47;
              v25 |= (unint64_t)(v48 & 0x7F) << v43;
              if (v48 < 0)
              {
                v43 += 7;
                v20 = v44++ >= 9;
                if (v20)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_109;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v6))
            LODWORD(v25) = 0;
LABEL_109:
          LODWORD(v25) = -(v25 & 1) ^ ((int)v25 >> 1);
          v97 = v12;
          goto LABEL_142;
        case 4u:
          v49 = 0;
          v50 = 0;
          v25 = 0;
          *(_WORD *)(a1 + *(int *)(v8 + 3664)) |= 4u;
          while (2)
          {
            v51 = *v4;
            v52 = *(_QWORD *)(a2 + v51);
            v53 = v52 + 1;
            if (v52 == -1 || v53 > *(_QWORD *)(a2 + *v5))
            {
              *(_BYTE *)(a2 + *v6) = 1;
            }
            else
            {
              v54 = *(_BYTE *)(*(_QWORD *)(a2 + *v10) + v52);
              *(_QWORD *)(a2 + v51) = v53;
              v25 |= (unint64_t)(v54 & 0x7F) << v49;
              if (v54 < 0)
              {
                v49 += 7;
                v20 = v50++ >= 9;
                if (v20)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_113;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v6))
            LODWORD(v25) = 0;
LABEL_113:
          LODWORD(v25) = -(v25 & 1) ^ ((int)v25 >> 1);
          v97 = &OBJC_IVAR___CLPNRCellNeighbor__ecn0;
          goto LABEL_142;
        case 5u:
          v55 = 0;
          v56 = 0;
          v25 = 0;
          *(_WORD *)(a1 + *(int *)(v8 + 3664)) |= 0x80u;
          while (2)
          {
            v57 = *v4;
            v58 = *(_QWORD *)(a2 + v57);
            v59 = v58 + 1;
            if (v58 == -1 || v59 > *(_QWORD *)(a2 + *v5))
            {
              *(_BYTE *)(a2 + *v6) = 1;
            }
            else
            {
              v60 = *(_BYTE *)(*(_QWORD *)(a2 + *v10) + v58);
              *(_QWORD *)(a2 + v57) = v59;
              v25 |= (unint64_t)(v60 & 0x7F) << v55;
              if (v60 < 0)
              {
                v55 += 7;
                v20 = v56++ >= 9;
                if (v20)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_117;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v6))
            LODWORD(v25) = 0;
LABEL_117:
          LODWORD(v25) = -(v25 & 1) ^ ((int)v25 >> 1);
          v97 = &OBJC_IVAR___CLPNRCellNeighbor__rscp;
          goto LABEL_142;
        case 6u:
          v61 = 0;
          v62 = 0;
          v25 = 0;
          *(_WORD *)(a1 + *(int *)(v8 + 3664)) |= 0x400u;
          while (2)
          {
            v63 = *v4;
            v64 = *(_QWORD *)(a2 + v63);
            v65 = v64 + 1;
            if (v64 == -1 || v65 > *(_QWORD *)(a2 + *v5))
            {
              *(_BYTE *)(a2 + *v6) = 1;
            }
            else
            {
              v66 = *(_BYTE *)(*(_QWORD *)(a2 + *v10) + v64);
              *(_QWORD *)(a2 + v63) = v65;
              v25 |= (unint64_t)(v66 & 0x7F) << v61;
              if (v66 < 0)
              {
                v61 += 7;
                v20 = v62++ >= 9;
                if (v20)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_121;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v6))
            LODWORD(v25) = 0;
LABEL_121:
          v97 = &OBJC_IVAR___CLPNRCellNeighbor__scs;
          goto LABEL_142;
        case 7u:
          v67 = 0;
          v68 = 0;
          v25 = 0;
          *(_WORD *)(a1 + *(int *)(v8 + 3664)) |= 0x200u;
          while (2)
          {
            v69 = *v4;
            v70 = *(_QWORD *)(a2 + v69);
            v71 = v70 + 1;
            if (v70 == -1 || v71 > *(_QWORD *)(a2 + *v5))
            {
              *(_BYTE *)(a2 + *v6) = 1;
            }
            else
            {
              v72 = *(_BYTE *)(*(_QWORD *)(a2 + *v10) + v70);
              *(_QWORD *)(a2 + v69) = v71;
              v25 |= (unint64_t)(v72 & 0x7F) << v67;
              if (v72 < 0)
              {
                v67 += 7;
                v20 = v68++ >= 9;
                if (v20)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_125;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v6))
            LODWORD(v25) = 0;
LABEL_125:
          v97 = &OBJC_IVAR___CLPNRCellNeighbor__saOrNsaNeighbor;
          goto LABEL_142;
        case 8u:
          v73 = 0;
          v74 = 0;
          v25 = 0;
          *(_WORD *)(a1 + *(int *)(v8 + 3664)) |= 1u;
          while (2)
          {
            v75 = *v4;
            v76 = *(_QWORD *)(a2 + v75);
            v77 = v76 + 1;
            if (v76 == -1 || v77 > *(_QWORD *)(a2 + *v5))
            {
              *(_BYTE *)(a2 + *v6) = 1;
            }
            else
            {
              v78 = *(_BYTE *)(*(_QWORD *)(a2 + *v10) + v76);
              *(_QWORD *)(a2 + v75) = v77;
              v25 |= (unint64_t)(v78 & 0x7F) << v73;
              if (v78 < 0)
              {
                v73 += 7;
                v20 = v74++ >= 9;
                if (v20)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_129;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v6))
            LODWORD(v25) = 0;
LABEL_129:
          v97 = &OBJC_IVAR___CLPNRCellNeighbor__bandwidth;
          goto LABEL_142;
        case 9u:
          v79 = 0;
          v80 = 0;
          v25 = 0;
          *(_WORD *)(a1 + *(int *)(v8 + 3664)) |= 0x10u;
          while (2)
          {
            v81 = *v4;
            v82 = *(_QWORD *)(a2 + v81);
            v83 = v82 + 1;
            if (v82 == -1 || v83 > *(_QWORD *)(a2 + *v5))
            {
              *(_BYTE *)(a2 + *v6) = 1;
            }
            else
            {
              v84 = *(_BYTE *)(*(_QWORD *)(a2 + *v10) + v82);
              *(_QWORD *)(a2 + v81) = v83;
              v25 |= (unint64_t)(v84 & 0x7F) << v79;
              if (v84 < 0)
              {
                v79 += 7;
                v20 = v80++ >= 9;
                if (v20)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_133;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v6))
            LODWORD(v25) = 0;
LABEL_133:
          v97 = &OBJC_IVAR___CLPNRCellNeighbor__neighborType;
          goto LABEL_142;
        case 0xAu:
          v85 = 0;
          v86 = 0;
          v25 = 0;
          *(_WORD *)(a1 + *(int *)(v8 + 3664)) |= 8u;
          while (2)
          {
            v87 = *v4;
            v88 = *(_QWORD *)(a2 + v87);
            v89 = v88 + 1;
            if (v88 == -1 || v89 > *(_QWORD *)(a2 + *v5))
            {
              *(_BYTE *)(a2 + *v6) = 1;
            }
            else
            {
              v90 = *(_BYTE *)(*(_QWORD *)(a2 + *v10) + v88);
              *(_QWORD *)(a2 + v87) = v89;
              v25 |= (unint64_t)(v90 & 0x7F) << v85;
              if (v90 < 0)
              {
                v85 += 7;
                v20 = v86++ >= 9;
                if (v20)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_137;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v6))
            LODWORD(v25) = 0;
LABEL_137:
          v97 = &OBJC_IVAR___CLPNRCellNeighbor__maxThroughput;
          goto LABEL_142;
        case 0xBu:
          v91 = 0;
          v92 = 0;
          v25 = 0;
          *(_WORD *)(a1 + *(int *)(v8 + 3664)) |= 2u;
          break;
        default:
          v30 = v9;
          v31 = v11;
          v32 = v2;
          v33 = v8;
          v34 = v12;
          v35 = a1;
          v36 = PBReaderSkipValueWithTag();
          a1 = v35;
          v6 = (int *)MEMORY[0x1E0D82BC8];
          v12 = v34;
          v8 = v33;
          v2 = v32;
          v11 = v31;
          v9 = v30;
          if ((v36 & 1) != 0)
            continue;
          return 0;
      }
      while (1)
      {
        v93 = *v4;
        v94 = *(_QWORD *)(a2 + v93);
        v95 = v94 + 1;
        if (v94 == -1 || v95 > *(_QWORD *)(a2 + *v5))
          break;
        v96 = *(_BYTE *)(*(_QWORD *)(a2 + *v10) + v94);
        *(_QWORD *)(a2 + v93) = v95;
        v25 |= (unint64_t)(v96 & 0x7F) << v91;
        if ((v96 & 0x80) == 0)
          goto LABEL_139;
        v91 += 7;
        v20 = v92++ >= 9;
        if (v20)
        {
          LODWORD(v25) = 0;
          goto LABEL_141;
        }
      }
      *(_BYTE *)(a2 + *v6) = 1;
LABEL_139:
      if (*(_BYTE *)(a2 + *v6))
        LODWORD(v25) = 0;
LABEL_141:
      v97 = &OBJC_IVAR___CLPNRCellNeighbor__bwpSupport;
LABEL_142:
      *(_DWORD *)(a1 + *v97) = v25;
    }
    while (*(_QWORD *)(a2 + *v4) < *(_QWORD *)(a2 + *v5));
  }
  return *(_BYTE *)(a2 + *v6) == 0;
}

uint64_t CLPCellOutOfServiceInfoReadFrom(uint64_t a1, uint64_t a2)
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
  CLPLocation *v18;
  uint64_t result;
  uint64_t v20;
  void *v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  BOOL v36;
  uint64_t v37;

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
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v18 = objc_alloc_init(CLPLocation);
          objc_storeStrong((id *)(a1 + 8), v18);
          if (PBReaderPlaceMark() && (CLPLocationReadFrom((uint64_t)v18, a2) & 1) != 0)
          {
            PBReaderRecallMark();

            continue;
          }

          return 0;
        case 2u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = *(void **)(a1 + 16);
          *(_QWORD *)(a1 + 16) = v20;

          continue;
        case 3u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          *(_BYTE *)(a1 + 28) |= 2u;
          while (2)
          {
            v25 = *v3;
            v26 = *(_QWORD *)(a2 + v25);
            v27 = v26 + 1;
            if (v26 == -1 || v27 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v26);
              *(_QWORD *)(a2 + v25) = v27;
              v24 |= (unint64_t)(v28 & 0x7F) << v22;
              if (v28 < 0)
              {
                v22 += 7;
                v15 = v23++ >= 9;
                if (v15)
                {
                  v24 = 0;
                  goto LABEL_42;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v24 = 0;
LABEL_42:
          v36 = v24 != 0;
          v37 = 25;
          goto LABEL_47;
        case 4u:
          v29 = 0;
          v30 = 0;
          v31 = 0;
          *(_BYTE *)(a1 + 28) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v32 = *v3;
        v33 = *(_QWORD *)(a2 + v32);
        v34 = v33 + 1;
        if (v33 == -1 || v34 > *(_QWORD *)(a2 + *v4))
          break;
        v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
        *(_QWORD *)(a2 + v32) = v34;
        v31 |= (unint64_t)(v35 & 0x7F) << v29;
        if ((v35 & 0x80) == 0)
          goto LABEL_44;
        v29 += 7;
        v15 = v30++ >= 9;
        if (v15)
        {
          v31 = 0;
          goto LABEL_46;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_44:
      if (*(_BYTE *)(a2 + *v5))
        v31 = 0;
LABEL_46:
      v36 = v31 != 0;
      v37 = 24;
LABEL_47:
      *(_BYTE *)(a1 + v37) = v36;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPCellTowerLocationReadFrom(uint64_t a1, uint64_t a2)
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
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  CLPLocation *v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  unsigned int v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char v69;
  char v70;
  unsigned int v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  char v75;
  uint64_t result;
  char v77;
  unsigned int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char v83;
  char v84;
  unsigned int v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  char v90;
  char v91;
  unsigned int v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  char v96;
  char v97;
  unsigned int v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char v103;
  void *v104;
  char v105;
  unsigned int v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  char v111;
  char v112;
  unsigned int v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  char v118;
  uint64_t v119;
  int v120;
  uint64_t v121;
  BOOL v122;
  uint64_t v123;

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
            goto LABEL_140;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_142;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_140:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_142:
        v119 = 40;
        goto LABEL_188;
      case 2u:
        v25 = 0;
        v26 = 0;
        v20 = 0;
        while (2)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          v29 = v28 + 1;
          if (v28 == -1 || v29 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
            *(_QWORD *)(a2 + v27) = v29;
            v20 |= (unint64_t)(v30 & 0x7F) << v25;
            if (v30 < 0)
            {
              v25 += 7;
              v15 = v26++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_146;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_146:
        v119 = 44;
        goto LABEL_188;
      case 3u:
        v31 = 0;
        v32 = 0;
        v20 = 0;
        while (2)
        {
          v33 = *v3;
          v34 = *(_QWORD *)(a2 + v33);
          v35 = v34 + 1;
          if (v34 == -1 || v35 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
            *(_QWORD *)(a2 + v33) = v35;
            v20 |= (unint64_t)(v36 & 0x7F) << v31;
            if (v36 < 0)
            {
              v31 += 7;
              v15 = v32++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_150;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_150:
        v119 = 28;
        goto LABEL_188;
      case 4u:
        v37 = 0;
        v38 = 0;
        v20 = 0;
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
            v20 |= (unint64_t)(v42 & 0x7F) << v37;
            if (v42 < 0)
            {
              v37 += 7;
              v15 = v38++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_154;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_154:
        v119 = 20;
        goto LABEL_188;
      case 5u:
        v43 = 0;
        v44 = 0;
        v20 = 0;
        while (2)
        {
          v45 = *v3;
          v46 = *(_QWORD *)(a2 + v45);
          v47 = v46 + 1;
          if (v46 == -1 || v47 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v48 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v46);
            *(_QWORD *)(a2 + v45) = v47;
            v20 |= (unint64_t)(v48 & 0x7F) << v43;
            if (v48 < 0)
            {
              v43 += 7;
              v15 = v44++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_158;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_158:
        v119 = 84;
        goto LABEL_188;
      case 6u:
        v49 = 0;
        v50 = 0;
        v20 = 0;
        *(_WORD *)(a1 + 112) |= 1u;
        while (2)
        {
          v51 = *v3;
          v52 = *(_QWORD *)(a2 + v51);
          v53 = v52 + 1;
          if (v52 == -1 || v53 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v54 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v52);
            *(_QWORD *)(a2 + v51) = v53;
            v20 |= (unint64_t)(v54 & 0x7F) << v49;
            if (v54 < 0)
            {
              v49 += 7;
              v15 = v50++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_162;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_162:
        v119 = 16;
        goto LABEL_188;
      case 7u:
        v55 = 0;
        v56 = 0;
        v20 = 0;
        *(_WORD *)(a1 + 112) |= 4u;
        while (2)
        {
          v57 = *v3;
          v58 = *(_QWORD *)(a2 + v57);
          v59 = v58 + 1;
          if (v58 == -1 || v59 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v60 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v58);
            *(_QWORD *)(a2 + v57) = v59;
            v20 |= (unint64_t)(v60 & 0x7F) << v55;
            if (v60 < 0)
            {
              v55 += 7;
              v15 = v56++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_166;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_166:
        v119 = 72;
        goto LABEL_188;
      case 8u:
        v61 = objc_alloc_init(CLPLocation);
        objc_storeStrong((id *)(a1 + 32), v61);
        if (!PBReaderPlaceMark() || (CLPLocationReadFrom((uint64_t)v61, a2) & 1) == 0)
          goto LABEL_204;
        goto LABEL_115;
      case 9u:
        PBReaderReadString();
        v62 = objc_claimAutoreleasedReturnValue();
        v63 = 8;
        goto LABEL_124;
      case 0xAu:
        v64 = 0;
        v65 = 0;
        v20 = 0;
        *(_WORD *)(a1 + 112) |= 0x20u;
        while (2)
        {
          v66 = *v3;
          v67 = *(_QWORD *)(a2 + v66);
          v68 = v67 + 1;
          if (v67 == -1 || v68 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v69 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v67);
            *(_QWORD *)(a2 + v66) = v68;
            v20 |= (unint64_t)(v69 & 0x7F) << v64;
            if (v69 < 0)
            {
              v64 += 7;
              v15 = v65++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_170;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_170:
        v119 = 88;
        goto LABEL_188;
      case 0xBu:
        v70 = 0;
        v71 = 0;
        v20 = 0;
        *(_WORD *)(a1 + 112) |= 0x40u;
        while (2)
        {
          v72 = *v3;
          v73 = *(_QWORD *)(a2 + v72);
          v74 = v73 + 1;
          if (v73 == -1 || v74 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v75 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v73);
            *(_QWORD *)(a2 + v72) = v74;
            v20 |= (unint64_t)(v75 & 0x7F) << v70;
            if (v75 < 0)
            {
              v70 += 7;
              v15 = v71++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_174;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_174:
        v119 = 104;
        goto LABEL_188;
      case 0xCu:
        PBReaderReadString();
        v62 = objc_claimAutoreleasedReturnValue();
        v63 = 64;
        goto LABEL_124;
      case 0xFu:
        v77 = 0;
        v78 = 0;
        v79 = 0;
        *(_WORD *)(a1 + 112) |= 2u;
        while (2)
        {
          v80 = *v3;
          v81 = *(_QWORD *)(a2 + v80);
          v82 = v81 + 1;
          if (v81 == -1 || v82 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v83 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v81);
            *(_QWORD *)(a2 + v80) = v82;
            v79 |= (unint64_t)(v83 & 0x7F) << v77;
            if (v83 < 0)
            {
              v77 += 7;
              v15 = v78++ >= 9;
              if (v15)
              {
                LODWORD(v79) = 0;
                goto LABEL_178;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v79) = 0;
LABEL_178:
        v120 = -(v79 & 1) ^ ((int)v79 >> 1);
        v121 = 24;
        goto LABEL_183;
      case 0x10u:
        v84 = 0;
        v85 = 0;
        v86 = 0;
        *(_WORD *)(a1 + 112) |= 0x10u;
        while (2)
        {
          v87 = *v3;
          v88 = *(_QWORD *)(a2 + v87);
          v89 = v88 + 1;
          if (v88 == -1 || v89 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v90 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v88);
            *(_QWORD *)(a2 + v87) = v89;
            v86 |= (unint64_t)(v90 & 0x7F) << v84;
            if (v90 < 0)
            {
              v84 += 7;
              v15 = v85++ >= 9;
              if (v15)
              {
                LODWORD(v86) = 0;
                goto LABEL_182;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v86) = 0;
LABEL_182:
        v120 = -(v86 & 1) ^ ((int)v86 >> 1);
        v121 = 80;
LABEL_183:
        *(_DWORD *)(a1 + v121) = v120;
        goto LABEL_202;
      case 0x11u:
        v91 = 0;
        v92 = 0;
        v20 = 0;
        *(_WORD *)(a1 + 112) |= 8u;
        while (2)
        {
          v93 = *v3;
          v94 = *(_QWORD *)(a2 + v93);
          v95 = v94 + 1;
          if (v94 == -1 || v95 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v96 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v94);
            *(_QWORD *)(a2 + v93) = v95;
            v20 |= (unint64_t)(v96 & 0x7F) << v91;
            if (v96 < 0)
            {
              v91 += 7;
              v15 = v92++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_187;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_187:
        v119 = 76;
LABEL_188:
        *(_DWORD *)(a1 + v119) = v20;
        goto LABEL_202;
      case 0x14u:
        v61 = objc_alloc_init(CLPCellNeighbor);
        objc_msgSend((id)a1, "addNeighbor:", v61);
        if (!PBReaderPlaceMark() || !CLPCellNeighborReadFrom((uint64_t)v61, a2))
          goto LABEL_204;
        goto LABEL_115;
      case 0x15u:
        v61 = objc_alloc_init(CLPCellNeighborsGroup);
        objc_storeStrong((id *)(a1 + 48), v61);
        if (PBReaderPlaceMark() && CLPCellNeighborsGroupReadFrom(v61, a2))
        {
LABEL_115:
          PBReaderRecallMark();

LABEL_202:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_204:

        return 0;
      case 0x16u:
        v97 = 0;
        v98 = 0;
        v99 = 0;
        *(_WORD *)(a1 + 112) |= 0x100u;
        while (2)
        {
          v100 = *v3;
          v101 = *(_QWORD *)(a2 + v100);
          v102 = v101 + 1;
          if (v101 == -1 || v102 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v103 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v101);
            *(_QWORD *)(a2 + v100) = v102;
            v99 |= (unint64_t)(v103 & 0x7F) << v97;
            if (v103 < 0)
            {
              v97 += 7;
              v15 = v98++ >= 9;
              if (v15)
              {
                v99 = 0;
                goto LABEL_192;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v99 = 0;
LABEL_192:
        v122 = v99 != 0;
        v123 = 109;
        goto LABEL_201;
      case 0x17u:
        PBReaderReadString();
        v62 = objc_claimAutoreleasedReturnValue();
        v63 = 96;
LABEL_124:
        v104 = *(void **)(a1 + v63);
        *(_QWORD *)(a1 + v63) = v62;

        goto LABEL_202;
      case 0x18u:
        v105 = 0;
        v106 = 0;
        v107 = 0;
        *(_WORD *)(a1 + 112) |= 0x200u;
        while (2)
        {
          v108 = *v3;
          v109 = *(_QWORD *)(a2 + v108);
          v110 = v109 + 1;
          if (v109 == -1 || v110 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v111 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v109);
            *(_QWORD *)(a2 + v108) = v110;
            v107 |= (unint64_t)(v111 & 0x7F) << v105;
            if (v111 < 0)
            {
              v105 += 7;
              v15 = v106++ >= 9;
              if (v15)
              {
                v107 = 0;
                goto LABEL_196;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v107 = 0;
LABEL_196:
        v122 = v107 != 0;
        v123 = 110;
        goto LABEL_201;
      case 0x19u:
        v112 = 0;
        v113 = 0;
        v114 = 0;
        *(_WORD *)(a1 + 112) |= 0x80u;
        while (2)
        {
          v115 = *v3;
          v116 = *(_QWORD *)(a2 + v115);
          v117 = v116 + 1;
          if (v116 == -1 || v117 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v118 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v116);
            *(_QWORD *)(a2 + v115) = v117;
            v114 |= (unint64_t)(v118 & 0x7F) << v112;
            if (v118 < 0)
            {
              v112 += 7;
              v15 = v113++ >= 9;
              if (v15)
              {
                v114 = 0;
                goto LABEL_200;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v114 = 0;
LABEL_200:
        v122 = v114 != 0;
        v123 = 108;
LABEL_201:
        *(_BYTE *)(a1 + v123) = v122;
        goto LABEL_202;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_202;
    }
  }
}

BOOL CLPCellWifiCollectionRequestReadFrom(id *a1, uint64_t a2)
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
  CLPMeta *v18;

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
        v18 = objc_alloc_init(CLPMeta);
        objc_storeStrong(a1 + 5, v18);
        if (PBReaderPlaceMark() && (CLPMetaReadFrom((uint64_t)v18, a2) & 1) != 0)
          goto LABEL_44;
        goto LABEL_48;
      case 2u:
        v18 = objc_alloc_init(CLPCellTowerLocation);
        objc_msgSend(a1, "addCellTowerLocation:", v18);
        if (!PBReaderPlaceMark() || (CLPCellTowerLocationReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_48;
        goto LABEL_44;
      case 3u:
        v18 = objc_alloc_init(CLPWifiAPLocation);
        objc_msgSend(a1, "addWifiAPLocation:", v18);
        if (!PBReaderPlaceMark() || (CLPWifiAPLocationReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_48;
        goto LABEL_44;
      case 4u:
        v18 = objc_alloc_init(CLPCdmaCellTowerLocation);
        objc_msgSend(a1, "addCdmaCellTowerLocation:", v18);
        if (!PBReaderPlaceMark() || (CLPCdmaCellTowerLocationReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_48;
        goto LABEL_44;
      case 5u:
        v18 = objc_alloc_init(CLPLteCellTowerLocation);
        objc_msgSend(a1, "addLteCellTowerLocation:", v18);
        if (!PBReaderPlaceMark() || (CLPLteCellTowerLocationReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_48;
        goto LABEL_44;
      case 6u:
        v18 = objc_alloc_init(CLPSCdmaCellTowerLocation);
        objc_msgSend(a1, "addScdmaCellTowerLocation:", v18);
        if (!PBReaderPlaceMark() || (CLPSCdmaCellTowerLocationReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_48;
        goto LABEL_44;
      case 7u:
        v18 = objc_alloc_init(CLPCellOutOfServiceInfo);
        objc_msgSend(a1, "addCellOutOfServiceInfo:", v18);
        if (!PBReaderPlaceMark() || (CLPCellOutOfServiceInfoReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_48;
        goto LABEL_44;
      case 8u:
        v18 = objc_alloc_init(CLPNRCellTowerLocation);
        objc_msgSend(a1, "addNrCellTowerLocation:", v18);
        if (PBReaderPlaceMark() && (CLPNRCellTowerLocationReadFrom((uint64_t)v18, a2) & 1) != 0)
        {
LABEL_44:
          PBReaderRecallMark();

LABEL_45:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_48:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_45;
    }
  }
}

uint64_t CLPWifiAPLocationReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  int *v36;
  int *v37;
  CLPLocation *v38;
  void *v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  char v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  uint64_t v61;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = &OBJC_IVAR___CLPPrivacySanitization__tripSegmentType;
  v8 = (int *)MEMORY[0x1E0D82BB8];
  v9 = &OBJC_IVAR___CLPPrivacySanitization__tripSegmentType;
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    while (1)
    {
      v13 = *v3;
      v14 = *(_QWORD *)(a2 + v13);
      v15 = v14 + 1;
      if (v14 == -1 || v15 > *(_QWORD *)(a2 + *v4))
        break;
      v16 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v14);
      *(_QWORD *)(a2 + v13) = v15;
      v12 |= (unint64_t)(v16 & 0x7F) << v10;
      if ((v16 & 0x80) == 0)
        goto LABEL_12;
      v10 += 7;
      v17 = v11++ >= 9;
      if (v17)
      {
        v12 = 0;
        v18 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v18 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v12 = 0;
LABEL_14:
    if (v18 || (v12 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v12 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v7[56];
        goto LABEL_40;
      case 2u:
        v23 = 0;
        v24 = 0;
        v25 = 0;
        while (2)
        {
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          v28 = v27 + 1;
          if (v27 == -1 || v28 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v27);
            *(_QWORD *)(a2 + v26) = v28;
            v25 |= (unint64_t)(v29 & 0x7F) << v23;
            if (v29 < 0)
            {
              v23 += 7;
              v17 = v24++ >= 9;
              if (v17)
              {
                LODWORD(v25) = 0;
                goto LABEL_68;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v25) = 0;
LABEL_68:
        v61 = v9[57];
        goto LABEL_85;
      case 3u:
        v30 = 0;
        v31 = 0;
        v25 = 0;
        while (2)
        {
          v32 = *v3;
          v33 = *(_QWORD *)(a2 + v32);
          v34 = v33 + 1;
          if (v33 == -1 || v34 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v33);
            *(_QWORD *)(a2 + v32) = v34;
            v25 |= (unint64_t)(v35 & 0x7F) << v30;
            if (v35 < 0)
            {
              v30 += 7;
              v17 = v31++ >= 9;
              if (v17)
              {
                LODWORD(v25) = 0;
                goto LABEL_72;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v25) = 0;
LABEL_72:
        v61 = 48;
        goto LABEL_85;
      case 4u:
        v36 = v9;
        v37 = v7;
        v38 = objc_alloc_init(CLPLocation);
        objc_storeStrong((id *)(a1 + 32), v38);
        if (PBReaderPlaceMark() && (CLPLocationReadFrom((uint64_t)v38, a2) & 1) != 0)
        {
          PBReaderRecallMark();

          v7 = v37;
          v9 = v36;
LABEL_86:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 5u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 16;
LABEL_40:
        v39 = *(void **)(a1 + v21);
        *(_QWORD *)(a1 + v21) = v20;

        goto LABEL_86;
      case 6u:
        v40 = 0;
        v41 = 0;
        v25 = 0;
        *(_BYTE *)(a1 + 60) |= 8u;
        while (2)
        {
          v42 = *v3;
          v43 = *(_QWORD *)(a2 + v42);
          v44 = v43 + 1;
          if (v43 == -1 || v44 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v45 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v43);
            *(_QWORD *)(a2 + v42) = v44;
            v25 |= (unint64_t)(v45 & 0x7F) << v40;
            if (v45 < 0)
            {
              v40 += 7;
              v17 = v41++ >= 9;
              if (v17)
              {
                LODWORD(v25) = 0;
                goto LABEL_76;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v25) = 0;
LABEL_76:
        v61 = 56;
        goto LABEL_85;
      case 7u:
        v46 = 0;
        v47 = 0;
        v25 = 0;
        *(_BYTE *)(a1 + 60) |= 2u;
        while (2)
        {
          v48 = *v3;
          v49 = *(_QWORD *)(a2 + v48);
          v50 = v49 + 1;
          if (v49 == -1 || v50 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v51 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v49);
            *(_QWORD *)(a2 + v48) = v50;
            v25 |= (unint64_t)(v51 & 0x7F) << v46;
            if (v51 < 0)
            {
              v46 += 7;
              v17 = v47++ >= 9;
              if (v17)
              {
                LODWORD(v25) = 0;
                goto LABEL_80;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v25) = 0;
LABEL_80:
        v61 = 28;
        goto LABEL_85;
      case 8u:
        *(_BYTE *)(a1 + 60) |= 1u;
        v52 = *v3;
        v53 = *(_QWORD *)(a2 + v52);
        if (v53 <= 0xFFFFFFFFFFFFFFF7 && v53 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v54 = *(_QWORD *)(*(_QWORD *)(a2 + *v8) + v53);
          *(_QWORD *)(a2 + v52) = v53 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v54 = 0;
        }
        *(_QWORD *)(a1 + 8) = v54;
        goto LABEL_86;
      case 9u:
        v55 = 0;
        v56 = 0;
        v25 = 0;
        *(_BYTE *)(a1 + 60) |= 4u;
        while (2)
        {
          v57 = *v3;
          v58 = *(_QWORD *)(a2 + v57);
          v59 = v58 + 1;
          if (v58 == -1 || v59 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v60 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v58);
            *(_QWORD *)(a2 + v57) = v59;
            v25 |= (unint64_t)(v60 & 0x7F) << v55;
            if (v60 < 0)
            {
              v55 += 7;
              v17 = v56++ >= 9;
              if (v17)
              {
                LODWORD(v25) = 0;
                goto LABEL_84;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v25) = 0;
LABEL_84:
        v61 = 52;
LABEL_85:
        *(_DWORD *)(a1 + v61) = v25;
        goto LABEL_86;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_86;
    }
  }
}

uint64_t CLPLteCellTowerLocationReadFrom(uint64_t a1, uint64_t a2)
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
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  CLPLocation *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char v69;
  unsigned int v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  char v74;
  char v75;
  unsigned int v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char v81;
  char v82;
  unsigned int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  char v88;
  char v89;
  unsigned int v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  char v95;
  uint64_t result;
  char v97;
  unsigned int v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  char v102;
  char v103;
  unsigned int v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  char v109;
  char v110;
  unsigned int v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  char v115;
  char v116;
  unsigned int v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  char v121;
  char v122;
  unsigned int v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  char v128;
  char v129;
  unsigned int v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;
  char v134;
  char v135;
  unsigned int v136;
  uint64_t v137;
  uint64_t v138;
  unint64_t v139;
  char v140;
  char v141;
  unsigned int v142;
  uint64_t v143;
  uint64_t v144;
  unint64_t v145;
  char v146;
  char v147;
  unsigned int v148;
  uint64_t v149;
  uint64_t v150;
  unint64_t v151;
  char v152;
  char v153;
  unsigned int v154;
  uint64_t v155;
  uint64_t v156;
  unint64_t v157;
  char v158;
  char v159;
  unsigned int v160;
  uint64_t v161;
  uint64_t v162;
  unint64_t v163;
  char v164;
  char v165;
  unsigned int v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  unint64_t v170;
  char v171;
  char v172;
  unsigned int v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  unint64_t v177;
  char v178;
  void *v179;
  uint64_t v180;
  int v181;
  uint64_t v182;
  BOOL v183;
  uint64_t v184;
  uint64_t v185;

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
            goto LABEL_211;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_213;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_211:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_213:
        v180 = 84;
        goto LABEL_299;
      case 2u:
        v25 = 0;
        v26 = 0;
        v20 = 0;
        while (2)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          v29 = v28 + 1;
          if (v28 == -1 || v29 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
            *(_QWORD *)(a2 + v27) = v29;
            v20 |= (unint64_t)(v30 & 0x7F) << v25;
            if (v30 < 0)
            {
              v25 += 7;
              v15 = v26++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_217;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_217:
        v180 = 88;
        goto LABEL_299;
      case 3u:
        v31 = 0;
        v32 = 0;
        v20 = 0;
        while (2)
        {
          v33 = *v3;
          v34 = *(_QWORD *)(a2 + v33);
          v35 = v34 + 1;
          if (v34 == -1 || v35 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
            *(_QWORD *)(a2 + v33) = v35;
            v20 |= (unint64_t)(v36 & 0x7F) << v31;
            if (v36 < 0)
            {
              v31 += 7;
              v15 = v32++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_221;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_221:
        v180 = 168;
        goto LABEL_299;
      case 4u:
        v37 = 0;
        v38 = 0;
        v20 = 0;
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
            v20 |= (unint64_t)(v42 & 0x7F) << v37;
            if (v42 < 0)
            {
              v37 += 7;
              v15 = v38++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_225;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_225:
        v180 = 40;
        goto LABEL_299;
      case 5u:
        v43 = 0;
        v44 = 0;
        v20 = 0;
        *(_DWORD *)(a1 + 184) |= 0x20000u;
        while (2)
        {
          v45 = *v3;
          v46 = *(_QWORD *)(a2 + v45);
          v47 = v46 + 1;
          if (v46 == -1 || v47 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v48 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v46);
            *(_QWORD *)(a2 + v45) = v47;
            v20 |= (unint64_t)(v48 & 0x7F) << v43;
            if (v48 < 0)
            {
              v43 += 7;
              v15 = v44++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_229;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_229:
        v180 = 176;
        goto LABEL_299;
      case 6u:
        v49 = 0;
        v50 = 0;
        v20 = 0;
        *(_DWORD *)(a1 + 184) |= 0x800u;
        while (2)
        {
          v51 = *v3;
          v52 = *(_QWORD *)(a2 + v51);
          v53 = v52 + 1;
          if (v52 == -1 || v53 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v54 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v52);
            *(_QWORD *)(a2 + v51) = v53;
            v20 |= (unint64_t)(v54 & 0x7F) << v49;
            if (v54 < 0)
            {
              v49 += 7;
              v15 = v50++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_233;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_233:
        v180 = 136;
        goto LABEL_299;
      case 7u:
        v55 = 0;
        v56 = 0;
        v20 = 0;
        *(_DWORD *)(a1 + 184) |= 4u;
        while (2)
        {
          v57 = *v3;
          v58 = *(_QWORD *)(a2 + v57);
          v59 = v58 + 1;
          if (v58 == -1 || v59 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v60 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v58);
            *(_QWORD *)(a2 + v57) = v59;
            v20 |= (unint64_t)(v60 & 0x7F) << v55;
            if (v60 < 0)
            {
              v55 += 7;
              v15 = v56++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_237;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_237:
        v180 = 32;
        goto LABEL_299;
      case 8u:
        v61 = objc_alloc_init(CLPLocation);
        objc_storeStrong((id *)(a1 + 72), v61);
        if (!PBReaderPlaceMark() || (CLPLocationReadFrom((uint64_t)v61, a2) & 1) == 0)
          goto LABEL_317;
        goto LABEL_114;
      case 9u:
        PBReaderReadString();
        v62 = objc_claimAutoreleasedReturnValue();
        v63 = 24;
        goto LABEL_209;
      case 0xAu:
        PBReaderReadString();
        v62 = objc_claimAutoreleasedReturnValue();
        v63 = 128;
        goto LABEL_209;
      case 0xBu:
        *(_DWORD *)(a1 + 184) |= 1u;
        v64 = *v3;
        v65 = *(_QWORD *)(a2 + v64);
        if (v65 <= 0xFFFFFFFFFFFFFFF7 && v65 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v66 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v65);
          *(_QWORD *)(a2 + v64) = v65 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v66 = 0;
        }
        v185 = 8;
        goto LABEL_315;
      case 0xCu:
        *(_DWORD *)(a1 + 184) |= 2u;
        v67 = *v3;
        v68 = *(_QWORD *)(a2 + v67);
        if (v68 <= 0xFFFFFFFFFFFFFFF7 && v68 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v66 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v68);
          *(_QWORD *)(a2 + v67) = v68 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v66 = 0;
        }
        v185 = 16;
LABEL_315:
        *(_QWORD *)(a1 + v185) = v66;
        goto LABEL_300;
      case 0xDu:
        v69 = 0;
        v70 = 0;
        v20 = 0;
        *(_DWORD *)(a1 + 184) |= 0x8000u;
        while (2)
        {
          v71 = *v3;
          v72 = *(_QWORD *)(a2 + v71);
          v73 = v72 + 1;
          if (v72 == -1 || v73 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v74 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v72);
            *(_QWORD *)(a2 + v71) = v73;
            v20 |= (unint64_t)(v74 & 0x7F) << v69;
            if (v74 < 0)
            {
              v69 += 7;
              v15 = v70++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_241;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_241:
        v180 = 152;
        goto LABEL_299;
      case 0xEu:
        v75 = 0;
        v76 = 0;
        v77 = 0;
        *(_DWORD *)(a1 + 184) |= 0x100u;
        while (2)
        {
          v78 = *v3;
          v79 = *(_QWORD *)(a2 + v78);
          v80 = v79 + 1;
          if (v79 == -1 || v80 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v81 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v79);
            *(_QWORD *)(a2 + v78) = v80;
            v77 |= (unint64_t)(v81 & 0x7F) << v75;
            if (v81 < 0)
            {
              v75 += 7;
              v15 = v76++ >= 9;
              if (v15)
              {
                LODWORD(v77) = 0;
                goto LABEL_245;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v77) = 0;
LABEL_245:
        v181 = -(v77 & 1) ^ ((int)v77 >> 1);
        v182 = 60;
        goto LABEL_254;
      case 0xFu:
        v82 = 0;
        v83 = 0;
        v84 = 0;
        *(_DWORD *)(a1 + 184) |= 0x2000u;
        while (2)
        {
          v85 = *v3;
          v86 = *(_QWORD *)(a2 + v85);
          v87 = v86 + 1;
          if (v86 == -1 || v87 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v88 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v86);
            *(_QWORD *)(a2 + v85) = v87;
            v84 |= (unint64_t)(v88 & 0x7F) << v82;
            if (v88 < 0)
            {
              v82 += 7;
              v15 = v83++ >= 9;
              if (v15)
              {
                LODWORD(v84) = 0;
                goto LABEL_249;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v84) = 0;
LABEL_249:
        v181 = -(v84 & 1) ^ ((int)v84 >> 1);
        v182 = 144;
        goto LABEL_254;
      case 0x10u:
        v89 = 0;
        v90 = 0;
        v91 = 0;
        *(_DWORD *)(a1 + 184) |= 0x4000u;
        while (2)
        {
          v92 = *v3;
          v93 = *(_QWORD *)(a2 + v92);
          v94 = v93 + 1;
          if (v93 == -1 || v94 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v95 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v93);
            *(_QWORD *)(a2 + v92) = v94;
            v91 |= (unint64_t)(v95 & 0x7F) << v89;
            if (v95 < 0)
            {
              v89 += 7;
              v15 = v90++ >= 9;
              if (v15)
              {
                LODWORD(v91) = 0;
                goto LABEL_253;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v91) = 0;
LABEL_253:
        v181 = -(v91 & 1) ^ ((int)v91 >> 1);
        v182 = 148;
LABEL_254:
        *(_DWORD *)(a1 + v182) = v181;
        goto LABEL_300;
      case 0x14u:
        v61 = objc_alloc_init(CLPLteCellNeighbor);
        objc_msgSend((id)a1, "addNeighbor:", v61);
        if (!PBReaderPlaceMark() || !CLPLteCellNeighborReadFrom((uint64_t)v61, a2))
          goto LABEL_317;
        goto LABEL_114;
      case 0x15u:
        v61 = objc_alloc_init(CLPCellNeighborsGroup);
        objc_storeStrong((id *)(a1 + 96), v61);
        if (PBReaderPlaceMark() && CLPCellNeighborsGroupReadFrom(v61, a2))
        {
LABEL_114:
          PBReaderRecallMark();

LABEL_300:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_317:

        return 0;
      case 0x16u:
        v97 = 0;
        v98 = 0;
        v20 = 0;
        *(_DWORD *)(a1 + 184) |= 8u;
        while (2)
        {
          v99 = *v3;
          v100 = *(_QWORD *)(a2 + v99);
          v101 = v100 + 1;
          if (v100 == -1 || v101 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v102 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v100);
            *(_QWORD *)(a2 + v99) = v101;
            v20 |= (unint64_t)(v102 & 0x7F) << v97;
            if (v102 < 0)
            {
              v97 += 7;
              v15 = v98++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_258;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_258:
        v180 = 36;
        goto LABEL_299;
      case 0x17u:
        v103 = 0;
        v104 = 0;
        v105 = 0;
        *(_DWORD *)(a1 + 184) |= 0x80000u;
        while (2)
        {
          v106 = *v3;
          v107 = *(_QWORD *)(a2 + v106);
          v108 = v107 + 1;
          if (v107 == -1 || v108 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v109 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v107);
            *(_QWORD *)(a2 + v106) = v108;
            v105 |= (unint64_t)(v109 & 0x7F) << v103;
            if (v109 < 0)
            {
              v103 += 7;
              v15 = v104++ >= 9;
              if (v15)
              {
                v105 = 0;
                goto LABEL_262;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v105 = 0;
LABEL_262:
        v183 = v105 != 0;
        v184 = 181;
        goto LABEL_310;
      case 0x18u:
        PBReaderReadString();
        v62 = objc_claimAutoreleasedReturnValue();
        v63 = 160;
        goto LABEL_209;
      case 0x19u:
        v110 = 0;
        v111 = 0;
        v20 = 0;
        *(_DWORD *)(a1 + 184) |= 0x40u;
        while (2)
        {
          v112 = *v3;
          v113 = *(_QWORD *)(a2 + v112);
          v114 = v113 + 1;
          if (v113 == -1 || v114 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v115 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v113);
            *(_QWORD *)(a2 + v112) = v114;
            v20 |= (unint64_t)(v115 & 0x7F) << v110;
            if (v115 < 0)
            {
              v110 += 7;
              v15 = v111++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_266;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_266:
        v180 = 52;
        goto LABEL_299;
      case 0x1Au:
        v116 = 0;
        v117 = 0;
        v20 = 0;
        *(_DWORD *)(a1 + 184) |= 0x80u;
        while (2)
        {
          v118 = *v3;
          v119 = *(_QWORD *)(a2 + v118);
          v120 = v119 + 1;
          if (v119 == -1 || v120 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v121 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v119);
            *(_QWORD *)(a2 + v118) = v120;
            v20 |= (unint64_t)(v121 & 0x7F) << v116;
            if (v121 < 0)
            {
              v116 += 7;
              v15 = v117++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_270;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_270:
        v180 = 56;
        goto LABEL_299;
      case 0x1Bu:
        v122 = 0;
        v123 = 0;
        v124 = 0;
        *(_DWORD *)(a1 + 184) |= 0x100000u;
        while (2)
        {
          v125 = *v3;
          v126 = *(_QWORD *)(a2 + v125);
          v127 = v126 + 1;
          if (v126 == -1 || v127 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v128 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v126);
            *(_QWORD *)(a2 + v125) = v127;
            v124 |= (unint64_t)(v128 & 0x7F) << v122;
            if (v128 < 0)
            {
              v122 += 7;
              v15 = v123++ >= 9;
              if (v15)
              {
                v124 = 0;
                goto LABEL_274;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v124 = 0;
LABEL_274:
        v183 = v124 != 0;
        v184 = 182;
        goto LABEL_310;
      case 0x1Cu:
        v129 = 0;
        v130 = 0;
        v20 = 0;
        *(_DWORD *)(a1 + 184) |= 0x200u;
        while (2)
        {
          v131 = *v3;
          v132 = *(_QWORD *)(a2 + v131);
          v133 = v132 + 1;
          if (v132 == -1 || v133 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v134 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v132);
            *(_QWORD *)(a2 + v131) = v133;
            v20 |= (unint64_t)(v134 & 0x7F) << v129;
            if (v134 < 0)
            {
              v129 += 7;
              v15 = v130++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_278;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_278:
        v180 = 64;
        goto LABEL_299;
      case 0x1Du:
        v135 = 0;
        v136 = 0;
        v20 = 0;
        *(_DWORD *)(a1 + 184) |= 0x1000u;
        while (2)
        {
          v137 = *v3;
          v138 = *(_QWORD *)(a2 + v137);
          v139 = v138 + 1;
          if (v138 == -1 || v139 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v140 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v138);
            *(_QWORD *)(a2 + v137) = v139;
            v20 |= (unint64_t)(v140 & 0x7F) << v135;
            if (v140 < 0)
            {
              v135 += 7;
              v15 = v136++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_282;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_282:
        v180 = 140;
        goto LABEL_299;
      case 0x1Eu:
        v141 = 0;
        v142 = 0;
        v20 = 0;
        *(_DWORD *)(a1 + 184) |= 0x400u;
        while (2)
        {
          v143 = *v3;
          v144 = *(_QWORD *)(a2 + v143);
          v145 = v144 + 1;
          if (v144 == -1 || v145 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v146 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v144);
            *(_QWORD *)(a2 + v143) = v145;
            v20 |= (unint64_t)(v146 & 0x7F) << v141;
            if (v146 < 0)
            {
              v141 += 7;
              v15 = v142++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_286;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_286:
        v180 = 80;
        goto LABEL_299;
      case 0x1Fu:
        v147 = 0;
        v148 = 0;
        v20 = 0;
        *(_DWORD *)(a1 + 184) |= 0x20u;
        while (2)
        {
          v149 = *v3;
          v150 = *(_QWORD *)(a2 + v149);
          v151 = v150 + 1;
          if (v150 == -1 || v151 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v152 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v150);
            *(_QWORD *)(a2 + v149) = v151;
            v20 |= (unint64_t)(v152 & 0x7F) << v147;
            if (v152 < 0)
            {
              v147 += 7;
              v15 = v148++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_290;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_290:
        v180 = 48;
        goto LABEL_299;
      case 0x20u:
        v153 = 0;
        v154 = 0;
        v20 = 0;
        *(_DWORD *)(a1 + 184) |= 0x10u;
        while (2)
        {
          v155 = *v3;
          v156 = *(_QWORD *)(a2 + v155);
          v157 = v156 + 1;
          if (v156 == -1 || v157 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v158 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v156);
            *(_QWORD *)(a2 + v155) = v157;
            v20 |= (unint64_t)(v158 & 0x7F) << v153;
            if (v158 < 0)
            {
              v153 += 7;
              v15 = v154++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_294;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_294:
        v180 = 44;
        goto LABEL_299;
      case 0x21u:
        v159 = 0;
        v160 = 0;
        v20 = 0;
        *(_DWORD *)(a1 + 184) |= 0x10000u;
        while (2)
        {
          v161 = *v3;
          v162 = *(_QWORD *)(a2 + v161);
          v163 = v162 + 1;
          if (v162 == -1 || v163 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v164 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v162);
            *(_QWORD *)(a2 + v161) = v163;
            v20 |= (unint64_t)(v164 & 0x7F) << v159;
            if (v164 < 0)
            {
              v159 += 7;
              v15 = v160++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_298;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_298:
        v180 = 172;
LABEL_299:
        *(_DWORD *)(a1 + v180) = v20;
        goto LABEL_300;
      case 0x22u:
        v165 = 0;
        v166 = 0;
        v167 = 0;
        *(_DWORD *)(a1 + 184) |= 0x200000u;
        while (2)
        {
          v168 = *v3;
          v169 = *(_QWORD *)(a2 + v168);
          v170 = v169 + 1;
          if (v169 == -1 || v170 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v171 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v169);
            *(_QWORD *)(a2 + v168) = v170;
            v167 |= (unint64_t)(v171 & 0x7F) << v165;
            if (v171 < 0)
            {
              v165 += 7;
              v15 = v166++ >= 9;
              if (v15)
              {
                v167 = 0;
                goto LABEL_305;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v167 = 0;
LABEL_305:
        v183 = v167 != 0;
        v184 = 183;
        goto LABEL_310;
      case 0x23u:
        v172 = 0;
        v173 = 0;
        v174 = 0;
        *(_DWORD *)(a1 + 184) |= 0x40000u;
        while (2)
        {
          v175 = *v3;
          v176 = *(_QWORD *)(a2 + v175);
          v177 = v176 + 1;
          if (v176 == -1 || v177 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v178 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v176);
            *(_QWORD *)(a2 + v175) = v177;
            v174 |= (unint64_t)(v178 & 0x7F) << v172;
            if (v178 < 0)
            {
              v172 += 7;
              v15 = v173++ >= 9;
              if (v15)
              {
                v174 = 0;
                goto LABEL_309;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v174 = 0;
LABEL_309:
        v183 = v174 != 0;
        v184 = 180;
LABEL_310:
        *(_BYTE *)(a1 + v184) = v183;
        goto LABEL_300;
      case 0x24u:
        PBReaderReadString();
        v62 = objc_claimAutoreleasedReturnValue();
        v63 = 120;
        goto LABEL_209;
      case 0x25u:
        PBReaderReadString();
        v62 = objc_claimAutoreleasedReturnValue();
        v63 = 112;
LABEL_209:
        v179 = *(void **)(a1 + v63);
        *(_QWORD *)(a1 + v63) = v62;

        goto LABEL_300;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_300;
    }
  }
}

uint64_t CLPSCdmaCellTowerLocationReadFrom(uint64_t a1, uint64_t a2)
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
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  CLPLocation *v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  unsigned int v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char v69;
  char v70;
  unsigned int v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  char v75;
  uint64_t result;
  char v77;
  unsigned int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char v83;
  char v84;
  unsigned int v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  char v90;
  char v91;
  unsigned int v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  char v96;
  char v97;
  unsigned int v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char v103;
  void *v104;
  uint64_t v105;
  int v106;
  uint64_t v107;

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
            goto LABEL_126;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_128;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_126:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_128:
        v105 = 40;
        goto LABEL_174;
      case 2u:
        v25 = 0;
        v26 = 0;
        v20 = 0;
        while (2)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          v29 = v28 + 1;
          if (v28 == -1 || v29 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
            *(_QWORD *)(a2 + v27) = v29;
            v20 |= (unint64_t)(v30 & 0x7F) << v25;
            if (v30 < 0)
            {
              v25 += 7;
              v15 = v26++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_132;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_132:
        v105 = 44;
        goto LABEL_174;
      case 3u:
        v31 = 0;
        v32 = 0;
        v20 = 0;
        while (2)
        {
          v33 = *v3;
          v34 = *(_QWORD *)(a2 + v33);
          v35 = v34 + 1;
          if (v34 == -1 || v35 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
            *(_QWORD *)(a2 + v33) = v35;
            v20 |= (unint64_t)(v36 & 0x7F) << v31;
            if (v36 < 0)
            {
              v31 += 7;
              v15 = v32++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_136;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_136:
        v105 = 28;
        goto LABEL_174;
      case 4u:
        v37 = 0;
        v38 = 0;
        v20 = 0;
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
            v20 |= (unint64_t)(v42 & 0x7F) << v37;
            if (v42 < 0)
            {
              v37 += 7;
              v15 = v38++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_140;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_140:
        v105 = 20;
        goto LABEL_174;
      case 5u:
        v43 = 0;
        v44 = 0;
        v20 = 0;
        while (2)
        {
          v45 = *v3;
          v46 = *(_QWORD *)(a2 + v45);
          v47 = v46 + 1;
          if (v46 == -1 || v47 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v48 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v46);
            *(_QWORD *)(a2 + v45) = v47;
            v20 |= (unint64_t)(v48 & 0x7F) << v43;
            if (v48 < 0)
            {
              v43 += 7;
              v15 = v44++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_144;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_144:
        v105 = 84;
        goto LABEL_174;
      case 6u:
        v49 = 0;
        v50 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 112) |= 1u;
        while (2)
        {
          v51 = *v3;
          v52 = *(_QWORD *)(a2 + v51);
          v53 = v52 + 1;
          if (v52 == -1 || v53 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v54 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v52);
            *(_QWORD *)(a2 + v51) = v53;
            v20 |= (unint64_t)(v54 & 0x7F) << v49;
            if (v54 < 0)
            {
              v49 += 7;
              v15 = v50++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_148;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_148:
        v105 = 16;
        goto LABEL_174;
      case 7u:
        v55 = 0;
        v56 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 112) |= 4u;
        while (2)
        {
          v57 = *v3;
          v58 = *(_QWORD *)(a2 + v57);
          v59 = v58 + 1;
          if (v58 == -1 || v59 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v60 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v58);
            *(_QWORD *)(a2 + v57) = v59;
            v20 |= (unint64_t)(v60 & 0x7F) << v55;
            if (v60 < 0)
            {
              v55 += 7;
              v15 = v56++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_152;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_152:
        v105 = 72;
        goto LABEL_174;
      case 8u:
        v61 = objc_alloc_init(CLPLocation);
        objc_storeStrong((id *)(a1 + 32), v61);
        if (!PBReaderPlaceMark() || (CLPLocationReadFrom((uint64_t)v61, a2) & 1) == 0)
          goto LABEL_182;
        goto LABEL_115;
      case 9u:
        PBReaderReadString();
        v62 = objc_claimAutoreleasedReturnValue();
        v63 = 8;
        goto LABEL_124;
      case 0xAu:
        v64 = 0;
        v65 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 112) |= 0x20u;
        while (2)
        {
          v66 = *v3;
          v67 = *(_QWORD *)(a2 + v66);
          v68 = v67 + 1;
          if (v67 == -1 || v68 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v69 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v67);
            *(_QWORD *)(a2 + v66) = v68;
            v20 |= (unint64_t)(v69 & 0x7F) << v64;
            if (v69 < 0)
            {
              v64 += 7;
              v15 = v65++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_156;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_156:
        v105 = 88;
        goto LABEL_174;
      case 0xBu:
        v70 = 0;
        v71 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 112) |= 0x40u;
        while (2)
        {
          v72 = *v3;
          v73 = *(_QWORD *)(a2 + v72);
          v74 = v73 + 1;
          if (v73 == -1 || v74 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v75 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v73);
            *(_QWORD *)(a2 + v72) = v74;
            v20 |= (unint64_t)(v75 & 0x7F) << v70;
            if (v75 < 0)
            {
              v70 += 7;
              v15 = v71++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_160;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_160:
        v105 = 104;
        goto LABEL_174;
      case 0xCu:
        PBReaderReadString();
        v62 = objc_claimAutoreleasedReturnValue();
        v63 = 64;
        goto LABEL_124;
      case 0xFu:
        v77 = 0;
        v78 = 0;
        v79 = 0;
        *(_BYTE *)(a1 + 112) |= 2u;
        while (2)
        {
          v80 = *v3;
          v81 = *(_QWORD *)(a2 + v80);
          v82 = v81 + 1;
          if (v81 == -1 || v82 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v83 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v81);
            *(_QWORD *)(a2 + v80) = v82;
            v79 |= (unint64_t)(v83 & 0x7F) << v77;
            if (v83 < 0)
            {
              v77 += 7;
              v15 = v78++ >= 9;
              if (v15)
              {
                LODWORD(v79) = 0;
                goto LABEL_164;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v79) = 0;
LABEL_164:
        v106 = -(v79 & 1) ^ ((int)v79 >> 1);
        v107 = 24;
        goto LABEL_169;
      case 0x10u:
        v84 = 0;
        v85 = 0;
        v86 = 0;
        *(_BYTE *)(a1 + 112) |= 0x10u;
        while (2)
        {
          v87 = *v3;
          v88 = *(_QWORD *)(a2 + v87);
          v89 = v88 + 1;
          if (v88 == -1 || v89 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v90 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v88);
            *(_QWORD *)(a2 + v87) = v89;
            v86 |= (unint64_t)(v90 & 0x7F) << v84;
            if (v90 < 0)
            {
              v84 += 7;
              v15 = v85++ >= 9;
              if (v15)
              {
                LODWORD(v86) = 0;
                goto LABEL_168;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v86) = 0;
LABEL_168:
        v106 = -(v86 & 1) ^ ((int)v86 >> 1);
        v107 = 80;
LABEL_169:
        *(_DWORD *)(a1 + v107) = v106;
        goto LABEL_175;
      case 0x11u:
        v91 = 0;
        v92 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 112) |= 8u;
        while (2)
        {
          v93 = *v3;
          v94 = *(_QWORD *)(a2 + v93);
          v95 = v94 + 1;
          if (v94 == -1 || v95 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v96 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v94);
            *(_QWORD *)(a2 + v93) = v95;
            v20 |= (unint64_t)(v96 & 0x7F) << v91;
            if (v96 < 0)
            {
              v91 += 7;
              v15 = v92++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_173;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_173:
        v105 = 76;
LABEL_174:
        *(_DWORD *)(a1 + v105) = v20;
        goto LABEL_175;
      case 0x14u:
        v61 = objc_alloc_init(CLPCellNeighbor);
        objc_msgSend((id)a1, "addNeighbor:", v61);
        if (!PBReaderPlaceMark() || !CLPCellNeighborReadFrom((uint64_t)v61, a2))
          goto LABEL_182;
        goto LABEL_115;
      case 0x15u:
        v61 = objc_alloc_init(CLPCellNeighborsGroup);
        objc_storeStrong((id *)(a1 + 48), v61);
        if (PBReaderPlaceMark() && CLPCellNeighborsGroupReadFrom(v61, a2))
        {
LABEL_115:
          PBReaderRecallMark();

LABEL_175:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_182:

        return 0;
      case 0x16u:
        v97 = 0;
        v98 = 0;
        v99 = 0;
        *(_BYTE *)(a1 + 112) |= 0x80u;
        while (2)
        {
          v100 = *v3;
          v101 = *(_QWORD *)(a2 + v100);
          v102 = v101 + 1;
          if (v101 == -1 || v102 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v103 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v101);
            *(_QWORD *)(a2 + v100) = v102;
            v99 |= (unint64_t)(v103 & 0x7F) << v97;
            if (v103 < 0)
            {
              v97 += 7;
              v15 = v98++ >= 9;
              if (v15)
              {
                v99 = 0;
                goto LABEL_180;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v99 = 0;
LABEL_180:
        *(_BYTE *)(a1 + 108) = v99 != 0;
        goto LABEL_175;
      case 0x17u:
        PBReaderReadString();
        v62 = objc_claimAutoreleasedReturnValue();
        v63 = 96;
LABEL_124:
        v104 = *(void **)(a1 + v63);
        *(_QWORD *)(a1 + v63) = v62;

        goto LABEL_175;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_175;
    }
  }
}

uint64_t CLPNRCellTowerLocationReadFrom(uint64_t a1, uint64_t a2)
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
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  char v56;
  unsigned int v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  CLPLocation *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char v70;
  unsigned int v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  char v75;
  char v76;
  unsigned int v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  char v82;
  char v83;
  unsigned int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  char v89;
  char v90;
  unsigned int v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  char v96;
  uint64_t result;
  char v98;
  unsigned int v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char v103;
  char v104;
  unsigned int v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  char v110;
  char v111;
  unsigned int v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  char v116;
  char v117;
  unsigned int v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  char v122;
  char v123;
  unsigned int v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  char v128;
  char v129;
  unsigned int v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  unint64_t v134;
  char v135;
  char v136;
  unsigned int v137;
  uint64_t v138;
  uint64_t v139;
  unint64_t v140;
  char v141;
  char v142;
  unsigned int v143;
  uint64_t v144;
  uint64_t v145;
  unint64_t v146;
  char v147;
  char v148;
  unsigned int v149;
  uint64_t v150;
  uint64_t v151;
  unint64_t v152;
  char v153;
  char v154;
  unsigned int v155;
  uint64_t v156;
  uint64_t v157;
  unint64_t v158;
  char v159;
  char v160;
  unsigned int v161;
  uint64_t v162;
  uint64_t v163;
  unint64_t v164;
  char v165;
  char v166;
  unsigned int v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  unint64_t v171;
  char v172;
  char v173;
  unsigned int v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  unint64_t v178;
  char v179;
  void *v180;
  uint64_t v181;
  int v182;
  uint64_t v183;
  BOOL v184;
  uint64_t v185;
  uint64_t v186;

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
        *(_DWORD *)(a1 + 188) |= 0x800u;
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
            goto LABEL_211;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_213;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_211:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_213:
        v181 = 84;
        goto LABEL_299;
      case 2u:
        v25 = 0;
        v26 = 0;
        v20 = 0;
        *(_DWORD *)(a1 + 188) |= 0x1000u;
        while (2)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          v29 = v28 + 1;
          if (v28 == -1 || v29 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
            *(_QWORD *)(a2 + v27) = v29;
            v20 |= (unint64_t)(v30 & 0x7F) << v25;
            if (v30 < 0)
            {
              v25 += 7;
              v15 = v26++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_217;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_217:
        v181 = 88;
        goto LABEL_299;
      case 3u:
        v31 = 0;
        v32 = 0;
        v20 = 0;
        *(_DWORD *)(a1 + 188) |= 0x100000u;
        while (2)
        {
          v33 = *v3;
          v34 = *(_QWORD *)(a2 + v33);
          v35 = v34 + 1;
          if (v34 == -1 || v35 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
            *(_QWORD *)(a2 + v33) = v35;
            v20 |= (unint64_t)(v36 & 0x7F) << v31;
            if (v36 < 0)
            {
              v31 += 7;
              v15 = v32++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_221;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_221:
        v181 = 176;
        goto LABEL_299;
      case 4u:
        v37 = 0;
        v38 = 0;
        v39 = 0;
        *(_DWORD *)(a1 + 188) |= 4u;
        while (2)
        {
          v40 = *v3;
          v41 = *(_QWORD *)(a2 + v40);
          v42 = v41 + 1;
          if (v41 == -1 || v42 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v41);
            *(_QWORD *)(a2 + v40) = v42;
            v39 |= (unint64_t)(v43 & 0x7F) << v37;
            if (v43 < 0)
            {
              v37 += 7;
              v15 = v38++ >= 9;
              if (v15)
              {
                v39 = 0;
                goto LABEL_225;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v39 = 0;
LABEL_225:
        *(_QWORD *)(a1 + 24) = v39;
        goto LABEL_314;
      case 5u:
        v44 = 0;
        v45 = 0;
        v20 = 0;
        *(_DWORD *)(a1 + 188) |= 0x2000u;
        while (2)
        {
          v46 = *v3;
          v47 = *(_QWORD *)(a2 + v46);
          v48 = v47 + 1;
          if (v47 == -1 || v48 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v49 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v47);
            *(_QWORD *)(a2 + v46) = v48;
            v20 |= (unint64_t)(v49 & 0x7F) << v44;
            if (v49 < 0)
            {
              v44 += 7;
              v15 = v45++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_229;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_229:
        v181 = 128;
        goto LABEL_299;
      case 6u:
        v50 = 0;
        v51 = 0;
        v20 = 0;
        *(_DWORD *)(a1 + 188) |= 0x4000u;
        while (2)
        {
          v52 = *v3;
          v53 = *(_QWORD *)(a2 + v52);
          v54 = v53 + 1;
          if (v53 == -1 || v54 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v55 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v53);
            *(_QWORD *)(a2 + v52) = v54;
            v20 |= (unint64_t)(v55 & 0x7F) << v50;
            if (v55 < 0)
            {
              v50 += 7;
              v15 = v51++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_233;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_233:
        v181 = 144;
        goto LABEL_299;
      case 7u:
        v56 = 0;
        v57 = 0;
        v20 = 0;
        *(_DWORD *)(a1 + 188) |= 8u;
        while (2)
        {
          v58 = *v3;
          v59 = *(_QWORD *)(a2 + v58);
          v60 = v59 + 1;
          if (v59 == -1 || v60 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v61 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v59);
            *(_QWORD *)(a2 + v58) = v60;
            v20 |= (unint64_t)(v61 & 0x7F) << v56;
            if (v61 < 0)
            {
              v56 += 7;
              v15 = v57++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_237;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_237:
        v181 = 40;
        goto LABEL_299;
      case 8u:
        v62 = objc_alloc_init(CLPLocation);
        objc_storeStrong((id *)(a1 + 72), v62);
        if (!PBReaderPlaceMark() || (CLPLocationReadFrom((uint64_t)v62, a2) & 1) == 0)
          goto LABEL_316;
        goto LABEL_114;
      case 9u:
        PBReaderReadString();
        v63 = objc_claimAutoreleasedReturnValue();
        v64 = 32;
        goto LABEL_209;
      case 0xAu:
        PBReaderReadString();
        v63 = objc_claimAutoreleasedReturnValue();
        v64 = 136;
        goto LABEL_209;
      case 0xBu:
        *(_DWORD *)(a1 + 188) |= 1u;
        v65 = *v3;
        v66 = *(_QWORD *)(a2 + v65);
        if (v66 <= 0xFFFFFFFFFFFFFFF7 && v66 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v67 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v66);
          *(_QWORD *)(a2 + v65) = v66 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v67 = 0;
        }
        v186 = 8;
        goto LABEL_313;
      case 0xCu:
        *(_DWORD *)(a1 + 188) |= 2u;
        v68 = *v3;
        v69 = *(_QWORD *)(a2 + v68);
        if (v69 <= 0xFFFFFFFFFFFFFFF7 && v69 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v67 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v69);
          *(_QWORD *)(a2 + v68) = v69 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v67 = 0;
        }
        v186 = 16;
LABEL_313:
        *(_QWORD *)(a1 + v186) = v67;
        goto LABEL_314;
      case 0xDu:
        v70 = 0;
        v71 = 0;
        v20 = 0;
        *(_DWORD *)(a1 + 188) |= 0x80000u;
        while (2)
        {
          v72 = *v3;
          v73 = *(_QWORD *)(a2 + v72);
          v74 = v73 + 1;
          if (v73 == -1 || v74 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v75 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v73);
            *(_QWORD *)(a2 + v72) = v74;
            v20 |= (unint64_t)(v75 & 0x7F) << v70;
            if (v75 < 0)
            {
              v70 += 7;
              v15 = v71++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_241;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_241:
        v181 = 164;
        goto LABEL_299;
      case 0xEu:
        v76 = 0;
        v77 = 0;
        v78 = 0;
        *(_DWORD *)(a1 + 188) |= 0x80u;
        while (2)
        {
          v79 = *v3;
          v80 = *(_QWORD *)(a2 + v79);
          v81 = v80 + 1;
          if (v80 == -1 || v81 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v82 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v80);
            *(_QWORD *)(a2 + v79) = v81;
            v78 |= (unint64_t)(v82 & 0x7F) << v76;
            if (v82 < 0)
            {
              v76 += 7;
              v15 = v77++ >= 9;
              if (v15)
              {
                LODWORD(v78) = 0;
                goto LABEL_245;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v78) = 0;
LABEL_245:
        v182 = -(v78 & 1) ^ ((int)v78 >> 1);
        v183 = 56;
        goto LABEL_254;
      case 0xFu:
        v83 = 0;
        v84 = 0;
        v85 = 0;
        *(_DWORD *)(a1 + 188) |= 0x10000u;
        while (2)
        {
          v86 = *v3;
          v87 = *(_QWORD *)(a2 + v86);
          v88 = v87 + 1;
          if (v87 == -1 || v88 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v89 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v87);
            *(_QWORD *)(a2 + v86) = v88;
            v85 |= (unint64_t)(v89 & 0x7F) << v83;
            if (v89 < 0)
            {
              v83 += 7;
              v15 = v84++ >= 9;
              if (v15)
              {
                LODWORD(v85) = 0;
                goto LABEL_249;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v85) = 0;
LABEL_249:
        v182 = -(v85 & 1) ^ ((int)v85 >> 1);
        v183 = 152;
        goto LABEL_254;
      case 0x10u:
        v90 = 0;
        v91 = 0;
        v92 = 0;
        *(_DWORD *)(a1 + 188) |= 0x20000u;
        while (2)
        {
          v93 = *v3;
          v94 = *(_QWORD *)(a2 + v93);
          v95 = v94 + 1;
          if (v94 == -1 || v95 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v96 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v94);
            *(_QWORD *)(a2 + v93) = v95;
            v92 |= (unint64_t)(v96 & 0x7F) << v90;
            if (v96 < 0)
            {
              v90 += 7;
              v15 = v91++ >= 9;
              if (v15)
              {
                LODWORD(v92) = 0;
                goto LABEL_253;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v92) = 0;
LABEL_253:
        v182 = -(v92 & 1) ^ ((int)v92 >> 1);
        v183 = 156;
LABEL_254:
        *(_DWORD *)(a1 + v183) = v182;
        goto LABEL_314;
      case 0x14u:
        v62 = objc_alloc_init(CLPNRCellNeighbor);
        objc_msgSend((id)a1, "addNeighbor:", v62);
        if (!PBReaderPlaceMark() || !CLPNRCellNeighborReadFrom((uint64_t)v62, a2))
          goto LABEL_316;
        goto LABEL_114;
      case 0x15u:
        v62 = objc_alloc_init(CLPCellNeighborsGroup);
        objc_storeStrong((id *)(a1 + 96), v62);
        if (PBReaderPlaceMark() && CLPCellNeighborsGroupReadFrom(v62, a2))
        {
LABEL_114:
          PBReaderRecallMark();

LABEL_314:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_316:

        return 0;
      case 0x16u:
        v98 = 0;
        v99 = 0;
        v20 = 0;
        *(_DWORD *)(a1 + 188) |= 0x10u;
        while (2)
        {
          v100 = *v3;
          v101 = *(_QWORD *)(a2 + v100);
          v102 = v101 + 1;
          if (v101 == -1 || v102 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v103 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v101);
            *(_QWORD *)(a2 + v100) = v102;
            v20 |= (unint64_t)(v103 & 0x7F) << v98;
            if (v103 < 0)
            {
              v98 += 7;
              v15 = v99++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_258;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_258:
        v181 = 44;
        goto LABEL_299;
      case 0x17u:
        v104 = 0;
        v105 = 0;
        v106 = 0;
        *(_DWORD *)(a1 + 188) |= 0x800000u;
        while (2)
        {
          v107 = *v3;
          v108 = *(_QWORD *)(a2 + v107);
          v109 = v108 + 1;
          if (v108 == -1 || v109 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v110 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v108);
            *(_QWORD *)(a2 + v107) = v109;
            v106 |= (unint64_t)(v110 & 0x7F) << v104;
            if (v110 < 0)
            {
              v104 += 7;
              v15 = v105++ >= 9;
              if (v15)
              {
                v106 = 0;
                goto LABEL_262;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v106 = 0;
LABEL_262:
        v184 = v106 != 0;
        v185 = 185;
        goto LABEL_308;
      case 0x18u:
        PBReaderReadString();
        v63 = objc_claimAutoreleasedReturnValue();
        v64 = 168;
        goto LABEL_209;
      case 0x19u:
        v111 = 0;
        v112 = 0;
        v20 = 0;
        *(_DWORD *)(a1 + 188) |= 0x40000u;
        while (2)
        {
          v113 = *v3;
          v114 = *(_QWORD *)(a2 + v113);
          v115 = v114 + 1;
          if (v114 == -1 || v115 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v116 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v114);
            *(_QWORD *)(a2 + v113) = v115;
            v20 |= (unint64_t)(v116 & 0x7F) << v111;
            if (v116 < 0)
            {
              v111 += 7;
              v15 = v112++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_266;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_266:
        v181 = 160;
        goto LABEL_299;
      case 0x1Au:
        v117 = 0;
        v118 = 0;
        v20 = 0;
        *(_DWORD *)(a1 + 188) |= 0x100u;
        while (2)
        {
          v119 = *v3;
          v120 = *(_QWORD *)(a2 + v119);
          v121 = v120 + 1;
          if (v120 == -1 || v121 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v122 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v120);
            *(_QWORD *)(a2 + v119) = v121;
            v20 |= (unint64_t)(v122 & 0x7F) << v117;
            if (v122 < 0)
            {
              v117 += 7;
              v15 = v118++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_270;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_270:
        v181 = 60;
        goto LABEL_299;
      case 0x1Bu:
        v123 = 0;
        v124 = 0;
        v20 = 0;
        *(_DWORD *)(a1 + 188) |= 0x40u;
        while (2)
        {
          v125 = *v3;
          v126 = *(_QWORD *)(a2 + v125);
          v127 = v126 + 1;
          if (v126 == -1 || v127 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v128 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v126);
            *(_QWORD *)(a2 + v125) = v127;
            v20 |= (unint64_t)(v128 & 0x7F) << v123;
            if (v128 < 0)
            {
              v123 += 7;
              v15 = v124++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_274;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_274:
        v181 = 52;
        goto LABEL_299;
      case 0x1Cu:
        v129 = 0;
        v130 = 0;
        v131 = 0;
        *(_DWORD *)(a1 + 188) |= 0x1000000u;
        while (2)
        {
          v132 = *v3;
          v133 = *(_QWORD *)(a2 + v132);
          v134 = v133 + 1;
          if (v133 == -1 || v134 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v135 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v133);
            *(_QWORD *)(a2 + v132) = v134;
            v131 |= (unint64_t)(v135 & 0x7F) << v129;
            if (v135 < 0)
            {
              v129 += 7;
              v15 = v130++ >= 9;
              if (v15)
              {
                v131 = 0;
                goto LABEL_278;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v131 = 0;
LABEL_278:
        v184 = v131 != 0;
        v185 = 186;
        goto LABEL_308;
      case 0x1Du:
        v136 = 0;
        v137 = 0;
        v20 = 0;
        *(_DWORD *)(a1 + 188) |= 0x200u;
        while (2)
        {
          v138 = *v3;
          v139 = *(_QWORD *)(a2 + v138);
          v140 = v139 + 1;
          if (v139 == -1 || v140 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v141 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v139);
            *(_QWORD *)(a2 + v138) = v140;
            v20 |= (unint64_t)(v141 & 0x7F) << v136;
            if (v141 < 0)
            {
              v136 += 7;
              v15 = v137++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_282;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_282:
        v181 = 64;
        goto LABEL_299;
      case 0x1Eu:
        v142 = 0;
        v143 = 0;
        v20 = 0;
        *(_DWORD *)(a1 + 188) |= 0x8000u;
        while (2)
        {
          v144 = *v3;
          v145 = *(_QWORD *)(a2 + v144);
          v146 = v145 + 1;
          if (v145 == -1 || v146 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v147 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v145);
            *(_QWORD *)(a2 + v144) = v146;
            v20 |= (unint64_t)(v147 & 0x7F) << v142;
            if (v147 < 0)
            {
              v142 += 7;
              v15 = v143++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_286;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_286:
        v181 = 148;
        goto LABEL_299;
      case 0x1Fu:
        v148 = 0;
        v149 = 0;
        v20 = 0;
        *(_DWORD *)(a1 + 188) |= 0x400u;
        while (2)
        {
          v150 = *v3;
          v151 = *(_QWORD *)(a2 + v150);
          v152 = v151 + 1;
          if (v151 == -1 || v152 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v153 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v151);
            *(_QWORD *)(a2 + v150) = v152;
            v20 |= (unint64_t)(v153 & 0x7F) << v148;
            if (v153 < 0)
            {
              v148 += 7;
              v15 = v149++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_290;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_290:
        v181 = 80;
        goto LABEL_299;
      case 0x20u:
        v154 = 0;
        v155 = 0;
        v20 = 0;
        *(_DWORD *)(a1 + 188) |= 0x20u;
        while (2)
        {
          v156 = *v3;
          v157 = *(_QWORD *)(a2 + v156);
          v158 = v157 + 1;
          if (v157 == -1 || v158 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v159 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v157);
            *(_QWORD *)(a2 + v156) = v158;
            v20 |= (unint64_t)(v159 & 0x7F) << v154;
            if (v159 < 0)
            {
              v154 += 7;
              v15 = v155++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_294;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_294:
        v181 = 48;
        goto LABEL_299;
      case 0x21u:
        v160 = 0;
        v161 = 0;
        v20 = 0;
        *(_DWORD *)(a1 + 188) |= 0x200000u;
        while (2)
        {
          v162 = *v3;
          v163 = *(_QWORD *)(a2 + v162);
          v164 = v163 + 1;
          if (v163 == -1 || v164 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v165 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v163);
            *(_QWORD *)(a2 + v162) = v164;
            v20 |= (unint64_t)(v165 & 0x7F) << v160;
            if (v165 < 0)
            {
              v160 += 7;
              v15 = v161++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_298;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_298:
        v181 = 180;
LABEL_299:
        *(_DWORD *)(a1 + v181) = v20;
        goto LABEL_314;
      case 0x22u:
        v166 = 0;
        v167 = 0;
        v168 = 0;
        *(_DWORD *)(a1 + 188) |= 0x2000000u;
        while (2)
        {
          v169 = *v3;
          v170 = *(_QWORD *)(a2 + v169);
          v171 = v170 + 1;
          if (v170 == -1 || v171 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v172 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v170);
            *(_QWORD *)(a2 + v169) = v171;
            v168 |= (unint64_t)(v172 & 0x7F) << v166;
            if (v172 < 0)
            {
              v166 += 7;
              v15 = v167++ >= 9;
              if (v15)
              {
                v168 = 0;
                goto LABEL_303;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v168 = 0;
LABEL_303:
        v184 = v168 != 0;
        v185 = 187;
        goto LABEL_308;
      case 0x23u:
        v173 = 0;
        v174 = 0;
        v175 = 0;
        *(_DWORD *)(a1 + 188) |= 0x400000u;
        while (2)
        {
          v176 = *v3;
          v177 = *(_QWORD *)(a2 + v176);
          v178 = v177 + 1;
          if (v177 == -1 || v178 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v179 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v177);
            *(_QWORD *)(a2 + v176) = v178;
            v175 |= (unint64_t)(v179 & 0x7F) << v173;
            if (v179 < 0)
            {
              v173 += 7;
              v15 = v174++ >= 9;
              if (v15)
              {
                v175 = 0;
                goto LABEL_307;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v175 = 0;
LABEL_307:
        v184 = v175 != 0;
        v185 = 184;
LABEL_308:
        *(_BYTE *)(a1 + v185) = v184;
        goto LABEL_314;
      case 0x24u:
        PBReaderReadString();
        v63 = objc_claimAutoreleasedReturnValue();
        v64 = 120;
        goto LABEL_209;
      case 0x25u:
        PBReaderReadString();
        v63 = objc_claimAutoreleasedReturnValue();
        v64 = 112;
LABEL_209:
        v180 = *(void **)(a1 + v64);
        *(_QWORD *)(a1 + v64) = v63;

        goto LABEL_314;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_314;
    }
  }
}

uint64_t CLPCellWifiCollectionResponseReadFrom(uint64_t a1, uint64_t a2)
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
        break;
      if ((v10 >> 3) == 2)
      {
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v25;

      }
      else if ((v10 >> 3) == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
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
            goto LABEL_31;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v20 = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_33:
        *(_BYTE *)(a1 + 16) = v20 != 0;
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

uint64_t CLPConsolidationReadFrom(uint64_t a1, uint64_t a2)
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
        break;
      if ((v10 >> 3) == 2)
      {
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v25;

      }
      else if ((v10 >> 3) == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
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
            goto LABEL_31;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v20 = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_33:
        *(_BYTE *)(a1 + 16) = v20 != 0;
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

uint64_t CLPIndoorCMAttitudeReadFrom(uint64_t a1, uint64_t a2)
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
  unint64_t v19;
  uint64_t v20;
  uint64_t result;
  CLPQuaternion *v22;
  uint64_t v23;
  unint64_t v24;
  int v25;
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
        *(_BYTE *)(a1 + 32) |= 1u;
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
        *(_QWORD *)(a1 + 8) = v20;
        goto LABEL_45;
      case 2u:
        v22 = objc_alloc_init(CLPQuaternion);
        objc_storeStrong((id *)(a1 + 24), v22);
        if (PBReaderPlaceMark() && CLPQuaternionReadFrom((uint64_t)v22, a2))
        {
          PBReaderRecallMark();

LABEL_45:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 3u:
        *(_BYTE *)(a1 + 32) |= 2u;
        v23 = *v3;
        v24 = *(_QWORD *)(a2 + v23);
        if (v24 <= 0xFFFFFFFFFFFFFFFBLL && v24 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v25 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v25 = 0;
        }
        *(_DWORD *)(a1 + 16) = v25;
        goto LABEL_45;
      case 4u:
        v26 = 0;
        v27 = 0;
        v28 = 0;
        *(_BYTE *)(a1 + 32) |= 4u;
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
                goto LABEL_40;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v28) = 0;
LABEL_40:
        *(_DWORD *)(a1 + 20) = v28;
        goto LABEL_45;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_45;
    }
  }
}

BOOL CLPQuaternionReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v16;
  int v17;
  uint64_t v19;
  unint64_t v20;
  int v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  int *v28;

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
          v16 = *v5;
          v17 = *(unsigned __int8 *)(a2 + v16);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *v5;
      v17 = *(unsigned __int8 *)(a2 + v16);
      if (*(_BYTE *)(a2 + v16))
        v10 = 0;
LABEL_14:
      if (v17 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      switch((v10 >> 3))
      {
        case 1u:
          *(_BYTE *)(a1 + 24) |= 1u;
          v19 = *v3;
          v20 = *(_QWORD *)(a2 + v19);
          if (v20 <= 0xFFFFFFFFFFFFFFFBLL && v20 + 4 <= *(_QWORD *)(a2 + *v4))
          {
            v21 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v20);
            *(_QWORD *)(a2 + v19) = v20 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v21 = 0;
          }
          v28 = &OBJC_IVAR___CLPQuaternion__w;
          goto LABEL_41;
        case 2u:
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 <= 0xFFFFFFFFFFFFFFFBLL && v23 + 4 <= *(_QWORD *)(a2 + *v4))
          {
            v21 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v23);
            *(_QWORD *)(a2 + v22) = v23 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + v16) = 1;
            v21 = 0;
          }
          v28 = &OBJC_IVAR___CLPQuaternion__x;
          goto LABEL_41;
        case 3u:
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          if (v25 <= 0xFFFFFFFFFFFFFFFBLL && v25 + 4 <= *(_QWORD *)(a2 + *v4))
          {
            v21 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v25 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + v16) = 1;
            v21 = 0;
          }
          v28 = &OBJC_IVAR___CLPQuaternion__y;
          goto LABEL_41;
        case 4u:
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          if (v27 <= 0xFFFFFFFFFFFFFFFBLL && v27 + 4 <= *(_QWORD *)(a2 + *v4))
          {
            v21 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v27);
            *(_QWORD *)(a2 + v26) = v27 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + v16) = 1;
            v21 = 0;
          }
          v28 = &OBJC_IVAR___CLPQuaternion__z;
LABEL_41:
          *(_DWORD *)(a1 + *v28) = v21;
          goto LABEL_42;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
LABEL_42:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          break;
      }
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPIndoorCMPedometerReadFrom(uint64_t a1, uint64_t a2)
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
  unint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  unint64_t v23;
  int v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

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
        break;
      switch((v10 >> 3))
      {
        case 1u:
          *(_BYTE *)(a1 + 44) |= 2u;
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
          v49 = 16;
          goto LABEL_73;
        case 2u:
          *(_BYTE *)(a1 + 44) |= 8u;
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 <= 0xFFFFFFFFFFFFFFFBLL && v23 + 4 <= *(_QWORD *)(a2 + *v4))
          {
            v24 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v23);
            *(_QWORD *)(a2 + v22) = v23 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v24 = 0;
          }
          v50 = 28;
          goto LABEL_76;
        case 3u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          *(_BYTE *)(a1 + 44) |= 0x40u;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            v30 = v29 + 1;
            if (v29 == -1 || v30 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v30;
              v27 |= (unint64_t)(v31 & 0x7F) << v25;
              if (v31 < 0)
              {
                v25 += 7;
                v15 = v26++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v27) = 0;
LABEL_57:
          v48 = 40;
          goto LABEL_66;
        case 4u:
          v32 = 0;
          v33 = 0;
          v27 = 0;
          *(_BYTE *)(a1 + 44) |= 0x10u;
          while (2)
          {
            v34 = *v3;
            v35 = *(_QWORD *)(a2 + v34);
            v36 = v35 + 1;
            if (v35 == -1 || v36 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
              *(_QWORD *)(a2 + v34) = v36;
              v27 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v15 = v33++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v27) = 0;
LABEL_61:
          v48 = 32;
          goto LABEL_66;
        case 5u:
          v38 = 0;
          v39 = 0;
          v27 = 0;
          *(_BYTE *)(a1 + 44) |= 0x20u;
          break;
        case 6u:
          *(_BYTE *)(a1 + 44) |= 1u;
          v44 = *v3;
          v45 = *(_QWORD *)(a2 + v44);
          if (v45 <= 0xFFFFFFFFFFFFFFF7 && v45 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v45);
            *(_QWORD *)(a2 + v44) = v45 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v49 = 8;
LABEL_73:
          *(_QWORD *)(a1 + v49) = v20;
          continue;
        case 7u:
          *(_BYTE *)(a1 + 44) |= 4u;
          v46 = *v3;
          v47 = *(_QWORD *)(a2 + v46);
          if (v47 <= 0xFFFFFFFFFFFFFFFBLL && v47 + 4 <= *(_QWORD *)(a2 + *v4))
          {
            v24 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v47);
            *(_QWORD *)(a2 + v46) = v47 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v24 = 0;
          }
          v50 = 24;
LABEL_76:
          *(_DWORD *)(a1 + v50) = v24;
          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v40 = *v3;
        v41 = *(_QWORD *)(a2 + v40);
        v42 = v41 + 1;
        if (v41 == -1 || v42 > *(_QWORD *)(a2 + *v4))
          break;
        v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v41);
        *(_QWORD *)(a2 + v40) = v42;
        v27 |= (unint64_t)(v43 & 0x7F) << v38;
        if ((v43 & 0x80) == 0)
          goto LABEL_63;
        v38 += 7;
        v15 = v39++ >= 9;
        if (v15)
        {
          LODWORD(v27) = 0;
          goto LABEL_65;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_63:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v27) = 0;
LABEL_65:
      v48 = 36;
LABEL_66:
      *(_DWORD *)(a1 + v48) = v27;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL CLPIndoorCollectionRequestReadFrom(id *a1, uint64_t a2)
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
  CLPMeta *v18;

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
        v18 = objc_alloc_init(CLPMeta);
        objc_storeStrong(a1 + 8, v18);
        if (PBReaderPlaceMark() && (CLPMetaReadFrom((uint64_t)v18, a2) & 1) != 0)
          goto LABEL_44;
        goto LABEL_48;
      case 2u:
        v18 = objc_alloc_init(CLPIndoorWifiScan);
        objc_msgSend(a1, "addIndoorWifis:", v18);
        if (!PBReaderPlaceMark() || (CLPIndoorWifiScanReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_48;
        goto LABEL_44;
      case 3u:
        v18 = objc_alloc_init(CLPLocation);
        objc_msgSend(a1, "addIndoorLocations:", v18);
        if (!PBReaderPlaceMark() || (CLPLocationReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_48;
        goto LABEL_44;
      case 4u:
        v18 = objc_alloc_init(CLPIndoorCMAttitude);
        objc_msgSend(a1, "addIndoorCMAttitude:", v18);
        if (!PBReaderPlaceMark() || (CLPIndoorCMAttitudeReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_48;
        goto LABEL_44;
      case 5u:
        v18 = objc_alloc_init(CLPIndoorCMPedometer);
        objc_msgSend(a1, "addIndoorCMPedometer:", v18);
        if (!PBReaderPlaceMark() || (CLPIndoorCMPedometerReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_48;
        goto LABEL_44;
      case 6u:
        v18 = objc_alloc_init(CLPIndoorMotionActivity);
        objc_msgSend(a1, "addIndoorMotionActivity:", v18);
        if (!PBReaderPlaceMark() || (CLPIndoorMotionActivityReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_48;
        goto LABEL_44;
      case 7u:
        v18 = objc_alloc_init(CLPIndoorPressure);
        objc_msgSend(a1, "addIndoorPressure:", v18);
        if (!PBReaderPlaceMark() || (CLPIndoorPressureReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_48;
        goto LABEL_44;
      case 8u:
        v18 = objc_alloc_init(CLPBundleId);
        objc_msgSend(a1, "addBundleId:", v18);
        if (PBReaderPlaceMark() && (CLPBundleIdReadFrom((uint64_t)v18, a2) & 1) != 0)
        {
LABEL_44:
          PBReaderRecallMark();

LABEL_45:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_48:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_45;
    }
  }
}

uint64_t CLPIndoorMotionActivityReadFrom(uint64_t a1, uint64_t a2)
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
  unint64_t v19;
  uint64_t v20;
  CLPMotionActivity *v21;
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
        break;
      if ((v10 >> 3) == 2)
      {
        v21 = objc_alloc_init(CLPMotionActivity);
        objc_storeStrong((id *)(a1 + 16), v21);
        if (!PBReaderPlaceMark() || !CLPMotionActivityReadFrom((uint64_t)v21, a2))
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((v10 >> 3) == 1)
      {
        *(_BYTE *)(a1 + 24) |= 1u;
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
        *(_QWORD *)(a1 + 8) = v20;
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

uint64_t CLPIndoorCollectionResponseReadFrom(uint64_t a1, uint64_t a2)
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
        break;
      if ((v10 >> 3) == 2)
      {
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v25;

      }
      else if ((v10 >> 3) == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
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
            goto LABEL_31;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v20 = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_33:
        *(_BYTE *)(a1 + 16) = v20 != 0;
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

uint64_t CLPIndoorEventReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t result;
  CLPIndoorCMAttitude *v26;

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
        *(_BYTE *)(a1 + 112) |= 1u;
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
            goto LABEL_67;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_69;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_67:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_69:
        *(_DWORD *)(a1 + 72) = v20;
        goto LABEL_64;
      case 2u:
        v26 = objc_alloc_init(CLPIndoorCMAttitude);
        objc_storeStrong((id *)(a1 + 16), v26);
        if (!PBReaderPlaceMark() || (CLPIndoorCMAttitudeReadFrom((uint64_t)v26, a2) & 1) == 0)
          goto LABEL_71;
        goto LABEL_63;
      case 3u:
        v26 = objc_alloc_init(CLPIndoorCMPedometer);
        objc_storeStrong((id *)(a1 + 24), v26);
        if (!PBReaderPlaceMark() || (CLPIndoorCMPedometerReadFrom((uint64_t)v26, a2) & 1) == 0)
          goto LABEL_71;
        goto LABEL_63;
      case 4u:
        v26 = objc_alloc_init(CLPLocation);
        objc_storeStrong((id *)(a1 + 40), v26);
        if (!PBReaderPlaceMark() || (CLPLocationReadFrom((uint64_t)v26, a2) & 1) == 0)
          goto LABEL_71;
        goto LABEL_63;
      case 5u:
        v26 = objc_alloc_init(CLPIndoorMotionActivity);
        objc_storeStrong((id *)(a1 + 48), v26);
        if (!PBReaderPlaceMark() || (CLPIndoorMotionActivityReadFrom((uint64_t)v26, a2) & 1) == 0)
          goto LABEL_71;
        goto LABEL_63;
      case 6u:
        v26 = objc_alloc_init(CLPIndoorPressure);
        objc_storeStrong((id *)(a1 + 64), v26);
        if (!PBReaderPlaceMark() || (CLPIndoorPressureReadFrom((uint64_t)v26, a2) & 1) == 0)
          goto LABEL_71;
        goto LABEL_63;
      case 7u:
        v26 = objc_alloc_init(CLPIndoorWifiScan);
        objc_storeStrong((id *)(a1 + 96), v26);
        if (!PBReaderPlaceMark() || (CLPIndoorWifiScanReadFrom((uint64_t)v26, a2) & 1) == 0)
          goto LABEL_71;
        goto LABEL_63;
      case 8u:
        v26 = objc_alloc_init(CLPBundleId);
        objc_storeStrong((id *)(a1 + 8), v26);
        if (!PBReaderPlaceMark() || (CLPBundleIdReadFrom((uint64_t)v26, a2) & 1) == 0)
          goto LABEL_71;
        goto LABEL_63;
      case 9u:
        v26 = objc_alloc_init(CLPLOGENTRYVISIONVIOEstimation);
        objc_storeStrong((id *)(a1 + 80), v26);
        if (!PBReaderPlaceMark() || (CLPLOGENTRYVISIONVIOEstimationReadFrom((uint64_t)v26, a2) & 1) == 0)
          goto LABEL_71;
        goto LABEL_63;
      case 0xAu:
        v26 = objc_alloc_init(CLPLOGENTRYVISIONVLLocalizationResult);
        objc_storeStrong((id *)(a1 + 88), v26);
        if (!PBReaderPlaceMark()
          || (CLPLOGENTRYVISIONVLLocalizationResultReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_71;
        }
        goto LABEL_63;
      case 0xBu:
        v26 = objc_alloc_init(CLPWorkoutUpdateMotionActivity);
        objc_storeStrong((id *)(a1 + 104), v26);
        if (!PBReaderPlaceMark() || (CLPWorkoutUpdateMotionActivityReadFrom((uint64_t)v26, a2) & 1) == 0)
          goto LABEL_71;
        goto LABEL_63;
      case 0xCu:
        v26 = objc_alloc_init(CLPInertialOdometry);
        objc_storeStrong((id *)(a1 + 32), v26);
        if (!PBReaderPlaceMark() || !CLPInertialOdometryReadFrom((uint64_t)v26, a2))
          goto LABEL_71;
        goto LABEL_63;
      case 0xDu:
        v26 = objc_alloc_init(CLPOutdoorUpdate);
        objc_storeStrong((id *)(a1 + 56), v26);
        if (PBReaderPlaceMark() && (CLPOutdoorUpdateReadFrom((uint64_t)v26, a2) & 1) != 0)
        {
LABEL_63:
          PBReaderRecallMark();

LABEL_64:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_71:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_64;
    }
  }
}

uint64_t CLPLOGENTRYVISIONVIOEstimationReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t result;
  CLPLOGENTRYVISIONTimeStamp *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;

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
        *(_BYTE *)(a1 + 84) |= 1u;
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
            goto LABEL_53;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_55;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_53:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_55:
        *(_DWORD *)(a1 + 80) = v20;
        goto LABEL_50;
      case 2u:
        v26 = objc_alloc_init(CLPLOGENTRYVISIONTimeStamp);
        v27 = 64;
        goto LABEL_30;
      case 3u:
        v26 = objc_alloc_init(CLPLOGENTRYVISIONTimeStamp);
        v27 = 72;
LABEL_30:
        objc_storeStrong((id *)(a1 + v27), v26);
        if (!PBReaderPlaceMark() || !CLPLOGENTRYVISIONTimeStampReadFrom((uint64_t)v26, a2))
          goto LABEL_57;
        goto LABEL_49;
      case 4u:
        v26 = objc_alloc_init(CLPLOGENTRYVISIONVIOInertialStateInfo);
        objc_storeStrong((id *)(a1 + 56), v26);
        if (!PBReaderPlaceMark()
          || (CLPLOGENTRYVISIONVIOInertialStateInfoReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_57;
        }
        goto LABEL_49;
      case 5u:
        PBReaderReadData();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = 48;
        goto LABEL_41;
      case 6u:
        v26 = objc_alloc_init(CLPLOGENTRYVISIONVIOInertialCovarianceInfo);
        objc_storeStrong((id *)(a1 + 40), v26);
        if (!PBReaderPlaceMark()
          || (CLPLOGENTRYVISIONVIOInertialCovarianceInfoReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_57;
        }
        goto LABEL_49;
      case 7u:
        PBReaderReadData();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = 32;
LABEL_41:
        v30 = *(void **)(a1 + v29);
        *(_QWORD *)(a1 + v29) = v28;

        goto LABEL_50;
      case 8u:
        v26 = objc_alloc_init(CLPLOGENTRYVISIONSimdFloatMxN);
        v31 = 24;
        goto LABEL_44;
      case 9u:
        v26 = objc_alloc_init(CLPLOGENTRYVISIONSimdFloatMxN);
        v31 = 16;
LABEL_44:
        objc_storeStrong((id *)(a1 + v31), v26);
        if (!PBReaderPlaceMark() || (CLPLOGENTRYVISIONSimdFloatMxNReadFrom(v26, a2) & 1) == 0)
          goto LABEL_57;
        goto LABEL_49;
      case 0xAu:
        v26 = objc_alloc_init(CLPLOGENTRYVISIONCGSize);
        objc_storeStrong((id *)(a1 + 8), v26);
        if (PBReaderPlaceMark() && CLPLOGENTRYVISIONCGSizeReadFrom((uint64_t)v26, a2))
        {
LABEL_49:
          PBReaderRecallMark();

LABEL_50:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_57:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_50;
    }
  }
}

uint64_t CLPLOGENTRYVISIONVLLocalizationResultReadFrom(uint64_t a1, uint64_t a2)
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
  CLPLOGENTRYVISIONTimeStamp *v18;
  uint64_t result;
  uint64_t v20;
  unint64_t v21;
  int v22;

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
        v18 = objc_alloc_init(CLPLOGENTRYVISIONTimeStamp);
        objc_storeStrong((id *)(a1 + 40), v18);
        if (PBReaderPlaceMark() && CLPLOGENTRYVISIONTimeStampReadFrom((uint64_t)v18, a2))
          goto LABEL_38;
        goto LABEL_44;
      case 2u:
        v18 = objc_alloc_init(CLPLOGENTRYVISIONVLLocation);
        objc_storeStrong((id *)(a1 + 32), v18);
        if (!PBReaderPlaceMark() || (CLPLOGENTRYVISIONVLLocationReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_44;
        goto LABEL_38;
      case 3u:
        v18 = objc_alloc_init(CLPLOGENTRYVISIONSimdDoubleMxN);
        objc_storeStrong((id *)(a1 + 48), v18);
        if (!PBReaderPlaceMark() || (CLPLOGENTRYVISIONSimdDoubleMxNReadFrom(v18, a2) & 1) == 0)
          goto LABEL_44;
        goto LABEL_38;
      case 4u:
        v18 = objc_alloc_init(CLPLOGENTRYVISIONVLMatrixfMxN);
        objc_storeStrong((id *)(a1 + 16), v18);
        if (!PBReaderPlaceMark() || (CLPLOGENTRYVISIONVLMatrixfMxNReadFrom(v18, a2) & 1) == 0)
          goto LABEL_44;
        goto LABEL_38;
      case 5u:
        *(_BYTE *)(a1 + 56) |= 1u;
        v20 = *v3;
        v21 = *(_QWORD *)(a2 + v20);
        if (v21 <= 0xFFFFFFFFFFFFFFFBLL && v21 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v22 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v22 = 0;
        }
        *(_DWORD *)(a1 + 8) = v22;
        goto LABEL_39;
      case 6u:
        v18 = objc_alloc_init(CLPLOGENTRYVISIONVLLocalizationDebugInfo);
        objc_storeStrong((id *)(a1 + 24), v18);
        if (PBReaderPlaceMark()
          && (CLPLOGENTRYVISIONVLLocalizationDebugInfoReadFrom((uint64_t)v18, a2) & 1) != 0)
        {
LABEL_38:
          PBReaderRecallMark();

LABEL_39:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_44:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_39;
    }
  }
}

uint64_t CLPWorkoutUpdateMotionActivityReadFrom(uint64_t a1, uint64_t a2)
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
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t result;
  uint64_t v32;

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
      v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v22 = 0;
        v23 = 0;
        v24 = 0;
        *(_BYTE *)(a1 + 28) |= 4u;
        while (1)
        {
          v25 = *v3;
          v26 = *(_QWORD *)(a2 + v25);
          v27 = v26 + 1;
          if (v26 == -1 || v27 > *(_QWORD *)(a2 + *v4))
            break;
          v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v26);
          *(_QWORD *)(a2 + v25) = v27;
          v24 |= (unint64_t)(v28 & 0x7F) << v22;
          if ((v28 & 0x80) == 0)
            goto LABEL_37;
          v22 += 7;
          v15 = v23++ >= 9;
          if (v15)
          {
            LODWORD(v24) = 0;
            goto LABEL_39;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v24) = 0;
LABEL_39:
        *(_DWORD *)(a1 + 24) = v24;
      }
      else
      {
        if ((_DWORD)v18 == 2)
        {
          *(_BYTE *)(a1 + 28) |= 1u;
          v29 = *v3;
          v30 = *(_QWORD *)(a2 + v29);
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v21 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v30);
            *(_QWORD *)(a2 + v29) = v30 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v21 = 0;
          }
          v32 = 8;
        }
        else
        {
          if ((_DWORD)v18 != 1)
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
            continue;
          }
          *(_BYTE *)(a1 + 28) |= 2u;
          v19 = *v3;
          v20 = *(_QWORD *)(a2 + v19);
          if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v21 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v20);
            *(_QWORD *)(a2 + v19) = v20 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v21 = 0;
          }
          v32 = 16;
        }
        *(_QWORD *)(a1 + v32) = v21;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL CLPInertialOdometryReadFrom(uint64_t a1, uint64_t a2)
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
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  int *v33;

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
          *(_BYTE *)(a1 + 64) |= 0x40u;
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
          v33 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
          goto LABEL_56;
        case 2u:
          *(_BYTE *)(a1 + 64) |= 1u;
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v22 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v33 = &OBJC_IVAR___CLPInertialOdometry__deltaPositionX;
          goto LABEL_56;
        case 3u:
          *(_BYTE *)(a1 + 64) |= 2u;
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v24);
            *(_QWORD *)(a2 + v23) = v24 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v33 = &OBJC_IVAR___CLPInertialOdometry__deltaPositionY;
          goto LABEL_56;
        case 4u:
          *(_BYTE *)(a1 + 64) |= 4u;
          v25 = *v3;
          v26 = *(_QWORD *)(a2 + v25);
          if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v26);
            *(_QWORD *)(a2 + v25) = v26 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v33 = &OBJC_IVAR___CLPInertialOdometry__deltaPositionZ;
          goto LABEL_56;
        case 5u:
          *(_BYTE *)(a1 + 64) |= 8u;
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v28);
            *(_QWORD *)(a2 + v27) = v28 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v33 = &OBJC_IVAR___CLPInertialOdometry__deltaVelocityX;
          goto LABEL_56;
        case 6u:
          *(_BYTE *)(a1 + 64) |= 0x10u;
          v29 = *v3;
          v30 = *(_QWORD *)(a2 + v29);
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v30);
            *(_QWORD *)(a2 + v29) = v30 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v33 = &OBJC_IVAR___CLPInertialOdometry__deltaVelocityY;
          goto LABEL_56;
        case 7u:
          *(_BYTE *)(a1 + 64) |= 0x20u;
          v31 = *v3;
          v32 = *(_QWORD *)(a2 + v31);
          if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v32);
            *(_QWORD *)(a2 + v31) = v32 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v33 = &OBJC_IVAR___CLPInertialOdometry__deltaVelocityZ;
LABEL_56:
          *(_QWORD *)(a1 + *v33) = v20;
          goto LABEL_57;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
LABEL_57:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          break;
      }
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPOutdoorUpdateReadFrom(uint64_t a1, uint64_t a2)
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
  unint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  unint64_t v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;

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
        break;
      switch((v10 >> 3))
      {
        case 1u:
          *(_BYTE *)(a1 + 40) |= 4u;
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
          v40 = 24;
          goto LABEL_59;
        case 2u:
          *(_BYTE *)(a1 + 40) |= 2u;
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v23);
            *(_QWORD *)(a2 + v22) = v23 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v40 = 16;
          goto LABEL_59;
        case 3u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 40) |= 0x10u;
          while (2)
          {
            v27 = *v3;
            v28 = *(_QWORD *)(a2 + v27);
            v29 = v28 + 1;
            if (v28 == -1 || v29 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
              *(_QWORD *)(a2 + v27) = v29;
              v26 |= (unint64_t)(v30 & 0x7F) << v24;
              if (v30 < 0)
              {
                v24 += 7;
                v15 = v25++ >= 9;
                if (v15)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_47;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v26) = 0;
LABEL_47:
          v39 = 36;
          goto LABEL_52;
        case 4u:
          v31 = 0;
          v32 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 40) |= 8u;
          break;
        case 5u:
          *(_BYTE *)(a1 + 40) |= 1u;
          v37 = *v3;
          v38 = *(_QWORD *)(a2 + v37);
          if (v38 <= 0xFFFFFFFFFFFFFFF7 && v38 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v38);
            *(_QWORD *)(a2 + v37) = v38 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v40 = 8;
LABEL_59:
          *(_QWORD *)(a1 + v40) = v20;
          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v33 = *v3;
        v34 = *(_QWORD *)(a2 + v33);
        v35 = v34 + 1;
        if (v34 == -1 || v35 > *(_QWORD *)(a2 + *v4))
          break;
        v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
        *(_QWORD *)(a2 + v33) = v35;
        v26 |= (unint64_t)(v36 & 0x7F) << v31;
        if ((v36 & 0x80) == 0)
          goto LABEL_49;
        v31 += 7;
        v15 = v32++ >= 9;
        if (v15)
        {
          LODWORD(v26) = 0;
          goto LABEL_51;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_49:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v26) = 0;
LABEL_51:
      v39 = 32;
LABEL_52:
      *(_DWORD *)(a1 + v39) = v26;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL CLPIonosphereCollectionRequestReadFrom(id *a1, uint64_t a2)
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
  CLPMeta *v18;

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
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v18 = objc_alloc_init(CLPMeta);
        objc_storeStrong(a1 + 2, v18);
        if (!PBReaderPlaceMark() || (CLPMetaReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_30;
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_27:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v18 = objc_alloc_init(CLPIonosphereData);
    objc_msgSend(a1, "addIonoData:", v18);
    if (!PBReaderPlaceMark() || !CLPIonosphereDataReadFrom((uint64_t)v18, a2))
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL CLPIonosphereDataReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int *v4;
  int *v5;
  int *v6;
  unint64_t v8;
  int *v9;
  int *v10;
  int *v11;
  int *v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  int v21;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  int *v26;
  int *v27;
  uint64_t v28;
  unint64_t v29;
  int *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  int *v69;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v8 = 0x1EFE30000uLL;
    v9 = &OBJC_IVAR___CLPIonosphereData__latitudeDeg;
    v10 = (int *)MEMORY[0x1E0D82BB8];
    v11 = &OBJC_IVAR___CLPIonosphereData__longitudeDeg;
    v12 = &OBJC_IVAR___CLPIonosphereData__geodeticAltitudeM;
    while (1)
    {
      if (*(_BYTE *)(a2 + *v6))
        return *(_BYTE *)(a2 + *v6) == 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      while (1)
      {
        v16 = *v4;
        v17 = *(_QWORD *)(a2 + v16);
        v18 = v17 + 1;
        if (v17 == -1 || v18 > *(_QWORD *)(a2 + *v5))
          break;
        v19 = *(_BYTE *)(*(_QWORD *)(a2 + *v10) + v17);
        *(_QWORD *)(a2 + v16) = v18;
        v15 |= (unint64_t)(v19 & 0x7F) << v13;
        if ((v19 & 0x80) == 0)
          goto LABEL_12;
        v13 += 7;
        if (v14++ >= 9)
        {
          v15 = 0;
          v21 = *(unsigned __int8 *)(a2 + *v6);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v6) = 1;
LABEL_12:
      v21 = *(unsigned __int8 *)(a2 + *v6);
      if (*(_BYTE *)(a2 + *v6))
        v15 = 0;
LABEL_14:
      if (v21 || (v15 & 7) == 4)
        return *(_BYTE *)(a2 + *v6) == 0;
      switch((v15 >> 3))
      {
        case 1u:
          *(_DWORD *)(a1 + *(int *)(v8 + 2724)) |= 0x200u;
          v23 = *v4;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_QWORD *)(*(_QWORD *)(a2 + *v10) + v24);
            *(_QWORD *)(a2 + v23) = v24 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v69 = v9;
          goto LABEL_116;
        case 2u:
          *(_DWORD *)(a1 + *(int *)(v8 + 2724)) |= 0x400u;
          v33 = *v4;
          v34 = *(_QWORD *)(a2 + v33);
          if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_QWORD *)(*(_QWORD *)(a2 + *v10) + v34);
            *(_QWORD *)(a2 + v33) = v34 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v69 = v11;
          goto LABEL_116;
        case 3u:
          *(_DWORD *)(a1 + *(int *)(v8 + 2724)) |= 0x80u;
          v35 = *v4;
          v36 = *(_QWORD *)(a2 + v35);
          if (v36 <= 0xFFFFFFFFFFFFFFF7 && v36 + 8 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_QWORD *)(*(_QWORD *)(a2 + *v10) + v36);
            *(_QWORD *)(a2 + v35) = v36 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v69 = v12;
          goto LABEL_116;
        case 4u:
          *(_DWORD *)(a1 + *(int *)(v8 + 2724)) |= 1u;
          v37 = *v4;
          v38 = *(_QWORD *)(a2 + v37);
          if (v38 <= 0xFFFFFFFFFFFFFFF7 && v38 + 8 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_QWORD *)(*(_QWORD *)(a2 + *v10) + v38);
            *(_QWORD *)(a2 + v37) = v38 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v69 = &OBJC_IVAR___CLPIonosphereData__applicableTimeSec;
          goto LABEL_116;
        case 5u:
          *(_DWORD *)(a1 + *(int *)(v8 + 2724)) |= 0x100u;
          v39 = *v4;
          v40 = *(_QWORD *)(a2 + v39);
          if (v40 <= 0xFFFFFFFFFFFFFFF7 && v40 + 8 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_QWORD *)(*(_QWORD *)(a2 + *v10) + v40);
            *(_QWORD *)(a2 + v39) = v40 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v69 = &OBJC_IVAR___CLPIonosphereData__hmaxKm;
          goto LABEL_116;
        case 6u:
          *(_DWORD *)(a1 + *(int *)(v8 + 2724)) |= 0x40000u;
          v41 = *v4;
          v42 = *(_QWORD *)(a2 + v41);
          if (v42 <= 0xFFFFFFFFFFFFFFF7 && v42 + 8 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_QWORD *)(*(_QWORD *)(a2 + *v10) + v42);
            *(_QWORD *)(a2 + v41) = v42 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v69 = &OBJC_IVAR___CLPIonosphereData__vtec0;
          goto LABEL_116;
        case 7u:
          *(_DWORD *)(a1 + *(int *)(v8 + 2724)) |= 0x20u;
          v43 = *v4;
          v44 = *(_QWORD *)(a2 + v43);
          if (v44 <= 0xFFFFFFFFFFFFFFF7 && v44 + 8 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_QWORD *)(*(_QWORD *)(a2 + *v10) + v44);
            *(_QWORD *)(a2 + v43) = v44 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v69 = &OBJC_IVAR___CLPIonosphereData__dvtecDtheta;
          goto LABEL_116;
        case 8u:
          *(_DWORD *)(a1 + *(int *)(v8 + 2724)) |= 0x10u;
          v45 = *v4;
          v46 = *(_QWORD *)(a2 + v45);
          if (v46 <= 0xFFFFFFFFFFFFFFF7 && v46 + 8 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_QWORD *)(*(_QWORD *)(a2 + *v10) + v46);
            *(_QWORD *)(a2 + v45) = v46 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v69 = &OBJC_IVAR___CLPIonosphereData__dvtecDphi;
          goto LABEL_116;
        case 9u:
          *(_DWORD *)(a1 + *(int *)(v8 + 2724)) |= 4u;
          v47 = *v4;
          v48 = *(_QWORD *)(a2 + v47);
          if (v48 <= 0xFFFFFFFFFFFFFFF7 && v48 + 8 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_QWORD *)(*(_QWORD *)(a2 + *v10) + v48);
            *(_QWORD *)(a2 + v47) = v48 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v69 = &OBJC_IVAR___CLPIonosphereData__d2vtecDtheta2;
          goto LABEL_116;
        case 0xAu:
          *(_DWORD *)(a1 + *(int *)(v8 + 2724)) |= 8u;
          v49 = *v4;
          v50 = *(_QWORD *)(a2 + v49);
          if (v50 <= 0xFFFFFFFFFFFFFFF7 && v50 + 8 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_QWORD *)(*(_QWORD *)(a2 + *v10) + v50);
            *(_QWORD *)(a2 + v49) = v50 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v69 = &OBJC_IVAR___CLPIonosphereData__d2vtecDthetaphi;
          goto LABEL_116;
        case 0xBu:
          *(_DWORD *)(a1 + *(int *)(v8 + 2724)) |= 2u;
          v51 = *v4;
          v52 = *(_QWORD *)(a2 + v51);
          if (v52 <= 0xFFFFFFFFFFFFFFF7 && v52 + 8 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_QWORD *)(*(_QWORD *)(a2 + *v10) + v52);
            *(_QWORD *)(a2 + v51) = v52 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v69 = &OBJC_IVAR___CLPIonosphereData__d2vtecDphi2;
          goto LABEL_116;
        case 0xCu:
          *(_DWORD *)(a1 + *(int *)(v8 + 2724)) |= 0x40u;
          v53 = *v4;
          v54 = *(_QWORD *)(a2 + v53);
          if (v54 <= 0xFFFFFFFFFFFFFFF7 && v54 + 8 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_QWORD *)(*(_QWORD *)(a2 + *v10) + v54);
            *(_QWORD *)(a2 + v53) = v54 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v69 = &OBJC_IVAR___CLPIonosphereData__estimatorAgeSec;
          goto LABEL_116;
        case 0xDu:
          *(_DWORD *)(a1 + *(int *)(v8 + 2724)) |= 0x10000u;
          v55 = *v4;
          v56 = *(_QWORD *)(a2 + v55);
          if (v56 <= 0xFFFFFFFFFFFFFFF7 && v56 + 8 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_QWORD *)(*(_QWORD *)(a2 + *v10) + v56);
            *(_QWORD *)(a2 + v55) = v56 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v69 = &OBJC_IVAR___CLPIonosphereData__phmaxHmaxKm2;
          goto LABEL_116;
        case 0xEu:
          *(_DWORD *)(a1 + *(int *)(v8 + 2724)) |= 0x20000u;
          v57 = *v4;
          v58 = *(_QWORD *)(a2 + v57);
          if (v58 <= 0xFFFFFFFFFFFFFFF7 && v58 + 8 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_QWORD *)(*(_QWORD *)(a2 + *v10) + v58);
            *(_QWORD *)(a2 + v57) = v58 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v69 = &OBJC_IVAR___CLPIonosphereData__pvtec0Vtec0;
          goto LABEL_116;
        case 0xFu:
          *(_DWORD *)(a1 + *(int *)(v8 + 2724)) |= 0x8000u;
          v59 = *v4;
          v60 = *(_QWORD *)(a2 + v59);
          if (v60 <= 0xFFFFFFFFFFFFFFF7 && v60 + 8 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_QWORD *)(*(_QWORD *)(a2 + *v10) + v60);
            *(_QWORD *)(a2 + v59) = v60 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v69 = &OBJC_IVAR___CLPIonosphereData__pdvtecDthetaDvtecDtheta;
          goto LABEL_116;
        case 0x10u:
          *(_DWORD *)(a1 + *(int *)(v8 + 2724)) |= 0x4000u;
          v61 = *v4;
          v62 = *(_QWORD *)(a2 + v61);
          if (v62 <= 0xFFFFFFFFFFFFFFF7 && v62 + 8 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_QWORD *)(*(_QWORD *)(a2 + *v10) + v62);
            *(_QWORD *)(a2 + v61) = v62 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v69 = &OBJC_IVAR___CLPIonosphereData__pdvtecDphiDvtecDphi;
          goto LABEL_116;
        case 0x11u:
          *(_DWORD *)(a1 + *(int *)(v8 + 2724)) |= 0x1000u;
          v63 = *v4;
          v64 = *(_QWORD *)(a2 + v63);
          if (v64 <= 0xFFFFFFFFFFFFFFF7 && v64 + 8 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_QWORD *)(*(_QWORD *)(a2 + *v10) + v64);
            *(_QWORD *)(a2 + v63) = v64 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v69 = &OBJC_IVAR___CLPIonosphereData__pd2vtecDtheta2D2vtecDtheta2;
          goto LABEL_116;
        case 0x12u:
          *(_DWORD *)(a1 + *(int *)(v8 + 2724)) |= 0x2000u;
          v65 = *v4;
          v66 = *(_QWORD *)(a2 + v65);
          if (v66 <= 0xFFFFFFFFFFFFFFF7 && v66 + 8 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_QWORD *)(*(_QWORD *)(a2 + *v10) + v66);
            *(_QWORD *)(a2 + v65) = v66 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v69 = &OBJC_IVAR___CLPIonosphereData__pd2vtecDthetadphiD2vtecDthetadphi;
          goto LABEL_116;
        case 0x13u:
          *(_DWORD *)(a1 + *(int *)(v8 + 2724)) |= 0x800u;
          v67 = *v4;
          v68 = *(_QWORD *)(a2 + v67);
          if (v68 <= 0xFFFFFFFFFFFFFFF7 && v68 + 8 <= *(_QWORD *)(a2 + *v5))
          {
            v25 = *(_QWORD *)(*(_QWORD *)(a2 + *v10) + v68);
            *(_QWORD *)(a2 + v67) = v68 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v6) = 1;
            v25 = 0;
          }
          v69 = &OBJC_IVAR___CLPIonosphereData__pd2vtecDphi2D2vtecDphi2;
LABEL_116:
          *(_QWORD *)(a1 + *v69) = v25;
          goto LABEL_117;
        default:
          v26 = v9;
          v27 = v11;
          v28 = v2;
          v29 = v8;
          v30 = v12;
          v31 = a1;
          v32 = PBReaderSkipValueWithTag();
          a1 = v31;
          v6 = (int *)MEMORY[0x1E0D82BC8];
          v12 = v30;
          v8 = v29;
          v2 = v28;
          v11 = v27;
          v9 = v26;
          if ((v32 & 1) == 0)
            return 0;
LABEL_117:
          if (*(_QWORD *)(a2 + *v4) >= *(_QWORD *)(a2 + *v5))
            return *(_BYTE *)(a2 + *v6) == 0;
          break;
      }
    }
  }
  return *(_BYTE *)(a2 + *v6) == 0;
}

BOOL CLPLOGENTRYVISIONCGSizeReadFrom(uint64_t a1, uint64_t a2)
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
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int *v23;

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
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        *(_BYTE *)(a1 + 24) |= 2u;
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
        v23 = &OBJC_IVAR___CLPLOGENTRYVISIONCGSize__width;
LABEL_32:
        *(_QWORD *)(a1 + *v23) = v20;
        goto LABEL_33;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_33:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    *(_BYTE *)(a1 + 24) |= 1u;
    v21 = *v3;
    v22 = *(_QWORD *)(a2 + v21);
    if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)(a2 + *v4))
    {
      v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v22);
      *(_QWORD *)(a2 + v21) = v22 + 8;
    }
    else
    {
      *(_BYTE *)(a2 + *v5) = 1;
      v20 = 0;
    }
    v23 = &OBJC_IVAR___CLPLOGENTRYVISIONCGSize__height;
    goto LABEL_32;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPLOGENTRYVISIONLSLHeadingReadFrom(uint64_t a1, uint64_t a2)
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
  CLPLOGENTRYVISIONTimeStamp *v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;

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
        v18 = objc_alloc_init(CLPLOGENTRYVISIONTimeStamp);
        objc_storeStrong((id *)(a1 + 64), v18);
        if (PBReaderPlaceMark() && CLPLOGENTRYVISIONTimeStampReadFrom((uint64_t)v18, a2))
          goto LABEL_47;
        goto LABEL_57;
      case 2u:
        v18 = objc_alloc_init(CLPLOGENTRYVISIONSimdDoubleMxN);
        v20 = 40;
        goto LABEL_26;
      case 3u:
        v18 = objc_alloc_init(CLPLOGENTRYVISIONSimdDoubleMxN);
        v20 = 32;
LABEL_26:
        objc_storeStrong((id *)(a1 + v20), v18);
        if (!PBReaderPlaceMark() || (CLPLOGENTRYVISIONSimdDoubleMxNReadFrom(v18, a2) & 1) == 0)
          goto LABEL_57;
        goto LABEL_47;
      case 4u:
        v18 = objc_alloc_init(CLPLOGENTRYVISIONSimdDoubleM);
        objc_storeStrong((id *)(a1 + 48), v18);
        if (!PBReaderPlaceMark() || (CLPLOGENTRYVISIONSimdDoubleMReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_57;
        goto LABEL_47;
      case 5u:
        *(_BYTE *)(a1 + 72) |= 1u;
        v21 = *v3;
        v22 = *(_QWORD *)(a2 + v21);
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v23 = 0;
        }
        *(_QWORD *)(a1 + 8) = v23;
        goto LABEL_48;
      case 6u:
        v24 = 0;
        v25 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + 72) |= 2u;
        while (2)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          v29 = v28 + 1;
          if (v28 == -1 || v29 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
            *(_QWORD *)(a2 + v27) = v29;
            v26 |= (unint64_t)(v30 & 0x7F) << v24;
            if (v30 < 0)
            {
              v24 += 7;
              v15 = v25++ >= 9;
              if (v15)
              {
                LODWORD(v26) = 0;
                goto LABEL_53;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v26) = 0;
LABEL_53:
        *(_DWORD *)(a1 + 16) = v26;
        goto LABEL_48;
      case 7u:
        v18 = objc_alloc_init(CLPLOGENTRYVISIONLSLLocation);
        objc_storeStrong((id *)(a1 + 24), v18);
        if (!PBReaderPlaceMark() || (CLPLOGENTRYVISIONLSLLocationReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_57;
        goto LABEL_47;
      case 8u:
        v18 = objc_alloc_init(CLPLOGENTRYVISIONLSLHeadingSupplInfo);
        objc_storeStrong((id *)(a1 + 56), v18);
        if (PBReaderPlaceMark()
          && (CLPLOGENTRYVISIONLSLHeadingSupplInfoReadFrom((uint64_t)v18, a2) & 1) != 0)
        {
LABEL_47:
          PBReaderRecallMark();

LABEL_48:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_57:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_48;
    }
  }
}

BOOL CLPLOGENTRYVISIONTimeStampReadFrom(uint64_t a1, uint64_t a2)
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
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  int *v26;

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
      v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        *(_BYTE *)(a1 + 32) |= 4u;
        v22 = *v3;
        v23 = *(_QWORD *)(a2 + v22);
        if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v21 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v23 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v21 = 0;
        }
        v26 = &OBJC_IVAR___CLPLOGENTRYVISIONTimeStamp__machContinuousTimeS;
        goto LABEL_38;
      }
      if ((_DWORD)v18 == 2)
        break;
      if ((_DWORD)v18 == 1)
      {
        *(_BYTE *)(a1 + 32) |= 1u;
        v19 = *v3;
        v20 = *(_QWORD *)(a2 + v19);
        if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v21 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v20);
          *(_QWORD *)(a2 + v19) = v20 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v21 = 0;
        }
        v26 = &OBJC_IVAR___CLPLOGENTRYVISIONTimeStamp__cfAbsoluteTimeS;
LABEL_38:
        *(_QWORD *)(a1 + *v26) = v21;
        goto LABEL_39;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_39:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    *(_BYTE *)(a1 + 32) |= 2u;
    v24 = *v3;
    v25 = *(_QWORD *)(a2 + v24);
    if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(_QWORD *)(a2 + *v4))
    {
      v21 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v25);
      *(_QWORD *)(a2 + v24) = v25 + 8;
    }
    else
    {
      *(_BYTE *)(a2 + *v5) = 1;
      v21 = 0;
    }
    v26 = &OBJC_IVAR___CLPLOGENTRYVISIONTimeStamp__machAbsoluteTimeS;
    goto LABEL_38;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPLOGENTRYVISIONSimdDoubleMxNReadFrom(void *a1, uint64_t a2)
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
  CLPLOGENTRYVISIONSimdDoubleM *v18;
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
        break;
      if ((v10 >> 3) == 1)
      {
        v18 = objc_alloc_init(CLPLOGENTRYVISIONSimdDoubleM);
        objc_msgSend(a1, "addColumns:", v18);
        if (!PBReaderPlaceMark() || (CLPLOGENTRYVISIONSimdDoubleMReadFrom((uint64_t)v18, a2) & 1) == 0)
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

uint64_t CLPLOGENTRYVISIONSimdDoubleMReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  char v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t result;
  unint64_t *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v6 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v7 = 0;
      v8 = 0;
      v9 = 0;
      while (1)
      {
        v10 = *v3;
        v11 = *(_QWORD *)(a2 + v10);
        v12 = v11 + 1;
        if (v11 == -1 || v12 > *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v11);
        *(_QWORD *)(a2 + v10) = v12;
        v9 |= (unint64_t)(v13 & 0x7F) << v7;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v7 += 7;
        if (v8++ >= 9)
        {
          v9 = 0;
          v15 = *v5;
          v16 = *(unsigned __int8 *)(a2 + v15);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *v5;
      v16 = *(unsigned __int8 *)(a2 + v15);
      if (*(_BYTE *)(a2 + v15))
        v9 = 0;
LABEL_14:
      v17 = v9 & 7;
      if (v16 || v17 == 4)
        break;
      if ((v9 >> 3) == 1)
      {
        if (v17 == 2)
        {
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v20 = (unint64_t *)(a2 + *v3);
            v21 = *v20;
            v22 = *(_QWORD *)(a2 + *v4);
            if (*v20 >= v22)
              break;
            v23 = *v5;
            if (*(_BYTE *)(a2 + v23))
              break;
            if (v21 > 0xFFFFFFFFFFFFFFF7 || v21 + 8 > v22)
              *(_BYTE *)(a2 + v23) = 1;
            else
              *v20 = v21 + 8;
            PBRepeatedDoubleAdd();
          }
          PBReaderRecallMark();
        }
        else
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(_QWORD *)(a2 + *v4))
            *(_QWORD *)(a2 + v24) = v25 + 8;
          else
            *(_BYTE *)(a2 + v15) = 1;
          PBRepeatedDoubleAdd();
        }
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        return 0;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPLOGENTRYVISIONLSLLocationReadFrom(uint64_t a1, uint64_t a2)
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
  unint64_t v18;
  CLPLOGENTRYVISIONTimeStamp *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
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
      v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v19 = objc_alloc_init(CLPLOGENTRYVISIONTimeStamp);
        objc_storeStrong((id *)(a1 + 24), v19);
        if (!PBReaderPlaceMark() || !CLPLOGENTRYVISIONTimeStampReadFrom((uint64_t)v19, a2))
        {
LABEL_36:

          return 0;
        }
      }
      else
      {
        if ((_DWORD)v18 == 2)
        {
          *(_BYTE *)(a1 + 32) |= 1u;
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v22 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v22 = 0;
          }
          *(_QWORD *)(a1 + 8) = v22;
          continue;
        }
        if ((_DWORD)v18 != 1)
        {
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
        }
        v19 = objc_alloc_init(CLPLOGENTRYVISIONLSLLocationCoordinate);
        objc_storeStrong((id *)(a1 + 16), v19);
        if (!PBReaderPlaceMark() || !CLPLOGENTRYVISIONLSLLocationCoordinateReadFrom((uint64_t)v19, a2))
          goto LABEL_36;
      }
      PBReaderRecallMark();

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPLOGENTRYVISIONLSLHeadingSupplInfoReadFrom(uint64_t a1, uint64_t a2)
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
  CLPLOGENTRYVISIONLSLMapRoadSegment *v18;
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
        break;
      if ((v10 >> 3) == 1)
      {
        v18 = objc_alloc_init(CLPLOGENTRYVISIONLSLMapRoadSegment);
        objc_storeStrong((id *)(a1 + 8), v18);
        if (!PBReaderPlaceMark()
          || (CLPLOGENTRYVISIONLSLMapRoadSegmentReadFrom((uint64_t)v18, a2) & 1) == 0)
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

uint64_t CLPLOGENTRYVISIONLSLHeadingEstimationReadFrom(_BYTE *a1, uint64_t a2)
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
  unint64_t v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  CLPLOGENTRYVISIONLSLHeading *v32;
  uint64_t result;
  uint64_t v34;

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
      v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v18 != 2)
      {
        if ((_DWORD)v18 != 1)
        {
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          goto LABEL_49;
        }
        v19 = 0;
        v20 = 0;
        v21 = 0;
        a1[24] |= 2u;
        while (1)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          v24 = v23 + 1;
          if (v23 == -1 || v24 > *(_QWORD *)(a2 + *v4))
            break;
          v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v24;
          v21 |= (unint64_t)(v25 & 0x7F) << v19;
          if ((v25 & 0x80) == 0)
            goto LABEL_41;
          v19 += 7;
          v15 = v20++ >= 9;
          if (v15)
          {
            LODWORD(v21) = 0;
            goto LABEL_43;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_43:
        v34 = 20;
        goto LABEL_48;
      }
      v32 = objc_alloc_init(CLPLOGENTRYVISIONLSLHeading);
      objc_msgSend(a1, "addHeadings:", v32);
      if (!PBReaderPlaceMark() || (CLPLOGENTRYVISIONLSLHeadingReadFrom((uint64_t)v32, a2) & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark();

LABEL_49:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v26 = 0;
    v27 = 0;
    v21 = 0;
    a1[24] |= 1u;
    while (1)
    {
      v28 = *v3;
      v29 = *(_QWORD *)(a2 + v28);
      v30 = v29 + 1;
      if (v29 == -1 || v30 > *(_QWORD *)(a2 + *v4))
        break;
      v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
      *(_QWORD *)(a2 + v28) = v30;
      v21 |= (unint64_t)(v31 & 0x7F) << v26;
      if ((v31 & 0x80) == 0)
        goto LABEL_45;
      v26 += 7;
      v15 = v27++ >= 9;
      if (v15)
      {
        LODWORD(v21) = 0;
        goto LABEL_47;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_45:
    if (*(_BYTE *)(a2 + *v5))
      LODWORD(v21) = 0;
LABEL_47:
    v34 = 16;
LABEL_48:
    *(_DWORD *)&a1[v34] = v21;
    goto LABEL_49;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPLOGENTRYVISIONLSLMapRoadSegmentReadFrom(uint64_t a1, uint64_t a2)
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
  CLPLOGENTRYVISIONLSLLocationCoordinate *v25;
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
        break;
      if ((v10 >> 3) == 2)
      {
        v25 = objc_alloc_init(CLPLOGENTRYVISIONLSLLocationCoordinate);
        objc_msgSend((id)a1, "addPolylines:", v25);
        if (!PBReaderPlaceMark() || !CLPLOGENTRYVISIONLSLLocationCoordinateReadFrom((uint64_t)v25, a2))
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((v10 >> 3) == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
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
            goto LABEL_33;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v20 = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_35:
        *(_QWORD *)(a1 + 8) = v20;
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

BOOL CLPLOGENTRYVISIONLSLLocationCoordinateReadFrom(uint64_t a1, uint64_t a2)
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
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int *v23;

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
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        *(_BYTE *)(a1 + 24) |= 1u;
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
        v23 = &OBJC_IVAR___CLPLOGENTRYVISIONLSLLocationCoordinate__latitude;
LABEL_32:
        *(_QWORD *)(a1 + *v23) = v20;
        goto LABEL_33;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_33:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    *(_BYTE *)(a1 + 24) |= 2u;
    v21 = *v3;
    v22 = *(_QWORD *)(a2 + v21);
    if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)(a2 + *v4))
    {
      v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v22);
      *(_QWORD *)(a2 + v21) = v22 + 8;
    }
    else
    {
      *(_BYTE *)(a2 + *v5) = 1;
      v20 = 0;
    }
    v23 = &OBJC_IVAR___CLPLOGENTRYVISIONLSLLocationCoordinate__longitude;
    goto LABEL_32;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPLOGENTRYVISIONSimdFloatMReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  char v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t result;
  unint64_t *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v6 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v7 = 0;
      v8 = 0;
      v9 = 0;
      while (1)
      {
        v10 = *v3;
        v11 = *(_QWORD *)(a2 + v10);
        v12 = v11 + 1;
        if (v11 == -1 || v12 > *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v11);
        *(_QWORD *)(a2 + v10) = v12;
        v9 |= (unint64_t)(v13 & 0x7F) << v7;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v7 += 7;
        if (v8++ >= 9)
        {
          v9 = 0;
          v15 = *v5;
          v16 = *(unsigned __int8 *)(a2 + v15);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *v5;
      v16 = *(unsigned __int8 *)(a2 + v15);
      if (*(_BYTE *)(a2 + v15))
        v9 = 0;
LABEL_14:
      v17 = v9 & 7;
      if (v16 || v17 == 4)
        break;
      if ((v9 >> 3) == 1)
      {
        if (v17 == 2)
        {
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v20 = (unint64_t *)(a2 + *v3);
            v21 = *v20;
            v22 = *(_QWORD *)(a2 + *v4);
            if (*v20 >= v22)
              break;
            v23 = *v5;
            if (*(_BYTE *)(a2 + v23))
              break;
            if (v21 > 0xFFFFFFFFFFFFFFFBLL || v21 + 4 > v22)
              *(_BYTE *)(a2 + v23) = 1;
            else
              *v20 = v21 + 4;
            PBRepeatedFloatAdd();
          }
          PBReaderRecallMark();
        }
        else
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          if (v25 <= 0xFFFFFFFFFFFFFFFBLL && v25 + 4 <= *(_QWORD *)(a2 + *v4))
            *(_QWORD *)(a2 + v24) = v25 + 4;
          else
            *(_BYTE *)(a2 + v15) = 1;
          PBRepeatedFloatAdd();
        }
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        return 0;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPLOGENTRYVISIONSimdFloatMxNReadFrom(void *a1, uint64_t a2)
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
  CLPLOGENTRYVISIONSimdFloatM *v18;
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
        break;
      if ((v10 >> 3) == 1)
      {
        v18 = objc_alloc_init(CLPLOGENTRYVISIONSimdFloatM);
        objc_msgSend(a1, "addColumns:", v18);
        if (!PBReaderPlaceMark() || (CLPLOGENTRYVISIONSimdFloatMReadFrom((uint64_t)v18, a2) & 1) == 0)
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

uint64_t CLPLOGENTRYVISIONVIOInertialStateInfoReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  unint64_t v7;
  unint64_t v8;
  int *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char v20;
  unsigned int v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  BOOL v27;
  int v28;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t result;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  char v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  char v57;
  unsigned int v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char v62;
  char v63;
  unsigned int v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char v68;
  char v69;
  unsigned int v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  char v74;
  char v75;
  unsigned int v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  char v80;
  char v81;
  unsigned int v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  char v86;
  char v87;
  unsigned int v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  char v92;
  char v93;
  unsigned int v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  char v98;
  char v99;
  unsigned int v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  char v104;
  char v105;
  unsigned int v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  char v110;
  uint64_t v111;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = 0x1EFE30000uLL;
    v8 = 0x1EFE30000uLL;
    v9 = (int *)MEMORY[0x1E0D82BB8];
    v10 = 0x1EFE30000uLL;
    v11 = 0x1EFE30000uLL;
    v12 = 0x1EFE30000uLL;
    v13 = 0x1EFE30000uLL;
    v14 = 0x1EFE30000uLL;
    v15 = 0x1EFE30000uLL;
    v16 = 0x1EFE30000uLL;
    v17 = 0x1EFE30000uLL;
    v18 = 0x1EFE30000uLL;
    v19 = 0x1EFE30000uLL;
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      while (1)
      {
        v23 = *v3;
        v24 = *(_QWORD *)(a2 + v23);
        v25 = v24 + 1;
        if (v24 == -1 || v25 > *(_QWORD *)(a2 + *v4))
          break;
        v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v24);
        *(_QWORD *)(a2 + v23) = v25;
        v22 |= (unint64_t)(v26 & 0x7F) << v20;
        if ((v26 & 0x80) == 0)
          goto LABEL_12;
        v20 += 7;
        v27 = v21++ >= 9;
        if (v27)
        {
          v22 = 0;
          v28 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v28 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v22 = 0;
LABEL_14:
      if (v28 || (v22 & 7) == 4)
        break;
      switch((v22 >> 3))
      {
        case 1u:
          v30 = 0;
          v31 = 0;
          v32 = 0;
          *(_WORD *)(a1 + *(int *)(v7 + 3040)) |= 1u;
          while (1)
          {
            v33 = *v3;
            v34 = *(_QWORD *)(a2 + v33);
            v35 = v34 + 1;
            if (v34 == -1 || v35 > *(_QWORD *)(a2 + *v4))
              break;
            v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v34);
            *(_QWORD *)(a2 + v33) = v35;
            v32 |= (unint64_t)(v36 & 0x7F) << v30;
            if ((v36 & 0x80) == 0)
              goto LABEL_106;
            v30 += 7;
            v27 = v31++ >= 9;
            if (v27)
            {
              v32 = 0;
              goto LABEL_108;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_106:
          if (*(_BYTE *)(a2 + *v5))
            v32 = 0;
LABEL_108:
          *(_QWORD *)(a1 + *(int *)(v8 + 3044)) = v32;
          continue;
        case 2u:
          v44 = 0;
          v45 = 0;
          v46 = 0;
          *(_WORD *)(a1 + *(int *)(v7 + 3040)) |= 0x200u;
          while (2)
          {
            v47 = *v3;
            v48 = *(_QWORD *)(a2 + v47);
            v49 = v48 + 1;
            if (v48 == -1 || v49 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v50 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v48);
              *(_QWORD *)(a2 + v47) = v49;
              v46 |= (unint64_t)(v50 & 0x7F) << v44;
              if (v50 < 0)
              {
                v44 += 7;
                v27 = v45++ >= 9;
                if (v27)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_112;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v46) = 0;
LABEL_112:
          v111 = *(int *)(v10 + 3048);
          goto LABEL_153;
        case 3u:
          v51 = 0;
          v52 = 0;
          v46 = 0;
          *(_WORD *)(a1 + *(int *)(v7 + 3040)) |= 0x40u;
          while (2)
          {
            v53 = *v3;
            v54 = *(_QWORD *)(a2 + v53);
            v55 = v54 + 1;
            if (v54 == -1 || v55 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v56 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v54);
              *(_QWORD *)(a2 + v53) = v55;
              v46 |= (unint64_t)(v56 & 0x7F) << v51;
              if (v56 < 0)
              {
                v51 += 7;
                v27 = v52++ >= 9;
                if (v27)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_116;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v46) = 0;
LABEL_116:
          v111 = *(int *)(v11 + 3052);
          goto LABEL_153;
        case 4u:
          v57 = 0;
          v58 = 0;
          v46 = 0;
          *(_WORD *)(a1 + *(int *)(v7 + 3040)) |= 0x20u;
          while (2)
          {
            v59 = *v3;
            v60 = *(_QWORD *)(a2 + v59);
            v61 = v60 + 1;
            if (v60 == -1 || v61 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v62 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v60);
              *(_QWORD *)(a2 + v59) = v61;
              v46 |= (unint64_t)(v62 & 0x7F) << v57;
              if (v62 < 0)
              {
                v57 += 7;
                v27 = v58++ >= 9;
                if (v27)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_120;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v46) = 0;
LABEL_120:
          v111 = *(int *)(v12 + 3056);
          goto LABEL_153;
        case 5u:
          v63 = 0;
          v64 = 0;
          v46 = 0;
          *(_WORD *)(a1 + *(int *)(v7 + 3040)) |= 0x10u;
          while (2)
          {
            v65 = *v3;
            v66 = *(_QWORD *)(a2 + v65);
            v67 = v66 + 1;
            if (v66 == -1 || v67 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v68 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v66);
              *(_QWORD *)(a2 + v65) = v67;
              v46 |= (unint64_t)(v68 & 0x7F) << v63;
              if (v68 < 0)
              {
                v63 += 7;
                v27 = v64++ >= 9;
                if (v27)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_124;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v46) = 0;
LABEL_124:
          v111 = *(int *)(v13 + 3060);
          goto LABEL_153;
        case 6u:
          v69 = 0;
          v70 = 0;
          v46 = 0;
          *(_WORD *)(a1 + *(int *)(v7 + 3040)) |= 8u;
          while (2)
          {
            v71 = *v3;
            v72 = *(_QWORD *)(a2 + v71);
            v73 = v72 + 1;
            if (v72 == -1 || v73 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v74 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v72);
              *(_QWORD *)(a2 + v71) = v73;
              v46 |= (unint64_t)(v74 & 0x7F) << v69;
              if (v74 < 0)
              {
                v69 += 7;
                v27 = v70++ >= 9;
                if (v27)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_128;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v46) = 0;
LABEL_128:
          v111 = *(int *)(v14 + 3064);
          goto LABEL_153;
        case 7u:
          v75 = 0;
          v76 = 0;
          v46 = 0;
          *(_WORD *)(a1 + *(int *)(v7 + 3040)) |= 0x800u;
          while (2)
          {
            v77 = *v3;
            v78 = *(_QWORD *)(a2 + v77);
            v79 = v78 + 1;
            if (v78 == -1 || v79 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v80 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v78);
              *(_QWORD *)(a2 + v77) = v79;
              v46 |= (unint64_t)(v80 & 0x7F) << v75;
              if (v80 < 0)
              {
                v75 += 7;
                v27 = v76++ >= 9;
                if (v27)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_132;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v46) = 0;
LABEL_132:
          v111 = *(int *)(v15 + 3068);
          goto LABEL_153;
        case 8u:
          v81 = 0;
          v82 = 0;
          v46 = 0;
          *(_WORD *)(a1 + *(int *)(v7 + 3040)) |= 0x400u;
          while (2)
          {
            v83 = *v3;
            v84 = *(_QWORD *)(a2 + v83);
            v85 = v84 + 1;
            if (v84 == -1 || v85 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v86 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v84);
              *(_QWORD *)(a2 + v83) = v85;
              v46 |= (unint64_t)(v86 & 0x7F) << v81;
              if (v86 < 0)
              {
                v81 += 7;
                v27 = v82++ >= 9;
                if (v27)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_136;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v46) = 0;
LABEL_136:
          v111 = *(int *)(v16 + 3072);
          goto LABEL_153;
        case 9u:
          v87 = 0;
          v88 = 0;
          v46 = 0;
          *(_WORD *)(a1 + *(int *)(v7 + 3040)) |= 4u;
          while (2)
          {
            v89 = *v3;
            v90 = *(_QWORD *)(a2 + v89);
            v91 = v90 + 1;
            if (v90 == -1 || v91 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v92 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v90);
              *(_QWORD *)(a2 + v89) = v91;
              v46 |= (unint64_t)(v92 & 0x7F) << v87;
              if (v92 < 0)
              {
                v87 += 7;
                v27 = v88++ >= 9;
                if (v27)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_140;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v46) = 0;
LABEL_140:
          v111 = *(int *)(v17 + 3076);
          goto LABEL_153;
        case 0xAu:
          v93 = 0;
          v94 = 0;
          v46 = 0;
          *(_WORD *)(a1 + *(int *)(v7 + 3040)) |= 2u;
          while (2)
          {
            v95 = *v3;
            v96 = *(_QWORD *)(a2 + v95);
            v97 = v96 + 1;
            if (v96 == -1 || v97 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v98 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v96);
              *(_QWORD *)(a2 + v95) = v97;
              v46 |= (unint64_t)(v98 & 0x7F) << v93;
              if (v98 < 0)
              {
                v93 += 7;
                v27 = v94++ >= 9;
                if (v27)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_144;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v46) = 0;
LABEL_144:
          v111 = *(int *)(v18 + 3080);
          goto LABEL_153;
        case 0xBu:
          v99 = 0;
          v100 = 0;
          v46 = 0;
          *(_WORD *)(a1 + *(int *)(v7 + 3040)) |= 0x100u;
          while (2)
          {
            v101 = *v3;
            v102 = *(_QWORD *)(a2 + v101);
            v103 = v102 + 1;
            if (v102 == -1 || v103 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v104 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v102);
              *(_QWORD *)(a2 + v101) = v103;
              v46 |= (unint64_t)(v104 & 0x7F) << v99;
              if (v104 < 0)
              {
                v99 += 7;
                v27 = v100++ >= 9;
                if (v27)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_148;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v46) = 0;
LABEL_148:
          v111 = *(int *)(v19 + 3084);
          goto LABEL_153;
        case 0xCu:
          v105 = 0;
          v106 = 0;
          v46 = 0;
          *(_WORD *)(a1 + *(int *)(v7 + 3040)) |= 0x80u;
          break;
        default:
          v37 = v8;
          v38 = v10;
          v39 = v7;
          v40 = v11;
          v41 = v12;
          v42 = a1;
          result = PBReaderSkipValueWithTag();
          v19 = 0x1EFE30000;
          a1 = v42;
          v13 = 0x1EFE30000;
          v5 = (int *)MEMORY[0x1E0D82BC8];
          v12 = v41;
          v14 = 0x1EFE30000;
          v11 = v40;
          v15 = 0x1EFE30000;
          v7 = v39;
          v17 = 0x1EFE30000;
          v10 = v38;
          v16 = 0x1EFE30000;
          v8 = v37;
          v18 = 0x1EFE30000;
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v107 = *v3;
        v108 = *(_QWORD *)(a2 + v107);
        v109 = v108 + 1;
        if (v108 == -1 || v109 > *(_QWORD *)(a2 + *v4))
          break;
        v110 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v108);
        *(_QWORD *)(a2 + v107) = v109;
        v46 |= (unint64_t)(v110 & 0x7F) << v105;
        if ((v110 & 0x80) == 0)
          goto LABEL_150;
        v105 += 7;
        v27 = v106++ >= 9;
        if (v27)
        {
          LODWORD(v46) = 0;
          goto LABEL_152;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_150:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v46) = 0;
LABEL_152:
      v111 = 40;
LABEL_153:
      *(_DWORD *)(a1 + v111) = v46;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPLOGENTRYVISIONVIOInertialCovarianceInfoReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  unint64_t v7;
  unint64_t v8;
  int *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char v20;
  unsigned int v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  BOOL v27;
  int v28;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t result;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  char v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  char v57;
  unsigned int v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char v62;
  char v63;
  unsigned int v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char v68;
  char v69;
  unsigned int v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  char v74;
  char v75;
  unsigned int v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  char v80;
  char v81;
  unsigned int v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  char v86;
  char v87;
  unsigned int v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  char v92;
  char v93;
  unsigned int v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  char v98;
  char v99;
  unsigned int v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  char v104;
  char v105;
  unsigned int v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  char v110;
  uint64_t v111;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = 0x1EFE30000uLL;
    v8 = 0x1EFE30000uLL;
    v9 = (int *)MEMORY[0x1E0D82BB8];
    v10 = 0x1EFE30000uLL;
    v11 = 0x1EFE30000uLL;
    v12 = 0x1EFE30000uLL;
    v13 = 0x1EFE30000uLL;
    v14 = 0x1EFE30000uLL;
    v15 = 0x1EFE30000uLL;
    v16 = 0x1EFE30000uLL;
    v17 = 0x1EFE30000uLL;
    v18 = 0x1EFE30000uLL;
    v19 = 0x1EFE30000uLL;
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      while (1)
      {
        v23 = *v3;
        v24 = *(_QWORD *)(a2 + v23);
        v25 = v24 + 1;
        if (v24 == -1 || v25 > *(_QWORD *)(a2 + *v4))
          break;
        v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v24);
        *(_QWORD *)(a2 + v23) = v25;
        v22 |= (unint64_t)(v26 & 0x7F) << v20;
        if ((v26 & 0x80) == 0)
          goto LABEL_12;
        v20 += 7;
        v27 = v21++ >= 9;
        if (v27)
        {
          v22 = 0;
          v28 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v28 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v22 = 0;
LABEL_14:
      if (v28 || (v22 & 7) == 4)
        break;
      switch((v22 >> 3))
      {
        case 1u:
          v30 = 0;
          v31 = 0;
          v32 = 0;
          *(_WORD *)(a1 + *(int *)(v7 + 2988)) |= 1u;
          while (1)
          {
            v33 = *v3;
            v34 = *(_QWORD *)(a2 + v33);
            v35 = v34 + 1;
            if (v34 == -1 || v35 > *(_QWORD *)(a2 + *v4))
              break;
            v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v34);
            *(_QWORD *)(a2 + v33) = v35;
            v32 |= (unint64_t)(v36 & 0x7F) << v30;
            if ((v36 & 0x80) == 0)
              goto LABEL_106;
            v30 += 7;
            v27 = v31++ >= 9;
            if (v27)
            {
              v32 = 0;
              goto LABEL_108;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_106:
          if (*(_BYTE *)(a2 + *v5))
            v32 = 0;
LABEL_108:
          *(_QWORD *)(a1 + *(int *)(v8 + 2992)) = v32;
          continue;
        case 2u:
          v44 = 0;
          v45 = 0;
          v46 = 0;
          *(_WORD *)(a1 + *(int *)(v7 + 2988)) |= 8u;
          while (2)
          {
            v47 = *v3;
            v48 = *(_QWORD *)(a2 + v47);
            v49 = v48 + 1;
            if (v48 == -1 || v49 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v50 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v48);
              *(_QWORD *)(a2 + v47) = v49;
              v46 |= (unint64_t)(v50 & 0x7F) << v44;
              if (v50 < 0)
              {
                v44 += 7;
                v27 = v45++ >= 9;
                if (v27)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_112;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v46) = 0;
LABEL_112:
          v111 = *(int *)(v10 + 2996);
          goto LABEL_153;
        case 3u:
          v51 = 0;
          v52 = 0;
          v46 = 0;
          *(_WORD *)(a1 + *(int *)(v7 + 2988)) |= 0x40u;
          while (2)
          {
            v53 = *v3;
            v54 = *(_QWORD *)(a2 + v53);
            v55 = v54 + 1;
            if (v54 == -1 || v55 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v56 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v54);
              *(_QWORD *)(a2 + v53) = v55;
              v46 |= (unint64_t)(v56 & 0x7F) << v51;
              if (v56 < 0)
              {
                v51 += 7;
                v27 = v52++ >= 9;
                if (v27)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_116;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v46) = 0;
LABEL_116:
          v111 = *(int *)(v11 + 3000);
          goto LABEL_153;
        case 4u:
          v57 = 0;
          v58 = 0;
          v46 = 0;
          *(_WORD *)(a1 + *(int *)(v7 + 2988)) |= 0x80u;
          while (2)
          {
            v59 = *v3;
            v60 = *(_QWORD *)(a2 + v59);
            v61 = v60 + 1;
            if (v60 == -1 || v61 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v62 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v60);
              *(_QWORD *)(a2 + v59) = v61;
              v46 |= (unint64_t)(v62 & 0x7F) << v57;
              if (v62 < 0)
              {
                v57 += 7;
                v27 = v58++ >= 9;
                if (v27)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_120;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v46) = 0;
LABEL_120:
          v111 = *(int *)(v12 + 3004);
          goto LABEL_153;
        case 5u:
          v63 = 0;
          v64 = 0;
          v46 = 0;
          *(_WORD *)(a1 + *(int *)(v7 + 2988)) |= 0x10u;
          while (2)
          {
            v65 = *v3;
            v66 = *(_QWORD *)(a2 + v65);
            v67 = v66 + 1;
            if (v66 == -1 || v67 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v68 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v66);
              *(_QWORD *)(a2 + v65) = v67;
              v46 |= (unint64_t)(v68 & 0x7F) << v63;
              if (v68 < 0)
              {
                v63 += 7;
                v27 = v64++ >= 9;
                if (v27)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_124;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v46) = 0;
LABEL_124:
          v111 = *(int *)(v13 + 3008);
          goto LABEL_153;
        case 6u:
          v69 = 0;
          v70 = 0;
          v46 = 0;
          *(_WORD *)(a1 + *(int *)(v7 + 2988)) |= 0x20u;
          while (2)
          {
            v71 = *v3;
            v72 = *(_QWORD *)(a2 + v71);
            v73 = v72 + 1;
            if (v72 == -1 || v73 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v74 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v72);
              *(_QWORD *)(a2 + v71) = v73;
              v46 |= (unint64_t)(v74 & 0x7F) << v69;
              if (v74 < 0)
              {
                v69 += 7;
                v27 = v70++ >= 9;
                if (v27)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_128;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v46) = 0;
LABEL_128:
          v111 = *(int *)(v14 + 3012);
          goto LABEL_153;
        case 7u:
          v75 = 0;
          v76 = 0;
          v46 = 0;
          *(_WORD *)(a1 + *(int *)(v7 + 2988)) |= 0x400u;
          while (2)
          {
            v77 = *v3;
            v78 = *(_QWORD *)(a2 + v77);
            v79 = v78 + 1;
            if (v78 == -1 || v79 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v80 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v78);
              *(_QWORD *)(a2 + v77) = v79;
              v46 |= (unint64_t)(v80 & 0x7F) << v75;
              if (v80 < 0)
              {
                v75 += 7;
                v27 = v76++ >= 9;
                if (v27)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_132;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v46) = 0;
LABEL_132:
          v111 = *(int *)(v15 + 3016);
          goto LABEL_153;
        case 8u:
          v81 = 0;
          v82 = 0;
          v46 = 0;
          *(_WORD *)(a1 + *(int *)(v7 + 2988)) |= 0x800u;
          while (2)
          {
            v83 = *v3;
            v84 = *(_QWORD *)(a2 + v83);
            v85 = v84 + 1;
            if (v84 == -1 || v85 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v86 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v84);
              *(_QWORD *)(a2 + v83) = v85;
              v46 |= (unint64_t)(v86 & 0x7F) << v81;
              if (v86 < 0)
              {
                v81 += 7;
                v27 = v82++ >= 9;
                if (v27)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_136;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v46) = 0;
LABEL_136:
          v111 = *(int *)(v16 + 3020);
          goto LABEL_153;
        case 9u:
          v87 = 0;
          v88 = 0;
          v46 = 0;
          *(_WORD *)(a1 + *(int *)(v7 + 2988)) |= 2u;
          while (2)
          {
            v89 = *v3;
            v90 = *(_QWORD *)(a2 + v89);
            v91 = v90 + 1;
            if (v90 == -1 || v91 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v92 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v90);
              *(_QWORD *)(a2 + v89) = v91;
              v46 |= (unint64_t)(v92 & 0x7F) << v87;
              if (v92 < 0)
              {
                v87 += 7;
                v27 = v88++ >= 9;
                if (v27)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_140;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v46) = 0;
LABEL_140:
          v111 = *(int *)(v17 + 3024);
          goto LABEL_153;
        case 0xAu:
          v93 = 0;
          v94 = 0;
          v46 = 0;
          *(_WORD *)(a1 + *(int *)(v7 + 2988)) |= 4u;
          while (2)
          {
            v95 = *v3;
            v96 = *(_QWORD *)(a2 + v95);
            v97 = v96 + 1;
            if (v96 == -1 || v97 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v98 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v96);
              *(_QWORD *)(a2 + v95) = v97;
              v46 |= (unint64_t)(v98 & 0x7F) << v93;
              if (v98 < 0)
              {
                v93 += 7;
                v27 = v94++ >= 9;
                if (v27)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_144;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v46) = 0;
LABEL_144:
          v111 = *(int *)(v18 + 3028);
          goto LABEL_153;
        case 0xBu:
          v99 = 0;
          v100 = 0;
          v46 = 0;
          *(_WORD *)(a1 + *(int *)(v7 + 2988)) |= 0x100u;
          while (2)
          {
            v101 = *v3;
            v102 = *(_QWORD *)(a2 + v101);
            v103 = v102 + 1;
            if (v102 == -1 || v103 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v104 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v102);
              *(_QWORD *)(a2 + v101) = v103;
              v46 |= (unint64_t)(v104 & 0x7F) << v99;
              if (v104 < 0)
              {
                v99 += 7;
                v27 = v100++ >= 9;
                if (v27)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_148;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v46) = 0;
LABEL_148:
          v111 = *(int *)(v19 + 3032);
          goto LABEL_153;
        case 0xCu:
          v105 = 0;
          v106 = 0;
          v46 = 0;
          *(_WORD *)(a1 + *(int *)(v7 + 2988)) |= 0x200u;
          break;
        default:
          v37 = v8;
          v38 = v10;
          v39 = v7;
          v40 = v11;
          v41 = v12;
          v42 = a1;
          result = PBReaderSkipValueWithTag();
          v19 = 0x1EFE30000;
          a1 = v42;
          v13 = 0x1EFE30000;
          v5 = (int *)MEMORY[0x1E0D82BC8];
          v12 = v41;
          v14 = 0x1EFE30000;
          v11 = v40;
          v15 = 0x1EFE30000;
          v7 = v39;
          v17 = 0x1EFE30000;
          v10 = v38;
          v16 = 0x1EFE30000;
          v8 = v37;
          v18 = 0x1EFE30000;
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v107 = *v3;
        v108 = *(_QWORD *)(a2 + v107);
        v109 = v108 + 1;
        if (v108 == -1 || v109 > *(_QWORD *)(a2 + *v4))
          break;
        v110 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v108);
        *(_QWORD *)(a2 + v107) = v109;
        v46 |= (unint64_t)(v110 & 0x7F) << v105;
        if ((v110 & 0x80) == 0)
          goto LABEL_150;
        v105 += 7;
        v27 = v106++ >= 9;
        if (v27)
        {
          LODWORD(v46) = 0;
          goto LABEL_152;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_150:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v46) = 0;
LABEL_152:
      v111 = 48;
LABEL_153:
      *(_DWORD *)(a1 + v111) = v46;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPLOGENTRYVISIONVLLocalizationDebugInfoReadFrom(uint64_t a1, uint64_t a2)
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
  CLPLOGENTRYVISIONVLLocalizationMaps488Details *v18;
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
        break;
      if ((v10 >> 3) == 1)
      {
        v18 = objc_alloc_init(CLPLOGENTRYVISIONVLLocalizationMaps488Details);
        objc_storeStrong((id *)(a1 + 8), v18);
        if (!PBReaderPlaceMark()
          || (CLPLOGENTRYVISIONVLLocalizationMaps488DetailsReadFrom((uint64_t)v18, a2) & 1) == 0)
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

uint64_t CLPLOGENTRYVISIONVLLocalizationMaps488DetailsReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v16;
  int v17;
  int v18;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t *v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  unint64_t *v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  char v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  unint64_t *v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  char v56;
  unsigned int v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  uint64_t v62;
  void *v63;
  char v64;
  unsigned int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char v70;
  unint64_t *v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  char v75;
  unsigned int v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char v81;
  char v82;
  unsigned int v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  char v87;
  char v88;
  unsigned int v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  char v94;
  unint64_t *v95;
  unint64_t v96;
  unint64_t v97;
  uint64_t v98;
  unint64_t *v99;
  unint64_t v100;
  unint64_t v101;
  uint64_t v102;
  unint64_t *v103;
  unint64_t v104;
  unint64_t v105;
  uint64_t v106;
  unint64_t *v107;
  unint64_t v108;
  unint64_t v109;
  uint64_t v110;
  unint64_t *v111;
  unint64_t v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char v116;
  unsigned int v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  char v122;
  char v123;
  unsigned int v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  unint64_t v128;
  char v129;
  char v130;
  unsigned int v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  char v136;
  char v137;
  unsigned int v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  char v143;
  uint64_t v144;
  unint64_t v145;
  uint64_t v146;
  unint64_t v147;
  uint64_t result;

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
          v15 = v9++ >= 9;
          if (v15)
          {
            v10 = 0;
            v16 = *v5;
            v17 = *(unsigned __int8 *)(a2 + v16);
            goto LABEL_14;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
        v16 = *v5;
        v17 = *(unsigned __int8 *)(a2 + v16);
        if (*(_BYTE *)(a2 + v16))
          v10 = 0;
LABEL_14:
        v18 = v10 & 7;
        if (!v17 && v18 != 4)
        {
          switch((v10 >> 3))
          {
            case 1u:
              v20 = 0;
              v21 = 0;
              v22 = 0;
              *(_BYTE *)(a1 + 384) |= 4u;
              while (1)
              {
                v23 = *v3;
                v24 = *(_QWORD *)(a2 + v23);
                v25 = v24 + 1;
                if (v24 == -1 || v25 > *(_QWORD *)(a2 + *v4))
                  break;
                v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
                *(_QWORD *)(a2 + v23) = v25;
                v22 |= (unint64_t)(v26 & 0x7F) << v20;
                if ((v26 & 0x80) == 0)
                  goto LABEL_194;
                v20 += 7;
                v15 = v21++ >= 9;
                if (v15)
                {
                  v22 = 0;
                  goto LABEL_196;
                }
              }
              *(_BYTE *)(a2 + *v5) = 1;
LABEL_194:
              if (*(_BYTE *)(a2 + *v5))
                v22 = 0;
LABEL_196:
              v115 = 360;
              goto LABEL_209;
            case 2u:
              if (v18 != 2)
                goto LABEL_245;
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (1)
              {
                v27 = (unint64_t *)(a2 + *v3);
                v28 = *v27;
                v29 = *(_QWORD *)(a2 + *v4);
                if (*v27 >= v29)
                  break;
                v30 = *v5;
                if (*(_BYTE *)(a2 + v30))
                  break;
                if (v28 > 0xFFFFFFFFFFFFFFFBLL || v28 + 4 > v29)
                  *(_BYTE *)(a2 + v30) = 1;
                else
                  *v27 = v28 + 4;
                PBRepeatedFloatAdd();
              }
              goto LABEL_192;
            case 3u:
              if (v18 != 2)
                goto LABEL_250;
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (1)
              {
                v31 = (unint64_t *)(a2 + *v3);
                v32 = *v31;
                v33 = *(_QWORD *)(a2 + *v4);
                if (*v31 >= v33)
                  break;
                v34 = *v5;
                if (*(_BYTE *)(a2 + v34))
                  break;
                if (v32 > 0xFFFFFFFFFFFFFFF7 || v32 + 8 > v33)
                  *(_BYTE *)(a2 + v34) = 1;
                else
                  *v31 = v32 + 8;
                PBRepeatedDoubleAdd();
              }
              goto LABEL_192;
            case 4u:
              if (v18 != 2)
              {
                v116 = 0;
                v117 = 0;
                v118 = 0;
                while (1)
                {
                  v119 = *v3;
                  v120 = *(_QWORD *)(a2 + v119);
                  v121 = v120 + 1;
                  if (v120 == -1 || v121 > *(_QWORD *)(a2 + *v4))
                    goto LABEL_243;
                  v122 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v120);
                  *(_QWORD *)(a2 + v119) = v121;
                  v118 |= (unint64_t)(v122 & 0x7F) << v116;
                  if (v122 < 0)
                  {
                    v116 += 7;
                    v15 = v117++ >= 9;
                    if (!v15)
                      continue;
                  }
                  goto LABEL_244;
                }
              }
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
              {
                v35 = 0;
                v36 = 0;
                v37 = 0;
                while (1)
                {
                  v38 = *v3;
                  v39 = *(_QWORD *)(a2 + v38);
                  v40 = v39 + 1;
                  if (v39 == -1 || v40 > *(_QWORD *)(a2 + *v4))
                    break;
                  v41 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v39);
                  *(_QWORD *)(a2 + v38) = v40;
                  v37 |= (unint64_t)(v41 & 0x7F) << v35;
                  if (v41 < 0)
                  {
                    v35 += 7;
                    v15 = v36++ >= 9;
                    if (!v15)
                      continue;
                  }
                  goto LABEL_58;
                }
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_58:
                PBRepeatedInt32Add();
              }
              goto LABEL_192;
            case 5u:
              if (v18 != 2)
                goto LABEL_250;
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (1)
              {
                v42 = (unint64_t *)(a2 + *v3);
                v43 = *v42;
                v44 = *(_QWORD *)(a2 + *v4);
                if (*v42 >= v44)
                  break;
                v45 = *v5;
                if (*(_BYTE *)(a2 + v45))
                  break;
                if (v43 > 0xFFFFFFFFFFFFFFF7 || v43 + 8 > v44)
                  *(_BYTE *)(a2 + v45) = 1;
                else
                  *v42 = v43 + 8;
                PBRepeatedDoubleAdd();
              }
              goto LABEL_192;
            case 6u:
              v46 = 0;
              v47 = 0;
              v22 = 0;
              *(_BYTE *)(a1 + 384) |= 8u;
              while (2)
              {
                v48 = *v3;
                v49 = *(_QWORD *)(a2 + v48);
                v50 = v49 + 1;
                if (v49 == -1 || v50 > *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v51 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v49);
                  *(_QWORD *)(a2 + v48) = v50;
                  v22 |= (unint64_t)(v51 & 0x7F) << v46;
                  if (v51 < 0)
                  {
                    v46 += 7;
                    v15 = v47++ >= 9;
                    if (v15)
                    {
                      v22 = 0;
                      goto LABEL_200;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                v22 = 0;
LABEL_200:
              v115 = 368;
              goto LABEL_209;
            case 7u:
              if (v18 != 2)
                goto LABEL_245;
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (1)
              {
                v52 = (unint64_t *)(a2 + *v3);
                v53 = *v52;
                v54 = *(_QWORD *)(a2 + *v4);
                if (*v52 >= v54)
                  break;
                v55 = *v5;
                if (*(_BYTE *)(a2 + v55))
                  break;
                if (v53 > 0xFFFFFFFFFFFFFFFBLL || v53 + 4 > v54)
                  *(_BYTE *)(a2 + v55) = 1;
                else
                  *v52 = v53 + 4;
                PBRepeatedFloatAdd();
              }
              goto LABEL_192;
            case 8u:
              v56 = 0;
              v57 = 0;
              v22 = 0;
              *(_BYTE *)(a1 + 384) |= 1u;
              while (2)
              {
                v58 = *v3;
                v59 = *(_QWORD *)(a2 + v58);
                v60 = v59 + 1;
                if (v59 == -1 || v60 > *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v61 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v59);
                  *(_QWORD *)(a2 + v58) = v60;
                  v22 |= (unint64_t)(v61 & 0x7F) << v56;
                  if (v61 < 0)
                  {
                    v56 += 7;
                    v15 = v57++ >= 9;
                    if (v15)
                    {
                      v22 = 0;
                      goto LABEL_204;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                v22 = 0;
LABEL_204:
              v115 = 344;
              goto LABEL_209;
            case 9u:
              PBReaderReadData();
              v62 = objc_claimAutoreleasedReturnValue();
              v63 = *(void **)(a1 + 376);
              *(_QWORD *)(a1 + 376) = v62;

              goto LABEL_255;
            case 0xAu:
              if (v18 != 2)
              {
                v123 = 0;
                v124 = 0;
                v125 = 0;
                while (1)
                {
                  v126 = *v3;
                  v127 = *(_QWORD *)(a2 + v126);
                  v128 = v127 + 1;
                  if (v127 == -1 || v128 > *(_QWORD *)(a2 + *v4))
                    goto LABEL_243;
                  v129 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v127);
                  *(_QWORD *)(a2 + v126) = v128;
                  v125 |= (unint64_t)(v129 & 0x7F) << v123;
                  if (v129 < 0)
                  {
                    v123 += 7;
                    v15 = v124++ >= 9;
                    if (!v15)
                      continue;
                  }
                  goto LABEL_244;
                }
              }
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
              {
                v64 = 0;
                v65 = 0;
                v66 = 0;
                while (1)
                {
                  v67 = *v3;
                  v68 = *(_QWORD *)(a2 + v67);
                  v69 = v68 + 1;
                  if (v68 == -1 || v69 > *(_QWORD *)(a2 + *v4))
                    break;
                  v70 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v68);
                  *(_QWORD *)(a2 + v67) = v69;
                  v66 |= (unint64_t)(v70 & 0x7F) << v64;
                  if (v70 < 0)
                  {
                    v64 += 7;
                    v15 = v65++ >= 9;
                    if (!v15)
                      continue;
                  }
                  goto LABEL_104;
                }
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_104:
                PBRepeatedInt32Add();
              }
              goto LABEL_192;
            case 0xBu:
              if (v18 != 2)
                goto LABEL_245;
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (1)
              {
                v71 = (unint64_t *)(a2 + *v3);
                v72 = *v71;
                v73 = *(_QWORD *)(a2 + *v4);
                if (*v71 >= v73)
                  break;
                v74 = *v5;
                if (*(_BYTE *)(a2 + v74))
                  break;
                if (v72 > 0xFFFFFFFFFFFFFFFBLL || v72 + 4 > v73)
                  *(_BYTE *)(a2 + v74) = 1;
                else
                  *v71 = v72 + 4;
                PBRepeatedFloatAdd();
              }
              goto LABEL_192;
            case 0xCu:
              if (v18 != 2)
              {
                v130 = 0;
                v131 = 0;
                v132 = 0;
                while (1)
                {
                  v133 = *v3;
                  v134 = *(_QWORD *)(a2 + v133);
                  v135 = v134 + 1;
                  if (v134 == -1 || v135 > *(_QWORD *)(a2 + *v4))
                    goto LABEL_243;
                  v136 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v134);
                  *(_QWORD *)(a2 + v133) = v135;
                  v132 |= (unint64_t)(v136 & 0x7F) << v130;
                  if (v136 < 0)
                  {
                    v130 += 7;
                    v15 = v131++ >= 9;
                    if (!v15)
                      continue;
                  }
                  goto LABEL_244;
                }
              }
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
              {
                v75 = 0;
                v76 = 0;
                v77 = 0;
                while (1)
                {
                  v78 = *v3;
                  v79 = *(_QWORD *)(a2 + v78);
                  v80 = v79 + 1;
                  if (v79 == -1 || v80 > *(_QWORD *)(a2 + *v4))
                    break;
                  v81 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v79);
                  *(_QWORD *)(a2 + v78) = v80;
                  v77 |= (unint64_t)(v81 & 0x7F) << v75;
                  if (v81 < 0)
                  {
                    v75 += 7;
                    v15 = v76++ >= 9;
                    if (!v15)
                      continue;
                  }
                  goto LABEL_126;
                }
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_126:
                PBRepeatedInt32Add();
              }
              goto LABEL_192;
            case 0xDu:
              v82 = 0;
              v83 = 0;
              v22 = 0;
              *(_BYTE *)(a1 + 384) |= 2u;
              while (2)
              {
                v84 = *v3;
                v85 = *(_QWORD *)(a2 + v84);
                v86 = v85 + 1;
                if (v85 == -1 || v86 > *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v87 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v85);
                  *(_QWORD *)(a2 + v84) = v86;
                  v22 |= (unint64_t)(v87 & 0x7F) << v82;
                  if (v87 < 0)
                  {
                    v82 += 7;
                    v15 = v83++ >= 9;
                    if (v15)
                    {
                      v22 = 0;
                      goto LABEL_208;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                v22 = 0;
LABEL_208:
              v115 = 352;
LABEL_209:
              *(_QWORD *)(a1 + v115) = v22;
              goto LABEL_255;
            case 0xEu:
              if (v18 != 2)
              {
                v137 = 0;
                v138 = 0;
                v139 = 0;
                while (1)
                {
                  v140 = *v3;
                  v141 = *(_QWORD *)(a2 + v140);
                  v142 = v141 + 1;
                  if (v141 == -1 || v142 > *(_QWORD *)(a2 + *v4))
                    break;
                  v143 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v141);
                  *(_QWORD *)(a2 + v140) = v142;
                  v139 |= (unint64_t)(v143 & 0x7F) << v137;
                  if (v143 < 0)
                  {
                    v137 += 7;
                    v15 = v138++ >= 9;
                    if (!v15)
                      continue;
                  }
                  goto LABEL_244;
                }
LABEL_243:
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_244:
                PBRepeatedInt32Add();
                goto LABEL_255;
              }
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
              {
                v88 = 0;
                v89 = 0;
                v90 = 0;
                while (1)
                {
                  v91 = *v3;
                  v92 = *(_QWORD *)(a2 + v91);
                  v93 = v92 + 1;
                  if (v92 == -1 || v93 > *(_QWORD *)(a2 + *v4))
                    break;
                  v94 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v92);
                  *(_QWORD *)(a2 + v91) = v93;
                  v90 |= (unint64_t)(v94 & 0x7F) << v88;
                  if (v94 < 0)
                  {
                    v88 += 7;
                    v15 = v89++ >= 9;
                    if (!v15)
                      continue;
                  }
                  goto LABEL_146;
                }
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_146:
                PBRepeatedInt32Add();
              }
              goto LABEL_192;
            case 0xFu:
              if (v18 != 2)
                goto LABEL_245;
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (1)
              {
                v95 = (unint64_t *)(a2 + *v3);
                v96 = *v95;
                v97 = *(_QWORD *)(a2 + *v4);
                if (*v95 >= v97)
                  break;
                v98 = *v5;
                if (*(_BYTE *)(a2 + v98))
                  break;
                if (v96 > 0xFFFFFFFFFFFFFFFBLL || v96 + 4 > v97)
                  *(_BYTE *)(a2 + v98) = 1;
                else
                  *v95 = v96 + 4;
                PBRepeatedFloatAdd();
              }
              goto LABEL_192;
            case 0x10u:
              if (v18 != 2)
                goto LABEL_245;
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (1)
              {
                v99 = (unint64_t *)(a2 + *v3);
                v100 = *v99;
                v101 = *(_QWORD *)(a2 + *v4);
                if (*v99 >= v101)
                  break;
                v102 = *v5;
                if (*(_BYTE *)(a2 + v102))
                  break;
                if (v100 > 0xFFFFFFFFFFFFFFFBLL || v100 + 4 > v101)
                  *(_BYTE *)(a2 + v102) = 1;
                else
                  *v99 = v100 + 4;
                PBRepeatedFloatAdd();
              }
              goto LABEL_192;
            case 0x11u:
              if (v18 != 2)
              {
LABEL_245:
                v144 = *v3;
                v145 = *(_QWORD *)(a2 + v144);
                if (v145 <= 0xFFFFFFFFFFFFFFFBLL && v145 + 4 <= *(_QWORD *)(a2 + *v4))
                  *(_QWORD *)(a2 + v144) = v145 + 4;
                else
                  *(_BYTE *)(a2 + v16) = 1;
                PBRepeatedFloatAdd();
                goto LABEL_255;
              }
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (1)
              {
                v103 = (unint64_t *)(a2 + *v3);
                v104 = *v103;
                v105 = *(_QWORD *)(a2 + *v4);
                if (*v103 >= v105)
                  break;
                v106 = *v5;
                if (*(_BYTE *)(a2 + v106))
                  break;
                if (v104 > 0xFFFFFFFFFFFFFFFBLL || v104 + 4 > v105)
                  *(_BYTE *)(a2 + v106) = 1;
                else
                  *v103 = v104 + 4;
                PBRepeatedFloatAdd();
              }
              goto LABEL_192;
            case 0x12u:
              if (v18 != 2)
                goto LABEL_250;
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (1)
              {
                v107 = (unint64_t *)(a2 + *v3);
                v108 = *v107;
                v109 = *(_QWORD *)(a2 + *v4);
                if (*v107 >= v109)
                  break;
                v110 = *v5;
                if (*(_BYTE *)(a2 + v110))
                  break;
                if (v108 > 0xFFFFFFFFFFFFFFF7 || v108 + 8 > v109)
                  *(_BYTE *)(a2 + v110) = 1;
                else
                  *v107 = v108 + 8;
                PBRepeatedDoubleAdd();
              }
              goto LABEL_192;
            case 0x13u:
              if (v18 == 2)
              {
                result = PBReaderPlaceMark();
                if (!(_DWORD)result)
                  return result;
                while (1)
                {
                  v111 = (unint64_t *)(a2 + *v3);
                  v112 = *v111;
                  v113 = *(_QWORD *)(a2 + *v4);
                  if (*v111 >= v113)
                    break;
                  v114 = *v5;
                  if (*(_BYTE *)(a2 + v114))
                    break;
                  if (v112 > 0xFFFFFFFFFFFFFFF7 || v112 + 8 > v113)
                    *(_BYTE *)(a2 + v114) = 1;
                  else
                    *v111 = v112 + 8;
                  PBRepeatedDoubleAdd();
                }
LABEL_192:
                PBReaderRecallMark();
              }
              else
              {
LABEL_250:
                v146 = *v3;
                v147 = *(_QWORD *)(a2 + v146);
                if (v147 <= 0xFFFFFFFFFFFFFFF7 && v147 + 8 <= *(_QWORD *)(a2 + *v4))
                  *(_QWORD *)(a2 + v146) = v147 + 8;
                else
                  *(_BYTE *)(a2 + v16) = 1;
                PBRepeatedDoubleAdd();
              }
LABEL_255:
              if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
                return *(_BYTE *)(a2 + *v5) == 0;
              continue;
            default:
              if ((PBReaderSkipValueWithTag() & 1) != 0)
                goto LABEL_255;
              return 0;
          }
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPLOGENTRYVISIONVLLocationReadFrom(uint64_t a1, uint64_t a2)
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
  CLPLOGENTRYVISIONSimdDoubleM *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
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
        break;
      if ((v10 >> 3) == 2)
      {
        *(_BYTE *)(a1 + 24) |= 1u;
        v19 = *v3;
        v20 = *(_QWORD *)(a2 + v19);
        if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v21 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v20);
          *(_QWORD *)(a2 + v19) = v20 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v21 = 0;
        }
        *(_QWORD *)(a1 + 8) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        v18 = objc_alloc_init(CLPLOGENTRYVISIONSimdDoubleM);
        objc_storeStrong((id *)(a1 + 16), v18);
        if (!PBReaderPlaceMark() || (CLPLOGENTRYVISIONSimdDoubleMReadFrom((uint64_t)v18, a2) & 1) == 0)
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

uint64_t CLPLOGENTRYVISIONVLMatrixfMxNReadFrom(void *a1, uint64_t a2)
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
  CLPLOGENTRYVISIONVLVectorfM *v18;
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
        break;
      if ((v10 >> 3) == 1)
      {
        v18 = objc_alloc_init(CLPLOGENTRYVISIONVLVectorfM);
        objc_msgSend(a1, "addRows:", v18);
        if (!PBReaderPlaceMark() || (CLPLOGENTRYVISIONVLVectorfMReadFrom((uint64_t)v18, a2) & 1) == 0)
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

uint64_t CLPLOGENTRYVISIONVLVectorfMReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  char v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t result;
  unint64_t *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v6 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v7 = 0;
      v8 = 0;
      v9 = 0;
      while (1)
      {
        v10 = *v3;
        v11 = *(_QWORD *)(a2 + v10);
        v12 = v11 + 1;
        if (v11 == -1 || v12 > *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v11);
        *(_QWORD *)(a2 + v10) = v12;
        v9 |= (unint64_t)(v13 & 0x7F) << v7;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v7 += 7;
        if (v8++ >= 9)
        {
          v9 = 0;
          v15 = *v5;
          v16 = *(unsigned __int8 *)(a2 + v15);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *v5;
      v16 = *(unsigned __int8 *)(a2 + v15);
      if (*(_BYTE *)(a2 + v15))
        v9 = 0;
LABEL_14:
      v17 = v9 & 7;
      if (v16 || v17 == 4)
        break;
      if ((v9 >> 3) == 1)
      {
        if (v17 == 2)
        {
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v20 = (unint64_t *)(a2 + *v3);
            v21 = *v20;
            v22 = *(_QWORD *)(a2 + *v4);
            if (*v20 >= v22)
              break;
            v23 = *v5;
            if (*(_BYTE *)(a2 + v23))
              break;
            if (v21 > 0xFFFFFFFFFFFFFFFBLL || v21 + 4 > v22)
              *(_BYTE *)(a2 + v23) = 1;
            else
              *v20 = v21 + 4;
            PBRepeatedFloatAdd();
          }
          PBReaderRecallMark();
        }
        else
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          if (v25 <= 0xFFFFFFFFFFFFFFFBLL && v25 + 4 <= *(_QWORD *)(a2 + *v4))
            *(_QWORD *)(a2 + v24) = v25 + 4;
          else
            *(_BYTE *)(a2 + v15) = 1;
          PBRepeatedFloatAdd();
        }
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        return 0;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL CLPSatelliteReportReadFrom(uint64_t a1, uint64_t a2)
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
  CLPSatelliteInfo *v18;
  uint64_t v19;

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
        v18 = objc_alloc_init(CLPSatelliteInfo);
        v19 = 24;
        goto LABEL_25;
      case 2u:
        v18 = objc_alloc_init(CLPSatelliteInfo);
        v19 = 16;
        goto LABEL_25;
      case 3u:
        v18 = objc_alloc_init(CLPSatelliteInfo);
        v19 = 32;
        goto LABEL_25;
      case 4u:
        v18 = objc_alloc_init(CLPSatelliteInfo);
        v19 = 8;
LABEL_25:
        objc_storeStrong((id *)(a1 + v19), v18);
        if (PBReaderPlaceMark() && (CLPSatelliteInfoReadFrom((uint64_t)v18, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_28:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_28;
    }
  }
}

uint64_t CLPPipelineDiagnosticReportReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v16;
  int v17;
  int v18;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t *v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  char v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t result;

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
          v15 = v9++ >= 9;
          if (v15)
          {
            v10 = 0;
            v16 = *v5;
            v17 = *(unsigned __int8 *)(a2 + v16);
            goto LABEL_14;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
        v16 = *v5;
        v17 = *(unsigned __int8 *)(a2 + v16);
        if (*(_BYTE *)(a2 + v16))
          v10 = 0;
LABEL_14:
        v18 = v10 & 7;
        if (!v17 && v18 != 4)
        {
          switch((v10 >> 3))
          {
            case 1u:
              v20 = 0;
              v21 = 0;
              v22 = 0;
              *(_WORD *)(a1 + 124) |= 0x1000u;
              while (1)
              {
                v23 = *v3;
                v24 = *(_QWORD *)(a2 + v23);
                v25 = v24 + 1;
                if (v24 == -1 || v25 > *(_QWORD *)(a2 + *v4))
                  break;
                v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
                *(_QWORD *)(a2 + v23) = v25;
                v22 |= (unint64_t)(v26 & 0x7F) << v20;
                if ((v26 & 0x80) == 0)
                  goto LABEL_82;
                v20 += 7;
                v15 = v21++ >= 9;
                if (v15)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_84;
                }
              }
              *(_BYTE *)(a2 + *v5) = 1;
LABEL_82:
              if (*(_BYTE *)(a2 + *v5))
                LODWORD(v22) = 0;
LABEL_84:
              v64 = 120;
              goto LABEL_93;
            case 2u:
              *(_WORD *)(a1 + 124) |= 0x100u;
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
              v67 = 96;
              goto LABEL_118;
            case 3u:
              *(_WORD *)(a1 + 124) |= 1u;
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
              v67 = 32;
              goto LABEL_118;
            case 4u:
              *(_WORD *)(a1 + 124) |= 0x200u;
              v32 = *v3;
              v33 = *(_QWORD *)(a2 + v32);
              if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(_QWORD *)(a2 + *v4))
              {
                v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v33);
                *(_QWORD *)(a2 + v32) = v33 + 8;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v29 = 0;
              }
              v67 = 104;
              goto LABEL_118;
            case 5u:
              *(_WORD *)(a1 + 124) |= 2u;
              v34 = *v3;
              v35 = *(_QWORD *)(a2 + v34);
              if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(_QWORD *)(a2 + *v4))
              {
                v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v35);
                *(_QWORD *)(a2 + v34) = v35 + 8;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v29 = 0;
              }
              v67 = 40;
              goto LABEL_118;
            case 6u:
              *(_WORD *)(a1 + 124) |= 0x80u;
              v36 = *v3;
              v37 = *(_QWORD *)(a2 + v36);
              if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(_QWORD *)(a2 + *v4))
              {
                v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v37);
                *(_QWORD *)(a2 + v36) = v37 + 8;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v29 = 0;
              }
              v67 = 88;
              goto LABEL_118;
            case 7u:
              *(_WORD *)(a1 + 124) |= 0x40u;
              v38 = *v3;
              v39 = *(_QWORD *)(a2 + v38);
              if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(_QWORD *)(a2 + *v4))
              {
                v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v39);
                *(_QWORD *)(a2 + v38) = v39 + 8;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v29 = 0;
              }
              v67 = 80;
              goto LABEL_118;
            case 8u:
              if (v18 == 2)
              {
                result = PBReaderPlaceMark();
                if (!(_DWORD)result)
                  return result;
                while (1)
                {
                  v40 = (unint64_t *)(a2 + *v3);
                  v41 = *v40;
                  v42 = *(_QWORD *)(a2 + *v4);
                  if (*v40 >= v42)
                    break;
                  v43 = *v5;
                  if (*(_BYTE *)(a2 + v43))
                    break;
                  if (v41 > 0xFFFFFFFFFFFFFFF7 || v41 + 8 > v42)
                    *(_BYTE *)(a2 + v43) = 1;
                  else
                    *v40 = v41 + 8;
                  PBRepeatedDoubleAdd();
                }
                PBReaderRecallMark();
              }
              else
              {
                v65 = *v3;
                v66 = *(_QWORD *)(a2 + v65);
                if (v66 <= 0xFFFFFFFFFFFFFFF7 && v66 + 8 <= *(_QWORD *)(a2 + *v4))
                  *(_QWORD *)(a2 + v65) = v66 + 8;
                else
                  *(_BYTE *)(a2 + v16) = 1;
                PBRepeatedDoubleAdd();
              }
LABEL_119:
              if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
                return *(_BYTE *)(a2 + *v5) == 0;
              continue;
            case 9u:
              *(_WORD *)(a1 + 124) |= 0x10u;
              v44 = *v3;
              v45 = *(_QWORD *)(a2 + v44);
              if (v45 <= 0xFFFFFFFFFFFFFFF7 && v45 + 8 <= *(_QWORD *)(a2 + *v4))
              {
                v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v45);
                *(_QWORD *)(a2 + v44) = v45 + 8;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v29 = 0;
              }
              v67 = 64;
              goto LABEL_118;
            case 0xAu:
              *(_WORD *)(a1 + 124) |= 0x20u;
              v46 = *v3;
              v47 = *(_QWORD *)(a2 + v46);
              if (v47 <= 0xFFFFFFFFFFFFFFF7 && v47 + 8 <= *(_QWORD *)(a2 + *v4))
              {
                v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v47);
                *(_QWORD *)(a2 + v46) = v47 + 8;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v29 = 0;
              }
              v67 = 72;
              goto LABEL_118;
            case 0xBu:
              *(_WORD *)(a1 + 124) |= 8u;
              v48 = *v3;
              v49 = *(_QWORD *)(a2 + v48);
              if (v49 <= 0xFFFFFFFFFFFFFFF7 && v49 + 8 <= *(_QWORD *)(a2 + *v4))
              {
                v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v49);
                *(_QWORD *)(a2 + v48) = v49 + 8;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v29 = 0;
              }
              v67 = 56;
              goto LABEL_118;
            case 0xCu:
              *(_WORD *)(a1 + 124) |= 4u;
              v50 = *v3;
              v51 = *(_QWORD *)(a2 + v50);
              if (v51 <= 0xFFFFFFFFFFFFFFF7 && v51 + 8 <= *(_QWORD *)(a2 + *v4))
              {
                v29 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v51);
                *(_QWORD *)(a2 + v50) = v51 + 8;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v29 = 0;
              }
              v67 = 48;
LABEL_118:
              *(_QWORD *)(a1 + v67) = v29;
              goto LABEL_119;
            case 0xDu:
              v52 = 0;
              v53 = 0;
              v22 = 0;
              *(_WORD *)(a1 + 124) |= 0x400u;
              while (2)
              {
                v54 = *v3;
                v55 = *(_QWORD *)(a2 + v54);
                v56 = v55 + 1;
                if (v55 == -1 || v56 > *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v57 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v55);
                  *(_QWORD *)(a2 + v54) = v56;
                  v22 |= (unint64_t)(v57 & 0x7F) << v52;
                  if (v57 < 0)
                  {
                    v52 += 7;
                    v15 = v53++ >= 9;
                    if (v15)
                    {
                      LODWORD(v22) = 0;
                      goto LABEL_88;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                LODWORD(v22) = 0;
LABEL_88:
              v64 = 112;
              goto LABEL_93;
            case 0xEu:
              v58 = 0;
              v59 = 0;
              v22 = 0;
              *(_WORD *)(a1 + 124) |= 0x800u;
              while (2)
              {
                v60 = *v3;
                v61 = *(_QWORD *)(a2 + v60);
                v62 = v61 + 1;
                if (v61 == -1 || v62 > *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v63 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v61);
                  *(_QWORD *)(a2 + v60) = v62;
                  v22 |= (unint64_t)(v63 & 0x7F) << v58;
                  if (v63 < 0)
                  {
                    v58 += 7;
                    v15 = v59++ >= 9;
                    if (v15)
                    {
                      LODWORD(v22) = 0;
                      goto LABEL_92;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                LODWORD(v22) = 0;
LABEL_92:
              v64 = 116;
LABEL_93:
              *(_DWORD *)(a1 + v64) = v22;
              goto LABEL_119;
            default:
              if ((PBReaderSkipValueWithTag() & 1) != 0)
                goto LABEL_119;
              return 0;
          }
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPLocationProcessingMetadataReadFrom(uint64_t a1, uint64_t a2)
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
        break;
      if ((v10 >> 3) == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 12) |= 1u;
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
            goto LABEL_29;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_31;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_31:
        *(_DWORD *)(a1 + 8) = v20;
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

uint64_t CLPVehicleTypeReadFrom(uint64_t a1, uint64_t a2)
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
        break;
      if ((v10 >> 3) == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 12) |= 1u;
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
            goto LABEL_29;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v20 = 0;
            goto LABEL_31;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_31:
        *(_BYTE *)(a1 + 8) = v20 != 0;
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

uint64_t CLPLocationCollectionRequestReadFrom(uint64_t a1, uint64_t a2)
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
  CLPMeta *v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  uint64_t v42;

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
        v18 = objc_alloc_init(CLPMeta);
        objc_storeStrong((id *)(a1 + 56), v18);
        if (PBReaderPlaceMark() && (CLPMetaReadFrom((uint64_t)v18, a2) & 1) != 0)
          goto LABEL_60;
        goto LABEL_77;
      case 2u:
        v18 = objc_alloc_init(CLPLocation);
        objc_msgSend((id)a1, "addLocation:", v18);
        goto LABEL_55;
      case 3u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 24;
        goto LABEL_27;
      case 4u:
        PBReaderReadString();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 88;
LABEL_27:
        v22 = *(void **)(a1 + v21);
        *(_QWORD *)(a1 + v21) = v20;

        goto LABEL_75;
      case 5u:
        v23 = 0;
        v24 = 0;
        v25 = 0;
        *(_BYTE *)(a1 + 96) |= 4u;
        while (2)
        {
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          v28 = v27 + 1;
          if (v27 == -1 || v28 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
            *(_QWORD *)(a2 + v26) = v28;
            v25 |= (unint64_t)(v29 & 0x7F) << v23;
            if (v29 < 0)
            {
              v23 += 7;
              v15 = v24++ >= 9;
              if (v15)
              {
                LODWORD(v25) = 0;
                goto LABEL_65;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v25) = 0;
LABEL_65:
        v42 = 80;
        goto LABEL_74;
      case 6u:
        v30 = 0;
        v31 = 0;
        v25 = 0;
        *(_BYTE *)(a1 + 96) |= 1u;
        while (2)
        {
          v32 = *v3;
          v33 = *(_QWORD *)(a2 + v32);
          v34 = v33 + 1;
          if (v33 == -1 || v34 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
            *(_QWORD *)(a2 + v32) = v34;
            v25 |= (unint64_t)(v35 & 0x7F) << v30;
            if (v35 < 0)
            {
              v30 += 7;
              v15 = v31++ >= 9;
              if (v15)
              {
                LODWORD(v25) = 0;
                goto LABEL_69;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v25) = 0;
LABEL_69:
        v42 = 48;
        goto LABEL_74;
      case 7u:
        v36 = 0;
        v37 = 0;
        v25 = 0;
        *(_BYTE *)(a1 + 96) |= 2u;
        while (2)
        {
          v38 = *v3;
          v39 = *(_QWORD *)(a2 + v38);
          v40 = v39 + 1;
          if (v39 == -1 || v40 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v41 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v39);
            *(_QWORD *)(a2 + v38) = v40;
            v25 |= (unint64_t)(v41 & 0x7F) << v36;
            if (v41 < 0)
            {
              v36 += 7;
              v15 = v37++ >= 9;
              if (v15)
              {
                LODWORD(v25) = 0;
                goto LABEL_73;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v25) = 0;
LABEL_73:
        v42 = 64;
LABEL_74:
        *(_DWORD *)(a1 + v42) = v25;
        goto LABEL_75;
      case 8u:
        PBReaderReadString();
        v18 = (CLPMeta *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend((id)a1, "addAppBundleIds:", v18);
        goto LABEL_61;
      case 9u:
        v18 = objc_alloc_init(CLPAccessoryMeta);
        objc_storeStrong((id *)(a1 + 16), v18);
        if (!PBReaderPlaceMark() || !CLPAccessoryMetaReadFrom((uint64_t)v18, a2))
          goto LABEL_77;
        goto LABEL_60;
      case 0xAu:
        v18 = objc_alloc_init(CLPLocation);
        objc_msgSend((id)a1, "addAccessoryLocation:", v18);
LABEL_55:
        if (!PBReaderPlaceMark() || (CLPLocationReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_77;
        goto LABEL_60;
      case 0xBu:
        v18 = objc_alloc_init(CLPLocationProcessingPipelineMetadata);
        objc_storeStrong((id *)(a1 + 72), v18);
        if (PBReaderPlaceMark() && CLPLocationProcessingPipelineMetadataReadFrom((uint64_t)v18, a2))
        {
LABEL_60:
          PBReaderRecallMark();
LABEL_61:

LABEL_75:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_77:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_75;
    }
  }
}

BOOL CLPLocationProcessingPipelineMetadataReadFrom(uint64_t a1, uint64_t a2)
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
  CLPPrivacySanitization *v18;

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
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v18 = objc_alloc_init(CLPPrivacySanitization);
        objc_storeStrong((id *)(a1 + 16), v18);
        if (!PBReaderPlaceMark() || (CLPPrivacySanitizationReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_30;
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_27:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v18 = objc_alloc_init(CLPConsolidation);
    objc_storeStrong((id *)(a1 + 8), v18);
    if (!PBReaderPlaceMark() || (CLPConsolidationReadFrom((uint64_t)v18, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPLocationCollectionResponseReadFrom(uint64_t a1, uint64_t a2)
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
        break;
      if ((v10 >> 3) == 2)
      {
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v25;

      }
      else if ((v10 >> 3) == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
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
            goto LABEL_31;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v20 = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_33:
        *(_BYTE *)(a1 + 16) = v20 != 0;
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

uint64_t CLPLocationConsumptionScoreInfoReadFrom(uint64_t a1, uint64_t a2)
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
  unint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;

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
        break;
      switch((v10 >> 3))
      {
        case 1u:
          *(_BYTE *)(a1 + 36) |= 1u;
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
          v33 = 8;
          goto LABEL_43;
        case 2u:
          *(_BYTE *)(a1 + 36) |= 2u;
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v23);
            *(_QWORD *)(a2 + v22) = v23 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v33 = 16;
LABEL_43:
          *(_QWORD *)(a1 + v33) = v20;
          continue;
        case 3u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = *(void **)(a1 + 24);
          *(_QWORD *)(a1 + 24) = v24;

          continue;
        case 4u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 36) |= 4u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v29 = *v3;
        v30 = *(_QWORD *)(a2 + v29);
        v31 = v30 + 1;
        if (v30 == -1 || v31 > *(_QWORD *)(a2 + *v4))
          break;
        v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
        *(_QWORD *)(a2 + v29) = v31;
        v28 |= (unint64_t)(v32 & 0x7F) << v26;
        if ((v32 & 0x80) == 0)
          goto LABEL_36;
        v26 += 7;
        v15 = v27++ >= 9;
        if (v15)
        {
          LODWORD(v28) = 0;
          goto LABEL_38;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_36:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v28) = 0;
LABEL_38:
      *(_DWORD *)(a1 + 32) = v28;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPLocationConsumptionScoreInfoRequestReadFrom(void *a1, uint64_t a2)
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
  CLPLocationConsumptionScoreInfo *v18;
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
        break;
      if ((v10 >> 3) == 1)
      {
        v18 = objc_alloc_init(CLPLocationConsumptionScoreInfo);
        objc_msgSend(a1, "addLocationConsumptionScoreInfo:", v18);
        if (!PBReaderPlaceMark() || (CLPLocationConsumptionScoreInfoReadFrom((uint64_t)v18, a2) & 1) == 0)
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

uint64_t CLPPrivacySanitizationReadFrom(uint64_t a1, uint64_t a2)
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
        break;
      if ((v10 >> 3) == 2)
      {
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v25;

      }
      else if ((v10 >> 3) == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
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
            goto LABEL_31;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_33:
        *(_DWORD *)(a1 + 8) = v20;
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

uint64_t CLPRegulatoryDomainEstimateReadFrom(uint64_t a1, uint64_t a2)
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
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
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
        break;
      if ((v10 >> 3) == 2)
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          v25 = v24 + 1;
          if (v24 == -1 || v25 > *(_QWORD *)(a2 + *v4))
            break;
          v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v25;
          v22 |= (unint64_t)(v26 & 0x7F) << v20;
          if ((v26 & 0x80) == 0)
            goto LABEL_31;
          v20 += 7;
          v15 = v21++ >= 9;
          if (v15)
          {
            v22 = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          v22 = 0;
LABEL_33:
        *(_BYTE *)(a1 + 16) = v22 != 0;
      }
      else if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v18;

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

BOOL CLPPassCollectionRequestReadFrom(uint64_t a1, uint64_t a2)
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
  unint64_t v18;
  CLPPassLocation *v19;
  uint64_t v20;

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
      v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v18 == 2)
      {
        v19 = objc_alloc_init(CLPPassLocation);
        objc_msgSend((id)a1, "addPassLocation:", v19);
        if (!PBReaderPlaceMark() || (CLPPassLocationReadFrom((uint64_t)v19, a2) & 1) == 0)
        {
LABEL_33:

          return 0;
        }
LABEL_27:
        PBReaderRecallMark();
LABEL_28:

        goto LABEL_30;
      }
      if ((_DWORD)v18 == 1)
      {
        v19 = objc_alloc_init(CLPMeta);
        objc_storeStrong((id *)(a1 + 8), v19);
        if (!PBReaderPlaceMark() || (CLPMetaReadFrom((uint64_t)v19, a2) & 1) == 0)
          goto LABEL_33;
        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_30:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadData();
    v20 = objc_claimAutoreleasedReturnValue();
    v19 = *(CLPPassLocation **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v20;
    goto LABEL_28;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPPassLocationReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t result;
  CLPLocation *v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;

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

        goto LABEL_56;
      case 2u:
        PBReaderReadString();
        v21 = (CLPLocation *)objc_claimAutoreleasedReturnValue();
        if (v21)
          objc_msgSend((id)a1, "addAssociatedStoreId:", v21);
        goto LABEL_37;
      case 3u:
        v22 = 0;
        v23 = 0;
        v24 = 0;
        while (2)
        {
          v25 = *v3;
          v26 = *(_QWORD *)(a2 + v25);
          v27 = v26 + 1;
          if (v26 == -1 || v27 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v26);
            *(_QWORD *)(a2 + v25) = v27;
            v24 |= (unint64_t)(v28 & 0x7F) << v22;
            if (v28 < 0)
            {
              v22 += 7;
              v15 = v23++ >= 9;
              if (v15)
              {
                LODWORD(v24) = 0;
                goto LABEL_48;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v24) = 0;
LABEL_48:
        v38 = 32;
        goto LABEL_53;
      case 4u:
        *(_BYTE *)(a1 + 52) |= 1u;
        v29 = *v3;
        v30 = *(_QWORD *)(a2 + v29);
        if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v31 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v30);
          *(_QWORD *)(a2 + v29) = v30 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v31 = 0;
        }
        *(_QWORD *)(a1 + 8) = v31;
        goto LABEL_56;
      case 5u:
        v21 = objc_alloc_init(CLPLocation);
        objc_storeStrong((id *)(a1 + 24), v21);
        if (PBReaderPlaceMark() && (CLPLocationReadFrom((uint64_t)v21, a2) & 1) != 0)
        {
          PBReaderRecallMark();
LABEL_37:

LABEL_56:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 6u:
        v32 = 0;
        v33 = 0;
        v24 = 0;
        *(_BYTE *)(a1 + 52) |= 2u;
        while (2)
        {
          v34 = *v3;
          v35 = *(_QWORD *)(a2 + v34);
          v36 = v35 + 1;
          if (v35 == -1 || v36 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
            *(_QWORD *)(a2 + v34) = v36;
            v24 |= (unint64_t)(v37 & 0x7F) << v32;
            if (v37 < 0)
            {
              v32 += 7;
              v15 = v33++ >= 9;
              if (v15)
              {
                LODWORD(v24) = 0;
                goto LABEL_52;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v24) = 0;
LABEL_52:
        v38 = 48;
LABEL_53:
        *(_DWORD *)(a1 + v38) = v24;
        goto LABEL_56;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_56;
    }
  }
}

uint64_t CLPPassCollectionResponseReadFrom(uint64_t a1, uint64_t a2)
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
        break;
      if ((v10 >> 3) == 2)
      {
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v25;

      }
      else if ((v10 >> 3) == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
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
            goto LABEL_31;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v20 = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_33:
        *(_BYTE *)(a1 + 16) = v20 != 0;
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

BOOL CLPPoiCollectionRequestReadFrom(id *a1, uint64_t a2)
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
  CLPMeta *v18;

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
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v18 = objc_alloc_init(CLPMeta);
        objc_storeStrong(a1 + 2, v18);
        if (!PBReaderPlaceMark() || (CLPMetaReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_30;
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_27:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v18 = objc_alloc_init(CLPPoiHarvest);
    objc_msgSend(a1, "addHarvests:", v18);
    if (!PBReaderPlaceMark() || !CLPPoiHarvestReadFrom((id *)&v18->super.super.isa, a2))
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL CLPPoiHarvestReadFrom(id *a1, uint64_t a2)
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
  unint64_t v18;
  CLPPoiWifiAccessPoint *v19;

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
      v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v19 = objc_alloc_init(CLPPoiWifiAccessPoint);
        objc_msgSend(a1, "addAccessPoints:", v19);
        if (!PBReaderPlaceMark() || (CLPPoiWifiAccessPointReadFrom((uint64_t)v19, a2) & 1) == 0)
        {
LABEL_34:

          return 0;
        }
        goto LABEL_29;
      }
      if ((_DWORD)v18 == 2)
        break;
      if ((_DWORD)v18 == 1)
      {
        v19 = objc_alloc_init(CLPPoiTriggerEvent);
        objc_storeStrong(a1 + 3, v19);
        if (!PBReaderPlaceMark() || (CLPPoiTriggerEventReadFrom((uint64_t)v19, a2) & 1) == 0)
          goto LABEL_34;
LABEL_29:
        PBReaderRecallMark();

        goto LABEL_31;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_31:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v19 = objc_alloc_init(CLPLocation);
    objc_msgSend(a1, "addLocations:", v19);
    if (!PBReaderPlaceMark() || (CLPLocationReadFrom((uint64_t)v19, a2) & 1) == 0)
      goto LABEL_34;
    goto LABEL_29;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPPoiCollectionResponseReadFrom(uint64_t a1, uint64_t a2)
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
        break;
      if ((v10 >> 3) == 2)
      {
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v25;

      }
      else if ((v10 >> 3) == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
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
            goto LABEL_31;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v20 = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_33:
        *(_BYTE *)(a1 + 16) = v20 != 0;
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

uint64_t CLPPoiTriggerEventReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t result;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  uint64_t v48;

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
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v18 = 0;
          v19 = 0;
          v20 = 0;
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
              goto LABEL_53;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_55;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_53:
          if (*(_BYTE *)(a2 + *v5))
            v20 = 0;
LABEL_55:
          *(_QWORD *)(a1 + 8) = v20;
          continue;
        case 2u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 36) |= 2u;
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
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v28) = 0;
LABEL_59:
          v48 = 24;
          goto LABEL_68;
        case 3u:
          v33 = 0;
          v34 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 36) |= 8u;
          while (2)
          {
            v35 = *v3;
            v36 = *(_QWORD *)(a2 + v35);
            v37 = v36 + 1;
            if (v36 == -1 || v37 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
              *(_QWORD *)(a2 + v35) = v37;
              v28 |= (unint64_t)(v38 & 0x7F) << v33;
              if (v38 < 0)
              {
                v33 += 7;
                v15 = v34++ >= 9;
                if (v15)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_63;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v28) = 0;
LABEL_63:
          v48 = 32;
          goto LABEL_68;
        case 4u:
          *(_BYTE *)(a1 + 36) |= 1u;
          v39 = *v3;
          v40 = *(_QWORD *)(a2 + v39);
          if (v40 <= 0xFFFFFFFFFFFFFFF7 && v40 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v41 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v40);
            *(_QWORD *)(a2 + v39) = v40 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v41 = 0;
          }
          *(_QWORD *)(a1 + 16) = v41;
          continue;
        case 5u:
          v42 = 0;
          v43 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 36) |= 4u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v44 = *v3;
        v45 = *(_QWORD *)(a2 + v44);
        v46 = v45 + 1;
        if (v45 == -1 || v46 > *(_QWORD *)(a2 + *v4))
          break;
        v47 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v45);
        *(_QWORD *)(a2 + v44) = v46;
        v28 |= (unint64_t)(v47 & 0x7F) << v42;
        if ((v47 & 0x80) == 0)
          goto LABEL_65;
        v42 += 7;
        v15 = v43++ >= 9;
        if (v15)
        {
          LODWORD(v28) = 0;
          goto LABEL_67;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_65:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v28) = 0;
LABEL_67:
      v48 = 28;
LABEL_68:
      *(_DWORD *)(a1 + v48) = v28;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPPoiWifiAccessPointReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t result;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;

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
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = *(void **)(a1 + 32);
          *(_QWORD *)(a1 + 32) = v18;

          continue;
        case 2u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          while (2)
          {
            v24 = *v3;
            v25 = *(_QWORD *)(a2 + v24);
            v26 = v25 + 1;
            if (v25 == -1 || v26 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
              *(_QWORD *)(a2 + v24) = v26;
              v23 |= (unint64_t)(v27 & 0x7F) << v21;
              if (v27 < 0)
              {
                v21 += 7;
                v15 = v22++ >= 9;
                if (v15)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_45;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v23) = 0;
LABEL_45:
          v39 = 40;
          goto LABEL_50;
        case 3u:
          v28 = 0;
          v29 = 0;
          v23 = 0;
          break;
        case 4u:
          *(_BYTE *)(a1 + 44) |= 1u;
          v34 = *v3;
          v35 = *(_QWORD *)(a2 + v34);
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v36 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v35);
            *(_QWORD *)(a2 + v34) = v35 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v36 = 0;
          }
          v40 = 8;
          goto LABEL_55;
        case 5u:
          *(_BYTE *)(a1 + 44) |= 2u;
          v37 = *v3;
          v38 = *(_QWORD *)(a2 + v37);
          if (v38 <= 0xFFFFFFFFFFFFFFF7 && v38 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v36 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v38);
            *(_QWORD *)(a2 + v37) = v38 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v36 = 0;
          }
          v40 = 16;
LABEL_55:
          *(_QWORD *)(a1 + v40) = v36;
          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v30 = *v3;
        v31 = *(_QWORD *)(a2 + v30);
        v32 = v31 + 1;
        if (v31 == -1 || v32 > *(_QWORD *)(a2 + *v4))
          break;
        v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
        *(_QWORD *)(a2 + v30) = v32;
        v23 |= (unint64_t)(v33 & 0x7F) << v28;
        if ((v33 & 0x80) == 0)
          goto LABEL_47;
        v28 += 7;
        v15 = v29++ >= 9;
        if (v15)
        {
          LODWORD(v23) = 0;
          goto LABEL_49;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_47:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v23) = 0;
LABEL_49:
      v39 = 24;
LABEL_50:
      *(_DWORD *)(a1 + v39) = v23;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL CLPPressureReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v16;
  int v17;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  int *v27;

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
          v16 = *v5;
          v17 = *(unsigned __int8 *)(a2 + v16);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *v5;
      v17 = *(unsigned __int8 *)(a2 + v16);
      if (*(_BYTE *)(a2 + v16))
        v10 = 0;
LABEL_14:
      if (v17 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v19 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v23 = *v3;
        v24 = *(_QWORD *)(a2 + v23);
        if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v22 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + v16) = 1;
          v22 = 0;
        }
        v27 = &OBJC_IVAR___CLPPressure__std;
        goto LABEL_38;
      }
      if ((_DWORD)v19 == 2)
        break;
      if ((_DWORD)v19 == 1)
      {
        v20 = *v3;
        v21 = *(_QWORD *)(a2 + v20);
        if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v22 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + v16) = 1;
          v22 = 0;
        }
        v27 = &OBJC_IVAR___CLPPressure__timestamp;
LABEL_38:
        *(_QWORD *)(a1 + *v27) = v22;
        goto LABEL_39;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_39:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v25 = *v3;
    v26 = *(_QWORD *)(a2 + v25);
    if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(_QWORD *)(a2 + *v4))
    {
      v22 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v26);
      *(_QWORD *)(a2 + v25) = v26 + 8;
    }
    else
    {
      *(_BYTE *)(a2 + v16) = 1;
      v22 = 0;
    }
    v27 = &OBJC_IVAR___CLPPressure__value;
    goto LABEL_38;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL CLPPressureCollectionRequestReadFrom(id *a1, uint64_t a2)
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
  unint64_t v18;
  CLPLocation *v19;

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
      v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v19 = objc_alloc_init(CLPLocation);
        objc_storeStrong(a1 + 3, v19);
        if (!PBReaderPlaceMark() || (CLPLocationReadFrom((uint64_t)v19, a2) & 1) == 0)
        {
LABEL_34:

          return 0;
        }
        goto LABEL_29;
      }
      if ((_DWORD)v18 == 2)
        break;
      if ((_DWORD)v18 == 1)
      {
        v19 = objc_alloc_init(CLPMeta);
        objc_storeStrong(a1 + 1, v19);
        if (!PBReaderPlaceMark() || (CLPMetaReadFrom((uint64_t)v19, a2) & 1) == 0)
          goto LABEL_34;
LABEL_29:
        PBReaderRecallMark();

        goto LABEL_31;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_31:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v19 = objc_alloc_init(CLPPressure);
    objc_storeStrong(a1 + 2, v19);
    if (!PBReaderPlaceMark() || !CLPPressureReadFrom((uint64_t)v19, a2))
      goto LABEL_34;
    goto LABEL_29;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPPressureCollectionResponseReadFrom(uint64_t a1, uint64_t a2)
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
        break;
      if ((v10 >> 3) == 2)
      {
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v25;

      }
      else if ((v10 >> 3) == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
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
            goto LABEL_31;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v20 = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_33:
        *(_BYTE *)(a1 + 16) = v20 != 0;
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

BOOL CLPRTVisitReadFrom(uint64_t a1, uint64_t a2)
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
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int *v23;

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
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        *(_BYTE *)(a1 + 24) |= 1u;
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
        v23 = &OBJC_IVAR___CLPRTVisit__entryTime;
LABEL_32:
        *(_QWORD *)(a1 + *v23) = v20;
        goto LABEL_33;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_33:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    *(_BYTE *)(a1 + 24) |= 2u;
    v21 = *v3;
    v22 = *(_QWORD *)(a2 + v21);
    if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)(a2 + *v4))
    {
      v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v22);
      *(_QWORD *)(a2 + v21) = v22 + 8;
    }
    else
    {
      *(_BYTE *)(a2 + *v5) = 1;
      v20 = 0;
    }
    v23 = &OBJC_IVAR___CLPRTVisit__exitTime;
    goto LABEL_32;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPSatelliteInfoReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  char v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  int v16;
  uint64_t result;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  char v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  char v54;
  unsigned int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  char v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  char v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  char v74;
  char v75;
  unsigned int v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char v81;
  char v82;
  unsigned int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  char v88;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v6 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    while (1)
    {
      v10 = *v3;
      v11 = *(_QWORD *)(a2 + v10);
      v12 = v11 + 1;
      if (v11 == -1 || v12 > *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v11);
      *(_QWORD *)(a2 + v10) = v12;
      v9 |= (unint64_t)(v13 & 0x7F) << v7;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v7 += 7;
      v14 = v8++ >= 9;
      if (v14)
      {
        v9 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v9 = 0;
LABEL_14:
    v16 = v9 & 7;
    if (v15 || v16 == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v9 >> 3))
    {
      case 1u:
        if (v16 != 2)
        {
          v61 = 0;
          v62 = 0;
          v63 = 0;
          do
          {
            v64 = *v3;
            v65 = *(_QWORD *)(a2 + v64);
            v66 = v65 + 1;
            if (v65 == -1 || v66 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
              break;
            }
            v67 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v65);
            *(_QWORD *)(a2 + v64) = v66;
            v63 |= (unint64_t)(v67 & 0x7F) << v61;
            if ((v67 & 0x80) == 0)
              break;
            v61 += 7;
            v14 = v62++ >= 9;
          }
          while (!v14);
LABEL_127:
          PBRepeatedInt32Add();
LABEL_128:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
        result = PBReaderPlaceMark();
        if ((_DWORD)result)
        {
          while (1)
          {
            if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4) || *(_BYTE *)(a2 + *v5))
              goto LABEL_86;
            v19 = 0;
            v20 = 0;
            v21 = 0;
            while (1)
            {
              v22 = *v3;
              v23 = *(_QWORD *)(a2 + v22);
              v24 = v23 + 1;
              if (v23 == -1 || v24 > *(_QWORD *)(a2 + *v4))
                break;
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v23);
              *(_QWORD *)(a2 + v22) = v24;
              v21 |= (unint64_t)(v25 & 0x7F) << v19;
              if (v25 < 0)
              {
                v19 += 7;
                v14 = v20++ >= 9;
                if (!v14)
                  continue;
              }
              goto LABEL_31;
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
            PBRepeatedInt32Add();
          }
        }
        return result;
      case 2u:
        if (v16 != 2)
        {
          v68 = 0;
          v69 = 0;
          v70 = 0;
          while (1)
          {
            v71 = *v3;
            v72 = *(_QWORD *)(a2 + v71);
            v73 = v72 + 1;
            if (v72 == -1 || v73 > *(_QWORD *)(a2 + *v4))
              goto LABEL_122;
            v74 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v72);
            *(_QWORD *)(a2 + v71) = v73;
            v70 |= (unint64_t)(v74 & 0x7F) << v68;
            if (v74 < 0)
            {
              v68 += 7;
              v14 = v69++ >= 9;
              if (!v14)
                continue;
            }
            goto LABEL_127;
          }
        }
        result = PBReaderPlaceMark();
        if (!(_DWORD)result)
          return result;
        while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
        {
          v33 = 0;
          v34 = 0;
          v35 = 0;
          while (1)
          {
            v36 = *v3;
            v37 = *(_QWORD *)(a2 + v36);
            v38 = v37 + 1;
            if (v37 == -1 || v38 > *(_QWORD *)(a2 + *v4))
              break;
            v39 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v37);
            *(_QWORD *)(a2 + v36) = v38;
            v35 |= (unint64_t)(v39 & 0x7F) << v33;
            if (v39 < 0)
            {
              v33 += 7;
              v14 = v34++ >= 9;
              if (!v14)
                continue;
            }
            goto LABEL_59;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_59:
          PBRepeatedInt32Add();
        }
        goto LABEL_86;
      case 3u:
        if (v16 != 2)
        {
          v75 = 0;
          v76 = 0;
          v77 = 0;
          while (1)
          {
            v78 = *v3;
            v79 = *(_QWORD *)(a2 + v78);
            v80 = v79 + 1;
            if (v79 == -1 || v80 > *(_QWORD *)(a2 + *v4))
              goto LABEL_122;
            v81 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v79);
            *(_QWORD *)(a2 + v78) = v80;
            v77 |= (unint64_t)(v81 & 0x7F) << v75;
            if (v81 < 0)
            {
              v75 += 7;
              v14 = v76++ >= 9;
              if (!v14)
                continue;
            }
            goto LABEL_127;
          }
        }
        result = PBReaderPlaceMark();
        if (!(_DWORD)result)
          return result;
        while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
        {
          v40 = 0;
          v41 = 0;
          v42 = 0;
          while (1)
          {
            v43 = *v3;
            v44 = *(_QWORD *)(a2 + v43);
            v45 = v44 + 1;
            if (v44 == -1 || v45 > *(_QWORD *)(a2 + *v4))
              break;
            v46 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v44);
            *(_QWORD *)(a2 + v43) = v45;
            v42 |= (unint64_t)(v46 & 0x7F) << v40;
            if (v46 < 0)
            {
              v40 += 7;
              v14 = v41++ >= 9;
              if (!v14)
                continue;
            }
            goto LABEL_72;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_72:
          PBRepeatedInt32Add();
        }
        goto LABEL_86;
      case 4u:
        if (v16 != 2)
        {
          v82 = 0;
          v83 = 0;
          v84 = 0;
          while (1)
          {
            v85 = *v3;
            v86 = *(_QWORD *)(a2 + v85);
            v87 = v86 + 1;
            if (v86 == -1 || v87 > *(_QWORD *)(a2 + *v4))
              break;
            v88 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v86);
            *(_QWORD *)(a2 + v85) = v87;
            v84 |= (unint64_t)(v88 & 0x7F) << v82;
            if (v88 < 0)
            {
              v82 += 7;
              v14 = v83++ >= 9;
              if (!v14)
                continue;
            }
            goto LABEL_127;
          }
LABEL_122:
          *(_BYTE *)(a2 + *v5) = 1;
          goto LABEL_127;
        }
        result = PBReaderPlaceMark();
        if (!(_DWORD)result)
          return result;
        while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
        {
          v47 = 0;
          v48 = 0;
          v49 = 0;
          while (1)
          {
            v50 = *v3;
            v51 = *(_QWORD *)(a2 + v50);
            v52 = v51 + 1;
            if (v51 == -1 || v52 > *(_QWORD *)(a2 + *v4))
              break;
            v53 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v51);
            *(_QWORD *)(a2 + v50) = v52;
            v49 |= (unint64_t)(v53 & 0x7F) << v47;
            if (v53 < 0)
            {
              v47 += 7;
              v14 = v48++ >= 9;
              if (!v14)
                continue;
            }
            goto LABEL_85;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_85:
          PBRepeatedInt32Add();
        }
LABEL_86:
        PBReaderRecallMark();
        goto LABEL_128;
      case 5u:
        if (v16 != 2)
        {
          v54 = 0;
          v55 = 0;
          v56 = 0;
          while (1)
          {
            v57 = *v3;
            v58 = *(_QWORD *)(a2 + v57);
            v59 = v58 + 1;
            if (v58 == -1 || v59 > *(_QWORD *)(a2 + *v4))
              break;
            v60 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v58);
            *(_QWORD *)(a2 + v57) = v59;
            v56 |= (unint64_t)(v60 & 0x7F) << v54;
            if (v60 < 0)
            {
              v54 += 7;
              v14 = v55++ >= 9;
              if (!v14)
                continue;
            }
            goto LABEL_125;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_125:
          PBRepeatedBOOLAdd();
          goto LABEL_128;
        }
        result = PBReaderPlaceMark();
        if (!(_DWORD)result)
          return result;
        while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
        {
          v26 = 0;
          v27 = 0;
          v28 = 0;
          while (1)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            v31 = v30 + 1;
            if (v30 == -1 || v31 > *(_QWORD *)(a2 + *v4))
              break;
            v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v30);
            *(_QWORD *)(a2 + v29) = v31;
            v28 |= (unint64_t)(v32 & 0x7F) << v26;
            if (v32 < 0)
            {
              v26 += 7;
              v14 = v27++ >= 9;
              if (!v14)
                continue;
            }
            goto LABEL_44;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_44:
          PBRepeatedBOOLAdd();
        }
        goto LABEL_86;
      default:
        if ((PBReaderSkipValueWithTag() & 1) != 0)
          goto LABEL_128;
        return 0;
    }
  }
}

uint64_t CLPTraceCollectionRequestReadFrom(uint64_t a1, uint64_t a2)
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
  unint64_t v18;
  CLPIndoorEvent *v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
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
      v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 28) |= 1u;
        while (1)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          v25 = v24 + 1;
          if (v24 == -1 || v25 > *(_QWORD *)(a2 + *v4))
            break;
          v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v25;
          v22 |= (unint64_t)(v26 & 0x7F) << v20;
          if ((v26 & 0x80) == 0)
            goto LABEL_37;
          v20 += 7;
          v15 = v21++ >= 9;
          if (v15)
          {
            LODWORD(v22) = 0;
            goto LABEL_39;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_39:
        *(_DWORD *)(a1 + 24) = v22;
      }
      else
      {
        if ((_DWORD)v18 == 2)
        {
          v19 = objc_alloc_init(CLPIndoorEvent);
          objc_msgSend((id)a1, "addEvents:", v19);
          if (!PBReaderPlaceMark() || (CLPIndoorEventReadFrom((uint64_t)v19, a2) & 1) == 0)
          {
LABEL_42:

            return 0;
          }
        }
        else
        {
          if ((_DWORD)v18 != 1)
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
            continue;
          }
          v19 = objc_alloc_init(CLPMeta);
          objc_storeStrong((id *)(a1 + 16), v19);
          if (!PBReaderPlaceMark() || (CLPMetaReadFrom((uint64_t)v19, a2) & 1) == 0)
            goto LABEL_42;
        }
        PBReaderRecallMark();

      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPTraceCollectionResponseReadFrom(uint64_t a1, uint64_t a2)
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
        break;
      if ((v10 >> 3) == 2)
      {
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v25;

      }
      else if ((v10 >> 3) == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
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
            goto LABEL_31;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v20 = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_33:
        *(_BYTE *)(a1 + 16) = v20 != 0;
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

BOOL CLPWtwCollectionRequestReadFrom(id *a1, uint64_t a2)
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
  CLPMeta *v18;

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
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v18 = objc_alloc_init(CLPMeta);
        objc_storeStrong(a1 + 1, v18);
        if (!PBReaderPlaceMark() || (CLPMetaReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_30;
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_27:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v18 = objc_alloc_init(CLPWifiAPLocation);
    objc_msgSend(a1, "addWtwLocation:", v18);
    if (!PBReaderPlaceMark() || (CLPWifiAPLocationReadFrom((uint64_t)v18, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t CLPWtwCollectionResponseReadFrom(uint64_t a1, uint64_t a2)
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
        break;
      if ((v10 >> 3) == 2)
      {
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v25;

      }
      else if ((v10 >> 3) == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
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
            goto LABEL_31;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v20 = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_33:
        *(_BYTE *)(a1 + 16) = v20 != 0;
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

uint64_t PBDataWriterPlaceMark()
{
  return MEMORY[0x1E0D82BF8]();
}

uint64_t PBDataWriterRecallMark()
{
  return MEMORY[0x1E0D82C00]();
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

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x1E0D82C50]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1E0D82C68]();
}

uint64_t PBDataWriterWriteSint32Field()
{
  return MEMORY[0x1E0D82C88]();
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

uint64_t PBRepeatedBOOLAdd()
{
  return MEMORY[0x1E0D82D30]();
}

uint64_t PBRepeatedBOOLClear()
{
  return MEMORY[0x1E0D82D38]();
}

uint64_t PBRepeatedBOOLCopy()
{
  return MEMORY[0x1E0D82D40]();
}

uint64_t PBRepeatedBOOLHash()
{
  return MEMORY[0x1E0D82D48]();
}

uint64_t PBRepeatedBOOLIsEqual()
{
  return MEMORY[0x1E0D82D50]();
}

uint64_t PBRepeatedBOOLNSArray()
{
  return MEMORY[0x1E0D82D58]();
}

uint64_t PBRepeatedBOOLSet()
{
  return MEMORY[0x1E0D82D60]();
}

uint64_t PBRepeatedDoubleAdd()
{
  return MEMORY[0x1E0D82D68]();
}

uint64_t PBRepeatedDoubleClear()
{
  return MEMORY[0x1E0D82D70]();
}

uint64_t PBRepeatedDoubleCopy()
{
  return MEMORY[0x1E0D82D78]();
}

uint64_t PBRepeatedDoubleHash()
{
  return MEMORY[0x1E0D82D80]();
}

uint64_t PBRepeatedDoubleIsEqual()
{
  return MEMORY[0x1E0D82D88]();
}

uint64_t PBRepeatedDoubleNSArray()
{
  return MEMORY[0x1E0D82D90]();
}

uint64_t PBRepeatedDoubleSet()
{
  return MEMORY[0x1E0D82D98]();
}

uint64_t PBRepeatedFloatAdd()
{
  return MEMORY[0x1E0D82DA0]();
}

uint64_t PBRepeatedFloatClear()
{
  return MEMORY[0x1E0D82DA8]();
}

uint64_t PBRepeatedFloatCopy()
{
  return MEMORY[0x1E0D82DB0]();
}

uint64_t PBRepeatedFloatHash()
{
  return MEMORY[0x1E0D82DB8]();
}

uint64_t PBRepeatedFloatIsEqual()
{
  return MEMORY[0x1E0D82DC0]();
}

uint64_t PBRepeatedFloatNSArray()
{
  return MEMORY[0x1E0D82DC8]();
}

uint64_t PBRepeatedFloatSet()
{
  return MEMORY[0x1E0D82DD0]();
}

uint64_t PBRepeatedInt32Add()
{
  return MEMORY[0x1E0D82DD8]();
}

uint64_t PBRepeatedInt32Clear()
{
  return MEMORY[0x1E0D82DE0]();
}

uint64_t PBRepeatedInt32Copy()
{
  return MEMORY[0x1E0D82DE8]();
}

uint64_t PBRepeatedInt32Hash()
{
  return MEMORY[0x1E0D82DF0]();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return MEMORY[0x1E0D82DF8]();
}

uint64_t PBRepeatedInt32NSArray()
{
  return MEMORY[0x1E0D82E00]();
}

uint64_t PBRepeatedInt32Set()
{
  return MEMORY[0x1E0D82E08]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C83448](a1, a2);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

