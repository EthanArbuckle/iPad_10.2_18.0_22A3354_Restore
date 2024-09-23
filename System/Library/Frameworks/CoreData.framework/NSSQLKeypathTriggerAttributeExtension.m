@implementation NSSQLKeypathTriggerAttributeExtension

- (NSSQLKeypathTriggerAttributeExtension)initWithObjectFromUserInfo:(id)a3 onAttributeNamed:(id)a4 onEntity:(id)a5
{
  NSSQLKeypathTriggerAttributeExtension *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NSSQLKeypathTriggerAttributeExtension;
  v8 = -[NSSQLKeypathTriggerAttributeExtension init](&v11, sel_init);
  if (v8)
  {
    v8->_objectFromUserInfo = a3;
    if (a5)
      v9 = (void *)objc_msgSend(*((id *)a5 + 5), "objectForKey:", a4);
    else
      v9 = 0;
    v8->_attribute = (NSSQLAttribute *)v9;
    v8->_entity = (NSSQLEntity *)a5;
    v8->_insertSQLStrings = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    v8->_dropSQLStrings = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    v8->_bulkUpdateSQLStrings = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->_countedRelationship = 0;
  self->_insertSQLStrings = 0;

  self->_dropSQLStrings = 0;
  self->_bulkUpdateSQLStrings = 0;

  self->_entity = 0;
  self->_attribute = 0;

  self->_keypath = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLKeypathTriggerAttributeExtension;
  -[NSSQLKeypathTriggerAttributeExtension dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSSQLKeypathTriggerAttributeExtension;
  return -[NSString stringByAppendingFormat:](-[NSSQLKeypathTriggerAttributeExtension description](&v3, sel_description), "stringByAppendingFormat:", CFSTR(" %@.%@ = %@"), -[NSSQLEntity name](self->_entity, "name"), -[NSSQLProperty name](self->_attribute, "name"), self->_objectFromUserInfo);
}

- (BOOL)validate:(id *)a3
{
  id objectFromUserInfo;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  objc_class *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  BOOL v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  objc_class *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  NSSQLAttribute *attribute;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75[3];
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint8_t buf[4];
  const char *v81;
  __int16 v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _QWORD v89[4];

  v89[1] = *MEMORY[0x1E0C80C00];
  v67 = 0;
  objectFromUserInfo = self->_objectFromUserInfo;
  if (objectFromUserInfo)
  {
    if (objc_msgSend(objectFromUserInfo, "isNSString"))
    {
      if (objc_msgSend(self->_objectFromUserInfo, "length"))
      {
        v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v7 = (void *)objc_msgSend(MEMORY[0x1E0CB35D0], "expressionWithFormat:", self->_objectFromUserInfo);
        v8 = v7;
        if (v7)
        {
          if (objc_msgSend(v7, "expressionType") == 3)
          {
            v9 = (void *)objc_msgSend(v8, "minimalFormInContext:", v6);
            if (objc_msgSend(v9, "expressionType") == 4)
            {
              v10 = (const char *)objc_msgSend(v9, "selector");
              if (v10 == NSSelectorFromString((NSString *)CFSTR("count:")))
              {
                if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "arguments"), "lastObject"), "expressionType") == 3)
                {
                  self->_keypath = (NSString *)(id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "arguments"), "lastObject"), "keyPath");
                  attribute = self->_attribute;
                  if (attribute)
                  {
                    if (attribute->super.super._propertyType == 1)
                    {
                      v57 = objc_msgSend(-[NSSQLAttribute attributeDescription](attribute, "attributeDescription"), "attributeType");
                      if (v57 == 100 || v57 == 200 || v57 == 300)
                      {
                        v35 = -[NSSQLKeypathTriggerAttributeExtension validateKeypath:]((uint64_t)self, (uint64_t *)&v67);
LABEL_23:
                        if (objc_msgSend(v6, "objectForKey:", CFSTR("NSUnderlyingException")))
                        {
                          v45 = (void *)MEMORY[0x1E0CB35C8];
                          v74 = *MEMORY[0x1E0CB2D68];
                          v75[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The trigger on %@.%@ is not valid: Only expressions of the form 'relationship.@count' are supported."), -[NSSQLEntity name](self->_entity, "name"), -[NSSQLProperty name](self->_attribute, "name"));
                          v46 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, &v74, 1);
                          v67 = (void *)objc_msgSend(v45, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v46);
                        }

                        if ((v35 & 1) != 0)
                          return 1;
                        v15 = v67;
                        if (!v67)
                          goto LABEL_28;
                        goto LABEL_13;
                      }
                      v58 = (void *)MEMORY[0x1E0CB35C8];
                      v88 = *MEMORY[0x1E0CB2D68];
                      v89[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The trigger on %@.%@ is not valid: property '%@' is not an integer."), -[NSSQLEntity name](self->_entity, "name"), -[NSSQLProperty name](self->_attribute, "name"), -[NSSQLProperty name](self->_attribute, "name"));
                      v59 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, &v88, 1);
                    }
                    else
                    {
                      v58 = (void *)MEMORY[0x1E0CB35C8];
                      v86 = *MEMORY[0x1E0CB2D68];
                      v87 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The trigger on %@.%@ is not valid: Must be set on an attribute of type %@."), -[NSSQLEntity name](self->_entity, "name"), -[NSSQLProperty name](self->_attribute, "name"), +[NSAttributeDescription stringForAttributeType:](NSAttributeDescription, "stringForAttributeType:", 300));
                      v59 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
                    }
                  }
                  else
                  {
                    v58 = (void *)MEMORY[0x1E0CB35C8];
                    v84 = *MEMORY[0x1E0CB2D68];
                    v85 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The trigger on %@.%@ is not valid: property '%@' not found."), -[NSSQLEntity name](self->_entity, "name"), -[NSSQLProperty name](self->_attribute, "name"), self->_objectFromUserInfo);
                    v59 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
                  }
                  v36 = objc_msgSend(v58, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v59);
                  if (v36)
                    goto LABEL_20;
                  v60 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
                  _NSCoreDataLog(17, v60, v61, v62, v63, v64, v65, v66, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLKeypathTriggerAttributeExtension.m");
                  v44 = __pflogFaultLog;
                  if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                    goto LABEL_22;
                  *(_DWORD *)buf = 136315394;
                  v81 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLKeypathTriggerAttributeExtension.m";
                  v82 = 1024;
                  v83 = 187;
                  goto LABEL_46;
                }
                v11 = (void *)MEMORY[0x1E0CB35C8];
                v88 = *MEMORY[0x1E0CB2D68];
                v89[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The trigger on %@.%@ is not valid: '%@' does not evaluate to a keypath expression."), -[NSSQLEntity name](self->_entity, "name"), -[NSSQLProperty name](self->_attribute, "name"), objc_msgSend((id)objc_msgSend(v9, "arguments"), "lastObject"));
                v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, &v88, 1);
              }
              else
              {
                v11 = (void *)MEMORY[0x1E0CB35C8];
                v86 = *MEMORY[0x1E0CB2D68];
                v87 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The trigger on %@.%@ is not valid: The function '%@' is not supported, only 'count' is supported at this time."), -[NSSQLEntity name](self->_entity, "name"), -[NSSQLProperty name](self->_attribute, "name"), NSStringFromSelector((SEL)objc_msgSend(v9, "selector")));
                v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
              }
            }
            else
            {
              v11 = (void *)MEMORY[0x1E0CB35C8];
              v84 = *MEMORY[0x1E0CB2D68];
              v85 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The trigger on %@.%@ is not valid: '%@' does not evaluate to a function expression."), -[NSSQLEntity name](self->_entity, "name"), -[NSSQLProperty name](self->_attribute, "name"), self->_objectFromUserInfo);
              v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
            }
            v36 = objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v12);
            if (v36)
            {
LABEL_20:
              v67 = (void *)v36;
LABEL_22:
              v35 = 0;
              goto LABEL_23;
            }
            v37 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
            _NSCoreDataLog(17, v37, v38, v39, v40, v41, v42, v43, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLKeypathTriggerAttributeExtension.m");
            v44 = __pflogFaultLog;
            if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              goto LABEL_22;
            *(_DWORD *)buf = 136315394;
            v81 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLKeypathTriggerAttributeExtension.m";
            v82 = 1024;
            v83 = 150;
LABEL_46:
            _os_log_fault_impl(&dword_18A253000, v44, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
            goto LABEL_22;
          }
          v33 = (void *)MEMORY[0x1E0CB35C8];
          v78 = *MEMORY[0x1E0CB2D68];
          v79 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The trigger on %@.%@ is not valid: Only expressions of the form 'relationship.@count' are supported."), -[NSSQLEntity name](self->_entity, "name"), -[NSSQLProperty name](self->_attribute, "name"));
          v34 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
          v32 = objc_msgSend(v33, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v34);
        }
        else
        {
          v25 = (void *)MEMORY[0x1E0CB35C8];
          v76 = *MEMORY[0x1E0CB2D68];
          v26 = (void *)MEMORY[0x1E0CB3940];
          v27 = -[NSSQLEntity name](self->_entity, "name");
          v28 = -[NSSQLProperty name](self->_attribute, "name");
          v29 = self->_objectFromUserInfo;
          v30 = (objc_class *)objc_opt_class();
          v77 = objc_msgSend(v26, "stringWithFormat:", CFSTR("The trigger on %@.%@ is not valid: could not turn '%@' in to an instance of %@"), v27, v28, v29, NSStringFromClass(v30));
          v31 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
          v32 = objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v31);
        }
        v35 = 0;
        v67 = (void *)v32;
        goto LABEL_23;
      }
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v72 = *MEMORY[0x1E0CB2D68];
      v73 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The trigger on %@.%@ is not valid: empty string is not a valid expression."), -[NSSQLEntity name](self->_entity, "name"), -[NSSQLProperty name](self->_attribute, "name"));
      v23 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
      v15 = (void *)objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v23);
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v70 = *MEMORY[0x1E0CB2D68];
      v17 = (void *)MEMORY[0x1E0CB3940];
      v18 = -[NSSQLEntity name](self->_entity, "name");
      v19 = -[NSSQLProperty name](self->_attribute, "name");
      v20 = (objc_class *)objc_opt_class();
      v71 = objc_msgSend(v17, "stringWithFormat:", CFSTR("The trigger on %@.%@ is not valid: must be an instance of %@."), v18, v19, NSStringFromClass(v20));
      v21 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
      v15 = (void *)objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v21);
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v68 = *MEMORY[0x1E0CB2D68];
    v69 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The trigger on %@.%@ is not valid: nil is not a valid expression."), -[NSSQLEntity name](self->_entity, "name"), -[NSSQLProperty name](self->_attribute, "name"));
    v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
    v15 = (void *)objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v14);
  }
  v67 = v15;
  if (!v15)
  {
LABEL_28:
    v47 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v47, v48, v49, v50, v51, v52, v53, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLKeypathTriggerAttributeExtension.m");
    v54 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v81 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLKeypathTriggerAttributeExtension.m";
      v82 = 1024;
      v83 = 118;
      _os_log_fault_impl(&dword_18A253000, v54, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    return 0;
  }
LABEL_13:
  if (!a3)
    return 0;
  v24 = 0;
  *a3 = v15;
  return v24;
}

- (uint64_t)validateKeypath:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unsigned __int8 *v78;
  void *v79;
  void *v80;
  const __CFString *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  uint8_t buf[4];
  const char *v90;
  __int16 v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  _QWORD v98[3];

  v98[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)(result + 48);
    if (v4)
      v5 = (void *)objc_msgSend(*(id *)(v4 + 40), "objectForKey:", *(_QWORD *)(result + 16));
    else
      v5 = 0;
    v6 = v5;
    v7 = v6;
    if (v6)
    {
      if (v6[24] - 7 > 2)
      {
        v35 = (void *)MEMORY[0x1E0CB35C8];
        v36 = *MEMORY[0x1E0CB28A8];
        v95 = *MEMORY[0x1E0CB2D68];
        v96 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The trigger on %@.%@ is not valid: keypath '%@' is not a relationship."), objc_msgSend(*(id *)(v3 + 48), "name"), objc_msgSend(*(id *)(v3 + 56), "name"), *(_QWORD *)(v3 + 16));
        v37 = (void *)MEMORY[0x1E0C99D80];
        v38 = &v96;
        v39 = &v95;
      }
      else
      {
        if ((objc_msgSend(v6, "isToMany") & 1) != 0 || v7[24] == 9)
        {
          *(_QWORD *)(v3 + 64) = v7;
          v8 = *(_QWORD *)(v3 + 56);
          if (v8)
            *(_WORD *)(v8 + 32) |= 8u;
          v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v88 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v11 = objc_msgSend(*(id *)(v3 + 56), "columnName");
          v12 = objc_msgSend(*(id *)(v3 + 48), "tableName");
          v83 = v11;
          v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ZT_%@_%@_%@"), v12, v11, objc_msgSend(*(id *)(v3 + 64), "name"));
          v14 = *(_QWORD *)(v3 + 48);
          if (v14)
            v15 = *(void **)(v14 + 128);
          else
            v15 = 0;
          v16 = objc_msgSend(v15, "columnName");
          v17 = *(_QWORD *)(v3 + 48);
          if (v17)
            v18 = *(void **)(v17 + 136);
          else
            v18 = 0;
          v87 = objc_msgSend(v18, "columnName");
          v19 = *(_QWORD *)(v3 + 64);
          if (v19 && *(_BYTE *)(v19 + 24) == 9)
          {
            v20 = objc_msgSend(*(id *)(v3 + 64), "correlationTableName");
            v85 = v13;
            v76 = objc_msgSend((id)v19, "columnName");
            v81 = -[NSSQLManyToMany inverseColumnName]((const __CFString *)v19);
            v21 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
            v78 = v7;
            v22 = v9;
            v84 = v9;
            v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@_INSERT_INCREMENT"), v13, v20);
            v79 = v10;
            v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@"), v23);
            objc_msgSend(v21, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@ AFTER INSERT ON %@ FOR EACH ROW"), v23, v20);
            objc_msgSend(v21, "appendString:", CFSTR(" BEGIN"));
            v25 = v83;
            objc_msgSend(v21, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = IFNULL(%@,0) + 1"), v12, v83, v83);
            objc_msgSend(v21, "appendFormat:", CFSTR(" WHERE NEW.%@ = %@;"), v76, v16);
            objc_msgSend(v21, "appendFormat:", CFSTR(" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;"),
              v12,
              v87,
              v16,
              v25,
              v25,
              v12,
              v16,
              v76);
            objc_msgSend(v21, "appendFormat:", CFSTR(" END"));
            objc_msgSend(v88, "addObject:", v24);

            v26 = v22;
            v7 = v78;
            objc_msgSend(v26, "addObject:", v21);

            v27 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
            v77 = v20;
            v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@_DELETE_DECREMENT"), v85, v20);
            v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@"), v28);
            objc_msgSend(v27, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@ AFTER DELETE ON %@ FOR EACH ROW"), v28, v20);
            objc_msgSend(v27, "appendFormat:", CFSTR(" BEGIN"));
            objc_msgSend(v27, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = MAX(0,IFNULL(%@,0) - 1)"), v12, v25, v25);
            objc_msgSend(v27, "appendFormat:", CFSTR(" WHERE OLD.%@ = %@;"), v76, v16);
            v30 = v16;
            objc_msgSend(v27, "appendFormat:", CFSTR(" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = OLD.%@;"),
              v12,
              v87,
              v16,
              v25,
              v25,
              v12,
              v16,
              v76);
            objc_msgSend(v27, "appendFormat:", CFSTR(" END"));
            objc_msgSend(v84, "addObject:", v27);
            objc_msgSend(v88, "addObject:", v29);

            v10 = v79;
            v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("COUNT_%@"), v85);
            v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("CREATE TEMP TABLE %@ AS"), v31);
            objc_msgSend(v32, "appendFormat:", CFSTR(" SELECT %@, COUNT(DISTINCT(%@.%@)) AS COUNT"), v76, v77, v81);
            objc_msgSend(v32, "appendFormat:", CFSTR(" FROM %@"), v77);
            objc_msgSend(v32, "appendFormat:", CFSTR(" GROUP BY %@;"), v76);
            objc_msgSend(v79, "addObject:", v32);

            v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR(" CREATE INDEX %@_INDEX ON %@(%@,COUNT);"),
                            v31,
                            v31,
                            v76);
            objc_msgSend(v79, "addObject:", v33);

            v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR(" UPDATE %@ SET %@ = IFNULL((SELECT COUNT FROM %@ WHERE %@ = %@),0);"),
                    v12,
                    v83,
                    v31,
                    v30,
                    v76);
          }
          else
          {
            if (!objc_msgSend(*(id *)(v3 + 64), "isToMany"))
            {
LABEL_24:

              *(_QWORD *)(v3 + 24) = objc_msgSend(v9, "copy");
              *(_QWORD *)(v3 + 32) = objc_msgSend(v88, "copy");

              *(_QWORD *)(v3 + 40) = objc_msgSend(v10, "copy");
              return 1;
            }
            v40 = *(_QWORD *)(v3 + 64);
            v80 = v10;
            v75 = v16;
            v41 = v12;
            if (v40)
              v42 = *(void **)(v40 + 56);
            else
              v42 = 0;
            v43 = objc_msgSend(v42, "columnName");
            v44 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
            v86 = v13;
            v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_INSERT_INCREMENT"), v13);
            v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@"), v45);
            v82 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 64), "destinationEntity"), "tableName");
            objc_msgSend(v44, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@"), v45);
            objc_msgSend(v44, "appendFormat:", CFSTR(" AFTER INSERT ON %@ FOR EACH ROW"), v82);
            objc_msgSend(v44, "appendFormat:", CFSTR(" BEGIN"));
            v47 = v83;
            objc_msgSend(v44, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = IFNULL(%@,0) + 1"), v41, v83, v83);
            v48 = v75;
            objc_msgSend(v44, "appendFormat:", CFSTR(" WHERE NEW.%@ = %@;"), v43, v75);
            objc_msgSend(v44, "appendFormat:", CFSTR(" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;"),
              v41,
              v87,
              v48,
              v47,
              v47,
              v41,
              v48,
              v43);
            objc_msgSend(v44, "appendFormat:", CFSTR(" END"));
            objc_msgSend(v9, "addObject:", v44);
            objc_msgSend(v88, "addObject:", v46);

            v49 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
            v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_DELETE_DECREMENT"), v86);
            v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@"), v50);
            objc_msgSend(v49, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@"), v50);
            objc_msgSend(v49, "appendFormat:", CFSTR(" AFTER DELETE ON %@"), v82);
            objc_msgSend(v49, "appendFormat:", CFSTR(" BEGIN"));
            objc_msgSend(v49, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = MAX(0,IFNULL(%@,0) - 1) WHERE OLD.%@ = %@;"),
              v41,
              v47,
              v47,
              v43,
              v75);
            objc_msgSend(v49, "appendFormat:", CFSTR(" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = OLD.%@;"),
              v41,
              v87,
              v48,
              v47,
              v47,
              v41,
              v48,
              v43);
            objc_msgSend(v49, "appendFormat:", CFSTR(" END"));
            objc_msgSend(v9, "addObject:", v49);
            objc_msgSend(v88, "addObject:", v51);

            v52 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
            v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@_INSERT_INCREMENT"), v86, v41);
            v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@"), v53);
            objc_msgSend(v52, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@"), v53);
            objc_msgSend(v52, "appendFormat:", CFSTR(" AFTER INSERT ON %@ FOR EACH ROW"), v41);
            objc_msgSend(v52, "appendFormat:", CFSTR(" BEGIN"));
            objc_msgSend(v52, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = (SELECT COUNT(%@) FROM %@ WHERE (%@ = NEW.%@)) WHERE %@ = NEW.%@;"),
              v41,
              v83,
              v48,
              v82,
              v43,
              v48,
              v48,
              v48);
            objc_msgSend(v52, "appendFormat:", CFSTR(" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;"),
              v41,
              v87,
              v48,
              v47,
              v47,
              v41,
              v48,
              v48);
            objc_msgSend(v52, "appendFormat:", CFSTR(" END"));
            objc_msgSend(v9, "addObject:", v52);
            objc_msgSend(v88, "addObject:", v54);

            v55 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
            v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@_UPDATE_INCREMENT"), v86, v43);
            v57 = v9;
            v84 = v9;
            v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@"), v56);
            objc_msgSend(v55, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@"), v56);
            objc_msgSend(v55, "appendFormat:", CFSTR(" AFTER UPDATE OF %@ ON %@ WHEN"), v43, v82);
            objc_msgSend(v55, "appendFormat:", CFSTR(" ((NEW.%@ IS NOT NULL AND OLD.%@ IS NULL) OR (NEW.%@ != OLD.%@))"), v43, v43, v43, v43);
            objc_msgSend(v55, "appendFormat:", CFSTR(" BEGIN"));
            objc_msgSend(v55, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = IFNULL(%@,0) + 1 WHERE %@ = NEW.%@;"),
              v41,
              v47,
              v47,
              v75,
              v43);
            objc_msgSend(v55, "appendFormat:", CFSTR(" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;"),
              v41,
              v87,
              v48,
              v47,
              v47,
              v41,
              v48,
              v43);
            objc_msgSend(v55, "appendFormat:", CFSTR(" END"));
            objc_msgSend(v57, "addObject:", v55);
            objc_msgSend(v88, "addObject:", v58);

            v59 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
            v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@_UPDATE_DECREMENT"), v86, v43);
            v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@"), v60);
            objc_msgSend(v59, "appendFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@"), v60);
            objc_msgSend(v59, "appendFormat:", CFSTR(" AFTER UPDATE OF %@ ON %@ WHEN"), v43, v82);
            objc_msgSend(v59, "appendFormat:", CFSTR(" ((OLD.%@ IS NOT NULL AND NEW.%@ IS NULL) OR (NEW.%@ != OLD.%@))"), v43, v43, v43, v43);
            objc_msgSend(v59, "appendFormat:", CFSTR(" BEGIN"));
            objc_msgSend(v59, "appendFormat:", CFSTR(" UPDATE %@ SET %@ = MAX(0,IFNULL(%@,0) - 1) WHERE %@ = OLD.%@;"),
              v41,
              v47,
              v47,
              v75,
              v43);
            objc_msgSend(v59, "appendFormat:", CFSTR(" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = OLD.%@;"),
              v41,
              v87,
              v48,
              v47,
              v47,
              v41,
              v48,
              v43);
            objc_msgSend(v59, "appendFormat:", CFSTR(" END"));
            objc_msgSend(v84, "addObject:", v59);
            objc_msgSend(v88, "addObject:", v61);

            v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("COUNT_%@"), v86);
            v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("CREATE TEMP TABLE %@ AS"), v31);
            objc_msgSend(v62, "appendFormat:", CFSTR(" SELECT %@, COUNT(DISTINCT(%@.%@)) AS COUNT"), v43, v82, v75);
            objc_msgSend(v62, "appendFormat:", CFSTR(" FROM %@"), v82);
            objc_msgSend(v62, "appendFormat:", CFSTR(" GROUP BY %@;"), v43);
            v10 = v80;
            objc_msgSend(v80, "addObject:", v62);

            v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR(" CREATE INDEX %@_INDEX ON %@(%@,COUNT);"),
                            v31,
                            v31,
                            v43);
            objc_msgSend(v80, "addObject:", v63);

            v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR(" UPDATE %@ SET %@ = IFNULL((SELECT COUNT FROM %@ WHERE %@ = %@), 0);"),
                    v41,
                    v83,
                    v31,
                    v75,
                    v43);
          }
          v64 = (void *)v34;
          objc_msgSend(v10, "addObject:", v34);

          v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR(" DROP TABLE %@;"), v31);
          objc_msgSend(v10, "addObject:", v65);

          v9 = v84;
          goto LABEL_24;
        }
        v35 = (void *)MEMORY[0x1E0CB35C8];
        v36 = *MEMORY[0x1E0CB28A8];
        v97 = *MEMORY[0x1E0CB2D68];
        v98[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The trigger on %@.%@ is not valid: relationship '%@' is not a to-many."), objc_msgSend(*(id *)(v3 + 48), "name"), objc_msgSend(*(id *)(v3 + 56), "name"), *(_QWORD *)(v3 + 16));
        v37 = (void *)MEMORY[0x1E0C99D80];
        v38 = v98;
        v39 = &v97;
      }
    }
    else
    {
      v35 = (void *)MEMORY[0x1E0CB35C8];
      v36 = *MEMORY[0x1E0CB28A8];
      v93 = *MEMORY[0x1E0CB2D68];
      v94 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The trigger on %@.%@ is not valid: '%@' is not a property of '%@'."), objc_msgSend(*(id *)(v3 + 48), "name"), objc_msgSend(*(id *)(v3 + 56), "name"), *(_QWORD *)(v3 + 16), objc_msgSend(*(id *)(v3 + 48), "name"));
      v37 = (void *)MEMORY[0x1E0C99D80];
      v38 = &v94;
      v39 = &v93;
    }
    v66 = objc_msgSend(v35, "errorWithDomain:code:userInfo:", v36, 134060, objc_msgSend(v37, "dictionaryWithObjects:forKeys:count:", v38, v39, 1));

    if (v66)
    {
      if (a2)
      {
        result = 0;
        *a2 = v66;
        return result;
      }
    }
    else
    {
      v67 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v67, v68, v69, v70, v71, v72, v73, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLKeypathTriggerAttributeExtension.m");
      v74 = __pflogFaultLog;
      result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!(_DWORD)result)
        return result;
      *(_DWORD *)buf = 136315394;
      v90 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLKeypathTriggerAttributeExtension.m";
      v91 = 1024;
      v92 = 221;
      _os_log_fault_impl(&dword_18A253000, v74, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    return 0;
  }
  return result;
}

- (BOOL)isEqualToExtension:(id)a3
{
  int v5;
  NSString *keypath;
  uint64_t v7;
  id objectFromUserInfo;
  id v9;
  uint64_t v10;
  char v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NSSQLKeypathTriggerAttributeExtension;
  if ((-[NSSQLKeypathTriggerAttributeExtension isEqual:](&v13, sel_isEqual_) & 1) != 0)
  {
LABEL_2:
    LOBYTE(v5) = 1;
    return v5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_20;
  keypath = self->_keypath;
  if (!keypath)
  {
    objectFromUserInfo = self->_objectFromUserInfo;
    if (a3)
      v9 = (id)*((_QWORD *)a3 + 1);
    else
      v9 = 0;
    if (objectFromUserInfo == v9)
      goto LABEL_2;
    v5 = objc_msgSend(objectFromUserInfo, "isNSString");
    if (!v5)
      return v5;
    if (a3)
    {
      v5 = objc_msgSend(*((id *)a3 + 1), "isNSString");
      if (!v5)
        return v5;
      v10 = *((_QWORD *)a3 + 1);
      goto LABEL_15;
    }
    v11 = objc_msgSend(0, "isNSString");
    v10 = 0;
    if ((v11 & 1) != 0)
    {
LABEL_15:
      v5 = objc_msgSend(self->_objectFromUserInfo, "isEqualToString:", v10);
      if (!v5)
        return v5;
      goto LABEL_2;
    }
LABEL_20:
    LOBYTE(v5) = 0;
    return v5;
  }
  if (a3)
    v7 = *((_QWORD *)a3 + 2);
  else
    v7 = 0;
  LOBYTE(v5) = -[NSString isEqualToString:](keypath, "isEqualToString:", v7);
  return v5;
}

- (NSArray)insertSQLStrings
{
  return self->_insertSQLStrings;
}

- (NSArray)dropSQLStrings
{
  return self->_dropSQLStrings;
}

- (NSArray)bulkUpdateSQLStrings
{
  return self->_bulkUpdateSQLStrings;
}

@end
