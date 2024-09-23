@implementation CLSClass

- (id)_init
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSClass;
  result = -[CLSObject _init](&v3, sel__init);
  if (result)
  {
    *((_QWORD *)result + 15) = 0;
    *((_QWORD *)result + 18) = 0;
  }
  return result;
}

- (CLSClass)initWithLocation:(id)a3 customName:(id)a4
{
  id v7;
  id v8;
  CLSClass *v9;
  CLSClass *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CLSClass;
  v9 = -[CLSObject _init](&v12, sel__init);
  v10 = v9;
  if (v9)
  {
    v9->_source = 3;
    v9->_originatingSource = 1;
    objc_storeStrong((id *)&v9->_locationID, a3);
    objc_storeStrong((id *)&v10->_customClassName, a4);
    objc_storeStrong((id *)&v10->_className, a4);
  }

  return v10;
}

- (BOOL)validateObject:(id *)a3
{
  _BOOL4 v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CLSClass;
  v5 = -[CLSObject validateObject:](&v21, sel_validateObject_);
  if (v5)
  {
    if ((objc_msgSend_isDeleted(self, v6, v7) & 1) != 0
      || (unint64_t)objc_msgSend_length(self->_customClassName, v8, v9) < 0x81)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = (void *)MEMORY[0x1E0CB34D0];
      v12 = objc_opt_class();
      objc_msgSend_bundleForClass_(v11, v13, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v14, v15, (uint64_t)CFSTR("ERROR_DESCRIPTION_CLASS_NAME_TOO_LONG_FORMAT"), &stru_1E974C8A0, CFSTR("ClassKit"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v10, v17, (uint64_t)v16, 128);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_cls_assignError_code_errorObject_description_(MEMORY[0x1E0CB35C8], v19, (uint64_t)a3, 6, self, v18);
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (void)mergeWithObject:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  const char *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  const char *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)CLSClass;
  -[CLSObject mergeWithObject:](&v41, sel_mergeWithObject_, v4);
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v7 = (void *)objc_msgSend_initWithObjects_(v5, v6, (uint64_t)CFSTR("className"), CFSTR("originatingSource"), CFSTR("locationID"), CFSTR("source"), CFSTR("isEditable"), 0);
  objc_msgSend_dateLastModified(self, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v13 = (void *)v10;
    objc_msgSend_dateLastModified(v4, v11, v12);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v17 = (void *)v14;
      objc_msgSend_dateLastModified(self, v15, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dateLastModified(v4, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend_compare_(v18, v22, (uint64_t)v21);

      if (v23 == -1)
      {
        objc_msgSend_addObject_(v7, v24, (uint64_t)CFSTR("customClassName"));
        objc_msgSend_addObject_(v7, v25, (uint64_t)CFSTR("iconID"));
        objc_msgSend_addObject_(v7, v26, (uint64_t)CFSTR("dateLastModified"));
      }
    }
    else
    {

    }
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v27 = v7;
  v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v37, v42, 16);
  if (v29)
  {
    v31 = v29;
    v32 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v38 != v32)
          objc_enumerationMutation(v27);
        v34 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend_valueForKey_(v4, v30, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValue_forKey_(self, v36, (uint64_t)v35, v34);

      }
      v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v30, (uint64_t)&v37, v42, 16);
    }
    while (v31);
  }

}

- (CLSClass)initWithCoder:(id)a3
{
  id v4;
  CLSClass *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *className;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSString *customClassName;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  NSString *locationID;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  NSString *iconID;
  const char *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CLSClass;
  v5 = -[CLSObject initWithCoder:](&v26, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("className"));
    v8 = objc_claimAutoreleasedReturnValue();
    className = v5->_className;
    v5->_className = (NSString *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, CFSTR("customClassName"));
    v12 = objc_claimAutoreleasedReturnValue();
    customClassName = v5->_customClassName;
    v5->_customClassName = (NSString *)v12;

    v5->_source = objc_msgSend_decodeIntegerForKey_(v4, v14, (uint64_t)CFSTR("source"));
    v5->_originatingSource = objc_msgSend_decodeIntegerForKey_(v4, v15, (uint64_t)CFSTR("originatingSource"));
    v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, CFSTR("locationID"));
    v18 = objc_claimAutoreleasedReturnValue();
    locationID = v5->_locationID;
    v5->_locationID = (NSString *)v18;

    v20 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v20, CFSTR("iconID"));
    v22 = objc_claimAutoreleasedReturnValue();
    iconID = v5->_iconID;
    v5->_iconID = (NSString *)v22;

    v5->_isEditable = objc_msgSend_decodeInt32ForKey_(v4, v24, (uint64_t)CFSTR("isEditable")) != 0;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CLSClass;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v12, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_className, CFSTR("className"), v12.receiver, v12.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_customClassName, CFSTR("customClassName"));
  objc_msgSend_encodeInteger_forKey_(v4, v7, self->_source, CFSTR("source"));
  objc_msgSend_encodeInteger_forKey_(v4, v8, self->_originatingSource, CFSTR("originatingSource"));
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)self->_iconID, CFSTR("iconID"));
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)self->_locationID, CFSTR("locationID"));
  objc_msgSend_encodeInteger_forKey_(v4, v11, self->_isEditable, CFSTR("isEditable"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)classMembers
{
  return (NSArray *)objc_msgSend_childrenPassingTest_(self, a2, (uint64_t)&unk_1E97498F0);
}

- (NSString)displayName
{
  uint64_t v2;
  NSString **p_customClassName;

  p_customClassName = &self->_customClassName;
  if (!objc_msgSend_length(self->_customClassName, a2, v2))
    p_customClassName = &self->_className;
  return *p_customClassName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_customClassName, a3);
}

- (NSString)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  unint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  const char *v34;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)CLSClass;
  -[CLSObject description](&v36, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend_customClassName(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v10, (uint64_t)CFSTR(" (customClassName: %@)"), v9);

  objc_msgSend_className(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v14, (uint64_t)CFSTR(" (className: %@)"), v13);

  objc_msgSend_locationID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v18, (uint64_t)CFSTR(" (locationID: %@)"), v17);

  objc_msgSend_iconID(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v22, (uint64_t)CFSTR(" (iconID: %@)"), v21);

  v25 = objc_msgSend_source(self, v23, v24);
  NSStringFromSource(v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v28, (uint64_t)CFSTR(" (source: %@)"), v27);

  v31 = objc_msgSend_originatingSource(self, v29, v30);
  NSStringFromOriginatingSource(v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v34, (uint64_t)CFSTR(" (originatingSource: %@)"), v33);

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  void *v5;
  NSString *className;
  NSString *customClassName;
  const char *v8;
  const char *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  void *v16;
  const char *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CLSClass;
  -[CLSObject dictionaryRepresentation](&v19, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  className = self->_className;
  if (className)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)className, CFSTR("className"));
  customClassName = self->_customClassName;
  if (customClassName)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v5, v4, (uint64_t)customClassName, CFSTR("customClassName"));
    objc_msgSend_setObject_forKeyedSubscript_(v5, v8, (uint64_t)self->_locationID, CFSTR("locationID"));
    objc_msgSend_setObject_forKeyedSubscript_(v5, v9, (uint64_t)self->_iconID, CFSTR("iconID"));
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v10, self->_isEditable);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v5, v12, (uint64_t)v11, CFSTR("isEditable"));

  }
  NSStringFromSource(self->_source, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v14, (uint64_t)v13, CFSTR("source"));

  NSStringFromOriginatingSource(self->_originatingSource, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v17, (uint64_t)v16, CFSTR("originatingSource"));

  return v5;
}

- (void)addPerson:(id)a3 withRole:(unint64_t)a4
{
  id v6;
  CLSClassMember *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  id v16;

  v6 = a3;
  v7 = [CLSClassMember alloc];
  objc_msgSend_objectID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectID(v6, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (id)objc_msgSend_initWithClassID_personID_roles_(v7, v14, (uint64_t)v10, v13, a4);
  objc_msgSend_addChild_changedPropertyName_(self, v15, (uint64_t)v16, CFSTR("classMembers"));

}

- (void)removePerson:(id)a3 withRole:(unint64_t)a4
{
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend_objectID(a3, a2, (uint64_t)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithFormat_(v6, v8, (uint64_t)CFSTR("personID = %@ AND roles = %d"), v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  objc_msgSend_childrenOfClass_(self, v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filteredArrayUsingPredicate_(v12, v13, (uint64_t)v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v21, v25, 16);
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v14);
        objc_msgSend_setMarkedForDeletion_(*(void **)(*((_QWORD *)&v21 + 1) + 8 * v20++), v17, 1);
      }
      while (v18 != v20);
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v21, v25, 16);
    }
    while (v18);
  }

}

- (NSString)className
{
  return self->_className;
}

- (void)setClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (NSString)iconID
{
  return self->_iconID;
}

- (void)setIconID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)locationID
{
  return self->_locationID;
}

- (void)setLocationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (int64_t)originatingSource
{
  return self->_originatingSource;
}

- (void)setOriginatingSource:(int64_t)a3
{
  self->_originatingSource = a3;
}

- (NSString)customClassName
{
  return self->_customClassName;
}

- (void)setCustomClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (BOOL)isEditable
{
  return self->_isEditable;
}

- (void)setIsEditable:(BOOL)a3
{
  self->_isEditable = a3;
}

- (NSString)tempObjectID
{
  return self->_tempObjectID;
}

- (void)setTempObjectID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_tempObjectID, 0);
  objc_storeStrong((id *)&self->_customClassName, 0);
  objc_storeStrong((id *)&self->_locationID, 0);
  objc_storeStrong((id *)&self->_iconID, 0);
  objc_storeStrong((id *)&self->_className, 0);
}

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D4089BB8;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB6A0 != -1)
    dispatch_once(&qword_1ED0FB6A0, block);
  return (id)qword_1ED0FB698;
}

@end
