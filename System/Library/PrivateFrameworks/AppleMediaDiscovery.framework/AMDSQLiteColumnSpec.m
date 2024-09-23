@implementation AMDSQLiteColumnSpec

+ (char)getTypeEnumFor:(id)a3
{
  id v3;
  void *v4;
  char v6;
  id v7;
  id location[3];
  _QWORD v9[5];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!getTypeEnumFor__sqlDataTypeMap)
  {
    v9[0] = AMD_SQLITE_DATA_TYPE_BLOB;
    v10[0] = &unk_1EA4CEB18;
    v9[1] = AMD_SQLITE_DATA_TYPE_FLOAT;
    v10[1] = &unk_1EA4CEB30;
    v9[2] = AMD_SQLITE_DATA_TYPE_INT;
    v10[2] = &unk_1EA4CEB48;
    v9[3] = AMD_SQLITE_DATA_TYPE_INT64;
    v10[3] = &unk_1EA4CEB60;
    v9[4] = AMD_SQLITE_DATA_TYPE_TEXT;
    v10[4] = &unk_1EA4CEB78;
    v3 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
    v4 = (void *)getTypeEnumFor__sqlDataTypeMap;
    getTypeEnumFor__sqlDataTypeMap = (uint64_t)v3;

  }
  v7 = (id)objc_msgSend((id)getTypeEnumFor__sqlDataTypeMap, "objectForKey:", location[0]);
  if (v7)
    v6 = objc_msgSend(v7, "unsignedIntValue");
  else
    v6 = 0;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (id)getCreateStatementPart
{
  id v2;
  id v3;
  const __CFString *v4;
  void *v6;
  NSString *v7;
  NSString *v8;
  id v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  char v13;
  NSObject *v14;
  id v15[2];
  AMDSQLiteColumnSpec *v16;

  v16 = self;
  v15[1] = (id)a2;
  v15[0] = &stru_1EA4B7088;
  v13 = 0;
  v12 = 0;
  if (-[AMDSQLiteColumnSpec notNull](v16, "notNull"))
  {
    v14 = -[AMDSQLiteColumnSpec defaultValue](v16, "defaultValue");
    v13 = 1;
    v12 = v14 != 0;
  }
  if ((v13 & 1) != 0)

  if (v12)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = -[AMDSQLiteColumnSpec defaultValue](v16, "defaultValue");
    v2 = (id)objc_msgSend(v10, "stringWithFormat:", CFSTR(" ON CONFLICT REPLACE DEFAULT '%@'"), v11);
    v3 = v15[0];
    v15[0] = v2;

  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  v8 = -[AMDSQLiteColumnSpec name](v16, "name");
  v7 = -[AMDSQLiteColumnSpec typeString](v16, "typeString");
  if (-[AMDSQLiteColumnSpec notNull](v16, "notNull"))
    v4 = CFSTR(" NOT NULL");
  else
    v4 = &stru_1EA4B7088;
  v9 = (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ %@%@%@"), v8, v7, v4, v15[0]);

  objc_storeStrong(v15, 0);
  return v9;
}

- (id)getDefaultValue
{
  return -[AMDSQLiteColumnSpec defaultValue](self, "defaultValue", a2, self);
}

- (id)getName
{
  return -[AMDSQLiteColumnSpec name](self, "name", a2, self);
}

- (id)getSelectColumnName
{
  NSString *v2;
  NSString *v4;
  char v5;
  NSString *v6;
  char v7;
  NSString *v8;
  NSString *v10;

  v4 = -[AMDSQLiteColumnSpec alias](self, "alias");
  v7 = 0;
  v5 = 0;
  if (v4)
  {
    v8 = -[AMDSQLiteColumnSpec alias](self, "alias");
    v7 = 1;
    v2 = v8;
  }
  else
  {
    v6 = -[AMDSQLiteColumnSpec name](self, "name");
    v5 = 1;
    v2 = v6;
  }
  v10 = v2;
  if ((v5 & 1) != 0)

  if ((v7 & 1) != 0)
  return v10;
}

- (id)getSelectColumnExpression
{
  NSString *v2;
  NSString *v3;
  NSString *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  NSString *v10;
  BOOL v11;
  char v12;
  NSString *v13;
  char v14;
  NSString *v15;
  char v16;
  NSString *v17;
  char v18;
  id v19;
  char v20;
  NSString *v21;
  char v22;
  NSString *v23;
  NSString *v25;

  v2 = -[AMDSQLiteColumnSpec derivationExpression](self, "derivationExpression");
  v11 = v2 != 0;

  if (v11)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = -[AMDSQLiteColumnSpec derivationExpression](self, "derivationExpression");
    v8 = -[AMDSQLiteColumnSpec alias](self, "alias");
    v14 = 0;
    v12 = 0;
    if (v8)
    {
      v15 = -[AMDSQLiteColumnSpec alias](self, "alias");
      v14 = 1;
      v5 = v15;
    }
    else
    {
      v13 = -[AMDSQLiteColumnSpec name](self, "name");
      v12 = 1;
      v5 = v13;
    }
    v25 = (NSString *)(id)objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ AS %@"), v7, v5);
    if ((v12 & 1) != 0)

    if ((v14 & 1) != 0)
  }
  else
  {
    v10 = -[AMDSQLiteColumnSpec alias](self, "alias");
    v22 = 0;
    v20 = 0;
    v18 = 0;
    v16 = 0;
    if (v10)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      v23 = -[AMDSQLiteColumnSpec name](self, "name");
      v22 = 1;
      v21 = -[AMDSQLiteColumnSpec alias](self, "alias");
      v20 = 1;
      v19 = (id)objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ AS %@"), v23, v21);
      v18 = 1;
      v3 = (NSString *)v19;
    }
    else
    {
      v17 = -[AMDSQLiteColumnSpec name](self, "name");
      v16 = 1;
      v3 = v17;
    }
    v25 = v3;
    if ((v16 & 1) != 0)

    if ((v18 & 1) != 0)
    if ((v20 & 1) != 0)

    if ((v22 & 1) != 0)
  }
  return v25;
}

- (char)getType
{
  return -[AMDSQLiteColumnSpec dataType](self, "dataType", a2, self);
}

- (id)getTypeString
{
  return -[AMDSQLiteColumnSpec typeString](self, "typeString", a2, self);
}

- (AMDSQLiteColumnSpec)initWithDict:(id)a3 withName:(id)a4 error:(id *)a5
{
  id v5;
  id v6;
  id v7;
  char v8;
  id v9;
  id v11;
  int v12;
  int v13;
  id v14;
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  _BOOL4 v19;
  _BOOL4 v20;
  id v21;
  id v22;
  id v23;
  id v24;
  BOOL v25;
  id v28;
  id v29;
  id v30;
  id v31;
  int v32;
  os_log_type_t v33;
  id v34;
  objc_super v35;
  id *v36;
  id v37;
  id location[2];
  id v39;
  AMDSQLiteColumnSpec *v40;
  uint8_t v41[64];
  uint8_t v42[24];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v39 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v37 = 0;
  objc_storeStrong(&v37, a4);
  v36 = a5;
  v5 = v39;
  v39 = 0;
  v35.receiver = v5;
  v35.super_class = (Class)AMDSQLiteColumnSpec;
  v39 = -[AMDSQLiteColumnSpec init](&v35, sel_init);
  objc_storeStrong(&v39, v39);
  v34 = MEMORY[0x1E0C81028];
  v33 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v42, (uint64_t)v37);
    _os_log_debug_impl(&dword_1DC678000, (os_log_t)v34, v33, "SQLITE Loading schema for column '%@'", v42, 0xCu);
  }
  objc_storeStrong(&v34, 0);
  objc_msgSend(v39, "setName:", v37);
  v24 = (id)objc_msgSend(location[0], "objectForKey:", AMD_SQLITE_TYPE);
  objc_msgSend(v39, "setTypeString:");

  v6 = (id)objc_msgSend(v39, "typeString");
  v25 = v6 != 0;

  if (v25)
  {
    v22 = (id)objc_msgSend(v39, "typeString");
    v21 = (id)objc_msgSend(v22, "uppercaseString");
    objc_msgSend(v39, "setTypeString:");

    v23 = (id)objc_msgSend(v39, "typeString");
    v8 = +[AMDSQLiteColumnSpec getTypeEnumFor:](AMDSQLiteColumnSpec, "getTypeEnumFor:");
    objc_msgSend(v39, "setDataType:", v8);

    if ((char)objc_msgSend(v39, "dataType") == 1)
    {
      objc_msgSend(v39, "setNotNull:", 0);
    }
    else
    {
      v31 = (id)objc_msgSend(location[0], "objectForKey:", AMD_SQLITE_NOT_NULL);
      if (v31)
        v20 = objc_msgSend(v31, "intValue") != 0;
      else
        v20 = 0;
      objc_msgSend(v39, "setNotNull:", v20);
      objc_storeStrong(&v31, 0);
    }
    v30 = (id)objc_msgSend(location[0], "objectForKey:", AMD_SQLITE_UNIQUE);
    if (v30)
      v19 = objc_msgSend(v30, "intValue") != 0;
    else
      v19 = 0;
    objc_msgSend(v39, "setUnique:", v19);
    objc_msgSend(v39, "setDefaultValue:", 0);
    v29 = (id)objc_msgSend(location[0], "objectForKey:", AMD_SQLITE_DEFAULT_VALUE);
    if (v29)
    {
      v18 = (char)objc_msgSend(v39, "dataType");
      if (v18 <= 5)
        __asm { BR              X8 }
      v9 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 29, CFSTR("Bad data type"));
      *v36 = v9;
      v40 = 0;
      v32 = 1;
    }
    else
    {
      v16 = (id)objc_msgSend(location[0], "objectForKey:", AMD_SQLITE_ALIAS);
      objc_msgSend(v39, "setAlias:");

      v17 = (id)objc_msgSend(location[0], "objectForKey:", AMD_SQLITE_DERIVATION_EXP);
      objc_msgSend(v39, "setDerivationExpression:");

      v28 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEBUG))
      {
        v11 = v37;
        v12 = (char)objc_msgSend(v39, "dataType");
        v13 = objc_msgSend(v39, "notNull") & 1;
        v15 = (id)objc_msgSend(v39, "defaultValue");
        v14 = (id)objc_msgSend(v39, "derivationExpression");
        __os_log_helper_16_2_6_8_64_4_0_4_0_8_64_8_64_4_0((uint64_t)v41, (uint64_t)v11, v12, v13, (uint64_t)v15, (uint64_t)v14, objc_msgSend(v39, "unique") & 1);
        _os_log_debug_impl(&dword_1DC678000, (os_log_t)v28, OS_LOG_TYPE_DEBUG, "SQLITE Loaded schema for column '%@', type: %u, notNull: %u, default: %@, derivation: %@, unique:%u", v41, 0x32u);

      }
      objc_storeStrong(&v28, 0);
      v40 = (AMDSQLiteColumnSpec *)v39;
      v32 = 1;
    }
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
  }
  else
  {
    v7 = +[AMDMiscHelpers logAndCreateError:errorMessage:](AMDMiscHelpers, "logAndCreateError:errorMessage:", 29, CFSTR("No data type"));
    *v36 = v7;
    v40 = 0;
    v32 = 1;
  }
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v39, 0);
  return v40;
}

- (BOOL)isNotNull
{
  return -[AMDSQLiteColumnSpec notNull](self, "notNull", a2, self);
}

- (BOOL)isRequired
{
  NSObject *v2;
  BOOL v5;

  if (!-[AMDSQLiteColumnSpec notNull](self, "notNull"))
    return 0;
  v2 = -[AMDSQLiteColumnSpec defaultValue](self, "defaultValue");
  v5 = v2 == 0;

  return v5;
}

- (NSString)alias
{
  return self->_alias;
}

- (void)setAlias:(id)a3
{
  objc_storeStrong((id *)&self->_alias, a3);
}

- (char)dataType
{
  return self->_dataType;
}

- (void)setDataType:(char)a3
{
  self->_dataType = a3;
}

- (NSObject)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(id)a3
{
  objc_storeStrong((id *)&self->_defaultValue, a3);
}

- (NSString)derivationExpression
{
  return self->_derivationExpression;
}

- (void)setDerivationExpression:(id)a3
{
  objc_storeStrong((id *)&self->_derivationExpression, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (BOOL)notNull
{
  return self->_notNull;
}

- (void)setNotNull:(BOOL)a3
{
  self->_notNull = a3;
}

- (NSString)typeString
{
  return self->_typeString;
}

- (void)setTypeString:(id)a3
{
  objc_storeStrong((id *)&self->_typeString, a3);
}

- (BOOL)unique
{
  return self->_unique;
}

- (void)setUnique:(BOOL)a3
{
  self->_unique = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeString, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_derivationExpression, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_alias, 0);
}

@end
