@implementation NWStatsEntityMapperNEHelper

- (id)identifierForUUID:(id)a3 derivation:(int *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  int v11;
  void *v12;
  uint64_t v14;
  uint8_t v15[8];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  v16[0] = 0;
  v16[1] = 0;
  if (!v5)
  {
    v11 = 0;
    v12 = 0;
    if (!a4)
      goto LABEL_11;
    goto LABEL_10;
  }
  objc_msgSend(v5, "getUUIDBytes:", v16);
  v7 = NEHelperCacheCopySigningIdentifierMapping();
  v8 = (void *)v7;
  if (!v7)
    goto LABEL_8;
  if (MEMORY[0x212BDA310](v7) != MEMORY[0x24BDACFF0])
  {
    NStatGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

LABEL_8:
      v11 = 0;
      v12 = 0;
      goto LABEL_9;
    }
    *(_WORD *)v15 = 0;
    v10 = "xpc get type does not give a string";
LABEL_6:
    _os_log_impl(&dword_211429000, v9, OS_LOG_TYPE_ERROR, v10, v15, 2u);
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", xpc_string_get_string_ptr(v8));
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    NStatGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)v15 = 0;
    v10 = "NEHelper signing id is string but no identifier";
    goto LABEL_6;
  }
  v12 = (void *)v14;
  v11 = 4;
LABEL_9:

  if (a4)
LABEL_10:
    *a4 = v11;
LABEL_11:

  return v12;
}

@end
