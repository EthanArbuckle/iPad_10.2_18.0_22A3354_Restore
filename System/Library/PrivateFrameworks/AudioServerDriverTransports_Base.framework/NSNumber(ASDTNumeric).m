@implementation NSNumber(ASDTNumeric)

+ (uint64_t)asdtDataSizeForNumericType:()ASDTNumeric
{
  if (a3 > 0xA)
    return 0;
  else
    return byte_236D2B56F[a3];
}

+ (id)asdtNumberFromData:()ASDTNumeric withNumericType:
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  switch(a5)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(_BYTE *)a4 & 1, v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      LODWORD(a1) = *a4;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a1, v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)a4, v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithChar:", *(char *)a4, v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", *(__int16 *)a4, v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *a4, v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *(_QWORD *)a4, v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *(unsigned __int8 *)a4, v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", *(unsigned __int16 *)a4, v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *a4, v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)a4, v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v7 = 0;
      break;
  }
  return v7;
}

- (BOOL)asdtNumberToData:()ASDTNumeric withNumericType:andSize:
{
  _BOOL8 result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  switch(a4)
  {
    case 0:
    case 3:
    case 7:
      if (a5)
        goto LABEL_14;
      result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (result)
      {
        -[NSNumber(ASDTNumeric) asdtNumberToData:withNumericType:andSize:].cold.2(result, v8, v9, v10, v11, v12, v13, v14);
        goto LABEL_18;
      }
      break;
    case 1:
    case 5:
    case 9:
      if (a5 > 3)
        goto LABEL_14;
      result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (result)
      {
        -[NSNumber(ASDTNumeric) asdtNumberToData:withNumericType:andSize:].cold.4();
        goto LABEL_18;
      }
      break;
    case 2:
    case 6:
    case 10:
      if (a5 > 7)
        goto LABEL_14;
      result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (result)
      {
        -[NSNumber(ASDTNumeric) asdtNumberToData:withNumericType:andSize:].cold.5();
        goto LABEL_18;
      }
      break;
    case 4:
    case 8:
      if (a5 > 1)
      {
LABEL_14:
        switch(a4)
        {
          case 0:
            v15 = objc_msgSend(a1, "BOOLValue");
            goto LABEL_26;
          case 1:
            objc_msgSend(a1, "floatValue");
            *a3 = v16;
            break;
          case 2:
            objc_msgSend(a1, "doubleValue");
            *(_QWORD *)a3 = v17;
            break;
          case 3:
            v15 = objc_msgSend(a1, "charValue");
            goto LABEL_26;
          case 4:
            v18 = objc_msgSend(a1, "shortValue");
            goto LABEL_28;
          case 5:
            v19 = objc_msgSend(a1, "intValue");
            goto LABEL_30;
          case 6:
            v20 = objc_msgSend(a1, "longLongValue");
            goto LABEL_32;
          case 7:
            v15 = objc_msgSend(a1, "unsignedCharValue");
LABEL_26:
            *(_BYTE *)a3 = v15;
            break;
          case 8:
            v18 = objc_msgSend(a1, "unsignedShortValue");
LABEL_28:
            *(_WORD *)a3 = v18;
            break;
          case 9:
            v19 = objc_msgSend(a1, "unsignedIntValue");
LABEL_30:
            *a3 = v19;
            break;
          case 10:
            v20 = objc_msgSend(a1, "unsignedLongLongValue");
LABEL_32:
            *(_QWORD *)a3 = v20;
            break;
          default:
            break;
        }
        result = 1;
      }
      else
      {
        result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (result)
        {
          -[NSNumber(ASDTNumeric) asdtNumberToData:withNumericType:andSize:].cold.3();
          goto LABEL_18;
        }
      }
      break;
    default:
      result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (result)
      {
        -[NSNumber(ASDTNumeric) asdtNumberToData:withNumericType:andSize:].cold.1(a4);
LABEL_18:
        result = 0;
      }
      break;
  }
  return result;
}

- (void)asdtNumberToData:()ASDTNumeric withNumericType:andSize:.cold.1(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Bad numeric type: %u", (uint8_t *)v1, 8u);
}

- (void)asdtNumberToData:()ASDTNumeric withNumericType:andSize:.cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_11(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "Bad size for %d-bit numeric type: %zu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)asdtNumberToData:()ASDTNumeric withNumericType:andSize:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_11(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "Bad size for %d-bit numeric type: %zu", v1, v2, v3, v4, 0);
  OUTLINED_FUNCTION_2();
}

- (void)asdtNumberToData:()ASDTNumeric withNumericType:andSize:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_11(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "Bad size for %d-bit numeric type: %zu", v1, v2, v3, v4, 0);
  OUTLINED_FUNCTION_2();
}

- (void)asdtNumberToData:()ASDTNumeric withNumericType:andSize:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_11(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "Bad size for %d-bit numeric type: %zu", v1, v2, v3, v4, 0);
  OUTLINED_FUNCTION_2();
}

@end
