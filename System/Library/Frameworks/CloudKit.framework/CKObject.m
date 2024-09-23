@implementation CKObject

- (CKObject)initWithPropertyDictionary:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  CKObject *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_objcClass(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29.receiver = self;
  v29.super_class = (Class)CKObject;
  v9 = -[CKObject init](&v29, sel_init);
  if (v9)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = v4;
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v25, (uint64_t)v30, 16);
    if (v12)
    {
      v15 = v12;
      v16 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v10);
          v18 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend_objectForKeyedSubscript_(v10, v13, v18, v14, (_QWORD)v25);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_propertyForName_(v8, v20, v18, v21);
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = (void *)v22;
          if (v22)
            sub_18A7A2D04(v22, v19, v9);

        }
        v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v25, (uint64_t)v30, 16);
      }
      while (v15);
    }

  }
  return v9;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  objc_msgSend_objcClass(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_properties(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_hash(v8, v9, v10, v11);

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  _QWORD *v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  int isEqual;
  const char *v24;
  BOOL v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend_objcClass(self, v5, v6, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_properties(v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v27, (uint64_t)v31, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v12);
          v18 = *(_QWORD **)(*((_QWORD *)&v27 + 1) + 8 * i);
          sub_18A5DF660(v18, v4);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          sub_18A5DF660(v18, self);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v19, v21, (uint64_t)v20, v22);

          if (!isEqual)
          {
            v25 = 0;
            goto LABEL_13;
          }
        }
        v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v24, (uint64_t)&v27, (uint64_t)v31, 16);
        if (v15)
          continue;
        break;
      }
    }
    v25 = 1;
LABEL_13:

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (CKObjCClass)objcClass
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;

  v2 = objc_opt_class();
  return (CKObjCClass *)objc_msgSend_classForHandle_(CKObjCClass, v3, v2, v4);
}

- (id)dictionaryPropertyEncoding
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];

  objc_msgSend_objcClass(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_properties(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_18A8182FC;
  v14[3] = &unk_1E1F668F0;
  v14[4] = self;
  objc_msgSend_CKCompactMapToDictionary_(v9, v10, (uint64_t)v14, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)description
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *ClassName;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v6 = (void *)objc_msgSend_initWithString_(v3, v4, (uint64_t)CFSTR("<"), v5);
  ClassName = object_getClassName(self);
  objc_msgSend_appendFormat_(v6, v8, (uint64_t)CFSTR("%s: "), v9, ClassName);
  objc_msgSend_objcClass(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_properties(v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_count(v17, v18, v19, v20))
  {
    v23 = 0;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(v17, v21, v23, v22);
      v24 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v24, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18A5DF660(v24, self);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendFormat_(v6, v30, (uint64_t)CFSTR("%@=%@"), v31, v28, v29);

      if (v23 != objc_msgSend_count(v17, v32, v33, v34) - 1)
        objc_msgSend_appendString_(v6, v35, (uint64_t)CFSTR(", "), v36);

      ++v23;
    }
    while (v23 < objc_msgSend_count(v17, v37, v38, v39));
  }
  objc_msgSend_appendString_(v6, v21, (uint64_t)CFSTR(">"), v22);

  return (NSString *)v6;
}

@end
