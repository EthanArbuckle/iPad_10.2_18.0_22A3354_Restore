void sub_1A49F2708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

uint64_t ATXPBExecutableReferenceKeyReadFrom(uint64_t a1, uint64_t a2)
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
  void *v25;
  ATXPBAction *v26;

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
            goto LABEL_47;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_49;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_47:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_49:
        *(_DWORD *)(a1 + 48) = v19;
        goto LABEL_44;
      case 2u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *(void **)(a1 + 40);
        *(_QWORD *)(a1 + 40) = v24;

        goto LABEL_44;
      case 3u:
        v26 = objc_alloc_init(ATXPBAction);
        objc_storeStrong((id *)(a1 + 8), v26);
        if (!PBReaderPlaceMark() || (ATXPBActionReadFrom((uint64_t)v26, a2) & 1) == 0)
          goto LABEL_51;
        goto LABEL_43;
      case 4u:
        v26 = (ATXPBAction *)objc_alloc_init(MEMORY[0x1E0D2FC78]);
        objc_storeStrong((id *)(a1 + 16), v26);
        if (!PBReaderPlaceMark() || (ATXPBHeroAppPredictionReadFrom() & 1) == 0)
          goto LABEL_51;
        goto LABEL_43;
      case 5u:
        v26 = objc_alloc_init(ATXPBExecutableReferenceEntry);
        -[ATXPBExecutableReferenceKey addReferences:](a1, v26);
        if (!PBReaderPlaceMark() || (ATXPBExecutableReferenceEntryReadFrom((uint64_t)v26, a2) & 1) == 0)
          goto LABEL_51;
        goto LABEL_43;
      case 6u:
        v26 = (ATXPBAction *)objc_alloc_init(MEMORY[0x1E0D81188]);
        objc_storeStrong((id *)(a1 + 24), v26);
        if (!PBReaderPlaceMark() || (ATXPBInfoSuggestionReadFrom() & 1) == 0)
          goto LABEL_51;
        goto LABEL_43;
      case 7u:
        v26 = objc_alloc_init(ATXPBLinkAction);
        objc_storeStrong((id *)(a1 + 32), v26);
        if (PBReaderPlaceMark() && ATXPBLinkActionReadFrom((uint64_t)v26, a2))
        {
LABEL_43:
          PBReaderRecallMark();

LABEL_44:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_51:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_44;
    }
  }
}

uint64_t ATXPBExecutableReferenceEntryReadFrom(uint64_t a1, uint64_t a2)
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
  void *v23;
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
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  BOOL v45;
  uint64_t v46;

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
          *(_BYTE *)(a1 + 28) |= 1u;
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
          continue;
        case 2u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = *(void **)(a1 + 16);
          *(_QWORD *)(a1 + 16) = v22;

          continue;
        case 3u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 28) |= 2u;
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
                  v26 = 0;
                  goto LABEL_49;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v26 = 0;
LABEL_49:
          v45 = v26 != 0;
          v46 = 24;
          goto LABEL_58;
        case 4u:
          v31 = 0;
          v32 = 0;
          v33 = 0;
          *(_BYTE *)(a1 + 28) |= 4u;
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
              v33 |= (unint64_t)(v37 & 0x7F) << v31;
              if (v37 < 0)
              {
                v31 += 7;
                v15 = v32++ >= 9;
                if (v15)
                {
                  v33 = 0;
                  goto LABEL_53;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v33 = 0;
LABEL_53:
          v45 = v33 != 0;
          v46 = 25;
          goto LABEL_58;
        case 5u:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          *(_BYTE *)(a1 + 28) |= 8u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v41 = *v3;
        v42 = *(_QWORD *)(a2 + v41);
        v43 = v42 + 1;
        if (v42 == -1 || v43 > *(_QWORD *)(a2 + *v4))
          break;
        v44 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
        *(_QWORD *)(a2 + v41) = v43;
        v40 |= (unint64_t)(v44 & 0x7F) << v38;
        if ((v44 & 0x80) == 0)
          goto LABEL_55;
        v38 += 7;
        v15 = v39++ >= 9;
        if (v15)
        {
          v40 = 0;
          goto LABEL_57;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_55:
      if (*(_BYTE *)(a2 + *v5))
        v40 = 0;
LABEL_57:
      v45 = v40 != 0;
      v46 = 26;
LABEL_58:
      *(_BYTE *)(a1 + v46) = v45;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ATXPBActionReadFrom(uint64_t a1, uint64_t a2)
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
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  void *v41;
  ATXPBActionCriteria *v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;

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
        v19 = 40;
        goto LABEL_53;
      case 2u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 156) |= 1u;
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
                goto LABEL_72;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_72:
        v47 = 8;
        goto LABEL_81;
      case 3u:
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 80;
        goto LABEL_53;
      case 4u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 64;
        goto LABEL_53;
      case 5u:
        v28 = 0;
        v29 = 0;
        v30 = 0;
        *(_BYTE *)(a1 + 156) |= 8u;
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
                v30 = 0;
                goto LABEL_76;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v30 = 0;
LABEL_76:
        *(_BYTE *)(a1 + 152) = v30 != 0;
        goto LABEL_84;
      case 6u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 128;
        goto LABEL_53;
      case 7u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 120;
        goto LABEL_53;
      case 8u:
        v35 = 0;
        v36 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 156) |= 4u;
        while (2)
        {
          v37 = *v3;
          v38 = *(_QWORD *)(a2 + v37);
          v39 = v38 + 1;
          if (v38 == -1 || v39 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v38);
            *(_QWORD *)(a2 + v37) = v39;
            v23 |= (unint64_t)(v40 & 0x7F) << v35;
            if (v40 < 0)
            {
              v35 += 7;
              v15 = v36++ >= 9;
              if (v15)
              {
                v23 = 0;
                goto LABEL_80;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_80:
        v47 = 24;
LABEL_81:
        *(_QWORD *)(a1 + v47) = v23;
        goto LABEL_84;
      case 9u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 32;
        goto LABEL_53;
      case 0xAu:
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 136;
        goto LABEL_53;
      case 0xBu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 88;
        goto LABEL_53;
      case 0xCu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 144;
        goto LABEL_53;
      case 0xDu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 96;
        goto LABEL_53;
      case 0xEu:
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 48;
LABEL_53:
        v41 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_84;
      case 0xFu:
        v42 = objc_alloc_init(ATXPBActionCriteria);
        objc_storeStrong((id *)(a1 + 56), v42);
        if (!PBReaderPlaceMark() || (ATXPBActionCriteriaReadFrom((uint64_t)v42, a2) & 1) == 0)
          goto LABEL_86;
        goto LABEL_68;
      case 0x10u:
        v42 = objc_alloc_init(ATXPBAVRouteInfo);
        objc_storeStrong((id *)(a1 + 112), v42);
        if (!PBReaderPlaceMark() || (ATXPBAVRouteInfoReadFrom((uint64_t)v42, a2) & 1) == 0)
          goto LABEL_86;
        goto LABEL_68;
      case 0x11u:
        v42 = objc_alloc_init(ATXPBHeuristicMetadata);
        objc_msgSend((id)a1, "addHeuristicMetadata:", v42);
        if (!PBReaderPlaceMark() || !ATXPBHeuristicMetadataReadFrom((uint64_t)v42, a2))
          goto LABEL_86;
        goto LABEL_68;
      case 0x12u:
        *(_BYTE *)(a1 + 156) |= 2u;
        v43 = *v3;
        v44 = *(_QWORD *)(a2 + v43);
        if (v44 <= 0xFFFFFFFFFFFFFFF7 && (v45 = v44 + 8, v44 + 8 <= *(_QWORD *)(a2 + *v4)))
        {
          v46 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v44);
          *(_QWORD *)(a2 + v43) = v45;
        }
        else
        {
          v46 = 0;
          *(_BYTE *)(a2 + *v5) = 1;
        }
        *(_QWORD *)(a1 + 16) = v46;
        goto LABEL_84;
      case 0x13u:
        v42 = objc_alloc_init(ATXPBPredictableParameters);
        objc_msgSend((id)a1, "addPredictableParameterCombinations:", v42);
        if (PBReaderPlaceMark() && (ATXPBPredictableParametersReadFrom(v42, a2) & 1) != 0)
        {
LABEL_68:
          PBReaderRecallMark();

LABEL_84:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_86:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_84;
    }
  }
}

void sub_1A49F52CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __atxlog_handle_default()
{
  if (__atxlog_handle_default_onceToken != -1)
    dispatch_once(&__atxlog_handle_default_onceToken, &__block_literal_global_86);
  return (id)__atxlog_handle_default_log;
}

uint64_t ATXStackLocationForPBLocation(int a1)
{
  if ((a1 - 1) > 4)
    return 0;
  else
    return qword_1A4B67060[a1 - 1];
}

uint64_t ATXStackLayoutSizeForPBLayoutSize(int a1)
{
  uint64_t v1;

  v1 = (a1 - 2);
  if (v1 < 4)
    return v1 + 1;
  else
    return 0;
}

uint64_t ATXStackKindForPBKind(int a1)
{
  uint64_t v1;

  v1 = (a1 - 1);
  if (v1 < 7)
    return v1 + 1;
  else
    return 0;
}

id getTrialAssets()
{
  if (getTrialAssets_onceToken != -1)
    dispatch_once(&getTrialAssets_onceToken, &__block_literal_global_54_2);
  return (id)getTrialAssets_assets;
}

id getAsset()
{
  if (getAsset_onceToken != -1)
    dispatch_once(&getAsset_onceToken, &__block_literal_global_39_0);
  return (id)getAsset_asset;
}

id __atxlog_handle_app_library()
{
  if (__atxlog_handle_app_library_onceToken != -1)
    dispatch_once(&__atxlog_handle_app_library_onceToken, &__block_literal_global_52_0);
  return (id)__atxlog_handle_app_library_log;
}

uint64_t ATXPBStackLocationForLocation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
    return 0;
  else
    return dword_1A4B67048[a1 - 1];
}

uint64_t ATXPBStackLayoutSizeForLayoutSize(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 4)
    return 1;
  else
    return (a1 + 1);
}

uint64_t ATXPBStackKindForKind(uint64_t result)
{
  if ((unint64_t)(result - 1) < 7)
    return result;
  else
    return 0;
}

id __atxlog_handle_blending()
{
  if (__atxlog_handle_blending_onceToken != -1)
    dispatch_once(&__atxlog_handle_blending_onceToken, &__block_literal_global_34_0);
  return (id)__atxlog_handle_blending_log;
}

id __atxlog_handle_home_screen()
{
  if (__atxlog_handle_home_screen_onceToken != -1)
    dispatch_once(&__atxlog_handle_home_screen_onceToken, &__block_literal_global_40);
  return (id)__atxlog_handle_home_screen_log;
}

id allowedLeafIconClasses()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v0 = (void *)MEMORY[0x1A85A4F90]();
  v1 = objc_alloc(MEMORY[0x1E0C99E60]);
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = (void *)objc_msgSend(v1, "initWithObjects:", v2, v3, v4, v5, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v0);
  return v6;
}

void sub_1A49F8E60(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ATXPBExecutableReferenceCacheReadFrom(uint64_t a1, uint64_t a2)
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
  ATXPBExecutableReferenceKey *v17;
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
        v17 = objc_alloc_init(ATXPBExecutableReferenceKey);
        -[ATXPBExecutableReferenceCache addKeys:](a1, v17);
        if (!PBReaderPlaceMark() || (ATXPBExecutableReferenceKeyReadFrom((uint64_t)v17, a2) & 1) == 0)
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

void sub_1A49F9E90(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A49FA310(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id __atxlog_handle_feedback()
{
  if (__atxlog_handle_feedback_onceToken != -1)
    dispatch_once(&__atxlog_handle_feedback_onceToken, &__block_literal_global_14_2);
  return (id)__atxlog_handle_feedback_log;
}

void sub_1A49FAB2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A49FB1C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __atxlog_handle_ui()
{
  if (__atxlog_handle_ui_onceToken != -1)
    dispatch_once(&__atxlog_handle_ui_onceToken, &__block_literal_global_32_1);
  return (id)__atxlog_handle_ui_log;
}

id __atxlog_handle_metrics()
{
  if (__atxlog_handle_metrics_onceToken != -1)
    dispatch_once(&__atxlog_handle_metrics_onceToken, &__block_literal_global_58_0);
  return (id)__atxlog_handle_metrics_log;
}

void sub_1A49FEC54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ____atxlog_handle_ui_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "UI");
  v1 = (void *)__atxlog_handle_ui_log;
  __atxlog_handle_ui_log = (uint64_t)v0;

}

void ____atxlog_handle_metrics_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "metrics");
  v1 = (void *)__atxlog_handle_metrics_log;
  __atxlog_handle_metrics_log = (uint64_t)v0;

}

void ____atxlog_handle_default_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "general");
  v1 = (void *)__atxlog_handle_default_log;
  __atxlog_handle_default_log = (uint64_t)v0;

}

void ____atxlog_handle_blending_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "blending");
  v1 = (void *)__atxlog_handle_blending_log;
  __atxlog_handle_blending_log = (uint64_t)v0;

}

BOOL ATXPBUIEventReadFrom(uint64_t a1, uint64_t a2)
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
        v18 = 8;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadData();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 16;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ATXPBHomeScreenEventReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  ATXPBHomeScreenEventMetadata *v31;
  void *v32;
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
  uint64_t v49;
  unint64_t v50;
  char v51;
  uint64_t v52;

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
        *(_BYTE *)(a1 + 124) |= 1u;
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
        goto LABEL_87;
      case 2u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 32;
        goto LABEL_46;
      case 3u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 56;
        goto LABEL_46;
      case 4u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 24;
        goto LABEL_46;
      case 5u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 64;
        goto LABEL_46;
      case 6u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 88;
        goto LABEL_46;
      case 7u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 96;
        goto LABEL_46;
      case 8u:
        v24 = 0;
        v25 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + 124) |= 8u;
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
                goto LABEL_71;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v26) = 0;
LABEL_71:
        v52 = 104;
        goto LABEL_80;
      case 9u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 40;
        goto LABEL_46;
      case 0xAu:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 112;
        goto LABEL_46;
      case 0xBu:
        PBReaderReadString();
        v31 = (ATXPBHomeScreenEventMetadata *)objc_claimAutoreleasedReturnValue();
        if (v31)
          -[ATXPBHomeScreenEvent addSuggestionIds:](a1, v31);
        goto LABEL_44;
      case 0xCu:
        v31 = objc_alloc_init(ATXPBHomeScreenEventMetadata);
        objc_storeStrong((id *)(a1 + 48), v31);
        if (PBReaderPlaceMark() && (ATXPBHomeScreenEventMetadataReadFrom((uint64_t)v31, a2) & 1) != 0)
        {
          PBReaderRecallMark();
LABEL_44:

LABEL_87:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 0xDu:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 16;
LABEL_46:
        v32 = *(void **)(a1 + v23);
        *(_QWORD *)(a1 + v23) = v22;

        goto LABEL_87;
      case 0xEu:
        v33 = 0;
        v34 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + 124) |= 2u;
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
            v26 |= (unint64_t)(v38 & 0x7F) << v33;
            if (v38 < 0)
            {
              v33 += 7;
              v15 = v34++ >= 9;
              if (v15)
              {
                LODWORD(v26) = 0;
                goto LABEL_75;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v26) = 0;
LABEL_75:
        v52 = 72;
        goto LABEL_80;
      case 0xFu:
        v39 = 0;
        v40 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + 124) |= 4u;
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
            v26 |= (unint64_t)(v44 & 0x7F) << v39;
            if (v44 < 0)
            {
              v39 += 7;
              v15 = v40++ >= 9;
              if (v15)
              {
                LODWORD(v26) = 0;
                goto LABEL_79;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v26) = 0;
LABEL_79:
        v52 = 76;
LABEL_80:
        *(_DWORD *)(a1 + v52) = v26;
        goto LABEL_87;
      case 0x10u:
        v45 = 0;
        v46 = 0;
        v47 = 0;
        *(_BYTE *)(a1 + 124) |= 0x10u;
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
            v47 |= (unint64_t)(v51 & 0x7F) << v45;
            if (v51 < 0)
            {
              v45 += 7;
              v15 = v46++ >= 9;
              if (v15)
              {
                v47 = 0;
                goto LABEL_84;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v47 = 0;
LABEL_84:
        *(_BYTE *)(a1 + 120) = v47 != 0;
        goto LABEL_87;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_87;
    }
  }
}

uint64_t ATXPBHomeScreenEventMetadataReadFrom(uint64_t a1, uint64_t a2)
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
  ATXPBHomeScreenWidgetIdentifiable *v24;
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
  uint64_t v37;
  void *v38;
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
  BOOL v51;
  uint64_t v52;

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
        *(_BYTE *)(a1 + 76) |= 1u;
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
            goto LABEL_71;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_73;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_71:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_73:
        *(_QWORD *)(a1 + 8) = v19;
        goto LABEL_91;
      case 2u:
        PBReaderReadString();
        v24 = (ATXPBHomeScreenWidgetIdentifiable *)objc_claimAutoreleasedReturnValue();
        if (v24)
          -[ATXPBHomeScreenEventMetadata addStackIds:](a1, v24);
        goto LABEL_52;
      case 3u:
        v24 = objc_alloc_init(ATXPBHomeScreenWidgetIdentifiable);
        -[ATXPBHomeScreenEventMetadata addWidgetIdentifiables:](a1, v24);
        goto LABEL_32;
      case 4u:
        v24 = objc_alloc_init(ATXPBHomeScreenWidgetIdentifiable);
        -[ATXPBHomeScreenEventMetadata addWidgetInStackIdentifiables:](a1, v24);
LABEL_32:
        if (!PBReaderPlaceMark()
          || (ATXPBHomeScreenWidgetIdentifiableReadFrom((uint64_t)v24, a2) & 1) == 0)
        {
          goto LABEL_93;
        }
        goto LABEL_51;
      case 5u:
        v25 = 0;
        v26 = 0;
        v27 = 0;
        *(_BYTE *)(a1 + 76) |= 8u;
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
            v27 |= (unint64_t)(v30 & 0x7F) << v25;
            if (v30 < 0)
            {
              v25 += 7;
              v14 = v26++ >= 9;
              if (v14)
              {
                v27 = 0;
                goto LABEL_77;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v27 = 0;
LABEL_77:
        v51 = v27 != 0;
        v52 = 73;
        goto LABEL_86;
      case 6u:
        v31 = 0;
        v32 = 0;
        v33 = 0;
        *(_BYTE *)(a1 + 76) |= 0x10u;
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
            v33 |= (unint64_t)(v36 & 0x7F) << v31;
            if (v36 < 0)
            {
              v31 += 7;
              v14 = v32++ >= 9;
              if (v14)
              {
                v33 = 0;
                goto LABEL_81;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v33 = 0;
LABEL_81:
        v51 = v33 != 0;
        v52 = 74;
        goto LABEL_86;
      case 7u:
        v24 = objc_alloc_init(ATXPBCGRectWrapper);
        objc_storeStrong((id *)(a1 + 48), v24);
        if (PBReaderPlaceMark() && ATXPBCGRectWrapperReadFrom((uint64_t)v24, a2))
        {
LABEL_51:
          PBReaderRecallMark();
LABEL_52:

LABEL_91:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_93:

        return 0;
      case 8u:
        PBReaderReadString();
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = *(void **)(a1 + 24);
        *(_QWORD *)(a1 + 24) = v37;

        goto LABEL_91;
      case 9u:
        v39 = 0;
        v40 = 0;
        v41 = 0;
        *(_BYTE *)(a1 + 76) |= 4u;
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
            v41 |= (unint64_t)(v44 & 0x7F) << v39;
            if (v44 < 0)
            {
              v39 += 7;
              v14 = v40++ >= 9;
              if (v14)
              {
                v41 = 0;
                goto LABEL_85;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v41 = 0;
LABEL_85:
        v51 = v41 != 0;
        v52 = 72;
LABEL_86:
        *(_BYTE *)(a1 + v52) = v51;
        goto LABEL_91;
      case 0xAu:
        v45 = 0;
        v46 = 0;
        v47 = 0;
        *(_BYTE *)(a1 + 76) |= 2u;
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
            v47 |= (unint64_t)(v50 & 0x7F) << v45;
            if (v50 < 0)
            {
              v45 += 7;
              v14 = v46++ >= 9;
              if (v14)
              {
                LODWORD(v47) = 0;
                goto LABEL_90;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v47) = 0;
LABEL_90:
        *(_DWORD *)(a1 + 40) = v47;
        goto LABEL_91;
      case 0xBu:
        PBReaderReadString();
        v24 = (ATXPBHomeScreenWidgetIdentifiable *)objc_claimAutoreleasedReturnValue();
        if (v24)
          -[ATXPBHomeScreenEventMetadata addBundleIds:](a1, v24);
        goto LABEL_52;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_91;
    }
  }
}

void sub_1A4A00AA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4A00C80(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id ATXAVFoundationRoutingSessionManager()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAVRoutingSessionManagerClass_softClass;
  v7 = getAVRoutingSessionManagerClass_softClass;
  if (!getAVRoutingSessionManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAVRoutingSessionManagerClass_block_invoke;
    v3[3] = &unk_1E4D570B8;
    v3[4] = &v4;
    __getAVRoutingSessionManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A4A02D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ATXAVFoundationOutputDevice()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAVOutputDeviceClass_softClass;
  v7 = getAVOutputDeviceClass_softClass;
  if (!getAVOutputDeviceClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAVOutputDeviceClass_block_invoke;
    v3[3] = &unk_1E4D570B8;
    v3[4] = &v4;
    __getAVOutputDeviceClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A4A02E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAVRoutingSessionManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  AVFoundationLibrary();
  result = objc_getClass("AVRoutingSessionManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAVRoutingSessionManagerClass_block_invoke_cold_1();
  getAVRoutingSessionManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void AVFoundationLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!AVFoundationLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_1E4D570D8;
    v2 = 0;
    AVFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AVFoundationLibraryCore_frameworkLibrary)
    AVFoundationLibrary_cold_1(&v0);
}

Class __getAVOutputDeviceClass_block_invoke(uint64_t a1)
{
  Class result;

  AVFoundationLibrary();
  result = objc_getClass("AVOutputDevice");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAVOutputDeviceClass_block_invoke_cold_1();
  getAVOutputDeviceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ATXPBActivitySuggestionFeedbackEventReadFrom(uint64_t a1, uint64_t a2)
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
  unint64_t v33;
  char v34;
  ATXPBActivity *v35;
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
        *(_BYTE *)(a1 + 44) |= 1u;
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
        goto LABEL_66;
      case 2u:
        v22 = 0;
        v23 = 0;
        v24 = 0;
        *(_BYTE *)(a1 + 44) |= 2u;
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
                goto LABEL_54;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v24) = 0;
LABEL_54:
        v42 = 24;
        goto LABEL_63;
      case 3u:
        v29 = 0;
        v30 = 0;
        v24 = 0;
        *(_BYTE *)(a1 + 44) |= 8u;
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
            v24 |= (unint64_t)(v34 & 0x7F) << v29;
            if (v34 < 0)
            {
              v29 += 7;
              v15 = v30++ >= 9;
              if (v15)
              {
                LODWORD(v24) = 0;
                goto LABEL_58;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v24) = 0;
LABEL_58:
        v42 = 40;
        goto LABEL_63;
      case 4u:
        v35 = objc_alloc_init(ATXPBActivity);
        objc_storeStrong((id *)(a1 + 16), v35);
        if (PBReaderPlaceMark() && (ATXPBActivityReadFrom((uint64_t)v35, a2) & 1) != 0)
        {
          PBReaderRecallMark();
LABEL_43:

LABEL_66:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 5u:
        PBReaderReadData();
        v35 = (ATXPBActivity *)objc_claimAutoreleasedReturnValue();
        if (v35)
          -[ATXPBActivitySuggestionFeedbackEvent addSerializedAcceptedTriggers:](a1, v35);
        goto LABEL_43;
      case 6u:
        v36 = 0;
        v37 = 0;
        v24 = 0;
        *(_BYTE *)(a1 + 44) |= 4u;
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
            v24 |= (unint64_t)(v41 & 0x7F) << v36;
            if (v41 < 0)
            {
              v36 += 7;
              v15 = v37++ >= 9;
              if (v15)
              {
                LODWORD(v24) = 0;
                goto LABEL_62;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v24) = 0;
LABEL_62:
        v42 = 28;
LABEL_63:
        *(_DWORD *)(a1 + v42) = v24;
        goto LABEL_66;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_66;
    }
  }
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t ATXPBDigestOnboardingAppSelectionLoggingEventReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t result;
  char v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  char v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  uint64_t v54;
  BOOL v55;
  uint64_t v56;

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
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
          goto LABEL_21;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
LABEL_21:
          v19 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        case 3u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 52) |= 1u;
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
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_69:
          v54 = 8;
          goto LABEL_82;
        case 4u:
          v26 = 0;
          v27 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 52) |= 2u;
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
                  goto LABEL_73;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_73:
          v54 = 12;
          goto LABEL_82;
        case 5u:
          v31 = 0;
          v32 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 52) |= 4u;
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
                  goto LABEL_77;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_77:
          v54 = 16;
          goto LABEL_82;
        case 6u:
          v36 = 0;
          v37 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 52) |= 8u;
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
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_81:
          v54 = 32;
LABEL_82:
          *(_DWORD *)(a1 + v54) = v22;
          continue;
        case 8u:
          v42 = 0;
          v43 = 0;
          v44 = 0;
          *(_BYTE *)(a1 + 52) |= 0x10u;
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
                  goto LABEL_86;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v44 = 0;
LABEL_86:
          v55 = v44 != 0;
          v56 = 48;
          goto LABEL_91;
        case 9u:
          v48 = 0;
          v49 = 0;
          v50 = 0;
          *(_BYTE *)(a1 + 52) |= 0x20u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v51 = *v3;
        v52 = *(_QWORD *)(a2 + v51);
        if (v52 == -1 || v52 >= *(_QWORD *)(a2 + *v4))
          break;
        v53 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v52);
        *(_QWORD *)(a2 + v51) = v52 + 1;
        v50 |= (unint64_t)(v53 & 0x7F) << v48;
        if ((v53 & 0x80) == 0)
          goto LABEL_88;
        v48 += 7;
        v14 = v49++ >= 9;
        if (v14)
        {
          v50 = 0;
          goto LABEL_90;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_88:
      if (*(_BYTE *)(a2 + *v5))
        v50 = 0;
LABEL_90:
      v55 = v50 != 0;
      v56 = 49;
LABEL_91:
      *(_BYTE *)(a1 + v56) = v55;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t ATXPBPredictableParametersReadFrom(void *a1, uint64_t a2)
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
          objc_msgSend(a1, "addParameterKeys:", v17);

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

void *allModes()
{
  return &unk_1E4DC2738;
}

void *allModesForTraining()
{
  return &unk_1E4DC2750;
}

void *allModesForModeSetupPrediction()
{
  return &unk_1E4DC2768;
}

const __CFString *ATXModeToString(unint64_t a1)
{
  if (a1 > 0xF)
    return CFSTR("Unknown");
  else
    return off_1E4D572A0[a1];
}

uint64_t ATXStringToMode(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Default")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Home")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Working")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Exercising")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Driving")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Bedtime")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Gaming")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Reading")) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("FirstDigest")) & 1) != 0)
  {
    v2 = 8;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("LastDigest")) & 1) != 0)
  {
    v2 = 9;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("OtherDigest")) & 1) != 0)
  {
    v2 = 10;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UnspecifiedDigest")) & 1) != 0)
  {
    v2 = 11;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Custom")) & 1) != 0)
  {
    v2 = 12;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("DND")) & 1) != 0)
  {
    v2 = 13;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Mindfulness")) & 1) != 0)
  {
    v2 = 14;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("ReduceInterruptions")))
  {
    v2 = 15;
  }
  else
  {
    v2 = 16;
  }

  return v2;
}

uint64_t ATXModeFromActivityType(unint64_t a1)
{
  if (a1 > 0x11)
    return 0;
  else
    return qword_1A4B668A0[a1];
}

uint64_t ATXActivityTypeFromMode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xE)
    return 14;
  else
    return qword_1A4B66930[a1 - 1];
}

const __CFString *ATXAppDirectoryCategoryToStringForITunesGenreID(uint64_t a1)
{
  if ((unint64_t)(a1 - 6000) > 0x1B)
    return CFSTR("Unknown");
  else
    return off_1E4D57388[a1 - 6000];
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

id ATXAppDirectoryInterface()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE78E8B8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v2 = objc_opt_class();
  objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_categoriesWithReply_, 0, 1);

  return v0;
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return objc_opt_class();
}

void sub_1A4A0F2B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4A10830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A4A11244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4A1176C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

uint64_t ATXMPBFeedbackUserInteractionsTrackerReadFrom(uint64_t a1, uint64_t a2)
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

__CFString *ATXDigestOnboardingEntrySourceToString(uint64_t a1)
{
  if (a1 < 3)
    return off_1E4D57768[(int)a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *ATXDigestOnboardingOutcomeToString(uint64_t a1)
{
  if (a1 < 4)
    return off_1E4D57780[(int)a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *ATXDigestOnboardingFinalUIShownToString(uint64_t a1)
{
  if (a1 < 4)
    return off_1E4D577A0[(int)a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_1A4A14B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

id loadLazyOrRegularPlist(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v13;
  id v14;
  id v15;

  v1 = a1;
  v2 = (void *)MEMORY[0x1A85A4F90]();
  v15 = 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v1, 1, &v15);
  v4 = v15;
  if (!v3)
  {
    __atxlog_handle_trial_assets();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      loadLazyOrRegularPlist_cold_1();
    v8 = 0;
    goto LABEL_15;
  }
  if ((unint64_t)objc_msgSend(v3, "length") >= 3
    && ((v5 = objc_retainAutorelease(v3), v6 = objc_msgSend(v5, "bytes"), *(_WORD *)v6 == 19536)
      ? (v7 = *(_BYTE *)(v6 + 2) == 80)
      : (v7 = 0),
        v7))
  {
    v14 = v4;
    objc_msgSend(MEMORY[0x1E0D815D0], "dictionaryWithData:error:", v5, &v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v14;
  }
  else
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 0, 0, &v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v13;
  }
  v10 = v9;

  if (!v8)
  {
    __atxlog_handle_trial_assets();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      loadLazyOrRegularPlist_cold_2();
    v4 = v10;
LABEL_15:

    v10 = v4;
  }

  objc_autoreleasePoolPop(v2);
  return v8;
}

void sub_1A4A14FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4A15184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1A4A15CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1A4A15E64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4A15FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4A16154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ATXUnarchiverZip(NSURL *a1, NSURL *a2)
{
  NSURL *v3;
  NSURL *v4;
  NSURL *v5;
  uint64_t v6;
  NSURL *v7;
  int v8;
  int v9;
  NSObject *v10;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = 0;
  if (!v3 || !v4)
    goto LABEL_14;
  if (!-[NSURL isFileURL](v3, "isFileURL"))
  {
    __atxlog_handle_default();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      ATXUnarchiverZip();
    goto LABEL_12;
  }
  v7 = objc_retainAutorelease(v3);
  v8 = open(-[NSURL fileSystemRepresentation](v7, "fileSystemRepresentation"), 4);
  if (v8 < 0)
  {
    __atxlog_handle_default();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      ATXUnarchiverZip((uint64_t)v7, v10);
LABEL_12:
    v6 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v9 = v8;
  v6 = ATXUnarchiverZip(v8, v5);
  if (close(v9))
  {
    __atxlog_handle_default();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      ATXUnarchiverZip((uint64_t)v7, v9, v10);
    goto LABEL_13;
  }
LABEL_14:

  return v6;
}

uint64_t ATXUnarchiverZip(int a1, NSURL *a2)
{
  NSURL *v3;
  NSURL *v4;
  uint64_t v5;
  uint64_t Archive;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 < 0 || !v3)
    goto LABEL_17;
  Archive = PPCreateReadArchive();
  if (!Archive)
  {
    v5 = 0;
    goto LABEL_17;
  }
  v7 = Archive;
  NSPageSize();
  if (archive_read_open_fd())
  {
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      ATXUnarchiverZip();
    v5 = 0;
  }
  else
  {
    v5 = PPZipUnarchive(v7, v4);
    if (!archive_read_close())
      goto LABEL_13;
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      ATXUnarchiverZip();
  }

LABEL_13:
  if (archive_read_free())
  {
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      ATXUnarchiverZip();

  }
LABEL_17:

  return v5;
}

uint64_t ATXUnarchiverZip(NSData *a1, NSURL *a2)
{
  NSData *v3;
  NSURL *v4;
  NSData *v5;
  const void *v6;
  unint64_t v7;
  uint64_t v8;

  if (!a1 || !a2)
    return 0;
  v3 = objc_retainAutorelease(a1);
  v4 = a2;
  v5 = v3;
  v6 = -[NSData bytes](v5, "bytes");
  v7 = -[NSData length](v5, "length");

  v8 = ATXUnarchiverZip(v6, v7, v4);
  return v8;
}

uint64_t ATXUnarchiverZip(const void *a1, unint64_t a2, NSURL *a3)
{
  NSURL *v4;
  NSURL *v5;
  uint64_t v6;
  uint64_t Archive;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;

  v4 = a3;
  v5 = v4;
  v6 = 0;
  if (!a1 || !v4)
    goto LABEL_17;
  Archive = PPCreateReadArchive();
  if (!Archive)
  {
    v6 = 0;
    goto LABEL_17;
  }
  v8 = Archive;
  if (archive_read_open_memory())
  {
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      ATXUnarchiverZip();
    v6 = 0;
  }
  else
  {
    v6 = PPZipUnarchive(v8, v5);
    if (!archive_read_close())
      goto LABEL_13;
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      ATXUnarchiverZip();
  }

LABEL_13:
  if (archive_read_free())
  {
    __atxlog_handle_default();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      ATXUnarchiverZip();

  }
LABEL_17:

  return v6;
}

uint64_t PPCreateReadArchive()
{
  uint64_t v0;
  NSObject *v1;
  NSObject *v2;
  int support_filter_all;
  int v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = archive_read_new();
  if (!v0)
    return v0;
  if (archive_read_support_format_zip())
  {
    __atxlog_handle_default();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136446210;
      v8 = archive_error_string();
      _os_log_impl(&dword_1A49EF000, v1, OS_LOG_TYPE_DEFAULT, "ATXUnarchiver: archive_read unable to set supported formats - %{public}s.", (uint8_t *)&v7, 0xCu);
    }

LABEL_6:
    if (archive_read_free())
    {
      __atxlog_handle_default();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        PPCreateReadArchive_cold_1();

    }
    return 0;
  }
  support_filter_all = archive_read_support_filter_all();
  if (support_filter_all != -20)
  {
    v5 = support_filter_all;
    if (support_filter_all)
    {
      __atxlog_handle_default();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        PPCreateReadArchive_cold_2();

      if (v5)
        goto LABEL_6;
    }
  }
  return v0;
}

uint64_t PPZipUnarchive(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v13;
  __int128 v14;
  char *v15;
  char *v16;
  uint64_t v17;
  NSObject *v18;
  int next_header;
  int v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  int data_block;
  size_t v33;
  NSObject *v34;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  NSObject *v56;
  uint64_t v58;
  __int128 v59;
  id v60[3];
  _BYTE buf[12];
  __int16 v62;
  size_t v63;
  uint64_t v64;
  _QWORD v65[2];

  v65[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = *MEMORY[0x1E0CB2AA8];
  v65[0] = &unk_1E4DC13E0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, &v64, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = 0;
  v5 = objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v2, 0, v4, v60);
  v6 = v60[0];

  if ((v5 & 1) == 0)
  {
    -[NSObject domain](v6, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      v8 = -[NSObject code](v6, "code");

      if (v8 == 516)
        goto LABEL_4;
    }
    else
    {

    }
    __atxlog_handle_default();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      PPZipUnarchive_cold_12();

    goto LABEL_18;
  }
LABEL_4:

  if (!archive_write_disk_new())
    goto LABEL_20;
  if (archive_write_disk_set_standard_lookup())
  {
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      PPZipUnarchive_cold_11();
  }
  else
  {
    if (!archive_write_disk_set_options())
    {
      objc_msgSend(v2, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v6 = objc_retainAutorelease(v13);
        v15 = realpath_DARWIN_EXTSN((const char *)-[NSObject fileSystemRepresentation](v6, "fileSystemRepresentation"), 0);
        if (v15)
        {
          v16 = v15;
          v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v15);

          free(v16);
          v6 = v17;
        }
        else
        {
          __atxlog_handle_default();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            PPZipUnarchive_cold_8((uint64_t)v6, v18);

        }
      }
      else
      {
        v6 = 0;
      }
      *(_QWORD *)&v14 = 134218240;
      v59 = v14;
      while (1)
      {
        next_header = archive_read_next_header();
        if (next_header)
          break;
        v20 = archive_entry_filetype();
        v21 = (void *)MEMORY[0x1A85A4F90]();
        v22 = archive_entry_pathname_utf8();
        if (!v22)
        {
          __atxlog_handle_default();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            PPZipUnarchive_cold_4(v38, v39, v40, v41, v42, v43, v44, v45);

LABEL_74:
          objc_autoreleasePoolPop(v21);
          goto LABEL_55;
        }
        v23 = (const char *)v22;
        v24 = 0;
        do
          v25 = *(unsigned __int8 *)(v22 + v24++);
        while (v25 == 47);
        v26 = v24 - 1;
        if (v24 != 1)
        {
          __atxlog_handle_default();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v33 = strlen(v23);
            *(_DWORD *)buf = v59;
            *(_QWORD *)&buf[4] = v26;
            v62 = 2048;
            v63 = v33;
            _os_log_error_impl(&dword_1A49EF000, v27, OS_LOG_TYPE_ERROR, "ATXUnarchiver: archive_entry with absolute path encountered...ignoring leading %zu of %zu bytes.", buf, 0x16u);
          }

        }
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", &v23[v26]);
        v29 = objc_msgSend(v28, "length");
        if (!v29 && v20 != 0x4000)
        {
          __atxlog_handle_default();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            PPZipUnarchive_cold_7(v46, v47, v48, v49, v50, v51, v52, v53);

          goto LABEL_74;
        }
        -[NSObject stringByAppendingPathComponent:](v6, "stringByAppendingPathComponent:", v28, v59, 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = objc_retainAutorelease(v30);
        objc_msgSend(v31, "fileSystemRepresentation");
        archive_entry_update_pathname_utf8();

        objc_autoreleasePoolPop(v21);
        archive_entry_perm();
        archive_entry_set_perm();
        if (v29)
        {
          if (archive_write_header())
          {
            __atxlog_handle_default();
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              v54 = archive_error_string();
              *(_DWORD *)buf = 136446210;
              *(_QWORD *)&buf[4] = v54;
              v55 = "ATXUnarchiver: archive_write_header failed - %{public}s.";
              goto LABEL_79;
            }
LABEL_80:

            goto LABEL_55;
          }
          if (!archive_entry_size_is_set() || archive_entry_size() >= 1)
          {
            while (1)
            {
              v60[2] = 0;
              *(_QWORD *)buf = 0;
              v60[1] = 0;
              data_block = archive_read_data_block();
              if (data_block)
                break;
              if (archive_write_data_block() < 0)
              {
                __atxlog_handle_default();
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                  PPZipUnarchive_cold_6();
                goto LABEL_54;
              }
            }
            if (data_block == 1)
              goto LABEL_48;
            __atxlog_handle_default();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              PPZipUnarchive_cold_5();
LABEL_54:

LABEL_55:
            v11 = 0;
            goto LABEL_56;
          }
LABEL_48:
          if (archive_write_finish_entry())
          {
            __atxlog_handle_default();
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              v58 = archive_error_string();
              *(_DWORD *)buf = 136446210;
              *(_QWORD *)&buf[4] = v58;
              v55 = "ATXUnarchiver: archive_write_finish_entry failed - %{public}s.";
LABEL_79:
              _os_log_impl(&dword_1A49EF000, v56, OS_LOG_TYPE_DEFAULT, v55, buf, 0xCu);
            }
            goto LABEL_80;
          }
        }
      }
      if (next_header != 1)
      {
        __atxlog_handle_default();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          PPZipUnarchive_cold_3();
        goto LABEL_54;
      }
      v11 = 1;
LABEL_56:
      if (archive_write_close())
      {
        __atxlog_handle_default();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          PPZipUnarchive_cold_2();

        v11 = 0;
      }
      if (archive_write_free())
      {
        __atxlog_handle_default();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          PPZipUnarchive_cold_1();

      }
      goto LABEL_19;
    }
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      PPZipUnarchive_cold_10();
  }

  if (!archive_write_free())
  {
LABEL_20:
    v11 = 0;
    goto LABEL_21;
  }
  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    PPZipUnarchive_cold_1();
LABEL_18:
  v11 = 0;
LABEL_19:

LABEL_21:
  return v11;
}

void OUTLINED_FUNCTION_0_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return archive_error_string();
}

char *OUTLINED_FUNCTION_7(int *a1)
{
  return strerror(*a1);
}

void sub_1A4A17B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4A17DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4A1813C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4A18D0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_4(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)a1 + 32);
}

id ATXLockScreenNotificationRankerXPCInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE78D190);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_rankNotificationArrays_reply_, 0, 0);

  v4 = (void *)MEMORY[0x1E0C99E60];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_rankNotificationArrays_reply_, 0, 1);

  v7 = (void *)MEMORY[0x1E0C99E60];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_rankNewNotificationIntoNotificationArrays_newNotification_notificationArrayIndex_reply_, 0, 0);

  v10 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_rankNewNotificationIntoNotificationArrays_newNotification_notificationArrayIndex_reply_, 1, 0);

  return v0;
}

void sub_1A4A1A2F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return objc_opt_class();
}

id OUTLINED_FUNCTION_4_0(void *a1)
{
  return a1;
}

uint64_t ATXPBNotificationSuggestionInteractionEventReadFrom(uint64_t a1, uint64_t a2)
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
  unint64_t v30;
  char v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
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
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 32) |= 4u;
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
              goto LABEL_40;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              LODWORD(v20) = 0;
              goto LABEL_42;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_40:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_42:
          v37 = 20;
          goto LABEL_47;
        case 2u:
          v26 = 0;
          v27 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 32) |= 2u;
          break;
        case 3u:
          PBReaderReadString();
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = *(void **)(a1 + 24);
          *(_QWORD *)(a1 + 24) = v32;

          continue;
        case 4u:
          *(_BYTE *)(a1 + 32) |= 1u;
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
          *(_QWORD *)(a1 + 8) = v36;
          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v28 = *v3;
        v29 = *(_QWORD *)(a2 + v28);
        v30 = v29 + 1;
        if (v29 == -1 || v30 > *(_QWORD *)(a2 + *v4))
          break;
        v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
        *(_QWORD *)(a2 + v28) = v30;
        v20 |= (unint64_t)(v31 & 0x7F) << v26;
        if ((v31 & 0x80) == 0)
          goto LABEL_44;
        v26 += 7;
        v15 = v27++ >= 9;
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
      v37 = 16;
LABEL_47:
      *(_DWORD *)(a1 + v37) = v20;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL ATXPBTurnOffNotificationsForAppSuggestionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  int v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v15;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  v6 = (int *)MEMORY[0x1E0D82BB8];
  while (1)
  {
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
      return v7 == 0;
    if (*(_BYTE *)(a2 + *v5))
    {
      v7 = 1;
      return v7 == 0;
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      LOBYTE(v10) = 0;
LABEL_14:
    if (v7)
      v15 = 1;
    else
      v15 = (v10 & 7) == 4;
    if (v15)
      return v7 == 0;
    if ((PBReaderSkipValueWithTag() & 1) == 0)
      return 0;
  }
}

id actionsToIndexSet(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(v4, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v5, "addIndex:", v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

void sub_1A4A1DCE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4A1DFFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *NSStringForATXWidgetEngagementType(unint64_t a1)
{
  int v1;
  NSObject *v3;

  v1 = a1;
  if (a1 < 4)
    return off_1E4D57CD8[a1];
  __atxlog_handle_home_screen();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    NSStringForATXWidgetEngagementType_cold_1(v1, v3);

  return CFSTR("unknown");
}

uint64_t ATXMPBFeedbackRecordedTrackerReadFrom(uint64_t a1, uint64_t a2)
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

BOOL ATXPBLinkActionReadFrom(uint64_t a1, uint64_t a2)
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
        v18 = 16;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadData();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 8;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void OUTLINED_FUNCTION_4_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id OUTLINED_FUNCTION_0_9(id a1)
{
  return a1;
}

uint64_t ATXActionPredictionInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE78B228);
}

id ATXUserEducationSuggestionClientXPCInterface()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7B5EF0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_didReceiveUserEducationSuggestionEvent_, 0, 0);

  return v0;
}

id ATXUserEducationSuggestionServerXPCInterface()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7C7950);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_logUserEducationSuggestionFeedback_, 0, 0);

  return v0;
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_10(uint64_t a1)
{
  return *(_QWORD *)(a1 + 48);
}

uint64_t ATXPBERMEventReadFrom(uint64_t a1, uint64_t a2)
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
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
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
  void *v45;
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
          *(_BYTE *)(a1 + 60) |= 4u;
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
          v48 = 24;
          goto LABEL_69;
        case 2u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          *(_BYTE *)(a1 + 60) |= 8u;
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
                  goto LABEL_55;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v24) = 0;
LABEL_55:
          v47 = 40;
          goto LABEL_64;
        case 3u:
          *(_BYTE *)(a1 + 60) |= 1u;
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
          v48 = 8;
LABEL_69:
          *(_QWORD *)(a1 + v48) = v20;
          continue;
        case 4u:
          v31 = 0;
          v32 = 0;
          v33 = 0;
          *(_BYTE *)(a1 + 60) |= 2u;
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
              v33 |= (unint64_t)(v37 & 0x7F) << v31;
              if (v37 < 0)
              {
                v31 += 7;
                v15 = v32++ >= 9;
                if (v15)
                {
                  v33 = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v33 = 0;
LABEL_59:
          *(_QWORD *)(a1 + 16) = v33;
          continue;
        case 5u:
          v38 = 0;
          v39 = 0;
          v24 = 0;
          *(_BYTE *)(a1 + 60) |= 0x10u;
          break;
        case 6u:
          PBReaderReadData();
          v44 = objc_claimAutoreleasedReturnValue();
          v45 = *(void **)(a1 + 48);
          *(_QWORD *)(a1 + 48) = v44;

          continue;
        case 7u:
          PBReaderReadString();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          if (v46)
            -[ATXPBERMEvent addClientModelId:](a1, v46);

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
        v24 |= (unint64_t)(v43 & 0x7F) << v38;
        if ((v43 & 0x80) == 0)
          goto LABEL_61;
        v38 += 7;
        v15 = v39++ >= 9;
        if (v15)
        {
          LODWORD(v24) = 0;
          goto LABEL_63;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_61:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v24) = 0;
LABEL_63:
      v47 = 56;
LABEL_64:
      *(_DWORD *)(a1 + v47) = v24;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1A4A2C534(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
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

void sub_1A4A2C82C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1A4A2D990(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *plistableReplacementFor(void *a1)
{
  id v1;
  id v2;
  __CFString *v3;
  __CFString *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if (v2 == v1)
  {
    v4 = &stru_1E4D60EF0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v1, "UUIDString");
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v1, "absoluteString");
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = 0u;
          v15 = 0u;
          v12 = 0u;
          v13 = 0u;
          v5 = v1;
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v6)
          {
            v7 = v6;
            v8 = 0;
            v9 = *(_QWORD *)v13;
            do
            {
              for (i = 0; i != v7; ++i)
              {
                if (*(_QWORD *)v13 != v9)
                  objc_enumerationMutation(v5);
                v8 += objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hash", (_QWORD)v12);
              }
              v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
            }
            while (v7);
          }
          else
          {
            v8 = 0;
          }

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
          v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v3 = (__CFString *)v1;
        }
      }
    }
    v4 = v3;
  }

  return v4;
}

void reportInvalidActionTypeAndCrash(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void reportInvalidActionTypeAndCrash(ATXActionType)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("ATXAction.m"), 910, CFSTR("Invalid action type for action found: %lu (max: %lu)"), a1, 6);

  __break(1u);
}

void sub_1A4A2FCF8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _decodeOrFail(void *a1, uint64_t a2, void *a3, int a4, _BYTE *a5)
{
  id v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  id v18;

  v9 = a3;
  v18 = 0;
  objc_msgSend(a1, "decodeTopLevelObjectOfClass:forKey:error:", a2, v9, &v18);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (unint64_t)v18;
  v12 = (void *)v11;
  if (!v10 && v11)
  {
    if ((a4 & 1) != 0)
      goto LABEL_14;
    objc_msgSend((id)v11, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isEqual:", *MEMORY[0x1E0CB28A8]) & 1) == 0)
    {

      goto LABEL_14;
    }
    v14 = objc_msgSend(v12, "code");

    if (v14 != 4865)
    {
LABEL_14:
      __atxlog_handle_default();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        _decodeOrFail_cold_1();
LABEL_16:

      v15 = 0;
      *a5 = 1;
      goto LABEL_17;
    }
    goto LABEL_12;
  }
  if (!(v10 | v11))
  {
    if (a4)
    {
      __atxlog_handle_default();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        _decodeOrFail_cold_2();
      goto LABEL_16;
    }
LABEL_12:
    v15 = 0;
    goto LABEL_17;
  }
  v15 = (id)v10;
LABEL_17:

  return v15;
}

uint64_t __sortArrayOfData_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  v8 = objc_msgSend(v6, "length");
  if (v8 >= objc_msgSend(v7, "length"))
  {
    v10 = objc_msgSend(v6, "length");
    if (v10 <= objc_msgSend(v7, "length"))
    {
      v11 = objc_retainAutorelease(v6);
      v9 = memcmp((const void *)objc_msgSend(v11, "bytes"), (const void *)objc_msgSend(objc_retainAutorelease(v7), "bytes"), objc_msgSend(v11, "length"));
    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

void OUTLINED_FUNCTION_0_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void __folderIndexesForPage_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  char isKindOfClass;

  v5 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
}

void OUTLINED_FUNCTION_0_11(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_12(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
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

uint64_t ATXPBInfoEngineCachedSuggestionsReadFrom(uint64_t a1, uint64_t a2)
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
        PBReaderReadString();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
          -[ATXPBInfoEngineCachedSuggestions addCachedSuggestionSourceIds:](a1, v24);
      }
      else
      {
        if ((_DWORD)v17 != 2)
        {
          if ((_DWORD)v17 == 1)
          {
            v18 = 0;
            v19 = 0;
            v20 = 0;
            *(_BYTE *)(a1 + 32) |= 1u;
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
                goto LABEL_36;
              v18 += 7;
              v14 = v19++ >= 9;
              if (v14)
              {
                v20 = 0;
                goto LABEL_38;
              }
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_36:
            if (*(_BYTE *)(a2 + *v5))
              v20 = 0;
LABEL_38:
            *(_QWORD *)(a1 + 8) = v20;
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
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
          -[ATXPBInfoEngineCachedSuggestions addCachedSuggestionIds:](a1, v24);
      }

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1A4A3B87C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
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

void OUTLINED_FUNCTION_0_13(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

id ATXSuggestedPagesInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE78DCB8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_suggestedPagesWithFilter_layoutOptions_completionHandler_, 0, 1);

  v4 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_suggestedPagesWithFilter_layoutOptions_completionHandler_, 0, 0);

  v7 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_suggestedPagesWithFilter_layoutOptions_completionHandler_, 1, 0);

  return v0;
}

id ATXHomeScreenSuggestionServerXPCInterface()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7A0ED8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_blendingLayerDidUpdateHomeScreenCachedSuggestions_completion_, 0, 0);

  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = (void *)objc_msgSend(v2, "initWithObjects:", v3, v4, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_getCurrentSuggestionsWidgetAndAppPredictionPanelLayoutsWithCompletionHandler_, 0, 1);

  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_getCurrentSuggestionsWidgetAndAppPredictionPanelLayoutsWithCompletionHandler_, 1, 1);

  return v0;
}

id ATXHomeScreenSuggestionClientXPCInterface()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7C7A10);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v1, sel_logWidgetAddedFeaturesInCoreAnalytics_rankOfWidgetInGallery_galleryItems_, 0, 0);

  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = (void *)objc_msgSend(v2, "initWithObjects:", v3, v4, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_logWidgetAddedFeaturesInCoreAnalytics_rankOfWidgetInGallery_galleryItems_, 2, 0);

  return v0;
}

const __CFString *NSStringForATXHomeScreenWidgetExplicitFeedback(unint64_t a1)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 < 4)
    return off_1E4D58940[a1];
  __atxlog_handle_home_screen();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    NSStringForATXHomeScreenWidgetExplicitFeedback_cold_1(a1, v3, v4, v5, v6, v7, v8, v9);

  return CFSTR("unknown");
}

const __CFString *NSStringForATXHomeScreenStackChangeReason(unint64_t a1)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 < 0xA)
    return off_1E4D58960[a1];
  __atxlog_handle_home_screen();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    NSStringForATXHomeScreenStackChangeReason_cold_1(a1, v3, v4, v5, v6, v7, v8, v9);

  return CFSTR("unknown");
}

void sub_1A4A3F818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id allowedFeatureVectorClasses()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v0 = (void *)MEMORY[0x1A85A4F90]();
  v1 = objc_alloc(MEMORY[0x1E0C99E60]);
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = (void *)objc_msgSend(v1, "initWithObjects:", v2, v3, v4, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v0);
  return v5;
}

id OUTLINED_FUNCTION_2_7(id a1)
{
  return a1;
}

void sub_1A4A40964(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4A40A9C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4A40B78(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ATXPBModeConfigurationUIFlowLoggingEventReadFrom(uint64_t a1, uint64_t a2)
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
  void *v23;
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
  void *v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  uint64_t v44;

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
          *(_BYTE *)(a1 + 72) |= 1u;
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
          continue;
        case 2u:
          PBReaderReadString();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = *(void **)(a1 + 32);
          *(_QWORD *)(a1 + 32) = v22;

          continue;
        case 3u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 72) |= 8u;
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
                  goto LABEL_58;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v26) = 0;
LABEL_58:
          v44 = 48;
          goto LABEL_67;
        case 4u:
          v31 = 0;
          v32 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 72) |= 2u;
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
              v26 |= (unint64_t)(v36 & 0x7F) << v31;
              if (v36 < 0)
              {
                v31 += 7;
                v15 = v32++ >= 9;
                if (v15)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_62;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v26) = 0;
LABEL_62:
          v44 = 40;
          goto LABEL_67;
        case 5u:
          PBReaderReadString();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
            objc_msgSend((id)a1, "addPreviousEntityIdentifiers:", v37);
          goto LABEL_54;
        case 6u:
          PBReaderReadString();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
            objc_msgSend((id)a1, "addSuggestedEntityIdentifiers:", v37);
          goto LABEL_54;
        case 7u:
          PBReaderReadString();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
            objc_msgSend((id)a1, "addCurrentEntityIdentifiers:", v37);
          goto LABEL_54;
        case 8u:
          v38 = 0;
          v39 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 72) |= 4u;
          break;
        case 9u:
          PBReaderReadString();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
            objc_msgSend((id)a1, "addCandidateEntityIdentifiers:", v37);
LABEL_54:

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
        v26 |= (unint64_t)(v43 & 0x7F) << v38;
        if ((v43 & 0x80) == 0)
          goto LABEL_64;
        v38 += 7;
        v15 = v39++ >= 9;
        if (v15)
        {
          LODWORD(v26) = 0;
          goto LABEL_66;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_64:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v26) = 0;
LABEL_66:
      v44 = 44;
LABEL_67:
      *(_DWORD *)(a1 + v44) = v26;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id dateToJson(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;

  v1 = a1;
  if (v1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSS'Z'"));
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setTimeZone:", v3);

    objc_msgSend(v2, "stringFromDate:", v1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

uint64_t getMGBool(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = (uint64_t (*)(uint64_t))getMGGetBoolAnswerSymbolLoc_ptr;
  v8 = getMGGetBoolAnswerSymbolLoc_ptr;
  if (!getMGGetBoolAnswerSymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getMGGetBoolAnswerSymbolLoc_block_invoke;
    v4[3] = &unk_1E4D570B8;
    v4[4] = &v5;
    __getMGGetBoolAnswerSymbolLoc_block_invoke((uint64_t)v4);
    v2 = (uint64_t (*)(uint64_t))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
    getMGBool_cold_1();
  return v2(a1);
}

void sub_1A4A47C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMGGetBoolAnswerSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = (void *)libMobileGestaltLibraryCore_frameworkLibrary;
  v8 = libMobileGestaltLibraryCore_frameworkLibrary;
  if (!libMobileGestaltLibraryCore_frameworkLibrary)
  {
    v9 = xmmword_1E4D58BE0;
    v10 = 0;
    v2 = (void *)_sl_dlopen();
    v6[3] = (uint64_t)v2;
    libMobileGestaltLibraryCore_frameworkLibrary = (uint64_t)v2;
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
    __getMGGetBoolAnswerSymbolLoc_block_invoke_cold_1(&v4);
  if (v4)
    free(v4);
  result = dlsym(v2, "MGGetBoolAnswer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getMGGetBoolAnswerSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A4A482F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ATXPBDigestOnboardingSuggestionLoggingEventReadFrom(uint64_t a1, uint64_t a2)
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
  void *v20;
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
      v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        *(_BYTE *)(a1 + 32) |= 1u;
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
      }
      else if ((_DWORD)v18 == 2)
      {
        v24 = 0;
        v25 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + 32) |= 2u;
        while (1)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          v29 = v28 + 1;
          if (v28 == -1 || v29 > *(_QWORD *)(a2 + *v4))
            break;
          v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
          *(_QWORD *)(a2 + v27) = v29;
          v26 |= (unint64_t)(v30 & 0x7F) << v24;
          if ((v30 & 0x80) == 0)
            goto LABEL_35;
          v24 += 7;
          v15 = v25++ >= 9;
          if (v15)
          {
            LODWORD(v26) = 0;
            goto LABEL_37;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_35:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v26) = 0;
LABEL_37:
        *(_DWORD *)(a1 + 16) = v26;
      }
      else if ((_DWORD)v18 == 1)
      {
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = *(void **)(a1 + 24);
        *(_QWORD *)(a1 + 24) = v19;

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

uint64_t ATXPBUserNotificationDigestLoggingEventReadFrom(uint64_t a1, uint64_t a2)
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
  ATXPBUserNotificationDigest *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
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
      v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        *(_BYTE *)(a1 + 28) |= 1u;
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
      }
      else if ((_DWORD)v18 == 2)
      {
        v23 = 0;
        v24 = 0;
        v25 = 0;
        *(_BYTE *)(a1 + 28) |= 2u;
        while (1)
        {
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          v28 = v27 + 1;
          if (v27 == -1 || v28 > *(_QWORD *)(a2 + *v4))
            break;
          v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
          *(_QWORD *)(a2 + v26) = v28;
          v25 |= (unint64_t)(v29 & 0x7F) << v23;
          if ((v29 & 0x80) == 0)
            goto LABEL_37;
          v23 += 7;
          v15 = v24++ >= 9;
          if (v15)
          {
            LODWORD(v25) = 0;
            goto LABEL_39;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v25) = 0;
LABEL_39:
        *(_DWORD *)(a1 + 24) = v25;
      }
      else if ((_DWORD)v18 == 1)
      {
        v19 = objc_alloc_init(ATXPBUserNotificationDigest);
        objc_storeStrong((id *)(a1 + 16), v19);
        if (!PBReaderPlaceMark() || (ATXPBUserNotificationDigestReadFrom((uint64_t)v19, a2) & 1) == 0)
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

uint64_t ATXPBDigestOnboardingLoggingEventReadFrom(uint64_t a1, uint64_t a2)
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
  char v34;
  unsigned int v35;
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
  void *v50;
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
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = *(void **)(a1 + 40);
          *(_QWORD *)(a1 + 40) = v18;

          continue;
        case 2u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 52) |= 4u;
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
          v51 = 28;
          goto LABEL_68;
        case 3u:
          v28 = 0;
          v29 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 52) |= 2u;
          while (2)
          {
            v30 = *v3;
            v31 = *(_QWORD *)(a2 + v30);
            v32 = v31 + 1;
            if (v31 == -1 || v32 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
              *(_QWORD *)(a2 + v30) = v32;
              v23 |= (unint64_t)(v33 & 0x7F) << v28;
              if (v33 < 0)
              {
                v28 += 7;
                v15 = v29++ >= 9;
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
          v51 = 24;
          goto LABEL_68;
        case 4u:
          v34 = 0;
          v35 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 52) |= 8u;
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
              v23 |= (unint64_t)(v39 & 0x7F) << v34;
              if (v39 < 0)
              {
                v34 += 7;
                v15 = v35++ >= 9;
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
          v51 = 32;
LABEL_68:
          *(_DWORD *)(a1 + v51) = v23;
          continue;
        case 5u:
          *(_BYTE *)(a1 + 52) |= 1u;
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
        case 6u:
          v43 = 0;
          v44 = 0;
          v45 = 0;
          *(_BYTE *)(a1 + 52) |= 0x10u;
          break;
        case 7u:
          PBReaderReadString();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if (v50)
            objc_msgSend((id)a1, "addDeliveryTimes:", v50);

          continue;
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
          goto LABEL_70;
        v43 += 7;
        v15 = v44++ >= 9;
        if (v15)
        {
          v45 = 0;
          goto LABEL_72;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_70:
      if (*(_BYTE *)(a2 + *v5))
        v45 = 0;
LABEL_72:
      *(_BYTE *)(a1 + 48) = v45 != 0;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void OUTLINED_FUNCTION_0_14(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_13(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t OUTLINED_FUNCTION_15(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40);
}

uint64_t ATXPBSpotlightEventMetadataReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v29;
  unint64_t v30;
  char v31;
  void *v32;

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
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_38;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 44) |= 2u;
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
          *(_BYTE *)(a1 + 40) = v22 != 0;
          continue;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_38;
        case 4u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 44) |= 1u;
          break;
        case 5u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
LABEL_38:
          v32 = *(void **)(a1 + v18);
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
          v28 = 0;
          goto LABEL_46;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_44:
      if (*(_BYTE *)(a2 + *v5))
        v28 = 0;
LABEL_46:
      *(_QWORD *)(a1 + 8) = v28;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void OUTLINED_FUNCTION_0_15(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

float *OUTLINED_FUNCTION_1_7(float *result, uint64_t a2, _QWORD *a3, float a4)
{
  *result = a4;
  *a3 = a2;
  return result;
}

uint64_t ATXPBFaceGalleryConfigurationReadFrom(uint64_t a1, uint64_t a2)
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
  ATXPBFaceGallerySection *v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
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
        *(_BYTE *)(a1 + 20) |= 1u;
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
            goto LABEL_33;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_35:
        *(_DWORD *)(a1 + 16) = v20;
      }
      else if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(ATXPBFaceGallerySection);
        -[ATXPBFaceGalleryConfiguration addSections:](a1, v17);
        if (!PBReaderPlaceMark() || (ATXPBFaceGallerySectionReadFrom(v17, a2) & 1) == 0)
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

uint64_t ATXPBMissedNotificationRankingLoggingEventReadFrom(uint64_t a1, uint64_t a2)
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
  ATXPBMissedNotificationRanking *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
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
      v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
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
      }
      else if ((_DWORD)v18 == 2)
      {
        v23 = 0;
        v24 = 0;
        v25 = 0;
        *(_BYTE *)(a1 + 32) |= 2u;
        while (1)
        {
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          v28 = v27 + 1;
          if (v27 == -1 || v28 > *(_QWORD *)(a2 + *v4))
            break;
          v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
          *(_QWORD *)(a2 + v26) = v28;
          v25 |= (unint64_t)(v29 & 0x7F) << v23;
          if ((v29 & 0x80) == 0)
            goto LABEL_37;
          v23 += 7;
          v15 = v24++ >= 9;
          if (v15)
          {
            LODWORD(v25) = 0;
            goto LABEL_39;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v25) = 0;
LABEL_39:
        *(_DWORD *)(a1 + 16) = v25;
      }
      else if ((_DWORD)v18 == 1)
      {
        v19 = objc_alloc_init(ATXPBMissedNotificationRanking);
        objc_storeStrong((id *)(a1 + 24), v19);
        if (!PBReaderPlaceMark() || (ATXPBMissedNotificationRankingReadFrom((uint64_t)v19, a2) & 1) == 0)
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

id ATXSleepSuggestionInterface()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE78F250);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1A85A4F90]();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_predictedSleepSuggestionWithCompletionHandler_, 0, 1);

  return v0;
}

BOOL ATXPBCGRectWrapperReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v21;
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
          v28 = &OBJC_IVAR___ATXPBCGRectWrapper__x;
          goto LABEL_41;
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
          v28 = &OBJC_IVAR___ATXPBCGRectWrapper__y;
          goto LABEL_41;
        case 3u:
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v21 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v25 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + v16) = 1;
            v21 = 0;
          }
          v28 = &OBJC_IVAR___ATXPBCGRectWrapper__width;
          goto LABEL_41;
        case 4u:
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v21 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v27);
            *(_QWORD *)(a2 + v26) = v27 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + v16) = 1;
            v21 = 0;
          }
          v28 = &OBJC_IVAR___ATXPBCGRectWrapper__height;
LABEL_41:
          *(_QWORD *)(a1 + *v28) = v21;
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

id ATXAppPredictionXPCInterface()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7C7A70);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1A85A4F90]();
  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithObjects:", v3, v4, 0);

  objc_autoreleasePoolPop(v1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_approvedSiriKitIntentsWithReply_, 0, 1);

  v6 = (void *)MEMORY[0x1A85A4F90]();
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithObjects:", v8, v9, 0);

  objc_autoreleasePoolPop(v6);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_getWebsitePredictionsForContextType_limit_reply_, 0, 1);

  return v0;
}

void sub_1A4A57E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4A58AA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4A59054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t AppPredictionUILibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!AppPredictionUILibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E4D58F10;
    v3 = 0;
    AppPredictionUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AppPredictionUILibraryCore_frameworkLibrary)
    AppPredictionUILibrary_cold_1(&v1);
  return AppPredictionUILibraryCore_frameworkLibrary;
}

Class __getCRSCardRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!CardServicesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E4D58F28;
    v5 = 0;
    CardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CardServicesLibraryCore_frameworkLibrary)
    __getCRSCardRequestClass_block_invoke_cold_1(&v3);
  result = objc_getClass("CRSCardRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCRSCardRequestClass_block_invoke_cold_2();
  getCRSCardRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getATXProactiveSuggestionBuilderClass_block_invoke(uint64_t a1)
{
  Class result;

  AppPredictionInternalLibrary();
  result = objc_getClass("ATXProactiveSuggestionBuilder");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getATXProactiveSuggestionBuilderClass_block_invoke_cold_1();
  getATXProactiveSuggestionBuilderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void AppPredictionInternalLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!AppPredictionInternalLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_1E4D58F40;
    v2 = 0;
    AppPredictionInternalLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AppPredictionInternalLibraryCore_frameworkLibrary)
    AppPredictionInternalLibrary_cold_1(&v0);
}

const __CFString *ATXUserEducationSuggestionTypeToString(unint64_t a1)
{
  NSObject *v3;

  if (a1 < 4)
    return off_1E4D58F58[a1];
  __atxlog_handle_context_user_education_suggestions();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    ATXUserEducationSuggestionTypeToString_cold_1(a1, v3);

  return CFSTR("ATXUserEducationSuggestionType_Error");
}

const __CFString *ATXTimeEventSourceTypeToDisplayName(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x15)
    return CFSTR("Calendar Events");
  else
    return off_1E4D58F78[a1 - 1];
}

const __CFString *ATXUserNotificationDigestDeliveryTimeToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("firstDigest");
  else
    return off_1E4D590D0[a1 - 1];
}

uint64_t ATXStringToATXUserNotificationDigestDeliveryTime(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("firstDigest")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("lastDigest")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("otherDigest")) & 1) != 0)
  {
    v2 = 2;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("unspecifiedDigest")))
  {
    v2 = 3;
  }
  else
  {
    v2 = 4;
  }

  return v2;
}

uint64_t digestTimeToMode(unint64_t a1)
{
  if (a1 >= 4)
    return 11;
  else
    return a1 + 8;
}

void OUTLINED_FUNCTION_2_8(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, a5, 2u);
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

void removeCacheFile(void *a1)
{
  void *v1;
  id v2;
  NSObject *v3;
  char v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v1 = (void *)MEMORY[0x1E0CB3620];
  v2 = a1;
  objc_msgSend(v1, "defaultManager");
  v3 = objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v4 = -[NSObject removeItemAtPath:error:](v3, "removeItemAtPath:error:", v2, &v8);

  v5 = v8;
  v6 = v5;
  if ((v4 & 1) != 0)
  {
LABEL_5:

    goto LABEL_6;
  }
  v7 = objc_msgSend(v5, "code");

  if (v7 != 4)
  {
    __atxlog_handle_default();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      removeCacheFile_cold_1();
    goto LABEL_5;
  }
LABEL_6:

}

void OUTLINED_FUNCTION_0_16(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t ATXPBUserNotificationReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v21;
  uint64_t v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  ATXPBUserNotificationDerivedData *v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
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
  uint64_t v49;
  unint64_t v50;
  char v51;
  char v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char v62;
  unsigned int v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  char v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char v73;
  char v74;
  unsigned int v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char v79;
  uint64_t result;
  char v81;
  unsigned int v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  char v87;
  void *v88;
  char v89;
  unsigned int v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  char v94;
  char v95;
  unsigned int v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  char v101;
  char v102;
  unsigned int v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  char v108;
  char v109;
  unsigned int v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  char v114;
  char v115;
  unsigned int v116;
  uint64_t v117;
  uint64_t v118;
  unint64_t v119;
  char v120;
  char v121;
  unsigned int v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  char v127;
  char v128;
  unsigned int v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  char v133;
  uint64_t v134;
  BOOL v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;

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
        *(_DWORD *)(a1 + 240) |= 0x100u;
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
        v138 = 72;
        goto LABEL_238;
      case 2u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 224;
        goto LABEL_115;
      case 3u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 200;
        goto LABEL_115;
      case 4u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 176;
        goto LABEL_115;
      case 5u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 96;
        goto LABEL_115;
      case 6u:
        v23 = 0;
        v24 = 0;
        v25 = 0;
        *(_DWORD *)(a1 + 240) |= 2u;
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
                v25 = 0;
                goto LABEL_168;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v25 = 0;
LABEL_168:
        v134 = 16;
        goto LABEL_221;
      case 7u:
        PBReaderReadData();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 216;
        goto LABEL_115;
      case 8u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 104;
        goto LABEL_115;
      case 9u:
        v30 = objc_alloc_init(ATXPBUserNotificationDerivedData);
        objc_storeStrong((id *)(a1 + 128), v30);
        if (!PBReaderPlaceMark() || (ATXPBUserNotificationDerivedDataReadFrom(v30, a2) & 1) == 0)
          goto LABEL_241;
        goto LABEL_73;
      case 0xAu:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 192;
        goto LABEL_115;
      case 0xBu:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 112;
        goto LABEL_115;
      case 0xCu:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 160;
        goto LABEL_115;
      case 0xDu:
        PBReaderReadString();
        v30 = (ATXPBUserNotificationDerivedData *)objc_claimAutoreleasedReturnValue();
        if (v30)
          objc_msgSend((id)a1, "addContactIDs:", v30);
        goto LABEL_79;
      case 0xEu:
        v31 = 0;
        v32 = 0;
        v33 = 0;
        *(_DWORD *)(a1 + 240) |= 0x4000u;
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
            v33 |= (unint64_t)(v37 & 0x7F) << v31;
            if (v37 < 0)
            {
              v31 += 7;
              v15 = v32++ >= 9;
              if (v15)
              {
                v33 = 0;
                goto LABEL_172;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v33 = 0;
LABEL_172:
        v135 = v33 != 0;
        v136 = 233;
        goto LABEL_226;
      case 0xFu:
        v38 = 0;
        v39 = 0;
        v40 = 0;
        *(_DWORD *)(a1 + 240) |= 0x1000u;
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
                goto LABEL_176;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v40) = 0;
LABEL_176:
        v137 = 208;
        goto LABEL_231;
      case 0x10u:
        v45 = 0;
        v46 = 0;
        v47 = 0;
        *(_DWORD *)(a1 + 240) |= 0x8000u;
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
            v47 |= (unint64_t)(v51 & 0x7F) << v45;
            if (v51 < 0)
            {
              v45 += 7;
              v15 = v46++ >= 9;
              if (v15)
              {
                v47 = 0;
                goto LABEL_180;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v47 = 0;
LABEL_180:
        v135 = v47 != 0;
        v136 = 234;
        goto LABEL_226;
      case 0x11u:
        v52 = 0;
        v53 = 0;
        v40 = 0;
        *(_DWORD *)(a1 + 240) |= 0x400u;
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
            v40 |= (unint64_t)(v57 & 0x7F) << v52;
            if (v57 < 0)
            {
              v52 += 7;
              v15 = v53++ >= 9;
              if (v15)
              {
                LODWORD(v40) = 0;
                goto LABEL_184;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v40) = 0;
LABEL_184:
        v137 = 88;
        goto LABEL_231;
      case 0x12u:
        v30 = objc_alloc_init(ATXPBSharedDigestEngagementTrackingMetrics);
        objc_storeStrong((id *)(a1 + 168), v30);
        if (PBReaderPlaceMark()
          && (ATXPBSharedDigestEngagementTrackingMetricsReadFrom((uint64_t)v30, a2) & 1) != 0)
        {
LABEL_73:
          PBReaderRecallMark();
LABEL_79:

LABEL_239:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_241:

        return 0;
      case 0x13u:
        *(_DWORD *)(a1 + 240) |= 1u;
        v58 = *v3;
        v59 = *(_QWORD *)(a2 + v58);
        if (v59 <= 0xFFFFFFFFFFFFFFF7 && v59 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v59);
          *(_QWORD *)(a2 + v58) = v59 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v20 = 0;
        }
        v138 = 8;
        goto LABEL_238;
      case 0x14u:
        PBReaderReadString();
        v30 = (ATXPBUserNotificationDerivedData *)objc_claimAutoreleasedReturnValue();
        if (v30)
          objc_msgSend((id)a1, "addRawIdentifiers:", v30);
        goto LABEL_79;
      case 0x15u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 136;
        goto LABEL_115;
      case 0x16u:
        *(_DWORD *)(a1 + 240) |= 0x20u;
        v60 = *v3;
        v61 = *(_QWORD *)(a2 + v60);
        if (v61 <= 0xFFFFFFFFFFFFFFF7 && v61 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v61);
          *(_QWORD *)(a2 + v60) = v61 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v20 = 0;
        }
        v138 = 48;
LABEL_238:
        *(_QWORD *)(a1 + v138) = v20;
        goto LABEL_239;
      case 0x17u:
        v62 = 0;
        v63 = 0;
        v25 = 0;
        *(_DWORD *)(a1 + 240) |= 4u;
        while (2)
        {
          v64 = *v3;
          v65 = *(_QWORD *)(a2 + v64);
          v66 = v65 + 1;
          if (v65 == -1 || v66 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v67 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v65);
            *(_QWORD *)(a2 + v64) = v66;
            v25 |= (unint64_t)(v67 & 0x7F) << v62;
            if (v67 < 0)
            {
              v62 += 7;
              v15 = v63++ >= 9;
              if (v15)
              {
                v25 = 0;
                goto LABEL_188;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v25 = 0;
LABEL_188:
        v134 = 24;
        goto LABEL_221;
      case 0x18u:
        v68 = 0;
        v69 = 0;
        v25 = 0;
        *(_DWORD *)(a1 + 240) |= 0x200u;
        while (2)
        {
          v70 = *v3;
          v71 = *(_QWORD *)(a2 + v70);
          v72 = v71 + 1;
          if (v71 == -1 || v72 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v73 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v71);
            *(_QWORD *)(a2 + v70) = v72;
            v25 |= (unint64_t)(v73 & 0x7F) << v68;
            if (v73 < 0)
            {
              v68 += 7;
              v15 = v69++ >= 9;
              if (v15)
              {
                v25 = 0;
                goto LABEL_192;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v25 = 0;
LABEL_192:
        v134 = 80;
        goto LABEL_221;
      case 0x19u:
        v74 = 0;
        v75 = 0;
        v25 = 0;
        *(_DWORD *)(a1 + 240) |= 0x40u;
        while (2)
        {
          v76 = *v3;
          v77 = *(_QWORD *)(a2 + v76);
          v78 = v77 + 1;
          if (v77 == -1 || v78 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v79 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v77);
            *(_QWORD *)(a2 + v76) = v78;
            v25 |= (unint64_t)(v79 & 0x7F) << v74;
            if (v79 < 0)
            {
              v74 += 7;
              v15 = v75++ >= 9;
              if (v15)
              {
                v25 = 0;
                goto LABEL_196;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v25 = 0;
LABEL_196:
        v134 = 56;
        goto LABEL_221;
      case 0x1Eu:
        v81 = 0;
        v82 = 0;
        v83 = 0;
        *(_DWORD *)(a1 + 240) |= 0x40000u;
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
            v83 |= (unint64_t)(v87 & 0x7F) << v81;
            if (v87 < 0)
            {
              v81 += 7;
              v15 = v82++ >= 9;
              if (v15)
              {
                v83 = 0;
                goto LABEL_200;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v83 = 0;
LABEL_200:
        v135 = v83 != 0;
        v136 = 237;
        goto LABEL_226;
      case 0x1Fu:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 184;
LABEL_115:
        v88 = *(void **)(a1 + v22);
        *(_QWORD *)(a1 + v22) = v21;

        goto LABEL_239;
      case 0x20u:
        v89 = 0;
        v90 = 0;
        v25 = 0;
        *(_DWORD *)(a1 + 240) |= 0x80u;
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
            v25 |= (unint64_t)(v94 & 0x7F) << v89;
            if (v94 < 0)
            {
              v89 += 7;
              v15 = v90++ >= 9;
              if (v15)
              {
                v25 = 0;
                goto LABEL_204;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v25 = 0;
LABEL_204:
        v134 = 64;
        goto LABEL_221;
      case 0x21u:
        v95 = 0;
        v96 = 0;
        v97 = 0;
        *(_DWORD *)(a1 + 240) |= 0x10000u;
        while (2)
        {
          v98 = *v3;
          v99 = *(_QWORD *)(a2 + v98);
          v100 = v99 + 1;
          if (v99 == -1 || v100 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v101 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v99);
            *(_QWORD *)(a2 + v98) = v100;
            v97 |= (unint64_t)(v101 & 0x7F) << v95;
            if (v101 < 0)
            {
              v95 += 7;
              v15 = v96++ >= 9;
              if (v15)
              {
                v97 = 0;
                goto LABEL_208;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v97 = 0;
LABEL_208:
        v135 = v97 != 0;
        v136 = 235;
        goto LABEL_226;
      case 0x22u:
        v102 = 0;
        v103 = 0;
        v104 = 0;
        *(_DWORD *)(a1 + 240) |= 0x20000u;
        while (2)
        {
          v105 = *v3;
          v106 = *(_QWORD *)(a2 + v105);
          v107 = v106 + 1;
          if (v106 == -1 || v107 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v108 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v106);
            *(_QWORD *)(a2 + v105) = v107;
            v104 |= (unint64_t)(v108 & 0x7F) << v102;
            if (v108 < 0)
            {
              v102 += 7;
              v15 = v103++ >= 9;
              if (v15)
              {
                v104 = 0;
                goto LABEL_212;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v104 = 0;
LABEL_212:
        v135 = v104 != 0;
        v136 = 236;
        goto LABEL_226;
      case 0x23u:
        v109 = 0;
        v110 = 0;
        v25 = 0;
        *(_DWORD *)(a1 + 240) |= 0x10u;
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
            v25 |= (unint64_t)(v114 & 0x7F) << v109;
            if (v114 < 0)
            {
              v109 += 7;
              v15 = v110++ >= 9;
              if (v15)
              {
                v25 = 0;
                goto LABEL_216;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v25 = 0;
LABEL_216:
        v134 = 40;
        goto LABEL_221;
      case 0x24u:
        v115 = 0;
        v116 = 0;
        v25 = 0;
        *(_DWORD *)(a1 + 240) |= 8u;
        while (2)
        {
          v117 = *v3;
          v118 = *(_QWORD *)(a2 + v117);
          v119 = v118 + 1;
          if (v118 == -1 || v119 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v120 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v118);
            *(_QWORD *)(a2 + v117) = v119;
            v25 |= (unint64_t)(v120 & 0x7F) << v115;
            if (v120 < 0)
            {
              v115 += 7;
              v15 = v116++ >= 9;
              if (v15)
              {
                v25 = 0;
                goto LABEL_220;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v25 = 0;
LABEL_220:
        v134 = 32;
LABEL_221:
        *(_QWORD *)(a1 + v134) = v25;
        goto LABEL_239;
      case 0x25u:
        v121 = 0;
        v122 = 0;
        v123 = 0;
        *(_DWORD *)(a1 + 240) |= 0x2000u;
        while (2)
        {
          v124 = *v3;
          v125 = *(_QWORD *)(a2 + v124);
          v126 = v125 + 1;
          if (v125 == -1 || v126 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v127 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v125);
            *(_QWORD *)(a2 + v124) = v126;
            v123 |= (unint64_t)(v127 & 0x7F) << v121;
            if (v127 < 0)
            {
              v121 += 7;
              v15 = v122++ >= 9;
              if (v15)
              {
                v123 = 0;
                goto LABEL_225;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v123 = 0;
LABEL_225:
        v135 = v123 != 0;
        v136 = 232;
LABEL_226:
        *(_BYTE *)(a1 + v136) = v135;
        goto LABEL_239;
      case 0x26u:
        v128 = 0;
        v129 = 0;
        v40 = 0;
        *(_DWORD *)(a1 + 240) |= 0x800u;
        while (2)
        {
          v130 = *v3;
          v131 = *(_QWORD *)(a2 + v130);
          v132 = v131 + 1;
          if (v131 == -1 || v132 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v133 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v131);
            *(_QWORD *)(a2 + v130) = v132;
            v40 |= (unint64_t)(v133 & 0x7F) << v128;
            if (v133 < 0)
            {
              v128 += 7;
              v15 = v129++ >= 9;
              if (v15)
              {
                LODWORD(v40) = 0;
                goto LABEL_230;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v40) = 0;
LABEL_230:
        v137 = 144;
LABEL_231:
        *(_DWORD *)(a1 + v137) = v40;
        goto LABEL_239;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_239;
    }
  }
}

uint64_t ATXMPBContextMenuFeedbackTrackerReadFrom(uint64_t a1, uint64_t a2)
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
              v25 = 8;
              goto LABEL_32;
            case 3u:
              PBReaderReadString();
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = 24;
              goto LABEL_32;
            case 4u:
              PBReaderReadString();
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = 16;
              goto LABEL_32;
            case 5u:
              PBReaderReadString();
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = 40;
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
          *(_DWORD *)(a1 + 32) = v19;
          goto LABEL_37;
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1A4A67B70(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
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

void sub_1A4A68248(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4A68544(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A4A687F4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A4A68AE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1A4A68DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4A6A880(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A4A6AFBC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_8_0(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40);
}

uint64_t OUTLINED_FUNCTION_9_0(uint64_t a1)
{
  return *(_QWORD *)(a1 + 56);
}

uint64_t ATXStackLayoutSizeToProto(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 4)
    return 1;
  else
    return (a1 + 1);
}

uint64_t ATXStackLayoutSizeFromProto(int a1)
{
  uint64_t v1;

  v1 = (a1 - 2);
  if (v1 < 4)
    return v1 + 1;
  else
    return 0;
}

void sub_1A4A6CC70(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4A6D208(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4A6D468(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL ATXPBDigestOnboardingLoggingEventEnumsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  int v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v15;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  v6 = (int *)MEMORY[0x1E0D82BB8];
  while (1)
  {
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
      return v7 == 0;
    if (*(_BYTE *)(a2 + *v5))
    {
      v7 = 1;
      return v7 == 0;
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      LOBYTE(v10) = 0;
LABEL_14:
    if (v7)
      v15 = 1;
    else
      v15 = (v10 & 7) == 4;
    if (v15)
      return v7 == 0;
    if ((PBReaderSkipValueWithTag() & 1) == 0)
      return 0;
  }
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

void OUTLINED_FUNCTION_0_17(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

id ATXUsageInsightsInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7A3618);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v33[0] = objc_opt_class();
  v33[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_fetchAllDeliveredNotificationsWithCompletion_, 0, 1);

  v4 = (void *)MEMORY[0x1E0C99E60];
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  v32[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_fetchSuggestedBundleIDsForAllowListForAllModesWithCompletion_, 0, 1);

  v7 = (void *)MEMORY[0x1E0C99E60];
  v31[0] = objc_opt_class();
  v31[1] = objc_opt_class();
  v31[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_fetchSuggestedBundleIDsForDenyListForAllModesWithCompletion_, 0, 1);

  v10 = (void *)MEMORY[0x1E0C99E60];
  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_fetchUsageInsightsInferredATXModeEventsWithCompletion_, 0, 1);

  v13 = (void *)MEMORY[0x1E0C99E60];
  v29[0] = objc_opt_class();
  v29[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_fetchAllInterruptingAppSessionsWithCompletion_, 0, 1);

  v16 = (void *)MEMORY[0x1E0C99E60];
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_fetchAllPhubbingSessionsWithCompletion_, 0, 1);

  v19 = (void *)MEMORY[0x1E0C99E60];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_fetchAllMindlessCyclingSessionsWithCompletion_, 0, 1);

  v22 = (void *)MEMORY[0x1E0C99E60];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_fetchAllContinuousUsageSessionsWithCompletion_, 0, 1);

  return v0;
}

BOOL ATXPBSendToDigestSuggestionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  int v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v15;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  v6 = (int *)MEMORY[0x1E0D82BB8];
  while (1)
  {
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
      return v7 == 0;
    if (*(_BYTE *)(a2 + *v5))
    {
      v7 = 1;
      return v7 == 0;
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      LOBYTE(v10) = 0;
LABEL_14:
    if (v7)
      v15 = 1;
    else
      v15 = (v10 & 7) == 4;
    if (v15)
      return v7 == 0;
    if ((PBReaderSkipValueWithTag() & 1) == 0)
      return 0;
  }
}

__CFString *ATXDigestOnboardingSuggestionOutcomeToString(uint64_t a1)
{
  if (a1 < 3)
    return off_1E4D595E0[(int)a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

BOOL ATXPBDigestOnboardingSuggestionLoggingEventEnumsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  int v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v15;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  v6 = (int *)MEMORY[0x1E0D82BB8];
  while (1)
  {
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
      return v7 == 0;
    if (*(_BYTE *)(a2 + *v5))
    {
      v7 = 1;
      return v7 == 0;
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      LOBYTE(v10) = 0;
LABEL_14:
    if (v7)
      v15 = 1;
    else
      v15 = (v10 & 7) == 4;
    if (v15)
      return v7 == 0;
    if ((PBReaderSkipValueWithTag() & 1) == 0)
      return 0;
  }
}

const __CFString *NSStringForATXAppDirectoryInteractionEvent(unint64_t a1)
{
  if (a1 > 9)
    return CFSTR("unknown");
  else
    return off_1E4D59688[a1];
}

BOOL ATXIsSessionStartedByEvent(uint64_t a1)
{
  return a1 == 0;
}

uint64_t ATXIsSessionEndedByEvent(unint64_t a1)
{
  return (a1 < 9) & (0x178u >> a1);
}

uint64_t ATXDefaultWidgetSuggesterInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7C7AD0);
}

uint64_t ATXPBNotificationGroupEventReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
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
      v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        *(_BYTE *)(a1 + 32) |= 1u;
        v26 = *v3;
        v27 = *(_QWORD *)(a2 + v26);
        if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v28 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v27);
          *(_QWORD *)(a2 + v26) = v27 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v28 = 0;
        }
        *(_QWORD *)(a1 + 8) = v28;
      }
      else if ((_DWORD)v18 == 2)
      {
        PBReaderReadString();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = *(void **)(a1 + 24);
        *(_QWORD *)(a1 + 24) = v29;

      }
      else if ((_DWORD)v18 == 1)
      {
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 32) |= 2u;
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
            goto LABEL_35;
          v19 += 7;
          v15 = v20++ >= 9;
          if (v15)
          {
            LODWORD(v21) = 0;
            goto LABEL_37;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_35:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_37:
        *(_DWORD *)(a1 + 16) = v21;
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

void sub_1A4A75098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_1A4A75288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4A75460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1A4A77668(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4A77DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_8_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_9_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

const __CFString *ATXUserEducationSuggestionEventTypeToString(uint64_t a1)
{
  NSObject *v3;

  if (!a1)
    return CFSTR("Show suggestion");
  if (a1 == 1)
    return CFSTR("Dismiss Suggestion");
  __atxlog_handle_context_user_education_suggestions();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    ATXUserEducationSuggestionEventTypeToString_cold_1(a1, v3);

  return CFSTR("Error");
}

void sub_1A4A7E054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4A7EE04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
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

void sub_1A4A80028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A4A802C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4A803CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4A804E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4A83FF0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1A4A84374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v12;
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 136), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_10_0(id *a1)
{
  return objc_msgSend(*a1, "size");
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void sub_1A4A8A910(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id joinedDisplayNames(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v1, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "displayName", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v8, "displayName");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v10);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  objc_msgSend(v2, "sortUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id stringWithGeohash(int a1)
{
  char __str[9];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  snprintf(__str, 9uLL, "%x", a1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", __str);
  return (id)objc_claimAutoreleasedReturnValue();
}

id roundedDecimal(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    v1 = (void *)MEMORY[0x1E0CB35A0];
    v2 = a1;
    objc_msgSend(v1, "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", 0, 0xFFFFFFFFLL, 0, 0, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "decimalNumberByRoundingAccordingToBehavior:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

uint64_t ATXPBAppDirectoryEventReadFrom(uint64_t a1, uint64_t a2)
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
  char v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  char v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  char v54;
  unsigned int v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  void *v60;
  uint64_t result;
  ATXPBAppDirectoryEventMetadata *v62;
  uint64_t v63;

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
        *(_BYTE *)(a1 + 104) |= 8u;
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
        *(_QWORD *)(a1 + 32) = v20;
        goto LABEL_102;
      case 2u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 104) |= 0x10u;
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
                goto LABEL_80;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_80:
        v63 = 40;
        goto LABEL_101;
      case 3u:
        v28 = 0;
        v29 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 104) |= 2u;
        while (2)
        {
          v30 = *v3;
          v31 = *(_QWORD *)(a2 + v30);
          v32 = v31 + 1;
          if (v31 == -1 || v32 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
            *(_QWORD *)(a2 + v30) = v32;
            v23 |= (unint64_t)(v33 & 0x7F) << v28;
            if (v33 < 0)
            {
              v28 += 7;
              v15 = v29++ >= 9;
              if (v15)
              {
                v23 = 0;
                goto LABEL_84;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_84:
        v63 = 16;
        goto LABEL_101;
      case 4u:
        v34 = 0;
        v35 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 104) |= 4u;
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
            v23 |= (unint64_t)(v39 & 0x7F) << v34;
            if (v39 < 0)
            {
              v34 += 7;
              v15 = v35++ >= 9;
              if (v15)
              {
                v23 = 0;
                goto LABEL_88;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_88:
        v63 = 24;
        goto LABEL_101;
      case 5u:
        PBReaderReadString();
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = 72;
        goto LABEL_66;
      case 6u:
        v42 = 0;
        v43 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 104) |= 1u;
        while (2)
        {
          v44 = *v3;
          v45 = *(_QWORD *)(a2 + v44);
          v46 = v45 + 1;
          if (v45 == -1 || v46 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v47 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v45);
            *(_QWORD *)(a2 + v44) = v46;
            v23 |= (unint64_t)(v47 & 0x7F) << v42;
            if (v47 < 0)
            {
              v42 += 7;
              v15 = v43++ >= 9;
              if (v15)
              {
                v23 = 0;
                goto LABEL_92;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_92:
        v63 = 8;
        goto LABEL_101;
      case 7u:
        v48 = 0;
        v49 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 104) |= 0x20u;
        while (2)
        {
          v50 = *v3;
          v51 = *(_QWORD *)(a2 + v50);
          v52 = v51 + 1;
          if (v51 == -1 || v52 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v53 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v51);
            *(_QWORD *)(a2 + v50) = v52;
            v23 |= (unint64_t)(v53 & 0x7F) << v48;
            if (v53 < 0)
            {
              v48 += 7;
              v15 = v49++ >= 9;
              if (v15)
              {
                v23 = 0;
                goto LABEL_96;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_96:
        v63 = 48;
        goto LABEL_101;
      case 8u:
        v54 = 0;
        v55 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 104) |= 0x40u;
        while (2)
        {
          v56 = *v3;
          v57 = *(_QWORD *)(a2 + v56);
          v58 = v57 + 1;
          if (v57 == -1 || v58 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v59 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v57);
            *(_QWORD *)(a2 + v56) = v58;
            v23 |= (unint64_t)(v59 & 0x7F) << v54;
            if (v59 < 0)
            {
              v54 += 7;
              v15 = v55++ >= 9;
              if (v15)
              {
                v23 = 0;
                goto LABEL_100;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_100:
        v63 = 56;
LABEL_101:
        *(_QWORD *)(a1 + v63) = v23;
        goto LABEL_102;
      case 9u:
        PBReaderReadString();
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = 64;
LABEL_66:
        v60 = *(void **)(a1 + v41);
        *(_QWORD *)(a1 + v41) = v40;

        goto LABEL_102;
      case 0xBu:
        PBReaderReadString();
        v62 = (ATXPBAppDirectoryEventMetadata *)objc_claimAutoreleasedReturnValue();
        if (v62)
          -[ATXPBAppDirectoryEvent addShownSuggestionIds:](a1, v62);
        goto LABEL_76;
      case 0xCu:
        PBReaderReadString();
        v62 = (ATXPBAppDirectoryEventMetadata *)objc_claimAutoreleasedReturnValue();
        if (v62)
          -[ATXPBAppDirectoryEvent addEngagedSuggestionIds:](a1, v62);
        goto LABEL_76;
      case 0xDu:
        v62 = objc_alloc_init(ATXPBAppDirectoryEventMetadata);
        objc_storeStrong((id *)(a1 + 88), v62);
        if (PBReaderPlaceMark() && ATXPBAppDirectoryEventMetadataReadFrom((uint64_t)v62, a2))
        {
          PBReaderRecallMark();
LABEL_76:

LABEL_102:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_102;
    }
  }
}

BOOL ATXPBModeConfigurationLoggingEventEnumsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  int v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v15;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  v6 = (int *)MEMORY[0x1E0D82BB8];
  while (1)
  {
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
      return v7 == 0;
    if (*(_BYTE *)(a2 + *v5))
    {
      v7 = 1;
      return v7 == 0;
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      LOBYTE(v10) = 0;
LABEL_14:
    if (v7)
      v15 = 1;
    else
      v15 = (v10 & 7) == 4;
    if (v15)
      return v7 == 0;
    if ((PBReaderSkipValueWithTag() & 1) == 0)
      return 0;
  }
}

BOOL ATXPBUserNotificationAppDigestReadFrom(_QWORD *a1, uint64_t a2)
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
  ATXPBUserNotificationDigestNotificationGroup *v19;

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
        v19 = objc_alloc_init(ATXPBUserNotificationDigestNotificationGroup);
        objc_msgSend(a1, "addAppMarqueeGroups:", v19);
LABEL_24:
        if (!PBReaderPlaceMark()
          || (ATXPBUserNotificationDigestNotificationGroupReadFrom((uint64_t)v19, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_27;
      }
      if ((_DWORD)v17 == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (ATXPBUserNotificationDigestNotificationGroup *)a1[2];
        a1[2] = v18;
LABEL_27:

        goto LABEL_29;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_29:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v19 = objc_alloc_init(ATXPBUserNotificationDigestNotificationGroup);
    objc_msgSend(a1, "addNonAppMarqueeGroups:", v19);
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ATXPBFaceGalleryEventReadFrom(uint64_t a1, uint64_t a2)
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
  ATXPBFaceGalleryItem *v24;
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
        v24 = objc_alloc_init(ATXPBFaceGalleryItem);
        -[ATXPBFaceGalleryEvent addItems:](a1, v24);
        if (!PBReaderPlaceMark() || !ATXPBFaceGalleryItemReadFrom((uint64_t)v24, a2))
        {
LABEL_42:

          return 0;
        }
      }
      else
      {
        if ((_DWORD)v17 != 2)
        {
          if ((_DWORD)v17 == 1)
          {
            v18 = 0;
            v19 = 0;
            v20 = 0;
            *(_BYTE *)(a1 + 32) |= 1u;
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
                LODWORD(v20) = 0;
                goto LABEL_39;
              }
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
            if (*(_BYTE *)(a2 + *v5))
              LODWORD(v20) = 0;
LABEL_39:
            *(_DWORD *)(a1 + 16) = v20;
          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        v24 = objc_alloc_init(ATXPBFaceGalleryConfiguration);
        objc_storeStrong((id *)(a1 + 8), v24);
        if (!PBReaderPlaceMark() || (ATXPBFaceGalleryConfigurationReadFrom((uint64_t)v24, a2) & 1) == 0)
          goto LABEL_42;
      }
      PBReaderRecallMark();

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL ATXMPBHomeScreenAppPanelLaunchRatioTrackerReadFrom(uint64_t a1, uint64_t a2)
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
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 16) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
          {
            v24 = &OBJC_IVAR___ATXMPBHomeScreenAppPanelLaunchRatioTracker__location;
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
            v24 = &OBJC_IVAR___ATXMPBHomeScreenAppPanelLaunchRatioTracker__location;
            goto LABEL_41;
          }
        }
        v24 = &OBJC_IVAR___ATXMPBHomeScreenAppPanelLaunchRatioTracker__location;
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
    *(_BYTE *)(a1 + 16) |= 2u;
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
        v24 = &OBJC_IVAR___ATXMPBHomeScreenAppPanelLaunchRatioTracker__ratioType;
        goto LABEL_39;
      }
      v25 += 7;
      v23 = v26++ > 8;
      if (v23)
      {
        LODWORD(v19) = 0;
        v24 = &OBJC_IVAR___ATXMPBHomeScreenAppPanelLaunchRatioTracker__ratioType;
        goto LABEL_41;
      }
    }
    v24 = &OBJC_IVAR___ATXMPBHomeScreenAppPanelLaunchRatioTracker__ratioType;
LABEL_38:
    *(_BYTE *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1A4A930D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v19);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A4A93440(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A4A93720(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4A938E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4A94B14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A4A94FA8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

uint64_t ATXPBUserNotificationDigestNotificationGroupReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t result;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  ATXPBUserNotification *v25;

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
        v19 = 24;
        goto LABEL_28;
      case 2u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 56;
        goto LABEL_28;
      case 3u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 16;
        goto LABEL_28;
      case 4u:
        *(_BYTE *)(a1 + 64) |= 1u;
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
        goto LABEL_37;
      case 5u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 40;
LABEL_28:
        v24 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_37;
      case 6u:
        v25 = objc_alloc_init(ATXPBUserNotification);
        objc_msgSend((id)a1, "addRankedNotifications:", v25);
        if (!PBReaderPlaceMark() || (ATXPBUserNotificationReadFrom((uint64_t)v25, a2) & 1) == 0)
          goto LABEL_39;
        goto LABEL_34;
      case 7u:
        v25 = objc_alloc_init(ATXPBSharedDigestEngagementTrackingMetrics);
        objc_storeStrong((id *)(a1 + 48), v25);
        if (PBReaderPlaceMark()
          && (ATXPBSharedDigestEngagementTrackingMetricsReadFrom((uint64_t)v25, a2) & 1) != 0)
        {
LABEL_34:
          PBReaderRecallMark();

LABEL_37:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_39:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_37;
    }
  }
}

uint64_t ATXPBActionCriteriaReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v31;
  void *v32;
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
          *(_BYTE *)(a1 + 36) |= 2u;
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
          v33 = 16;
          goto LABEL_43;
        case 2u:
          *(_BYTE *)(a1 + 36) |= 1u;
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
          v33 = 8;
LABEL_43:
          *(_QWORD *)(a1 + v33) = v20;
          continue;
        case 3u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 36) |= 4u;
          break;
        case 4u:
          PBReaderReadData();
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = *(void **)(a1 + 24);
          *(_QWORD *)(a1 + 24) = v31;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v27 = *v3;
        v28 = *(_QWORD *)(a2 + v27);
        v29 = v28 + 1;
        if (v28 == -1 || v29 > *(_QWORD *)(a2 + *v4))
          break;
        v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
        *(_QWORD *)(a2 + v27) = v29;
        v26 |= (unint64_t)(v30 & 0x7F) << v24;
        if ((v30 & 0x80) == 0)
          goto LABEL_36;
        v24 += 7;
        v15 = v25++ >= 9;
        if (v15)
        {
          v26 = 0;
          goto LABEL_38;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_36:
      if (*(_BYTE *)(a2 + *v5))
        v26 = 0;
LABEL_38:
      *(_BYTE *)(a1 + 32) = v26 != 0;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1A4A9F530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void OUTLINED_FUNCTION_6_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x34u);
}

BOOL ATXPBUrgencyTuningSuggestionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  int v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v15;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  v6 = (int *)MEMORY[0x1E0D82BB8];
  while (1)
  {
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
      return v7 == 0;
    if (*(_BYTE *)(a2 + *v5))
    {
      v7 = 1;
      return v7 == 0;
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      LOBYTE(v10) = 0;
LABEL_14:
    if (v7)
      v15 = 1;
    else
      v15 = (v10 & 7) == 4;
    if (v15)
      return v7 == 0;
    if ((PBReaderSkipValueWithTag() & 1) == 0)
      return 0;
  }
}

uint64_t ATXPBUserNotificationDerivedDataReadFrom(void *a1, uint64_t a2)
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
  ATXPBUserNotificationModelScore *v17;
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
        v17 = objc_alloc_init(ATXPBUserNotificationModelScore);
        objc_msgSend(a1, "addScores:", v17);
        if (!PBReaderPlaceMark() || (ATXPBUserNotificationModelScoreReadFrom((uint64_t)v17, a2) & 1) == 0)
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

BOOL ATXPBHeuristicMetadataReadFrom(uint64_t a1, uint64_t a2)
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
        v18 = 8;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 16;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ATXPBMissedNotificationRankingReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t result;
  ATXPBUserNotificationDigestNotificationGroup *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

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
        *(_BYTE *)(a1 + 64) |= 1u;
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
        goto LABEL_39;
      case 2u:
        v22 = objc_alloc_init(ATXPBUserNotificationDigestNotificationGroup);
        objc_msgSend((id)a1, "addRankedGroups:", v22);
        if (!PBReaderPlaceMark()
          || (ATXPBUserNotificationDigestNotificationGroupReadFrom((uint64_t)v22, a2) & 1) == 0)
        {
          goto LABEL_41;
        }
        goto LABEL_36;
      case 3u:
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = 56;
        goto LABEL_30;
      case 4u:
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = 40;
        goto LABEL_30;
      case 5u:
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = 24;
LABEL_30:
        v25 = *(void **)(a1 + v24);
        *(_QWORD *)(a1 + v24) = v23;

        goto LABEL_39;
      case 6u:
        v22 = objc_alloc_init(ATXPBSharedDigestEngagementTrackingMetrics);
        objc_storeStrong((id *)(a1 + 48), v22);
        if (!PBReaderPlaceMark()
          || (ATXPBSharedDigestEngagementTrackingMetricsReadFrom((uint64_t)v22, a2) & 1) == 0)
        {
          goto LABEL_41;
        }
        goto LABEL_36;
      case 7u:
        v22 = objc_alloc_init(ATXPBDigestTimeline);
        objc_storeStrong((id *)(a1 + 16), v22);
        if (PBReaderPlaceMark() && ATXPBDigestTimelineReadFrom((uint64_t)v22, a2))
        {
LABEL_36:
          PBReaderRecallMark();

LABEL_39:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_41:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_39;
    }
  }
}

uint64_t ATXPBFaceGallerySectionReadFrom(_BYTE *a1, uint64_t a2)
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
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  ATXPBFaceGalleryItem *v29;
  uint64_t result;
  uint64_t v31;

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
      if ((_DWORD)v17 != 2)
      {
        if ((_DWORD)v17 != 1)
        {
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          goto LABEL_49;
        }
        v18 = 0;
        v19 = 0;
        v20 = 0;
        a1[24] |= 2u;
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
            goto LABEL_41;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_43;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_43:
        v31 = 20;
        goto LABEL_48;
      }
      v29 = objc_alloc_init(ATXPBFaceGalleryItem);
      objc_msgSend(a1, "addItems:", v29);
      if (!PBReaderPlaceMark() || !ATXPBFaceGalleryItemReadFrom((uint64_t)v29, a2))
      {

        return 0;
      }
      PBReaderRecallMark();

LABEL_49:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v24 = 0;
    v25 = 0;
    v20 = 0;
    a1[24] |= 1u;
    while (1)
    {
      v26 = *v3;
      v27 = *(_QWORD *)(a2 + v26);
      if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
        break;
      v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
      *(_QWORD *)(a2 + v26) = v27 + 1;
      v20 |= (unint64_t)(v28 & 0x7F) << v24;
      if ((v28 & 0x80) == 0)
        goto LABEL_45;
      v24 += 7;
      v14 = v25++ >= 9;
      if (v14)
      {
        LODWORD(v20) = 0;
        goto LABEL_47;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_45:
    if (*(_BYTE *)(a2 + *v5))
      LODWORD(v20) = 0;
LABEL_47:
    v31 = 16;
LABEL_48:
    *(_DWORD *)&a1[v31] = v20;
    goto LABEL_49;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id ATXSportsInterface()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7A3FE0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1A85A4F90]();
  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = objc_opt_class();
  v4 = (void *)objc_msgSend(v2, "initWithObjects:", v3, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_requestedSchedulesForTeamsWithReply_, 0, 1);

  return v0;
}

void sub_1A4AA6774(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4AA67F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const __CFString *ATXUserEducationSuggestionFeedbackTypeToString(unint64_t a1)
{
  NSObject *v3;

  if (a1 < 0xB)
    return off_1E4D5A618[a1];
  __atxlog_handle_context_user_education_suggestions();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    ATXUserEducationSuggestionFeedbackTypeToString_cold_1(a1, v3);

  return CFSTR("Error");
}

void sub_1A4AA84E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AA8714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

__CFString *ATXModeConfigurationUIToString(uint64_t a1)
{
  if (a1 < 4)
    return off_1E4D5A758[(int)a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_1A4AACEE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

uint64_t ATXPBAVRouteInfoReadFrom(uint64_t a1, uint64_t a2)
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
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
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
        *(_BYTE *)(a1 + 28) |= 1u;
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
            goto LABEL_34;
          v20 += 7;
          v14 = v21++ >= 9;
          if (v14)
          {
            v22 = 0;
            goto LABEL_36;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
        if (*(_BYTE *)(a2 + *v5))
          v22 = 0;
LABEL_36:
        *(_BYTE *)(a1 + 24) = v22 != 0;
      }
      else
      {
        if ((_DWORD)v17 == 2)
        {
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 8;
        }
        else
        {
          if ((_DWORD)v17 != 1)
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
            continue;
          }
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 16;
        }
        v26 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1A4AB0E14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;

  _Block_object_dispose(&a9, 8);
  objc_sync_exit(v9);
  _Unwind_Resume(a1);
}

void sub_1A4AB2830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL ATXPBSendMessagesToDigestSuggestionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  int v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v15;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  v6 = (int *)MEMORY[0x1E0D82BB8];
  while (1)
  {
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
      return v7 == 0;
    if (*(_BYTE *)(a2 + *v5))
    {
      v7 = 1;
      return v7 == 0;
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      LOBYTE(v10) = 0;
LABEL_14:
    if (v7)
      v15 = 1;
    else
      v15 = (v10 & 7) == 4;
    if (v15)
      return v7 == 0;
    if ((PBReaderSkipValueWithTag() & 1) == 0)
      return 0;
  }
}

void sub_1A4AB58D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A4AB5D60(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4AB5DC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4AB5E28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ATXModeForDNDSemanticType(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 0xA)
    return 0;
  else
    return qword_1A4B66E70[a1 + 1];
}

void sub_1A4AB6B4C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4AB6BB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4AB6D28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

id ATXSettingsActionsInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE79EFF0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1A85A4F90]();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_suggestedActionsWithRequest_completionHandler_, 0, 0);

  v3 = (void *)MEMORY[0x1A85A4F90]();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v3);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_recentActionsWithRequest_completionHandler_, 0, 0);

  v5 = (void *)MEMORY[0x1A85A4F90]();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_suggestedActionsWithRequest_completionHandler_, 0, 1);

  v7 = (void *)MEMORY[0x1A85A4F90]();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_recentActionsWithRequest_completionHandler_, 0, 1);

  return v0;
}

uint64_t ATXCacheAppendInteger(void *a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a2;
  return objc_msgSend(a1, "appendBytes:length:", &v3, 8);
}

uint64_t ATXCacheAppendUnsignedInteger(void *a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a2;
  return objc_msgSend(a1, "appendBytes:length:", &v3, 8);
}

uint64_t ATXCacheAppendBoolean(void *a1, char a2)
{
  char v3;

  v3 = a2;
  return objc_msgSend(a1, "appendBytes:length:", &v3, 1);
}

void ATXCacheAppendString(void *a1, id a2)
{
  id v3;
  id v4;
  const char *v5;
  size_t v6;
  size_t v7;

  v3 = objc_retainAutorelease(a2);
  v4 = a1;
  v5 = (const char *)objc_msgSend(v3, "UTF8String");
  v6 = strlen(v5);
  v7 = v6;
  objc_msgSend(v4, "appendBytes:length:", &v7, 8);
  objc_msgSend(v4, "appendBytes:length:", v5, v6);

}

void ATXCacheAppendData(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a2;
  v4 = a1;
  v5 = objc_msgSend(v3, "length");
  v8 = v5;
  objc_msgSend(v4, "appendBytes:length:", &v8, 8);
  v6 = objc_retainAutorelease(v3);
  v7 = objc_msgSend(v6, "bytes");

  objc_msgSend(v4, "appendBytes:length:", v7, v5);
}

uint64_t ATXCacheAppendFloats(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend(a1, "appendBytes:length:", a2, 4 * a3);
}

uint64_t ATXCacheAppendDoubles(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend(a1, "appendBytes:length:", a2, 8 * a3);
}

unint64_t *ATXCacheReadInteger(unint64_t *result, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;

  v2 = *result + 8;
  if (v2 > a2)
  {
    __break(1u);
  }
  else
  {
    v3 = *(_QWORD *)*result;
    *result = v2;
    return (unint64_t *)v3;
  }
  return result;
}

unint64_t *ATXCacheReadUnsignedInteger(unint64_t *result, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;

  v2 = *result + 8;
  if (v2 > a2)
  {
    __break(1u);
  }
  else
  {
    v3 = *(_QWORD *)*result;
    *result = v2;
    return (unint64_t *)v3;
  }
  return result;
}

unint64_t *ATXCacheReadBoolean(unint64_t *result, unint64_t a2)
{
  unint64_t v2;
  char v3;

  v2 = *result + 1;
  if (v2 > a2)
  {
    __break(1u);
  }
  else
  {
    v3 = *(_BYTE *)*result;
    *result = v2;
    return (unint64_t *)(v3 & 1);
  }
  return result;
}

unint64_t *ATXCacheReadString(unint64_t *result, unint64_t a2)
{
  unint64_t v2;
  unint64_t *v3;
  uint64_t v4;
  void *v5;

  v2 = *result + 8;
  if (v2 > a2 || (v3 = result, v4 = *(_QWORD *)*result, *result = v2, v2 + v4 > a2))
  {
    __break(1u);
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", *result, v4, 4);
    *v3 += v4;
    return (unint64_t *)v5;
  }
  return result;
}

unint64_t *ATXCacheReadData(unint64_t *result, unint64_t a2)
{
  unint64_t v2;
  unint64_t *v3;
  uint64_t v4;
  void *v5;

  v2 = *result + 8;
  if (v2 > a2 || (v3 = result, v4 = *(_QWORD *)*result, *result = v2, v2 + v4 > a2))
  {
    __break(1u);
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", *result, v4);
    *v3 += v4;
    return (unint64_t *)v5;
  }
  return result;
}

const void **ATXCacheReadFloats(const void **result, unint64_t a2, void *__dst, uint64_t a4)
{
  const void **v4;
  uint64_t v5;

  if ((unint64_t)*result + 4 * a4 > a2)
  {
    __break(1u);
  }
  else
  {
    v4 = result;
    v5 = 4 * a4;
    result = (const void **)memcpy(__dst, *result, 4 * a4);
    *v4 = (char *)*v4 + v5;
  }
  return result;
}

const void **ATXCacheReadDoubles(const void **result, unint64_t a2, void *__dst, uint64_t a4)
{
  const void **v4;
  uint64_t v5;

  if ((unint64_t)*result + 8 * a4 > a2)
  {
    __break(1u);
  }
  else
  {
    v4 = result;
    v5 = 8 * a4;
    result = (const void **)memcpy(__dst, *result, 8 * a4);
    *v4 = (char *)*v4 + v5;
  }
  return result;
}

uint64_t ATXPBUserNotificationDigestReadFrom(uint64_t a1, uint64_t a2)
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
  ATXPBUserNotificationDigestNotificationGroup *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  void *v25;

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
        *(_BYTE *)(a1 + 88) |= 1u;
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
        goto LABEL_43;
      case 2u:
        v21 = objc_alloc_init(ATXPBUserNotificationDigestNotificationGroup);
        objc_msgSend((id)a1, "addMessageGroups:", v21);
        goto LABEL_34;
      case 3u:
        v21 = objc_alloc_init(ATXPBUserNotificationDigestNotificationGroup);
        objc_msgSend((id)a1, "addHighlightedGroups:", v21);
        goto LABEL_34;
      case 4u:
        v21 = objc_alloc_init(ATXPBUserNotificationDigestNotificationGroup);
        objc_msgSend((id)a1, "addRankedGroups:", v21);
LABEL_34:
        if (!PBReaderPlaceMark()
          || (ATXPBUserNotificationDigestNotificationGroupReadFrom((uint64_t)v21, a2) & 1) == 0)
        {
          goto LABEL_48;
        }
        goto LABEL_42;
      case 5u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 80;
        goto LABEL_39;
      case 6u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 64;
        goto LABEL_39;
      case 7u:
        PBReaderReadString();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = 48;
LABEL_39:
        v25 = *(void **)(a1 + v23);
        *(_QWORD *)(a1 + v23) = v22;

        goto LABEL_43;
      case 8u:
        v21 = objc_alloc_init(ATXPBSharedDigestEngagementTrackingMetrics);
        objc_storeStrong((id *)(a1 + 72), v21);
        if (!PBReaderPlaceMark()
          || (ATXPBSharedDigestEngagementTrackingMetricsReadFrom((uint64_t)v21, a2) & 1) == 0)
        {
          goto LABEL_48;
        }
        goto LABEL_42;
      case 9u:
        v21 = objc_alloc_init(ATXPBDigestTimeline);
        objc_storeStrong((id *)(a1 + 24), v21);
        if (PBReaderPlaceMark() && ATXPBDigestTimelineReadFrom((uint64_t)v21, a2))
          goto LABEL_42;
        goto LABEL_48;
      case 0xAu:
        v21 = objc_alloc_init(ATXPBUserNotificationAppDigest);
        objc_msgSend((id)a1, "addAppDigests:", v21);
        if (PBReaderPlaceMark() && ATXPBUserNotificationAppDigestReadFrom(v21, a2))
        {
LABEL_42:
          PBReaderRecallMark();

LABEL_43:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_48:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_43;
    }
  }
}

void sub_1A4AC2C58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_7_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_8_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_1A4AC9284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{

}

void sub_1A4AC9FD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a12);
  va_start(va, a12);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

BOOL ATXPBNotificationQuietingSuggestionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  int v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v15;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  v6 = (int *)MEMORY[0x1E0D82BB8];
  while (1)
  {
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
      return v7 == 0;
    if (*(_BYTE *)(a2 + *v5))
    {
      v7 = 1;
      return v7 == 0;
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      LOBYTE(v10) = 0;
LABEL_14:
    if (v7)
      v15 = 1;
    else
      v15 = (v10 & 7) == 4;
    if (v15)
      return v7 == 0;
    if ((PBReaderSkipValueWithTag() & 1) == 0)
      return 0;
  }
}

void sub_1A4ACF6E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{

}

void sub_1A4AD10C4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15(uint64_t a1)
{

}

void sub_1A4AD161C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD1860(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD1B48(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD1DEC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD20B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD236C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD2640(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD2874(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD2A64(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD2DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD339C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD3904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52)
{
  _Block_object_dispose(&a52, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD3E78(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD4110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD42E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD4790(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD498C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD4C04(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD4FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD5418(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD57EC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD5B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD5E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD5F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD62C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD6610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD69FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD6DF4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD70A4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD72F4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD7518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD79AC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD7D4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD8060(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD844C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD87E8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD8B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD9068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a36, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD96EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD9AF4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD9CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AD9F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4ADA208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4ADA4EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4ADA810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4ADAB5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4ADAE0C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A4ADB154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4ADB4D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4ADB804(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A4ADBAE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4ADBEB0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A4ADC2FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A4ADC4EC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A4ADC6A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4ADCA38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4ADCCC4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A4ADCF50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A4ADD8BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A4ADDC88(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A4ADDEC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4ADE13C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4ADE3C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A4ADE538(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A4ADE714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4ADE8FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A4ADEAB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_10(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_8_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_9_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x20u);
}

void OUTLINED_FUNCTION_16(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t OUTLINED_FUNCTION_26(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t OUTLINED_FUNCTION_32()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_35(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x34u);
}

void OUTLINED_FUNCTION_36(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_37(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x2Au);
}

void OUTLINED_FUNCTION_39(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_40(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t OUTLINED_FUNCTION_41(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

int *OUTLINED_FUNCTION_42()
{
  return __error();
}

uint64_t OUTLINED_FUNCTION_43()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 32), "widgetFamily");
}

id ATXAllowedEngagementRecordManagerClasses()
{
  void *v0;
  void *v1;

  v0 = (void *)MEMORY[0x1A85A4F90]();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("ATXAction"), CFSTR("NSString"), CFSTR("ATXHeroData"), CFSTR("ATXInfoSuggestion"), CFSTR("ATXLinkActionContainer"), 0);
  objc_autoreleasePoolPop(v0);
  return v1;
}

ATXExecutableIdentifier *ATXExecutableIdentifierForSuggestion(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  Class v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  ATXExecutableIdentifier *v16;
  ATXExecutableIdentifier *v17;
  ATXExecutableIdentifier *v18;
  void *v19;
  void *v20;

  v1 = a1;
  v2 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(v1, "executableSpecification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executableObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    __atxlog_handle_default();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      ATXExecutableIdentifierForSuggestion_cold_1();
    goto LABEL_33;
  }
  objc_msgSend(v1, "executableSpecification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executableClassString");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = NSClassFromString(v6);

  if (v7 == (Class)objc_opt_class())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __atxlog_handle_default();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        ATXExecutableIdentifierForSuggestion_cold_2();
      goto LABEL_33;
    }
    v16 = -[ATXExecutableIdentifier initWithAction:]([ATXExecutableIdentifier alloc], "initWithAction:", v4);
  }
  else if (v7 == (Class)objc_opt_class())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __atxlog_handle_default();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        ATXExecutableIdentifierForSuggestion_cold_3();
      goto LABEL_33;
    }
    v16 = -[ATXExecutableIdentifier initWithString:]([ATXExecutableIdentifier alloc], "initWithString:", v4);
  }
  else if (v7 == (Class)objc_opt_class())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __atxlog_handle_default();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        ATXExecutableIdentifierForSuggestion_cold_4();
      goto LABEL_33;
    }
    v16 = -[ATXExecutableIdentifier initWithHeroAppPrediction:]([ATXExecutableIdentifier alloc], "initWithHeroAppPrediction:", v4);
  }
  else
  {
    if (v7 != (Class)objc_opt_class())
    {
      if (v7 != (Class)objc_opt_class())
      {
        __atxlog_handle_default();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
          ATXExecutableIdentifierForSuggestion_cold_7((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

        goto LABEL_34;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = -[ATXExecutableIdentifier initWithLinkAction:]([ATXExecutableIdentifier alloc], "initWithLinkAction:", v4);
        goto LABEL_28;
      }
      __atxlog_handle_default();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        ATXExecutableIdentifierForSuggestion_cold_6();
LABEL_33:

LABEL_34:
      v18 = [ATXExecutableIdentifier alloc];
      objc_msgSend(v1, "executableSpecification");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "executableIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[ATXExecutableIdentifier initWithString:](v18, "initWithString:", v20);

      goto LABEL_35;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __atxlog_handle_default();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        ATXExecutableIdentifierForSuggestion_cold_5();
      goto LABEL_33;
    }
    v16 = -[ATXExecutableIdentifier initWithInfoSuggestion:]([ATXExecutableIdentifier alloc], "initWithInfoSuggestion:", v4);
  }
LABEL_28:
  v17 = v16;
LABEL_35:

  objc_autoreleasePoolPop(v2);
  return v17;
}

id initializeDNDToggleDoNotDisturbIntent()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v0 = (void *)MEMORY[0x1A85A4F90]();
  loadIntentWithBundleIdAndName(CFSTR("com.apple.DoNotDisturb.Intents"), CFSTR("DNDToggleDoNotDisturbIntent"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "_setExtensionBundleId:", CFSTR("com.apple.DoNotDisturb.Intents"));
    objc_msgSend(MEMORY[0x1E0CBD958], "imageNamed:", CFSTR("DoNotDisturb"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setBundleIdentifier:", CFSTR("com.apple.DoNotDisturb.Intents"));
    objc_msgSend(v2, "setImage:forParameterNamed:", v3, CFSTR("state"));
    v4 = objc_alloc(MEMORY[0x1E0CBDA08]);
    DNDModeLocalizedNameForSemanticType();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithIdentifier:displayString:", CFSTR("com.apple.donotdisturb.mode.default"), v5);
    objc_msgSend(v2, "setValue:forKey:", v6, CFSTR("mode"));

    v7 = v2;
  }

  objc_autoreleasePoolPop(v0);
  return v2;
}

id personFromCallRecipient(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v5 = a2;
  v6 = a3;
  v7 = a1;
  v8 = objc_msgSend(v5, "containsString:", CFSTR("@"));
  __atxlog_handle_heuristic();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10)
      personFromCallRecipient_cold_1();
    v11 = 1;
  }
  else
  {
    if (v10)
      personFromCallRecipient_cold_2();
    v11 = 2;
  }

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA60]), "initWithValue:type:", v5, v11);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA58]), "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:", v12, 0, v6, 0, v7, v5);

  return v13;
}

NSObject *loadIntentWithBundleIdAndName(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v13;

  v3 = a1;
  v4 = a2;
  v13 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5848]), "initWithBundleIdentifier:error:", v3, &v13);
  v6 = v13;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CBDB38], "schemaWithBundleRecord:fallbackToSystemSchema:", v5, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBD970]), "_initWithIdentifier:schema:name:data:", 0, v7, v4, 0);
      v9 = v8;
      if (v8)
      {
        v9 = v8;
        v10 = v9;
      }
      else
      {
        __atxlog_handle_heuristic();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          loadIntentWithBundleIdAndName_cold_3();

        v10 = 0;
      }
    }
    else
    {
      __atxlog_handle_heuristic();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        loadIntentWithBundleIdAndName_cold_2();
      v10 = 0;
    }

  }
  else
  {
    __atxlog_handle_heuristic();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      loadIntentWithBundleIdAndName_cold_1();
    v10 = 0;
  }

  return v10;
}

void sub_1A4AE12DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AE175C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMTUpdateAlarmIntentClass_block_invoke(uint64_t a1)
{
  Class result;

  MobileTimerLibrary();
  result = objc_getClass("MTUpdateAlarmIntent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getMTUpdateAlarmIntentClass_block_invoke_cold_1();
  getMTUpdateAlarmIntentClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void MobileTimerLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!MobileTimerLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_1E4D5BE70;
    v2 = 0;
    MobileTimerLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!MobileTimerLibraryCore_frameworkLibrary)
    MobileTimerLibrary_cold_1(&v0);
}

Class __getMTCreateAlarmIntentClass_block_invoke(uint64_t a1)
{
  Class result;

  MobileTimerLibrary();
  result = objc_getClass("MTCreateAlarmIntent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getMTCreateAlarmIntentClass_block_invoke_cold_1();
  getMTCreateAlarmIntentClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_1_11(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  NSObject *v11;

  _os_log_debug_impl(a1, v11, OS_LOG_TYPE_DEBUG, a4, &buf, 0x20u);
}

uint64_t OUTLINED_FUNCTION_3_8()
{
  void *v0;

  return objc_msgSend(v0, "captureType");
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  uint64_t v0;

  return v0;
}

void sub_1A4AE37A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AE4A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{

}

void sub_1A4AE4DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ATXPBSpotlightEventReadFrom(uint64_t a1, uint64_t a2)
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
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  ATXPBSpotlightEventMetadata *v32;

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
        *(_BYTE *)(a1 + 80) |= 1u;
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
        goto LABEL_50;
      case 2u:
        v22 = 0;
        v23 = 0;
        v24 = 0;
        *(_BYTE *)(a1 + 80) |= 2u;
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
                goto LABEL_47;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v24) = 0;
LABEL_47:
        *(_DWORD *)(a1 + 64) = v24;
        goto LABEL_50;
      case 3u:
        PBReaderReadString();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = 48;
        goto LABEL_35;
      case 4u:
        PBReaderReadString();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = 24;
        goto LABEL_35;
      case 5u:
        PBReaderReadString();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = 40;
        goto LABEL_35;
      case 6u:
        PBReaderReadString();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = 16;
LABEL_35:
        v31 = *(void **)(a1 + v30);
        *(_QWORD *)(a1 + v30) = v29;

        goto LABEL_50;
      case 7u:
        PBReaderReadString();
        v32 = (ATXPBSpotlightEventMetadata *)objc_claimAutoreleasedReturnValue();
        if (v32)
          -[ATXPBSpotlightEvent addAppSuggestionIds:](a1, v32);
        goto LABEL_43;
      case 8u:
        PBReaderReadString();
        v32 = (ATXPBSpotlightEventMetadata *)objc_claimAutoreleasedReturnValue();
        if (v32)
          -[ATXPBSpotlightEvent addActionSuggestionIds:](a1, v32);
        goto LABEL_43;
      case 9u:
        v32 = objc_alloc_init(ATXPBSpotlightEventMetadata);
        objc_storeStrong((id *)(a1 + 72), v32);
        if (PBReaderPlaceMark() && (ATXPBSpotlightEventMetadataReadFrom((uint64_t)v32, a2) & 1) != 0)
        {
          PBReaderRecallMark();
LABEL_43:

LABEL_50:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_50;
    }
  }
}

BOOL ATXPBDigestTimelineReadFrom(uint64_t a1, uint64_t a2)
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
          *(_BYTE *)(a1 + 40) |= 8u;
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
          v27 = &OBJC_IVAR___ATXPBDigestTimeline__firstUpcomingViewTimestamp;
          goto LABEL_41;
        case 2u:
          *(_BYTE *)(a1 + 40) |= 2u;
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
          v27 = &OBJC_IVAR___ATXPBDigestTimeline__firstCollapsedViewTimestamp;
          goto LABEL_41;
        case 3u:
          *(_BYTE *)(a1 + 40) |= 4u;
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
          v27 = &OBJC_IVAR___ATXPBDigestTimeline__firstScheduledViewTimestamp;
          goto LABEL_41;
        case 4u:
          *(_BYTE *)(a1 + 40) |= 1u;
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
          v27 = &OBJC_IVAR___ATXPBDigestTimeline__digestRemovedTimestamp;
LABEL_41:
          *(_QWORD *)(a1 + *v27) = v20;
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

ATXComplication *ATXComplicationFromCHSWidget(void *a1)
{
  id v1;
  ATXComplication *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  ATXComplication *v11;

  if (a1)
  {
    v1 = a1;
    v2 = [ATXComplication alloc];
    objc_msgSend(v1, "extensionIdentity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "extensionBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "kind");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "extensionIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "containerBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v1, "family");
    objc_msgSend(v1, "intentReference");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "intent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ATXComplication initWithExtensionBundleIdentifier:kind:containerBundleIdentifier:widgetFamily:intent:source:](v2, "initWithExtensionBundleIdentifier:kind:containerBundleIdentifier:widgetFamily:intent:source:", v4, v5, v7, v8, v10, 0);

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

id CHSWidgetFromATXComplication(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (a1)
  {
    v1 = (objc_class *)MEMORY[0x1E0D10148];
    v2 = a1;
    v3 = [v1 alloc];
    v4 = objc_alloc(MEMORY[0x1E0D10038]);
    objc_msgSend(v2, "extensionBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "containerBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", v5, v6, 0);
    objc_msgSend(v2, "kind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v2, "widgetFamily");
    objc_msgSend(v2, "intent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(v3, "initWithExtensionIdentity:kind:family:intent:activityIdentifier:", v7, v8, v9, v10, 0);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

id errorWithDescription(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v1 = (objc_class *)MEMORY[0x1E0CB35C8];
  v2 = a1;
  v3 = [v1 alloc];
  v7 = *MEMORY[0x1E0CB2D50];
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(v3, "initWithDomain:code:userInfo:", CFSTR("ATXComplication"), 1, v4);
  return v5;
}

void OUTLINED_FUNCTION_4_3(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

BOOL ATXPBNotificationSmartPauseSuggestionReadFrom(uint64_t a1, uint64_t a2)
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
        v23 = &OBJC_IVAR___ATXPBNotificationSmartPauseSuggestion__expirationTimestamp;
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
    v23 = &OBJC_IVAR___ATXPBNotificationSmartPauseSuggestion__pauseDuration;
    goto LABEL_32;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

uint64_t ATXPBUserNotificationLoggingEventReadFrom(uint64_t a1, uint64_t a2)
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
  ATXPBUserNotification *v18;
  uint64_t result;
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
  void *v31;
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
          v18 = objc_alloc_init(ATXPBUserNotification);
          objc_storeStrong((id *)(a1 + 40), v18);
          if (PBReaderPlaceMark() && (ATXPBUserNotificationReadFrom((uint64_t)v18, a2) & 1) != 0)
          {
            PBReaderRecallMark();

            continue;
          }

          return 0;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 48) |= 8u;
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
              goto LABEL_50;
            v20 += 7;
            v15 = v21++ >= 9;
            if (v15)
            {
              LODWORD(v22) = 0;
              goto LABEL_52;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_50:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_52:
          v44 = 24;
          goto LABEL_61;
        case 3u:
          *(_BYTE *)(a1 + 48) |= 1u;
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
          *(_QWORD *)(a1 + 8) = v29;
          continue;
        case 4u:
          PBReaderReadString();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = *(void **)(a1 + 32);
          *(_QWORD *)(a1 + 32) = v30;

          continue;
        case 5u:
          v32 = 0;
          v33 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 48) |= 2u;
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
              v22 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v15 = v33++ >= 9;
                if (v15)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_56:
          v44 = 16;
          goto LABEL_61;
        case 6u:
          v38 = 0;
          v39 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 48) |= 4u;
          break;
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
        v22 |= (unint64_t)(v43 & 0x7F) << v38;
        if ((v43 & 0x80) == 0)
          goto LABEL_58;
        v38 += 7;
        v15 = v39++ >= 9;
        if (v15)
        {
          LODWORD(v22) = 0;
          goto LABEL_60;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_58:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v22) = 0;
LABEL_60:
      v44 = 20;
LABEL_61:
      *(_DWORD *)(a1 + v44) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1A4AEDCDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AF2F90(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A4AF3FD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17(uint64_t a1)
{

}

void sub_1A4AF56B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18(uint64_t a1)
{

}

void sub_1A4AF578C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AF584C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AF590C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AF7240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ATXPBUserNotificationModelScoreReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  uint64_t v34;

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
          v19 = 32;
          goto LABEL_37;
        case 2u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 56) |= 1u;
          break;
        case 3u:
          *(_BYTE *)(a1 + 56) |= 2u;
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
          v34 = 16;
          goto LABEL_46;
        case 4u:
          *(_BYTE *)(a1 + 56) |= 4u;
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
          v34 = 24;
LABEL_46:
          *(_QWORD *)(a1 + v34) = v30;
          continue;
        case 5u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 48;
          goto LABEL_37;
        case 6u:
          PBReaderReadData();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 40;
LABEL_37:
          v33 = *(void **)(a1 + v19);
          *(_QWORD *)(a1 + v19) = v18;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v24 = *v3;
        v25 = *(_QWORD *)(a2 + v24);
        v26 = v25 + 1;
        if (v25 == -1 || v26 > *(_QWORD *)(a2 + *v4))
          break;
        v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
        *(_QWORD *)(a2 + v24) = v26;
        v23 |= (unint64_t)(v27 & 0x7F) << v21;
        if ((v27 & 0x80) == 0)
          goto LABEL_39;
        v21 += 7;
        v15 = v22++ >= 9;
        if (v15)
        {
          v23 = 0;
          goto LABEL_41;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
      if (*(_BYTE *)(a2 + *v5))
        v23 = 0;
LABEL_41:
      *(_QWORD *)(a1 + 8) = v23;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

const __CFString *NSStringFromATXSuggestedPageType(unint64_t a1)
{
  if (a1 > 0xC)
    return CFSTR("Unknown");
  else
    return off_1E4D5C4E0[a1];
}

void sub_1A4AFA3B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AFA494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AFA570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4AFA940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A4AFACFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19(uint64_t a1)
{

}

id keyForStrings(void *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = a1;
  v6 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("%@-%@"), v5, v4);

  return v6;
}

id extensionBundleIdAndKindKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  objc_msgSend(v1, "extensionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  keyForStrings(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_1A4AFFC24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *ATXNotificationSuggestionScopeToString(uint64_t a1)
{
  if (a1 < 6)
    return *(&off_1E4D5C740 + (int)a1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *ATXSuggestionTypeToString(uint64_t a1)
{
  if (a1 < 0xB)
    return *(&off_1E4D5C770 + (int)a1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *ATXNotificationSuggestionEventTypeToString(uint64_t a1)
{
  if (a1 < 0xA)
    return *(&off_1E4D5C7C8 + (int)a1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *ATXNotificationGroupEventTypeToString(uint64_t a1)
{
  if (a1 < 0x16)
    return *(&off_1E4D5C818 + (int)a1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_6_5(uint64_t a1)
{
  return *(_QWORD *)a1;
}

const __CFString *ATXStringForStackLayoutSize(unint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 < 5)
    return *(&off_1E4D5C8C8 + a1);
  __atxlog_handle_home_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    ATXStringForStackLayoutSize_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  return CFSTR("Unknown");
}

const __CFString *ATXStringForStackKind(unint64_t a1)
{
  if (a1 > 7)
    return CFSTR("ATXStackLayoutKindPinnedWidget");
  else
    return *(&off_1E4D5C8F0 + a1);
}

const __CFString *ATXStringForStackLocation(unint64_t a1)
{
  if (a1 > 5)
    return CFSTR("ATXStackLayoutLocationTodayPage");
  else
    return *(&off_1E4D5C930 + a1);
}

const __CFString *ATXCAStringForStackLocation(unint64_t a1)
{
  if (a1 > 5)
    return CFSTR("TodayPage");
  else
    return *(&off_1E4D5C960 + a1);
}

const __CFString *ATXCAStringForStackLayoutSize(unint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 < 5)
    return *(&off_1E4D5C990 + a1);
  __atxlog_handle_home_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    ATXCAStringForStackLayoutSize_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  return CFSTR("Unknown");
}

uint64_t ATXStackLayoutSizeForNSString(void *a1)
{
  id v1;
  uint64_t v2;
  NSObject *v4;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ATXStackLayoutSize2x2")) & 1) == 0)
  {
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ATXStackLayoutSize2x4")) & 1) != 0)
    {
      v2 = 1;
      goto LABEL_11;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ATXStackLayoutSize4x4")) & 1) != 0)
    {
      v2 = 2;
      goto LABEL_11;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ATXStackLayoutSize6x4")) & 1) != 0)
    {
      v2 = 3;
      goto LABEL_11;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ATXStackLayoutSize4x8")) & 1) != 0)
    {
      v2 = 4;
      goto LABEL_11;
    }
    __atxlog_handle_home_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      ATXStackLayoutSizeForNSString_cold_1((uint64_t)v1, v4);

  }
  v2 = 0;
LABEL_11:

  return v2;
}

BOOL ATXStackLocationIsTodayPage(unint64_t a1)
{
  return a1 > 5 || (a1 & 0x3F) == 1;
}

uint64_t ATXStackLocationForPageAndIndex(void *a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(a1, "pageIndex");
  v4 = a2 + 2;
  if (a2 >= 3)
    v4 = 5;
  if (v3 == 20000)
    return 1;
  else
    return v4;
}

uint64_t ATXStackKindForStack(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = a1;
  objc_msgSend(v1, "widgets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3 == 1)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v1, "allowsSmartRotate") && (objc_msgSend(v1, "allowsNewWidget") & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v1, "allowsSmartRotate") && !objc_msgSend(v1, "allowsNewWidget"))
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v1, "allowsSmartRotate") & 1) != 0 || (objc_msgSend(v1, "allowsNewWidget") & 1) == 0)
  {
    v4 = 7;
  }
  else
  {
    v4 = 5;
  }

  return v4;
}

BOOL ATXStackLocationIsHomeScreen(uint64_t a1)
{
  return (unint64_t)(a1 - 2) < 4;
}

uint64_t CHSWidgetFamilyFromATXStackLayoutSize(unint64_t a1)
{
  if (a1 > 4)
    return 0;
  else
    return qword_1A4B67088[a1];
}

uint64_t ATXStackLayoutSizeFromCHSWidgetFamily(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) > 4)
    return 0;
  else
    return qword_1A4B670B0[a1 - 2];
}

void sub_1A4B03FA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAVSystemControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!MediaExperienceLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E4D5C9B8;
    v5 = 0;
    MediaExperienceLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!MediaExperienceLibraryCore_frameworkLibrary)
    __getAVSystemControllerClass_block_invoke_cold_1(&v3);
  result = objc_getClass("AVSystemController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAVSystemControllerClass_block_invoke_cold_2();
  getAVSystemControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ATXPBHomeScreenWidgetIdentifiableReadFrom(uint64_t a1, uint64_t a2)
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
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  void *v45;
  BOOL v46;
  uint64_t v47;

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
          v19 = 24;
          goto LABEL_51;
        case 2u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 56;
          goto LABEL_51;
        case 3u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 16;
          goto LABEL_51;
        case 4u:
          PBReaderReadData();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 32;
          goto LABEL_51;
        case 5u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 64;
          goto LABEL_51;
        case 6u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 76) |= 2u;
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
                  goto LABEL_55;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v23) = 0;
LABEL_55:
          *(_DWORD *)(a1 + 48) = v23;
          continue;
        case 7u:
          v28 = 0;
          v29 = 0;
          v30 = 0;
          *(_BYTE *)(a1 + 76) |= 8u;
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
                  v30 = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v30 = 0;
LABEL_59:
          v46 = v30 != 0;
          v47 = 73;
          goto LABEL_64;
        case 8u:
          v35 = 0;
          v36 = 0;
          v37 = 0;
          *(_BYTE *)(a1 + 76) |= 4u;
          break;
        case 9u:
          *(_BYTE *)(a1 + 76) |= 1u;
          v42 = *v3;
          v43 = *(_QWORD *)(a2 + v42);
          if (v43 <= 0xFFFFFFFFFFFFFFF7 && v43 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v44 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v43);
            *(_QWORD *)(a2 + v42) = v43 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v44 = 0;
          }
          *(_QWORD *)(a1 + 8) = v44;
          continue;
        case 0xAu:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 40;
LABEL_51:
          v45 = *(void **)(a1 + v19);
          *(_QWORD *)(a1 + v19) = v18;

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
        v40 = v39 + 1;
        if (v39 == -1 || v40 > *(_QWORD *)(a2 + *v4))
          break;
        v41 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v39);
        *(_QWORD *)(a2 + v38) = v40;
        v37 |= (unint64_t)(v41 & 0x7F) << v35;
        if ((v41 & 0x80) == 0)
          goto LABEL_61;
        v35 += 7;
        v15 = v36++ >= 9;
        if (v15)
        {
          v37 = 0;
          goto LABEL_63;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_61:
      if (*(_BYTE *)(a2 + *v5))
        v37 = 0;
LABEL_63:
      v46 = v37 != 0;
      v47 = 72;
LABEL_64:
      *(_BYTE *)(a1 + v47) = v46;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id ATXTimeIntelligenceInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7A7AF8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1A85A4F90]();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_predictedTimelineWithDate_completionHandler_, 0, 0);

  v3 = (void *)MEMORY[0x1A85A4F90]();
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  v5 = objc_opt_class();
  v6 = (void *)objc_msgSend(v4, "initWithObjects:", v5, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v3);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_predictedTimelineWithDate_completionHandler_, 0, 1);

  v7 = (void *)MEMORY[0x1A85A4F90]();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_predictedDailyOverviewWithDate_options_completionHandler_, 0, 0);

  v9 = (void *)MEMORY[0x1A85A4F90]();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v9);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_predictedDailyOverviewWithDate_options_completionHandler_, 1, 0);

  v11 = (void *)MEMORY[0x1A85A4F90]();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v11);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_predictedDailyOverviewWithDate_options_completionHandler_, 0, 1);

  v13 = (void *)MEMORY[0x1A85A4F90]();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v13);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_predictedFreeMomentsWithDateRange_options_completionHandler_, 0, 0);

  v15 = (void *)MEMORY[0x1A85A4F90]();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v15);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_predictedFreeMomentsWithDateRange_options_completionHandler_, 1, 0);

  v17 = (void *)MEMORY[0x1A85A4F90]();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v17);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_predictedFreeMomentsWithDateRange_options_completionHandler_, 0, 1);

  v19 = (void *)MEMORY[0x1A85A4F90]();
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v19);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_computeDailySummaryWithDate_completionHandler_, 0, 0);

  v21 = (void *)MEMORY[0x1A85A4F90]();
  v22 = objc_alloc(MEMORY[0x1E0C99E60]);
  v23 = objc_opt_class();
  v24 = (void *)objc_msgSend(v22, "initWithObjects:", v23, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v21);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_computeDailySummaryWithDate_completionHandler_, 0, 1);

  v25 = (void *)MEMORY[0x1A85A4F90]();
  v26 = objc_alloc(MEMORY[0x1E0C99E60]);
  v27 = objc_opt_class();
  v28 = (void *)objc_msgSend(v26, "initWithObjects:", v27, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v25);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v28, sel_computeCompactTimeSummaryWithOptions_completionHandler_, 0, 1);

  v29 = (void *)MEMORY[0x1A85A4F90]();
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v29);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_invokeActionWithIdentifier_forEvent_completionHandler_, 1, 0);

  v31 = (void *)MEMORY[0x1A85A4F90]();
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v31);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_invokeFeedbackOption_forEvent_referenceDate_completionHandler_, 0, 0);

  v33 = (void *)MEMORY[0x1A85A4F90]();
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v33);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v34, sel_invokeFeedbackOption_forEvent_referenceDate_completionHandler_, 1, 0);

  v35 = (void *)MEMORY[0x1A85A4F90]();
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v35);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v36, sel_rescheduleEvent_proposedDate_referenceDate_completionHandler_, 0, 0);

  v37 = (void *)MEMORY[0x1A85A4F90]();
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v37);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_rescheduleEvent_proposedDate_referenceDate_completionHandler_, 1, 0);

  v39 = (void *)MEMORY[0x1A85A4F90]();
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v39);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v40, sel_savePinnedTimeEvent_completionHandler_, 0, 0);

  v41 = (void *)MEMORY[0x1A85A4F90]();
  v42 = objc_alloc(MEMORY[0x1E0C99E60]);
  v43 = objc_opt_class();
  v44 = (void *)objc_msgSend(v42, "initWithObjects:", v43, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v41);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v44, sel_loadPinnedTimeEventsWithCompletionHandler_, 0, 1);

  v45 = (void *)MEMORY[0x1A85A4F90]();
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v45);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v46, sel_saveScheduledPinnedTimeEvent_completionHandler_, 0, 0);

  v47 = (void *)MEMORY[0x1A85A4F90]();
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v47);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v48, sel_logDidInvokeWidgetForEvent_completionHandler_, 0, 0);

  return v0;
}

uint64_t ATXTimeIntelligenceClientInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7A76F8);
}

id __atxlog_handle_xpc()
{
  if (__atxlog_handle_xpc_onceToken != -1)
    dispatch_once(&__atxlog_handle_xpc_onceToken, &__block_literal_global_3_4);
  return (id)__atxlog_handle_xpc_log;
}

void ____atxlog_handle_xpc_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "xpc");
  v1 = (void *)__atxlog_handle_xpc_log;
  __atxlog_handle_xpc_log = (uint64_t)v0;

}

id __atxlog_handle_heuristic()
{
  if (__atxlog_handle_heuristic_onceToken != -1)
    dispatch_once(&__atxlog_handle_heuristic_onceToken, &__block_literal_global_5_3);
  return (id)__atxlog_handle_heuristic_log;
}

void ____atxlog_handle_heuristic_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "heuristic");
  v1 = (void *)__atxlog_handle_heuristic_log;
  __atxlog_handle_heuristic_log = (uint64_t)v0;

}

id __atxlog_handle_notifications()
{
  if (__atxlog_handle_notifications_onceToken != -1)
    dispatch_once(&__atxlog_handle_notifications_onceToken, &__block_literal_global_7_2);
  return (id)__atxlog_handle_notifications_log;
}

void ____atxlog_handle_notifications_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "notifications");
  v1 = (void *)__atxlog_handle_notifications_log;
  __atxlog_handle_notifications_log = (uint64_t)v0;

}

id __atxlog_handle_pmm()
{
  if (__atxlog_handle_pmm_onceToken != -1)
    dispatch_once(&__atxlog_handle_pmm_onceToken, &__block_literal_global_9_3);
  return (id)__atxlog_handle_pmm_log;
}

void ____atxlog_handle_pmm_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.mm", "GENERAL");
  v1 = (void *)__atxlog_handle_pmm_log;
  __atxlog_handle_pmm_log = (uint64_t)v0;

}

id __atxlog_handle_dailyroutines()
{
  if (__atxlog_handle_dailyroutines_onceToken != -1)
    dispatch_once(&__atxlog_handle_dailyroutines_onceToken, &__block_literal_global_12_2);
  return (id)__atxlog_handle_dailyroutines_log;
}

void ____atxlog_handle_dailyroutines_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "dailyroutines");
  v1 = (void *)__atxlog_handle_dailyroutines_log;
  __atxlog_handle_dailyroutines_log = (uint64_t)v0;

}

void ____atxlog_handle_feedback_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "feedback");
  v1 = (void *)__atxlog_handle_feedback_log;
  __atxlog_handle_feedback_log = (uint64_t)v0;

}

id __atxlog_handle_modes()
{
  if (__atxlog_handle_modes_onceToken != -1)
    dispatch_once(&__atxlog_handle_modes_onceToken, &__block_literal_global_16);
  return (id)__atxlog_handle_modes_log;
}

void ____atxlog_handle_modes_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "modes");
  v1 = (void *)__atxlog_handle_modes_log;
  __atxlog_handle_modes_log = (uint64_t)v0;

}

id __atxlog_handle_hero()
{
  if (__atxlog_handle_hero_onceToken != -1)
    dispatch_once(&__atxlog_handle_hero_onceToken, &__block_literal_global_18_2);
  return (id)__atxlog_handle_hero_log;
}

void ____atxlog_handle_hero_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "hero");
  v1 = (void *)__atxlog_handle_hero_log;
  __atxlog_handle_hero_log = (uint64_t)v0;

}

id __atxlog_handle_deletions()
{
  if (__atxlog_handle_deletions_onceToken != -1)
    dispatch_once(&__atxlog_handle_deletions_onceToken, &__block_literal_global_20);
  return (id)__atxlog_handle_deletions_log;
}

void ____atxlog_handle_deletions_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "deletions");
  v1 = (void *)__atxlog_handle_deletions_log;
  __atxlog_handle_deletions_log = (uint64_t)v0;

}

id __atxlog_handle_gi()
{
  if (__atxlog_handle_gi_onceToken != -1)
    dispatch_once(&__atxlog_handle_gi_onceToken, &__block_literal_global_22_1);
  return (id)__atxlog_handle_gi_log;
}

void ____atxlog_handle_gi_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "information");
  v1 = (void *)__atxlog_handle_gi_log;
  __atxlog_handle_gi_log = (uint64_t)v0;

}

id __atxlog_handle_timeline()
{
  if (__atxlog_handle_timeline_onceToken != -1)
    dispatch_once(&__atxlog_handle_timeline_onceToken, &__block_literal_global_24_3);
  return (id)__atxlog_handle_timeline_log;
}

void ____atxlog_handle_timeline_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "timeline");
  v1 = (void *)__atxlog_handle_timeline_log;
  __atxlog_handle_timeline_log = (uint64_t)v0;

}

id __atxlog_handle_relevant_shortcut()
{
  if (__atxlog_handle_relevant_shortcut_onceToken != -1)
    dispatch_once(&__atxlog_handle_relevant_shortcut_onceToken, &__block_literal_global_26_1);
  return (id)__atxlog_handle_relevant_shortcut_log;
}

void ____atxlog_handle_relevant_shortcut_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "relevant_shortcut");
  v1 = (void *)__atxlog_handle_relevant_shortcut_log;
  __atxlog_handle_relevant_shortcut_log = (uint64_t)v0;

}

id __atxlog_handle_relevance_model()
{
  if (__atxlog_handle_relevance_model_onceToken != -1)
    dispatch_once(&__atxlog_handle_relevance_model_onceToken, &__block_literal_global_28_2);
  return (id)__atxlog_handle_relevance_model_log;
}

void ____atxlog_handle_relevance_model_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "relevance_model");
  v1 = (void *)__atxlog_handle_relevance_model_log;
  __atxlog_handle_relevance_model_log = (uint64_t)v0;

}

id __atxlog_handle_watch()
{
  if (__atxlog_handle_watch_onceToken != -1)
    dispatch_once(&__atxlog_handle_watch_onceToken, &__block_literal_global_30_1);
  return (id)__atxlog_handle_watch_log;
}

void ____atxlog_handle_watch_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "watch");
  v1 = (void *)__atxlog_handle_watch_log;
  __atxlog_handle_watch_log = (uint64_t)v0;

}

id __atxlog_handle_blending_internal_cache()
{
  if (__atxlog_handle_blending_internal_cache_onceToken != -1)
    dispatch_once(&__atxlog_handle_blending_internal_cache_onceToken, &__block_literal_global_36_0);
  return (id)__atxlog_handle_blending_internal_cache_log;
}

void ____atxlog_handle_blending_internal_cache_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "blending_internal_cache");
  v1 = (void *)__atxlog_handle_blending_internal_cache_log;
  __atxlog_handle_blending_internal_cache_log = (uint64_t)v0;

}

id __atxlog_handle_blending_ecosystem()
{
  if (__atxlog_handle_blending_ecosystem_onceToken != -1)
    dispatch_once(&__atxlog_handle_blending_ecosystem_onceToken, &__block_literal_global_38);
  return (id)__atxlog_handle_blending_ecosystem_log;
}

void ____atxlog_handle_blending_ecosystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "blending_ecosystem");
  v1 = (void *)__atxlog_handle_blending_ecosystem_log;
  __atxlog_handle_blending_ecosystem_log = (uint64_t)v0;

}

void ____atxlog_handle_home_screen_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "homescreen");
  v1 = (void *)__atxlog_handle_home_screen_log;
  __atxlog_handle_home_screen_log = (uint64_t)v0;

}

id __atxlog_handle_sleep_schedule()
{
  if (__atxlog_handle_sleep_schedule_onceToken != -1)
    dispatch_once(&__atxlog_handle_sleep_schedule_onceToken, &__block_literal_global_42);
  return (id)__atxlog_handle_sleep_schedule_log;
}

void ____atxlog_handle_sleep_schedule_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "sleepschedule");
  v1 = (void *)__atxlog_handle_sleep_schedule_log;
  __atxlog_handle_sleep_schedule_log = (uint64_t)v0;

}

id __atxlog_handle_lock_screen()
{
  if (__atxlog_handle_lock_screen_onceToken != -1)
    dispatch_once(&__atxlog_handle_lock_screen_onceToken, &__block_literal_global_44_1);
  return (id)__atxlog_handle_lock_screen_log;
}

void ____atxlog_handle_lock_screen_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "lockscreen");
  v1 = (void *)__atxlog_handle_lock_screen_log;
  __atxlog_handle_lock_screen_log = (uint64_t)v0;

}

id __atxlog_handle_anchor()
{
  if (__atxlog_handle_anchor_onceToken != -1)
    dispatch_once(&__atxlog_handle_anchor_onceToken, &__block_literal_global_46_0);
  return (id)__atxlog_handle_anchor_log;
}

void ____atxlog_handle_anchor_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "anchor");
  v1 = (void *)__atxlog_handle_anchor_log;
  __atxlog_handle_anchor_log = (uint64_t)v0;

}

id __atxlog_handle_app_prediction()
{
  if (__atxlog_handle_app_prediction_onceToken != -1)
    dispatch_once(&__atxlog_handle_app_prediction_onceToken, &__block_literal_global_48_0);
  return (id)__atxlog_handle_app_prediction_log;
}

void ____atxlog_handle_app_prediction_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "app_prediction");
  v1 = (void *)__atxlog_handle_app_prediction_log;
  __atxlog_handle_app_prediction_log = (uint64_t)v0;

}

id __atxlog_handle_action_prediction()
{
  if (__atxlog_handle_action_prediction_onceToken != -1)
    dispatch_once(&__atxlog_handle_action_prediction_onceToken, &__block_literal_global_50_0);
  return (id)__atxlog_handle_action_prediction_log;
}

void ____atxlog_handle_action_prediction_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "action_prediction");
  v1 = (void *)__atxlog_handle_action_prediction_log;
  __atxlog_handle_action_prediction_log = (uint64_t)v0;

}

void ____atxlog_handle_app_library_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "app_library");
  v1 = (void *)__atxlog_handle_app_library_log;
  __atxlog_handle_app_library_log = (uint64_t)v0;

}

id __atxlog_handle_app_install()
{
  if (__atxlog_handle_app_install_onceToken != -1)
    dispatch_once(&__atxlog_handle_app_install_onceToken, &__block_literal_global_54_1);
  return (id)__atxlog_handle_app_install_log;
}

void ____atxlog_handle_app_install_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "app_install");
  v1 = (void *)__atxlog_handle_app_install_log;
  __atxlog_handle_app_install_log = (uint64_t)v0;

}

id __atxlog_handle_backup()
{
  if (__atxlog_handle_backup_onceToken != -1)
    dispatch_once(&__atxlog_handle_backup_onceToken, &__block_literal_global_56_0);
  return (id)__atxlog_handle_backup_log;
}

void ____atxlog_handle_backup_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "backup");
  v1 = (void *)__atxlog_handle_backup_log;
  __atxlog_handle_backup_log = (uint64_t)v0;

}

id __atxlog_handle_trial_assets()
{
  if (__atxlog_handle_trial_assets_onceToken != -1)
    dispatch_once(&__atxlog_handle_trial_assets_onceToken, &__block_literal_global_60);
  return (id)__atxlog_handle_trial_assets_log;
}

void ____atxlog_handle_trial_assets_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "trial_assets");
  v1 = (void *)__atxlog_handle_trial_assets_log;
  __atxlog_handle_trial_assets_log = (uint64_t)v0;

}

id __atxlog_handle_notification_management()
{
  if (__atxlog_handle_notification_management_onceToken != -1)
    dispatch_once(&__atxlog_handle_notification_management_onceToken, &__block_literal_global_62);
  return (id)__atxlog_handle_notification_management_log;
}

void ____atxlog_handle_notification_management_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "notification_management");
  v1 = (void *)__atxlog_handle_notification_management_log;
  __atxlog_handle_notification_management_log = (uint64_t)v0;

}

id __atxlog_handle_contextual_actions()
{
  if (__atxlog_handle_contextual_actions_onceToken != -1)
    dispatch_once(&__atxlog_handle_contextual_actions_onceToken, &__block_literal_global_64_1);
  return (id)__atxlog_handle_contextual_actions_log;
}

void ____atxlog_handle_contextual_actions_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "contextual_actions");
  v1 = (void *)__atxlog_handle_contextual_actions_log;
  __atxlog_handle_contextual_actions_log = (uint64_t)v0;

}

id __atxlog_handle_intents_helper()
{
  if (__atxlog_handle_intents_helper_onceToken != -1)
    dispatch_once(&__atxlog_handle_intents_helper_onceToken, &__block_literal_global_66_1);
  return (id)__atxlog_handle_intents_helper_log;
}

void ____atxlog_handle_intents_helper_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "intents_helper");
  v1 = (void *)__atxlog_handle_intents_helper_log;
  __atxlog_handle_intents_helper_log = (uint64_t)v0;

}

id __atxlog_handle_context_heuristic()
{
  if (__atxlog_handle_context_heuristic_onceToken != -1)
    dispatch_once(&__atxlog_handle_context_heuristic_onceToken, &__block_literal_global_68_0);
  return (id)__atxlog_handle_context_heuristic_log;
}

void ____atxlog_handle_context_heuristic_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "context_heuristic");
  v1 = (void *)__atxlog_handle_context_heuristic_log;
  __atxlog_handle_context_heuristic_log = (uint64_t)v0;

}

id __atxlog_handle_zkw_hide()
{
  if (__atxlog_handle_zkw_hide_onceToken != -1)
    dispatch_once(&__atxlog_handle_zkw_hide_onceToken, &__block_literal_global_70);
  return (id)__atxlog_handle_zkw_hide_log;
}

void ____atxlog_handle_zkw_hide_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "zkw_hide");
  v1 = (void *)__atxlog_handle_zkw_hide_log;
  __atxlog_handle_zkw_hide_log = (uint64_t)v0;

}

id __atxlog_handle_context_user_education_suggestions()
{
  if (__atxlog_handle_context_user_education_suggestions_onceToken != -1)
    dispatch_once(&__atxlog_handle_context_user_education_suggestions_onceToken, &__block_literal_global_72);
  return (id)__atxlog_handle_context_user_education_suggestions_log;
}

void ____atxlog_handle_context_user_education_suggestions_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "user_education_suggestions");
  v1 = (void *)__atxlog_handle_context_user_education_suggestions_log;
  __atxlog_handle_context_user_education_suggestions_log = (uint64_t)v0;

}

id __atxlog_handle_time_intelligence()
{
  if (__atxlog_handle_time_intelligence_onceToken != -1)
    dispatch_once(&__atxlog_handle_time_intelligence_onceToken, &__block_literal_global_74_0);
  return (id)__atxlog_handle_time_intelligence_log;
}

void ____atxlog_handle_time_intelligence_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "time");
  v1 = (void *)__atxlog_handle_time_intelligence_log;
  __atxlog_handle_time_intelligence_log = (uint64_t)v0;

}

id __atxlog_handle_contextual_engine()
{
  if (__atxlog_handle_contextual_engine_onceToken != -1)
    dispatch_once(&__atxlog_handle_contextual_engine_onceToken, &__block_literal_global_76);
  return (id)__atxlog_handle_contextual_engine_log;
}

void ____atxlog_handle_contextual_engine_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "contextualengine");
  v1 = (void *)__atxlog_handle_contextual_engine_log;
  __atxlog_handle_contextual_engine_log = (uint64_t)v0;

}

id __atxlog_handle_usage_insights()
{
  if (__atxlog_handle_usage_insights_onceToken != -1)
    dispatch_once(&__atxlog_handle_usage_insights_onceToken, &__block_literal_global_78);
  return (id)__atxlog_handle_usage_insights_log;
}

void ____atxlog_handle_usage_insights_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "usage_insights");
  v1 = (void *)__atxlog_handle_usage_insights_log;
  __atxlog_handle_usage_insights_log = (uint64_t)v0;

}

id __atxlog_handle_notification_categorization()
{
  if (__atxlog_handle_notification_categorization_onceToken != -1)
    dispatch_once(&__atxlog_handle_notification_categorization_onceToken, &__block_literal_global_80);
  return (id)__atxlog_handle_notification_categorization_log;
}

void ____atxlog_handle_notification_categorization_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "notification_categorization");
  v1 = (void *)__atxlog_handle_notification_categorization_log;
  __atxlog_handle_notification_categorization_log = (uint64_t)v0;

}

id __atxlog_handle_settings_actions()
{
  if (__atxlog_handle_settings_actions_onceToken != -1)
    dispatch_once(&__atxlog_handle_settings_actions_onceToken, &__block_literal_global_82_0);
  return (id)__atxlog_handle_settings_actions_log;
}

void ____atxlog_handle_settings_actions_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "settings_actions");
  v1 = (void *)__atxlog_handle_settings_actions_log;
  __atxlog_handle_settings_actions_log = (uint64_t)v0;

}

void sub_1A4B087E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4B08968(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4B09314(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getSFSearchResult_SpotlightExtrasClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getSFSearchResult_SpotlightExtrasClass_softClass;
  v7 = getSFSearchResult_SpotlightExtrasClass_softClass;
  if (!getSFSearchResult_SpotlightExtrasClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSFSearchResult_SpotlightExtrasClass_block_invoke;
    v3[3] = &unk_1E4D570B8;
    v3[4] = &v4;
    __getSFSearchResult_SpotlightExtrasClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A4B09428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4B0963C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4B09A34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_6_6(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a2 = a4;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = result;
  return result;
}

BOOL ATXPBUserNotificationEnumsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  int v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v15;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  v6 = (int *)MEMORY[0x1E0D82BB8];
  while (1)
  {
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
      return v7 == 0;
    if (*(_BYTE *)(a2 + *v5))
    {
      v7 = 1;
      return v7 == 0;
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      LOBYTE(v10) = 0;
LABEL_14:
    if (v7)
      v15 = 1;
    else
      v15 = (v10 & 7) == 4;
    if (v15)
      return v7 == 0;
    if ((PBReaderSkipValueWithTag() & 1) == 0)
      return 0;
  }
}

BOOL ATXPBAppDirectoryEventMetadataReadFrom(uint64_t a1, uint64_t a2)
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
          {
            v24 = &OBJC_IVAR___ATXPBAppDirectoryEventMetadata__bundleIdInTopAppsVisible;
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
            v19 = 0;
            v24 = &OBJC_IVAR___ATXPBAppDirectoryEventMetadata__bundleIdInTopAppsVisible;
            goto LABEL_41;
          }
        }
        v24 = &OBJC_IVAR___ATXPBAppDirectoryEventMetadata__bundleIdInTopAppsVisible;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_41:
        *(_BYTE *)(a1 + *v24) = v19 != 0;
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
    *(_BYTE *)(a1 + 12) |= 2u;
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
        v24 = &OBJC_IVAR___ATXPBAppDirectoryEventMetadata__userLaunchedAppBeforeLeaving;
        goto LABEL_39;
      }
      v25 += 7;
      v23 = v26++ > 8;
      if (v23)
      {
        v19 = 0;
        v24 = &OBJC_IVAR___ATXPBAppDirectoryEventMetadata__userLaunchedAppBeforeLeaving;
        goto LABEL_41;
      }
    }
    v24 = &OBJC_IVAR___ATXPBAppDirectoryEventMetadata__userLaunchedAppBeforeLeaving;
LABEL_38:
    *(_BYTE *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1A4B0E268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20(uint64_t a1)
{

}

void sub_1A4B0E3A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getINUISearchFoundationImageAdapterClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getINUISearchFoundationImageAdapterClass_softClass;
  v7 = getINUISearchFoundationImageAdapterClass_softClass;
  if (!getINUISearchFoundationImageAdapterClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getINUISearchFoundationImageAdapterClass_block_invoke;
    v3[3] = &unk_1E4D570B8;
    v3[4] = &v4;
    __getINUISearchFoundationImageAdapterClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A4B12620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getINUISearchFoundationImageAdapterClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!IntentsUILibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E4D5CE60;
    v5 = 0;
    IntentsUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!IntentsUILibraryCore_frameworkLibrary)
    __getINUISearchFoundationImageAdapterClass_block_invoke_cold_1(&v3);
  result = objc_getClass("INUISearchFoundationImageAdapter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getINUISearchFoundationImageAdapterClass_block_invoke_cold_2();
  getINUISearchFoundationImageAdapterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_1_12(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 2u);
}

_BYTE *OUTLINED_FUNCTION_3_9(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_4_5(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

uint64_t OUTLINED_FUNCTION_16_0(void *a1, const char *a2)
{
  return objc_msgSend(a1, "count");
}

id ATXFaceSuggestionClientXPCInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v54[3];
  _QWORD v55[3];
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[4];
  _QWORD v60[4];
  _QWORD v61[3];
  _QWORD v62[2];
  _QWORD v63[4];
  _QWORD v64[2];
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[3];

  v67[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE78A6A8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v67[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_fetchFaceGalleryConfigurationWithCompletion_, 0, 1);

  v4 = (void *)MEMORY[0x1E0C99E60];
  v66 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_regenerateFaceGalleryConfigurationWithCompletion_, 0, 1);

  v7 = (void *)MEMORY[0x1E0C99E60];
  v65 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_fetchFaceSuggestionsForFocusMode_completion_, 0, 0);

  v10 = (void *)MEMORY[0x1E0C99E60];
  v64[0] = objc_opt_class();
  v64[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_fetchFaceSuggestionsForFocusMode_completion_, 0, 1);

  v13 = (void *)MEMORY[0x1E0C99E60];
  v63[0] = objc_opt_class();
  v63[1] = objc_opt_class();
  v63[2] = objc_opt_class();
  v63[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_fetchPosterDescriptorsAndSuggestionDataWithCompletion_, 0, 1);

  v16 = (void *)MEMORY[0x1E0C99E60];
  v62[0] = objc_opt_class();
  v62[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_fetchRankedPosterDescriptors_, 0, 1);

  v19 = (void *)MEMORY[0x1A85A4F90]();
  v20 = objc_alloc(MEMORY[0x1E0C99E60]);
  v21 = objc_opt_class();
  v22 = (void *)objc_msgSend(v20, "initWithObjects:", v21, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v19);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_fetchPosterConfigurationsWithCompletion_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_fetchComplicationSetsForFaceGalleryItem_completion_, 0, 0);

  v24 = (void *)MEMORY[0x1E0C99E60];
  v61[0] = objc_opt_class();
  v61[1] = objc_opt_class();
  v61[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setWithArray:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_fetchComplicationSetsForFaceGalleryItem_completion_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_fetchLandscapeComplicationSetsForFaceGalleryItem_completion_, 0, 0);

  v28 = (void *)MEMORY[0x1E0C99E60];
  v60[0] = objc_opt_class();
  v60[1] = objc_opt_class();
  v60[2] = objc_opt_class();
  v60[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setWithArray:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_fetchLandscapeComplicationSetsForFaceGalleryItem_completion_, 0, 1);

  v31 = (void *)MEMORY[0x1E0C99E60];
  v59[0] = objc_opt_class();
  v59[1] = objc_opt_class();
  v59[2] = objc_opt_class();
  v59[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setWithArray:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_posterBoardDidUpdateDescriptors_completion_, 0, 0);

  v34 = (void *)MEMORY[0x1A85A4F90]();
  v35 = objc_alloc(MEMORY[0x1E0C99E60]);
  v36 = objc_opt_class();
  v37 = (void *)objc_msgSend(v35, "initWithObjects:", v36, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v34);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v37, sel_posterBoardDidUpdateConfigurations_completion_, 0, 0);

  v38 = (void *)MEMORY[0x1E0C99E60];
  v58 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setWithArray:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v40, sel_logPosterEdit_completion_, 0, 0);

  v41 = (void *)MEMORY[0x1E0C99E60];
  v57 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setWithArray:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v43, sel_logPosterSwitch_completion_, 0, 0);

  v44 = (void *)MEMORY[0x1E0C99E60];
  v56 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setWithArray:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v46, sel_synchronousDateOfLastGalleryAppearanceWithCompletion_, 0, 1);

  v47 = (void *)MEMORY[0x1E0C99E60];
  v55[0] = objc_opt_class();
  v55[1] = objc_opt_class();
  v55[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 3);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setWithArray:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v49, sel_logComplicationsSeenInGalleryWithEngagements_completion_, 0, 0);

  v50 = (void *)MEMORY[0x1E0C99E60];
  v54[0] = objc_opt_class();
  v54[1] = objc_opt_class();
  v54[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 3);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setWithArray:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v52, sel_logFaceGalleryItemsSeenInGalleryWithOutcomes_completion_, 0, 0);

  return v0;
}

uint64_t ATXPBSharedDigestEngagementTrackingMetricsReadFrom(uint64_t a1, uint64_t a2)
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
  char v29;
  unsigned int v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  void *v35;
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
  uint64_t v56;

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
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 72) |= 8u;
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
              goto LABEL_72;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              v19 = 0;
              goto LABEL_74;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_72:
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_74:
          v56 = 32;
          goto LABEL_99;
        case 2u:
          v24 = 0;
          v25 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 72) |= 4u;
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
                  v19 = 0;
                  goto LABEL_78;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_78:
          v56 = 24;
          goto LABEL_99;
        case 3u:
          v29 = 0;
          v30 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 72) |= 0x10u;
          while (2)
          {
            v31 = *v3;
            v32 = *(_QWORD *)(a2 + v31);
            if (v32 == -1 || v32 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v32);
              *(_QWORD *)(a2 + v31) = v32 + 1;
              v19 |= (unint64_t)(v33 & 0x7F) << v29;
              if (v33 < 0)
              {
                v29 += 7;
                v14 = v30++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_82;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_82:
          v56 = 40;
          goto LABEL_99;
        case 4u:
          PBReaderReadString();
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = *(void **)(a1 + 64);
          *(_QWORD *)(a1 + 64) = v34;

          continue;
        case 5u:
          v36 = 0;
          v37 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 72) |= 0x20u;
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
                  v19 = 0;
                  goto LABEL_86;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_86:
          v56 = 48;
          goto LABEL_99;
        case 6u:
          v41 = 0;
          v42 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 72) |= 0x40u;
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
                  v19 = 0;
                  goto LABEL_90;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_90:
          v56 = 56;
          goto LABEL_99;
        case 7u:
          v46 = 0;
          v47 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 72) |= 2u;
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
                  v19 = 0;
                  goto LABEL_94;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_94:
          v56 = 16;
          goto LABEL_99;
        case 8u:
          v51 = 0;
          v52 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 72) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v53 = *v3;
        v54 = *(_QWORD *)(a2 + v53);
        if (v54 == -1 || v54 >= *(_QWORD *)(a2 + *v4))
          break;
        v55 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v54);
        *(_QWORD *)(a2 + v53) = v54 + 1;
        v19 |= (unint64_t)(v55 & 0x7F) << v51;
        if ((v55 & 0x80) == 0)
          goto LABEL_96;
        v51 += 7;
        v14 = v52++ >= 9;
        if (v14)
        {
          v19 = 0;
          goto LABEL_98;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_96:
      if (*(_BYTE *)(a2 + *v5))
        v19 = 0;
LABEL_98:
      v56 = 8;
LABEL_99:
      *(_QWORD *)(a1 + v56) = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id getSPSearchSuggestionResultClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getSPSearchSuggestionResultClass_softClass;
  v7 = getSPSearchSuggestionResultClass_softClass;
  if (!getSPSearchSuggestionResultClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSPSearchSuggestionResultClass_block_invoke;
    v3[3] = &unk_1E4D570B8;
    v3[4] = &v4;
    __getSPSearchSuggestionResultClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A4B17C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSPSearchContactEntityClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getSPSearchContactEntityClass_softClass;
  v7 = getSPSearchContactEntityClass_softClass;
  if (!getSPSearchContactEntityClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSPSearchContactEntityClass_block_invoke;
    v3[3] = &unk_1E4D570B8;
    v3[4] = &v4;
    __getSPSearchContactEntityClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A4B189B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4B1AD84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__21(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21(uint64_t a1)
{

}

Class __getSPSearchSuggestionResultClass_block_invoke(uint64_t a1)
{
  Class result;

  SpotlightServicesLibrary();
  result = objc_getClass("SPSearchSuggestionResult");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSPSearchSuggestionResultClass_block_invoke_cold_1();
  getSPSearchSuggestionResultClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void SpotlightServicesLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!SpotlightServicesLibraryCore_frameworkLibrary_0)
  {
    v1 = xmmword_1E4D5CEB8;
    v2 = 0;
    SpotlightServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!SpotlightServicesLibraryCore_frameworkLibrary_0)
    SpotlightServicesLibrary_cold_1(&v0);
}

Class __getSPSearchContactEntityClass_block_invoke(uint64_t a1)
{
  Class result;

  SpotlightServicesLibrary();
  result = objc_getClass("SPSearchContactEntity");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSPSearchContactEntityClass_block_invoke_cold_1();
  getSPSearchContactEntityClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ATXMPBBlendingCaptureRateTrackerReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v29;
  unint64_t v30;
  char v31;
  void *v32;

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
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_38;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 44) |= 2u;
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
          *(_BYTE *)(a1 + 40) = v22 != 0;
          continue;
        case 3u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 44) |= 1u;
          break;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_38;
        case 5u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
LABEL_38:
          v32 = *(void **)(a1 + v18);
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

id loadLazyOrRegularPlist_0(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v13;
  id v14;
  id v15;

  v1 = a1;
  v2 = (void *)MEMORY[0x1A85A4F90]();
  v15 = 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v1, 1, &v15);
  v4 = v15;
  objc_autoreleasePoolPop(v2);
  if (v3)
  {
    if ((unint64_t)objc_msgSend(v3, "length") >= 3
      && ((v5 = objc_retainAutorelease(v3), v6 = objc_msgSend(v5, "bytes"), *(_WORD *)v6 == 19536)
        ? (v7 = *(_BYTE *)(v6 + 2) == 80)
        : (v7 = 0),
          v7))
    {
      v8 = (void *)MEMORY[0x1A85A4F90]();
      v14 = v4;
      objc_msgSend(MEMORY[0x1E0D815D0], "dictionaryWithData:error:", v5, &v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v14;
    }
    else
    {
      v8 = (void *)MEMORY[0x1A85A4F90]();
      v13 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 0, 0, &v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v13;
    }
    v11 = v10;

    objc_autoreleasePoolPop(v8);
    if (!v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      loadLazyOrRegularPlist_cold_2_0();
    v4 = v11;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      loadLazyOrRegularPlist_cold_1_0();
    v9 = 0;
  }

  return v9;
}

void __getAsset_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v0 = objc_alloc(MEMORY[0x1E0D81528]);
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithPath:", CFSTR("/System/Library/DuetExpertCenter/Assets"));
  objc_msgSend(v1, "pathForResource:ofType:", CFSTR("Assets"), CFSTR("bundle"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  dispatch_get_global_queue(9, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = 1;
  v3 = objc_msgSend(v0, "initWithAssetTypeDescriptorPath:defaultBundlePath:matchingKeysAndValues:notificationQueue:logHandle:enableAssetUpdates:purgeObsoleteInstalledAssets:", CFSTR("/System/Library/AssetTypeDescriptors/com.apple.MobileAsset.AssetTypeDescriptor.DuetExpertCenterAsset.plist"), v6, 0, v2, 0, 1, v5);
  v4 = (void *)getAsset_asset;
  getAsset_asset = v3;

}

void __getTrialAssets_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)getTrialAssets_assets;
  getTrialAssets_assets = v0;

}

const __CFString *NSStringForATXModeConfigurationType(uint64_t a1)
{
  int v1;
  NSObject *v3;

  if (!a1)
    return CFSTR("allowlist");
  v1 = a1;
  if (a1 == 1)
    return CFSTR("denylist");
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    NSStringForATXModeConfigurationType_cold_1(v1, v3);

  return CFSTR("unknown");
}

BOOL ATXPBNotificationPromotingSuggestionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  int v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v15;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  v6 = (int *)MEMORY[0x1E0D82BB8];
  while (1)
  {
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
      return v7 == 0;
    if (*(_BYTE *)(a2 + *v5))
    {
      v7 = 1;
      return v7 == 0;
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      LOBYTE(v10) = 0;
LABEL_14:
    if (v7)
      v15 = 1;
    else
      v15 = (v10 & 7) == 4;
    if (v15)
      return v7 == 0;
    if ((PBReaderSkipValueWithTag() & 1) == 0)
      return 0;
  }
}

void sub_1A4B1E464(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4B1E4D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A4B1E650(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ATXPBActivityReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v30;
  uint64_t v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  void *v37;
  void *v38;
  char v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  uint64_t v45;

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
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 72) |= 2u;
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
              goto LABEL_58;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              v19 = 0;
              goto LABEL_60;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_58:
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_60:
          v45 = 16;
          goto LABEL_69;
        case 2u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 72) |= 4u;
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
                  goto LABEL_64;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v26) = 0;
LABEL_64:
          *(_DWORD *)(a1 + 64) = v26;
          continue;
        case 3u:
          PBReaderReadString();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = 24;
          goto LABEL_46;
        case 4u:
          PBReaderReadString();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = 56;
          goto LABEL_46;
        case 5u:
          v32 = 0;
          v33 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 72) |= 1u;
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
                  v19 = 0;
                  goto LABEL_68;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_68:
          v45 = 8;
LABEL_69:
          *(_QWORD *)(a1 + v45) = v19;
          continue;
        case 6u:
          PBReaderReadString();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = 40;
          goto LABEL_46;
        case 7u:
          PBReaderReadString();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = 32;
LABEL_46:
          v37 = *(void **)(a1 + v31);
          *(_QWORD *)(a1 + v31) = v30;

          continue;
        case 8u:
          PBReaderReadData();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (v38)
            -[ATXPBActivity addSerializedTriggers:](a1, v38);

          continue;
        case 9u:
          v39 = 0;
          v40 = 0;
          v41 = 0;
          *(_BYTE *)(a1 + 72) |= 8u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v42 = *v3;
        v43 = *(_QWORD *)(a2 + v42);
        if (v43 == -1 || v43 >= *(_QWORD *)(a2 + *v4))
          break;
        v44 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v43);
        *(_QWORD *)(a2 + v42) = v43 + 1;
        v41 |= (unint64_t)(v44 & 0x7F) << v39;
        if ((v44 & 0x80) == 0)
          goto LABEL_71;
        v39 += 7;
        v14 = v40++ >= 9;
        if (v14)
        {
          v41 = 0;
          goto LABEL_73;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_71:
      if (*(_BYTE *)(a2 + *v5))
        v41 = 0;
LABEL_73:
      *(_BYTE *)(a1 + 68) = v41 != 0;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

const __CFString *ATXUserNotificationDeliveryMethodToString(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("error_ATXUserNotificationDeliveryMethodTotal");
  else
    return off_1E4D5CF60[a1];
}

__CFString *ATXUserNotificationDeliveryUrgencyToString(uint64_t a1)
{
  if (a1 < 7)
    return off_1E4D5CF78[(int)a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t ATXStringToUserNotificationDeliveryUrgency(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Critical")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("TimeSensitive")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Active")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Passive")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Priority")) & 1) != 0)
  {
    v2 = 5;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("Total")))
  {
    v2 = 6;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

__CFString *ATXUserNotificationAttachmentTypeToString(uint64_t a1)
{
  if (a1 < 6)
    return off_1E4D5CFB0[(int)a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t ATXStringToUserNotificationAttachmentType(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Image")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Audio")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Video")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Other")) & 1) != 0)
  {
    v2 = 4;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("Total")))
  {
    v2 = 5;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

__CFString *ATXUserNotificationPriorityStatusToString(uint64_t a1)
{
  if (a1 < 5)
    return off_1E4D5CFE0[(int)a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t ATXStringToUserNotificationPriorityStatus(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("IsPriority")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("IsNotPriority")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("InferenceTimedOut")) & 1) != 0)
  {
    v2 = 3;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("Total")))
  {
    v2 = 4;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_1A4B25030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t ATXMPBAppLaunchOverallCaptureRateTrackerReadFrom(uint64_t a1, uint64_t a2)
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
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  char v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  char v53;
  unsigned int v54;
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
  uint64_t v65;
  BOOL v66;
  uint64_t v67;

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
      switch((v10 >> 3))
      {
        case 1u:
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
              goto LABEL_78;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_80;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_78:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_80:
          v65 = 8;
          goto LABEL_85;
        case 2u:
          v24 = 0;
          v25 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 24) |= 2u;
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
                  goto LABEL_84;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_84:
          v65 = 12;
LABEL_85:
          *(_DWORD *)(a1 + v65) = v19;
          continue;
        case 3u:
          v29 = 0;
          v30 = 0;
          v31 = 0;
          *(_BYTE *)(a1 + 24) |= 0x20u;
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
                  goto LABEL_89;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v31 = 0;
LABEL_89:
          v66 = v31 != 0;
          v67 = 19;
          goto LABEL_110;
        case 4u:
          v35 = 0;
          v36 = 0;
          v37 = 0;
          *(_BYTE *)(a1 + 24) |= 4u;
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
              v37 |= (unint64_t)(v40 & 0x7F) << v35;
              if (v40 < 0)
              {
                v35 += 7;
                v14 = v36++ >= 9;
                if (v14)
                {
                  v37 = 0;
                  goto LABEL_93;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v37 = 0;
LABEL_93:
          v66 = v37 != 0;
          v67 = 16;
          goto LABEL_110;
        case 5u:
          v41 = 0;
          v42 = 0;
          v43 = 0;
          *(_BYTE *)(a1 + 24) |= 8u;
          while (2)
          {
            v44 = *v3;
            v45 = *(_QWORD *)(a2 + v44);
            if (v45 == -1 || v45 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v46 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v45);
              *(_QWORD *)(a2 + v44) = v45 + 1;
              v43 |= (unint64_t)(v46 & 0x7F) << v41;
              if (v46 < 0)
              {
                v41 += 7;
                v14 = v42++ >= 9;
                if (v14)
                {
                  v43 = 0;
                  goto LABEL_97;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v43 = 0;
LABEL_97:
          v66 = v43 != 0;
          v67 = 17;
          goto LABEL_110;
        case 6u:
          v47 = 0;
          v48 = 0;
          v49 = 0;
          *(_BYTE *)(a1 + 24) |= 0x10u;
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
              v52 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v51);
              *(_QWORD *)(a2 + v50) = v51 + 1;
              v49 |= (unint64_t)(v52 & 0x7F) << v47;
              if (v52 < 0)
              {
                v47 += 7;
                v14 = v48++ >= 9;
                if (v14)
                {
                  v49 = 0;
                  goto LABEL_101;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v49 = 0;
LABEL_101:
          v66 = v49 != 0;
          v67 = 18;
          goto LABEL_110;
        case 7u:
          v53 = 0;
          v54 = 0;
          v55 = 0;
          *(_BYTE *)(a1 + 24) |= 0x40u;
          while (2)
          {
            v56 = *v3;
            v57 = *(_QWORD *)(a2 + v56);
            if (v57 == -1 || v57 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v58 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v57);
              *(_QWORD *)(a2 + v56) = v57 + 1;
              v55 |= (unint64_t)(v58 & 0x7F) << v53;
              if (v58 < 0)
              {
                v53 += 7;
                v14 = v54++ >= 9;
                if (v14)
                {
                  v55 = 0;
                  goto LABEL_105;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v55 = 0;
LABEL_105:
          v66 = v55 != 0;
          v67 = 20;
          goto LABEL_110;
        case 8u:
          v59 = 0;
          v60 = 0;
          v61 = 0;
          *(_BYTE *)(a1 + 24) |= 0x80u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v62 = *v3;
        v63 = *(_QWORD *)(a2 + v62);
        if (v63 == -1 || v63 >= *(_QWORD *)(a2 + *v4))
          break;
        v64 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v63);
        *(_QWORD *)(a2 + v62) = v63 + 1;
        v61 |= (unint64_t)(v64 & 0x7F) << v59;
        if ((v64 & 0x80) == 0)
          goto LABEL_107;
        v59 += 7;
        v14 = v60++ >= 9;
        if (v14)
        {
          v61 = 0;
          goto LABEL_109;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_107:
      if (*(_BYTE *)(a2 + *v5))
        v61 = 0;
LABEL_109:
      v66 = v61 != 0;
      v67 = 21;
LABEL_110:
      *(_BYTE *)(a1 + v67) = v66;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t __Block_byref_object_copy__22(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22(uint64_t a1)
{

}

uint64_t ATXPBLockscreenEventReadFrom(uint64_t a1, uint64_t a2)
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
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  void *v30;
  void *v31;

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
          *(_BYTE *)(a1 + 40) |= 1u;
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
          continue;
        case 2u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          *(_BYTE *)(a1 + 40) |= 2u;
          break;
        case 3u:
          PBReaderReadString();
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = *(void **)(a1 + 16);
          *(_QWORD *)(a1 + 16) = v29;

          continue;
        case 4u:
          PBReaderReadString();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
            -[ATXPBLockscreenEvent addSuggestionIds:](a1, v31);

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
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
          goto LABEL_36;
        v22 += 7;
        v15 = v23++ >= 9;
        if (v15)
        {
          LODWORD(v24) = 0;
          goto LABEL_38;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_36:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v24) = 0;
LABEL_38:
      *(_DWORD *)(a1 + 24) = v24;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ATXPBNotificationDeliverySuggestionReadFrom(uint64_t a1, uint64_t a2)
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
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  void *v36;
  uint64_t result;
  ATXPBNotificationSmartPauseSuggestion *v38;

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
      case 0u:
        v18 = 0;
        do
        {
          v19 = *v3;
          v20 = *(_QWORD *)(a2 + v19);
          v21 = v20 + 1;
          if (v20 == -1 || v21 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
            goto LABEL_66;
          }
          v22 = *(char *)(*(_QWORD *)(a2 + *v7) + v20);
          *(_QWORD *)(a2 + v19) = v21;
          if ((v22 & 0x80000000) == 0)
            break;
        }
        while (v18++ <= 8);
        goto LABEL_66;
      case 1u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 112;
        goto LABEL_39;
      case 2u:
        *(_BYTE *)(a1 + 120) |= 1u;
        v26 = *v3;
        v27 = *(_QWORD *)(a2 + v26);
        if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v28 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v27);
          *(_QWORD *)(a2 + v26) = v27 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v28 = 0;
        }
        *(_QWORD *)(a1 + 8) = v28;
        goto LABEL_66;
      case 3u:
        v29 = 0;
        v30 = 0;
        v31 = 0;
        *(_BYTE *)(a1 + 120) |= 4u;
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
            v31 |= (unint64_t)(v35 & 0x7F) << v29;
            if (v35 < 0)
            {
              v29 += 7;
              v15 = v30++ >= 9;
              if (v15)
              {
                LODWORD(v31) = 0;
                goto LABEL_72;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v31) = 0;
LABEL_72:
        *(_DWORD *)(a1 + 56) = v31;
        goto LABEL_66;
      case 4u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 16;
        goto LABEL_39;
      case 5u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 88;
LABEL_39:
        v36 = *(void **)(a1 + v25);
        *(_QWORD *)(a1 + v25) = v24;

        goto LABEL_66;
      case 0xAu:
        objc_msgSend((id)a1, "clearOneofValuesForOneofNotificationDeliverySuggestion");
        *(_BYTE *)(a1 + 120) |= 2u;
        *(_DWORD *)(a1 + 32) = 1;
        v38 = objc_alloc_init(ATXPBNotificationSmartPauseSuggestion);
        objc_storeStrong((id *)(a1 + 80), v38);
        if (!PBReaderPlaceMark() || !ATXPBNotificationSmartPauseSuggestionReadFrom((uint64_t)v38, a2))
          goto LABEL_76;
        goto LABEL_65;
      case 0xBu:
        objc_msgSend((id)a1, "clearOneofValuesForOneofNotificationDeliverySuggestion");
        *(_BYTE *)(a1 + 120) |= 2u;
        *(_DWORD *)(a1 + 32) = 2;
        v38 = objc_alloc_init(ATXPBNotificationQuietingSuggestion);
        objc_storeStrong((id *)(a1 + 48), v38);
        if (!PBReaderPlaceMark() || !ATXPBNotificationQuietingSuggestionReadFrom((uint64_t)v38, a2))
          goto LABEL_76;
        goto LABEL_65;
      case 0xCu:
        objc_msgSend((id)a1, "clearOneofValuesForOneofNotificationDeliverySuggestion");
        *(_BYTE *)(a1 + 120) |= 2u;
        *(_DWORD *)(a1 + 32) = 3;
        v38 = objc_alloc_init(ATXPBNotificationPromotingSuggestion);
        objc_storeStrong((id *)(a1 + 40), v38);
        if (!PBReaderPlaceMark() || !ATXPBNotificationPromotingSuggestionReadFrom((uint64_t)v38, a2))
          goto LABEL_76;
        goto LABEL_65;
      case 0xDu:
        objc_msgSend((id)a1, "clearOneofValuesForOneofNotificationDeliverySuggestion");
        *(_BYTE *)(a1 + 120) |= 2u;
        *(_DWORD *)(a1 + 32) = 4;
        v38 = objc_alloc_init(ATXPBInterruptionManagerTuningSuggestion);
        objc_storeStrong((id *)(a1 + 24), v38);
        if (!PBReaderPlaceMark()
          || (ATXPBInterruptionManagerTuningSuggestionReadFrom((uint64_t)v38, a2) & 1) == 0)
        {
          goto LABEL_76;
        }
        goto LABEL_65;
      case 0xEu:
        objc_msgSend((id)a1, "clearOneofValuesForOneofNotificationDeliverySuggestion");
        *(_BYTE *)(a1 + 120) |= 2u;
        *(_DWORD *)(a1 + 32) = 5;
        v38 = objc_alloc_init(ATXPBSendToDigestSuggestion);
        objc_storeStrong((id *)(a1 + 72), v38);
        if (!PBReaderPlaceMark() || !ATXPBSendToDigestSuggestionReadFrom((uint64_t)v38, a2))
          goto LABEL_76;
        goto LABEL_65;
      case 0xFu:
        objc_msgSend((id)a1, "clearOneofValuesForOneofNotificationDeliverySuggestion");
        *(_BYTE *)(a1 + 120) |= 2u;
        *(_DWORD *)(a1 + 32) = 6;
        v38 = objc_alloc_init(ATXPBUrgencyTuningSuggestion);
        objc_storeStrong((id *)(a1 + 104), v38);
        if (!PBReaderPlaceMark() || !ATXPBUrgencyTuningSuggestionReadFrom((uint64_t)v38, a2))
          goto LABEL_76;
        goto LABEL_65;
      case 0x10u:
        objc_msgSend((id)a1, "clearOneofValuesForOneofNotificationDeliverySuggestion");
        *(_BYTE *)(a1 + 120) |= 2u;
        *(_DWORD *)(a1 + 32) = 7;
        v38 = objc_alloc_init(ATXPBSendMessagesToDigestSuggestion);
        objc_storeStrong((id *)(a1 + 64), v38);
        if (!PBReaderPlaceMark() || !ATXPBSendMessagesToDigestSuggestionReadFrom((uint64_t)v38, a2))
          goto LABEL_76;
        goto LABEL_65;
      case 0x11u:
        objc_msgSend((id)a1, "clearOneofValuesForOneofNotificationDeliverySuggestion");
        *(_BYTE *)(a1 + 120) |= 2u;
        *(_DWORD *)(a1 + 32) = 8;
        v38 = objc_alloc_init(ATXPBTurnOffNotificationsForAppSuggestion);
        objc_storeStrong((id *)(a1 + 96), v38);
        if (PBReaderPlaceMark() && ATXPBTurnOffNotificationsForAppSuggestionReadFrom((uint64_t)v38, a2))
        {
LABEL_65:
          PBReaderRecallMark();

LABEL_66:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_76:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_66;
    }
  }
}

BOOL ATXPBFaceGalleryItemReadFrom(uint64_t a1, uint64_t a2)
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
        v19 = 8;
        goto LABEL_24;
      }
      if ((_DWORD)v17 == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 24;
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
    v19 = 16;
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id dateManipulationQueue()
{
  if (dateManipulationQueue_onceToken != -1)
    dispatch_once(&dateManipulationQueue_onceToken, &__block_literal_global_96);
  return (id)dateManipulationQueue_dateManipulationQueue;
}

void swapMethodImplementations()
{
  objc_class *v0;
  objc_method *ClassMethod;
  objc_method *v2;
  objc_method *v3;
  objc_method *v4;
  objc_method *v5;
  objc_method *v6;
  objc_method *v7;
  objc_method *v8;
  objc_method *InstanceMethod;
  objc_method *v10;

  v0 = (objc_class *)objc_opt_class();
  ClassMethod = class_getClassMethod(v0, "now");
  v2 = class_getClassMethod(v0, sel__atx_now);
  method_exchangeImplementations(ClassMethod, v2);
  v3 = class_getClassMethod(v0, sel_date);
  v4 = class_getClassMethod(v0, sel__atx_date);
  method_exchangeImplementations(v3, v4);
  v5 = class_getClassMethod(v0, sel_dateWithTimeIntervalSinceNow_);
  v6 = class_getClassMethod(v0, sel__atx_dateWithTimeIntervalSinceNow_);
  method_exchangeImplementations(v5, v6);
  v7 = class_getClassMethod(v0, sel_timeIntervalSinceReferenceDate);
  v8 = class_getClassMethod(v0, sel__atx_timeIntervalSinceReferenceDate);
  method_exchangeImplementations(v7, v8);
  InstanceMethod = class_getInstanceMethod(v0, sel_timeIntervalSinceNow);
  v10 = class_getInstanceMethod(v0, sel__atx_timeIntervalSinceNow);
  method_exchangeImplementations(InstanceMethod, v10);
}

uint64_t __Block_byref_object_copy__23(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23(uint64_t a1)
{

}

void __dateManipulationQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.AppPredictionClient.DateManipulationQueue", v2);
  v1 = (void *)dateManipulationQueue_dateManipulationQueue;
  dateManipulationQueue_dateManipulationQueue = (uint64_t)v0;

}

uint64_t ATXPBInterruptionManagerTuningSuggestionReadFrom(uint64_t a1, uint64_t a2)
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
      if ((v10 >> 3) == 3)
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

id ATXNotificationCategorizationXPCInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  _QWORD v33[2];
  uint64_t v34;
  _QWORD v35[2];
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE78F990);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v37[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_rankUserNotificationWithRequest_completion_, 0, 0);

  v4 = (void *)MEMORY[0x1E0C99E60];
  v36 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_rankUserNotificationWithRequest_completion_, 0, 1);

  v7 = (void *)MEMORY[0x1E0C99E60];
  v35[0] = objc_opt_class();
  v35[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_collectDynamicBreakthroughFeaturesForNotification_completion_, 0, 0);

  v10 = (void *)MEMORY[0x1E0C99E60];
  v34 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_collectDynamicBreakthroughFeaturesForNotification_completion_, 0, 1);

  v13 = (void *)MEMORY[0x1E0C99E60];
  v33[0] = objc_opt_class();
  v33[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_collectCoreAnalyticsJsonForNotification_completion_, 0, 0);

  v16 = (void *)MEMORY[0x1E0C99E60];
  v32 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_collectCoreAnalyticsJsonForNotification_completion_, 0, 1);

  v19 = (void *)MEMORY[0x1A85A4F90]();
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v19);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_fetchContextForNotificationWithRequest_completion_, 0, 0);

  v21 = (void *)MEMORY[0x1A85A4F90]();
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v21);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_fetchContextForNotificationWithRequest_completion_, 0, 1);

  v23 = (void *)MEMORY[0x1A85A4F90]();
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v23);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_fetchContextForMailWithRequest_completion_, 0, 0);

  v25 = (void *)MEMORY[0x1A85A4F90]();
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v25);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_fetchContextForMailWithRequest_completion_, 0, 1);

  v27 = (void *)MEMORY[0x1A85A4F90]();
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v27);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v28, sel_fetchContextForMessageWithRequest_completion_, 0, 0);

  v29 = (void *)MEMORY[0x1A85A4F90]();
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v29);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_fetchContextForMessageWithRequest_completion_, 0, 1);

  return v0;
}

void sub_1A4B37E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__24(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24(uint64_t a1)
{

}

void sub_1A4B381CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

id ATXSlotSetsSerialize(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  id v38;
  id v39;
  const char *v40;
  size_t v41;
  __int16 v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t k;
  void *v56;
  id v57;
  int v58;
  id v59;
  void *v60;
  NSObject *v61;
  void *v63;
  void *v64;
  void *context;
  id v66;
  int v67;
  id v68;
  id v69;
  id obj;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  id v74;
  id v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _QWORD v103[4];

  v103[2] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  context = (void *)MEMORY[0x1A85A4F90]();
  v5 = (void *)objc_opt_new();
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v6 = v4;
  obj = v6;
  v74 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
  v66 = v3;
  if (!v74)
  {
    v67 = 0;
    v8 = 8;
    goto LABEL_26;
  }
  v7 = 0;
  v67 = 0;
  v71 = *(_QWORD *)v95;
  v8 = 8;
  do
  {
    v9 = 0;
    v10 = v7;
    do
    {
      if (*(_QWORD *)v95 != v71)
        objc_enumerationMutation(obj);
      v7 = *(id *)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)v9);

      ++v8;
      objc_msgSend(v7, "parameters");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v7, "parameters");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v8 += objc_msgSend(v12, "count");

        v92 = 0u;
        v93 = 0u;
        v90 = 0u;
        v91 = 0u;
        objc_msgSend(v7, "parameters");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v90, v101, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v91;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v91 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
              v19 = objc_msgSend(v5, "count");
              objc_msgSend(v5, "addObject:", v18);
              if (v19 != objc_msgSend(v5, "count"))
                v8 += strlen((const char *)objc_msgSend(objc_retainAutorelease(v18), "UTF8String"));
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v90, v101, 16);
          }
          while (v15);
        }

      }
      else
      {
        v67 = 1;
      }
      objc_msgSend(v7, "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        v8 += 16;
      v9 = (char *)v9 + 1;
      v10 = v7;
    }
    while (v9 != v74);
    v74 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
  }
  while (v74);

  if (v67)
  {
    if (objc_msgSend(obj, "count") != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSData * _Nullable ATXSlotSetsSerialize(ATXAction *__strong _Nonnull, NSSet<ATXSlotSet *> *__strong _Nonnull)");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("ATXSlotSet.m"), 182, CFSTR("If there is an opaque slot set then it can be the only slot set in the set of slot sets. There cannot be an opaque slot set amongst other slot sets. This fact is leveraged in the deserialization code."));

      v3 = v66;
LABEL_26:

      goto LABEL_29;
    }
  }
  else
  {
    v67 = 0;
  }
  v3 = v66;
LABEL_29:
  v22 = objc_msgSend(v5, "count");
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
  if ((unint64_t)objc_msgSend(v5, "count") >= 0xFF)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSData * _Nullable ATXSlotSetsSerialize(ATXAction *__strong _Nonnull, NSSet<ATXSlotSet *> *__strong _Nonnull)");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "handleFailureInFunction:file:lineNumber:description:", v64, CFSTR("ATXSlotSet.m"), 189, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("referencedParams.count < UINT8_MAX"));

  }
  v24 = (void *)MEMORY[0x1A85A4F90]();
  v25 = (void *)MEMORY[0x1A85A4F90]();
  v89 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v89);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v89;
  objc_autoreleasePoolPop(v25);
  if (v26)
  {
    v28 = objc_msgSend(v26, "length") - 8;
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v8 + 2 * v22 + v28);
    LODWORD(v103[0]) = 0;
    objc_msgSend(v29, "appendBytes:length:", v103, 4);
    LODWORD(v103[0]) = objc_msgSend(v5, "count") | ((v28 & 0x7FFFFF) << 8) | (v67 << 31);
    objc_msgSend(v29, "appendBytes:length:", v103, 4);
    v30 = objc_retainAutorelease(v26);
    objc_msgSend(v29, "appendBytes:length:", objc_msgSend(v30, "bytes") + 8, v28);

    objc_autoreleasePoolPop(v24);
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v75 = v5;
    v31 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v85, v100, 16);
    if (v31)
    {
      v32 = v31;
      v33 = 0;
      v34 = *(_QWORD *)v86;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v86 != v34)
            objc_enumerationMutation(v75);
          v36 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v33 + j);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v37, v36);

          v38 = objc_retainAutorelease(v36);
          v39 = v29;
          v40 = (const char *)objc_msgSend(v38, "UTF8String");
          v41 = strlen(v40);
          v42 = v41;
          if (v41 >= 0xFFFF)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void appendStr(NSMutableData *__strong, NSString *__strong)");
            v68 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "handleFailureInFunction:file:lineNumber:description:", v68, CFSTR("ATXSlotSet.m"), 117, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("len < UINT16_MAX"));

          }
          LOWORD(v103[0]) = v42;
          objc_msgSend(v39, "appendBytes:length:", v103, 2);
          objc_msgSend(v39, "appendBytes:length:", v40, strlen(v40));

        }
        v32 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v85, v100, 16);
        v33 += j;
      }
      while (v32);
    }

    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v69 = obj;
    v76 = (id)objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v81, v99, 16);
    if (v76)
    {
      v43 = 0;
      v73 = *(_QWORD *)v82;
      do
      {
        v44 = 0;
        v45 = v43;
        do
        {
          if (*(_QWORD *)v82 != v73)
            objc_enumerationMutation(v69);
          v43 = *(id *)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)v44);

          objc_msgSend(v43, "uuid");
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v43, "parameters");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "count");

          LOBYTE(v103[0]) = v48 | ((v46 != 0) << 7);
          objc_msgSend(v29, "appendBytes:length:", v103, 1);
          if (v46)
          {
            objc_msgSend(v43, "uuid");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v103[0] = 0;
            v103[1] = 0;
            v50 = v29;
            objc_msgSend(v49, "getUUIDBytes:", v103);
            objc_msgSend(v50, "appendBytes:length:", v103, 16);

          }
          v79 = 0u;
          v80 = 0u;
          v77 = 0u;
          v78 = 0u;
          objc_msgSend(v43, "parameters");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v77, v98, 16);
          if (v52)
          {
            v53 = v52;
            v54 = *(_QWORD *)v78;
            do
            {
              for (k = 0; k != v53; ++k)
              {
                if (*(_QWORD *)v78 != v54)
                  objc_enumerationMutation(v51);
                objc_msgSend(v23, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * k));
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v103[0]) = objc_msgSend(v56, "unsignedCharValue");
                objc_msgSend(v29, "appendBytes:length:", v103, 1);

              }
              v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v77, v98, 16);
            }
            while (v53);
          }

          v44 = (char *)v44 + 1;
          v45 = v43;
        }
        while (v44 != v76);
        v76 = (id)objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v81, v99, 16);
      }
      while (v76);

    }
    v57 = objc_retainAutorelease(v29);
    v58 = adler32(0, (const Bytef *)(objc_msgSend(v57, "bytes") + 4), objc_msgSend(v57, "length") - 4);
    v59 = objc_retainAutorelease(v57);
    *(_DWORD *)objc_msgSend(v59, "mutableBytes") = v58;
    v60 = (void *)objc_msgSend(v59, "copy");

    v3 = v66;
  }
  else
  {
    __atxlog_handle_default();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      ATXSlotSetsSerialize_cold_1((uint64_t)v3, (uint64_t)v27, v61);

    objc_autoreleasePoolPop(v24);
    v60 = 0;
  }

  objc_autoreleasePoolPop(context);
  return v60;
}

id ATXSlotSetsDeserialize(void *a1, void **a2)
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  int v6;
  void *v7;
  int v9;
  int v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  unint64_t v16;
  unsigned __int16 *v17;
  int v18;
  void *v19;
  int64_t v20;
  unsigned __int16 *v21;
  unsigned int v22;
  BOOL v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  unsigned int v28;
  char *v29;
  int v30;
  unsigned int v31;
  void *v32;
  ATXSlotSet *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  size_t v37;
  int v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  ATXSlotSet *v45;
  ATXSlotSet *v46;
  NSObject *v47;
  uint64_t v48;
  id v49;
  id v50;
  void *v51;
  NSObject *v52;
  id v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  ATXSlotSet *v58;
  id v59;
  void *v60;
  uint64_t *v61;
  NSObject *v62;
  void *v63;
  unint64_t v64;
  id v65;
  uint64_t v66;
  _QWORD v67[2];

  v67[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a1);
  v4 = objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");
  v6 = adler32(0, (const Bytef *)(v4 + 4), objc_msgSend(v3, "length") - 4);
  if ((v5 & 0x8000000000000000) != 0 || v5 < 4)
    goto LABEL_3;
  v9 = v6;
  v10 = *(_DWORD *)v4;
  if (*(_DWORD *)v4 != v6)
  {
    __atxlog_handle_default();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      ATXSlotSetsDeserialize_cold_3(v10, v9, v12);
    v7 = 0;
    goto LABEL_48;
  }
  if ((v5 & 0xFFFFFFFFFFFFFFFCLL) != 4 && v5 >= 8)
  {
    v64 = *(unsigned int *)(v4 + 4);
    v11 = (v64 >> 8) & 0x7FFFFF;
    if (v5 - 8 >= v11)
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", (v11 + 8));
      -[NSObject appendBytes:length:](v12, "appendBytes:length:", "bplist00", 8);
      v13 = (void *)MEMORY[0x1A85A4F90](-[NSObject appendBytes:length:](v12, "appendBytes:length:", v4 + 8, v11));
      v65 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v12, &v65);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v65;
      objc_autoreleasePoolPop(v13);
      if (!v14)
      {
        __atxlog_handle_default();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          ATXSlotSetsDeserialize_cold_1((uint64_t)v15, v52);

        if (!a2)
        {
          v7 = 0;
LABEL_64:

LABEL_48:
          goto LABEL_4;
        }
        v53 = v15;
        v7 = 0;
        v19 = *a2;
        *a2 = v53;
LABEL_63:

        goto LABEL_64;
      }
      v60 = v14;
      v16 = v4 + v5;
      v17 = (unsigned __int16 *)(v4 + 8 + v11);
      v18 = v64;
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v64);
      v59 = v15;
      if ((_BYTE)v64)
      {
        while (1)
        {
          if (v16 < (unint64_t)v17
            || v16 - (unint64_t)v17 < 2
            || ((v22 = *v17, v21 = v17 + 1, (v20 = v22) != 0) ? (v23 = (unint64_t)v21 > v16) : (v23 = 1),
                v23 || (uint64_t)(v16 - (_QWORD)v21) < v20))
          {
            v7 = 0;
            v15 = v59;
            v14 = v60;
            goto LABEL_63;
          }
          v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v21, v20, 4);
          if (!v24)
            break;
          v25 = (void *)v24;
          v17 = (unsigned __int16 *)((char *)v21 + v20);
          objc_msgSend(v19, "addObject:", v24);

          if (!--v18)
            goto LABEL_20;
        }
        v14 = v60;
        if (a2)
        {
          v66 = *MEMORY[0x1E0CB2D50];
          v67[0] = CFSTR("Error decoding action parameters");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, &v66, 1);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATXActionDeserialization"), 1, v54);
          v55 = objc_claimAutoreleasedReturnValue();
          v56 = *a2;
          *a2 = (void *)v55;

        }
        __atxlog_handle_default();
        v27 = objc_claimAutoreleasedReturnValue();
        v15 = v59;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          ATXSlotSetsDeserialize_cold_2(v27);
        v7 = 0;
        goto LABEL_62;
      }
LABEL_20:
      v26 = objc_opt_new();
      v27 = v26;
      if ((unint64_t)v17 >= v16)
      {
LABEL_43:
        v49 = objc_alloc(MEMORY[0x1E0D81638]);
        v50 = -[NSObject copy](v27, "copy");
        v51 = v49;
        v14 = v60;
        v7 = (void *)objc_msgSend(v51, "initWithFirst:second:", v60, v50);

LABEL_44:
        v15 = v59;
LABEL_62:

        goto LABEL_63;
      }
      v28 = v64;
      v29 = (char *)v17;
      v62 = v26;
      v63 = v19;
      while (1)
      {
        v30 = *v29++;
        v31 = v30;
        if (v30 < 0)
        {
          if (v16 - (unint64_t)v29 < 0x10)
          {
            v7 = 0;
            v14 = v60;
            goto LABEL_44;
          }
          v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v29);
          v29 = (char *)v17 + 17;
          v31 &= 0x7Fu;
        }
        else
        {
          v32 = 0;
        }
        if ((v64 & 0x80000000) != 0 && !v31)
          break;
        if (!v31)
        {
          v45 = [ATXSlotSet alloc];
          v33 = (ATXSlotSet *)objc_opt_new();
          v46 = -[ATXSlotSet initWithParameters:uuid:](v45, "initWithParameters:uuid:", v33, v32);
          v47 = v62;
          -[NSObject addObject:](v62, "addObject:", v46);

          v27 = v47;
          goto LABEL_37;
        }
        v61 = &v57;
        v34 = v31;
        MEMORY[0x1E0C80A78]();
        v36 = (char *)&v57 - v35;
        bzero((char *)&v57 - v35, v37);
        v38 = 0;
        if (v16 >= (unint64_t)v29 && (uint64_t)(v16 - (_QWORD)v29) >= v31)
        {
          v39 = 0;
          v40 = v63;
          while (1)
          {
            v41 = v39;
            if (v29[v39] >= v28)
              break;
            objc_msgSend(v40, "objectAtIndexedSubscript:");
            v42 = objc_claimAutoreleasedReturnValue();
            v43 = *(void **)&v36[8 * v41];
            *(_QWORD *)&v36[8 * v41] = v42;

            v39 = v41 + 1;
            if (v34 == v41 + 1)
            {
              v58 = [ATXSlotSet alloc];
              v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", v36, v34);
              v58 = -[ATXSlotSet initWithParameters:uuid:](v58, "initWithParameters:uuid:", v44, v32);
              -[NSObject addObject:](v62, "addObject:", v58);

              v29 += v41 + 1;
              v38 = 1;
              goto LABEL_39;
            }
          }
          v38 = 0;
          v29 += v39 + 1;
        }
LABEL_39:
        v48 = 8 * v34;
        do
        {

          v48 -= 8;
        }
        while (v48);

        v27 = v62;
        if (!v38)
        {
          v7 = 0;
          v15 = v59;
          v14 = v60;
          v19 = v63;
          goto LABEL_62;
        }
LABEL_42:
        v17 = (unsigned __int16 *)v29;
        v19 = v63;
        if ((unint64_t)v29 >= v16)
          goto LABEL_43;
      }
      v33 = -[ATXSlotSet initWithOpaqueParametersUuid:]([ATXSlotSet alloc], "initWithOpaqueParametersUuid:", v32);
      -[NSObject addObject:](v27, "addObject:", v33);
LABEL_37:

      goto LABEL_42;
    }
  }
LABEL_3:
  v7 = 0;
LABEL_4:

  return v7;
}

void __getAVRoutingSessionManagerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVRoutingSessionManagerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ATXAVFoundationWrapper.m"), 15, CFSTR("Unable to find class %s"), "AVRoutingSessionManager");

  __break(1u);
}

void AVFoundationLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AVFoundationLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("ATXAVFoundationWrapper.m"), 14, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAVOutputDeviceClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVOutputDeviceClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ATXAVFoundationWrapper.m"), 26, CFSTR("Unable to find class %s"), "AVOutputDevice");

  __break(1u);
}

void loadLazyOrRegularPlist_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_5(&dword_1A49EF000, v0, v1, "Error loading plist %@: %@");
  OUTLINED_FUNCTION_2();
}

void loadLazyOrRegularPlist_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_5(&dword_1A49EF000, v0, v1, "Error parsing plist %@: %@");
  OUTLINED_FUNCTION_2();
}

void ATXUnarchiverZip(uint64_t a1, NSObject *a2)
{
  int *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = __error();
  v6 = 138412546;
  v7 = a1;
  v8 = 2082;
  v9 = OUTLINED_FUNCTION_7(v4);
  OUTLINED_FUNCTION_1(&dword_1A49EF000, a2, v5, "ATXUnarchiver: unable to open file %@ - %{public}s.", (uint8_t *)&v6);
  OUTLINED_FUNCTION_3();
}

void ATXUnarchiverZip(uint64_t a1, int a2, NSObject *a3)
{
  int *v6;
  _DWORD v7[2];
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = __error();
  v7[0] = 67240706;
  v7[1] = a2;
  v8 = 2112;
  v9 = a1;
  v10 = 2082;
  v11 = OUTLINED_FUNCTION_7(v6);
  _os_log_fault_impl(&dword_1A49EF000, a3, OS_LOG_TYPE_FAULT, "ATXUnarchiver: unable to close file descriptor %{public}d for %@ (leaking) - %{public}s.", (uint8_t *)v7, 0x1Cu);
}

void ATXUnarchiverZip()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_ERROR, "ATXUnarchiver: unable to open non-file URL %@.", v1, 0xCu);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_1A49EF000, v0, v1, "ATXUnarchiver: unable to free archive_read (leaking) - %{public}s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1A49EF000, v0, v1, "ATXUnarchiver: unable to close archive_read - %{public}s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1A49EF000, v0, v1, "ATXUnarchiver: unable to open archive_read - %{public}s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void PPCreateReadArchive_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1A49EF000, v0, v1, "ATXUnarchiver: unable to free archive_read (leaking) - %{public}s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void PPCreateReadArchive_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1A49EF000, v0, v1, "ATXUnarchiver: archive_read unable to set supported compression formats - %{public}s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void PPZipUnarchive_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1A49EF000, v0, v1, "ATXUnarchiver: unable to free archive_write_disk (leaking) - %{public}s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void PPZipUnarchive_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1A49EF000, v0, v1, "ATXUnarchiver: unable to close archive_write_disk - %{public}s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void PPZipUnarchive_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1A49EF000, v0, v1, "ATXUnarchiver: archive_read_next_header failed - %{public}s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void PPZipUnarchive_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, a1, a3, "ATXUnarchiver: archive_entry with no path encountered.", a5, a6, a7, a8, 0);
}

void PPZipUnarchive_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1A49EF000, v0, v1, "ATXUnarchiver: archive_read_data_block failed - %{public}s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void PPZipUnarchive_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1A49EF000, v0, v1, "ATXUnarchiver: archive_write_data_block failed - %{public}s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void PPZipUnarchive_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, a1, a3, "ATXUnarchiver: archive_entry with no path after sanitization encountered.", a5, a6, a7, a8, 0);
}

void PPZipUnarchive_cold_8(uint64_t a1, NSObject *a2)
{
  int *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = __error();
  v6 = 138412546;
  v7 = a1;
  v8 = 2080;
  v9 = OUTLINED_FUNCTION_7(v4);
  OUTLINED_FUNCTION_1(&dword_1A49EF000, a2, v5, "ATXUnarchiver: unable to resolve physical path for destination path %@ - %s.", (uint8_t *)&v6);
  OUTLINED_FUNCTION_3();
}

void PPZipUnarchive_cold_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1A49EF000, v0, v1, "ATXUnarchiver: archive_write_disk unable to set options - %{public}s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void PPZipUnarchive_cold_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1A49EF000, v0, v1, "ATXUnarchiver: archive_write_disk unable to set lookup functions - %{public}s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void PPZipUnarchive_cold_12()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_1(&dword_1A49EF000, v1, (uint64_t)v1, "ATXUnarchiver: failed to create directory at %@ - %@.", v2);
}

void NSStringForATXWidgetEngagementType_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "invalid input ATXWidgetEngagementType: %d", (uint8_t *)v2, 8u);
}

void _decodeOrFail_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1A49EF000, v1, OS_LOG_TYPE_ERROR, "Unable to decode %@ for ATXAction: %@", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

void _decodeOrFail_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "Unable to decode %@ for ATXAction - found nil object but required nonnull", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void NSStringForATXHomeScreenWidgetExplicitFeedback_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_12(&dword_1A49EF000, a2, a3, "invalid input ATXHomeScreenWidgetExplicitFeedback: %d", a5, a6, a7, a8, 0);
}

void NSStringForATXHomeScreenStackChangeReason_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_12(&dword_1A49EF000, a2, a3, "invalid input ATXHomeScreenStackChangeReason: %d", a5, a6, a7, a8, 0);
}

void getMGBool_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_Bool _MGGetBoolAnswer(CFStringRef)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ATXActionCriteria.m"), 27, CFSTR("%s"), dlerror());

  __break(1u);
}

void __getMGGetBoolAnswerSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *libMobileGestaltLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("ATXActionCriteria.m"), 26, CFSTR("%s"), *a1);

  __break(1u);
}

void AppPredictionUILibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AppPredictionUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("ATXActionSearchResult.m"), 62, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCRSCardRequestClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CardServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("ATXActionSearchResult.m"), 58, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCRSCardRequestClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCRSCardRequestClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ATXActionSearchResult.m"), 59, CFSTR("Unable to find class %s"), "CRSCardRequest");

  __break(1u);
}

void __getATXProactiveSuggestionBuilderClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getATXProactiveSuggestionBuilderClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ATXActionSearchResult.m"), 396, CFSTR("Unable to find class %s"), "ATXProactiveSuggestionBuilder");

  __break(1u);
}

void AppPredictionInternalLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AppPredictionInternalLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("ATXActionSearchResult.m"), 394, CFSTR("%s"), *a1);

  __break(1u);
}

void ATXUserEducationSuggestionTypeToString_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "NSString * _Nonnull ATXUserEducationSuggestionTypeToString(ATXUserEducationSuggestionType)";
  v4 = 2048;
  v5 = a1;
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "%s: unrecognized suggestionType: %ld", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

void removeCacheFile_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "Unable to remove recent engagement cache: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void ATXUserEducationSuggestionEventTypeToString_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "NSString * _Nonnull ATXUserEducationSuggestionEventTypeToString(ATXUserEducationSuggestionEventType)";
  v4 = 2048;
  v5 = a1;
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "%s: unrecognized eventType: %ld", (uint8_t *)&v2, 0x16u);
}

void ATXUserEducationSuggestionFeedbackTypeToString_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "NSString * _Nonnull ATXUserEducationSuggestionFeedbackTypeToString(ATXUserEducationSuggestionFeedbackType)";
  v4 = 2048;
  v5 = a1;
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "%s: unrecognized feedbackType: %ld", (uint8_t *)&v2, 0x16u);
}

void ATXExecutableIdentifierForSuggestion_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "ATXExecutableIdentifierForSuggestion: The executable object is missing. Falling back to executableIdentifier.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void ATXExecutableIdentifierForSuggestion_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "ATXExecutableIdentifierForSuggestion: We are expecting an ATXAction but did not have an executable object of the type. Falling back to executableIdentifier.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void ATXExecutableIdentifierForSuggestion_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "ATXExecutableIdentifierForSuggestion: We are expecting a NSString but did not have an executable object of the type. Falling back to executableIdentifier.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void ATXExecutableIdentifierForSuggestion_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "ATXExecutableIdentifierForSuggestion: We are expecting an ATXHeroData but did not have an executable object of the type. Falling back to executableIdentifier.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void ATXExecutableIdentifierForSuggestion_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "ATXExecutableIdentifierForSuggestion: We are expecting an ATXInfoSuggestion but did not have an executable object of the type. Falling back to executableIdentifier.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void ATXExecutableIdentifierForSuggestion_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "ATXExecutableIdentifierForSuggestion: We are expecting an ATXLinkActionContainer but did not have an executable object of the type. Falling back to executableIdentifier.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void ATXExecutableIdentifierForSuggestion_cold_7(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, a2, a3, "ATXExecutableIdentifierForSuggestion: unsupported class: %@", a5, a6, a7, a8, 2u);
}

void personFromCallRecipient_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_11(&dword_1A49EF000, v0, v1, "Using EmailAddress person handle type for handle: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void personFromCallRecipient_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_11(&dword_1A49EF000, v0, v1, "Using PhoneNumber person handle type for handle: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void loadIntentWithBundleIdAndName_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_5(&dword_1A49EF000, v0, v1, "Unable to load extension with bundle ID: %{public}@, %@");
  OUTLINED_FUNCTION_2();
}

void loadIntentWithBundleIdAndName_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_ERROR, "Unable to load schema for bundle: '%@'", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

void loadIntentWithBundleIdAndName_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_5(&dword_1A49EF000, v0, v1, "Unable to initialize intent with name: '%{public}@' and schema: '%@'");
  OUTLINED_FUNCTION_2();
}

void __getMTUpdateAlarmIntentClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMTUpdateAlarmIntentClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ATXAction+Factory.m"), 29, CFSTR("Unable to find class %s"), "MTUpdateAlarmIntent");

  __break(1u);
}

void MobileTimerLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MobileTimerLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("ATXAction+Factory.m"), 27, CFSTR("%s"), *a1);

  __break(1u);
}

void __getMTCreateAlarmIntentClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMTCreateAlarmIntentClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ATXAction+Factory.m"), 28, CFSTR("Unable to find class %s"), "MTCreateAlarmIntent");

  __break(1u);
}

void ATXStringForStackLayoutSize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, a1, a3, "ATXStringForStackLayoutSize: unknown ATXStackLayoutSize provided", a5, a6, a7, a8, 0);
}

void ATXCAStringForStackLayoutSize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, a1, a3, "ATXCAStringForStackLayoutSize: unknown ATXStackLayoutSize provided", a5, a6, a7, a8, 0);
}

void ATXStackLayoutSizeForNSString_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "ATXStringForStackLayoutSize: unknown string provided: %@", (uint8_t *)&v2, 0xCu);
}

void __getAVSystemControllerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MediaExperienceLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("ATXAVRoutingUtils.m"), 17, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAVSystemControllerClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAVSystemControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ATXAVRoutingUtils.m"), 18, CFSTR("Unable to find class %s"), "AVSystemController");

  __break(1u);
}

void __getINUISearchFoundationImageAdapterClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *IntentsUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("ATXSpotlightClient.m"), 53, CFSTR("%s"), *a1);

  __break(1u);
}

void __getINUISearchFoundationImageAdapterClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getINUISearchFoundationImageAdapterClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ATXSpotlightClient.m"), 54, CFSTR("Unable to find class %s"), "INUISearchFoundationImageAdapter");

  __break(1u);
}

void __getSPSearchSuggestionResultClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSPSearchSuggestionResultClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ATXSpotlightHidingUIController.m"), 36, CFSTR("Unable to find class %s"), "SPSearchSuggestionResult");

  __break(1u);
}

void SpotlightServicesLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SpotlightServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("ATXSpotlightHidingUIController.m"), 35, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSPSearchContactEntityClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSPSearchContactEntityClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ATXSpotlightHidingUIController.m"), 37, CFSTR("Unable to find class %s"), "SPSearchContactEntity");

  __break(1u);
}

void loadLazyOrRegularPlist_cold_1_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_1(&dword_1A49EF000, MEMORY[0x1E0C81028], v0, "Error loading plist %@: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void loadLazyOrRegularPlist_cold_2_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_1(&dword_1A49EF000, MEMORY[0x1E0C81028], v0, "Error parsing plist %@: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void NSStringForATXModeConfigurationType_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "Invalid input passed to NSStringForATXModeConfigurationType: %d", (uint8_t *)v2, 8u);
}

void ATXSlotSetsSerialize_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "Error serializing action %@: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2();
}

void ATXSlotSetsDeserialize_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "Error decoding: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

void ATXSlotSetsDeserialize_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "Error decoding parameters.", v1, 2u);
}

void ATXSlotSetsDeserialize_cold_3(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "Checksum mismatch: found %u, computed %u", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_2();
}

uint64_t ATXActivityTypeToModeSemanticType()
{
  return MEMORY[0x1E0D80CE8]();
}

uint64_t ATXActivityTypeToString()
{
  return MEMORY[0x1E0D80CF0]();
}

uint64_t ATXBundleIdIsSpecialWidgetExtensionBundleId()
{
  return MEMORY[0x1E0CF93B0]();
}

uint64_t ATXBundleIdReplacementForBundleIdWithWebpageURLHint()
{
  return MEMORY[0x1E0CF93C0]();
}

uint64_t ATXCacheFileRead()
{
  return MEMORY[0x1E0CF93D0]();
}

uint64_t ATXCacheFileSplitChunks()
{
  return MEMORY[0x1E0CF93D8]();
}

uint64_t ATXCacheFileWrite()
{
  return MEMORY[0x1E0CF93E0]();
}

uint64_t ATXCreateProactiveSuggestionClientModelXPCInterface()
{
  return MEMORY[0x1E0D810D8]();
}

uint64_t ATXDeserializeTriggers()
{
  return MEMORY[0x1E0D80CF8]();
}

uint64_t ATXDetailedActionLoggingEnabled()
{
  return MEMORY[0x1E0CF9440]();
}

uint64_t ATXPBHeroAppPredictionReadFrom()
{
  return MEMORY[0x1E0D2FC68]();
}

uint64_t ATXPBInfoSuggestionReadFrom()
{
  return MEMORY[0x1E0D810E8]();
}

uint64_t ATXSerializeTriggers()
{
  return MEMORY[0x1E0D80D10]();
}

uint64_t ATXSpecialWidgetKindAppPredictions()
{
  return MEMORY[0x1E0CF9458]();
}

uint64_t ATXSpecialWidgetKindFiles()
{
  return MEMORY[0x1E0CF9460]();
}

uint64_t ATXSpecialWidgetKindShortcutsFolder()
{
  return MEMORY[0x1E0CF9468]();
}

uint64_t ATXSpecialWidgetKindShortcutsSingle()
{
  return MEMORY[0x1E0CF9470]();
}

uint64_t ATXSpecialWidgetKindSiriSuggestions()
{
  return MEMORY[0x1E0CF9478]();
}

uint64_t ATXSuggestionPredictionReasonEnumerateReasonCodes()
{
  return MEMORY[0x1E0D810F0]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

uint64_t BMInferredModeTypeToActivity()
{
  return MEMORY[0x1E0D80D18]();
}

uint64_t BMUserFocusInferredModeOriginToLegacy()
{
  return MEMORY[0x1E0D80D28]();
}

uint64_t BMUserFocusInferredModeTypeToActivity()
{
  return MEMORY[0x1E0D80D40]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1E0D01E18]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C5F0](data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x1E0C9C638](provider);
}

CGImageRef CGImageCreateWithPNGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1E0C9CBD0](source, decode, shouldInterpolate, *(_QWORD *)&intent);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1E0C9CDA8](image);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

uint64_t CHSWidgetFamilyFromString()
{
  return MEMORY[0x1E0D0FF28]();
}

uint64_t CHSWidgetFamilyIsAccessory()
{
  return MEMORY[0x1E0D0FF30]();
}

uint64_t CHSWidgetFamilyMaskContainsFamily()
{
  return MEMORY[0x1E0D0FF40]();
}

uint64_t CHSWidgetFamilyMaskEnumerateFamilies()
{
  return MEMORY[0x1E0D0FF50]();
}

uint64_t CHSWidgetFamilyMaskFromWidgetFamily()
{
  return MEMORY[0x1E0D0FF58]();
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x1E0C9E300]((__n128)coord, *(__n128 *)&coord.longitude);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  MEMORY[0x1E0C9E308](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t DNDModeLocalizedNameForSemanticType()
{
  return MEMORY[0x1E0D1D418]();
}

uint64_t DNDModeSemanticTypeToString()
{
  return MEMORY[0x1E0D1D420]();
}

uint64_t INDisplayableOrLaunchableBundleIdForBundleIdFromUserActivity()
{
  return MEMORY[0x1E0CBD3E8]();
}

uint64_t INIntentWithTypedIntent()
{
  return MEMORY[0x1E0CBD4A0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSUInteger NSPageSize(void)
{
  return MEMORY[0x1E0CB2FE8]();
}

NSRange NSRangeFromString(NSString *aString)
{
  NSUInteger v1;
  NSUInteger v2;
  NSRange result;

  v1 = MEMORY[0x1E0CB3128](aString);
  result.length = v2;
  result.location = v1;
  return result;
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

uint64_t NSStringFromWidgetFamily()
{
  return MEMORY[0x1E0D0FF90]();
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

uint64_t PBDataWriterWriteFixed64Field()
{
  return MEMORY[0x1E0D82C48]();
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

uint64_t SBSCopyDisplayIdentifiers()
{
  return MEMORY[0x1E0DAB5F8]();
}

uint64_t WFContextualActionIconDisplayStyleForLNImageDisplayStyle()
{
  return MEMORY[0x1E0DC8078]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _LSCopyAdvertisementStringForTeamIdentifierAndActivityType()
{
  return MEMORY[0x1E0CA59B8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
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

uLong adler32(uLong adler, const Bytef *buf, uInt len)
{
  return MEMORY[0x1E0DE9290](adler, buf, *(_QWORD *)&len);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

uint64_t archive_entry_filetype()
{
  return MEMORY[0x1E0DE3DC0]();
}

uint64_t archive_entry_pathname_utf8()
{
  return MEMORY[0x1E0DE3DE0]();
}

uint64_t archive_entry_perm()
{
  return MEMORY[0x1E0DE3DE8]();
}

uint64_t archive_entry_set_perm()
{
  return MEMORY[0x1E0DE3E20]();
}

uint64_t archive_entry_size()
{
  return MEMORY[0x1E0DE3E38]();
}

uint64_t archive_entry_size_is_set()
{
  return MEMORY[0x1E0DE3E40]();
}

uint64_t archive_entry_update_pathname_utf8()
{
  return MEMORY[0x1E0DE3E50]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x1E0DE3E60]();
}

uint64_t archive_read_close()
{
  return MEMORY[0x1E0DE3E78]();
}

uint64_t archive_read_data_block()
{
  return MEMORY[0x1E0DE3E88]();
}

uint64_t archive_read_free()
{
  return MEMORY[0x1E0DE3EF8]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x1E0DE3F00]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x1E0DE3F08]();
}

uint64_t archive_read_open_fd()
{
  return MEMORY[0x1E0DE3F20]();
}

uint64_t archive_read_open_memory()
{
  return MEMORY[0x1E0DE3F30]();
}

uint64_t archive_read_support_filter_all()
{
  return MEMORY[0x1E0DE3F48]();
}

uint64_t archive_read_support_format_zip()
{
  return MEMORY[0x1E0DE3F90]();
}

uint64_t archive_write_close()
{
  return MEMORY[0x1E0DE3FC0]();
}

uint64_t archive_write_data_block()
{
  return MEMORY[0x1E0DE3FD0]();
}

uint64_t archive_write_disk_new()
{
  return MEMORY[0x1E0DE3FD8]();
}

uint64_t archive_write_disk_set_options()
{
  return MEMORY[0x1E0DE3FE0]();
}

uint64_t archive_write_disk_set_standard_lookup()
{
  return MEMORY[0x1E0DE3FE8]();
}

uint64_t archive_write_finish_entry()
{
  return MEMORY[0x1E0DE3FF8]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x1E0DE4000]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x1E0DE4008]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7A98](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
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

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
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

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void method_exchangeImplementations(Method m1, Method m2)
{
  MEMORY[0x1E0DE7B50](m1, m2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
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

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

uint64_t stringForATXSuggestionPredictionReasonCode()
{
  return MEMORY[0x1E0D81270]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1E0C85DB8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85DC8](activity);
}

uint64_t xpc_transaction_exit_clean()
{
  return MEMORY[0x1E0C86778]();
}

