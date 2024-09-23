uint64_t SPProtoSockPuppetObjectReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  unint64_t v7;
  int *v8;
  unint64_t v9;
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
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  unint64_t v34;
  unint64_t v35;
  SPProtoCacheMessage *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  int v44;
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
  char v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char v63;
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
  uint64_t v74;
  unint64_t v75;
  char v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = 0x254DEB000uLL;
  v8 = (int *)MEMORY[0x24BE7AF30];
  v9 = 0x254DEB000uLL;
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
            goto LABEL_84;
          v20 += 7;
          v17 = v21++ >= 9;
          if (v17)
          {
            LODWORD(v22) = 0;
            goto LABEL_86;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_84:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_86:
        v78 = *(int *)(v7 + 812);
        goto LABEL_108;
      case 2u:
        v28 = 0;
        v29 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + *(int *)(v9 + 760)) |= 0x40u;
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
            v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v31);
            *(_QWORD *)(a2 + v30) = v32;
            v22 |= (unint64_t)(v33 & 0x7F) << v28;
            if (v33 < 0)
            {
              v28 += 7;
              v17 = v29++ >= 9;
              if (v17)
              {
                LODWORD(v22) = 0;
                goto LABEL_90;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_90:
        v78 = 72;
        goto LABEL_108;
      case 3u:
        v34 = v9;
        v35 = v7;
        v36 = objc_alloc_init(SPProtoCacheMessage);
        objc_storeStrong((id *)(a1 + 32), v36);
        if (PBReaderPlaceMark() && (SPProtoCacheMessageReadFrom((uint64_t)v36, a2) & 1) != 0)
        {
          PBReaderRecallMark();

          v7 = v35;
          v9 = v34;
LABEL_109:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 4u:
        PBReaderReadString();
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = 40;
        goto LABEL_82;
      case 5u:
        PBReaderReadString();
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = 80;
        goto LABEL_82;
      case 6u:
        *(_BYTE *)(a1 + *(int *)(v9 + 760)) |= 1u;
        v39 = *v3;
        v40 = *(_QWORD *)(a2 + v39);
        if (v40 <= 0xFFFFFFFFFFFFFFF7 && v40 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v41 = *(_QWORD *)(*(_QWORD *)(a2 + *v8) + v40);
          *(_QWORD *)(a2 + v39) = v40 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v41 = 0;
        }
        *(_QWORD *)(a1 + 8) = v41;
        goto LABEL_109;
      case 7u:
        *(_BYTE *)(a1 + *(int *)(v9 + 760)) |= 8u;
        v42 = *v3;
        v43 = *(_QWORD *)(a2 + v42);
        if (v43 <= 0xFFFFFFFFFFFFFFFBLL && v43 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v44 = *(_DWORD *)(*(_QWORD *)(a2 + *v8) + v43);
          *(_QWORD *)(a2 + v42) = v43 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v44 = 0;
        }
        *(_DWORD *)(a1 + 48) = v44;
        goto LABEL_109;
      case 8u:
        v45 = 0;
        v46 = 0;
        v47 = 0;
        *(_BYTE *)(a1 + *(int *)(v9 + 760)) |= 2u;
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
            v47 |= (unint64_t)(v51 & 0x7F) << v45;
            if (v51 < 0)
            {
              v45 += 7;
              v17 = v46++ >= 9;
              if (v17)
              {
                v47 = 0;
                goto LABEL_94;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v47 = 0;
LABEL_94:
        v79 = 16;
        goto LABEL_103;
      case 9u:
        v52 = 0;
        v53 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + *(int *)(v9 + 760)) |= 0x10u;
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
            v57 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v55);
            *(_QWORD *)(a2 + v54) = v56;
            v22 |= (unint64_t)(v57 & 0x7F) << v52;
            if (v57 < 0)
            {
              v52 += 7;
              v17 = v53++ >= 9;
              if (v17)
              {
                LODWORD(v22) = 0;
                goto LABEL_98;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_98:
        v78 = 52;
        goto LABEL_108;
      case 0xAu:
        v58 = 0;
        v59 = 0;
        v47 = 0;
        *(_BYTE *)(a1 + *(int *)(v9 + 760)) |= 4u;
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
            v63 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v61);
            *(_QWORD *)(a2 + v60) = v62;
            v47 |= (unint64_t)(v63 & 0x7F) << v58;
            if (v63 < 0)
            {
              v58 += 7;
              v17 = v59++ >= 9;
              if (v17)
              {
                v47 = 0;
                goto LABEL_102;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v47 = 0;
LABEL_102:
        v79 = 24;
LABEL_103:
        *(_QWORD *)(a1 + v79) = v47;
        goto LABEL_109;
      case 0xBu:
        v64 = 0;
        v65 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + *(int *)(v9 + 760)) |= 0x20u;
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
            v69 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v67);
            *(_QWORD *)(a2 + v66) = v68;
            v22 |= (unint64_t)(v69 & 0x7F) << v64;
            if (v69 < 0)
            {
              v64 += 7;
              v17 = v65++ >= 9;
              if (v17)
              {
                LODWORD(v22) = 0;
                goto LABEL_107;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_107:
        v78 = 56;
LABEL_108:
        *(_DWORD *)(a1 + v78) = v22;
        goto LABEL_109;
      case 0xCu:
        v70 = 0;
        v71 = 0;
        v72 = 0;
        *(_BYTE *)(a1 + *(int *)(v9 + 760)) |= 0x80u;
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
            v76 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v74);
            *(_QWORD *)(a2 + v73) = v75;
            v72 |= (unint64_t)(v76 & 0x7F) << v70;
            if (v76 < 0)
            {
              v70 += 7;
              v17 = v71++ >= 9;
              if (v17)
              {
                v72 = 0;
                goto LABEL_114;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v72 = 0;
LABEL_114:
        *(_BYTE *)(a1 + 92) = v72 != 0;
        goto LABEL_109;
      case 0xDu:
        PBReaderReadData();
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = 64;
LABEL_82:
        v77 = *(void **)(a1 + v38);
        *(_QWORD *)(a1 + v38) = v37;

        goto LABEL_109;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_109;
    }
  }
}

BOOL SPProtoAudioFileQueuePlayerReadFrom(id *a1, uint64_t a2)
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
  SPProtoAudioFileQueuePlayerSetItems *v17;
  uint64_t v18;
  uint64_t v19;

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
        v17 = objc_alloc_init(SPProtoAudioFileQueuePlayerSetItems);
        objc_storeStrong(a1 + 10, v17);
        if (PBReaderPlaceMark() && SPProtoAudioFileQueuePlayerSetItemsReadFrom(v17, a2))
          goto LABEL_42;
        goto LABEL_46;
      case 2u:
        v17 = objc_alloc_init(SPProtoObjectMessage);
        v18 = 3;
        goto LABEL_36;
      case 3u:
        v17 = objc_alloc_init(SPProtoAudioFileQueuePlayerSetRate);
        objc_storeStrong(a1 + 8, v17);
        if (!PBReaderPlaceMark()
          || (SPProtoAudioFileQueuePlayerSetRateReadFrom((uint64_t)v17, a2) & 1) == 0)
        {
          goto LABEL_46;
        }
        goto LABEL_42;
      case 4u:
        v17 = objc_alloc_init(SPProtoAudioFilePlayerUpdateContainedIdentifier);
        v19 = 6;
        goto LABEL_40;
      case 5u:
        v17 = objc_alloc_init(SPProtoAudioFilePlayerStatus);
        objc_storeStrong(a1 + 9, v17);
        if (!PBReaderPlaceMark() || (SPProtoAudioFilePlayerStatusReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_46;
        goto LABEL_42;
      case 6u:
        v17 = objc_alloc_init(SPProtoObjectMessage);
        v18 = 1;
        goto LABEL_36;
      case 7u:
        v17 = objc_alloc_init(SPProtoAudioFilePlayerUpdateContainedIdentifier);
        v19 = 2;
        goto LABEL_40;
      case 8u:
        v17 = objc_alloc_init(SPProtoAudioFilePlayerUpdateContainedIdentifier);
        v19 = 5;
        goto LABEL_40;
      case 9u:
        v17 = objc_alloc_init(SPProtoObjectMessage);
        v18 = 4;
LABEL_36:
        objc_storeStrong(&a1[v18], v17);
        if (!PBReaderPlaceMark() || (SPProtoObjectMessageReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_46;
        goto LABEL_42;
      case 0xAu:
        v17 = objc_alloc_init(SPProtoAudioFilePlayerUpdateContainedIdentifier);
        v19 = 7;
LABEL_40:
        objc_storeStrong(&a1[v19], v17);
        if (PBReaderPlaceMark()
          && SPProtoAudioFilePlayerUpdateContainedIdentifierReadFrom((uint64_t)v17, a2))
        {
LABEL_42:
          PBReaderRecallMark();

LABEL_43:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_46:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_43;
    }
  }
}

id _WKInterfaceObjectClassWithType(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = _WKInterfaceObjectClassWithType_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&_WKInterfaceObjectClassWithType_onceToken, &__block_literal_global_0);
  objc_msgSend((id)_WKInterfaceObjectClassWithType___interfaceClasses, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id _WKValidatedAttributedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v1 = a1;
  v2 = (void *)objc_msgSend(v1, "mutableCopy");
  v3 = objc_msgSend(v2, "length");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = ___WKValidatedAttributedString_block_invoke;
  v9[3] = &unk_24D3BB108;
  v10 = v1;
  v4 = v2;
  v11 = v4;
  v5 = v1;
  objc_msgSend(v4, "enumerateAttributesInRange:options:usingBlock:", 0, v3, 0x100000, v9);
  v6 = v11;
  v7 = v4;

  return v7;
}

void sub_21591EFC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getNRPairedDeviceRegistryClass()
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
  v0 = (void *)getNRPairedDeviceRegistryClass_softClass;
  v7 = getNRPairedDeviceRegistryClass_softClass;
  if (!getNRPairedDeviceRegistryClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getNRPairedDeviceRegistryClass_block_invoke;
    v3[3] = &unk_24D3BB130;
    v3[4] = &v4;
    __getNRPairedDeviceRegistryClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21591F08C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21591F198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_21591F2A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getNRDevicePropertyLocalizedModel()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getNRDevicePropertyLocalizedModelSymbolLoc_ptr;
  v6 = getNRDevicePropertyLocalizedModelSymbolLoc_ptr;
  if (!getNRDevicePropertyLocalizedModelSymbolLoc_ptr)
  {
    v1 = (void *)NanoRegistryLibrary();
    v0 = (id *)dlsym(v1, "NRDevicePropertyLocalizedModel");
    v4[3] = (uint64_t)v0;
    getNRDevicePropertyLocalizedModelSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getNRDevicePropertyLocalizedModel_cold_1();
  return *v0;
}

void sub_21591F3CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_21591F590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getNRPairedDeviceRegistryClass_block_invoke(uint64_t a1)
{
  Class result;

  NanoRegistryLibrary();
  result = objc_getClass("NRPairedDeviceRegistry");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getNRPairedDeviceRegistryClass_block_invoke_cold_1();
  getNRPairedDeviceRegistryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t NanoRegistryLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!NanoRegistryLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_24D3BB150;
    v3 = 0;
    NanoRegistryLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!NanoRegistryLibraryCore_frameworkLibrary)
    NanoRegistryLibrary_cold_1(&v1);
  return NanoRegistryLibraryCore_frameworkLibrary;
}

uint64_t UIKitLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_24D3BB168;
    v3 = 0;
    UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!UIKitLibraryCore_frameworkLibrary)
    UIKitLibrary_cold_1(&v1);
  return UIKitLibraryCore_frameworkLibrary;
}

char *OUTLINED_FUNCTION_0()
{
  return dlerror();
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t SPProtoCacheAssetReadFrom(uint64_t a1, uint64_t a2)
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
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t result;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;

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
              goto LABEL_40;
            v19 += 7;
            v15 = v20++ >= 9;
            if (v15)
            {
              LODWORD(v21) = 0;
              goto LABEL_42;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_40:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v21) = 0;
LABEL_42:
          *(_DWORD *)(a1 + 32) = v21;
          continue;
        case 2u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          break;
        case 3u:
          PBReaderReadString();
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = *(void **)(a1 + 24);
          *(_QWORD *)(a1 + 24) = v34;

          continue;
        case 4u:
          v36 = *v3;
          v37 = *(_QWORD *)(a2 + v36);
          if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v38 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v37);
            *(_QWORD *)(a2 + v36) = v37 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + v16) = 1;
            v38 = 0;
          }
          *(_QWORD *)(a1 + 8) = v38;
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
        v29 |= (unint64_t)(v33 & 0x7F) << v27;
        if ((v33 & 0x80) == 0)
          goto LABEL_44;
        v27 += 7;
        v15 = v28++ >= 9;
        if (v15)
        {
          v29 = 0;
          goto LABEL_46;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_44:
      if (*(_BYTE *)(a2 + *v5))
        v29 = 0;
LABEL_46:
      *(_QWORD *)(a1 + 16) = v29;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL SPProtoAudioFilePlayerUpdateContainedIdentifierReadFrom(uint64_t a1, uint64_t a2)
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
    PBReaderReadString();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 8;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t SPProtoCacheAssetsReadFrom(void *a1, uint64_t a2)
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
  SPProtoCacheAsset *v17;
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
        v17 = objc_alloc_init(SPProtoCacheAsset);
        objc_msgSend(a1, "addAssets:", v17);
        if (!PBReaderPlaceMark() || (SPProtoCacheAssetReadFrom((uint64_t)v17, a2) & 1) == 0)
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

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

BOOL SPProtoAudioFilePlayerMessageReadFrom(id *a1, uint64_t a2)
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
  SPProtoAudioFileQueuePlayer *v18;

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
        v18 = objc_alloc_init(SPProtoAudioFileQueuePlayer);
        objc_storeStrong(a1 + 3, v18);
        if (!PBReaderPlaceMark() || !SPProtoAudioFileQueuePlayerReadFrom((id *)&v18->super.super.isa, a2))
        {
LABEL_34:

          return 0;
        }
        goto LABEL_29;
      }
      if ((_DWORD)v17 == 2)
        break;
      if ((_DWORD)v17 == 1)
      {
        v18 = objc_alloc_init(SPProtoAudioFilePlayerAsset);
        objc_storeStrong(a1 + 1, v18);
        if (!PBReaderPlaceMark() || !SPProtoAudioFilePlayerAssetReadFrom((uint64_t)v18, a2))
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
    v18 = objc_alloc_init(SPProtoAudioFilePlayerItem);
    objc_storeStrong(a1 + 2, v18);
    if (!PBReaderPlaceMark() || !SPProtoAudioFilePlayerItemReadFrom((id *)&v18->super.super.isa, a2))
      goto LABEL_34;
    goto LABEL_29;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id getUIImageClass()
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
  v0 = (void *)getUIImageClass_softClass;
  v7 = getUIImageClass_softClass;
  if (!getUIImageClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getUIImageClass_block_invoke;
    v3[3] = &unk_24D3BB130;
    v3[4] = &v4;
    __getUIImageClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_215922EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _applicationAccessibilityChanged()
{
  return +[SPRemoteInterface _updateAccessibility](SPRemoteInterface, "_updateAccessibility");
}

uint64_t _RunLoopHandler()
{
  uint64_t v0;
  __int128 v1;
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  __int128 v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend((id)__recordedValues, "count"))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend((id)__recordedValues, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v0 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
    if (v0)
    {
      v2 = v0;
      v23 = *(_QWORD *)v29;
      *(_QWORD *)&v1 = 136446722;
      v21 = v1;
      do
      {
        for (i = 0; i != v2; ++i)
        {
          if (*(_QWORD *)v29 != v23)
            objc_enumerationMutation(obj);
          v4 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend((id)__sharedRemoteInterface, "_interfaceControllerClientIDForControllerID:", v4, v21);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          if (v5)
          {
            objc_msgSend((id)__sharedRemoteInterface, "_interfaceControllerWithID:", v4);
            v6 = objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)__recordedValues, "objectForKeyedSubscript:", v4);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = objc_msgSend(v7, "count");

            wk_default_log();
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              v13 = (void *)objc_opt_class();
              *(_DWORD *)buf = 136446978;
              v33 = "_SendRecordedValues";
              v34 = 1024;
              v35 = 422;
              v36 = 2048;
              v37 = v8;
              v38 = 2114;
              v39 = v13;
              v14 = v13;
              _os_log_debug_impl(&dword_215918000, v9, OS_LOG_TYPE_DEBUG, "%{public}s:%d: WatchKit: Send %lu setters to %{public}@", buf, 0x26u);

            }
            v10 = (void *)__sharedRemoteInterface;
            objc_msgSend((id)__recordedValues, "objectForKeyedSubscript:", v4);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = v5;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v40, 1);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "sendSetViewController:values:clientIdentifiers:", v4, v11, v12);

          }
          else
          {
            wk_default_log();
            v6 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v21;
              v33 = "_SendRecordedValues";
              v34 = 1024;
              v35 = 416;
              v36 = 2114;
              v37 = v4;
              _os_log_error_impl(&dword_215918000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%d: ComF:<-Plugin controller ID %{public}@ has no client identifier", buf, 0x1Cu);
            }
          }

        }
        v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
      }
      while (v2);
    }

  }
  objc_msgSend((id)__recordedValues, "removeAllObjects");
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v15 = (id)__performAfterSendSetViewControllers;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, buf, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j) + 16))();
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, buf, 16);
    }
    while (v17);
  }

  objc_msgSend((id)__performAfterSendSetViewControllers, "removeAllObjects");
  return objc_msgSend((id)__cachedRunLoopValues, "removeAllObjects");
}

id getUNNotificationClass()
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
  v0 = (void *)getUNNotificationClass_softClass;
  v7 = getUNNotificationClass_softClass;
  if (!getUNNotificationClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getUNNotificationClass_block_invoke;
    v3[3] = &unk_24D3BB130;
    v3[4] = &v4;
    __getUNNotificationClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_215924EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ArchiveWithArchiverDelegate(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (objc_class *)MEMORY[0x24BDD1618];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initRequiringSecureCoding:", 1);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "setDelegate:", v4);
  objc_msgSend(v3, "encodeObject:forKey:", v2, *MEMORY[0x24BDD0E88]);

  objc_msgSend(v3, "encodedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id SerializablePropertyValue(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(MEMORY[0x24BDD1770], "propertyList:isValidForFormat:", v1, 200) & 1) == 0)
  {
    ArchiveWithArchiverDelegate(v1);
    v2 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v2;
  }
  return v1;
}

void sub_215928EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

void sub_2159290C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215929284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215929410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2159295E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

SEL SetterForProperty(void *a1)
{
  id v1;
  _BYTE *v2;
  void *v3;
  void *v4;
  NSString *v5;
  SEL v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if ((unint64_t)(objc_msgSend(v1, "lengthOfBytesUsingEncoding:", 4) - 1) > 0x7C)
    goto LABEL_5;
  v2 = (char *)v8 - ((MEMORY[0x24BDAC7A8]() + 16) & 0xFFFFFFFFFFFFFFF0);
  if ((objc_msgSend(v1, "getCString:maxLength:encoding:", v2) & 1) == 0)
    goto LABEL_5;
  *v2 = __toupper((char)*v2);
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("set%@:"), v4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = NSSelectorFromString(v5);

  }
  else
  {
LABEL_5:
    v6 = 0;
  }

  return v6;
}

id WKInterfaceControllerClass()
{
  if (WKInterfaceControllerClass_onceToken != -1)
    dispatch_once(&WKInterfaceControllerClass_onceToken, &__block_literal_global_345);
  return (id)WKInterfaceControllerClass___wkInterfaceControllerClass;
}

id SPInterfaceObjectWithType(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = SPInterfaceObjectWithType_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&SPInterfaceObjectWithType_onceToken, &__block_literal_global_673);
  objc_msgSend((id)SPInterfaceObjectWithType___interfaceClasses, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_21592C070(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Unwind_Resume(a1);
}

void sub_21592D084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __abort_with_reason(uint64_t a1)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))getabort_with_reasonSymbolLoc_ptr;
  v8 = getabort_with_reasonSymbolLoc_ptr;
  if (!getabort_with_reasonSymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __getabort_with_reasonSymbolLoc_block_invoke;
    v4[3] = &unk_24D3BB130;
    v4[4] = &v5;
    __getabort_with_reasonSymbolLoc_block_invoke((uint64_t)v4);
    v2 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
    __abort_with_reason_cold_1();
  return v2(22, 1, a1, 2);
}

void sub_21592D3FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getUNUserNotificationCenterClass()
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
  v0 = (void *)getUNUserNotificationCenterClass_softClass;
  v7 = getUNUserNotificationCenterClass_softClass;
  if (!getUNUserNotificationCenterClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getUNUserNotificationCenterClass_block_invoke;
    v3[3] = &unk_24D3BB130;
    v3[4] = &v4;
    __getUNUserNotificationCenterClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21592E004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21592EEE4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_21592F2E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getUIImageClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!UIKitLibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_24D3BB6D0;
    v5 = 0;
    UIKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!UIKitLibraryCore_frameworkLibrary_0)
    __getUIImageClass_block_invoke_cold_1(&v3);
  result = objc_getClass("UIImage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getUIImageClass_block_invoke_cold_2();
  getUIImageClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getUNNotificationClass_block_invoke(uint64_t a1)
{
  Class result;

  UserNotificationsLibrary();
  result = objc_getClass("UNNotification");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getUNNotificationClass_block_invoke_cold_1();
  getUNNotificationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t UserNotificationsLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!UserNotificationsLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_24D3BB6E8;
    v3 = 0;
    UserNotificationsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!UserNotificationsLibraryCore_frameworkLibrary)
    UserNotificationsLibrary_cold_1(&v1);
  return UserNotificationsLibraryCore_frameworkLibrary;
}

void *__getabort_with_reasonSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!SystemLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D3BB720;
    v5 = 0;
    SystemLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SystemLibraryCore_frameworkLibrary)
    __getabort_with_reasonSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)SystemLibraryCore_frameworkLibrary, "abort_with_reason");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getabort_with_reasonSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getUNUserNotificationCenterClass_block_invoke(uint64_t a1)
{
  Class result;

  UserNotificationsLibrary();
  result = objc_getClass("UNUserNotificationCenter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getUNUserNotificationCenterClass_block_invoke_cold_1();
  getUNUserNotificationCenterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getUNNotificationResponseClass_block_invoke(uint64_t a1)
{
  Class result;

  UserNotificationsLibrary();
  result = objc_getClass("UNNotificationResponse");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getUNNotificationResponseClass_block_invoke_cold_1();
  getUNNotificationResponseClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x26u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x1Cu);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x26u);
}

uint64_t OUTLINED_FUNCTION_10(uint64_t result, uint64_t a2, uint64_t a3)
{
  int v3;

  *(_DWORD *)(a3 + 14) = v3;
  *(_WORD *)(a3 + 18) = 2114;
  *(_QWORD *)(a3 + 20) = result;
  *(_WORD *)(a3 + 28) = 2114;
  *(_QWORD *)(a3 + 30) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)a1 + 32), "count");
}

uint64_t SPProtoAudioFilePlayerCurrentTimeReadFrom(uint64_t a1, uint64_t a2)
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
      if ((v10 >> 3) == 1)
      {
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
        *(_QWORD *)(a1 + 8) = v21;
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

uint64_t SPProtoAudioFilePlayerAssetUpdateMetaDataReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;

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
              PBReaderReadString();
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = 32;
              goto LABEL_30;
            case 2u:
              PBReaderReadString();
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = 56;
              goto LABEL_30;
            case 3u:
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
              goto LABEL_31;
            case 4u:
              PBReaderReadString();
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = 48;
              goto LABEL_30;
            case 5u:
              PBReaderReadString();
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = 16;
              goto LABEL_30;
            case 6u:
              PBReaderReadString();
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = 24;
              goto LABEL_30;
            case 7u:
              PBReaderReadString();
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = 40;
LABEL_30:
              v24 = *(void **)(a1 + v19);
              *(_QWORD *)(a1 + v19) = v18;

              goto LABEL_31;
            default:
              result = PBReaderSkipValueWithTag();
              if (!(_DWORD)result)
                return result;
LABEL_31:
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

BOOL SPProtoCacheSyncDataReadFrom(uint64_t a1, uint64_t a2)
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
  SPProtoCacheAssets *v19;
  uint64_t v20;

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
        v19 = objc_alloc_init(SPProtoCacheAssets);
        v20 = 16;
LABEL_24:
        objc_storeStrong((id *)(a1 + v20), v19);
        if (!PBReaderPlaceMark() || (SPProtoCacheAssetsReadFrom(v19, a2) & 1) == 0)
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
        v19 = *(SPProtoCacheAssets **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v18;
LABEL_27:

        goto LABEL_29;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_29:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v19 = objc_alloc_init(SPProtoCacheAssets);
    v20 = 24;
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t SPProtoCacheMessageReadFrom(uint64_t a1, uint64_t a2)
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
  SPProtoCacheSyncData *v32;
  uint64_t v33;

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
            goto LABEL_43;
          v17 += 7;
          v14 = v18++ >= 9;
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
        v33 = 40;
        goto LABEL_50;
      case 2u:
        v24 = 0;
        v25 = 0;
        v19 = 0;
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
                goto LABEL_49;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_49:
        v33 = 24;
LABEL_50:
        *(_DWORD *)(a1 + v33) = v19;
        goto LABEL_51;
      case 3u:
        PBReaderReadString();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = 16;
        goto LABEL_38;
      case 4u:
        PBReaderReadString();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = 32;
        goto LABEL_38;
      case 5u:
        PBReaderReadData();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = 8;
LABEL_38:
        v31 = *(void **)(a1 + v30);
        *(_QWORD *)(a1 + v30) = v29;

        goto LABEL_51;
      case 6u:
        v32 = objc_alloc_init(SPProtoCacheSyncData);
        objc_storeStrong((id *)(a1 + 48), v32);
        if (PBReaderPlaceMark() && SPProtoCacheSyncDataReadFrom((uint64_t)v32, a2))
        {
          PBReaderRecallMark();

LABEL_51:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_51;
    }
  }
}

uint64_t SPProtoAudioFilePlayerStatusReadFrom(uint64_t a1, uint64_t a2)
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
          v18 = 32;
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
                  LODWORD(v22) = 0;
                  goto LABEL_42;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_42:
          *(_DWORD *)(a1 + 40) = v22;
          continue;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_38;
        case 4u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 44) |= 1u;
          break;
        case 5u:
          PBReaderReadData();
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

void sub_215934A20(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
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

void sub_215935E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getNRPairedDeviceRegistryClass_block_invoke_0(uint64_t a1)
{
  Class result;

  NanoRegistryLibrary_0();
  result = objc_getClass("NRPairedDeviceRegistry");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getNRPairedDeviceRegistryClass_block_invoke_cold_1_0();
  getNRPairedDeviceRegistryClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t NanoRegistryLibrary_0()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!NanoRegistryLibraryCore_frameworkLibrary_0)
  {
    v2 = xmmword_24D3BC270;
    v3 = 0;
    NanoRegistryLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!NanoRegistryLibraryCore_frameworkLibrary_0)
    NanoRegistryLibrary_cold_1_0(&v1);
  return NanoRegistryLibraryCore_frameworkLibrary_0;
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

void getXcodeSupportRemoteObjectProxy(void *a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  SPXcodeSupport *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  wk_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v16 = "getXcodeSupportRemoteObjectProxy";
    v17 = 1024;
    v18 = 80;
    _os_log_impl(&dword_215918000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: ", buf, 0x12u);
  }

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.companionappd"), 4096);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254DF3C60);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254DF2D88);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExportedInterface:", v5);

  v6 = objc_alloc_init(SPXcodeSupport);
  objc_msgSend(v3, "setExportedObject:", v6);

  objc_msgSend(v3, "resume");
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __getXcodeSupportRemoteObjectProxy_block_invoke;
  v13[3] = &unk_24D3BC308;
  v8 = v1;
  v14 = v8;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __getXcodeSupportRemoteObjectProxy_block_invoke_90;
    v10[3] = &unk_24D3BC330;
    v12 = v8;
    v11 = v9;
    spUtils_dispatchAsyncToMainThread(v10);

  }
}

void __getXcodeSupportRemoteObjectProxy_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __getXcodeSupportRemoteObjectProxy_block_invoke_2;
  v5[3] = &unk_24D3BB618;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  spUtils_dispatchAsyncToMainThread(v5);

}

uint64_t __getXcodeSupportRemoteObjectProxy_block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  wk_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __getXcodeSupportRemoteObjectProxy_block_invoke_2_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __getXcodeSupportRemoteObjectProxy_block_invoke_90(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void SPLaunchSockPuppetAppForCompanionAppWithIdentifier(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  wk_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v17 = "SPLaunchSockPuppetAppForCompanionAppWithIdentifier";
    v18 = 1024;
    v19 = 148;
    v20 = 2114;
    v21 = v5;
    v22 = 2114;
    v23 = v6;
    _os_log_impl(&dword_215918000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: companionAppIdentifier=%{public}@, options=%{public}@", buf, 0x26u);
  }

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __SPLaunchSockPuppetAppForCompanionAppWithIdentifier_block_invoke;
  v12[3] = &unk_24D3BC3A8;
  v14 = v5;
  v15 = v7;
  v13 = v6;
  v9 = v5;
  v10 = v6;
  v11 = v7;
  getXcodeSupportRemoteObjectProxy(v12);

}

void SPTerminateSockPuppetAppForCompanionAppWithIdentifier(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  wk_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v12 = "SPTerminateSockPuppetAppForCompanionAppWithIdentifier";
    v13 = 1024;
    v14 = 224;
    v15 = 2114;
    v16 = v3;
    _os_log_impl(&dword_215918000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: companionAppIdentifier=%{public}@", buf, 0x1Cu);
  }

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __SPTerminateSockPuppetAppForCompanionAppWithIdentifier_block_invoke;
  v8[3] = &unk_24D3BC3F8;
  v9 = v3;
  v10 = v4;
  v6 = v4;
  v7 = v3;
  getXcodeSupportRemoteObjectProxy(v8);

}

void SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  wk_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v12 = "SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier";
    v13 = 1024;
    v14 = 263;
    v15 = 2114;
    v16 = v3;
    _os_log_impl(&dword_215918000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: companionAppIdentifier=%{public}@", buf, 0x1Cu);
  }

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __SPGetSockPuppetAppRunningStatusForCompanionAppWithIdentifier_block_invoke;
  v8[3] = &unk_24D3BC470;
  v9 = v3;
  v10 = v4;
  v6 = v3;
  v7 = v4;
  getXcodeSupportRemoteObjectProxy(v8);

}

void SPGetCompanionExtensionPIDForCompanionAppWithIdentifier(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  wk_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v12 = "SPGetCompanionExtensionPIDForCompanionAppWithIdentifier";
    v13 = 1024;
    v14 = 286;
    v15 = 2114;
    v16 = v3;
    _os_log_impl(&dword_215918000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: companionAppIdentifier=%{public}@", buf, 0x1Cu);
  }

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __SPGetCompanionExtensionPIDForCompanionAppWithIdentifier_block_invoke;
  v8[3] = &unk_24D3BC470;
  v9 = v3;
  v10 = v4;
  v6 = v3;
  v7 = v4;
  getXcodeSupportRemoteObjectProxy(v8);

}

void SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  wk_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v12 = "SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier";
    v13 = 1024;
    v14 = 309;
    v15 = 2114;
    v16 = v3;
    _os_log_impl(&dword_215918000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: companionAppIdentifier=%{public}@", buf, 0x1Cu);
  }

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __SPXcodeWillInstallSockPuppetAppWithCompanionAppIdentifier_block_invoke;
  v8[3] = &unk_24D3BC470;
  v9 = v3;
  v10 = v4;
  v6 = v3;
  v7 = v4;
  getXcodeSupportRemoteObjectProxy(v8);

}

void OUTLINED_FUNCTION_6_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t SPProtoObjectMessageReadFrom(uint64_t a1, uint64_t a2)
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
  void *v18;
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

id _WKInterfaceControllerCreateClass(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, double a7, double a8, double a9, double a10)
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSString *v24;
  uint64_t v25;
  void *v26;
  objc_class *v27;
  id v28;
  objc_class *v29;
  objc_method *InstanceMethod;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;

  v19 = a2;
  v20 = a3;
  v21 = a4;
  v22 = a5;
  objc_storeStrong((id *)&__viewControllerID, a3);
  v23 = a6;
  v24 = a1;
  objc_storeStrong((id *)&__properties, a4);
  objc_storeStrong((id *)&__gestureDescriptions, a5);
  v25 = MEMORY[0x2199E8B48](v23);

  v26 = (void *)__remoteSetup;
  __remoteSetup = v25;

  *(double *)&__contentFrame = a7;
  *((double *)&__contentFrame + 1) = a8;
  qword_254DED118 = *(_QWORD *)&a9;
  unk_254DED120 = *(_QWORD *)&a10;
  v27 = NSClassFromString(v24);

  if (-[objc_class isSubclassOfClass:](v27, "isSubclassOfClass:", objc_opt_class()))
  {
    v28 = objc_alloc_init(v27);
  }
  else
  {
    v29 = (objc_class *)objc_opt_class();
    InstanceMethod = class_getInstanceMethod(v29, sel_initWithContext_);
    if (class_getInstanceMethod(v27, sel_initWithContext_) == InstanceMethod)
    {
      v31 = objc_alloc_init(v27);
      objc_msgSend(v31, "awakeWithContext:", v19);
      goto LABEL_7;
    }
    v28 = (id)objc_msgSend([v27 alloc], "initWithContext:", v19);
  }
  v31 = v28;
LABEL_7:
  v32 = (void *)__viewControllerID;
  __viewControllerID = 0;

  v33 = (void *)__gestureDescriptions;
  __gestureDescriptions = 0;

  v34 = (void *)__properties;
  __properties = 0;

  v35 = (void *)__remoteSetup;
  __remoteSetup = 0;

  v36 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
  __contentFrame = *MEMORY[0x24BDBF090];
  *(_OWORD *)&qword_254DED118 = v36;

  return v31;
}

uint64_t spUtils_uniqueNumber()
{
  void *v0;
  int v1;
  uint64_t v2;

  ++spUtils_uniqueNumber_counter;
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "processIdentifier");
  v2 = (unsigned __int16)spUtils_uniqueNumber_counter | (v1 << 16);

  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%X"), v2);
}

id spUtils_serializeObject(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v5;
  void *v6;
  id v7;

  v1 = a1;
  if (v1)
  {
    v7 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v1, 1, &v7);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v7;
    if (!v2)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSData *spUtils_serializeObject(__strong id)");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("SPUtils.m"), 89, CFSTR("Failed to archive object. Got error %@, object: %@"), v3, v1);

    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id spUtils_deserializeObject(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  if (a1)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v3, a1, &v8);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v8;
    if (!a1)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "id spUtils_deserializeObject(NSData *__strong, NSSet<Class> *__strong)");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("SPUtils.m"), 101, CFSTR("failed to unarchive data as one of %@: %@"), v3, v4);

    }
  }

  return a1;
}

id spUtils_allowedClassesForUserActivity()
{
  if (spUtils_allowedClassesForUserActivity_onceToken != -1)
    dispatch_once(&spUtils_allowedClassesForUserActivity_onceToken, &__block_literal_global_6);
  return (id)spUtils_allowedClassesForUserActivity___allowedClasses;
}

void __spUtils_allowedClassesForUserActivity_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v12 = (void *)MEMORY[0x24BDBCF20];
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)spUtils_allowedClassesForUserActivity___allowedClasses;
  spUtils_allowedClassesForUserActivity___allowedClasses = v10;

}

id spUtils_localizedStringForSystemLanguage(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  const __CFArray *v11;
  const __CFArray *v12;
  CFArrayRef v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  const __CFArray *v22;

  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v3;
  v9 = v5;
  v10 = v7;
  if (!objc_msgSend(v8, "length") || !objc_msgSend(CFSTR("Localizable"), "length") || !objc_msgSend(v10, "length"))
    goto LABEL_9;
  objc_msgSend(v9, "localizations");
  v11 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v10);
  v12 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  v13 = CFBundleCopyLocalizationsForPreferences(v11, v12);
  if (!-[__CFArray count](v13, "count"))
    goto LABEL_7;
  -[__CFArray objectAtIndex:](v13, "objectAtIndex:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pathForResource:ofType:inDirectory:forLocalization:", CFSTR("Localizable"), CFSTR("strings"), 0, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v15);
    v22 = v11;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v22;
  }
  else
  {
LABEL_7:
    v17 = 0;
  }

  if (!v17)
  {
LABEL_9:
    objc_msgSend(v9, "localizedStringForKey:value:table:", v8, &stru_24D3BD200, CFSTR("Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v18 = v17;
  if (!v17)
  {
    wk_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      spUtils_localizedStringForSystemLanguage_cold_1((uint64_t)v8, (uint64_t)v4, v19);

    v18 = v8;
  }
  v20 = v18;

  return v20;
}

BOOL spUtils_appExtensionFirstUnlock()
{
  NSObject *v0;
  _BOOL8 v1;
  NSObject *v2;
  uint64_t state64;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (spUtils_appExtensionFirstUnlock_onceToken != -1)
    dispatch_once(&spUtils_appExtensionFirstUnlock_onceToken, &__block_literal_global_30);
  state64 = 0;
  if (notify_get_state(spUtils_appExtensionFirstUnlock_token, &state64))
  {
    wk_default_log();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      spUtils_appExtensionFirstUnlock_cold_1();

    v1 = 1;
  }
  else
  {
    v1 = state64 != 0;
  }
  wk_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v6 = "spUtils_appExtensionFirstUnlock";
    v7 = 1024;
    v8 = 190;
    v9 = 1024;
    v10 = v1;
    _os_log_impl(&dword_215918000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: unlocked=%d", buf, 0x18u);
  }

  return v1;
}

void __spUtils_appExtensionFirstUnlock_block_invoke()
{
  BOOL v0;
  NSObject *v1;

  if (notify_register_check((const char *)objc_msgSend(CFSTR("com.apple.watchkit.notify.first_unlock"), "UTF8String"), &spUtils_appExtensionFirstUnlock_token))
  {
    v0 = 1;
  }
  else
  {
    v0 = spUtils_appExtensionFirstUnlock_token == -1;
  }
  if (v0)
  {
    wk_default_log();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __spUtils_appExtensionFirstUnlock_block_invoke_cold_1();

  }
}

uint64_t spUtils_machTimeString()
{
  uint64_t v0;

  v0 = mach_absolute_time();
  if (spUtils_machTimeString_onceToken != -1)
    dispatch_once(&spUtils_machTimeString_onceToken, &__block_literal_global_31);
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" [%013.06f]"), *(double *)&spUtils_machTimeString_mach_time_rate_i * (double)v0);
}

double __spUtils_machTimeString_block_invoke()
{
  unint64_t v0;
  unint64_t v1;
  double result;
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  result = (double)v0 / (double)v1 / 1000000000.0;
  spUtils_machTimeString_mach_time_rate_i = *(_QWORD *)&result;
  return result;
}

BOOL spUtils_isRunningInF5DemoMode()
{
  if (DemoProgramNumber___onceToken != -1)
    dispatch_once(&DemoProgramNumber___onceToken, &__block_literal_global_125);
  return DemoProgramNumber___fProgramNumber == 5;
}

BOOL spUtils_isRunningInF201DemoMode()
{
  if (DemoProgramNumber___onceToken != -1)
    dispatch_once(&DemoProgramNumber___onceToken, &__block_literal_global_125);
  return DemoProgramNumber___fProgramNumber == 201;
}

uint64_t spUtils_isRunningInAnyDemoMode()
{
  if (DemoProgramNumber___onceToken != -1)
    dispatch_once(&DemoProgramNumber___onceToken, &__block_literal_global_125);
  return DemoProgramNumber___demoModeEnabled;
}

BOOL spUtils_isRTL()
{
  void *v0;
  id v1;
  void *v2;
  _BOOL8 v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v0 = (void *)getUIApplicationClass_softClass;
  v9 = getUIApplicationClass_softClass;
  if (!getUIApplicationClass_softClass)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getUIApplicationClass_block_invoke;
    v5[3] = &unk_24D3BB130;
    v5[4] = &v6;
    __getUIApplicationClass_block_invoke((uint64_t)v5);
    v0 = (void *)v7[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v1, "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceLayoutDirection") == 1;

  return v3;
}

void sub_21593C03C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id spUtils_SPURLQueryAllowedCharacterSet()
{
  if (spUtils_SPURLQueryAllowedCharacterSet_onceToken != -1)
    dispatch_once(&spUtils_SPURLQueryAllowedCharacterSet_onceToken, &__block_literal_global_34);
  return (id)spUtils_SPURLQueryAllowedCharacterSet__spURLQueryAllowedCharacterSet;
}

id spUtils_companionConnectionClientIdentifier(int a1, int a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;

  if (a1 && a2)
  {
    wk_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      spUtils_companionConnectionClientIdentifier_cold_1();

  }
  spUtils_uniqueNumber();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!a1 || a2)
  {
    if (a2)
      v7 = CFSTR("-");
    else
      v7 = CFSTR("_");
    objc_msgSend(v5, "stringByAppendingString:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  return v6;
}

uint64_t spUtils_isApplicationCompanionConnectionClientIdentifier(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "hasSuffix:", CFSTR("_")) & 1) != 0)
    v2 = 0;
  else
    v2 = objc_msgSend(v1, "hasSuffix:", CFSTR("-")) ^ 1;

  return v2;
}

uint64_t spUtils_isNotificationCompanionConnectionClientIdentifier(void *a1, const char *a2)
{
  return objc_msgSend(a1, "hasSuffix:", CFSTR("-"));
}

uint64_t spUtils_isComplicationCompanionConnectionClientIdentifier(void *a1, const char *a2)
{
  return objc_msgSend(a1, "hasSuffix:", CFSTR("_"));
}

void spUtils_dispatchSyncToMainThread(void *a1)
{
  void (**block)(void);

  block = a1;
  if (isRunningOnMainQueue())
    block[2]();
  else
    dispatch_sync(MEMORY[0x24BDAC9B8], block);

}

BOOL isRunningOnMainQueue()
{
  if (_setupMainQueueSpecific_onceToken != -1)
    dispatch_once(&_setupMainQueueSpecific_onceToken, &__block_literal_global_139);
  return dispatch_get_specific(&kIsMainQueueKey) == (void *)MEMORY[0x24BDAC9B8];
}

void spUtils_dispatchAsyncToMainThread(void *a1)
{
  void (**block)(void);

  block = a1;
  if (isRunningOnMainQueue())
    block[2]();
  else
    dispatch_async(MEMORY[0x24BDAC9B8], block);

}

BOOL spUtils_subclassForObjectOverridesSelectorFromSuperclass(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5;

  v5 = objc_msgSend(a1, "methodForSelector:", a2);
  return v5 != objc_msgSend(a3, "instanceMethodForSelector:", a2);
}

id spUtils_UIColorFromString(void *a1)
{
  id v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  double v5;
  void *v6;
  float v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id UIColorClass;
  double v18;
  double v19;
  uint64_t v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  NSObject *v26;
  uint64_t v28;
  uint64_t v29;

  v1 = a1;
  v2 = objc_msgSend(v1, "rangeOfString:", CFSTR("@"));
  if (v3)
  {
    v4 = v2;
    v5 = 1.0;
    if (v2 < objc_msgSend(v1, "length") - 1)
    {
      objc_msgSend(v1, "substringFromIndex:", v4 + 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "floatValue");
      v8 = v7;

      v5 = fmin(fmax(v8, 0.0), 1.0);
    }
    objc_msgSend(v1, "substringToIndex:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 1.0;
    v9 = v1;
  }
  if ((objc_msgSend(v9, "hasSuffix:", CFSTR("Color")) & 1) == 0)
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("Color"));
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  if (objc_msgSend(v9, "hasPrefix:", CFSTR("_")))
  {
    do
    {
      objc_msgSend(v9, "substringFromIndex:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v11;
    }
    while ((objc_msgSend(v11, "hasPrefix:", CFSTR("_")) & 1) != 0);
  }
  else
  {
    v11 = v9;
  }
  v12 = NSSelectorFromString((NSString *)v11);
  getUIColorClass();
  v13 = (objc_class *)objc_opt_class();
  if (!class_getClassMethod(v13, v12))
  {

LABEL_19:
    v28 = 0;
    v29 = 0;
    if (objc_msgSend(v1, "length"))
    {
      switch(sscanf((const char *)objc_msgSend(objc_retainAutorelease(v1), "cStringUsingEncoding:", 1), "%02x%02x%02x%02x", (char *)&v29 + 4, &v29, (char *)&v28 + 4, &v28))
      {
        case 1:
          UIColorClass = getUIColorClass();
          v18 = (double)SHIDWORD(v29) / 255.0;
          v19 = 1.0;
          goto LABEL_23;
        case 2:
          UIColorClass = getUIColorClass();
          v18 = (double)SHIDWORD(v29) / 255.0;
          v19 = (double)(int)v29 / 255.0;
LABEL_23:
          objc_msgSend(UIColorClass, "colorWithWhite:alpha:", v18, v19);
          v20 = objc_claimAutoreleasedReturnValue();
          goto LABEL_27;
        case 3:
          v21 = getUIColorClass();
          v22 = (double)SHIDWORD(v29) / 255.0;
          v23 = (double)(int)v29 / 255.0;
          v24 = (double)SHIDWORD(v28) / 255.0;
          v25 = 1.0;
          goto LABEL_26;
        case 4:
          v21 = getUIColorClass();
          v22 = (double)SHIDWORD(v29) / 255.0;
          v23 = (double)(int)v29 / 255.0;
          v24 = (double)SHIDWORD(v28) / 255.0;
          v25 = (double)(int)v28 / 255.0;
LABEL_26:
          objc_msgSend(v21, "colorWithRed:green:blue:alpha:", v22, v23, v24, v25);
          v20 = objc_claimAutoreleasedReturnValue();
LABEL_27:
          v15 = (void *)v20;
          if (!v20)
            break;
          goto LABEL_31;
        default:
          break;
      }
    }
    wk_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      spUtils_UIColorFromString_cold_1();

    v15 = 0;
    goto LABEL_31;
  }
  getUIColorClass();
  objc_msgSend((id)objc_opt_class(), "performSelector:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14 && v5 < 1.0)
  {
    objc_msgSend(v14, "colorWithAlphaComponent:", v5);
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }

  if (!v15)
    goto LABEL_19;
LABEL_31:

  return v15;
}

id getUIColorClass()
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
  v0 = (void *)getUIColorClass_softClass;
  v7 = getUIColorClass_softClass;
  if (!getUIColorClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getUIColorClass_block_invoke;
    v3[3] = &unk_24D3BB130;
    v3[4] = &v4;
    __getUIColorClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21593C70C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21593CA34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIApplicationClass_block_invoke(uint64_t a1)
{
  Class result;

  UIKitLibrary_0();
  result = objc_getClass("UIApplication");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getUIApplicationClass_block_invoke_cold_1();
  getUIApplicationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void UIKitLibrary_0()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = 0;
  if (!UIKitLibraryCore_frameworkLibrary_1)
  {
    v1 = xmmword_24D3BC9B0;
    v2 = 0;
    UIKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!UIKitLibraryCore_frameworkLibrary_1)
    UIKitLibrary_cold_1_0(&v0);
}

Class __getUIColorClass_block_invoke(uint64_t a1)
{
  Class result;

  UIKitLibrary_0();
  result = objc_getClass("UIColor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getUIColorClass_block_invoke_cold_1();
  getUIColorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void ___setupMainQueueSpecific_block_invoke()
{
  dispatch_queue_set_specific(MEMORY[0x24BDAC9B8], &kIsMainQueueKey, MEMORY[0x24BDAC9B8], 0);
}

Class __getUIFontClass_block_invoke(uint64_t a1)
{
  Class result;

  UIKitLibrary_0();
  result = objc_getClass("UIFont");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getUIFontClass_block_invoke_cold_1();
  getUIFontClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getUIFontDescriptorClass_block_invoke(uint64_t a1)
{
  Class result;

  UIKitLibrary_0();
  result = objc_getClass("UIFontDescriptor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getUIFontDescriptorClass_block_invoke_cold_1();
  getUIFontDescriptorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_1_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Eu);
}

BOOL SPProtoAudioFileQueuePlayerSetItemsReadFrom(_QWORD *a1, uint64_t a2)
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
  void *v18;

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
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)a1[1];
        a1[1] = v17;
LABEL_23:

        goto LABEL_25;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_25:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      objc_msgSend(a1, "addPlayerItemIdentifiers:", v18);
    goto LABEL_23;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id wk_default_log()
{
  if (wk_default_log_onceToken != -1)
    dispatch_once(&wk_default_log_onceToken, &__block_literal_global_7);
  return (id)wk_default_log___logger;
}

void __wk_default_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.watchkit", "default");
  v1 = (void *)wk_default_log___logger;
  wk_default_log___logger = (uint64_t)v0;

}

id wk_extension_loading_log()
{
  if (wk_extension_loading_log_onceToken != -1)
    dispatch_once(&wk_extension_loading_log_onceToken, &__block_literal_global_3);
  return (id)wk_extension_loading_log___logger;
}

void __wk_extension_loading_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.watchkit", "extension_loading");
  v1 = (void *)wk_extension_loading_log___logger;
  wk_extension_loading_log___logger = (uint64_t)v0;

}

id wk_bg_app_refresh_log()
{
  if (wk_bg_app_refresh_log_onceToken != -1)
    dispatch_once(&wk_bg_app_refresh_log_onceToken, &__block_literal_global_5);
  return (id)wk_bg_app_refresh_log___logger;
}

void __wk_bg_app_refresh_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.watchkit", "bg_app_refresh");
  v1 = (void *)wk_bg_app_refresh_log___logger;
  wk_bg_app_refresh_log___logger = (uint64_t)v0;

}

void ____allowedClasses_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  spUtils_allowedClassesForUserActivity();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__allowedClasses___allowedClasses;
  __allowedClasses___allowedClasses = v0;

  v2 = (void *)__allowedClasses___allowedClasses;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v3, v6, v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)__allowedClasses___allowedClasses;
  __allowedClasses___allowedClasses = v4;

}

uint64_t SPProtoAudioFileQueuePlayerSetRateReadFrom(uint64_t a1, uint64_t a2)
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
  void *v20;
  uint64_t v21;
  unint64_t v22;
  int v23;
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
      if ((v10 >> 3) == 2)
      {
        v21 = *v3;
        v22 = *(_QWORD *)(a2 + v21);
        if (v22 <= 0xFFFFFFFFFFFFFFFBLL && v22 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v23 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + v16) = 1;
          v23 = 0;
        }
        *(_DWORD *)(a1 + 16) = v23;
      }
      else if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = *(void **)(a1 + 8);
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

uint64_t SPProtoSockPuppetPlistReadFrom(void *a1, uint64_t a2)
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
  SPProtoSockPuppetObject *v17;
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
        v17 = objc_alloc_init(SPProtoSockPuppetObject);
        objc_msgSend(a1, "addObject:", v17);
        if (!PBReaderPlaceMark() || (SPProtoSockPuppetObjectReadFrom((uint64_t)v17, a2) & 1) == 0)
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

BOOL SPProtoAudioFilePlayerAssetReadFrom(uint64_t a1, uint64_t a2)
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
  SPProtoAudioFilePlayerAssetUpdateMetaData *v17;

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
        v17 = objc_alloc_init(SPProtoAudioFilePlayerAssetUpdateMetaData);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark()
          || (SPProtoAudioFilePlayerAssetUpdateMetaDataReadFrom((uint64_t)v17, a2) & 1) == 0)
        {
          goto LABEL_30;
        }
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
    v17 = objc_alloc_init(SPProtoObjectMessage);
    objc_storeStrong((id *)(a1 + 8), v17);
    if (!PBReaderPlaceMark() || (SPProtoObjectMessageReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL SPProtoAudioFilePlayerItemReadFrom(id *a1, uint64_t a2)
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
  SPProtoAudioFilePlayerUpdateContainedIdentifier *v17;
  uint64_t v18;

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
        v17 = objc_alloc_init(SPProtoAudioFilePlayerUpdateContainedIdentifier);
        objc_storeStrong(a1 + 8, v17);
        if (PBReaderPlaceMark()
          && SPProtoAudioFilePlayerUpdateContainedIdentifierReadFrom((uint64_t)v17, a2))
        {
          goto LABEL_34;
        }
        goto LABEL_39;
      case 2u:
        v17 = objc_alloc_init(SPProtoObjectMessage);
        v18 = 1;
        goto LABEL_32;
      case 3u:
        v17 = objc_alloc_init(SPProtoAudioFilePlayerStatus);
        objc_storeStrong(a1 + 7, v17);
        if (!PBReaderPlaceMark() || (SPProtoAudioFilePlayerStatusReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_39;
        goto LABEL_34;
      case 4u:
        v17 = objc_alloc_init(SPProtoObjectMessage);
        v18 = 2;
        goto LABEL_32;
      case 5u:
        v17 = objc_alloc_init(SPProtoObjectMessage);
        v18 = 5;
        goto LABEL_32;
      case 6u:
        v17 = objc_alloc_init(SPProtoObjectMessage);
        v18 = 3;
        goto LABEL_32;
      case 7u:
        v17 = objc_alloc_init(SPProtoObjectMessage);
        v18 = 4;
LABEL_32:
        objc_storeStrong(&a1[v18], v17);
        if (PBReaderPlaceMark() && (SPProtoObjectMessageReadFrom((uint64_t)v17, a2) & 1) != 0)
          goto LABEL_34;
        goto LABEL_39;
      case 8u:
        v17 = objc_alloc_init(SPProtoAudioFilePlayerItemSetCurrentTime);
        objc_storeStrong(a1 + 6, v17);
        if (PBReaderPlaceMark()
          && (SPProtoAudioFilePlayerItemSetCurrentTimeReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
LABEL_34:
          PBReaderRecallMark();

LABEL_35:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_39:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_35;
    }
  }
}

uint64_t SPProtoAudioFilePlayerItemSetCurrentTimeReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v22;
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

BOOL SPProtoSockPuppetMessageReadFrom(uint64_t a1, uint64_t a2)
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
  SPProtoSockPuppetPlist *v17;

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
        v17 = objc_alloc_init(SPProtoSockPuppetPlist);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark() || (SPProtoSockPuppetPlistReadFrom(v17, a2) & 1) == 0)
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
    v17 = objc_alloc_init(SPProtoAudioFilePlayerMessage);
    objc_storeStrong((id *)(a1 + 8), v17);
    if (!PBReaderPlaceMark() || !SPProtoAudioFilePlayerMessageReadFrom((id *)&v17->super.super.isa, a2))
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_215945E10(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215945E90(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215946074(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2159461C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2159462D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2159463BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215946464(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2159464EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215946554(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2159465AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_215946604(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215946678(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_5_0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, int a3@<W8>)
{
  *(_DWORD *)(a2 + 14) = a3;
  *(_WORD *)(a2 + 18) = 2114;
  *(_QWORD *)(a2 + 20) = result;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SPPluginDelegate *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  CTFontSetAltTextStyleSpec();
  v32 = 0;
  v33 = &v32;
  v34 = 0x2050000000;
  v3 = (void *)getNRPairedDeviceRegistryClass_softClass_1;
  v35 = getNRPairedDeviceRegistryClass_softClass_1;
  if (!getNRPairedDeviceRegistryClass_softClass_1)
  {
    v27 = MEMORY[0x24BDAC760];
    v28 = 3221225472;
    v29 = (uint64_t)__getNRPairedDeviceRegistryClass_block_invoke_1;
    v30 = &unk_24D3BB130;
    v31 = &v32;
    __getNRPairedDeviceRegistryClass_block_invoke_1((uint64_t)&v27);
    v3 = (void *)v33[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v32, 8);
  objc_msgSend(v4, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0;
  v33 = &v32;
  v34 = 0x2050000000;
  v8 = (void *)getNPSDomainAccessorClass_softClass;
  v35 = getNPSDomainAccessorClass_softClass;
  if (!getNPSDomainAccessorClass_softClass)
  {
    v27 = MEMORY[0x24BDAC760];
    v28 = 3221225472;
    v29 = (uint64_t)__getNPSDomainAccessorClass_block_invoke;
    v30 = &unk_24D3BB130;
    v31 = &v32;
    __getNPSDomainAccessorClass_block_invoke((uint64_t)&v27);
    v8 = (void *)v33[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v32, 8);
  v10 = (void *)objc_msgSend([v9 alloc], "initWithDomain:", CFSTR(".GlobalPreferences"));
  v11 = (id)objc_msgSend(v10, "synchronize");
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBool:forKey:", objc_msgSend(v10, "BOOLForKey:", CFSTR("AppleICUForce24HourTime")), CFSTR("AppleICUForce24HourTime"));

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBool:forKey:", objc_msgSend(v10, "BOOLForKey:", CFSTR("AppleICUForce12HourTime")), CFSTR("AppleICUForce12HourTime"));

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = (uint64_t)&v27;
  v29 = 0x2020000000;
  v15 = (_QWORD *)getNRDevicePropertyPreferredLanguagesSymbolLoc_ptr;
  v30 = (void *)getNRDevicePropertyPreferredLanguagesSymbolLoc_ptr;
  if (!getNRDevicePropertyPreferredLanguagesSymbolLoc_ptr)
  {
    v16 = (void *)NanoRegistryLibrary_1();
    v15 = dlsym(v16, "NRDevicePropertyPreferredLanguages");
    *(_QWORD *)(v28 + 24) = v15;
    getNRDevicePropertyPreferredLanguagesSymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(&v27, 8);
  if (!v15)
    main_cold_1();
  objc_msgSend(v7, "valueForProperty:", *v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v17, CFSTR("AppleLanguages"));

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = (uint64_t)&v27;
  v29 = 0x2020000000;
  v19 = (_QWORD *)getNRDevicePropertyCurrentUserLocaleSymbolLoc_ptr_0;
  v30 = (void *)getNRDevicePropertyCurrentUserLocaleSymbolLoc_ptr_0;
  if (!getNRDevicePropertyCurrentUserLocaleSymbolLoc_ptr_0)
  {
    v20 = (void *)NanoRegistryLibrary_1();
    v19 = dlsym(v20, "NRDevicePropertyCurrentUserLocale");
    *(_QWORD *)(v28 + 24) = v19;
    getNRDevicePropertyCurrentUserLocaleSymbolLoc_ptr_0 = (uint64_t)v19;
  }
  _Block_object_dispose(&v27, 8);
  if (!v19)
    main_cold_2();
  objc_msgSend(v7, "valueForProperty:", *v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v21, CFSTR("AppleLocale"));

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "synchronize");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "postNotificationName:object:", *MEMORY[0x24BDBCA70], 0);

  objc_msgSend(MEMORY[0x24BE72FC0], "defaultService");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_alloc_init(SPPluginDelegate);
  objc_msgSend(v24, "setDelegate:", v25);

  objc_msgSend(v24, "run");
  return 0;
}

void sub_215946BA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getNRPairedDeviceRegistryClass_block_invoke_1(uint64_t a1)
{
  Class result;

  NanoRegistryLibrary_1();
  result = objc_getClass("NRPairedDeviceRegistry");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getNRPairedDeviceRegistryClass_block_invoke_cold_1_1();
  getNRPairedDeviceRegistryClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t NanoRegistryLibrary_1()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!NanoRegistryLibraryCore_frameworkLibrary_1)
  {
    v2 = xmmword_24D3BCA68;
    v3 = 0;
    NanoRegistryLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!NanoRegistryLibraryCore_frameworkLibrary_1)
    NanoRegistryLibrary_cold_1_1(&v1);
  return NanoRegistryLibraryCore_frameworkLibrary_1;
}

Class __getNPSDomainAccessorClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D3BCA80;
    v5 = 0;
    NanoPreferencesSyncLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
    __getNPSDomainAccessorClass_block_invoke_cold_1(&v3);
  result = objc_getClass("NPSDomainAccessor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getNPSDomainAccessorClass_block_invoke_cold_2();
  getNPSDomainAccessorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void getNRDevicePropertyLocalizedModel_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getNRDevicePropertyLocalizedModel(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("WKInterfaceDevice.m"), 46, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void __getNRPairedDeviceRegistryClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getNRPairedDeviceRegistryClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WKInterfaceDevice.m"), 40, CFSTR("Unable to find class %s"), "NRPairedDeviceRegistry");

  __break(1u);
}

void NanoRegistryLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *NanoRegistryLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WKInterfaceDevice.m"), 39, CFSTR("%s"), *a1);

  __break(1u);
}

void UIKitLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *UIKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WKInterfaceDevice.m"), 34, CFSTR("%s"), *a1);

  __break(1u);
}

void __abort_with_reason_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void __abort_with_reason(uint32_t, uint64_t, const char *, uint64_t)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SPUtils.h"), 15, CFSTR("%s"), dlerror());

  __break(1u);
}

void __getUIImageClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *UIKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SPRemoteInterface.m"), 156, CFSTR("%s"), *a1);

  __break(1u);
}

void __getUIImageClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getUIImageClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SPRemoteInterface.m"), 157, CFSTR("Unable to find class %s"), "UIImage");

  __break(1u);
}

void __getUNNotificationClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getUNNotificationClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SPRemoteInterface.m"), 96, CFSTR("Unable to find class %s"), "UNNotification");

  __break(1u);
}

void UserNotificationsLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *UserNotificationsLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SPRemoteInterface.m"), 87, CFSTR("%s"), *a1);

  __break(1u);
}

void __getabort_with_reasonSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SystemLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SPUtils.h"), 14, CFSTR("%s"), *a1);

  __break(1u);
}

void __getUNUserNotificationCenterClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getUNUserNotificationCenterClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SPRemoteInterface.m"), 88, CFSTR("Unable to find class %s"), "UNUserNotificationCenter");

  __break(1u);
}

void __getUNNotificationResponseClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getUNNotificationResponseClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SPRemoteInterface.m"), 90, CFSTR("Unable to find class %s"), "UNNotificationResponse");

  __break(1u);
}

void __getNRPairedDeviceRegistryClass_block_invoke_cold_1_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getNRPairedDeviceRegistryClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SPDeviceConnection.m"), 42, CFSTR("Unable to find class %s"), "NRPairedDeviceRegistry");

  __break(1u);
}

void NanoRegistryLibrary_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *NanoRegistryLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SPDeviceConnection.m"), 41, CFSTR("%s"), *a1);

  __break(1u);
}

void __getXcodeSupportRemoteObjectProxy_block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_215918000, a2, a3, "%{public}s:%d: error %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void spUtils_localizedStringForSystemLanguage_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  __int16 v7;
  int v8;
  _WORD v9[10];
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileExistsAtPath:", a2);
  *(_DWORD *)v9 = 136447234;
  OUTLINED_FUNCTION_0_1();
  *(_DWORD *)&v9[7] = 157;
  v9[9] = 2114;
  v10 = a1;
  v11 = 2114;
  v12 = a2;
  v13 = v7;
  v14 = v8;
  _os_log_error_impl(&dword_215918000, a3, OS_LOG_TYPE_ERROR, "%{public}s:%d: Failed to localize key \"%{public}@\" in bundle at %{public}@. bundleExists=%d", (uint8_t *)v9, 0x2Cu);

}

void spUtils_appExtensionFirstUnlock_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_5(&dword_215918000, v0, v1, "%{public}s:%d: notify_get_state failed with error=%d token=%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __spUtils_appExtensionFirstUnlock_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_5(&dword_215918000, v0, v1, "%{public}s:%d: notify_register_check failed with error=%d token=%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

void spUtils_companionConnectionClientIdentifier_cold_1()
{
  os_log_t v0;
  _DWORD v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136446466;
  OUTLINED_FUNCTION_0_1();
  *(_DWORD *)((char *)&v1[3] + 2) = 280;
  _os_log_error_impl(&dword_215918000, v0, OS_LOG_TYPE_ERROR, "%{public}s:%d: isApplication and isNotification can't both be true", (uint8_t *)v1, 0x12u);
}

void spUtils_UIColorFromString_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  _WORD v2[10];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v2 = 136446722;
  OUTLINED_FUNCTION_0_1();
  *(_DWORD *)&v2[7] = 364;
  v2[9] = 2114;
  v3 = v0;
  _os_log_error_impl(&dword_215918000, v1, OS_LOG_TYPE_ERROR, "%{public}s:%d: Error - unable to parse string '%{public}@' as UIColor method or hex value", (uint8_t *)v2, 0x1Cu);
  OUTLINED_FUNCTION_2_0();
}

void __getUIApplicationClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getUIApplicationClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SPUtils.m"), 54, CFSTR("Unable to find class %s"), "UIApplication");

  __break(1u);
}

void UIKitLibrary_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *UIKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SPUtils.m"), 53, CFSTR("%s"), *a1);

  __break(1u);
}

void __getUIColorClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getUIColorClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SPUtils.m"), 55, CFSTR("Unable to find class %s"), "UIColor");

  __break(1u);
}

void __getUIFontClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getUIFontClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SPUtils.m"), 56, CFSTR("Unable to find class %s"), "UIFont");

  __break(1u);
}

void __getUIFontDescriptorClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getUIFontDescriptorClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SPUtils.m"), 57, CFSTR("Unable to find class %s"), "UIFontDescriptor");

  __break(1u);
}

void main_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getNRDevicePropertyPreferredLanguages(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("main.m"), 30, CFSTR("%s"), dlerror());

  __break(1u);
}

void main_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getNRDevicePropertyCurrentUserLocale(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("main.m"), 29, CFSTR("%s"), dlerror());

  __break(1u);
}

void __getNRPairedDeviceRegistryClass_block_invoke_cold_1_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getNRPairedDeviceRegistryClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("main.m"), 28, CFSTR("Unable to find class %s"), "NRPairedDeviceRegistry");

  __break(1u);
}

void NanoRegistryLibrary_cold_1_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *NanoRegistryLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("main.m"), 27, CFSTR("%s"), *a1);

  __break(1u);
}

void __getNPSDomainAccessorClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *NanoPreferencesSyncLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("main.m"), 31, CFSTR("%s"), *a1);

  __break(1u);
}

void __getNPSDomainAccessorClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getNPSDomainAccessorClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("main.m"), 32, CFSTR("Unable to find class %s"), "NPSDomainAccessor");

  __break(1u);
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC300](data, *(_QWORD *)&len, md);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x24BDBBA60](locArray, prefArray);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC190](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C0](rl, observer, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

CFRunLoopObserverRef CFRunLoopObserverCreate(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context)
{
  return (CFRunLoopObserverRef)MEMORY[0x24BDBC320](allocator, activities, repeats, order, callout, context);
}

void CFRunLoopRemoveObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC340](rl, observer, mode);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDAF0](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x24BDBDAF8](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x24BDBDB08](color);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x24BDBDC10](space);
}

uint64_t CTFontSetAltTextStyleSpec()
{
  return MEMORY[0x24BDC49B8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD0DD8]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
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

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC938](*(_QWORD *)&a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x24BEDCE70](cls, outCount);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x24BEDCE90](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x24BEDCEA0](cls, name);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCE0](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCF8](queue, block);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x24BDADDB0](key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x24BDADF00](queue, key, context, destructor);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x24BEDCF38](m);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDAF168](name, out_token);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x24BEDD460](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int rand(void)
{
  return MEMORY[0x24BDAFA38]();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x24BDAFE00](*(_QWORD *)&a1, a2);
}

void srand(unsigned int a1)
{
  MEMORY[0x24BDAFE80](*(_QWORD *)&a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

