@implementation IDSFamilyMember

- (IDSFamilyMember)initWithiCloudID:(id)a3 appleID:(id)a4 handles:(id)a5 devices:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  IDSFamilyMember *v15;
  IDSFamilyMember *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IDSFamilyMember;
  v15 = -[IDSFamilyMember init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_DSID, a3);
    objc_storeStrong((id *)&v16->_appleID, a4);
    objc_storeStrong((id *)&v16->_handles, a5);
    objc_storeStrong((id *)&v16->_devices, a6);
  }

  return v16;
}

- (IDSFamilyMember)initWithDictionary:(id)a3
{
  id v4;
  const char *v5;
  IDSFamilyMember *v6;
  double v7;
  uint64_t v8;
  NSNumber *DSID;
  const char *v10;
  double v11;
  uint64_t v12;
  NSSet *handles;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  const char *v20;
  double v21;
  uint64_t v22;
  NSString *appleID;
  const char *v24;
  double v25;
  void *v26;
  NSArray *v27;
  id v28;
  const char *v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  IDSFamilyDevice *v36;
  const char *v37;
  double v38;
  void *v39;
  const char *v40;
  double v41;
  const char *v42;
  double v43;
  NSArray *devices;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)IDSFamilyMember;
  v6 = -[IDSFamilyMember init](&v50, sel_init);
  if (v6)
  {
    objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("MemberDSID"), v7);
    v8 = objc_claimAutoreleasedReturnValue();
    DSID = v6->_DSID;
    v6->_DSID = (NSNumber *)v8;

    objc_msgSend_objectForKey_(v4, v10, (uint64_t)CFSTR("MemberHandles"), v11);
    v12 = objc_claimAutoreleasedReturnValue();
    handles = v6->_handles;
    v6->_handles = (NSSet *)v12;

    objc_msgSend_objectForKey_(v4, v14, (uint64_t)CFSTR("MemberRelationship"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_relationship = objc_msgSend_integerValue(v16, v17, v18, v19);

    objc_msgSend_objectForKey_(v4, v20, (uint64_t)CFSTR("AppleIDKey"), v21);
    v22 = objc_claimAutoreleasedReturnValue();
    appleID = v6->_appleID;
    v6->_appleID = (NSString *)v22;

    objc_msgSend_objectForKey_(v4, v24, (uint64_t)CFSTR("MemberDevices"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v28 = v26;
    v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v46, v30, v51, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v47;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v47 != v33)
            objc_enumerationMutation(v28);
          v35 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v34);
          v36 = [IDSFamilyDevice alloc];
          v39 = (void *)objc_msgSend_initWithDictionary_(v36, v37, v35, v38, (_QWORD)v46);
          objc_msgSend_addObject_(v27, v40, (uint64_t)v39, v41);

          ++v34;
        }
        while (v32 != v34);
        v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v42, (uint64_t)&v46, v43, v51, 16);
      }
      while (v32);
    }

    devices = v6->_devices;
    v6->_devices = v27;

  }
  return v6;
}

- (id)dictionaryRepresentation
{
  id v3;
  const char *v4;
  double v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  id v19;
  NSArray *v20;
  const char *v21;
  double v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  double v32;
  const char *v33;
  double v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_setObject_forKey_(v3, v4, (uint64_t)self->_DSID, v5, CFSTR("MemberDSID"));
  objc_msgSend_allObjects(self->_handles, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v10, (uint64_t)v9, v11, CFSTR("MemberHandles"));

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v12, self->_relationship, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v15, (uint64_t)v14, v16, CFSTR("MemberRelationship"));

  objc_msgSend_setObject_forKey_(v3, v17, (uint64_t)self->_appleID, v18, CFSTR("AppleIDKey"));
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v20 = self->_devices;
  v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v36, v22, v40, 16);
  if (v23)
  {
    v27 = v23;
    v28 = *(_QWORD *)v37;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v37 != v28)
          objc_enumerationMutation(v20);
        objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v36 + 1) + 8 * v29), v24, v25, v26, (_QWORD)v36);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v19, v31, (uint64_t)v30, v32);

        ++v29;
      }
      while (v27 != v29);
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v24, (uint64_t)&v36, v26, v40, 16);
    }
    while (v27);
  }

  objc_msgSend_setObject_forKey_(v3, v33, (uint64_t)v19, v34, CFSTR("MemberDevices"));
  return v3;
}

- (int64_t)relationship
{
  return self->_relationship;
}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSSet)handles
{
  return self->_handles;
}

- (NSArray)devices
{
  return self->_devices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
}

@end
