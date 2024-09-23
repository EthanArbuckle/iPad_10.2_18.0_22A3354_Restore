@implementation CLSGroup

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSGroup;
  return -[CLSObject _init](&v3, sel__init);
}

- (NSString)displayName
{
  return (NSString *)((uint64_t (*)(CLSGroup *, char *))MEMORY[0x1E0DE7D20])(self, sel_groupName);
}

- (BOOL)validateObject:(id *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLSGroup;
  return -[CLSObject validateObject:](&v4, sel_validateObject_, a3);
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
  id v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  const char *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)CLSGroup;
  -[CLSObject mergeWithObject:](&v39, sel_mergeWithObject_, v4);
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v7 = (void *)objc_msgSend_initWithObjects_(v5, v6, (uint64_t)CFSTR("groupName"), CFSTR("locationID"), CFSTR("emailAddress"), 0);
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
        objc_msgSend_addObject_(v7, v24, (uint64_t)CFSTR("dateLastModified"));
    }
    else
    {

    }
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v25 = v7;
  v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v35, v40, 16);
  if (v27)
  {
    v29 = v27;
    v30 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v36 != v30)
          objc_enumerationMutation(v25);
        v32 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend_valueForKey_(v4, v28, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValue_forKey_(self, v34, (uint64_t)v33, v32);

      }
      v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)&v35, v40, 16);
    }
    while (v29);
  }

}

- (CLSGroup)initWithCoder:(id)a3
{
  id v4;
  CLSGroup *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *groupName;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSString *locationID;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  NSString *emailAddress;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CLSGroup;
  v5 = -[CLSObject initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("groupName"));
    v8 = objc_claimAutoreleasedReturnValue();
    groupName = v5->_groupName;
    v5->_groupName = (NSString *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, CFSTR("locationID"));
    v12 = objc_claimAutoreleasedReturnValue();
    locationID = v5->_locationID;
    v5->_locationID = (NSString *)v12;

    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, CFSTR("emailAddress"));
    v16 = objc_claimAutoreleasedReturnValue();
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLSGroup;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_groupName, CFSTR("groupName"), v8.receiver, v8.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_locationID, CFSTR("locationID"));
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_emailAddress, CFSTR("emailAddress"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLSGroup;
  -[CLSObject description](&v11, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend_appendFormat_(v6, v7, (uint64_t)CFSTR(" (groupName: %@)"), self->_groupName);
  objc_msgSend_appendFormat_(v6, v8, (uint64_t)CFSTR(" (locationID: %@)"), self->_locationID);
  objc_msgSend_appendFormat_(v6, v9, (uint64_t)CFSTR(" (emailAddress: %@)"), self->_emailAddress);
  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLSGroup;
  -[CLSObject dictionaryRepresentation](&v8, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)self->_groupName, CFSTR("groupName"));
  objc_msgSend_setObject_forKeyedSubscript_(v3, v5, (uint64_t)self->_locationID, CFSTR("locationID"));
  objc_msgSend_setObject_forKeyedSubscript_(v3, v6, (uint64_t)self->_emailAddress, CFSTR("emailAddress"));
  return v3;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)locationID
{
  return self->_locationID;
}

- (void)setLocationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_locationID, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
}

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D408CCFC;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB6F8 != -1)
    dispatch_once(&qword_1ED0FB6F8, block);
  return (id)qword_1ED0FB6F0;
}

@end
