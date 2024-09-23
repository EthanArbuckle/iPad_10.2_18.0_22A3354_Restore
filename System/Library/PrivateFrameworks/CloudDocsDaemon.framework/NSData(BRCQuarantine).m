@implementation NSData(BRCQuarantine)

- (uint64_t)br_qtnFlags
{
  id v1;
  uint64_t v2;
  void *v4;
  NSObject *v5;

  v1 = objc_retainAutorelease(a1);
  v2 = objc_msgSend(v1, "bytes");
  if ((unint64_t)objc_msgSend(v1, "length") >= 7
    && *(_BYTE *)v2 == 113
    && *(_BYTE *)(v2 + 1) == 47
    && *(_BYTE *)(v2 + 6) == 59)
  {
    return strtol((const char *)(v2 + 2), 0, 16);
  }
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    -[NSData(BRCQuarantine) br_qtnFlags].cold.1(v1, (uint64_t)v4, v5);

  return 0;
}

- (void)br_qtnFlags
{
  void *v4;
  id v5;
  id v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_retainAutorelease(a1);
  objc_msgSend(v4, "brc_hexadecimalStringWithBytes:length:", objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "UTF8String");
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_1CBD43000, a3, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Corrupt quarantine: %s%@", v7, 0x16u);

}

@end
