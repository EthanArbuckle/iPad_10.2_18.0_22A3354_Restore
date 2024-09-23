void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id ATXHeroDataXPCInterface()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254628438);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x24BDBCF20];
  v2 = objc_opt_class();
  objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_donateHeroAppPredictions_completion_, 0, 0);

  return v0;
}

uint64_t ATXPBHeroAppPredictionReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
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
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  void *v58;
  char v59;
  unsigned int v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t v66;

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
          *(_WORD *)(a1 + 116) |= 2u;
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
          v66 = 16;
          goto LABEL_107;
        case 2u:
          *(_WORD *)(a1 + 116) |= 8u;
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
          v66 = 32;
          goto LABEL_107;
        case 3u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 80;
          goto LABEL_68;
        case 4u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_WORD *)(a1 + 116) |= 0x200u;
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
                  goto LABEL_79;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v28 = 0;
LABEL_79:
          *(_BYTE *)(a1 + 112) = v28 != 0;
          continue;
        case 5u:
          *(_WORD *)(a1 + 116) |= 0x100u;
          v33 = *v3;
          v34 = *(_QWORD *)(a2 + v33);
          if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v34);
            *(_QWORD *)(a2 + v33) = v34 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v66 = 72;
          goto LABEL_107;
        case 6u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 104;
          goto LABEL_68;
        case 7u:
          PBReaderReadData();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 88;
          goto LABEL_68;
        case 8u:
          v35 = 0;
          v36 = 0;
          v37 = 0;
          *(_WORD *)(a1 + 116) |= 1u;
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
              v37 |= (unint64_t)(v41 & 0x7F) << v35;
              if (v41 < 0)
              {
                v35 += 7;
                v15 = v36++ >= 9;
                if (v15)
                {
                  v37 = 0;
                  goto LABEL_83;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v37 = 0;
LABEL_83:
          v65 = 8;
          goto LABEL_96;
        case 9u:
          v42 = 0;
          v43 = 0;
          v37 = 0;
          *(_WORD *)(a1 + 116) |= 0x80u;
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
              v37 |= (unint64_t)(v47 & 0x7F) << v42;
              if (v47 < 0)
              {
                v42 += 7;
                v15 = v43++ >= 9;
                if (v15)
                {
                  v37 = 0;
                  goto LABEL_87;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v37 = 0;
LABEL_87:
          v65 = 64;
          goto LABEL_96;
        case 0xAu:
          v48 = 0;
          v49 = 0;
          v37 = 0;
          *(_WORD *)(a1 + 116) |= 0x40u;
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
              v37 |= (unint64_t)(v53 & 0x7F) << v48;
              if (v53 < 0)
              {
                v48 += 7;
                v15 = v49++ >= 9;
                if (v15)
                {
                  v37 = 0;
                  goto LABEL_91;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v37 = 0;
LABEL_91:
          v65 = 56;
          goto LABEL_96;
        case 0xBu:
          *(_WORD *)(a1 + 116) |= 4u;
          v54 = *v3;
          v55 = *(_QWORD *)(a2 + v54);
          if (v55 <= 0xFFFFFFFFFFFFFFF7 && v55 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v55);
            *(_QWORD *)(a2 + v54) = v55 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v66 = 24;
          goto LABEL_107;
        case 0xCu:
          *(_WORD *)(a1 + 116) |= 0x10u;
          v56 = *v3;
          v57 = *(_QWORD *)(a2 + v56);
          if (v57 <= 0xFFFFFFFFFFFFFFF7 && v57 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v57);
            *(_QWORD *)(a2 + v56) = v57 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v66 = 40;
LABEL_107:
          *(_QWORD *)(a1 + v66) = v20;
          continue;
        case 0xDu:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 96;
LABEL_68:
          v58 = *(void **)(a1 + v25);
          *(_QWORD *)(a1 + v25) = v24;

          continue;
        case 0xEu:
          v59 = 0;
          v60 = 0;
          v37 = 0;
          *(_WORD *)(a1 + 116) |= 0x20u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v61 = *v3;
        v62 = *(_QWORD *)(a2 + v61);
        v63 = v62 + 1;
        if (v62 == -1 || v63 > *(_QWORD *)(a2 + *v4))
          break;
        v64 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v62);
        *(_QWORD *)(a2 + v61) = v63;
        v37 |= (unint64_t)(v64 & 0x7F) << v59;
        if ((v64 & 0x80) == 0)
          goto LABEL_93;
        v59 += 7;
        v15 = v60++ >= 9;
        if (v15)
        {
          v37 = 0;
          goto LABEL_95;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_93:
      if (*(_BYTE *)(a2 + *v5))
        v37 = 0;
LABEL_95:
      v65 = 48;
LABEL_96:
      *(_QWORD *)(a1 + v65) = v37;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
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

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x24BE7AFB0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x24BE7AFD8]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x24BE7B008]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x24BE7B028]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x24BE7B030]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x24BE7B048]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

