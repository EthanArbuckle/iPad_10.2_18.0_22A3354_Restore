@implementation CKSQLiteContainerAttributedTableGroup

+ (id)attributionNameForSpecialContainerType:(int64_t)a3
{
  if ((unint64_t)a3 > 0x24)
    return CFSTR("ATTRIBUTION_FUNCTION_NAME(None)");
  else
    return (id)*((_QWORD *)&off_1E1F632E8 + a3);
}

+ (void)attributionFunctionForAttributionName:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v12;

  v3 = objc_retainAutorelease(a3);
  v7 = (const char *)objc_msgSend_UTF8String(v3, v4, v5, v6);
  v8 = dlsym((void *)0xFFFFFFFFFFFFFFFDLL, v7);
  if (!v8)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18A736908;
    block[3] = &unk_1E1F5FAA8;
    v9 = v3;
    v12 = v9;
    if (qword_1EDF75370 != -1)
    {
      dispatch_once(&qword_1EDF75370, block);
      v9 = v12;
    }

    v8 = CKSQLiteContainerAttribution_None;
  }

  return v8;
}

+ (void)attributionFunctionForSpecialContainerType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x23)
    return CKSQLiteContainerAttribution_None;
  else
    return off_1E1F63410[a3 - 1];
}

+ (unint64_t)tableGroupOptionsForContainerType:(int64_t)a3
{
  uint64_t v3;
  void *v8;
  const char *v9;

  if ((unint64_t)a3 >= 0x10000)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, (uint64_t)a1, CFSTR("CKSQLiteContainerAttributedTableGroup.m"), 91, CFSTR("container type value out of range"));

  }
  return a3;
}

- (CKSQLiteContainerAttributedTableGroup)init
{
  CKSQLiteContainerAttributedTableGroup *v2;
  CKSQLiteContainerAttributedTableGroup *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKSQLiteContainerAttributedTableGroup;
  v2 = -[CKSQLiteTableGroup init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_attributionFunc = CKSQLiteContainerAttribution_None;
    v2->_sup.receiver = v2;
    v2->_sup.super_class = (Class)objc_opt_class();
  }
  return v3;
}

- (id)finishInitializing
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  id v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CKSQLiteContainerAttributedTableGroup;
  -[CKSQLiteTableGroup finishInitializing](&v23, sel_finishInitializing);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
    return v6;
  if (!self)
  {
    v6 = 0;
    if ((objc_msgSend_isNew(0, v3, v4, v5) & 1) != 0)
      return v6;
LABEL_12:
    v22 = 0;
    objc_msgSend_stringValueForKey_error_(self, v12, (uint64_t)CFSTR("ContainerAttribution"), (uint64_t)&v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v22;
    if (v19)
    {
      self->_attributionFunc = (void *)objc_msgSend_attributionFunctionForAttributionName_(CKSQLiteContainerAttributedTableGroup, v20, (uint64_t)v19, v21);

    }
    return v6;
  }
  v8 = (unsigned __int16)objc_msgSend_options(self, v3, v4, v5);
  if ((objc_msgSend_isNew(self, v9, v10, v11) & 1) == 0)
  {
    if (v8)
    {
      self->_attributionFunc = (void *)objc_msgSend_attributionFunctionForSpecialContainerType_(CKSQLiteContainerAttributedTableGroup, v12, v8, v13);
      return 0;
    }
    goto LABEL_12;
  }
  if (!v8)
    return 0;
  objc_msgSend_attributionNameForSpecialContainerType_(CKSQLiteContainerAttributedTableGroup, v12, v8, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStringValue_forKey_(self, v15, (uint64_t)v14, (uint64_t)CFSTR("ContainerAttribution"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  self->_attributionFunc = (void *)objc_msgSend_attributionFunctionForSpecialContainerType_(CKSQLiteContainerAttributedTableGroup, v17, v8, v18);

  return v16;
}

- (id)performTransaction:(id)a3
{
  return (id)((uint64_t (*)(objc_super *, SEL, id))self->_attributionFunc)(&self->_sup, a2, a3);
}

- (id)performInTransaction:(id)a3
{
  return (id)((uint64_t (*)(objc_super *, SEL, id))self->_attributionFunc)(&self->_sup, a2, a3);
}

@end
