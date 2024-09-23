@implementation CLSContextNavigationNode

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D4058CB0;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB398 != -1)
    dispatch_once(&qword_1ED0FB398, block);
  return (id)qword_1ED0FB390;
}

+ (id)objectIDForParentContextID:(id)a3 andChildContextID:(id)a4
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%@%@"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sha224(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSContextNavigationNode;
  return -[CLSObject _init](&v3, sel__init);
}

- (CLSContextNavigationNode)initWithParentContextID:(id)a3 childContextID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  CLSContextNavigationNode *v9;
  void *v10;
  const char *v11;
  const char *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CLSContextNavigationNode;
  v9 = -[CLSObject _init](&v14, sel__init);
  if (v9)
  {
    objc_msgSend_objectIDForParentContextID_andChildContextID_(CLSContextNavigationNode, v8, (uint64_t)v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObjectID_(v9, v11, (uint64_t)v10);

    objc_msgSend_setParentObjectID_(v9, v12, (uint64_t)v6);
    objc_storeStrong((id *)&v9->_childObjectID, a4);
  }

  return v9;
}

- (BOOL)validateObject:(id *)a3
{
  const char *v4;
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLSContextNavigationNode;
  v5 = -[CLSObject validateObject:](&v7, sel_validateObject_, a3);
  if (v5)
    objc_msgSend_setAppIdentifier_(self, v4, 0);
  return v5;
}

- (void)mergeWithObject:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  const char *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v38.receiver = self;
    v38.super_class = (Class)CLSContextNavigationNode;
    -[CLSObject mergeWithObject:](&v38, sel_mergeWithObject_, v4);
    v5 = (void *)objc_opt_new();
    objc_msgSend_dateLastModified(self, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v11 = (void *)v8;
      objc_msgSend_dateLastModified(v4, v9, v10);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v15 = (void *)v12;
        objc_msgSend_dateLastModified(self, v13, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dateLastModified(v4, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend_compare_(v16, v20, (uint64_t)v19);

        if (v21 == -1)
        {
          objc_msgSend_addObject_(v5, v22, (uint64_t)CFSTR("childObjectID"));
          objc_msgSend_addObject_(v5, v23, (uint64_t)CFSTR("dateLastModified"));
        }
      }
      else
      {

      }
    }
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v24 = v5;
    v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v34, v39, 16);
    if (v26)
    {
      v28 = v26;
      v29 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v35 != v29)
            objc_enumerationMutation(v24);
          v31 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend_valueForKey_(v4, v27, v31, (_QWORD)v34);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setValue_forKey_(self, v33, (uint64_t)v32, v31);

        }
        v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v34, v39, 16);
      }
      while (v28);
    }

  }
}

- (CLSContextNavigationNode)initWithCoder:(id)a3
{
  id v4;
  CLSContextNavigationNode *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *childObjectID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLSContextNavigationNode;
  v5 = -[CLSObject initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("childObjectID"));
    v8 = objc_claimAutoreleasedReturnValue();
    childObjectID = v5->_childObjectID;
    v5->_childObjectID = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLSContextNavigationNode;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_childObjectID, CFSTR("childObjectID"), v6.receiver, v6.super_class);

}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  void *v5;
  NSString *childObjectID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLSContextNavigationNode;
  -[CLSObject dictionaryRepresentation](&v8, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  childObjectID = self->_childObjectID;
  if (childObjectID)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)childObjectID, CFSTR("childObjectID"));
  return v5;
}

- (NSString)childObjectID
{
  return self->_childObjectID;
}

- (void)setChildObjectID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childObjectID, 0);
}

@end
