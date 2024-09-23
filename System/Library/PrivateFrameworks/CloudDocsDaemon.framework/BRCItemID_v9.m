@implementation BRCItemID_v9

- (id)itemIDString
{
  int kind;
  unsigned __int8 *p_kind;
  __CFString *v5;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _BYTE v11[37];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  memset(v11, 0, sizeof(v11));
  p_kind = &self->_kind;
  kind = self->_kind;
  v5 = CFSTR("root");
  switch(kind)
  {
    case 0:
    case 4:
      uuid_unparse_upper(self->_uuid, v11);
      return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v11, 36, 4);
    case 1:
    case 5:
      return v5;
    case 2:
      return CFSTR("documents");
    case 3:
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[BRCItemID_v9 itemIDString].cold.2();

      goto LABEL_10;
    default:
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[BRCItemID_v9 itemIDString].cold.1(p_kind, (uint64_t)v7, v8);

LABEL_10:
      v5 = 0;
      return v5;
  }
}

- (BRCItemID_v9)initWithUUID:(const char *)a3
{
  BRCItemID_v9 *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRCItemID_v9;
  result = -[BRCItemID_v9 init](&v5, sel_init);
  if (result)
  {
    result->_kind = 0;
    *(_OWORD *)result->_uuid = *(_OWORD *)a3;
  }
  return result;
}

- (BRCItemID_v9)initWithRootObject:(RootItemObject *)a3
{
  BRCItemID_v9 *v4;
  BRCItemID_v9 *v5;
  uint64_t v6;
  BRCALRowID *appLibraryRowID;
  void *v9;
  NSObject *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BRCItemID_v9;
  v4 = -[BRCItemID_v9 init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_kind = a3->var0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(&a3->var0 + 1));
    v6 = objc_claimAutoreleasedReturnValue();
    appLibraryRowID = v5->_appLibraryRowID;
    v5->_appLibraryRowID = (BRCALRowID *)v6;

    if (a3->var0 - 3 <= 0xFFFFFFFD)
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[BRCItemID_v9 initWithRootObject:].cold.1();

    }
  }
  return v5;
}

- (BRCItemID_v9)initWithUUIDObject:(_UUIDItemObject_OLD *)a3
{
  BRCItemID_v9 *v4;
  BRCItemID_v9 *v5;
  uint64_t v6;
  BRCALRowID *appLibraryRowID;
  void *v9;
  NSObject *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BRCItemID_v9;
  v4 = -[BRCItemID_v9 init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_kind = a3->var0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(&a3->var0 + 1));
    v6 = objc_claimAutoreleasedReturnValue();
    appLibraryRowID = v5->_appLibraryRowID;
    v5->_appLibraryRowID = (BRCALRowID *)v6;

    *(_OWORD *)v5->_uuid = *(_OWORD *)((char *)&a3->var1 + 1);
    if (a3->var0 - 6 <= 0xFFFFFFFD)
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[BRCItemID_v9 initWithUUIDObject:].cold.1();

    }
  }
  return v5;
}

+ (id)newFromSqliteValue:(sqlite3_value *)a3
{
  int v4;
  int v5;
  const void *v6;
  int v7;
  const unsigned __int8 *v9;
  int v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  _WORD v21[17];

  *(_QWORD *)&v21[13] = *MEMORY[0x1E0C80C00];
  v4 = sqlite3_value_type(a3);
  if (v4 == 5)
    return 0;
  v5 = v4;
  if (v4 != 4)
  {
    v9 = sqlite3_value_text(a3);
    v10 = sqlite3_value_bytes(a3);
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v9, v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v16;
      v20 = 1024;
      *(_DWORD *)v21 = v5;
      v21[2] = 2112;
      *(_QWORD *)&v21[3] = v11;
      _os_log_fault_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: unmigrated? invalid BRCItemID (%@) - %d%@", (uint8_t *)&v18, 0x1Cu);

    }
    return 0;
  }
  v6 = sqlite3_value_blob(a3);
  v7 = sqlite3_value_bytes(a3);
  if (v7 == 16)
    return -[BRCItemID_v9 initWithUUID:]([BRCItemID_v9 alloc], "initWithUUID:", v6);
  v13 = v7;
  if (v7 != 21)
  {
    if (v7 == 5)
      return -[BRCItemID_v9 initWithRootObject:]([BRCItemID_v9 alloc], "initWithRootObject:", v6);
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v6, v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v17;
      v20 = 2112;
      *(_QWORD *)v21 = v14;
      _os_log_fault_impl(&dword_1CBD43000, v15, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: invalid BRCItemID (%@)%@", (uint8_t *)&v18, 0x16u);

    }
    return 0;
  }
  return -[BRCItemID_v9 initWithUUIDObject:]([BRCItemID_v9 alloc], "initWithUUIDObject:", v6);
}

- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4
{
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _BYTE *v11;
  sqlite3_stmt *v12;
  int v13;
  int v14;
  void *v15;
  NSObject *v16;
  _DWORD v17[2];
  _BYTE v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  memset(v17, 0, 5);
  memset(v18, 0, 21);
  switch(self->_kind)
  {
    case 0u:
      sqlite3_bind_blob(a3, a4, self->_uuid, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      return;
    case 1u:
      LOBYTE(v17[0]) = 1;
      *(_DWORD *)((char *)v17 + 1) = -[BRCALRowID intValue](self->_appLibraryRowID, "intValue");
      if (*(_DWORD *)((char *)v17 + 1))
        goto LABEL_9;
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        goto LABEL_21;
      goto LABEL_20;
    case 2u:
      LOBYTE(v17[0]) = 2;
      *(_DWORD *)((char *)v17 + 1) = -[BRCALRowID intValue](self->_appLibraryRowID, "intValue");
      if (!*(_DWORD *)((char *)v17 + 1))
      {
        brc_bread_crumbs();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
LABEL_20:
          -[BRCItemID_v9 sqliteBind:index:].cold.2();
LABEL_21:

      }
LABEL_9:
      v11 = v17;
      v12 = a3;
      v13 = a4;
      v14 = 5;
      goto LABEL_18;
    case 3u:
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[BRCItemID_v9 itemIDString].cold.2();
      goto LABEL_12;
    case 4u:
      v18[0] = 4;
      *(_DWORD *)&v18[1] = -[BRCALRowID intValue](self->_appLibraryRowID, "intValue");
      if (*(_DWORD *)&v18[1])
        goto LABEL_17;
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        goto LABEL_23;
      goto LABEL_24;
    case 5u:
      v18[0] = 5;
      *(_DWORD *)&v18[1] = -[BRCALRowID intValue](self->_appLibraryRowID, "intValue");
      if (*(_DWORD *)&v18[1])
        goto LABEL_17;
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
LABEL_23:
        -[BRCItemID_v9 sqliteBind:index:].cold.4();
LABEL_24:

LABEL_17:
      *(_OWORD *)&v18[5] = *(_OWORD *)self->_uuid;
      v11 = v18;
      v12 = a3;
      v13 = a4;
      v14 = 21;
LABEL_18:
      sqlite3_bind_blob(v12, v13, v11, v14, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      break;
    default:
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[BRCItemID_v9 sqliteBind:index:].cold.1();
LABEL_12:

      sqlite3_bind_null(a3, a4);
      break;
  }
}

- (id)_initAsLibraryRootWithAppLibraryRowID:(id)a3 enclosureUUID:(id)a4
{
  id v7;
  id v8;
  BRCItemID_v9 *v9;
  id *p_isa;
  void *v11;
  NSObject *v12;
  id *v13;
  void *v15;
  NSObject *v16;
  const char *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BRCItemID_v9;
  v9 = -[BRCItemID_v9 init](&v18, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (!v9)
  {
LABEL_10:
    v13 = p_isa;
    goto LABEL_11;
  }
  if (!v8)
  {
    v9->_kind = 1;
    goto LABEL_8;
  }
  v9->_kind = 4;
  if ((_br_parseUUIDString() & 1) != 0)
  {
LABEL_8:
    objc_storeStrong(p_isa + 1, a3);
    if (!v7 || !objc_msgSend(v7, "unsignedLongLongValue"))
    {
      abc_report_panic_with_signature();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("can't initialize library root with invalid library rowid %@"), v7);
      objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[BRCAccountSession(BRCDatabaseManager) _startWatcher].cold.1();

      brc_append_system_info_to_message();
      v17 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
      __assert_rtn("-[BRCItemID_v9 _initAsLibraryRootWithAppLibraryRowID:enclosureUUID:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseSchema.m", 340, v17);
    }
    goto LABEL_10;
  }
  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    -[BRCItemID_v9 _initAsLibraryRootWithAppLibraryRowID:enclosureUUID:].cold.2();

  v13 = 0;
LABEL_11:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLibraryRowID, 0);
}

- (void)itemIDString
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: we should not have alias uuid types anymores%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithRootObject:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: object->item_code == 1 || object->item_code == 2%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithUUIDObject:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: object->item_code == 4 || object->item_code == 5%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)sqliteBind:index:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: unknown itemID kind%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)sqliteBind:index:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: rio.app_lib_rowid%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)sqliteBind:index:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: uio.app_lib_rowid%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_initAsLibraryRootWithAppLibraryRowID:enclosureUUID:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_2(&dword_1CBD43000, v0, (uint64_t)v0, "[CRIT] UNREACHABLE: invalid enclosure uuid - %@%@", v1);
  OUTLINED_FUNCTION_2();
}

@end
