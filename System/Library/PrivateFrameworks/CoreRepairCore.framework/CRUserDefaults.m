@implementation CRUserDefaults

- (CRUserDefaults)initWithSuiteName:(id)a3
{
  id v5;
  CRUserDefaults *v6;
  CRUserDefaults *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  id v36;
  NSDictionary *defaultValues;
  NSObject *v38;
  NSObject *v39;
  id v41;
  objc_super v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v42.receiver = self;
  v42.super_class = (Class)CRUserDefaults;
  v6 = -[CRUserDefaults init](&v42, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_suiteName, a3);
    if (os_variant_has_internal_content())
    {
      v8 = (void *)MEMORY[0x24BDD17C8];
      v9 = getuid();
      objc_msgSend_stringWithFormat_(v8, v10, (uint64_t)CFSTR("%d"), v11, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v13, (uint64_t)CFSTR("%@.plist"), v14, v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingPathComponent_(CFSTR("/var/MobileSoftwareUpdate/Controller/RepairServices"), v16, (uint64_t)CFSTR("defaults"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingPathComponent_(v18, v19, (uint64_t)v12, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingPathComponent_(v21, v22, (uint64_t)v15, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v21) = objc_msgSend_fileExistsAtPath_(v28, v29, (uint64_t)v24, v30);

      if ((_DWORD)v21)
      {
        objc_msgSend_dataWithContentsOfFile_(MEMORY[0x24BDBCE50], v31, (uint64_t)v24, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 0;
        objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x24BDD1770], v34, (uint64_t)v33, 0, 0, &v41);
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = v41;
        defaultValues = v7->_defaultValues;
        v7->_defaultValues = (NSDictionary *)v35;

        handleForCategory(0);
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v44 = v24;
          _os_log_impl(&dword_214503000, v38, OS_LOG_TYPE_DEFAULT, "Read defaults from: %@", buf, 0xCu);
        }

        if (v36)
        {
          handleForCategory(0);
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            sub_214567484((uint64_t)v36, v39);

        }
      }

    }
  }

  return v7;
}

- (id)objectForKey:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  id v14;
  NSDictionary *defaultValues;
  void *v16;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDBCF50]);
  v8 = (void *)objc_msgSend_initWithSuiteName_(v5, v6, (uint64_t)self->_suiteName, v7);
  objc_msgSend_objectForKey_(v8, v9, (uint64_t)v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v14 = v11;
  }
  else
  {
    defaultValues = self->_defaultValues;
    if (!defaultValues)
    {
      v16 = 0;
      goto LABEL_6;
    }
    objc_msgSend_objectForKey_(defaultValues, v12, (uint64_t)v4, v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v14;
LABEL_6:

  return v16;
}

- (id)dictionaryForKey:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)a3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (id)stringForKey:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)a3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_stringValue(v4, v5, v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

    v4 = (void *)v8;
  }
  return v4;
}

- (BOOL)BOOLForKey:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)a3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend_isEqualToString_(v4, v5, (uint64_t)CFSTR("YES"), v6) & 1) != 0)
    {
      v10 = 1;
    }
    else
    {
      v14 = objc_msgSend_length(v4, v7, v8, v9);
      v10 = 1;
      if (objc_msgSend_compare_options_range_(v4, v15, (uint64_t)CFSTR("YES"), 1, 0, v14))
      {
        v17 = objc_msgSend_compare_options_range_(v4, v16, (uint64_t)CFSTR("Y"), 1, 0, v14);
        v10 = v17 == 0;
        if (v17)
          v10 = objc_msgSend_integerValue(v4, v18, v19, v20) != 0;
      }
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = objc_msgSend_BOOLValue(v4, v11, v12, v13);
    else
      v10 = 0;
  }

  return v10;
}

- (NSString)suiteName
{
  return self->_suiteName;
}

- (void)setSuiteName:(id)a3
{
  objc_storeStrong((id *)&self->_suiteName, a3);
}

- (NSDictionary)defaultValues
{
  return self->_defaultValues;
}

- (void)setDefaultValues:(id)a3
{
  objc_storeStrong((id *)&self->_defaultValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultValues, 0);
  objc_storeStrong((id *)&self->_suiteName, 0);
}

@end
