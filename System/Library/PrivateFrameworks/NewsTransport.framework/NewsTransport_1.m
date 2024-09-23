uint64_t NTPBScoreProfilesReadFrom(uint64_t a1, _BYTE *a2)
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
  NTPBScoreProfile *v17;
  uint64_t v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)&a2[*MEMORY[0x24BE7AF60]] < *(_QWORD *)&a2[*MEMORY[0x24BE7AF50]])
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (a2[*v5])
        return a2[*v5] == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)&a2[v11];
        if (v12 == -1 || v12 >= *(_QWORD *)&a2[*v4])
          break;
        v13 = *(_BYTE *)(*(_QWORD *)&a2[*v7] + v12);
        *(_QWORD *)&a2[v11] = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = a2[*v5];
          goto LABEL_14;
        }
      }
      a2[*v5] = 1;
LABEL_12:
      v15 = a2[*v5];
      if (a2[*v5])
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return a2[*v5] == 0;
      if ((v10 >> 3) == 2)
      {
        v17 = objc_alloc_init(NTPBScoreProfile);

        v18 = 16;
      }
      else
      {
        if ((v10 >> 3) != 1)
        {
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
        }
        v17 = objc_alloc_init(NTPBScoreProfile);

        v18 = 8;
      }
      *(_QWORD *)(a1 + v18) = v17;
      if (!PBReaderPlaceMark() || (NTPBScoreProfileReadFrom((uint64_t)v17, a2) & 1) == 0)
        return 0;
      PBReaderRecallMark();
    }
    while (*(_QWORD *)&a2[*v3] < *(_QWORD *)&a2[*v4]);
  }
  return a2[*v5] == 0;
}

BOOL NTPBLanguageConfigReadFrom(id *a1, uint64_t a2)
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
  NTPBCategory *v19;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
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
        v18 = 10;
        goto LABEL_56;
      case 2u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 9;
        goto LABEL_56;
      case 3u:
        v19 = objc_alloc_init(NTPBCategory);
        objc_storeStrong(a1 + 17, v19);
        if (!PBReaderPlaceMark() || !NTPBCategoryReadFrom((char *)v19, a2))
          goto LABEL_64;
        goto LABEL_59;
      case 4u:
        PBReaderReadString();
        v19 = (NTPBCategory *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(a1, "addPreSubscribedFeedIds:", v19);
        goto LABEL_60;
      case 5u:
        PBReaderReadString();
        v19 = (NTPBCategory *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(a1, "addOnboardingTagIds:", v19);
        goto LABEL_60;
      case 6u:
        v19 = objc_alloc_init(NTPBTopStoriesConfig);
        objc_storeStrong(a1 + 21, v19);
        if (!PBReaderPlaceMark() || (NTPBTopStoriesConfigReadFrom((uint64_t)v19, a2) & 1) == 0)
          goto LABEL_64;
        goto LABEL_59;
      case 7u:
        PBReaderReadString();
        v19 = (NTPBCategory *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(a1, "addPreSubscribedNotificationsChannelIds:", v19);
        goto LABEL_60;
      case 8u:
        v19 = objc_alloc_init(NTPBNotificationChannel);
        objc_msgSend(a1, "addRecommendedNotificationChannels:", v19);
        if (!PBReaderPlaceMark() || (NTPBNotificationChannelReadFrom((uint64_t)v19, a2) & 1) == 0)
          goto LABEL_64;
        goto LABEL_59;
      case 9u:
        v19 = objc_alloc_init(NTPBCoverArticlesConfig);
        objc_storeStrong(a1 + 4, v19);
        if (!PBReaderPlaceMark() || (NTPBCoverArticlesConfigReadFrom((uint64_t)v19, a2) & 1) == 0)
          goto LABEL_64;
        goto LABEL_59;
      case 0xAu:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 1;
        goto LABEL_56;
      case 0xBu:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
        goto LABEL_56;
      case 0xCu:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 3;
        goto LABEL_56;
      case 0xDu:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 23;
        goto LABEL_56;
      case 0xEu:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 7;
        goto LABEL_56;
      case 0xFu:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 18;
        goto LABEL_56;
      case 0x10u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 24;
        goto LABEL_56;
      case 0x11u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 5;
        goto LABEL_56;
      case 0x12u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 6;
        goto LABEL_56;
      case 0x13u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 2;
        goto LABEL_56;
      case 0x14u:
        PBReaderReadString();
        v19 = (NTPBCategory *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(a1, "addMediaSharingBlacklistedChannelIds:", v19);
        goto LABEL_60;
      case 0x15u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 20;
        goto LABEL_56;
      case 0x16u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 22;
        goto LABEL_56;
      case 0x17u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 12;
LABEL_56:
        v19 = (NTPBCategory *)a1[v18];
        a1[v18] = (id)v17;
        goto LABEL_60;
      case 0x18u:
        v19 = objc_alloc_init(NTPBVideoPlayerConfig);
        objc_storeStrong(a1 + 19, v19);
        if (PBReaderPlaceMark() && NTPBVideoPlayerConfigReadFrom((uint64_t)v19, a2))
        {
LABEL_59:
          PBReaderRecallMark();
LABEL_60:

LABEL_61:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_64:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_61;
    }
  }
}

uint64_t NTPBPullToRefreshReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v23;
  void *v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v23;

      }
      else if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
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
            goto LABEL_31;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_33:
        *(_DWORD *)(a1 + 16) = v19;
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

BOOL NTPBSessionBatchReadFrom(uint64_t a1, uint64_t a2)
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
  NTPBEvent *v18;
  uint64_t v19;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
        v18 = objc_alloc_init(NTPBEvent);
        objc_msgSend((id)a1, "addEvents:", v18);
        if (!PBReaderPlaceMark() || (NTPBEventReadFrom((uint64_t)v18, a2) & 1) == 0)
        {
LABEL_33:

          return 0;
        }
LABEL_27:
        PBReaderRecallMark();
LABEL_28:

        goto LABEL_30;
      }
      if ((_DWORD)v17 == 1)
      {
        v18 = objc_alloc_init(NTPBSession);
        objc_storeStrong((id *)(a1 + 24), v18);
        if (!PBReaderPlaceMark() || (NTPBSessionReadFrom(v18, a2) & 1) == 0)
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
    v19 = objc_claimAutoreleasedReturnValue();
    v18 = *(NTPBEvent **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v19;
    goto LABEL_28;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t NTPBTodayWidgetSessionReadFrom(_BYTE *a1, uint64_t a2)
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
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  void *v35;
  uint64_t v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
        if (!v15 && v16 != 4)
        {
          switch((v10 >> 3))
          {
            case 1u:
              v18 = 0;
              v19 = 0;
              v20 = 0;
              a1[60] |= 1u;
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
                  goto LABEL_54;
                v18 += 7;
                v14 = v19++ >= 9;
                if (v14)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_56;
                }
              }
              *(_BYTE *)(a2 + *v5) = 1;
LABEL_54:
              if (*(_BYTE *)(a2 + *v5))
                LODWORD(v20) = 0;
LABEL_56:
              v36 = 40;
              goto LABEL_61;
            case 2u:
              v24 = 0;
              v25 = 0;
              v20 = 0;
              a1[60] |= 2u;
              while (2)
              {
                v26 = *v3;
                v27 = *(_QWORD *)(a2 + v26);
                if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
                  *(_QWORD *)(a2 + v26) = v27 + 1;
                  v20 |= (unint64_t)(v28 & 0x7F) << v24;
                  if (v28 < 0)
                  {
                    v24 += 7;
                    v14 = v25++ >= 9;
                    if (v14)
                    {
                      LODWORD(v20) = 0;
                      goto LABEL_60;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                LODWORD(v20) = 0;
LABEL_60:
              v36 = 56;
LABEL_61:
              *(_DWORD *)&a1[v36] = v20;
              goto LABEL_72;
            case 3u:
              if (v16 == 2)
              {
                result = PBReaderPlaceMark();
                if (!(_DWORD)result)
                  return result;
                while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
                {
                  v29 = 0;
                  v30 = 0;
                  v31 = 0;
                  while (1)
                  {
                    v32 = *v3;
                    v33 = *(_QWORD *)(a2 + v32);
                    if (v33 == -1 || v33 >= *(_QWORD *)(a2 + *v4))
                      break;
                    v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
                    *(_QWORD *)(a2 + v32) = v33 + 1;
                    v31 |= (unint64_t)(v34 & 0x7F) << v29;
                    if (v34 < 0)
                    {
                      v29 += 7;
                      v14 = v30++ >= 9;
                      if (!v14)
                        continue;
                    }
                    goto LABEL_47;
                  }
                  *(_BYTE *)(a2 + *v5) = 1;
LABEL_47:
                  PBRepeatedInt32Add();
                }
                PBReaderRecallMark();
              }
              else
              {
                v37 = 0;
                v38 = 0;
                v39 = 0;
                while (1)
                {
                  v40 = *v3;
                  v41 = *(_QWORD *)(a2 + v40);
                  if (v41 == -1 || v41 >= *(_QWORD *)(a2 + *v4))
                    break;
                  v42 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v41);
                  *(_QWORD *)(a2 + v40) = v41 + 1;
                  v39 |= (unint64_t)(v42 & 0x7F) << v37;
                  if (v42 < 0)
                  {
                    v37 += 7;
                    v14 = v38++ >= 9;
                    if (!v14)
                      continue;
                  }
                  goto LABEL_71;
                }
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_71:
                PBRepeatedInt32Add();
              }
LABEL_72:
              if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
                return *(_BYTE *)(a2 + *v5) == 0;
              continue;
            case 4u:
              PBReaderReadString();
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              if (v35)
                objc_msgSend(a1, "addWidgetSectionIdsExposed:", v35);
              goto LABEL_52;
            case 5u:
              PBReaderReadString();
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              if (v35)
                objc_msgSend(a1, "addCountOfArticlesExposedEachSection:", v35);
LABEL_52:

              goto LABEL_72;
            default:
              if ((PBReaderSkipValueWithTag() & 1) != 0)
                goto LABEL_72;
              return 0;
          }
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t NTPBExternalAnalyticsConfigReadFrom(_BYTE *a1, uint64_t a2)
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
  uint64_t v18;
  uint64_t result;
  void *v20;
  NTPBExternalAnalyticsQueryParameterConfig *v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
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
        v18 = 8;
        goto LABEL_24;
      case 2u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
        goto LABEL_24;
      case 3u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 24;
LABEL_24:
        v20 = *(void **)&a1[v18];
        *(_QWORD *)&a1[v18] = v17;

        goto LABEL_44;
      case 4u:
        v21 = objc_alloc_init(NTPBExternalAnalyticsQueryParameterConfig);
        objc_msgSend(a1, "addQueryParameterConfig:", v21);
        if (PBReaderPlaceMark() && NTPBExternalAnalyticsQueryParameterConfigReadFrom((uint64_t)v21, a2))
        {
          PBReaderRecallMark();
LABEL_39:

LABEL_44:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 5u:
        v22 = 0;
        v23 = 0;
        v24 = 0;
        a1[60] |= 1u;
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
                v24 = 0;
                goto LABEL_43;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v24 = 0;
LABEL_43:
        a1[56] = v24 != 0;
        goto LABEL_44;
      case 6u:
        PBReaderReadString();
        v21 = (NTPBExternalAnalyticsQueryParameterConfig *)objc_claimAutoreleasedReturnValue();
        if (v21)
          objc_msgSend(a1, "addProxyHostNames:", v21);
        goto LABEL_39;
      case 7u:
        PBReaderReadString();
        v21 = (NTPBExternalAnalyticsQueryParameterConfig *)objc_claimAutoreleasedReturnValue();
        if (v21)
          objc_msgSend(a1, "addVpnProfileNames:", v21);
        goto LABEL_39;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_44;
    }
  }
}

uint64_t COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSChannelDataReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 12) |= 1u;
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
            goto LABEL_29;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_31;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_31:
        *(_BYTE *)(a1 + 8) = v19 != 0;
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

uint64_t NTPBArticleContentExpirationReadFrom(uint64_t a1, uint64_t a2)
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
  NTPBTagExpiration *v23;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
      if ((v10 >> 3) == 3)
      {
        v23 = objc_alloc_init(NTPBTagExpiration);
        objc_msgSend((id)a1, "addTagsExpirationList:", v23);
        if (!PBReaderPlaceMark() || (NTPBTagExpirationReadFrom((uint64_t)v23, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((v10 >> 3) == 2)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
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
            goto LABEL_33;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_35:
        *(_QWORD *)(a1 + 8) = v19;
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

uint64_t NTPBTodayPersonalizationEventReadFrom(_QWORD *a1, uint64_t a2)
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
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t result;
  uint64_t v28;
  uint64_t v29;
  int *v30;
  int *v31;
  COMAPPLEFELDSPARPROTOCOLScoredTagID *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
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
  void *v55;
  char v56;
  unsigned int v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  uint64_t v62;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = &OBJC_IVAR___NTPBJSONRecord__base;
  v8 = (int *)MEMORY[0x24BE7AF30];
  v9 = &OBJC_IVAR___NTPBJSONRecord__base;
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
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *((_BYTE *)a1 + v7[715]) |= 0x20u;
        while (1)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          v25 = v24 + 1;
          if (v24 == -1 || v25 > *(_QWORD *)(a2 + *v4))
            break;
          v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v24);
          *(_QWORD *)(a2 + v23) = v25;
          v22 |= (unint64_t)(v26 & 0x7F) << v20;
          if ((v26 & 0x80) == 0)
            goto LABEL_67;
          v20 += 7;
          v17 = v21++ >= 9;
          if (v17)
          {
            LODWORD(v22) = 0;
            goto LABEL_69;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_67:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_69:
        *(_DWORD *)((char *)a1 + v9[716]) = v22;
        goto LABEL_87;
      case 2u:
        PBReaderReadString();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = 7;
        goto LABEL_58;
      case 3u:
        v30 = v7;
        v31 = v9;
        v32 = objc_alloc_init(COMAPPLEFELDSPARPROTOCOLScoredTagID);
        objc_msgSend(a1, "addHeadlineTopics:", v32);
        if (PBReaderPlaceMark()
          && (COMAPPLEFELDSPARPROTOCOLScoredTagIDReadFrom((uint64_t)v32, a2) & 1) != 0)
        {
          PBReaderRecallMark();

          v9 = v31;
          v7 = v30;
LABEL_87:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 4u:
        PBReaderReadString();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = 8;
        goto LABEL_58;
      case 5u:
        *((_BYTE *)a1 + v7[715]) |= 1u;
        v33 = *v3;
        v34 = *(_QWORD *)(a2 + v33);
        if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v35 = *(_QWORD *)(*(_QWORD *)(a2 + *v8) + v34);
          *(_QWORD *)(a2 + v33) = v34 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v35 = 0;
        }
        a1[1] = v35;
        goto LABEL_87;
      case 6u:
        v36 = 0;
        v37 = 0;
        v38 = 0;
        *((_BYTE *)a1 + v7[715]) |= 4u;
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
            v42 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v40);
            *(_QWORD *)(a2 + v39) = v41;
            v38 |= (unint64_t)(v42 & 0x7F) << v36;
            if (v42 < 0)
            {
              v36 += 7;
              v17 = v37++ >= 9;
              if (v17)
              {
                v38 = 0;
                goto LABEL_73;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v38 = 0;
LABEL_73:
        v62 = 3;
        goto LABEL_86;
      case 7u:
        v43 = 0;
        v44 = 0;
        v38 = 0;
        *((_BYTE *)a1 + v7[715]) |= 8u;
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
            v48 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v46);
            *(_QWORD *)(a2 + v45) = v47;
            v38 |= (unint64_t)(v48 & 0x7F) << v43;
            if (v48 < 0)
            {
              v43 += 7;
              v17 = v44++ >= 9;
              if (v17)
              {
                v38 = 0;
                goto LABEL_77;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v38 = 0;
LABEL_77:
        v62 = 4;
        goto LABEL_86;
      case 8u:
        v49 = 0;
        v50 = 0;
        v38 = 0;
        *((_BYTE *)a1 + v7[715]) |= 0x10u;
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
            v54 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v52);
            *(_QWORD *)(a2 + v51) = v53;
            v38 |= (unint64_t)(v54 & 0x7F) << v49;
            if (v54 < 0)
            {
              v49 += 7;
              v17 = v50++ >= 9;
              if (v17)
              {
                v38 = 0;
                goto LABEL_81;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v38 = 0;
LABEL_81:
        v62 = 5;
        goto LABEL_86;
      case 9u:
        PBReaderReadString();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = 10;
LABEL_58:
        v55 = (void *)a1[v29];
        a1[v29] = v28;

        goto LABEL_87;
      case 0xAu:
        v56 = 0;
        v57 = 0;
        v38 = 0;
        *((_BYTE *)a1 + v7[715]) |= 2u;
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
            v61 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v59);
            *(_QWORD *)(a2 + v58) = v60;
            v38 |= (unint64_t)(v61 & 0x7F) << v56;
            if (v61 < 0)
            {
              v56 += 7;
              v17 = v57++ >= 9;
              if (v17)
              {
                v38 = 0;
                goto LABEL_85;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v38 = 0;
LABEL_85:
        v62 = 2;
LABEL_86:
        a1[v62] = v38;
        goto LABEL_87;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_87;
    }
  }
}

uint64_t NTPBTodayPersonalizationUpdateReadFrom(void *a1, uint64_t a2)
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
  NTPBTodayPersonalizationEvent *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
        v17 = objc_alloc_init(NTPBTodayPersonalizationEvent);
        objc_msgSend(a1, "addEvents:", v17);
        if (!PBReaderPlaceMark() || (NTPBTodayPersonalizationEventReadFrom(v17, a2) & 1) == 0)
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

uint64_t NTPBRestorePaidSubscriptionItemReadFrom(uint64_t a1, uint64_t a2)
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
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0)
            goto LABEL_31;
          v19 += 7;
          v14 = v20++ >= 9;
          if (v14)
          {
            v21 = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_33:
        *(_BYTE *)(a1 + 16) = v21 != 0;
      }
      else if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

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

uint64_t COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueDataReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t result;
  char v20;
  unsigned int v21;
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
  void *v32;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v17;

          continue;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 36) |= 2u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  v22 = 0;
                  goto LABEL_42;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v22 = 0;
LABEL_42:
          *(_BYTE *)(a1 + 32) = v22 != 0;
          continue;
        case 3u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 36) |= 1u;
          break;
        case 4u:
          PBReaderReadString();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32)
            objc_msgSend((id)a1, "addTopicIds:", v32);

          continue;
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
        if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
          break;
        v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
        *(_QWORD *)(a2 + v29) = v30 + 1;
        v28 |= (unint64_t)(v31 & 0x7F) << v26;
        if ((v31 & 0x80) == 0)
          goto LABEL_44;
        v26 += 7;
        v14 = v27++ >= 9;
        if (v14)
        {
          LODWORD(v28) = 0;
          goto LABEL_46;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_44:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v28) = 0;
LABEL_46:
      *(_DWORD *)(a1 + 16) = v28;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t NTPBIssueViewContextDataReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 12) |= 1u;
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
            goto LABEL_29;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_31;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_31:
        *(_DWORD *)(a1 + 8) = v19;
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

uint64_t NTPBTodaySectionIdentifierToGroupTypesReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v18;
  void *v19;
  uint64_t result;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
            v21 = 0;
            v22 = 0;
            v23 = 0;
            while (1)
            {
              v24 = *v3;
              v25 = *(_QWORD *)(a2 + v24);
              if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
                break;
              v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
              *(_QWORD *)(a2 + v24) = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                v14 = v22++ >= 9;
                if (!v14)
                  continue;
              }
              goto LABEL_33;
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
            PBRepeatedInt32Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          v27 = 0;
          v28 = 0;
          v29 = 0;
          while (1)
          {
            v30 = *v3;
            v31 = *(_QWORD *)(a2 + v30);
            if (v31 == -1 || v31 >= *(_QWORD *)(a2 + *v4))
              break;
            v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
            *(_QWORD *)(a2 + v30) = v31 + 1;
            v29 |= (unint64_t)(v32 & 0x7F) << v27;
            if (v32 < 0)
            {
              v27 += 7;
              v14 = v28++ >= 9;
              if (!v14)
                continue;
            }
            goto LABEL_45;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_45:
          PBRepeatedInt32Add();
        }
      }
      else if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(void **)(a1 + 32);
        *(_QWORD *)(a1 + 32) = v18;

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

uint64_t NTPBExternalAnalyticsEventSendReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t result;
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
              goto LABEL_42;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_44;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_42:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_44:
          v32 = 24;
          goto LABEL_49;
        case 2u:
          v24 = 0;
          v25 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 64) |= 2u;
          break;
        case 3u:
          PBReaderReadString();
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = 16;
          goto LABEL_40;
        case 4u:
          PBReaderReadString();
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = 40;
          goto LABEL_40;
        case 5u:
          PBReaderReadString();
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = 8;
          goto LABEL_40;
        case 6u:
          PBReaderReadString();
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = 56;
          goto LABEL_40;
        case 7u:
          PBReaderReadString();
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = 32;
LABEL_40:
          v31 = *(void **)(a1 + v30);
          *(_QWORD *)(a1 + v30) = v29;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v26 = *v3;
        v27 = *(_QWORD *)(a2 + v26);
        if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
          break;
        v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
        *(_QWORD *)(a2 + v26) = v27 + 1;
        v19 |= (unint64_t)(v28 & 0x7F) << v24;
        if ((v28 & 0x80) == 0)
          goto LABEL_46;
        v24 += 7;
        v14 = v25++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_48;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_46:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v19) = 0;
LABEL_48:
      v32 = 48;
LABEL_49:
      *(_DWORD *)(a1 + v32) = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t NTPBTodaySectionsMappingReadFrom(void *a1, uint64_t a2)
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
  NTPBTodaySectionIdentifierToGroupTypes *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
        v17 = objc_alloc_init(NTPBTodaySectionIdentifierToGroupTypes);
        objc_msgSend(a1, "addIdentifiers:", v17);
        if (!PBReaderPlaceMark()
          || (NTPBTodaySectionIdentifierToGroupTypesReadFrom((uint64_t)v17, a2) & 1) == 0)
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

uint64_t NTPBTodayWidgetHeadlineExposureReadFrom(uint64_t a1, uint64_t a2)
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
  unint64_t v14;
  char v15;
  BOOL v16;
  int v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  char v48;
  unsigned int v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  int *v53;
  int *v54;
  NTPBAlternateHeadline *v55;
  char v56;
  unsigned int v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  char v61;
  unsigned int v62;
  uint64_t v63;
  unint64_t v64;
  char v65;
  void *v66;
  uint64_t v67;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = &OBJC_IVAR___NTPBJSONRecord__base;
  v8 = &OBJC_IVAR___NTPBJSONRecord__base;
  v9 = (int *)MEMORY[0x24BE7AF30];
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
      if (v14 == -1 || v14 >= *(_QWORD *)(a2 + *v4))
        break;
      v15 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v14);
      *(_QWORD *)(a2 + v13) = v14 + 1;
      v12 |= (unint64_t)(v15 & 0x7F) << v10;
      if ((v15 & 0x80) == 0)
        goto LABEL_12;
      v10 += 7;
      v16 = v11++ >= 9;
      if (v16)
      {
        v12 = 0;
        v17 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v17 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v12 = 0;
LABEL_14:
    if (v17 || (v12 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v12 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = v7[751];
        goto LABEL_86;
      case 2u:
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = v8[752];
        goto LABEL_86;
      case 3u:
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = 80;
        goto LABEL_86;
      case 4u:
        v22 = 0;
        v23 = 0;
        v24 = 0;
        *(_BYTE *)(a1 + 100) |= 0x40u;
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
            v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v26);
            *(_QWORD *)(a2 + v25) = v26 + 1;
            v24 |= (unint64_t)(v27 & 0x7F) << v22;
            if (v27 < 0)
            {
              v22 += 7;
              v16 = v23++ >= 9;
              if (v16)
              {
                LODWORD(v24) = 0;
                goto LABEL_90;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v24) = 0;
LABEL_90:
        v67 = 72;
        goto LABEL_119;
      case 5u:
        v28 = 0;
        v29 = 0;
        v24 = 0;
        *(_BYTE *)(a1 + 100) |= 8u;
        while (2)
        {
          v30 = *v3;
          v31 = *(_QWORD *)(a2 + v30);
          if (v31 == -1 || v31 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v31);
            *(_QWORD *)(a2 + v30) = v31 + 1;
            v24 |= (unint64_t)(v32 & 0x7F) << v28;
            if (v32 < 0)
            {
              v28 += 7;
              v16 = v29++ >= 9;
              if (v16)
              {
                LODWORD(v24) = 0;
                goto LABEL_94;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v24) = 0;
LABEL_94:
        v67 = 60;
        goto LABEL_119;
      case 6u:
        v33 = 0;
        v34 = 0;
        v24 = 0;
        *(_BYTE *)(a1 + 100) |= 4u;
        while (2)
        {
          v35 = *v3;
          v36 = *(_QWORD *)(a2 + v35);
          if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v36);
            *(_QWORD *)(a2 + v35) = v36 + 1;
            v24 |= (unint64_t)(v37 & 0x7F) << v33;
            if (v37 < 0)
            {
              v33 += 7;
              v16 = v34++ >= 9;
              if (v16)
              {
                LODWORD(v24) = 0;
                goto LABEL_98;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v24) = 0;
LABEL_98:
        v67 = 56;
        goto LABEL_119;
      case 7u:
        v38 = 0;
        v39 = 0;
        v24 = 0;
        *(_BYTE *)(a1 + 100) |= 1u;
        while (2)
        {
          v40 = *v3;
          v41 = *(_QWORD *)(a2 + v40);
          if (v41 == -1 || v41 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v42 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v41);
            *(_QWORD *)(a2 + v40) = v41 + 1;
            v24 |= (unint64_t)(v42 & 0x7F) << v38;
            if (v42 < 0)
            {
              v38 += 7;
              v16 = v39++ >= 9;
              if (v16)
              {
                LODWORD(v24) = 0;
                goto LABEL_102;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v24) = 0;
LABEL_102:
        v67 = 48;
        goto LABEL_119;
      case 8u:
        v43 = 0;
        v44 = 0;
        v24 = 0;
        *(_BYTE *)(a1 + 100) |= 2u;
        while (2)
        {
          v45 = *v3;
          v46 = *(_QWORD *)(a2 + v45);
          if (v46 == -1 || v46 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v47 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v46);
            *(_QWORD *)(a2 + v45) = v46 + 1;
            v24 |= (unint64_t)(v47 & 0x7F) << v43;
            if (v47 < 0)
            {
              v43 += 7;
              v16 = v44++ >= 9;
              if (v16)
              {
                LODWORD(v24) = 0;
                goto LABEL_106;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v24) = 0;
LABEL_106:
        v67 = 52;
        goto LABEL_119;
      case 9u:
        v48 = 0;
        v49 = 0;
        v24 = 0;
        *(_BYTE *)(a1 + 100) |= 0x10u;
        while (2)
        {
          v50 = *v3;
          v51 = *(_QWORD *)(a2 + v50);
          if (v51 == -1 || v51 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v52 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v51);
            *(_QWORD *)(a2 + v50) = v51 + 1;
            v24 |= (unint64_t)(v52 & 0x7F) << v48;
            if (v52 < 0)
            {
              v48 += 7;
              v16 = v49++ >= 9;
              if (v16)
              {
                LODWORD(v24) = 0;
                goto LABEL_110;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v24) = 0;
LABEL_110:
        v67 = 64;
        goto LABEL_119;
      case 0xAu:
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = 40;
        goto LABEL_86;
      case 0xBu:
        v53 = v8;
        v54 = v7;
        v55 = objc_alloc_init(NTPBAlternateHeadline);
        objc_storeStrong((id *)(a1 + 8), v55);
        if (PBReaderPlaceMark() && NTPBAlternateHeadlineReadFrom((uint64_t)v55, a2))
        {
          PBReaderRecallMark();

          v7 = v54;
          v8 = v53;
LABEL_120:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 0xCu:
        v56 = 0;
        v57 = 0;
        v24 = 0;
        *(_BYTE *)(a1 + 100) |= 0x20u;
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
            v60 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v59);
            *(_QWORD *)(a2 + v58) = v59 + 1;
            v24 |= (unint64_t)(v60 & 0x7F) << v56;
            if (v60 < 0)
            {
              v56 += 7;
              v16 = v57++ >= 9;
              if (v16)
              {
                LODWORD(v24) = 0;
                goto LABEL_114;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v24) = 0;
LABEL_114:
        v67 = 68;
        goto LABEL_119;
      case 0xDu:
        v61 = 0;
        v62 = 0;
        v24 = 0;
        *(_BYTE *)(a1 + 100) |= 0x80u;
        while (2)
        {
          v63 = *v3;
          v64 = *(_QWORD *)(a2 + v63);
          if (v64 == -1 || v64 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v65 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v64);
            *(_QWORD *)(a2 + v63) = v64 + 1;
            v24 |= (unint64_t)(v65 & 0x7F) << v61;
            if (v65 < 0)
            {
              v61 += 7;
              v16 = v62++ >= 9;
              if (v16)
              {
                LODWORD(v24) = 0;
                goto LABEL_118;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v24) = 0;
LABEL_118:
        v67 = 96;
LABEL_119:
        *(_DWORD *)(a1 + v67) = v24;
        goto LABEL_120;
      case 0xEu:
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = 88;
        goto LABEL_86;
      case 0xFu:
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = 32;
LABEL_86:
        v66 = *(void **)(a1 + v20);
        *(_QWORD *)(a1 + v20) = v19;

        goto LABEL_120;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_120;
    }
  }
}

BOOL NTPBSuggestionsFeedbackReadFrom(_QWORD *a1, uint64_t a2)
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
  NTPBGradedTagID *v17;
  uint64_t v18;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
        v17 = objc_alloc_init(NTPBGradedTagID);
        objc_msgSend(a1, "addGrades:", v17);
        if (!PBReaderPlaceMark() || (NTPBGradedTagIDReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v18 = objc_claimAutoreleasedReturnValue();
    v17 = (NTPBGradedTagID *)a1[1];
    a1[1] = v18;
LABEL_24:

    goto LABEL_26;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t NTPBGradedTagIDReadFrom(uint64_t a1, uint64_t a2)
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
  void *v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t result;
  uint64_t v32;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 24) |= 2u;
        while (1)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            break;
          v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0)
            goto LABEL_39;
          v20 += 7;
          v14 = v21++ >= 9;
          if (v14)
          {
            LODWORD(v22) = 0;
            goto LABEL_41;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_41:
        v32 = 12;
      }
      else
      {
        if ((_DWORD)v17 != 2)
        {
          if ((_DWORD)v17 == 1)
          {
            PBReaderReadString();
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = *(void **)(a1 + 16);
            *(_QWORD *)(a1 + 16) = v18;

          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        v26 = 0;
        v27 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
        while (1)
        {
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            break;
          v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
          *(_QWORD *)(a2 + v28) = v29 + 1;
          v22 |= (unint64_t)(v30 & 0x7F) << v26;
          if ((v30 & 0x80) == 0)
            goto LABEL_43;
          v26 += 7;
          v14 = v27++ >= 9;
          if (v14)
          {
            LODWORD(v22) = 0;
            goto LABEL_45;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_45:
        v32 = 8;
      }
      *(_DWORD *)(a1 + v32) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t NTPBUserPaidSubscriptionStatusReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v23;
  void *v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v23;

      }
      else if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
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
            goto LABEL_31;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_33:
        *(_DWORD *)(a1 + 16) = v19;
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

uint64_t NTPBWidgetPersonalizationFeatureCTRPairReadFrom(uint64_t a1, uint64_t a2)
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
  void *v19;
  uint64_t v20;
  unint64_t v21;
  int v22;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
      }
      else if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v18;

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

uint64_t NTPBOptInButtonExposureReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t result;
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 36) |= 2u;
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
              goto LABEL_39;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_41;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_41:
          v32 = 32;
          goto LABEL_46;
        case 2u:
          v24 = 0;
          v25 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 36) |= 1u;
          break;
        case 3u:
          PBReaderReadString();
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = 24;
          goto LABEL_37;
        case 4u:
          PBReaderReadData();
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = 8;
LABEL_37:
          v31 = *(void **)(a1 + v30);
          *(_QWORD *)(a1 + v30) = v29;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v26 = *v3;
        v27 = *(_QWORD *)(a2 + v26);
        if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
          break;
        v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
        *(_QWORD *)(a2 + v26) = v27 + 1;
        v19 |= (unint64_t)(v28 & 0x7F) << v24;
        if ((v28 & 0x80) == 0)
          goto LABEL_43;
        v24 += 7;
        v14 = v25++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_45;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v19) = 0;
LABEL_45:
      v32 = 16;
LABEL_46:
      *(_DWORD *)(a1 + v32) = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t NTPBMarketingSubscriptionRequestReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t result;
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  void *v30;
  NTPBDeviceInfo *v31;
  uint64_t v32;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
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
        *(_BYTE *)(a1 + 32) |= 2u;
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
            goto LABEL_40;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_42;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_40:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_42:
        v32 = 28;
        goto LABEL_47;
      case 2u:
        v24 = 0;
        v25 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 32) |= 1u;
        while (2)
        {
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
            *(_QWORD *)(a2 + v26) = v27 + 1;
            v19 |= (unint64_t)(v28 & 0x7F) << v24;
            if (v28 < 0)
            {
              v24 += 7;
              v14 = v25++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_46;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_46:
        v32 = 24;
LABEL_47:
        *(_DWORD *)(a1 + v32) = v19;
        goto LABEL_48;
      case 3u:
        PBReaderReadString();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v29;

        goto LABEL_48;
      case 4u:
        v31 = objc_alloc_init(NTPBDeviceInfo);
        objc_storeStrong((id *)(a1 + 8), v31);
        if (PBReaderPlaceMark() && (NTPBDeviceInfoReadFrom(v31, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_48:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_48;
    }
  }
}

uint64_t NTPBWrappingKeyResponseReadFrom(void *a1, uint64_t a2)
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
  NTPBWrappingKeyMapEntry *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
        v17 = objc_alloc_init(NTPBWrappingKeyMapEntry);
        objc_msgSend(a1, "addWrappingKeyMapEntries:", v17);
        if (!PBReaderPlaceMark() || !NTPBWrappingKeyMapEntryReadFrom((uint64_t)v17, a2))
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

uint64_t NTPBUserIgnoreFavoritesSuggestionReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t result;
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  void *v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  uint64_t v36;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 32) |= 2u;
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
              goto LABEL_44;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_46;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_44:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_46:
          v36 = 24;
          goto LABEL_55;
        case 2u:
          v24 = 0;
          v25 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 32) |= 1u;
          while (2)
          {
            v26 = *v3;
            v27 = *(_QWORD *)(a2 + v26);
            if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
              *(_QWORD *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                v14 = v25++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_50:
          v36 = 8;
          goto LABEL_55;
        case 3u:
          PBReaderReadString();
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = *(void **)(a1 + 16);
          *(_QWORD *)(a1 + 16) = v29;

          continue;
        case 4u:
          v31 = 0;
          v32 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 32) |= 4u;
          break;
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
        if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
          break;
        v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
        *(_QWORD *)(a2 + v33) = v34 + 1;
        v19 |= (unint64_t)(v35 & 0x7F) << v31;
        if ((v35 & 0x80) == 0)
          goto LABEL_52;
        v31 += 7;
        v14 = v32++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_54;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_52:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v19) = 0;
LABEL_54:
      v36 = 28;
LABEL_55:
      *(_DWORD *)(a1 + v36) = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t NTPBAdCtaEngagementReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  char v46;
  unsigned int v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  char v51;
  unsigned int v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  char v56;
  unsigned int v57;
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
  unint64_t v70;
  char v71;
  char v72;
  unsigned int v73;
  uint64_t v74;
  unint64_t v75;
  char v76;
  char v77;
  unsigned int v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  char v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 148) |= 8u;
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
              goto LABEL_116;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_118;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_116:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_118:
          v84 = 28;
          goto LABEL_160;
        case 2u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 104;
          goto LABEL_114;
        case 3u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 112;
          goto LABEL_114;
        case 4u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 96;
          goto LABEL_114;
        case 5u:
          v26 = 0;
          v27 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 148) |= 0x10u;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v29 + 1;
              v19 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_122;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_122:
          v84 = 32;
          goto LABEL_160;
        case 6u:
          v31 = 0;
          v32 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 148) |= 0x40u;
          while (2)
          {
            v33 = *v3;
            v34 = *(_QWORD *)(a2 + v33);
            if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
              *(_QWORD *)(a2 + v33) = v34 + 1;
              v19 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                v14 = v32++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_126;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_126:
          v84 = 52;
          goto LABEL_160;
        case 7u:
          v36 = 0;
          v37 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 148) |= 4u;
          while (2)
          {
            v38 = *v3;
            v39 = *(_QWORD *)(a2 + v38);
            if (v39 == -1 || v39 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v39);
              *(_QWORD *)(a2 + v38) = v39 + 1;
              v19 |= (unint64_t)(v40 & 0x7F) << v36;
              if (v40 < 0)
              {
                v36 += 7;
                v14 = v37++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_130;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_130:
          v84 = 24;
          goto LABEL_160;
        case 8u:
          v41 = 0;
          v42 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 148) |= 0x20u;
          while (2)
          {
            v43 = *v3;
            v44 = *(_QWORD *)(a2 + v43);
            if (v44 == -1 || v44 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v45 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v44);
              *(_QWORD *)(a2 + v43) = v44 + 1;
              v19 |= (unint64_t)(v45 & 0x7F) << v41;
              if (v45 < 0)
              {
                v41 += 7;
                v14 = v42++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_134;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_134:
          v84 = 48;
          goto LABEL_160;
        case 9u:
          v46 = 0;
          v47 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 148) |= 0x100u;
          while (2)
          {
            v48 = *v3;
            v49 = *(_QWORD *)(a2 + v48);
            if (v49 == -1 || v49 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v50 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v49);
              *(_QWORD *)(a2 + v48) = v49 + 1;
              v19 |= (unint64_t)(v50 & 0x7F) << v46;
              if (v50 < 0)
              {
                v46 += 7;
                v14 = v47++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_138;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_138:
          v84 = 120;
          goto LABEL_160;
        case 0xAu:
          v51 = 0;
          v52 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 148) |= 0x400u;
          while (2)
          {
            v53 = *v3;
            v54 = *(_QWORD *)(a2 + v53);
            if (v54 == -1 || v54 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v55 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v54);
              *(_QWORD *)(a2 + v53) = v54 + 1;
              v19 |= (unint64_t)(v55 & 0x7F) << v51;
              if (v55 < 0)
              {
                v51 += 7;
                v14 = v52++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_142;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_142:
          v84 = 140;
          goto LABEL_160;
        case 0xBu:
          v56 = 0;
          v57 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 148) |= 0x80u;
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
              v19 |= (unint64_t)(v60 & 0x7F) << v56;
              if (v60 < 0)
              {
                v56 += 7;
                v14 = v57++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_146;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_146:
          v84 = 80;
          goto LABEL_160;
        case 0xCu:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 72;
          goto LABEL_114;
        case 0xDu:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 56;
          goto LABEL_114;
        case 0xEu:
          v61 = 0;
          v62 = 0;
          v63 = 0;
          *(_WORD *)(a1 + 148) |= 1u;
          while (2)
          {
            v64 = *v3;
            v65 = *(_QWORD *)(a2 + v64);
            if (v65 == -1 || v65 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v66 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v65);
              *(_QWORD *)(a2 + v64) = v65 + 1;
              v63 |= (unint64_t)(v66 & 0x7F) << v61;
              if (v66 < 0)
              {
                v61 += 7;
                v14 = v62++ >= 9;
                if (v14)
                {
                  v63 = 0;
                  goto LABEL_150;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v63 = 0;
LABEL_150:
          v85 = 8;
          goto LABEL_155;
        case 0xFu:
          v67 = 0;
          v68 = 0;
          v63 = 0;
          *(_WORD *)(a1 + 148) |= 2u;
          while (2)
          {
            v69 = *v3;
            v70 = *(_QWORD *)(a2 + v69);
            if (v70 == -1 || v70 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v71 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v70);
              *(_QWORD *)(a2 + v69) = v70 + 1;
              v63 |= (unint64_t)(v71 & 0x7F) << v67;
              if (v71 < 0)
              {
                v67 += 7;
                v14 = v68++ >= 9;
                if (v14)
                {
                  v63 = 0;
                  goto LABEL_154;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v63 = 0;
LABEL_154:
          v85 = 16;
LABEL_155:
          *(_QWORD *)(a1 + v85) = v63;
          continue;
        case 0x10u:
          v72 = 0;
          v73 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 148) |= 0x200u;
          while (2)
          {
            v74 = *v3;
            v75 = *(_QWORD *)(a2 + v74);
            if (v75 == -1 || v75 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v76 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v75);
              *(_QWORD *)(a2 + v74) = v75 + 1;
              v19 |= (unint64_t)(v76 & 0x7F) << v72;
              if (v76 < 0)
              {
                v72 += 7;
                v14 = v73++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_159;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_159:
          v84 = 136;
LABEL_160:
          *(_DWORD *)(a1 + v84) = v19;
          continue;
        case 0x11u:
          v77 = 0;
          v78 = 0;
          v79 = 0;
          *(_WORD *)(a1 + 148) |= 0x800u;
          break;
        case 0x12u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 40;
          goto LABEL_114;
        case 0x13u:
          PBReaderReadData();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 64;
          goto LABEL_114;
        case 0x14u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 128;
          goto LABEL_114;
        case 0x15u:
          PBReaderReadData();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 88;
LABEL_114:
          v83 = *(void **)(a1 + v25);
          *(_QWORD *)(a1 + v25) = v24;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v80 = *v3;
        v81 = *(_QWORD *)(a2 + v80);
        if (v81 == -1 || v81 >= *(_QWORD *)(a2 + *v4))
          break;
        v82 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v81);
        *(_QWORD *)(a2 + v80) = v81 + 1;
        v79 |= (unint64_t)(v82 & 0x7F) << v77;
        if ((v82 & 0x80) == 0)
          goto LABEL_164;
        v77 += 7;
        v14 = v78++ >= 9;
        if (v14)
        {
          v79 = 0;
          goto LABEL_166;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_164:
      if (*(_BYTE *)(a2 + *v5))
        v79 = 0;
LABEL_166:
      *(_BYTE *)(a1 + 144) = v79 != 0;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t NTPBAdEngagementReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  char v46;
  unsigned int v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  char v51;
  unsigned int v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  char v56;
  unsigned int v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  char v62;
  unsigned int v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  char v67;
  unsigned int v68;
  uint64_t v69;
  unint64_t v70;
  char v71;
  char v72;
  unsigned int v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  char v77;
  char v78;
  unsigned int v79;
  uint64_t v80;
  unint64_t v81;
  char v82;
  char v83;
  unsigned int v84;
  uint64_t v85;
  unint64_t v86;
  char v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 120;
          goto LABEL_122;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 128;
          goto LABEL_122;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 112;
          goto LABEL_122;
        case 4u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 164) |= 8u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_126;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_126:
          v89 = 28;
          goto LABEL_176;
        case 5u:
          v26 = 0;
          v27 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 164) |= 0x40u;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v29 + 1;
              v22 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_130;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_130:
          v89 = 48;
          goto LABEL_176;
        case 6u:
          v31 = 0;
          v32 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 164) |= 4u;
          while (2)
          {
            v33 = *v3;
            v34 = *(_QWORD *)(a2 + v33);
            if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
              *(_QWORD *)(a2 + v33) = v34 + 1;
              v22 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                v14 = v32++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_134;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_134:
          v89 = 24;
          goto LABEL_176;
        case 7u:
          v36 = 0;
          v37 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 164) |= 0x20u;
          while (2)
          {
            v38 = *v3;
            v39 = *(_QWORD *)(a2 + v38);
            if (v39 == -1 || v39 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v39);
              *(_QWORD *)(a2 + v38) = v39 + 1;
              v22 |= (unint64_t)(v40 & 0x7F) << v36;
              if (v40 < 0)
              {
                v36 += 7;
                v14 = v37++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_138;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_138:
          v89 = 44;
          goto LABEL_176;
        case 8u:
          v41 = 0;
          v42 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 164) |= 0x200u;
          while (2)
          {
            v43 = *v3;
            v44 = *(_QWORD *)(a2 + v43);
            if (v44 == -1 || v44 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v45 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v44);
              *(_QWORD *)(a2 + v43) = v44 + 1;
              v22 |= (unint64_t)(v45 & 0x7F) << v41;
              if (v45 < 0)
              {
                v41 += 7;
                v14 = v42++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_142;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_142:
          v89 = 136;
          goto LABEL_176;
        case 9u:
          v46 = 0;
          v47 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 164) |= 0x800u;
          while (2)
          {
            v48 = *v3;
            v49 = *(_QWORD *)(a2 + v48);
            if (v49 == -1 || v49 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v50 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v49);
              *(_QWORD *)(a2 + v48) = v49 + 1;
              v22 |= (unint64_t)(v50 & 0x7F) << v46;
              if (v50 < 0)
              {
                v46 += 7;
                v14 = v47++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_146;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_146:
          v89 = 156;
          goto LABEL_176;
        case 0xAu:
          v51 = 0;
          v52 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 164) |= 0x80u;
          while (2)
          {
            v53 = *v3;
            v54 = *(_QWORD *)(a2 + v53);
            if (v54 == -1 || v54 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v55 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v54);
              *(_QWORD *)(a2 + v53) = v54 + 1;
              v22 |= (unint64_t)(v55 & 0x7F) << v51;
              if (v55 < 0)
              {
                v51 += 7;
                v14 = v52++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_150;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_150:
          v89 = 80;
          goto LABEL_176;
        case 0xBu:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 72;
          goto LABEL_122;
        case 0xCu:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 56;
          goto LABEL_122;
        case 0xDu:
          v56 = 0;
          v57 = 0;
          v58 = 0;
          *(_WORD *)(a1 + 164) |= 1u;
          while (2)
          {
            v59 = *v3;
            v60 = *(_QWORD *)(a2 + v59);
            if (v60 == -1 || v60 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v61 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v60);
              *(_QWORD *)(a2 + v59) = v60 + 1;
              v58 |= (unint64_t)(v61 & 0x7F) << v56;
              if (v61 < 0)
              {
                v56 += 7;
                v14 = v57++ >= 9;
                if (v14)
                {
                  v58 = 0;
                  goto LABEL_154;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v58 = 0;
LABEL_154:
          v90 = 8;
          goto LABEL_159;
        case 0xEu:
          v62 = 0;
          v63 = 0;
          v58 = 0;
          *(_WORD *)(a1 + 164) |= 2u;
          while (2)
          {
            v64 = *v3;
            v65 = *(_QWORD *)(a2 + v64);
            if (v65 == -1 || v65 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v66 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v65);
              *(_QWORD *)(a2 + v64) = v65 + 1;
              v58 |= (unint64_t)(v66 & 0x7F) << v62;
              if (v66 < 0)
              {
                v62 += 7;
                v14 = v63++ >= 9;
                if (v14)
                {
                  v58 = 0;
                  goto LABEL_158;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v58 = 0;
LABEL_158:
          v90 = 16;
LABEL_159:
          *(_QWORD *)(a1 + v90) = v58;
          continue;
        case 0xFu:
          v67 = 0;
          v68 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 164) |= 0x400u;
          while (2)
          {
            v69 = *v3;
            v70 = *(_QWORD *)(a2 + v69);
            if (v70 == -1 || v70 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v71 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v70);
              *(_QWORD *)(a2 + v69) = v70 + 1;
              v22 |= (unint64_t)(v71 & 0x7F) << v67;
              if (v71 < 0)
              {
                v67 += 7;
                v14 = v68++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_163;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_163:
          v89 = 152;
          goto LABEL_176;
        case 0x10u:
          v72 = 0;
          v73 = 0;
          v74 = 0;
          *(_WORD *)(a1 + 164) |= 0x1000u;
          while (2)
          {
            v75 = *v3;
            v76 = *(_QWORD *)(a2 + v75);
            if (v76 == -1 || v76 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v77 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v76);
              *(_QWORD *)(a2 + v75) = v76 + 1;
              v74 |= (unint64_t)(v77 & 0x7F) << v72;
              if (v77 < 0)
              {
                v72 += 7;
                v14 = v73++ >= 9;
                if (v14)
                {
                  v74 = 0;
                  goto LABEL_167;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v74 = 0;
LABEL_167:
          *(_BYTE *)(a1 + 160) = v74 != 0;
          continue;
        case 0x11u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_122;
        case 0x12u:
          v78 = 0;
          v79 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 164) |= 0x10u;
          while (2)
          {
            v80 = *v3;
            v81 = *(_QWORD *)(a2 + v80);
            if (v81 == -1 || v81 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v82 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v81);
              *(_QWORD *)(a2 + v80) = v81 + 1;
              v22 |= (unint64_t)(v82 & 0x7F) << v78;
              if (v82 < 0)
              {
                v78 += 7;
                v14 = v79++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_171;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_171:
          v89 = 40;
          goto LABEL_176;
        case 0x13u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 64;
          goto LABEL_122;
        case 0x14u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 144;
          goto LABEL_122;
        case 0x15u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 88;
          goto LABEL_122;
        case 0x16u:
          v83 = 0;
          v84 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 164) |= 0x100u;
          break;
        case 0x17u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 104;
LABEL_122:
          v88 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v85 = *v3;
        v86 = *(_QWORD *)(a2 + v85);
        if (v86 == -1 || v86 >= *(_QWORD *)(a2 + *v4))
          break;
        v87 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v86);
        *(_QWORD *)(a2 + v85) = v86 + 1;
        v22 |= (unint64_t)(v87 & 0x7F) << v83;
        if ((v87 & 0x80) == 0)
          goto LABEL_173;
        v83 += 7;
        v14 = v84++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_175;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_173:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v22) = 0;
LABEL_175:
      v89 = 96;
LABEL_176:
      *(_DWORD *)(a1 + v89) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t NTPBChannelDataReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 12) |= 1u;
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
            goto LABEL_29;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_31;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_31:
        *(_BYTE *)(a1 + 8) = v19 != 0;
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

BOOL COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSAlternateHeadlineReadFrom(uint64_t a1, uint64_t a2)
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

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 16) |= 2u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
          {
            v24 = &OBJC_IVAR___COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSAlternateHeadline__articleHeadlineTreatmentState;
            goto LABEL_38;
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
            v24 = &OBJC_IVAR___COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSAlternateHeadline__articleHeadlineTreatmentState;
            goto LABEL_41;
          }
        }
        v24 = &OBJC_IVAR___COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSAlternateHeadline__articleHeadlineTreatmentState;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_41:
        *(_DWORD *)(a1 + *v24) = v19;
        goto LABEL_42;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_42:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v25 = 0;
    v26 = 0;
    v19 = 0;
    *(_BYTE *)(a1 + 16) |= 1u;
    while (1)
    {
      v27 = *v3;
      v28 = *(_QWORD *)(a2 + v27);
      if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
        break;
      v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
      *(_QWORD *)(a2 + v27) = v28 + 1;
      v19 |= (unint64_t)(v29 & 0x7F) << v25;
      if ((v29 & 0x80) == 0)
      {
        v24 = &OBJC_IVAR___COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSAlternateHeadline__articleHeadlineTreatmentId;
        goto LABEL_39;
      }
      v25 += 7;
      v23 = v26++ > 8;
      if (v23)
      {
        LODWORD(v19) = 0;
        v24 = &OBJC_IVAR___COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSAlternateHeadline__articleHeadlineTreatmentId;
        goto LABEL_41;
      }
    }
    v24 = &OBJC_IVAR___COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSAlternateHeadline__articleHeadlineTreatmentId;
LABEL_38:
    *(_BYTE *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t NTPBAdImpressionReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  char v46;
  unsigned int v47;
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
  unint64_t v60;
  char v61;
  char v62;
  unsigned int v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  char v67;
  unsigned int v68;
  uint64_t v69;
  unint64_t v70;
  char v71;
  void *v72;
  uint64_t v73;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 112;
          goto LABEL_102;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 120;
          goto LABEL_102;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 104;
          goto LABEL_102;
        case 4u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 160) |= 0x10u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_106;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_106:
          v73 = 40;
          goto LABEL_143;
        case 5u:
          v26 = 0;
          v27 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 160) |= 2u;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v29 + 1;
              v22 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_110;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_110:
          v73 = 16;
          goto LABEL_143;
        case 6u:
          v31 = 0;
          v32 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 160) |= 8u;
          while (2)
          {
            v33 = *v3;
            v34 = *(_QWORD *)(a2 + v33);
            if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
              *(_QWORD *)(a2 + v33) = v34 + 1;
              v22 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                v14 = v32++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_114;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_114:
          v73 = 36;
          goto LABEL_143;
        case 7u:
          v36 = 0;
          v37 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 160) |= 0x80u;
          while (2)
          {
            v38 = *v3;
            v39 = *(_QWORD *)(a2 + v38);
            if (v39 == -1 || v39 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v39);
              *(_QWORD *)(a2 + v38) = v39 + 1;
              v22 |= (unint64_t)(v40 & 0x7F) << v36;
              if (v40 < 0)
              {
                v36 += 7;
                v14 = v37++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_118;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_118:
          v73 = 128;
          goto LABEL_143;
        case 8u:
          v41 = 0;
          v42 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 160) |= 0x200u;
          while (2)
          {
            v43 = *v3;
            v44 = *(_QWORD *)(a2 + v43);
            if (v44 == -1 || v44 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v45 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v44);
              *(_QWORD *)(a2 + v43) = v44 + 1;
              v22 |= (unint64_t)(v45 & 0x7F) << v41;
              if (v45 < 0)
              {
                v41 += 7;
                v14 = v42++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_122;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_122:
          v73 = 156;
          goto LABEL_143;
        case 9u:
          v46 = 0;
          v47 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 160) |= 0x20u;
          while (2)
          {
            v48 = *v3;
            v49 = *(_QWORD *)(a2 + v48);
            if (v49 == -1 || v49 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v50 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v49);
              *(_QWORD *)(a2 + v48) = v49 + 1;
              v22 |= (unint64_t)(v50 & 0x7F) << v46;
              if (v50 < 0)
              {
                v46 += 7;
                v14 = v47++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_126;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_126:
          v73 = 72;
          goto LABEL_143;
        case 0xAu:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 64;
          goto LABEL_102;
        case 0xBu:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 48;
          goto LABEL_102;
        case 0xCu:
          v51 = 0;
          v52 = 0;
          v53 = 0;
          *(_WORD *)(a1 + 160) |= 1u;
          while (2)
          {
            v54 = *v3;
            v55 = *(_QWORD *)(a2 + v54);
            if (v55 == -1 || v55 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v56 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v55);
              *(_QWORD *)(a2 + v54) = v55 + 1;
              v53 |= (unint64_t)(v56 & 0x7F) << v51;
              if (v56 < 0)
              {
                v51 += 7;
                v14 = v52++ >= 9;
                if (v14)
                {
                  v53 = 0;
                  goto LABEL_130;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v53 = 0;
LABEL_130:
          *(_QWORD *)(a1 + 8) = v53;
          continue;
        case 0xDu:
          v57 = 0;
          v58 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 160) |= 0x100u;
          while (2)
          {
            v59 = *v3;
            v60 = *(_QWORD *)(a2 + v59);
            if (v60 == -1 || v60 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v61 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v60);
              *(_QWORD *)(a2 + v59) = v60 + 1;
              v22 |= (unint64_t)(v61 & 0x7F) << v57;
              if (v61 < 0)
              {
                v57 += 7;
                v14 = v58++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_134;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_134:
          v73 = 152;
          goto LABEL_143;
        case 0xEu:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_102;
        case 0xFu:
          v62 = 0;
          v63 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 160) |= 4u;
          while (2)
          {
            v64 = *v3;
            v65 = *(_QWORD *)(a2 + v64);
            if (v65 == -1 || v65 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v66 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v65);
              *(_QWORD *)(a2 + v64) = v65 + 1;
              v22 |= (unint64_t)(v66 & 0x7F) << v62;
              if (v66 < 0)
              {
                v62 += 7;
                v14 = v63++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_138;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_138:
          v73 = 32;
          goto LABEL_143;
        case 0x10u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 56;
          goto LABEL_102;
        case 0x11u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 144;
          goto LABEL_102;
        case 0x12u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 80;
          goto LABEL_102;
        case 0x13u:
          v67 = 0;
          v68 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 160) |= 0x40u;
          break;
        case 0x14u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 96;
          goto LABEL_102;
        case 0x15u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 136;
LABEL_102:
          v72 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v69 = *v3;
        v70 = *(_QWORD *)(a2 + v69);
        if (v70 == -1 || v70 >= *(_QWORD *)(a2 + *v4))
          break;
        v71 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v70);
        *(_QWORD *)(a2 + v69) = v70 + 1;
        v22 |= (unint64_t)(v71 & 0x7F) << v67;
        if ((v71 & 0x80) == 0)
          goto LABEL_140;
        v67 += 7;
        v14 = v68++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_142;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_140:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v22) = 0;
LABEL_142:
      v73 = 88;
LABEL_143:
      *(_DWORD *)(a1 + v73) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t NTPBArticleEngagementReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  NTPBIssueData *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
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
        *(_BYTE *)(a1 + 104) |= 4u;
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
            goto LABEL_70;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_72;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_70:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_72:
        v50 = 24;
        goto LABEL_81;
      case 2u:
        PBReaderReadData();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 80;
        goto LABEL_68;
      case 3u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 88;
        goto LABEL_68;
      case 4u:
        v26 = 0;
        v27 = 0;
        v28 = 0;
        *(_BYTE *)(a1 + 104) |= 2u;
        while (2)
        {
          v29 = *v3;
          v30 = *(_QWORD *)(a2 + v29);
          if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
            *(_QWORD *)(a2 + v29) = v30 + 1;
            v28 |= (unint64_t)(v31 & 0x7F) << v26;
            if (v31 < 0)
            {
              v26 += 7;
              v14 = v27++ >= 9;
              if (v14)
              {
                v28 = 0;
                goto LABEL_76;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v28 = 0;
LABEL_76:
        v51 = 16;
        goto LABEL_86;
      case 5u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 32;
        goto LABEL_68;
      case 6u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 40;
        goto LABEL_68;
      case 7u:
        v32 = 0;
        v33 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 104) |= 8u;
        while (2)
        {
          v34 = *v3;
          v35 = *(_QWORD *)(a2 + v34);
          if (v35 == -1 || v35 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
            *(_QWORD *)(a2 + v34) = v35 + 1;
            v19 |= (unint64_t)(v36 & 0x7F) << v32;
            if (v36 < 0)
            {
              v32 += 7;
              v14 = v33++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_80;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_80:
        v50 = 96;
LABEL_81:
        *(_DWORD *)(a1 + v50) = v19;
        goto LABEL_91;
      case 8u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 48;
        goto LABEL_68;
      case 9u:
        v37 = 0;
        v38 = 0;
        v28 = 0;
        *(_BYTE *)(a1 + 104) |= 1u;
        while (2)
        {
          v39 = *v3;
          v40 = *(_QWORD *)(a2 + v39);
          if (v40 == -1 || v40 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v41 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v40);
            *(_QWORD *)(a2 + v39) = v40 + 1;
            v28 |= (unint64_t)(v41 & 0x7F) << v37;
            if (v41 < 0)
            {
              v37 += 7;
              v14 = v38++ >= 9;
              if (v14)
              {
                v28 = 0;
                goto LABEL_85;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v28 = 0;
LABEL_85:
        v51 = 8;
LABEL_86:
        *(_QWORD *)(a1 + v51) = v28;
        goto LABEL_91;
      case 0xAu:
        v42 = 0;
        v43 = 0;
        v44 = 0;
        *(_BYTE *)(a1 + 104) |= 0x10u;
        while (2)
        {
          v45 = *v3;
          v46 = *(_QWORD *)(a2 + v45);
          if (v46 == -1 || v46 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v47 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v46);
            *(_QWORD *)(a2 + v45) = v46 + 1;
            v44 |= (unint64_t)(v47 & 0x7F) << v42;
            if (v47 < 0)
            {
              v42 += 7;
              v14 = v43++ >= 9;
              if (v14)
              {
                v44 = 0;
                goto LABEL_90;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v44 = 0;
LABEL_90:
        *(_BYTE *)(a1 + 100) = v44 != 0;
        goto LABEL_91;
      case 0xBu:
        v48 = objc_alloc_init(NTPBIssueData);
        objc_storeStrong((id *)(a1 + 64), v48);
        if (!PBReaderPlaceMark() || (NTPBIssueDataReadFrom((uint64_t)v48, a2) & 1) == 0)
          goto LABEL_93;
        goto LABEL_66;
      case 0xCu:
        v48 = objc_alloc_init(NTPBIssueViewData);
        objc_storeStrong((id *)(a1 + 72), v48);
        if (PBReaderPlaceMark() && (NTPBIssueViewDataReadFrom((uint64_t)v48, a2) & 1) != 0)
        {
LABEL_66:
          PBReaderRecallMark();

LABEL_91:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_93:

        return 0;
      case 0xDu:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 56;
LABEL_68:
        v49 = *(void **)(a1 + v25);
        *(_QWORD *)(a1 + v25) = v24;

        goto LABEL_91;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_91;
    }
  }
}

uint64_t NTPBTodayModuleContentRequestReadFrom(uint64_t a1, uint64_t a2)
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
  BOOL v16;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  void *v26;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
        if (v15)
          v16 = 1;
        else
          v16 = (v10 & 7) == 4;
        if (!v16)
        {
          switch((v10 >> 3))
          {
            case 1u:
              v17 = 0;
              v18 = 0;
              v19 = 0;
              *(_BYTE *)(a1 + 48) |= 1u;
              break;
            case 2u:
              PBReaderReadString();
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = 40;
              goto LABEL_32;
            case 3u:
              PBReaderReadString();
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = 16;
              goto LABEL_32;
            case 4u:
              PBReaderReadString();
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = 32;
              goto LABEL_32;
            case 5u:
              PBReaderReadString();
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = 24;
LABEL_32:
              v26 = *(void **)(a1 + v25);
              *(_QWORD *)(a1 + v25) = v24;

              goto LABEL_37;
            default:
              result = PBReaderSkipValueWithTag();
              if (!(_DWORD)result)
                return result;
LABEL_37:
              if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
                return *(_BYTE *)(a2 + *v5) == 0;
              continue;
          }
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
              goto LABEL_34;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_36;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_36:
          *(_DWORD *)(a1 + 8) = v19;
          goto LABEL_37;
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t NTPBBucketGroupConfigReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t result;
  char v24;
  unsigned int v25;
  uint64_t v26;
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
  uint64_t v40;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
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
              goto LABEL_50;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_52;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_50:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_52:
          *(_DWORD *)(a1 + 32) = v19;
          continue;
        case 2u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
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
                  v26 = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v26 = 0;
LABEL_56:
          v40 = 16;
          goto LABEL_65;
        case 3u:
          v30 = 0;
          v31 = 0;
          v26 = 0;
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
              v26 |= (unint64_t)(v34 & 0x7F) << v30;
              if (v34 < 0)
              {
                v30 += 7;
                v14 = v31++ >= 9;
                if (v14)
                {
                  v26 = 0;
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v26 = 0;
LABEL_60:
          v40 = 8;
          goto LABEL_65;
        case 4u:
          v35 = 0;
          v36 = 0;
          v26 = 0;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v37 = *v3;
        v38 = *(_QWORD *)(a2 + v37);
        if (v38 == -1 || v38 >= *(_QWORD *)(a2 + *v4))
          break;
        v39 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v38);
        *(_QWORD *)(a2 + v37) = v38 + 1;
        v26 |= (unint64_t)(v39 & 0x7F) << v35;
        if ((v39 & 0x80) == 0)
          goto LABEL_62;
        v35 += 7;
        v14 = v36++ >= 9;
        if (v14)
        {
          v26 = 0;
          goto LABEL_64;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_62:
      if (*(_BYTE *)(a2 + *v5))
        v26 = 0;
LABEL_64:
      v40 = 24;
LABEL_65:
      *(_QWORD *)(a1 + v40) = v26;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t NTPBLinkTapReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  void *v41;
  uint64_t v42;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 68) |= 4u;
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
              goto LABEL_56;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_58;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_56:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_58:
          v42 = 40;
          goto LABEL_71;
        case 2u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 8;
          goto LABEL_54;
        case 3u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 32;
          goto LABEL_54;
        case 4u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 48;
          goto LABEL_54;
        case 5u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 56;
          goto LABEL_54;
        case 6u:
          v26 = 0;
          v27 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 68) |= 8u;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v29 + 1;
              v19 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_62;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_62:
          v42 = 64;
          goto LABEL_71;
        case 7u:
          v31 = 0;
          v32 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 68) |= 2u;
          while (2)
          {
            v33 = *v3;
            v34 = *(_QWORD *)(a2 + v33);
            if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
              *(_QWORD *)(a2 + v33) = v34 + 1;
              v19 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                v14 = v32++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_66;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_66:
          v42 = 28;
          goto LABEL_71;
        case 8u:
          v36 = 0;
          v37 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 68) |= 1u;
          break;
        case 9u:
          PBReaderReadData();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 16;
LABEL_54:
          v41 = *(void **)(a1 + v25);
          *(_QWORD *)(a1 + v25) = v24;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v38 = *v3;
        v39 = *(_QWORD *)(a2 + v38);
        if (v39 == -1 || v39 >= *(_QWORD *)(a2 + *v4))
          break;
        v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v39);
        *(_QWORD *)(a2 + v38) = v39 + 1;
        v19 |= (unint64_t)(v40 & 0x7F) << v36;
        if ((v40 & 0x80) == 0)
          goto LABEL_68;
        v36 += 7;
        v14 = v37++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_70;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_68:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v19) = 0;
LABEL_70:
      v42 = 24;
LABEL_71:
      *(_DWORD *)(a1 + v42) = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL NTPBUserSegmentationApiConfigurationReadFrom(uint64_t a1, uint64_t a2)
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

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
        v19 = 8;
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

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
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

BOOL NTPBTranslationMapReadFrom(void *a1, uint64_t a2)
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
  NTPBLanguageBucket *v17;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
        v17 = objc_alloc_init(NTPBLanguageBucket);
        objc_msgSend(a1, "addFavoritesLanguageBuckets:", v17);
      }
      else
      {
        if ((v10 >> 3) != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
          continue;
        }
        v17 = objc_alloc_init(NTPBLanguageBucket);
        objc_msgSend(a1, "addTopicLanguageBuckets:", v17);
      }
      if (!PBReaderPlaceMark() || !NTPBLanguageBucketReadFrom((uint64_t)v17, a2))
      {

        return 0;
      }
      PBReaderRecallMark();

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL NTPBGroupingFlagsReadFrom(uint64_t a1, uint64_t a2)
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
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  BOOL v24;
  int *v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
      {
        v26 = 0;
        v27 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 12) |= 2u;
        while (1)
        {
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            break;
          v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
          *(_QWORD *)(a2 + v28) = v29 + 1;
          v20 |= (unint64_t)(v30 & 0x7F) << v26;
          if ((v30 & 0x80) == 0)
          {
            v25 = &OBJC_IVAR___NTPBGroupingFlags__isEligibleForGroupingIfFavorited;
            goto LABEL_48;
          }
          v26 += 7;
          v24 = v27++ > 8;
          if (v24)
          {
            v20 = 0;
            v25 = &OBJC_IVAR___NTPBGroupingFlags__isEligibleForGroupingIfFavorited;
            goto LABEL_50;
          }
        }
        v25 = &OBJC_IVAR___NTPBGroupingFlags__isEligibleForGroupingIfFavorited;
LABEL_47:
        *(_BYTE *)(a2 + *v5) = 1;
        goto LABEL_48;
      }
      if ((_DWORD)v17 == 2)
        break;
      if ((_DWORD)v17 == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 12) |= 4u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
          {
            v25 = &OBJC_IVAR___NTPBGroupingFlags__isHidden;
            goto LABEL_47;
          }
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            break;
          v18 += 7;
          v24 = v19++ > 8;
          if (v24)
          {
            v20 = 0;
            v25 = &OBJC_IVAR___NTPBGroupingFlags__isHidden;
            goto LABEL_50;
          }
        }
        v25 = &OBJC_IVAR___NTPBGroupingFlags__isHidden;
        goto LABEL_48;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_51:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v31 = 0;
    v32 = 0;
    v20 = 0;
    *(_BYTE *)(a1 + 12) |= 1u;
    while (1)
    {
      v33 = *v3;
      v34 = *(_QWORD *)(a2 + v33);
      if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
      {
        v25 = &OBJC_IVAR___NTPBGroupingFlags__isEligibleForGrouping;
        goto LABEL_47;
      }
      v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
      *(_QWORD *)(a2 + v33) = v34 + 1;
      v20 |= (unint64_t)(v35 & 0x7F) << v31;
      if ((v35 & 0x80) == 0)
        break;
      v31 += 7;
      v24 = v32++ > 8;
      if (v24)
      {
        v20 = 0;
        v25 = &OBJC_IVAR___NTPBGroupingFlags__isEligibleForGrouping;
        goto LABEL_50;
      }
    }
    v25 = &OBJC_IVAR___NTPBGroupingFlags__isEligibleForGrouping;
LABEL_48:
    if (*(_BYTE *)(a2 + *v5))
      v20 = 0;
LABEL_50:
    *(_BYTE *)(a1 + *v25) = v20 != 0;
    goto LABEL_51;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL NTPBLanguageBucketReadFrom(uint64_t a1, uint64_t a2)
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
  NTPBGroupingFlags *v19;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
      {
        v19 = objc_alloc_init(NTPBGroupingFlags);
        objc_storeStrong((id *)(a1 + 8), v19);
        if (!PBReaderPlaceMark() || !NTPBGroupingFlagsReadFrom((uint64_t)v19, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_27;
      }
      if ((_DWORD)v17 == 2)
        break;
      if ((_DWORD)v17 == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(NTPBGroupingFlags **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v18;
LABEL_27:

        goto LABEL_29;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_29:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v19 = (NTPBGroupingFlags *)objc_claimAutoreleasedReturnValue();
    if (v19)
      objc_msgSend((id)a1, "addValues:", v19);
    goto LABEL_27;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL NTPBArticleTagMetadataReadFrom(id *a1, uint64_t a2)
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
  NTPBTagMetadata *v17;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
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
        v17 = objc_alloc_init(NTPBTagMetadata);
        objc_msgSend(a1, "addTopicTagMetadata:", v17);
      }
      else
      {
        if ((v10 >> 3) != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
          continue;
        }
        v17 = objc_alloc_init(NTPBTagMetadata);
        objc_storeStrong(a1 + 1, v17);
      }
      if (!PBReaderPlaceMark() || (NTPBTagMetadataReadFrom((uint64_t)v17, a2) & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark();

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x24BE7AF80]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x24BE7AF88]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x24BE7AF90]();
}

uint64_t PBDataWriterWriteFixed32Field()
{
  return MEMORY[0x24BE7AF98]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x24BE7AFA0]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x24BE7AFA8]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x24BE7AFB0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x24BE7AFD8]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x24BE7AFE8]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x24BE7AFF0]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x24BE7B008]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x24BE7B018]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x24BE7B028]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x24BE7B030]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x24BE7B038]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x24BE7B048]();
}

uint64_t PBRepeatedInt32Add()
{
  return MEMORY[0x24BE7B0C8]();
}

uint64_t PBRepeatedInt32Clear()
{
  return MEMORY[0x24BE7B0D0]();
}

uint64_t PBRepeatedInt32Copy()
{
  return MEMORY[0x24BE7B0D8]();
}

uint64_t PBRepeatedInt32Hash()
{
  return MEMORY[0x24BE7B0E0]();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return MEMORY[0x24BE7B0E8]();
}

uint64_t PBRepeatedInt32NSArray()
{
  return MEMORY[0x24BE7B0F0]();
}

uint64_t PBRepeatedInt32Set()
{
  return MEMORY[0x24BE7B0F8]();
}

uint64_t PBRepeatedInt64Add()
{
  return MEMORY[0x24BE7B100]();
}

uint64_t PBRepeatedInt64Clear()
{
  return MEMORY[0x24BE7B108]();
}

uint64_t PBRepeatedInt64Copy()
{
  return MEMORY[0x24BE7B110]();
}

uint64_t PBRepeatedInt64Hash()
{
  return MEMORY[0x24BE7B118]();
}

uint64_t PBRepeatedInt64IsEqual()
{
  return MEMORY[0x24BE7B120]();
}

uint64_t PBRepeatedInt64NSArray()
{
  return MEMORY[0x24BE7B128]();
}

uint64_t PBRepeatedInt64Set()
{
  return MEMORY[0x24BE7B130]();
}

uint64_t PBRepeatedUInt32Add()
{
  return MEMORY[0x24BE7B138]();
}

uint64_t PBRepeatedUInt32Clear()
{
  return MEMORY[0x24BE7B148]();
}

uint64_t PBRepeatedUInt32Copy()
{
  return MEMORY[0x24BE7B160]();
}

uint64_t PBRepeatedUInt32Hash()
{
  return MEMORY[0x24BE7B170]();
}

uint64_t PBRepeatedUInt32IsEqual()
{
  return MEMORY[0x24BE7B178]();
}

uint64_t PBRepeatedUInt32NSArray()
{
  return MEMORY[0x24BE7B190]();
}

uint64_t PBRepeatedUInt32Set()
{
  return MEMORY[0x24BE7B198]();
}

uint64_t PBRepeatedUInt64Add()
{
  return MEMORY[0x24BE7B1A8]();
}

uint64_t PBRepeatedUInt64Clear()
{
  return MEMORY[0x24BE7B1B0]();
}

uint64_t PBRepeatedUInt64Copy()
{
  return MEMORY[0x24BE7B1B8]();
}

uint64_t PBRepeatedUInt64Hash()
{
  return MEMORY[0x24BE7B1C0]();
}

uint64_t PBRepeatedUInt64IsEqual()
{
  return MEMORY[0x24BE7B1C8]();
}

uint64_t PBRepeatedUInt64NSArray()
{
  return MEMORY[0x24BE7B1D0]();
}

uint64_t PBRepeatedUInt64Set()
{
  return MEMORY[0x24BE7B1D8]();
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAE3F8](a1, a2);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

