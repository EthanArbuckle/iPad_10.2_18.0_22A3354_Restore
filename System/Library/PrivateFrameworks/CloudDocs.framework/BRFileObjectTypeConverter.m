@implementation BRFileObjectTypeConverter

+ (char)toChar:(unsigned __int8)a3
{
  uint64_t v3;
  void *v4;
  NSObject *v5;

  if (a3 >= 5u)
  {
    brc_bread_crumbs((uint64_t)"+[BRFileObjectTypeConverter toChar:]", 34);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      +[BRFileObjectTypeConverter toChar:].cold.1();

    LOBYTE(v3) = 0;
  }
  else
  {
    return 0x6C6E666174uLL >> (8 * a3);
  }
  return v3;
}

+ (unsigned)toBRFileObjectIDType:(char)a3
{
  void *v4;
  NSObject *v5;

  if (a3 <= 107)
  {
    if (a3 == 97)
      return 1;
    if (a3 == 102)
      return 2;
  }
  else
  {
    switch(a3)
    {
      case 'l':
        return 4;
      case 'n':
        return 3;
      case 't':
        return 0;
    }
  }
  brc_bread_crumbs((uint64_t)"+[BRFileObjectTypeConverter toBRFileObjectIDType:]", 53);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    +[BRFileObjectTypeConverter toBRFileObjectIDType:].cold.1();

  return 5;
}

+ (void)toChar:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_3(&dword_19CBF0000, v0, v1, "[CRIT] UNREACHABLE: Unrecognized BRFileObjectIDType %d%@");
  OUTLINED_FUNCTION_1();
}

+ (void)toBRFileObjectIDType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_3(&dword_19CBF0000, v0, v1, "[CRIT] UNREACHABLE: Unrecognized char while converting to BRFileObjectIDType %c%@");
  OUTLINED_FUNCTION_1();
}

@end
