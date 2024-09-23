@implementation CLSAuthTree

- (CLSAuthTree)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  id v11;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v8, (uint64_t)CFSTR("The method -[%@ %@] is not available."), v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v3, v10, v4, v9, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (CLSAuthTree)initWithOverridingStatus:(int64_t)a3
{
  const char *v4;
  CLSAuthTree *v5;
  uint64_t v6;
  NSNumber *overridingStatus;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLSAuthTree;
  v5 = -[CLSAuthTree init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v4, a3);
    v6 = objc_claimAutoreleasedReturnValue();
    overridingStatus = v5->_overridingStatus;
    v5->_overridingStatus = (NSNumber *)v6;

  }
  return v5;
}

- (CLSAuthTree)initWithStatus:(int64_t)a3 statusID:(id)a4 identifier:(id)a5
{
  id v8;
  id v9;
  CLSAuthTree *v10;
  uint64_t v11;
  NSMutableDictionary *graph;
  CLSAuthTreeNode *v13;
  const char *v14;
  void *v15;
  const char *v16;
  objc_super v18;

  v8 = a4;
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CLSAuthTree;
  v10 = -[CLSAuthTree init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_opt_new();
    graph = v10->_graph;
    v10->_graph = (NSMutableDictionary *)v11;

    v13 = [CLSAuthTreeNode alloc];
    v15 = (void *)objc_msgSend_initWithStatusID_identifier_status_(v13, v14, (uint64_t)v8, v9, a3);
    objc_msgSend__addNode_parentStatusID_(v10, v16, (uint64_t)v15, CFSTR("__ROOT__"));

  }
  return v10;
}

- (CLSAuthTree)initWithCoder:(id)a3
{
  id v4;
  CLSAuthTree *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableDictionary *graph;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  NSNumber *overridingStatus;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CLSAuthTree;
  v5 = -[CLSAuthTree init](&v24, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v12 = (void *)objc_msgSend_initWithObjects_(v6, v11, v7, v8, v9, v10, 0);
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, CFSTR("graph"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_mutableCopy(v14, v15, v16);
    graph = v5->_graph;
    v5->_graph = (NSMutableDictionary *)v17;

    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, CFSTR("overridingStatus"));
    v21 = objc_claimAutoreleasedReturnValue();
    overridingStatus = v5->_overridingStatus;
    v5->_overridingStatus = (NSNumber *)v21;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *graph;
  const char *v5;
  const char *v6;
  id v7;

  graph = self->_graph;
  v7 = a3;
  objc_msgSend_encodeObject_forKey_(v7, v5, (uint64_t)graph, CFSTR("graph"));
  objc_msgSend_encodeObject_forKey_(v7, v6, (uint64_t)self->_overridingStatus, CFSTR("overridingStatus"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setAuthStatus:(int64_t)a3 forIdentifier:(id)a4 statusID:(id)a5 parentStatusID:(id)a6
{
  id v10;
  id v11;
  id v12;
  CLSAuthTreeNode *v13;
  const char *v14;
  const char *v15;
  id v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = [CLSAuthTreeNode alloc];
  v16 = (id)objc_msgSend_initWithStatusID_identifier_status_(v13, v14, (uint64_t)v11, v12, a3);

  objc_msgSend__addNode_parentStatusID_(self, v15, (uint64_t)v16, v10);
}

- (int64_t)authStatusAtIdentifierPath:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  NSNumber *overridingStatus;
  int64_t v8;
  const char *v9;
  const char *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  BOOL v31;
  void *v32;
  const char *v33;
  char isEqualToString;
  const char *v35;
  uint64_t v36;
  id v38;
  id obj;
  CLSAuthTree *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __CFString *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  overridingStatus = self->_overridingStatus;
  if (overridingStatus)
  {
    v8 = objc_msgSend_integerValue(overridingStatus, v4, v5);
  }
  else
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v38 = v6;
    obj = v6;
    v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v49, v54, 16);
    if (v41)
    {
      v42 = *(_QWORD *)v50;
      v11 = CFSTR("__ROOT__");
      v40 = self;
      while (2)
      {
        v12 = 0;
        v13 = (uint64_t)v11;
        do
        {
          if (*(_QWORD *)v50 != v42)
            objc_enumerationMutation(obj);
          v43 = v12;
          v44 = (__CFString *)v13;
          v14 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v12);
          objc_msgSend_objectForKeyedSubscript_(self->_graph, v10, v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          v16 = v15;
          v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v45, v53, 16);
          if (!v18)
          {
LABEL_28:

            v8 = 2;
            v11 = v44;
            goto LABEL_30;
          }
          v21 = v18;
          v22 = *(_QWORD *)v46;
LABEL_10:
          v23 = 0;
          while (1)
          {
            if (*(_QWORD *)v46 != v22)
              objc_enumerationMutation(v16);
            v24 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v23);
            objc_msgSend_identifier(v24, v19, v20);
            v25 = objc_claimAutoreleasedReturnValue();
            if (!(v25 | v14))
              break;
            v26 = (void *)v25;
            objc_msgSend_identifier(v24, v19, v20);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v27;
            if (v27)
              v31 = v14 == 0;
            else
              v31 = 1;
            if (v31)
            {

            }
            else
            {
              objc_msgSend_identifier(v24, v28, v29);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              isEqualToString = objc_msgSend_isEqualToString_(v32, v33, v14);

              if ((isEqualToString & 1) != 0)
                break;
            }
            if (v21 == ++v23)
            {
              v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v45, v53, 16);
              if (v21)
                goto LABEL_10;
              goto LABEL_28;
            }
          }
          v8 = objc_msgSend_status(v24, v19, v20);
          objc_msgSend_statusID(v24, v35, v36);
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if ((unint64_t)(v8 - 3) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_30;
          v12 = v43 + 1;
          v13 = (uint64_t)v11;
          self = v40;
        }
        while (v43 + 1 != v41);
        v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v49, v54, 16);
        if (v41)
          continue;
        break;
      }
    }
    else
    {
      v11 = CFSTR("__ROOT__");
      v8 = 2;
    }
LABEL_30:

    v6 = v38;
  }

  return v8;
}

- (int64_t)authStatusFor:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  NSNumber *overridingStatus;
  int64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  int isEqualToString;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = (uint64_t)a3;
  overridingStatus = self->_overridingStatus;
  if (overridingStatus)
  {
    v8 = objc_msgSend_integerValue(overridingStatus, v4, v5);
  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_(self->_graph, v4, (uint64_t)CFSTR("__ROOT__"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v28, v32, 16);
    if (v11)
    {
      v14 = v11;
      v15 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(v9);
          v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend_identifier(v17, v12, v13, (_QWORD)v28);
          v18 = objc_claimAutoreleasedReturnValue();
          if (!(v6 | v18))
          {
LABEL_17:
            v8 = objc_msgSend_status(v17, v12, v13);
            goto LABEL_18;
          }
          v19 = (void *)v18;
          objc_msgSend_identifier(v17, v12, v13);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v20;
          if (v6 && v20)
          {
            objc_msgSend_identifier(v17, v21, v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToString = objc_msgSend_isEqualToString_(v24, v25, v6);

            if (isEqualToString)
              goto LABEL_17;
          }
          else
          {

          }
        }
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v28, v32, 16);
        if (v14)
          continue;
        break;
      }
    }
    v8 = 2;
LABEL_18:

  }
  return v8;
}

- (void)_addNode:(id)a3 parentStatusID:(id)a4
{
  const char *v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend_objectForKeyedSubscript_(self->_graph, v6, (uint64_t)v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend_setObject_forKeyedSubscript_(self->_graph, v10, (uint64_t)v9, v7);
    }
    objc_msgSend_addObject_(v9, v8, (uint64_t)v11);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridingStatus, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

@end
