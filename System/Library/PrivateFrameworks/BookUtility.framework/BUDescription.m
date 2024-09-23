@implementation BUDescription

- (BUDescription)initWithObject:(id)a3 class:(Class)a4 header:(id)a5
{
  id v8;
  id v9;
  BUDescription *v10;
  BUDescription *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *header;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  ++qword_254B69F48;
  v17.receiver = self;
  v17.super_class = (Class)BUDescription;
  v10 = -[BUDescription init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_object, v8);
    v11->_class = a4;
    v14 = objc_msgSend_copy(v9, v12, v13);
    header = v11->_header;
    v11->_header = (NSString *)v14;

  }
  return v11;
}

- (BUDescription)initWithCFType:(void *)a3 header:(id)a4
{
  id v6;
  BUDescription *v7;
  const char *v8;
  uint64_t v9;
  BUDescription *v10;
  uint64_t v11;
  NSString *header;
  objc_super v14;

  v6 = a4;
  ++qword_254B69F48;
  v14.receiver = self;
  v14.super_class = (Class)BUDescription;
  v7 = -[BUDescription init](&v14, sel_init);
  v10 = v7;
  if (v7)
  {
    v7->_cfType = a3;
    v11 = objc_msgSend_copy(v6, v8, v9);
    header = v10->_header;
    v10->_header = (NSString *)v11;

  }
  return v10;
}

- (BUDescription)initWithObject:(id)a3 class:(Class)a4 format:(id)a5 arguments:(char *)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  void *v15;
  const char *v16;
  BUDescription *v17;

  v10 = (objc_class *)MEMORY[0x24BDD17C8];
  v11 = a5;
  v12 = a3;
  v13 = [v10 alloc];
  v15 = (void *)objc_msgSend_initWithFormat_arguments_(v13, v14, (uint64_t)v11, a6);

  v17 = (BUDescription *)objc_msgSend_initWithObject_class_header_(self, v16, (uint64_t)v12, a4, v15);
  return v17;
}

- (BUDescription)initWithObject:(id)a3 class:(Class)a4 format:(id)a5
{
  uint64_t v6;

  return (BUDescription *)objc_msgSend_initWithObject_class_format_arguments_(self, a2, (uint64_t)a3, a4, a5, &v6);
}

- (BUDescription)initWithObject:(id)a3 format:(id)a4
{
  id v6;
  id v7;
  Class Class;
  const char *v9;
  BUDescription *v10;
  uint64_t v12;

  v6 = a4;
  v7 = a3;
  Class = object_getClass(v7);
  v10 = (BUDescription *)objc_msgSend_initWithObject_class_format_arguments_(self, v9, (uint64_t)v7, Class, v6, &v12);

  return v10;
}

- (BUDescription)initWithObject:(id)a3
{
  id v4;
  Class Class;
  const char *v6;
  BUDescription *v7;

  v4 = a3;
  Class = object_getClass(v4);
  v7 = (BUDescription *)objc_msgSend_initWithObject_class_format_(self, v6, (uint64_t)v4, Class, &stru_24CEDBD58);

  return v7;
}

+ (id)descriptionWithObject:(id)a3 class:(Class)a4 format:(id)a5
{
  id v7;
  id v8;
  BUDescription *v9;
  const char *v10;
  void *v11;
  uint64_t v13;

  v7 = a5;
  v8 = a3;
  v9 = [BUDescription alloc];
  v11 = (void *)objc_msgSend_initWithObject_class_format_arguments_(v9, v10, (uint64_t)v8, a4, v7, &v13);

  return v11;
}

+ (id)descriptionWithObject:(id)a3 class:(Class)a4
{
  id v5;
  BUDescription *v6;
  const char *v7;
  void *v8;

  v5 = a3;
  v6 = [BUDescription alloc];
  v8 = (void *)objc_msgSend_initWithObject_class_format_(v6, v7, (uint64_t)v5, a4, &stru_24CEDBD58);

  return v8;
}

+ (id)descriptionWithObject:(id)a3 format:(id)a4
{
  id v5;
  id v6;
  BUDescription *v7;
  Class Class;
  const char *v9;
  void *v10;
  uint64_t v12;

  v5 = a4;
  v6 = a3;
  v7 = [BUDescription alloc];
  Class = object_getClass(v6);
  v10 = (void *)objc_msgSend_initWithObject_class_format_arguments_(v7, v9, (uint64_t)v6, Class, v5, &v12);

  return v10;
}

+ (id)descriptionWithCFType:(void *)a3 format:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  const char *v8;
  void *v9;
  BUDescription *v10;
  const char *v11;
  void *v12;
  uint64_t v14;

  v5 = (objc_class *)MEMORY[0x24BDD17C8];
  v6 = a4;
  v7 = [v5 alloc];
  v9 = (void *)objc_msgSend_initWithFormat_arguments_(v7, v8, (uint64_t)v6, &v14);

  v10 = [BUDescription alloc];
  v12 = (void *)objc_msgSend_initWithCFType_header_(v10, v11, (uint64_t)a3, v9);

  return v12;
}

+ (id)descriptionWithObject:(id)a3
{
  return (id)objc_msgSend_descriptionWithObject_format_(a1, a2, (uint64_t)a3, &stru_24CEDBD58);
}

- (id)p_header
{
  NSObject **p_object;
  id WeakRetained;
  void *v5;
  const char *Name;
  id v7;
  const char *v8;
  __CFString *v9;
  void *cfType;
  CFTypeID v11;
  CFStringRef v12;
  const char *v13;

  p_object = &self->_object;
  WeakRetained = objc_loadWeakRetained((id *)&self->_object);

  if (WeakRetained)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    Name = class_getName(self->_class);
    v7 = objc_loadWeakRetained((id *)p_object);
    objc_msgSend_stringWithFormat_(v5, v8, (uint64_t)CFSTR("(%s*)%p%@"), Name, v7, self->_header);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    cfType = self->_cfType;
    if (cfType)
    {
      v11 = CFGetTypeID(cfType);
      v12 = CFCopyTypeIDDescription(v11);
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v13, (uint64_t)CFSTR("(%@Ref)%p%@"), v12, self->_cfType, self->_header);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFRelease(v12);
    }
    else
    {
      v9 = CFSTR("(void*)nil");
    }
  }
  return v9;
}

- (void)addField:(id)a3 value:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  __CFString *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *fields;
  NSMutableArray *v12;
  NSMutableArray *fieldOrder;
  void *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  id v23;

  v6 = a3;
  v9 = (__CFString *)a4;
  if (!self->_fields)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    fields = self->_fields;
    self->_fields = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    fieldOrder = self->_fieldOrder;
    self->_fieldOrder = v12;

  }
  if (!v9)
    v9 = CFSTR("nil");
  if (v6 && objc_msgSend_length(v6, v7, v8))
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v7, (uint64_t)CFSTR("%@: "), v6);
  }
  else
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    v22 = objc_msgSend_count(self->_fields, v7, v8);
    objc_msgSend_stringWithFormat_(v14, v15, (uint64_t)CFSTR("$$$%lu"), v22);
  }
  v23 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_addObject_(self->_fieldOrder, v16, (uint64_t)v23);
  objc_msgSend_setObject_forKey_(self->_fields, v17, (uint64_t)v9, v23);
  if ((objc_msgSend_hasPrefix_(v23, v18, (uint64_t)CFSTR("$$$")) & 1) == 0)
  {
    v21 = objc_msgSend_length(v23, v19, v20);
    if (v21 > self->_fieldNameWidth)
      self->_fieldNameWidth = v21;
  }

}

- (void)addField:(id)a3 format:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;

  v6 = (objc_class *)MEMORY[0x24BDD17C8];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  v11 = (void *)objc_msgSend_initWithFormat_arguments_(v9, v10, (uint64_t)v7, &v13);

  objc_msgSend_addField_value_(self, v12, (uint64_t)v8, v11);
}

- (void)addFieldWithFormat:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;

  v4 = (objc_class *)MEMORY[0x24BDD17C8];
  v5 = a3;
  v6 = [v4 alloc];
  v8 = (void *)objc_msgSend_initWithFormat_arguments_(v6, v7, (uint64_t)v5, &v10);

  objc_msgSend_addField_value_(self, v9, 0, v8);
}

- (void)addFieldValue:(id)a3
{
  objc_msgSend_addFieldWithFormat_(self, a2, (uint64_t)CFSTR("%@"), a3);
}

- (void)addSuperDescription
{
  void *v3;
  const char *v4;
  objc_super v5;

  v5.receiver = objc_loadWeakRetained((id *)&self->_object);
  v5.super_class = class_getSuperclass(self->_class);

  -[BUDescription description](&v5, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addFieldValue_(self, v4, (uint64_t)v3, v5.receiver, v5.super_class);

}

- (void)setFieldOptionCommaSeparated
{
  self->_commaSeparated = 1;
}

- (NSString)descriptionString
{
  uint64_t v2;
  __objc2_class_ro **p_info;
  id WeakRetained;
  char v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  NSMutableArray *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *v25;
  NSMutableArray *v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  __CFString *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  __CFString *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  p_info = BUDescription.info;
  if (self->_fields)
  {
    if ((unint64_t)qword_254B69F48 < 5)
    {
      v11 = (void *)MEMORY[0x24BDD16A8];
      objc_msgSend_p_header(self, a2, v2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v11, v13, (uint64_t)CFSTR("%@ {"), v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v53 = objc_alloc_init(MEMORY[0x24BDD16A8]);
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v14 = self->_fieldOrder;
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v54, v58, 16);
      if (v16)
      {
        v18 = v16;
        v49 = v10;
        v19 = 0;
        v20 = 0;
        v21 = &stru_24CEDBD58;
        v22 = *(_QWORD *)v55;
        v51 = *(_QWORD *)v55;
        do
        {
          v23 = 0;
          v50 = v20;
          v24 = v20 + 1;
          v25 = v21;
          v52 = v24;
          do
          {
            if (*(_QWORD *)v55 != v22)
              objc_enumerationMutation(v14);
            if ((unint64_t)(v24 + v23) > 0x63)
            {
              ++v19;
            }
            else
            {
              v26 = v14;
              v27 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v23);
              objc_msgSend_objectForKey_(self->_fields, v17, (uint64_t)v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = (void *)objc_msgSend_mutableCopy(v28, v29, v30);

              v32 = v27;
              objc_msgSend_bu_indentBy_(v31, v33, self->_fieldNameWidth);
              if (objc_msgSend_hasPrefix_(v32, v34, (uint64_t)CFSTR("$$$")))
              {

                v32 = &stru_24CEDBD58;
              }
              v37 = objc_msgSend_length(v32, v35, v36);
              objc_msgSend_replaceCharactersInRange_withString_(v31, v38, 0, v37, v32);
              objc_msgSend_appendFormat_(v53, v39, (uint64_t)CFSTR("%@%@"), v25, v31);

              v14 = v26;
              v22 = v51;
              v24 = v52;
            }
            v40 = CFSTR("\n");
            if (self->_commaSeparated)
              v40 = CFSTR(",\n");
            v21 = v40;

            ++v23;
            v25 = v21;
          }
          while (v18 != v23);
          v20 = v50 + v18;
          v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v54, v58, 16);
        }
        while (v18);

        if (v19)
        {
          v42 = "";
          if (v19 != 1)
            v42 = "s";
          objc_msgSend_appendFormat_(v53, v41, (uint64_t)CFSTR("%@...omitting %lu field%s (set to truncate after %lu field%s)"), v21, v19, v42, 99, "s");
        }
        p_info = (__objc2_class_ro **)(BUDescription + 32);
        v10 = v49;
      }
      else
      {

        v21 = &stru_24CEDBD58;
      }
      while ((objc_msgSend_hasSuffix_(v53, v41, (uint64_t)CFSTR("\n")) & 1) != 0
           || objc_msgSend_hasSuffix_(v53, v43, (uint64_t)CFSTR(" ")))
      {
        v45 = objc_msgSend_length(v53, v43, v44);
        objc_msgSend_deleteCharactersInRange_(v53, v46, v45 - 1, 1);
      }
      v7 = v53;
      objc_msgSend_bu_indentBy_(v53, v43, 2);
      objc_msgSend_appendFormat_(v10, v47, (uint64_t)CFSTR("\n%@\n}"), v53);

      goto LABEL_30;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_object);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)&self->_object);
      objc_msgSend_shortDescription(v7, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:

      goto LABEL_31;
    }
  }
  objc_msgSend_p_header(self, a2, v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:
  p_info[489] = (__objc2_class_ro *)((char *)p_info[489] - 1);
  return (NSString *)v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldOrder, 0);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_destroyWeak((id *)&self->_object);
}

@end
