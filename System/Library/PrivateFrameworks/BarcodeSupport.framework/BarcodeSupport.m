id getNFHardwareManagerClass()
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
  v0 = (void *)getNFHardwareManagerClass_softClass;
  v7 = getNFHardwareManagerClass_softClass;
  if (!getNFHardwareManagerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getNFHardwareManagerClass_block_invoke;
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __getNFHardwareManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21748E698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getNFHardwareManagerClass_0()
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
  v0 = (void *)getNFHardwareManagerClass_softClass_0;
  v7 = getNFHardwareManagerClass_softClass_0;
  if (!getNFHardwareManagerClass_softClass_0)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getNFHardwareManagerClass_block_invoke_0;
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __getNFHardwareManagerClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21748E750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AWDBarcodeSupportCodeActivatedEventReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v50;

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
          *(_BYTE *)(a1 + 36) |= 1u;
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
              goto LABEL_64;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              v19 = 0;
              goto LABEL_66;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_64:
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_66:
          *(_QWORD *)(a1 + 8) = v19;
          continue;
        case 2u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 36) |= 0x20u;
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
                  goto LABEL_70;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v26) = 0;
LABEL_70:
          v50 = 32;
          goto LABEL_87;
        case 3u:
          v30 = 0;
          v31 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 36) |= 4u;
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
                  LODWORD(v26) = 0;
                  goto LABEL_74;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v26) = 0;
LABEL_74:
          v50 = 20;
          goto LABEL_87;
        case 4u:
          v35 = 0;
          v36 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 36) |= 0x10u;
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
              v26 |= (unint64_t)(v39 & 0x7F) << v35;
              if (v39 < 0)
              {
                v35 += 7;
                v14 = v36++ >= 9;
                if (v14)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_78;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v26) = 0;
LABEL_78:
          v50 = 28;
          goto LABEL_87;
        case 5u:
          v40 = 0;
          v41 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 36) |= 2u;
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
              v26 |= (unint64_t)(v44 & 0x7F) << v40;
              if (v44 < 0)
              {
                v40 += 7;
                v14 = v41++ >= 9;
                if (v14)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_82;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v26) = 0;
LABEL_82:
          v50 = 16;
          goto LABEL_87;
        case 6u:
          v45 = 0;
          v46 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 36) |= 8u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v47 = *v3;
        v48 = *(_QWORD *)(a2 + v47);
        if (v48 == -1 || v48 >= *(_QWORD *)(a2 + *v4))
          break;
        v49 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v48);
        *(_QWORD *)(a2 + v47) = v48 + 1;
        v26 |= (unint64_t)(v49 & 0x7F) << v45;
        if ((v49 & 0x80) == 0)
          goto LABEL_84;
        v45 += 7;
        v14 = v46++ >= 9;
        if (v14)
        {
          LODWORD(v26) = 0;
          goto LABEL_86;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_84:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v26) = 0;
LABEL_86:
      v50 = 24;
LABEL_87:
      *(_DWORD *)(a1 + v50) = v26;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_21749048C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, os_activity_scope_state_s state, char a18)
{
  id *v18;

  _Block_object_dispose(&a18, 8);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void *__getVNBarcodeSymbologyAppClipCodeSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!VisionLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D787178;
    v5 = 0;
    VisionLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!VisionLibraryCore_frameworkLibrary)
    __getVNBarcodeSymbologyAppClipCodeSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)VisionLibraryCore_frameworkLibrary, "VNBarcodeSymbologyAppClipCode");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getVNBarcodeSymbologyAppClipCodeSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AWDBarcodeSupportCodeDetectedEventReadFrom(uint64_t a1, uint64_t a2)
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
  unint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;

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
          *(_BYTE *)(a1 + 48) |= 2u;
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
              v19 = 0;
              goto LABEL_80;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_78:
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_80:
          v60 = 16;
          goto LABEL_93;
        case 2u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 48) |= 0x40u;
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
                  goto LABEL_84;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v26) = 0;
LABEL_84:
          v61 = 40;
          goto LABEL_110;
        case 3u:
          v30 = 0;
          v31 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 48) |= 8u;
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
                  LODWORD(v26) = 0;
                  goto LABEL_88;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v26) = 0;
LABEL_88:
          v61 = 28;
          goto LABEL_110;
        case 4u:
          v35 = 0;
          v36 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 48) |= 1u;
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
              v19 |= (unint64_t)(v39 & 0x7F) << v35;
              if (v39 < 0)
              {
                v35 += 7;
                v14 = v36++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_92;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_92:
          v60 = 8;
LABEL_93:
          *(_QWORD *)(a1 + v60) = v19;
          continue;
        case 5u:
          v40 = 0;
          v41 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 48) |= 0x80u;
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
              v26 |= (unint64_t)(v44 & 0x7F) << v40;
              if (v44 < 0)
              {
                v40 += 7;
                v14 = v41++ >= 9;
                if (v14)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_97;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v26) = 0;
LABEL_97:
          v61 = 44;
          goto LABEL_110;
        case 6u:
          v45 = 0;
          v46 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 48) |= 0x20u;
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
              v26 |= (unint64_t)(v49 & 0x7F) << v45;
              if (v49 < 0)
              {
                v45 += 7;
                v14 = v46++ >= 9;
                if (v14)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_101;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v26) = 0;
LABEL_101:
          v61 = 36;
          goto LABEL_110;
        case 7u:
          v50 = 0;
          v51 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 48) |= 4u;
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
              v26 |= (unint64_t)(v54 & 0x7F) << v50;
              if (v54 < 0)
              {
                v50 += 7;
                v14 = v51++ >= 9;
                if (v14)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_105;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v26) = 0;
LABEL_105:
          v61 = 24;
          goto LABEL_110;
        case 8u:
          v55 = 0;
          v56 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 48) |= 0x10u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v57 = *v3;
        v58 = *(_QWORD *)(a2 + v57);
        if (v58 == -1 || v58 >= *(_QWORD *)(a2 + *v4))
          break;
        v59 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v58);
        *(_QWORD *)(a2 + v57) = v58 + 1;
        v26 |= (unint64_t)(v59 & 0x7F) << v55;
        if ((v59 & 0x80) == 0)
          goto LABEL_107;
        v55 += 7;
        v14 = v56++ >= 9;
        if (v14)
        {
          LODWORD(v26) = 0;
          goto LABEL_109;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_107:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v26) = 0;
LABEL_109:
      v61 = 32;
LABEL_110:
      *(_DWORD *)(a1 + v61) = v26;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t AWDBarcodeSupportCodePreviewedEventReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v26;
  unint64_t v27;
  char v28;
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
        v23 = 0;
        v24 = 0;
        v25 = 0;
        *(_BYTE *)(a1 + 20) |= 2u;
        while (1)
        {
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
            break;
          v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
          *(_QWORD *)(a2 + v26) = v27 + 1;
          v25 |= (unint64_t)(v28 & 0x7F) << v23;
          if ((v28 & 0x80) == 0)
            goto LABEL_41;
          v23 += 7;
          v14 = v24++ >= 9;
          if (v14)
          {
            LODWORD(v25) = 0;
            goto LABEL_43;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v25) = 0;
LABEL_43:
        *(_DWORD *)(a1 + 16) = v25;
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
            goto LABEL_37;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_39;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_39:
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

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id OUTLINED_FUNCTION_1(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

uint64_t MobileCoreServicesLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = MobileCoreServicesLibraryCore_frameworkLibrary;
  v6 = MobileCoreServicesLibraryCore_frameworkLibrary;
  if (!MobileCoreServicesLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_24D7873B0;
    v8 = *(_OWORD *)&off_24D7873C0;
    v1 = _sl_dlopen();
    v4[3] = v1;
    MobileCoreServicesLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_217494960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t MobileCoreServicesLibrary()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = MobileCoreServicesLibraryCore();
  if (!result)
    MobileCoreServicesLibrary_cold_1(&v1);
  return result;
}

id getLSAppLinkClass()
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
  v0 = (void *)getLSAppLinkClass_softClass;
  v7 = getLSAppLinkClass_softClass;
  if (!getLSAppLinkClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getLSAppLinkClass_block_invoke;
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __getLSAppLinkClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_217494A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLSAppLinkClass_block_invoke(uint64_t a1)
{
  Class result;

  MobileCoreServicesLibrary();
  result = objc_getClass("LSAppLink");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getLSAppLinkClass_block_invoke_cold_1();
  getLSAppLinkClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getLSApplicationProxyClass()
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
  v0 = (void *)getLSApplicationProxyClass_softClass;
  v7 = getLSApplicationProxyClass_softClass;
  if (!getLSApplicationProxyClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getLSApplicationProxyClass_block_invoke;
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __getLSApplicationProxyClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_217494B74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLSApplicationProxyClass_block_invoke(uint64_t a1)
{
  Class result;

  MobileCoreServicesLibrary();
  result = objc_getClass("LSApplicationProxy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getLSApplicationProxyClass_block_invoke_cold_1();
  getLSApplicationProxyClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getLSApplicationRecordClass()
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
  v0 = (void *)getLSApplicationRecordClass_softClass;
  v7 = getLSApplicationRecordClass_softClass;
  if (!getLSApplicationRecordClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getLSApplicationRecordClass_block_invoke;
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __getLSApplicationRecordClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_217494C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLSApplicationRecordClass_block_invoke(uint64_t a1)
{
  Class result;

  MobileCoreServicesLibrary();
  result = objc_getClass("LSApplicationRecord");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getLSApplicationRecordClass_block_invoke_cold_1();
  getLSApplicationRecordClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getLSApplicationWorkspaceClass()
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
  v0 = (void *)getLSApplicationWorkspaceClass_softClass;
  v7 = getLSApplicationWorkspaceClass_softClass;
  if (!getLSApplicationWorkspaceClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getLSApplicationWorkspaceClass_block_invoke;
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __getLSApplicationWorkspaceClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_217494D8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLSApplicationWorkspaceClass_block_invoke(uint64_t a1)
{
  Class result;

  MobileCoreServicesLibrary();
  result = objc_getClass("LSApplicationWorkspace");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getLSApplicationWorkspaceClass_block_invoke_cold_1();
  getLSApplicationWorkspaceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2174951C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t NetworkExtensionLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = NetworkExtensionLibraryCore_frameworkLibrary;
  v6 = NetworkExtensionLibraryCore_frameworkLibrary;
  if (!NetworkExtensionLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_24D787460;
    v8 = *(_OWORD *)&off_24D787470;
    v1 = _sl_dlopen();
    v4[3] = v1;
    NetworkExtensionLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_21749566C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t NetworkExtensionLibrary()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = NetworkExtensionLibraryCore();
  if (!result)
    NetworkExtensionLibrary_cold_1(&v1);
  return result;
}

id getNEHotspotConfigurationClass()
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
  v0 = (void *)getNEHotspotConfigurationClass_softClass;
  v7 = getNEHotspotConfigurationClass_softClass;
  if (!getNEHotspotConfigurationClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getNEHotspotConfigurationClass_block_invoke;
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __getNEHotspotConfigurationClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_217495774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getNEHotspotConfigurationClass_block_invoke(uint64_t a1)
{
  Class result;

  NetworkExtensionLibrary();
  result = objc_getClass("NEHotspotConfiguration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getNEHotspotConfigurationClass_block_invoke_cold_1();
  getNEHotspotConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getNEHotspotConfigurationManagerClass()
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
  v0 = (void *)getNEHotspotConfigurationManagerClass_softClass;
  v7 = getNEHotspotConfigurationManagerClass_softClass;
  if (!getNEHotspotConfigurationManagerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getNEHotspotConfigurationManagerClass_block_invoke;
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __getNEHotspotConfigurationManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_217495880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getNEHotspotConfigurationManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  NetworkExtensionLibrary();
  result = objc_getClass("NEHotspotConfigurationManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getNEHotspotConfigurationManagerClass_block_invoke_cold_1();
  getNEHotspotConfigurationManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_217495F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_217496568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217496670(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217497A70(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217497DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_217497F0C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217498338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_217498430(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2174988C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_2174989D0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_217498D84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getNFHardwareManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!NearFieldLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D7876B0;
    v5 = 0;
    NearFieldLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!NearFieldLibraryCore_frameworkLibrary)
    __getNFHardwareManagerClass_block_invoke_cold_1(&v3);
  result = objc_getClass("NFHardwareManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getNFHardwareManagerClass_block_invoke_cold_2();
  getNFHardwareManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __readerLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BarcodeSupport", "BCSNFCReaderConnection");
  v1 = (void *)readerLog_log;
  readerLog_log = (uint64_t)v0;

}

uint64_t ClipServicesLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!ClipServicesLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_24D787708;
    v3 = 0;
    ClipServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ClipServicesLibraryCore_frameworkLibrary)
    ClipServicesLibrary_cold_1(&v1);
  return ClipServicesLibraryCore_frameworkLibrary;
}

Class __getCPSClipMetadataRequestClass_block_invoke(uint64_t a1)
{
  Class result;

  ClipServicesLibrary();
  result = objc_getClass("CPSClipMetadataRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCPSClipMetadataRequestClass_block_invoke_cold_1();
  getCPSClipMetadataRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCPSClipRequestClass_block_invoke(uint64_t a1)
{
  Class result;

  ClipServicesLibrary();
  result = objc_getClass("CPSClipRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCPSClipRequestClass_block_invoke_cold_1();
  getCPSClipRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCPSSessionConfigurationClass_block_invoke(uint64_t a1)
{
  Class result;

  ClipServicesLibrary();
  result = objc_getClass("CPSSessionConfiguration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCPSSessionConfigurationClass_block_invoke_cold_1();
  getCPSSessionConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getNFCNDEFMessageClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!CoreNFCLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D787720;
    v5 = 0;
    CoreNFCLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreNFCLibraryCore_frameworkLibrary)
    __getNFCNDEFMessageClass_block_invoke_cold_1(&v3);
  result = objc_getClass("NFCNDEFMessage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getNFCNDEFMessageClass_block_invoke_cold_2();
  getNFCNDEFMessageClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  uint64_t v0;

  return v0;
}

id OUTLINED_FUNCTION_4(id a1)
{
  return a1;
}

id OUTLINED_FUNCTION_5(uint64_t a1, void *a2)
{
  return a2;
}

void sub_217499430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

Class __getNFHardwareManagerClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!NearFieldLibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_24D7877D0;
    v5 = 0;
    NearFieldLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!NearFieldLibraryCore_frameworkLibrary_0)
    __getNFHardwareManagerClass_block_invoke_cold_1_0(&v3);
  result = objc_getClass("NFHardwareManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getNFHardwareManagerClass_block_invoke_cold_2_0();
  getNFHardwareManagerClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __readerConnectionLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BarcodeSupport", "BCSNFCReaderConnection");
  v1 = (void *)readerConnectionLog_log;
  readerConnectionLog_log = (uint64_t)v0;

}

uint64_t OUTLINED_FUNCTION_1_1()
{
  void *v0;

  return objc_msgSend(v0, "clientType");
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  void *v0;

  return objc_msgSend(v0, "barcodeSourceType");
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  void *v0;

  return objc_msgSend(v0, "barcodeURLType");
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  void *v0;

  return objc_msgSend(v0, "detectionTimeMs");
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  void *v0;

  return objc_msgSend(v0, "appLinkPreferredOpenStrategy");
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_21749C6B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t DataDetectorsCoreLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = DataDetectorsCoreLibraryCore_frameworkLibrary;
  v6 = DataDetectorsCoreLibraryCore_frameworkLibrary;
  if (!DataDetectorsCoreLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_24D787828;
    v8 = *(_OWORD *)&off_24D787838;
    v1 = _sl_dlopen();
    v4[3] = v1;
    DataDetectorsCoreLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_21749CB6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t DataDetectorsCoreLibrary()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = DataDetectorsCoreLibraryCore();
  if (!result)
    DataDetectorsCoreLibrary_cold_1(&v1);
  return result;
}

id getDDScannerResultClass()
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
  v0 = (void *)getDDScannerResultClass_softClass;
  v7 = getDDScannerResultClass_softClass;
  if (!getDDScannerResultClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getDDScannerResultClass_block_invoke;
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __getDDScannerResultClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21749CC74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getDDScannerResultClass_block_invoke(uint64_t a1)
{
  Class result;

  DataDetectorsCoreLibrary();
  result = objc_getClass("DDScannerResult");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getDDScannerResultClass_block_invoke_cold_1();
  getDDScannerResultClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id _bcs_urlFromDDResult(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = getDDResultCopyExtractedURLSymbolLoc_ptr;
  v10 = getDDResultCopyExtractedURLSymbolLoc_ptr;
  if (!getDDResultCopyExtractedURLSymbolLoc_ptr)
  {
    v3 = (void *)DataDetectorsCoreLibrary();
    v2 = dlsym(v3, "DDResultCopyExtractedURL");
    v8[3] = (uint64_t)v2;
    getDDResultCopyExtractedURLSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
    _bcs_urlFromDDResult_cold_1();
  v4 = (void *)((uint64_t (*)(uint64_t))v2)(a1);
  if (objc_msgSend(v4, "length", v7))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_21749CDA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_21749D020(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

id _bcs_addressDictionaryFromScannerResult(void *a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v14 = 0;
  v15 = 0;
  v12 = 0;
  v13 = 0;
  v11 = 0;
  objc_msgSend(a1, "getStreet:city:state:zip:country:", &v15, &v14, &v13, &v12, &v11);
  v1 = v15;
  v2 = v14;
  v3 = v13;
  v4 = v12;
  v5 = v11;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v1)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v1, CFSTR("street"));
  if (v2)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v2, CFSTR("city"));
  if (v3)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v3, CFSTR("state"));
  if (v4)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("zip"));
  if (v5)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("country"));
  if (objc_msgSend(v7, "count"))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

uint64_t CoreNFCLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = CoreNFCLibraryCore_frameworkLibrary_0;
  v6 = CoreNFCLibraryCore_frameworkLibrary_0;
  if (!CoreNFCLibraryCore_frameworkLibrary_0)
  {
    v7 = xmmword_24D7878C0;
    v8 = *(_OWORD *)&off_24D7878D0;
    v1 = _sl_dlopen();
    v4[3] = v1;
    CoreNFCLibraryCore_frameworkLibrary_0 = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_21749D40C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t CoreNFCLibrary()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = CoreNFCLibraryCore();
  if (!result)
    CoreNFCLibrary_cold_1(&v1);
  return result;
}

id getNFCNDEFMessageClass()
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
  v0 = (void *)getNFCNDEFMessageClass_softClass_0;
  v7 = getNFCNDEFMessageClass_softClass_0;
  if (!getNFCNDEFMessageClass_softClass_0)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getNFCNDEFMessageClass_block_invoke_0;
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __getNFCNDEFMessageClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21749D514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getNFCNDEFMessageClass_block_invoke_0(uint64_t a1)
{
  Class result;

  CoreNFCLibrary();
  result = objc_getClass("NFCNDEFMessage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getNFCNDEFMessageClass_block_invoke_cold_1_0();
  getNFCNDEFMessageClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_21749DCA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_21749DF34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

char *OUTLINED_FUNCTION_3_2()
{
  return dlerror();
}

void _bcs_pointToRectDistance(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  CGPoint v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v13.origin.x = a3;
  v13.origin.y = a4;
  v13.size.width = a5;
  v13.size.height = a6;
  v12.x = a1;
  v12.y = a2;
  if (!CGRectContainsPoint(v13, v12))
  {
    v14.origin.x = a3;
    v14.origin.y = a4;
    v14.size.width = a5;
    v14.size.height = a6;
    CGRectGetMinX(v14);
    v15.origin.x = a3;
    v15.origin.y = a4;
    v15.size.width = a5;
    v15.size.height = a6;
    CGRectGetMinY(v15);
    v16.origin.x = a3;
    v16.origin.y = a4;
    v16.size.width = a5;
    v16.size.height = a6;
    CGRectGetMaxX(v16);
    v17.origin.x = a3;
    v17.origin.y = a4;
    v17.size.width = a5;
    v17.size.height = a6;
    CGRectGetMaxY(v17);
  }
}

double _bcs_roundFloatToPixels(double a1)
{
  uint64_t v2;
  float v3;

  v2 = _bcs_mainScreenScale_scale;
  if (*(double *)&_bcs_mainScreenScale_scale == 0.0)
  {
    MGGetFloat32Answer();
    *(double *)&v2 = v3;
    _bcs_mainScreenScale_scale = v2;
  }
  return round(*(double *)&v2 * a1) / *(double *)&v2;
}

double _bcs_mainScreenScale()
{
  double result;
  float v1;

  result = *(double *)&_bcs_mainScreenScale_scale;
  if (*(double *)&_bcs_mainScreenScale_scale == 0.0)
  {
    MGGetFloat32Answer();
    result = v1;
    _bcs_mainScreenScale_scale = *(_QWORD *)&result;
  }
  return result;
}

double _bcs_roundPointToPixels(double a1)
{
  double v2;
  float v3;
  float v4;

  v2 = *(double *)&_bcs_mainScreenScale_scale;
  if (*(double *)&_bcs_mainScreenScale_scale == 0.0)
  {
    MGGetFloat32Answer();
    v2 = v3;
    *(double *)&_bcs_mainScreenScale_scale = v3;
  }
  if (v2 == 0.0)
  {
    MGGetFloat32Answer();
    *(double *)&_bcs_mainScreenScale_scale = v4;
  }
  return round(a1 * v2) / v2;
}

double _bcs_roundSizeToPixels(double a1)
{
  double v2;
  float v3;
  float v4;

  v2 = *(double *)&_bcs_mainScreenScale_scale;
  if (*(double *)&_bcs_mainScreenScale_scale == 0.0)
  {
    MGGetFloat32Answer();
    v2 = v3;
    *(double *)&_bcs_mainScreenScale_scale = v3;
  }
  if (v2 == 0.0)
  {
    MGGetFloat32Answer();
    *(double *)&_bcs_mainScreenScale_scale = v4;
  }
  return round(a1 * v2) / v2;
}

double _bcs_roundRectToPixels(double a1, double a2, double a3)
{
  double v4;

  v4 = _bcs_roundPointToPixels(a1);
  _bcs_roundSizeToPixels(a3);
  return v4;
}

id _bcs_CGImagePNGRepresentation(id a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  const void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void *v28;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v25 = 0;
      v26 = &v25;
      v27 = 0x2020000000;
      v3 = getCGImageDestinationCreateWithDataSymbolLoc_ptr;
      v28 = getCGImageDestinationCreateWithDataSymbolLoc_ptr;
      if (!getCGImageDestinationCreateWithDataSymbolLoc_ptr)
      {
        v4 = (void *)ImageIOLibrary();
        v3 = dlsym(v4, "CGImageDestinationCreateWithData");
        v26[3] = (uint64_t)v3;
        getCGImageDestinationCreateWithDataSymbolLoc_ptr = v3;
      }
      _Block_object_dispose(&v25, 8);
      if (!v3)
        _bcs_CGImagePNGRepresentation_cold_1();
      v5 = ((uint64_t (*)(void *, const __CFString *, uint64_t, _QWORD))v3)(v2, CFSTR("public.png"), 1, 0);
      if (v5)
      {
        v6 = (const void *)v5;
        v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLong:", 8);
        v9 = objc_alloc(MEMORY[0x24BDBCE70]);
        v25 = 0;
        v26 = &v25;
        v27 = 0x2020000000;
        v10 = (_QWORD *)getkCGImagePropertyPNGCompressionFilterSymbolLoc_ptr;
        v28 = (void *)getkCGImagePropertyPNGCompressionFilterSymbolLoc_ptr;
        if (!getkCGImagePropertyPNGCompressionFilterSymbolLoc_ptr)
        {
          v11 = (void *)ImageIOLibrary();
          v10 = dlsym(v11, "kCGImagePropertyPNGCompressionFilter");
          v26[3] = (uint64_t)v10;
          getkCGImagePropertyPNGCompressionFilterSymbolLoc_ptr = (uint64_t)v10;
        }
        _Block_object_dispose(&v25, 8);
        if (!v10)
          _bcs_CGImagePNGRepresentation_cold_2();
        v12 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", v8, *v10, 0, v25);
        v25 = 0;
        v26 = &v25;
        v27 = 0x2020000000;
        v13 = (_QWORD *)getkCGImagePropertyPNGDictionarySymbolLoc_ptr;
        v28 = (void *)getkCGImagePropertyPNGDictionarySymbolLoc_ptr;
        if (!getkCGImagePropertyPNGDictionarySymbolLoc_ptr)
        {
          v14 = (void *)ImageIOLibrary();
          v13 = dlsym(v14, "kCGImagePropertyPNGDictionary");
          v26[3] = (uint64_t)v13;
          getkCGImagePropertyPNGDictionarySymbolLoc_ptr = (uint64_t)v13;
        }
        _Block_object_dispose(&v25, 8);
        if (!v13)
          _bcs_CGImagePNGRepresentation_cold_3();
        objc_msgSend(v7, "setObject:forKey:", v12, *v13);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        v26 = &v25;
        v27 = 0x2020000000;
        v16 = (_QWORD *)getkCGImagePropertyPNGBandCountSymbolLoc_ptr;
        v28 = (void *)getkCGImagePropertyPNGBandCountSymbolLoc_ptr;
        if (!getkCGImagePropertyPNGBandCountSymbolLoc_ptr)
        {
          v17 = (void *)ImageIOLibrary();
          v16 = dlsym(v17, "kCGImagePropertyPNGBandCount");
          v26[3] = (uint64_t)v16;
          getkCGImagePropertyPNGBandCountSymbolLoc_ptr = (uint64_t)v16;
        }
        _Block_object_dispose(&v25, 8);
        if (!v16)
          _bcs_CGImagePNGRepresentation_cold_4();
        objc_msgSend(v7, "setObject:forKey:", v15, *v16);
        v25 = 0;
        v26 = &v25;
        v27 = 0x2020000000;
        v18 = getCGImageDestinationAddImageSymbolLoc_ptr;
        v28 = getCGImageDestinationAddImageSymbolLoc_ptr;
        if (!getCGImageDestinationAddImageSymbolLoc_ptr)
        {
          v19 = (void *)ImageIOLibrary();
          v18 = dlsym(v19, "CGImageDestinationAddImage");
          v26[3] = (uint64_t)v18;
          getCGImageDestinationAddImageSymbolLoc_ptr = v18;
        }
        _Block_object_dispose(&v25, 8);
        if (!v18)
          _bcs_CGImagePNGRepresentation_cold_5();
        ((void (*)(const void *, id, id))v18)(v6, v1, v7);
        v25 = 0;
        v26 = &v25;
        v27 = 0x2020000000;
        v20 = getCGImageDestinationFinalizeSymbolLoc_ptr;
        v28 = getCGImageDestinationFinalizeSymbolLoc_ptr;
        if (!getCGImageDestinationFinalizeSymbolLoc_ptr)
        {
          v21 = (void *)ImageIOLibrary();
          v20 = dlsym(v21, "CGImageDestinationFinalize");
          v26[3] = (uint64_t)v20;
          getCGImageDestinationFinalizeSymbolLoc_ptr = v20;
        }
        _Block_object_dispose(&v25, 8);
        if (!v20)
          _bcs_CGImagePNGRepresentation_cold_6();
        v22 = ((uint64_t (*)(const void *))v20)(v6);
        CFRelease(v6);

        if (v22)
          v23 = v2;
        else
          v23 = 0;
      }
      else
      {
        v23 = 0;
      }
      v1 = v23;
    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

void sub_21749E998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _bcs_notificationIconBaseURL()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v0, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, &v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v8;

  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      _bcs_notificationIconBaseURL_cold_2(v2);
    v3 = 0;
  }
  else
  {
    objc_msgSend(v1, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.BarcodeSupport.Notification"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v7);
    v2 = v7;

    if (v2)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        _bcs_notificationIconBaseURL_cold_1((uint64_t)v4, v2);
      v3 = 0;
    }
    else
    {
      v3 = v4;
    }

  }
  return v3;
}

uint64_t _bcs_iconWithAppclipTreatment(void *a1, double a2)
{
  id v3;
  void *v4;
  void *v5;
  const void *v6;
  void *v7;
  void *v8;
  CGImage *v9;
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v25 = 0;
  v26 = (uint64_t)&v25;
  v27 = 0x2020000000;
  v4 = getCGImageSourceCreateWithURLSymbolLoc_ptr;
  v28 = getCGImageSourceCreateWithURLSymbolLoc_ptr;
  if (!getCGImageSourceCreateWithURLSymbolLoc_ptr)
  {
    v5 = (void *)ImageIOLibrary();
    v4 = dlsym(v5, "CGImageSourceCreateWithURL");
    *(_QWORD *)(v26 + 24) = v4;
    getCGImageSourceCreateWithURLSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v25, 8);
  if (!v4)
    _bcs_iconWithAppclipTreatment_cold_1();
  v6 = (const void *)((uint64_t (*)(id, _QWORD))v4)(v3, 0);
  v25 = 0;
  v26 = (uint64_t)&v25;
  v27 = 0x2020000000;
  v7 = getCGImageSourceCreateImageAtIndexSymbolLoc_ptr;
  v28 = getCGImageSourceCreateImageAtIndexSymbolLoc_ptr;
  if (!getCGImageSourceCreateImageAtIndexSymbolLoc_ptr)
  {
    v8 = (void *)ImageIOLibrary();
    v7 = dlsym(v8, "CGImageSourceCreateImageAtIndex");
    *(_QWORD *)(v26 + 24) = v7;
    getCGImageSourceCreateImageAtIndexSymbolLoc_ptr = v7;
  }
  _Block_object_dispose(&v25, 8);
  if (!v7)
    _bcs_iconWithAppclipTreatment_cold_2();
  v9 = (CGImage *)((uint64_t (*)(const void *, _QWORD, _QWORD))v7)(v6, 0, 0);
  CFRelease(v6);
  if (v9)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x2050000000;
    v10 = (void *)getISIconClass_softClass;
    v33 = getISIconClass_softClass;
    if (!getISIconClass_softClass)
    {
      v25 = MEMORY[0x24BDAC760];
      v26 = 3221225472;
      v27 = (uint64_t)__getISIconClass_block_invoke;
      v28 = &unk_24D787158;
      v29 = &v30;
      __getISIconClass_block_invoke((uint64_t)&v25);
      v10 = (void *)v31[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v30, 8);
    v12 = [v11 alloc];
    v30 = 0;
    v31 = &v30;
    v32 = 0x2050000000;
    v13 = (void *)getISImageClass_softClass;
    v33 = getISImageClass_softClass;
    if (!getISImageClass_softClass)
    {
      v25 = MEMORY[0x24BDAC760];
      v26 = 3221225472;
      v27 = (uint64_t)__getISImageClass_block_invoke;
      v28 = &unk_24D787158;
      v29 = &v30;
      __getISImageClass_block_invoke((uint64_t)&v25);
      v13 = (void *)v31[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v30, 8);
    v15 = (void *)objc_msgSend([v14 alloc], "initWithCGImage:scale:", v9, a2);
    v35[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v12, "initWithImages:", v16);

    CGImageRelease(v9);
    v30 = 0;
    v31 = &v30;
    v32 = 0x2050000000;
    v18 = (void *)getISImageDescriptorClass_softClass;
    v33 = getISImageDescriptorClass_softClass;
    if (!getISImageDescriptorClass_softClass)
    {
      v25 = MEMORY[0x24BDAC760];
      v26 = 3221225472;
      v27 = (uint64_t)__getISImageDescriptorClass_block_invoke;
      v28 = &unk_24D787158;
      v29 = &v30;
      __getISImageDescriptorClass_block_invoke((uint64_t)&v25);
      v18 = (void *)v31[3];
    }
    v19 = objc_retainAutorelease(v18);
    _Block_object_dispose(&v30, 8);
    v20 = objc_alloc_init(v19);
    objc_msgSend(v20, "setSize:", 29.0, 29.0);
    objc_msgSend(v20, "setScale:", a2);
    objc_msgSend(v20, "setShape:", 5);
    v34 = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "prepareImagesForImageDescriptors:", v21);

    v22 = objc_msgSend(v17, "CGImageForImageDescriptor:", v20);
    getCIContextClass();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(getCIContextClass(), "_IS_sharedIconCompositorContext");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "clearCaches");

    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

void sub_21749EED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCIContextClass()
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
  v0 = (void *)getCIContextClass_softClass;
  v7 = getCIContextClass_softClass;
  if (!getCIContextClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCIContextClass_block_invoke;
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __getCIContextClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21749EFA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _bcs_applyTreatmentToIcon(void *a1, double a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v19;

  v3 = a1;
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _bcs_notificationIconBaseURL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v9, 0);

    if (v10)
    {
      v11 = v7;
    }
    else
    {
      v13 = (void *)MEMORY[0x219A0C660]();
      v14 = (void *)_bcs_iconWithAppclipTreatment(v3, a2);
      _bcs_CGImagePNGRepresentation(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        _bcs_applyTreatmentToIcon_cold_3();
      v19 = 0;
      objc_msgSend(v15, "writeToURL:options:error:", v7, 1, &v19);
      v16 = v19;
      if (v16 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        _bcs_applyTreatmentToIcon_cold_2(v16);

      objc_autoreleasePoolPop(v13);
      if (v15)
        v17 = v7;
      else
        v17 = 0;
      v11 = v17;
    }
    v12 = v11;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      _bcs_applyTreatmentToIcon_cold_1();
    v12 = 0;
  }

  return v12;
}

double _bcs_pixelLength()
{
  double result;
  uint64_t v1;
  float v2;

  result = *(double *)&_bcs_pixelLength_pixelLength;
  if (*(double *)&_bcs_pixelLength_pixelLength == 0.0)
  {
    v1 = _bcs_mainScreenScale_scale;
    if (*(double *)&_bcs_mainScreenScale_scale == 0.0)
    {
      MGGetFloat32Answer();
      *(double *)&v1 = v2;
      _bcs_mainScreenScale_scale = v1;
    }
    result = 1.0 / *(double *)&v1;
    _bcs_pixelLength_pixelLength = *(_QWORD *)&result;
  }
  return result;
}

uint64_t ImageIOLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!ImageIOLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_24D787908;
    v3 = 0;
    ImageIOLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ImageIOLibraryCore_frameworkLibrary)
    ImageIOLibrary_cold_1(&v1);
  return ImageIOLibraryCore_frameworkLibrary;
}

Class __getISIconClass_block_invoke(uint64_t a1)
{
  Class result;

  IconServicesLibrary();
  result = objc_getClass("ISIcon");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getISIconClass_block_invoke_cold_1();
  getISIconClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void IconServicesLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = 0;
  if (!IconServicesLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_24D787920;
    v2 = 0;
    IconServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!IconServicesLibraryCore_frameworkLibrary)
    IconServicesLibrary_cold_1(&v0);
}

Class __getISImageClass_block_invoke(uint64_t a1)
{
  Class result;

  IconServicesLibrary();
  result = objc_getClass("ISImage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getISImageClass_block_invoke_cold_1();
  getISImageClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getISImageDescriptorClass_block_invoke(uint64_t a1)
{
  Class result;

  IconServicesLibrary();
  result = objc_getClass("ISImageDescriptor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getISImageDescriptorClass_block_invoke_cold_1();
  getISImageDescriptorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCIContextClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!CoreImageLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D787938;
    v5 = 0;
    CoreImageLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreImageLibraryCore_frameworkLibrary)
    __getCIContextClass_block_invoke_cold_1(&v3);
  result = objc_getClass("CIContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCIContextClass_block_invoke_cold_2();
  getCIContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t iCalendarLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = iCalendarLibraryCore_frameworkLibrary;
  v6 = iCalendarLibraryCore_frameworkLibrary;
  if (!iCalendarLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_24D787A48;
    v8 = *(_OWORD *)&off_24D787A58;
    v1 = _sl_dlopen();
    v4[3] = v1;
    iCalendarLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_2174A0040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t iCalendarLibrary()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = iCalendarLibraryCore();
  if (!result)
    iCalendarLibrary_cold_1(&v1);
  return result;
}

id getICSDocumentClass()
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
  v0 = (void *)getICSDocumentClass_softClass;
  v7 = getICSDocumentClass_softClass;
  if (!getICSDocumentClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getICSDocumentClass_block_invoke;
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __getICSDocumentClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2174A0148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getICSDocumentClass_block_invoke(uint64_t a1)
{
  Class result;

  iCalendarLibrary();
  result = objc_getClass("ICSDocument");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getICSDocumentClass_block_invoke_cold_1();
  getICSDocumentClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getICSEventClass()
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
  v0 = (void *)getICSEventClass_softClass;
  v7 = getICSEventClass_softClass;
  if (!getICSEventClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getICSEventClass_block_invoke;
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __getICSEventClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2174A0254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getICSEventClass_block_invoke(uint64_t a1)
{
  Class result;

  iCalendarLibrary();
  result = objc_getClass("ICSEvent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getICSEventClass_block_invoke_cold_1();
  getICSEventClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2174A1C80(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_2174A23D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2174A28B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_2174A29AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getTLAlertTopicPassbookNFCScanComplete()
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
  v0 = (id *)getTLAlertTopicPassbookNFCScanCompleteSymbolLoc_ptr;
  v6 = getTLAlertTopicPassbookNFCScanCompleteSymbolLoc_ptr;
  if (!getTLAlertTopicPassbookNFCScanCompleteSymbolLoc_ptr)
  {
    v1 = (void *)ToneLibraryLibrary();
    v0 = (id *)dlsym(v1, "TLAlertTopicPassbookNFCScanComplete");
    v4[3] = (uint64_t)v0;
    getTLAlertTopicPassbookNFCScanCompleteSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getTLAlertTopicPassbookNFCScanComplete_cold_1();
  return *v0;
}

void sub_2174A2A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_2174A3298(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getEKEventStoreClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!EventKitLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D787B30;
    v5 = 0;
    EventKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!EventKitLibraryCore_frameworkLibrary)
    __getEKEventStoreClass_block_invoke_cold_1(&v3);
  result = objc_getClass("EKEventStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getEKEventStoreClass_block_invoke_cold_2();
  getEKEventStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SpringBoardServicesLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!SpringBoardServicesLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_24D787B48;
    v3 = 0;
    SpringBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SpringBoardServicesLibraryCore_frameworkLibrary)
    SpringBoardServicesLibrary_cold_1(&v1);
  return SpringBoardServicesLibraryCore_frameworkLibrary;
}

uint64_t FrontBoardServicesLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_24D787B60;
    v3 = 0;
    FrontBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
    FrontBoardServicesLibrary_cold_1(&v1);
  return FrontBoardServicesLibraryCore_frameworkLibrary;
}

Class __getTLAlertConfigurationClass_block_invoke(uint64_t a1)
{
  Class result;

  ToneLibraryLibrary();
  result = objc_getClass("TLAlertConfiguration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getTLAlertConfigurationClass_block_invoke_cold_1();
  getTLAlertConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ToneLibraryLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!ToneLibraryLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_24D787B78;
    v3 = 0;
    ToneLibraryLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ToneLibraryLibraryCore_frameworkLibrary)
    ToneLibraryLibrary_cold_1(&v1);
  return ToneLibraryLibraryCore_frameworkLibrary;
}

void sub_2174A3EBC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2174A40F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2174A43B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  _Block_object_dispose(&a17, 8);
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

void sub_2174A4514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_2174A48DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, uint64_t a12, char a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_2174A4ACC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object)
{
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_2174A6018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t UIKitLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = UIKitLibraryCore_frameworkLibrary;
  v6 = UIKitLibraryCore_frameworkLibrary;
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_24D787D38;
    v8 = *(_OWORD *)&off_24D787D48;
    v1 = _sl_dlopen();
    v4[3] = v1;
    UIKitLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_2174A6530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t UIKitLibrary()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = UIKitLibraryCore();
  if (!result)
    UIKitLibrary_cold_1(&v1);
  return result;
}

id getUIAlertActionClass()
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
  v0 = (void *)getUIAlertActionClass_softClass;
  v7 = getUIAlertActionClass_softClass;
  if (!getUIAlertActionClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getUIAlertActionClass_block_invoke;
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __getUIAlertActionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2174A6638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIAlertActionClass_block_invoke(uint64_t a1)
{
  Class result;

  UIKitLibrary();
  result = objc_getClass("UIAlertAction");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getUIAlertActionClass_block_invoke_cold_1();
  getUIAlertActionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getUIAlertControllerClass()
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
  v0 = (void *)getUIAlertControllerClass_softClass;
  v7 = getUIAlertControllerClass_softClass;
  if (!getUIAlertControllerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getUIAlertControllerClass_block_invoke;
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __getUIAlertControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2174A6744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIAlertControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  UIKitLibrary();
  result = objc_getClass("UIAlertController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getUIAlertControllerClass_block_invoke_cold_1();
  getUIAlertControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getUIApplicationClass()
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
  v0 = (void *)getUIApplicationClass_softClass;
  v7 = getUIApplicationClass_softClass;
  if (!getUIApplicationClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getUIApplicationClass_block_invoke;
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __getUIApplicationClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2174A6850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIApplicationClass_block_invoke(uint64_t a1)
{
  Class result;

  UIKitLibrary();
  result = objc_getClass("UIApplication");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getUIApplicationClass_block_invoke_cold_1();
  getUIApplicationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
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
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __getUIImageClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2174A695C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIImageClass_block_invoke(uint64_t a1)
{
  Class result;

  UIKitLibrary();
  result = objc_getClass("UIImage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getUIImageClass_block_invoke_cold_1();
  getUIImageClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getUIPasteboardClass()
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
  v0 = (void *)getUIPasteboardClass_softClass;
  v7 = getUIPasteboardClass_softClass;
  if (!getUIPasteboardClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getUIPasteboardClass_block_invoke;
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __getUIPasteboardClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2174A6A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIPasteboardClass_block_invoke(uint64_t a1)
{
  Class result;

  UIKitLibrary();
  result = objc_getClass("UIPasteboard");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getUIPasteboardClass_block_invoke_cold_1();
  getUIPasteboardClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getUIActionClass()
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
  v0 = (void *)getUIActionClass_softClass;
  v7 = getUIActionClass_softClass;
  if (!getUIActionClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getUIActionClass_block_invoke;
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __getUIActionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2174A6B74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIActionClass_block_invoke(uint64_t a1)
{
  Class result;

  UIKitLibrary();
  result = objc_getClass("UIAction");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getUIActionClass_block_invoke_cold_1();
  getUIActionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getUIActivityViewControllerClass()
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
  v0 = (void *)getUIActivityViewControllerClass_softClass;
  v7 = getUIActivityViewControllerClass_softClass;
  if (!getUIActivityViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getUIActivityViewControllerClass_block_invoke;
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __getUIActivityViewControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2174A6C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIActivityViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  UIKitLibrary();
  result = objc_getClass("UIActivityViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getUIActivityViewControllerClass_block_invoke_cold_1();
  getUIActivityViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getUIMenuClass()
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
  v0 = (void *)getUIMenuClass_softClass;
  v7 = getUIMenuClass_softClass;
  if (!getUIMenuClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getUIMenuClass_block_invoke;
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __getUIMenuClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2174A6D8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIMenuClass_block_invoke(uint64_t a1)
{
  Class result;

  UIKitLibrary();
  result = objc_getClass("UIMenu");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getUIMenuClass_block_invoke_cold_1();
  getUIMenuClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getUIViewClass()
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
  v0 = (void *)getUIViewClass_softClass;
  v7 = getUIViewClass_softClass;
  if (!getUIViewClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getUIViewClass_block_invoke;
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __getUIViewClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2174A6E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIViewClass_block_invoke(uint64_t a1)
{
  Class result;

  UIKitLibrary();
  result = objc_getClass("UIView");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getUIViewClass_block_invoke_cold_1();
  getUIViewClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

const __CFString *validHealthURLPrefixForScheme(void *a1)
{
  void *v1;
  const __CFString *v2;

  objc_msgSend(a1, "lowercaseString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("shc")) & 1) != 0)
  {
    v2 = CFSTR("shc:/");
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("hc1")))
  {
    v2 = CFSTR("hc1:");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_2174A7CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getHKSignedClinicalDataSourceClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!HealthRecordServicesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D787D98;
    v5 = 0;
    HealthRecordServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!HealthRecordServicesLibraryCore_frameworkLibrary)
    __getHKSignedClinicalDataSourceClass_block_invoke_cold_1(&v3);
  result = objc_getClass("HKSignedClinicalDataSource");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getHKSignedClinicalDataSourceClass_block_invoke_cold_2();
  getHKSignedClinicalDataSourceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getHKVerifiableHealthRecordsParserClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!HealthRecordsExtractionLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D787DB0;
    v5 = 0;
    HealthRecordsExtractionLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!HealthRecordsExtractionLibraryCore_frameworkLibrary)
    __getHKVerifiableHealthRecordsParserClass_block_invoke_cold_1(&v3);
  result = objc_getClass("HKVerifiableHealthRecordsParser");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getHKVerifiableHealthRecordsParserClass_block_invoke_cold_2();
  getHKVerifiableHealthRecordsParserClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2174A8DD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t DataDetectorsUILibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = DataDetectorsUILibraryCore_frameworkLibrary;
  v6 = DataDetectorsUILibraryCore_frameworkLibrary;
  if (!DataDetectorsUILibraryCore_frameworkLibrary)
  {
    v7 = xmmword_24D787E38;
    v8 = *(_OWORD *)&off_24D787E48;
    v1 = _sl_dlopen();
    v4[3] = v1;
    DataDetectorsUILibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_2174A8EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t DataDetectorsUILibrary()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = DataDetectorsUILibraryCore();
  if (!result)
    DataDetectorsUILibrary_cold_1(&v1);
  return result;
}

id getDDDetectionControllerClass()
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
  v0 = (void *)getDDDetectionControllerClass_softClass;
  v7 = getDDDetectionControllerClass_softClass;
  if (!getDDDetectionControllerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getDDDetectionControllerClass_block_invoke;
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __getDDDetectionControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2174A8FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getDDDetectionControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  DataDetectorsUILibrary();
  result = objc_getClass("DDDetectionController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getDDDetectionControllerClass_block_invoke_cold_1();
  getDDDetectionControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getDDCopyActionClass()
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
  v0 = (void *)getDDCopyActionClass_softClass;
  v7 = getDDCopyActionClass_softClass;
  if (!getDDCopyActionClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getDDCopyActionClass_block_invoke;
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __getDDCopyActionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2174A9104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getDDCopyActionClass_block_invoke(uint64_t a1)
{
  Class result;

  DataDetectorsUILibrary();
  result = objc_getClass("DDCopyAction");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getDDCopyActionClass_block_invoke_cold_1();
  getDDCopyActionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getDDContextMenuActionClass()
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
  v0 = (void *)getDDContextMenuActionClass_softClass;
  v7 = getDDContextMenuActionClass_softClass;
  if (!getDDContextMenuActionClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getDDContextMenuActionClass_block_invoke;
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __getDDContextMenuActionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2174A9210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getDDContextMenuActionClass_block_invoke(uint64_t a1)
{
  Class result;

  DataDetectorsUILibrary();
  result = objc_getClass("DDContextMenuAction");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getDDContextMenuActionClass_block_invoke_cold_1();
  getDDContextMenuActionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *getDDUIEventForResultsSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getDDUIEventForResultsSymbolLoc_ptr;
  v6 = getDDUIEventForResultsSymbolLoc_ptr;
  if (!getDDUIEventForResultsSymbolLoc_ptr)
  {
    v1 = (void *)DataDetectorsUILibrary();
    v0 = dlsym(v1, "DDUIEventForResults");
    v4[3] = (uint64_t)v0;
    getDDUIEventForResultsSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_2174A92F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id _DDUIEventForResults(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void (*DDUIEventForResultsSymbolLoc)(id, id, id);
  void *v9;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  DDUIEventForResultsSymbolLoc = (void (*)(id, id, id))getDDUIEventForResultsSymbolLoc();
  if (!DDUIEventForResultsSymbolLoc)
    _DDUIEventForResults_cold_1();
  DDUIEventForResultsSymbolLoc(v5, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id _BCSLocalizedString(void *a1, dispatch_once_t *a2, id *a3)
{
  dispatch_once_t v5;
  id v6;
  void *v7;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___BCSLocalizedString_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  v5 = *a2;
  v6 = a1;
  if (v5 != -1)
    dispatch_once(a2, block);
  objc_msgSend(*a3, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void OUTLINED_FUNCTION_3_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_6_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

id getSSReadingListClass()
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
  v0 = (void *)getSSReadingListClass_softClass;
  v7 = getSSReadingListClass_softClass;
  if (!getSSReadingListClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSSReadingListClass_block_invoke;
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __getSSReadingListClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2174AC258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2174AD1CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getCPSSessionLaunchReasonQR()
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
  v0 = (id *)getCPSSessionLaunchReasonQRSymbolLoc_ptr;
  v6 = getCPSSessionLaunchReasonQRSymbolLoc_ptr;
  if (!getCPSSessionLaunchReasonQRSymbolLoc_ptr)
  {
    v1 = (void *)ClipServicesLibrary_0();
    v0 = (id *)dlsym(v1, "CPSSessionLaunchReasonQR");
    v4[3] = (uint64_t)v0;
    getCPSSessionLaunchReasonQRSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getCPSSessionLaunchReasonQR_cold_1();
  return *v0;
}

void sub_2174AD264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_2174ADA08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2174AE0AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2174AE4E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSSReadingListClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!SafariServicesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D7881C0;
    v5 = 0;
    SafariServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SafariServicesLibraryCore_frameworkLibrary)
    __getSSReadingListClass_block_invoke_cold_1(&v3);
  result = objc_getClass("SSReadingList");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSSReadingListClass_block_invoke_cold_2();
  getSSReadingListClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ClipServicesLibrary_0()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!ClipServicesLibraryCore_frameworkLibrary_0)
  {
    v2 = xmmword_24D7881D8;
    v3 = 0;
    ClipServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!ClipServicesLibraryCore_frameworkLibrary_0)
    ClipServicesLibrary_cold_1_0(&v1);
  return ClipServicesLibraryCore_frameworkLibrary_0;
}

Class __getCPSClipRequestClass_block_invoke_0(uint64_t a1)
{
  Class result;

  ClipServicesLibrary_0();
  result = objc_getClass("CPSClipRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCPSClipRequestClass_block_invoke_cold_1_0();
  getCPSClipRequestClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCPSClipMetadataRequestClass_block_invoke_0(uint64_t a1)
{
  Class result;

  ClipServicesLibrary_0();
  result = objc_getClass("CPSClipMetadataRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCPSClipMetadataRequestClass_block_invoke_cold_1_0();
  getCPSClipMetadataRequestClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCoreTelephonyClientClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!CoreTelephonyLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D7881F0;
    v5 = 0;
    CoreTelephonyLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreTelephonyLibraryCore_frameworkLibrary)
    __getCoreTelephonyClientClass_block_invoke_cold_1(&v3);
  result = objc_getClass("CoreTelephonyClient");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCoreTelephonyClientClass_block_invoke_cold_2();
  getCoreTelephonyClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2174B0DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getHMAccessorySetupCoordinatorClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!HomeKitLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D788208;
    v5 = 0;
    HomeKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!HomeKitLibraryCore_frameworkLibrary)
    __getHMAccessorySetupCoordinatorClass_block_invoke_cold_1(&v3);
  result = objc_getClass("HMAccessorySetupCoordinator");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getHMAccessorySetupCoordinatorClass_block_invoke_cold_2();
  getHMAccessorySetupCoordinatorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t _bcs_isDeviceLocked()
{
  void *v0;
  uint64_t v1;

  v0 = (void *)MGCopyAnswer();
  v1 = objc_msgSend(v0, "BOOLValue");

  return v1;
}

uint64_t _bcs_deviceIsPad()
{
  if (_bcs_deviceIsPad_onceToken != -1)
    dispatch_once(&_bcs_deviceIsPad_onceToken, &__block_literal_global_11);
  return _bcs_deviceIsPad_isPad;
}

void ___bcs_deviceIsPad_block_invoke()
{
  const void *v0;
  const void *v1;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    _bcs_deviceIsPad_isPad = CFEqual(v0, CFSTR("iPad")) != 0;
    CFRelease(v1);
  }
}

uint64_t _bcs_isCurrentProcessSafari()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.mobilesafari")) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SafariViewService"));

  return v2;
}

uint64_t _bcs_isCurrentProcessBarcodeScanner()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.BarcodeScanner"));
  return v2;
}

void _bcs_openAppLinkIgnoringOpenStrategy(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v5 = a1;
  v6 = a2;
  v7 = (objc_class *)MEMORY[0x24BDC1598];
  v8 = a3;
  v9 = [v7 alloc];
  v10 = (void *)objc_msgSend(v9, "initWithActivityType:", *MEMORY[0x24BDD13E8]);
  objc_msgSend(v5, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWebpageURL:", v11);

  objc_msgSend(v8, "savePayloadInUserActivity:", v10);
  objc_msgSend(getLSApplicationWorkspaceClass(), "defaultWorkspace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetApplicationProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = ___bcs_openAppLinkIgnoringOpenStrategy_block_invoke;
  v16[3] = &unk_24D787A98;
  v17 = v6;
  v18 = v5;
  v14 = v5;
  v15 = v6;
  objc_msgSend(v12, "openUserActivity:withApplicationProxy:options:completionHandler:", v10, v13, v15, v16);

}

void ___bcs_openAppLinkIgnoringOpenStrategy_block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ___bcs_openAppLinkIgnoringOpenStrategy_block_invoke_cold_1(v5);
    v6 = objc_alloc_init(MEMORY[0x24BDC15A0]);
    objc_msgSend(v6, "setFrontBoardOptions:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v6, "setIgnoreAppLinkEnabledProperty:", 1);
    objc_msgSend(*(id *)(a1 + 40), "openWithConfiguration:completionHandler:", v6, &__block_literal_global_16_0);

  }
}

void ___bcs_openAppLinkIgnoringOpenStrategy_block_invoke_14(uint64_t a1, char a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((a2 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ___bcs_openAppLinkIgnoringOpenStrategy_block_invoke_14_cold_1(v4);

}

id _bcs_lastTimeAppWasUsed(void *a1)
{
  id v1;
  double Current;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  Class (*v23)(uint64_t);
  void *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v3 = (void *)get_DKKnowledgeStoreClass_softClass;
    v29 = get_DKKnowledgeStoreClass_softClass;
    if (!get_DKKnowledgeStoreClass_softClass)
    {
      v21 = MEMORY[0x24BDAC760];
      v22 = 3221225472;
      v23 = __get_DKKnowledgeStoreClass_block_invoke;
      v24 = &unk_24D787158;
      v25 = &v26;
      __get_DKKnowledgeStoreClass_block_invoke((uint64_t)&v21);
      v3 = (void *)v27[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v26, 8);
    objc_msgSend(v4, "knowledgeStoreWithDirectReadOnlyAccess");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v6 = (void *)get_DKEventQueryClass_softClass;
    v29 = get_DKEventQueryClass_softClass;
    if (!get_DKEventQueryClass_softClass)
    {
      v21 = MEMORY[0x24BDAC760];
      v22 = 3221225472;
      v23 = __get_DKEventQueryClass_block_invoke;
      v24 = &unk_24D787158;
      v25 = &v26;
      __get_DKEventQueryClass_block_invoke((uint64_t)&v21);
      v6 = (void *)v27[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v26, 8);
    v8 = objc_alloc_init(v7);
    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v9 = (void *)get_DKSystemEventStreamsClass_softClass;
    v29 = get_DKSystemEventStreamsClass_softClass;
    if (!get_DKSystemEventStreamsClass_softClass)
    {
      v21 = MEMORY[0x24BDAC760];
      v22 = 3221225472;
      v23 = __get_DKSystemEventStreamsClass_block_invoke;
      v24 = &unk_24D787158;
      v25 = &v26;
      __get_DKSystemEventStreamsClass_block_invoke((uint64_t)&v21);
      v9 = (void *)v27[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v26, 8);
    objc_msgSend(v10, "appInFocusStream");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEventStreams:", v12);

    objc_msgSend(get_DKQueryClass(), "startDateSortDescriptorAscending:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSortDescriptors:", v14);

    objc_msgSend(get_DKQueryClass(), "predicateForEventsWithStringValue:", v1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPredicate:", v15);

    objc_msgSend(v8, "setLimit:", 1);
    v20 = 0;
    objc_msgSend(v5, "executeQuery:error:", v8, &v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        _bcs_lastTimeAppWasUsed_cold_2();
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        _bcs_lastTimeAppWasUsed_cold_1(Current);
      if (objc_msgSend(v16, "count"))
      {
        objc_msgSend(v16, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "startDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
        goto LABEL_18;
      }
    }
    v17 = 0;
    goto LABEL_17;
  }
  v17 = 0;
LABEL_18:

  return v17;
}

void sub_2174B17AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_DKQueryClass()
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
  v0 = (void *)get_DKQueryClass_softClass;
  v7 = get_DKQueryClass_softClass;
  if (!get_DKQueryClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __get_DKQueryClass_block_invoke;
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __get_DKQueryClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2174B1874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _bcs_isHostAppEntitled()
{
  if (_bcs_isHostAppEntitled_onceToken != -1)
    dispatch_once(&_bcs_isHostAppEntitled_onceToken, &__block_literal_global_18);
  return _bcs_isHostAppEntitled_hostHasEntitlement;
}

void ___bcs_isHostAppEntitled_block_invoke()
{
  CFAllocatorRef Default;
  void *v1;
  void *v2;
  uint64_t v3;
  const void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  Default = CFAllocatorGetDefault();
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v1 = getSecTaskCreateFromSelfSymbolLoc_ptr;
  v11 = getSecTaskCreateFromSelfSymbolLoc_ptr;
  if (!getSecTaskCreateFromSelfSymbolLoc_ptr)
  {
    v2 = (void *)SecurityLibrary();
    v1 = dlsym(v2, "SecTaskCreateFromSelf");
    v9[3] = (uint64_t)v1;
    getSecTaskCreateFromSelfSymbolLoc_ptr = v1;
  }
  _Block_object_dispose(&v8, 8);
  if (!v1)
    ___bcs_isHostAppEntitled_block_invoke_cold_1();
  v3 = ((uint64_t (*)(CFAllocatorRef))v1)(Default);
  if (v3)
  {
    v4 = (const void *)v3;
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v5 = getSecTaskCopyValueForEntitlementSymbolLoc_ptr;
    v11 = getSecTaskCopyValueForEntitlementSymbolLoc_ptr;
    if (!getSecTaskCopyValueForEntitlementSymbolLoc_ptr)
    {
      v6 = (void *)SecurityLibrary();
      v5 = dlsym(v6, "SecTaskCopyValueForEntitlement");
      v9[3] = (uint64_t)v5;
      getSecTaskCopyValueForEntitlementSymbolLoc_ptr = v5;
    }
    _Block_object_dispose(&v8, 8);
    if (!v5)
      ___bcs_isHostAppEntitled_block_invoke_cold_2();
    v7 = (void *)((uint64_t (*)(const void *, const __CFString *, _QWORD))v5)(v4, CFSTR("platform-application"), 0);
    _bcs_isHostAppEntitled_hostHasEntitlement = objc_msgSend(v7, "BOOLValue", v8);
    CFRelease(v4);

  }
}

void sub_2174B19F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id _bcs_frontBoardUnlockOptions()
{
  id *v0;
  void *v1;
  id v2;
  uint64_t v3;
  id *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v0 = (id *)getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr_0;
  v13 = getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr_0;
  if (!getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr_0)
  {
    v1 = (void *)FrontBoardServicesLibrary_0();
    v0 = (id *)dlsym(v1, "FBSOpenApplicationOptionKeyPromptUnlockDevice");
    v11[3] = (uint64_t)v0;
    getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr_0 = (uint64_t)v0;
  }
  _Block_object_dispose(&v10, 8);
  if (!v0)
    _bcs_frontBoardUnlockOptions_cold_1();
  v2 = *v0;
  v14 = v2;
  v3 = MEMORY[0x24BDBD1C8];
  v16[0] = MEMORY[0x24BDBD1C8];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v4 = (id *)getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr_0;
  v13 = getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr_0;
  if (!getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr_0)
  {
    v5 = (void *)FrontBoardServicesLibrary_0();
    v4 = (id *)dlsym(v5, "FBSOpenApplicationOptionKeyUnlockDevice");
    v11[3] = (uint64_t)v4;
    getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr_0 = (uint64_t)v4;
  }
  _Block_object_dispose(&v10, 8);
  if (!v4)
    _bcs_frontBoardUnlockOptions_cold_2();
  v15 = *v4;
  v16[1] = v3;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = v15;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v16, &v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_2174B1B84(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _bcs_performActionAfterUnlock(void *a1)
{
  void (**v1)(_QWORD);
  void *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  void (**v8)(_QWORD);
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;

  v1 = a1;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v2 = getSBSGetScreenLockStatusSymbolLoc_ptr_0;
  v12 = getSBSGetScreenLockStatusSymbolLoc_ptr_0;
  if (!getSBSGetScreenLockStatusSymbolLoc_ptr_0)
  {
    v3 = (void *)SpringBoardServicesLibrary_0();
    v2 = dlsym(v3, "SBSGetScreenLockStatus");
    v10[3] = (uint64_t)v2;
    getSBSGetScreenLockStatusSymbolLoc_ptr_0 = v2;
  }
  _Block_object_dispose(&v9, 8);
  if (!v2)
    _bcs_performActionAfterUnlock_cold_1();
  if (((unsigned int (*)(_QWORD))v2)(0))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = ___bcs_performActionAfterUnlock_block_invoke;
    v7[3] = &unk_24D787AC0;
    v8 = v1;
    v4 = v7;
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v5 = getSBSRequestPasscodeUnlockUISymbolLoc_ptr_0;
    v12 = getSBSRequestPasscodeUnlockUISymbolLoc_ptr_0;
    if (!getSBSRequestPasscodeUnlockUISymbolLoc_ptr_0)
    {
      v6 = (void *)SpringBoardServicesLibrary_0();
      v5 = dlsym(v6, "SBSRequestPasscodeUnlockUI");
      v10[3] = (uint64_t)v5;
      getSBSRequestPasscodeUnlockUISymbolLoc_ptr_0 = v5;
    }
    _Block_object_dispose(&v9, 8);
    if (!v5)
      _bcs_performActionAfterUnlock_cold_2();
    ((void (*)(_QWORD *))v5)(v4);

  }
  else
  {
    v1[2](v1);
  }

}

void sub_2174B1D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___bcs_performActionAfterUnlock_block_invoke(uint64_t a1, int a2)
{
  uint8_t v2[16];

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "User cancelled device unlock.", v2, 2u);
  }
}

BOOL _bcs_airplayInWifiEnabled()
{
  void *v1;
  uint64_t v2;

  if (_bcs_airplayInWifiEnabled_onceToken != -1)
    dispatch_once(&_bcs_airplayInWifiEnabled_onceToken, &__block_literal_global_23);
  if (_bcs_airplayInWifiEnabled_remoteConfigAvailable)
    return _bcs_airplayInWifiEnabled_remoteConfigValue != 0;
  if ((_os_feature_enabled_impl() & 1) != 0)
    return 1;
  v1 = (void *)CFPreferencesCopyAppValue(CFSTR("SetupAssistantWiFiQRCode"), CFSTR("com.apple.airplay"));
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

uint64_t ___bcs_airplayInWifiEnabled_block_invoke()
{
  uint64_t result;

  result = APSRemoteConfigGetShared();
  if (result)
  {
    result = APSRemoteConfigGetBooleanIfPresent();
    _bcs_airplayInWifiEnabled_remoteConfigAvailable = result;
  }
  return result;
}

void CoreDuetLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = 0;
  if (!CoreDuetLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_24D7882C0;
    v2 = 0;
    CoreDuetLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreDuetLibraryCore_frameworkLibrary)
    CoreDuetLibrary_cold_1(&v0);
}

uint64_t SecurityLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!SecurityLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_24D7882D8;
    v3 = 0;
    SecurityLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SecurityLibraryCore_frameworkLibrary)
    SecurityLibrary_cold_1(&v1);
  return SecurityLibraryCore_frameworkLibrary;
}

uint64_t FrontBoardServicesLibrary_0()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!FrontBoardServicesLibraryCore_frameworkLibrary_0)
  {
    v2 = xmmword_24D7882F0;
    v3 = 0;
    FrontBoardServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!FrontBoardServicesLibraryCore_frameworkLibrary_0)
    FrontBoardServicesLibrary_cold_1_0(&v1);
  return FrontBoardServicesLibraryCore_frameworkLibrary_0;
}

uint64_t SpringBoardServicesLibrary_0()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!SpringBoardServicesLibraryCore_frameworkLibrary_0)
  {
    v2 = xmmword_24D788308;
    v3 = 0;
    SpringBoardServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!SpringBoardServicesLibraryCore_frameworkLibrary_0)
    SpringBoardServicesLibrary_cold_1_0(&v1);
  return SpringBoardServicesLibraryCore_frameworkLibrary_0;
}

void sub_2174B2A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getRPRemoteDisplayDeviceClass_block_invoke(uint64_t a1)
{
  Class result;

  RapportLibrary();
  result = objc_getClass("RPRemoteDisplayDevice");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getRPRemoteDisplayDeviceClass_block_invoke_cold_1();
  getRPRemoteDisplayDeviceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void RapportLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = 0;
  if (!RapportLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_24D7883B8;
    v2 = 0;
    RapportLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!RapportLibraryCore_frameworkLibrary)
    RapportLibrary_cold_1(&v0);
}

Class __getRPRemoteDisplaySessionClass_block_invoke(uint64_t a1)
{
  Class result;

  RapportLibrary();
  result = objc_getClass("RPRemoteDisplaySession");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getRPRemoteDisplaySessionClass_block_invoke_cold_1();
  getRPRemoteDisplaySessionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __remoteDisplaySessionQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.BarcodeSupport.RemoteDisplaySession", v2);
  v1 = (void *)remoteDisplaySessionQueue_queue;
  remoteDisplaySessionQueue_queue = (uint64_t)v0;

}

uint64_t ContactsLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = ContactsLibraryCore_frameworkLibrary;
  v6 = ContactsLibraryCore_frameworkLibrary;
  if (!ContactsLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_24D7883F0;
    v8 = *(_OWORD *)&off_24D788400;
    v1 = _sl_dlopen();
    v4[3] = v1;
    ContactsLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_2174B33A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t ContactsLibrary()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = ContactsLibraryCore();
  if (!result)
    ContactsLibrary_cold_1(&v1);
  return result;
}

id getCNContactClass()
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
  v0 = (void *)getCNContactClass_softClass;
  v7 = getCNContactClass_softClass;
  if (!getCNContactClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCNContactClass_block_invoke;
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __getCNContactClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2174B34AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCNContactClass_block_invoke(uint64_t a1)
{
  Class result;

  ContactsLibrary();
  result = objc_getClass("CNContact");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCNContactClass_block_invoke_cold_1();
  getCNContactClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getCNContactVCardSerializationClass()
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
  v0 = (void *)getCNContactVCardSerializationClass_softClass;
  v7 = getCNContactVCardSerializationClass_softClass;
  if (!getCNContactVCardSerializationClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCNContactVCardSerializationClass_block_invoke;
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __getCNContactVCardSerializationClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2174B35B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCNContactVCardSerializationClass_block_invoke(uint64_t a1)
{
  Class result;

  ContactsLibrary();
  result = objc_getClass("CNContactVCardSerialization");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCNContactVCardSerializationClass_block_invoke_cold_1();
  getCNContactVCardSerializationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getCNContactStoreClass()
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
  v0 = (void *)getCNContactStoreClass_softClass;
  v7 = getCNContactStoreClass_softClass;
  if (!getCNContactStoreClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCNContactStoreClass_block_invoke;
    v3[3] = &unk_24D787158;
    v3[4] = &v4;
    __getCNContactStoreClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2174B36C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCNContactStoreClass_block_invoke(uint64_t a1)
{
  Class result;

  ContactsLibrary();
  result = objc_getClass("CNContactStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCNContactStoreClass_block_invoke_cold_1();
  getCNContactStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2174B4178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAPUIAirPlaySetupConfigurationWiFiClass_block_invoke(uint64_t a1)
{
  Class result;

  AirPlaySenderUILibrary();
  result = objc_getClass("APUIAirPlaySetupConfigurationWiFi");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAPUIAirPlaySetupConfigurationWiFiClass_block_invoke_cold_1();
  getAPUIAirPlaySetupConfigurationWiFiClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void AirPlaySenderUILibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = 0;
  if (!AirPlaySenderUILibraryCore_frameworkLibrary)
  {
    v1 = xmmword_24D788430;
    v2 = 0;
    AirPlaySenderUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AirPlaySenderUILibraryCore_frameworkLibrary)
    AirPlaySenderUILibrary_cold_1(&v0);
}

Class __getAPUIAirPlaySetupConfigurationDiscoveryBrokerClass_block_invoke(uint64_t a1)
{
  Class result;

  AirPlaySenderUILibrary();
  result = objc_getClass("APUIAirPlaySetupConfigurationDiscoveryBroker");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAPUIAirPlaySetupConfigurationDiscoveryBrokerClass_block_invoke_cold_1();
  getAPUIAirPlaySetupConfigurationDiscoveryBrokerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                             + 24);
  return result;
}

Class __getAPUIAirPlaySetupConfigurationReceiverClass_block_invoke(uint64_t a1)
{
  Class result;

  AirPlaySenderUILibrary();
  result = objc_getClass("APUIAirPlaySetupConfigurationReceiver");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAPUIAirPlaySetupConfigurationReceiverClass_block_invoke_cold_1();
  getAPUIAirPlaySetupConfigurationReceiverClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAPUIAirPlaySetupConfigurationClass_block_invoke(uint64_t a1)
{
  Class result;

  AirPlaySenderUILibrary();
  result = objc_getClass("APUIAirPlaySetupConfiguration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAPUIAirPlaySetupConfigurationClass_block_invoke_cold_1();
  getAPUIAirPlaySetupConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAPUIAirPlaySetupFlowLauncherClass_block_invoke(uint64_t a1)
{
  Class result;

  AirPlaySenderUILibrary();
  result = objc_getClass("APUIAirPlaySetupFlowLauncher");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAPUIAirPlaySetupFlowLauncherClass_block_invoke_cold_1();
  getAPUIAirPlaySetupFlowLauncherClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_2174B56BC()
{
  uint64_t v0;

  v0 = sub_2174BCA34();
  __swift_allocate_value_buffer(v0, qword_254EF57E0);
  __swift_project_value_buffer(v0, (uint64_t)qword_254EF57E0);
  return sub_2174BCA28();
}

uint64_t static Logger.intent.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_254EF57D8 != -1)
    swift_once();
  v2 = sub_2174BCA34();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_254EF57E0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_2174B57F4()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

void __getVNBarcodeSymbologyAppClipCodeSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *VisionLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BCSDetectedCode.m"), 22, CFSTR("%s"), *a1);

  __break(1u);
}

void MobileCoreServicesLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MobileCoreServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MobileCoreServicesSoftLink.m"), 10, CFSTR("%s"), *a1);

  __break(1u);
}

void __getLSAppLinkClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getLSAppLinkClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MobileCoreServicesSoftLink.m"), 11, CFSTR("Unable to find class %s"), "LSAppLink");

  __break(1u);
}

void __getLSApplicationProxyClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getLSApplicationProxyClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MobileCoreServicesSoftLink.m"), 12, CFSTR("Unable to find class %s"), "LSApplicationProxy");

  __break(1u);
}

void __getLSApplicationRecordClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getLSApplicationRecordClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MobileCoreServicesSoftLink.m"), 13, CFSTR("Unable to find class %s"), "LSApplicationRecord");

  __break(1u);
}

void __getLSApplicationWorkspaceClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getLSApplicationWorkspaceClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MobileCoreServicesSoftLink.m"), 14, CFSTR("Unable to find class %s"), "LSApplicationWorkspace");

  __break(1u);
}

void NetworkExtensionLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *NetworkExtensionLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("NetworkExtensionSoftLink.m"), 12, CFSTR("%s"), *a1);

  __break(1u);
}

void __getNEHotspotConfigurationClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getNEHotspotConfigurationClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("NetworkExtensionSoftLink.m"), 13, CFSTR("Unable to find class %s"), "NEHotspotConfiguration");

  __break(1u);
}

void __getNEHotspotConfigurationManagerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getNEHotspotConfigurationManagerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("NetworkExtensionSoftLink.m"), 14, CFSTR("Unable to find class %s"), "NEHotspotConfigurationManager");

  __break(1u);
}

void __getNFHardwareManagerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *NearFieldLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BCSNFCReader.m"), 38, CFSTR("%s"), *a1);

  __break(1u);
}

void __getNFHardwareManagerClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getNFHardwareManagerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BCSNFCReader.m"), 39, CFSTR("Unable to find class %s"), "NFHardwareManager");

  __break(1u);
}

void ClipServicesLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ClipServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BCSNFCReader.m"), 28, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCPSClipMetadataRequestClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCPSClipMetadataRequestClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BCSNFCReader.m"), 29, CFSTR("Unable to find class %s"), "CPSClipMetadataRequest");

  __break(1u);
}

void __getCPSClipRequestClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCPSClipRequestClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BCSNFCReader.m"), 30, CFSTR("Unable to find class %s"), "CPSClipRequest");

  __break(1u);
}

void __getCPSSessionConfigurationClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCPSSessionConfigurationClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BCSNFCReader.m"), 31, CFSTR("Unable to find class %s"), "CPSSessionConfiguration");

  __break(1u);
}

void __getNFCNDEFMessageClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreNFCLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BCSNFCReader.m"), 35, CFSTR("%s"), *a1);

  __break(1u);
}

void __getNFCNDEFMessageClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getNFCNDEFMessageClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BCSNFCReader.m"), 36, CFSTR("Unable to find class %s"), "NFCNDEFMessage");

  __break(1u);
}

void __getNFHardwareManagerClass_block_invoke_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *NearFieldLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BCSNFCReaderConnection.m"), 20, CFSTR("%s"), *a1);

  __break(1u);
}

void __getNFHardwareManagerClass_block_invoke_cold_2_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getNFHardwareManagerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BCSNFCReaderConnection.m"), 21, CFSTR("Unable to find class %s"), "NFHardwareManager");

  __break(1u);
}

void DataDetectorsCoreLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *DataDetectorsCoreLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("DataDetectorsCoreSoftLink.m"), 10, CFSTR("%s"), *a1);

  __break(1u);
}

void __getDDScannerResultClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getDDScannerResultClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("DataDetectorsCoreSoftLink.m"), 11, CFSTR("Unable to find class %s"), "DDScannerResult");

  __break(1u);
}

void _bcs_urlFromDDResult_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CFStringRef _DDResultCopyExtractedURL(DDResultRef)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BCSDDResultUtilities.m"), 12, CFSTR("%s"), dlerror());

  __break(1u);
}

void CoreNFCLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreNFCLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CoreNFCSoftLink.m"), 10, CFSTR("%s"), *a1);

  __break(1u);
}

void __getNFCNDEFMessageClass_block_invoke_cold_1_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getNFCNDEFMessageClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CoreNFCSoftLink.m"), 11, CFSTR("Unable to find class %s"), "NFCNDEFMessage");

  __break(1u);
}

void _bcs_CGImagePNGRepresentation_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGImageDestinationRef _CGImageDestinationCreateWithData(CFMutableDataRef, CFStringRef, size_t, CFDictionaryRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSGraphicsUtilities.m"), 24, CFSTR("%s"), OUTLINED_FUNCTION_3_2());

  __break(1u);
}

void _bcs_CGImagePNGRepresentation_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CFStringRef getkCGImagePropertyPNGCompressionFilter(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSGraphicsUtilities.m"), 31, CFSTR("%s"), OUTLINED_FUNCTION_3_2());

  __break(1u);
}

void _bcs_CGImagePNGRepresentation_cold_3()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CFStringRef getkCGImagePropertyPNGDictionary(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSGraphicsUtilities.m"), 32, CFSTR("%s"), OUTLINED_FUNCTION_3_2());

  __break(1u);
}

void _bcs_CGImagePNGRepresentation_cold_4()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CFStringRef getkCGImagePropertyPNGBandCount(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSGraphicsUtilities.m"), 30, CFSTR("%s"), OUTLINED_FUNCTION_3_2());

  __break(1u);
}

void _bcs_CGImagePNGRepresentation_cold_5()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _CGImageDestinationAddImage(CGImageDestinationRef, CGImageRef, CFDictionaryRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSGraphicsUtilities.m"), 23, CFSTR("%s"), OUTLINED_FUNCTION_3_2());

  __break(1u);
}

void _bcs_CGImagePNGRepresentation_cold_6()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "_Bool _CGImageDestinationFinalize(CGImageDestinationRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSGraphicsUtilities.m"), 25, CFSTR("%s"), OUTLINED_FUNCTION_3_2());

  __break(1u);
}

void _bcs_notificationIconBaseURL_cold_1(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "_bcs_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138478083;
  v5 = a1;
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "BCSNotificationIcon: Cannot create folder at URL: %{private}@ with error %{public}@", (uint8_t *)&v4, 0x16u);

  OUTLINED_FUNCTION_2();
}

void _bcs_notificationIconBaseURL_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_21748C000, MEMORY[0x24BDACB70], v2, "BCSNotificationIcon: Failed to get caches directory with error %{public}@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_2();
}

void _bcs_iconWithAppclipTreatment_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGImageSourceRef _CGImageSourceCreateWithURL(CFURLRef, CFDictionaryRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSGraphicsUtilities.m"), 26, CFSTR("%s"), OUTLINED_FUNCTION_3_2());

  __break(1u);
}

void _bcs_iconWithAppclipTreatment_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGImageRef _CGImageSourceCreateImageAtIndex(CGImageSourceRef, size_t, CFDictionaryRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSGraphicsUtilities.m"), 27, CFSTR("%s"), OUTLINED_FUNCTION_3_2());

  __break(1u);
}

void _bcs_applyTreatmentToIcon_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "_bcs_applyTreatmentToIcon: notification icon path is nil", v0, 2u);
}

void _bcs_applyTreatmentToIcon_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_21748C000, MEMORY[0x24BDACB70], v2, "_bcs_applyTreatmentToIcon: Failed to write PNG image data to disk with error %{public}@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_2();
}

void _bcs_applyTreatmentToIcon_cold_3()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "_bcs_applyTreatmentToIcon: Failed to get PNG image data", v0, 2u);
}

void ImageIOLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ImageIOLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BCSGraphicsUtilities.m"), 22, CFSTR("%s"), *a1);

  __break(1u);
}

void __getISIconClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getISIconClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BCSGraphicsUtilities.m"), 35, CFSTR("Unable to find class %s"), "ISIcon");

  __break(1u);
}

void IconServicesLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *IconServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BCSGraphicsUtilities.m"), 34, CFSTR("%s"), *a1);

  __break(1u);
}

void __getISImageClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getISImageClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BCSGraphicsUtilities.m"), 36, CFSTR("Unable to find class %s"), "ISImage");

  __break(1u);
}

void __getISImageDescriptorClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getISImageDescriptorClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BCSGraphicsUtilities.m"), 37, CFSTR("Unable to find class %s"), "ISImageDescriptor");

  __break(1u);
}

void __getCIContextClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreImageLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BCSGraphicsUtilities.m"), 39, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCIContextClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCIContextClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BCSGraphicsUtilities.m"), 40, CFSTR("Unable to find class %s"), "CIContext");

  __break(1u);
}

void iCalendarLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *iCalendarLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("ICalendarSoftLink.m"), 10, CFSTR("%s"), *a1);

  __break(1u);
}

void __getICSDocumentClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getICSDocumentClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ICalendarSoftLink.m"), 11, CFSTR("Unable to find class %s"), "ICSDocument");

  __break(1u);
}

void __getICSEventClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getICSEventClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ICalendarSoftLink.m"), 13, CFSTR("Unable to find class %s"), "ICSEvent");

  __break(1u);
}

void getTLAlertTopicPassbookNFCScanComplete_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getTLAlertTopicPassbookNFCScanComplete(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSNotification.m"), 71, CFSTR("%s"), OUTLINED_FUNCTION_3_2());

  __break(1u);
}

void __getEKEventStoreClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *EventKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BCSNotification.m"), 55, CFSTR("%s"), *a1);

  __break(1u);
}

void __getEKEventStoreClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getEKEventStoreClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BCSNotification.m"), 56, CFSTR("Unable to find class %s"), "EKEventStore");

  __break(1u);
}

void SpringBoardServicesLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SpringBoardServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BCSNotification.m"), 58, CFSTR("%s"), *a1);

  __break(1u);
}

void FrontBoardServicesLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *FrontBoardServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BCSNotification.m"), 62, CFSTR("%s"), *a1);

  __break(1u);
}

void __getTLAlertConfigurationClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getTLAlertConfigurationClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BCSNotification.m"), 70, CFSTR("Unable to find class %s"), "TLAlertConfiguration");

  __break(1u);
}

void ToneLibraryLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ToneLibraryLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BCSNotification.m"), 68, CFSTR("%s"), *a1);

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
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("UIKitSoftLink.m"), 10, CFSTR("%s"), *a1);

  __break(1u);
}

void __getUIAlertActionClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getUIAlertActionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("UIKitSoftLink.m"), 11, CFSTR("Unable to find class %s"), "UIAlertAction");

  __break(1u);
}

void __getUIAlertControllerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getUIAlertControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("UIKitSoftLink.m"), 12, CFSTR("Unable to find class %s"), "UIAlertController");

  __break(1u);
}

void __getUIApplicationClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getUIApplicationClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("UIKitSoftLink.m"), 13, CFSTR("Unable to find class %s"), "UIApplication");

  __break(1u);
}

void __getUIImageClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getUIImageClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("UIKitSoftLink.m"), 14, CFSTR("Unable to find class %s"), "UIImage");

  __break(1u);
}

void __getUIPasteboardClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getUIPasteboardClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("UIKitSoftLink.m"), 15, CFSTR("Unable to find class %s"), "UIPasteboard");

  __break(1u);
}

void __getUIActionClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getUIActionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("UIKitSoftLink.m"), 16, CFSTR("Unable to find class %s"), "UIAction");

  __break(1u);
}

void __getUIActivityViewControllerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getUIActivityViewControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("UIKitSoftLink.m"), 17, CFSTR("Unable to find class %s"), "UIActivityViewController");

  __break(1u);
}

void __getUIMenuClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getUIMenuClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("UIKitSoftLink.m"), 18, CFSTR("Unable to find class %s"), "UIMenu");

  __break(1u);
}

void __getUIViewClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getUIViewClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("UIKitSoftLink.m"), 19, CFSTR("Unable to find class %s"), "UIView");

  __break(1u);
}

void __getHKSignedClinicalDataSourceClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *HealthRecordServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BCSNSURLExtras.m"), 21, CFSTR("%s"), *a1);

  __break(1u);
}

void __getHKSignedClinicalDataSourceClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getHKSignedClinicalDataSourceClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BCSNSURLExtras.m"), 22, CFSTR("Unable to find class %s"), "HKSignedClinicalDataSource");

  __break(1u);
}

void __getHKVerifiableHealthRecordsParserClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *HealthRecordsExtractionLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BCSNSURLExtras.m"), 19, CFSTR("%s"), *a1);

  __break(1u);
}

void __getHKVerifiableHealthRecordsParserClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getHKVerifiableHealthRecordsParserClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BCSNSURLExtras.m"), 20, CFSTR("Unable to find class %s"), "HKVerifiableHealthRecordsParser");

  __break(1u);
}

void DataDetectorsUILibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *DataDetectorsUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("DataDetectorsUISoftLink.m"), 10, CFSTR("%s"), *a1);

  __break(1u);
}

void __getDDDetectionControllerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getDDDetectionControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("DataDetectorsUISoftLink.m"), 11, CFSTR("Unable to find class %s"), "DDDetectionController");

  __break(1u);
}

void __getDDCopyActionClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getDDCopyActionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("DataDetectorsUISoftLink.m"), 13, CFSTR("Unable to find class %s"), "DDCopyAction");

  __break(1u);
}

void __getDDContextMenuActionClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getDDContextMenuActionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("DataDetectorsUISoftLink.m"), 14, CFSTR("Unable to find class %s"), "DDContextMenuAction");

  __break(1u);
}

void _DDUIEventForResults_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "EKEvent *_DDUIEventForResults(EKEventStore *__strong, NSArray *__strong, NSDictionary *__strong)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("DataDetectorsUISoftLink.m"), 15, CFSTR("%s"), dlerror());

  __break(1u);
}

void getCPSSessionLaunchReasonQR_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCPSSessionLaunchReasonQR(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSURLAction.m"), 72, CFSTR("%s"), OUTLINED_FUNCTION_3_2());

  __break(1u);
}

void __getSSReadingListClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SafariServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BCSURLAction.m"), 37, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSSReadingListClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSSReadingListClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BCSURLAction.m"), 38, CFSTR("Unable to find class %s"), "SSReadingList");

  __break(1u);
}

void ClipServicesLibrary_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ClipServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BCSURLAction.m"), 68, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCPSClipRequestClass_block_invoke_cold_1_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCPSClipRequestClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BCSURLAction.m"), 70, CFSTR("Unable to find class %s"), "CPSClipRequest");

  __break(1u);
}

void __getCPSClipMetadataRequestClass_block_invoke_cold_1_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCPSClipMetadataRequestClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BCSURLAction.m"), 71, CFSTR("Unable to find class %s"), "CPSClipMetadataRequest");

  __break(1u);
}

void __getCoreTelephonyClientClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreTelephonyLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BCSURLAction.m"), 60, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCoreTelephonyClientClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCoreTelephonyClientClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BCSURLAction.m"), 61, CFSTR("Unable to find class %s"), "CoreTelephonyClient");

  __break(1u);
}

void __getHMAccessorySetupCoordinatorClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *HomeKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BCSURLDataParser.m"), 20, CFSTR("%s"), *a1);

  __break(1u);
}

void __getHMAccessorySetupCoordinatorClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getHMAccessorySetupCoordinatorClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BCSURLDataParser.m"), 21, CFSTR("Unable to find class %s"), "HMAccessorySetupCoordinator");

  __break(1u);
}

void ___bcs_openAppLinkIgnoringOpenStrategy_block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_21748C000, MEMORY[0x24BDACB70], v2, "BCSUtilities: Error opening user activity %{public}@ with payload.", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_2_2();
}

void ___bcs_openAppLinkIgnoringOpenStrategy_block_invoke_14_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_21748C000, MEMORY[0x24BDACB70], v2, "BCSUtilities: Error opening user activity %{public}@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_2_2();
}

void _bcs_lastTimeAppWasUsed_cold_1(double a1)
{
  int v1;
  double v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 134217984;
  v2 = (CFAbsoluteTimeGetCurrent() - a1) * 1000.0;
  _os_log_debug_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "_bcs_lastTimeAppWasUsed: Looking up last launch time for app took %.3f ms", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2_2();
}

void _bcs_lastTimeAppWasUsed_cold_2()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Querying last used date failed for app", v0, 2u);
}

void ___bcs_isHostAppEntitled_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SecTaskRef _SecTaskCreateFromSelf(CFAllocatorRef _Nullable)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSUtilities.m"), 31, CFSTR("%s"), OUTLINED_FUNCTION_3_2());

  __break(1u);
}

void ___bcs_isHostAppEntitled_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CFTypeRef _SecTaskCopyValueForEntitlement(SecTaskRef, CFStringRef, CFErrorRef *)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSUtilities.m"), 32, CFSTR("%s"), OUTLINED_FUNCTION_3_2());

  __break(1u);
}

void _bcs_frontBoardUnlockOptions_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getFBSOpenApplicationOptionKeyPromptUnlockDevice(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSUtilities.m"), 41, CFSTR("%s"), OUTLINED_FUNCTION_3_2());

  __break(1u);
}

void _bcs_frontBoardUnlockOptions_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getFBSOpenApplicationOptionKeyUnlockDevice(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSUtilities.m"), 40, CFSTR("%s"), OUTLINED_FUNCTION_3_2());

  __break(1u);
}

void _bcs_performActionAfterUnlock_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL _SBSGetScreenLockStatus(Boolean *)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSUtilities.m"), 36, CFSTR("%s"), OUTLINED_FUNCTION_3_2());

  __break(1u);
}

void _bcs_performActionAfterUnlock_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _SBSRequestPasscodeUnlockUI(void (^__strong)(Boolean))");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSUtilities.m"), 37, CFSTR("%s"), OUTLINED_FUNCTION_3_2());

  __break(1u);
}

void CoreDuetLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreDuetLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BCSUtilities.m"), 23, CFSTR("%s"), *a1);

  __break(1u);
}

void SecurityLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SecurityLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BCSUtilities.m"), 30, CFSTR("%s"), *a1);

  __break(1u);
}

void FrontBoardServicesLibrary_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *FrontBoardServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BCSUtilities.m"), 39, CFSTR("%s"), *a1);

  __break(1u);
}

void SpringBoardServicesLibrary_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SpringBoardServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BCSUtilities.m"), 35, CFSTR("%s"), *a1);

  __break(1u);
}

void __getRPRemoteDisplayDeviceClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getRPRemoteDisplayDeviceClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BCSContinuityCameraAction.m"), 17, CFSTR("Unable to find class %s"), "RPRemoteDisplayDevice");

  __break(1u);
}

void RapportLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *RapportLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BCSContinuityCameraAction.m"), 16, CFSTR("%s"), *a1);

  __break(1u);
}

void __getRPRemoteDisplaySessionClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getRPRemoteDisplaySessionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BCSContinuityCameraAction.m"), 18, CFSTR("Unable to find class %s"), "RPRemoteDisplaySession");

  __break(1u);
}

void ContactsLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ContactsLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("ContactsSoftLink.m"), 10, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCNContactClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCNContactClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ContactsSoftLink.m"), 11, CFSTR("Unable to find class %s"), "CNContact");

  __break(1u);
}

void __getCNContactVCardSerializationClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCNContactVCardSerializationClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ContactsSoftLink.m"), 12, CFSTR("Unable to find class %s"), "CNContactVCardSerialization");

  __break(1u);
}

void __getCNContactStoreClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCNContactStoreClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ContactsSoftLink.m"), 13, CFSTR("Unable to find class %s"), "CNContactStore");

  __break(1u);
}

void __getAPUIAirPlaySetupConfigurationWiFiClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAPUIAirPlaySetupConfigurationWiFiClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BCSWiFiConfigurationAction.m"), 28, CFSTR("Unable to find class %s"), "APUIAirPlaySetupConfigurationWiFi");

  __break(1u);
}

void AirPlaySenderUILibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AirPlaySenderUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BCSWiFiConfigurationAction.m"), 27, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAPUIAirPlaySetupConfigurationDiscoveryBrokerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAPUIAirPlaySetupConfigurationDiscoveryBrokerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BCSWiFiConfigurationAction.m"), 32, CFSTR("Unable to find class %s"), "APUIAirPlaySetupConfigurationDiscoveryBroker");

  __break(1u);
}

void __getAPUIAirPlaySetupConfigurationReceiverClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAPUIAirPlaySetupConfigurationReceiverClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BCSWiFiConfigurationAction.m"), 29, CFSTR("Unable to find class %s"), "APUIAirPlaySetupConfigurationReceiver");

  __break(1u);
}

void __getAPUIAirPlaySetupConfigurationClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAPUIAirPlaySetupConfigurationClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BCSWiFiConfigurationAction.m"), 30, CFSTR("Unable to find class %s"), "APUIAirPlaySetupConfiguration");

  __break(1u);
}

void __getAPUIAirPlaySetupFlowLauncherClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAPUIAirPlaySetupFlowLauncherClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BCSWiFiConfigurationAction.m"), 31, CFSTR("Unable to find class %s"), "APUIAirPlaySetupFlowLauncher");

  __break(1u);
}

uint64_t sub_2174BCA28()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2174BCA34()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t APSRemoteConfigGetBooleanIfPresent()
{
  return MEMORY[0x24BE035D8]();
}

uint64_t APSRemoteConfigGetShared()
{
  return MEMORY[0x24BE035E0]();
}

uint64_t AWDPostMetric()
{
  return MEMORY[0x24BEC2B08]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x24BDBB7A8]();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x24BDBC950](userNotification, responseFlags, timeout);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x24BED8480]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x24BE7AFA8]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x24BE7B008]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x24BE7B048]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x24BDBCF60]();
}

uint64_t _CFBundleCopyFrameworkURLForExecutablePath()
{
  return MEMORY[0x24BDBCF68]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
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

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x24BDAD9C0](*(_QWORD *)&__clock_id);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
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

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x24BDAE108]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
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

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A0](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A8](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

