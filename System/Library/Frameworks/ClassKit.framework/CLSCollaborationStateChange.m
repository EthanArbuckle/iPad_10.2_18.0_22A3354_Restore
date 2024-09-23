@implementation CLSCollaborationStateChange

- (id)_init
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLSCollaborationStateChange;
  v2 = -[CLSObject _init](&v8, sel__init);
  if (v2)
  {
    v3 = objc_opt_new();
    v4 = (void *)v2[19];
    v2[19] = v3;

    v5 = objc_opt_new();
    v6 = (void *)v2[20];
    v2[20] = v5;

  }
  return v2;
}

- (CLSCollaborationStateChange)initWithObject:(id)a3 ownerPersonID:(id)a4 targetClassID:(id)a5 recipientPersonID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  CLSCollaborationStateChange *v16;
  uint64_t v17;
  NSString *targetObjectID;
  objc_class *v19;
  uint64_t v20;
  NSString *targetEntityName;
  uint64_t v22;
  NSMutableSet *changedDomains;
  uint64_t v24;
  NSMutableArray *states;
  objc_super v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)CLSCollaborationStateChange;
  v16 = -[CLSObject _init](&v27, sel__init);
  if (v16)
  {
    objc_msgSend_objectID(v10, v14, v15);
    v17 = objc_claimAutoreleasedReturnValue();
    targetObjectID = v16->_targetObjectID;
    v16->_targetObjectID = (NSString *)v17;

    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = objc_claimAutoreleasedReturnValue();
    targetEntityName = v16->_targetEntityName;
    v16->_targetEntityName = (NSString *)v20;

    objc_storeStrong((id *)&v16->_ownerPersonID, a4);
    objc_storeStrong((id *)&v16->_targetClassID, a5);
    objc_storeStrong((id *)&v16->_recipientPersonID, a6);
    v22 = objc_opt_new();
    changedDomains = v16->_changedDomains;
    v16->_changedDomains = (NSMutableSet *)v22;

    v24 = objc_opt_new();
    states = v16->_states;
    v16->_states = (NSMutableArray *)v24;

  }
  return v16;
}

- (BOOL)validateObject:(id *)a3
{
  NSMutableArray *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)CLSCollaborationStateChange;
  if (!-[CLSObject validateObject:](&v18, sel_validateObject_))
    return 0;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_states;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v14, v19, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v5);
        if (!objc_msgSend_validateObject_(*(void **)(*((_QWORD *)&v14 + 1) + 8 * i), v8, (uint64_t)a3, (_QWORD)v14))
        {
          v12 = 0;
          goto LABEL_13;
        }
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v14, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_13:

  return v12;
}

- (CLSCollaborationStateChange)initWithCoder:(id)a3
{
  id v4;
  CLSCollaborationStateChange *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *targetObjectID;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSString *targetEntityName;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  NSString *ownerPersonID;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  NSString *senderPersonID;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  NSString *targetClassID;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  NSString *recipientPersonID;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  NSMutableSet *changedDomains;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  NSMutableArray *states;
  objc_super v47;
  _QWORD v48[2];
  _QWORD v49[3];

  v49[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)CLSCollaborationStateChange;
  v5 = -[CLSObject initWithCoder:](&v47, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("targetObjectID"));
    v8 = objc_claimAutoreleasedReturnValue();
    targetObjectID = v5->_targetObjectID;
    v5->_targetObjectID = (NSString *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, CFSTR("targetEntityName"));
    v12 = objc_claimAutoreleasedReturnValue();
    targetEntityName = v5->_targetEntityName;
    v5->_targetEntityName = (NSString *)v12;

    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, CFSTR("ownerPersonID"));
    v16 = objc_claimAutoreleasedReturnValue();
    ownerPersonID = v5->_ownerPersonID;
    v5->_ownerPersonID = (NSString *)v16;

    v18 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, CFSTR("senderPersonID"));
    v20 = objc_claimAutoreleasedReturnValue();
    senderPersonID = v5->_senderPersonID;
    v5->_senderPersonID = (NSString *)v20;

    v22 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, CFSTR("targetClassID"));
    v24 = objc_claimAutoreleasedReturnValue();
    targetClassID = v5->_targetClassID;
    v5->_targetClassID = (NSString *)v24;

    v26 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, CFSTR("recipientPersonID"));
    v28 = objc_claimAutoreleasedReturnValue();
    recipientPersonID = v5->_recipientPersonID;
    v5->_recipientPersonID = (NSString *)v28;

    v30 = (void *)MEMORY[0x1E0C99E60];
    v49[0] = objc_opt_class();
    v49[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v31, (uint64_t)v49, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v30, v33, (uint64_t)v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v35, (uint64_t)v34, CFSTR("changedDomains"));
    v36 = objc_claimAutoreleasedReturnValue();
    changedDomains = v5->_changedDomains;
    v5->_changedDomains = (NSMutableSet *)v36;

    v38 = (void *)MEMORY[0x1E0C99E60];
    v48[0] = objc_opt_class();
    v48[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v39, (uint64_t)v48, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v38, v41, (uint64_t)v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v43, (uint64_t)v42, CFSTR("states"));
    v44 = objc_claimAutoreleasedReturnValue();
    states = v5->_states;
    v5->_states = (NSMutableArray *)v44;

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
  const char *v12;
  NSString *recipientPersonID;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CLSCollaborationStateChange;
  -[CLSObject encodeWithCoder:](&v14, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_targetObjectID, CFSTR("targetObjectID"));
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_targetEntityName, CFSTR("targetEntityName"));
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_ownerPersonID, CFSTR("ownerPersonID"));
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_senderPersonID, CFSTR("senderPersonID"));
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)self->_targetClassID, CFSTR("targetClassID"));
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)self->_changedDomains, CFSTR("changedDomains"));
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)self->_states, CFSTR("states"));
  recipientPersonID = self->_recipientPersonID;
  if (recipientPersonID)
    objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)recipientPersonID, CFSTR("recipientPersonID"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)mergeWithObject:(id)a3
{
  id v4;
  const char *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  const char *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  _QWORD v22[9];

  v22[8] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLSCollaborationStateChange;
  -[CLSObject mergeWithObject:](&v20, sel_mergeWithObject_, v4);
  v22[0] = CFSTR("targetObjectID");
  v22[1] = CFSTR("targetEntityName");
  v22[2] = CFSTR("ownerPersonID");
  v22[3] = CFSTR("senderPersonID");
  v22[4] = CFSTR("recipientPersonID");
  v22[5] = CFSTR("targetClassID");
  v22[6] = CFSTR("changedDomains");
  v22[7] = CFSTR("states");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v22, 8);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v16, v21, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend_valueForKey_(v4, v9, v13, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValue_forKey_(self, v15, (uint64_t)v14, v13);

      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v16, v21, 16);
    }
    while (v10);
  }

}

- (void)setSenderPersonID:(id)a3
{
  objc_storeStrong((id *)&self->_senderPersonID, a3);
}

- (BOOL)hasChanges
{
  uint64_t v2;

  return objc_msgSend_count(self->_changedDomains, a2, v2) != 0;
}

- (id)stateForDomain:(int64_t)a3
{
  NSMutableArray *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_states;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v15, v19, 16);
  if (v6)
  {
    v9 = v6;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v4);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend_domain(v12, v7, v8, (_QWORD)v15) == a3)
        {
          v13 = v12;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)addValidStates:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  char v44;
  uint64_t v45;
  const char *v46;
  void *v47;
  uint64_t v48;
  uint64_t v50;
  unsigned int v51;
  void *v52;
  void *v53;
  void *v54;
  id obj;
  char v56;
  void *v57;
  void *v58;
  void *v59;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = a3;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v61, v65, 16);
  if (!v7)
  {
    LOBYTE(v12) = 1;
    goto LABEL_52;
  }
  v10 = v7;
  v11 = *(_QWORD *)v62;
  v12 = 1;
  v50 = *(_QWORD *)v62;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v62 != v11)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v13);
      objc_msgSend_parentObjectID(v14, v8, v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        objc_msgSend_targetObjectID(self, v15, v16);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v58)
        {
          v57 = v4;
          v58 = 0;
          v56 = 0;
          goto LABEL_17;
        }
      }
      objc_msgSend_parentObjectID(v14, v15, v16);
      v3 = objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        v59 = 0;
        goto LABEL_39;
      }
      objc_msgSend_targetObjectID(self, v18, v19);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v22 = v12;
        objc_msgSend_parentObjectID(v14, v20, v21);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_targetObjectID(self, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v25;
        if ((objc_msgSend_isEqualToString_(v4, v26, (uint64_t)v25) & 1) != 0)
        {
          v57 = v4;
          v56 = 1;
          v12 = v22;
LABEL_17:
          objc_msgSend_ownerPersonID(v14, v15, v16);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = (void *)v3;
          if (!v29)
          {
            objc_msgSend_ownerPersonID(self, v27, v28);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v52)
            {
              v52 = 0;
              LODWORD(v3) = 1;
LABEL_33:
              v44 = v56;
LABEL_36:

LABEL_37:
              v4 = v57;
              if ((v44 & 1) != 0)
              {

              }
LABEL_39:
              if (v17)
              {

                if (!(_DWORD)v3)
                  goto LABEL_44;
              }
              else
              {

                if ((v3 & 1) == 0)
                  goto LABEL_44;
              }
              v45 = objc_msgSend_domain(v14, v8, v9);
              objc_msgSend_stateForDomain_(self, v46, v45);
              v47 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v47)
              {
                objc_msgSend_addObject_(self->_states, v8, (uint64_t)v14);
                goto LABEL_45;
              }
LABEL_44:
              v12 = 0;
LABEL_45:
              v3 = (uint64_t)v59;
              goto LABEL_46;
            }
          }
          v54 = v5;
          v30 = v10;
          objc_msgSend_ownerPersonID(v14, v27, v28);
          v31 = objc_claimAutoreleasedReturnValue();
          if (v31)
          {
            v34 = (void *)v31;
            objc_msgSend_ownerPersonID(self, v32, v33);
            v35 = objc_claimAutoreleasedReturnValue();
            if (v35)
            {
              v38 = (void *)v35;
              v51 = v12;
              objc_msgSend_ownerPersonID(v14, v36, v37);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_ownerPersonID(self, v40, v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v3) = objc_msgSend_isEqualToString_(v39, v43, (uint64_t)v42);

              if (v29)
              {
                v11 = v50;
                v10 = v30;
                v12 = v51;
                v44 = v56;
LABEL_30:

                v5 = v54;
                goto LABEL_37;
              }
              v11 = v50;
              v10 = v30;
              v5 = v54;
              v12 = v51;
              goto LABEL_33;
            }

            LODWORD(v3) = 0;
            v44 = v56;
            if (v29)
            {
              v11 = v50;
              goto LABEL_29;
            }
            v11 = v50;
          }
          else
          {
            LODWORD(v3) = 0;
            v44 = v56;
            if (v29)
            {
LABEL_29:
              v10 = v30;
              goto LABEL_30;
            }
          }
          v10 = v30;
          v5 = v54;
          goto LABEL_36;
        }

      }
      if (v17)

      else
      v12 = 0;
LABEL_46:
      ++v13;
    }
    while (v10 != v13);
    v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v61, v65, 16);
    v10 = v48;
  }
  while (v48);
LABEL_52:

  return v12 & 1;
}

- (void)mergeChangesFrom:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  int valid;
  const char *v24;
  NSMutableSet *changedDomains;
  void *v26;
  const char *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v7 = v4;
  if (v4)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend_changedDomains(v4, v5, v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v28, v33, 16);
    if (v10)
    {
      v13 = v10;
      v14 = *(_QWORD *)v29;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v8);
          v16 = objc_msgSend_integerValue(*(void **)(*((_QWORD *)&v28 + 1) + 8 * v15), v11, v12);
          objc_msgSend_stateForDomain_(v7, v17, v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            objc_msgSend_removeStateForDomain_(self, v18, v16);
            v32 = v19;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v20, (uint64_t)&v32, 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            valid = objc_msgSend_addValidStates_(self, v22, (uint64_t)v21);

            if (valid)
            {
              changedDomains = self->_changedDomains;
              objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v24, v16);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(changedDomains, v27, (uint64_t)v26);

            }
          }

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v28, v33, 16);
      }
      while (v13);
    }

  }
}

- (BOOL)addStates:(id)a3
{
  CLSCollaborationStateChange *v3;
  NSMutableArray *states;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;

  v3 = self;
  states = self->_states;
  v5 = a3;
  objc_msgSend_removeAllObjects(states, v6, v7);
  objc_msgSend_removeAllObjects(v3->_changedDomains, v8, v9);
  LOBYTE(v3) = objc_msgSend_addValidStates_(v3, v10, (uint64_t)v5);

  return (char)v3;
}

- (BOOL)addStateForDomain:(int64_t)a3 domainVersion:(int64_t)a4 state:(int64_t)a5 flags:(unint64_t)a6 note:(id)a7 assetURL:(id)a8
{
  return objc_msgSend__addStateForDomain_domainVersion_state_flags_note_assetURL_assets_(self, a2, a3, a4, a5, a6, a7, a8, 0);
}

- (BOOL)addStateForDomain:(int64_t)a3 domainVersion:(int64_t)a4 state:(int64_t)a5 flags:(unint64_t)a6 note:(id)a7 assets:(id)a8
{
  return objc_msgSend__addStateForDomain_domainVersion_state_flags_note_assetURL_assets_(self, a2, a3, a4, a5, a6, a7, 0, a8);
}

- (BOOL)_addStateForDomain:(int64_t)a3 domainVersion:(int64_t)a4 state:(int64_t)a5 flags:(unint64_t)a6 note:(id)a7 assetURL:(id)a8 assets:(id)a9
{
  id v15;
  id v16;
  id v17;
  const char *v18;
  void *v19;
  CLSCollaborationState *v20;
  NSString *targetObjectID;
  Class v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  id v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  const char *v43;
  NSMutableSet *changedDomains;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  void *v50;
  const char *v51;
  void *v53;
  id v54;
  int64_t v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v15 = a7;
  v16 = a8;
  v17 = a9;
  objc_msgSend_stateForDomain_(self, v18, a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v55 = a4;
    v20 = [CLSCollaborationState alloc];
    v53 = v17;
    targetObjectID = self->_targetObjectID;
    v22 = NSClassFromString(self->_targetEntityName);
    v24 = (void *)objc_msgSend_initForObjectWithID_targetClass_ownerPersonID_domain_state_flags_(v20, v23, (uint64_t)targetObjectID, v22, self->_ownerPersonID, a3, a5, a6);
    objc_msgSend_setDomainVersion_(v24, v25, v55);
    v56 = v15;
    objc_msgSend_setNote_(v24, v26, (uint64_t)v15);
    v54 = v16;
    objc_msgSend_setAssetURL_(v24, v27, (uint64_t)v16);
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v28 = v53;
    v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v57, v61, 16);
    if (v30)
    {
      v33 = v30;
      v34 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v58 != v34)
            objc_enumerationMutation(v28);
          v36 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
          objc_msgSend_assetsToAddOrUpdate(v24, v31, v32);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v37, v38, v36);

        }
        v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v57, v61, 16);
      }
      while (v33);
    }

    objc_msgSend_targetClassID(self, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setClassID_(v24, v42, (uint64_t)v41);

    objc_msgSend_addObject_(self->_states, v43, (uint64_t)v24);
    changedDomains = self->_changedDomains;
    v45 = (void *)MEMORY[0x1E0CB37E8];
    v48 = objc_msgSend_domain(v24, v46, v47);
    objc_msgSend_numberWithInteger_(v45, v49, v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(changedDomains, v51, (uint64_t)v50);

    v16 = v54;
    v15 = v56;
    v17 = v53;
  }

  return v19 == 0;
}

- (void)removeStateForDomain:(int64_t)a3
{
  const char *v5;
  NSMutableSet *changedDomains;
  void *v7;
  const char *v8;
  id v9;

  objc_msgSend_stateForDomain_(self, a2, a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend_removeObject_(self->_states, v5, (uint64_t)v9);
  changedDomains = self->_changedDomains;
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObject_(changedDomains, v8, (uint64_t)v7);

}

- (BOOL)setDomainVersion:(int64_t)a3 forDomain:(int64_t)a4
{
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  char isEqualToDate;
  const char *v33;
  NSMutableSet *changedDomains;
  const char *v35;
  void *v36;
  const char *v37;

  objc_msgSend_stateForDomain_(self, a2, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend_lock(self, v7, v8);
    if (objc_msgSend_domainVersion(v9, v10, v11) != a3)
    {
      objc_msgSend_setDomainVersion_(v9, v12, a3);
      objc_msgSend_setModified_(self, v14, 1);
    }
    objc_msgSend_unlock(self, v12, v13);
    objc_msgSend_lock(self, v15, v16);
    objc_msgSend_date(MEMORY[0x1E0C99D68], v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_dateLastModified(v9, v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!(v22 | v19))
      goto LABEL_11;
    v25 = (void *)v22;
    objc_msgSend_dateLastModified(v9, v23, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v26;
    if (v26 && v19)
    {
      objc_msgSend_dateLastModified(v9, v27, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToDate = objc_msgSend_isEqualToDate_(v30, v31, v19);

      if ((isEqualToDate & 1) != 0)
        goto LABEL_11;
    }
    else
    {

    }
    objc_msgSend_setDateLastModified_(v9, v23, v19);
    objc_msgSend_setModified_(self, v33, 1);
LABEL_11:
    objc_msgSend_unlock(self, v23, v24);

    changedDomains = self->_changedDomains;
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v35, a4);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(changedDomains, v37, (uint64_t)v36);

  }
  return v9 != 0;
}

- (BOOL)setState:(int64_t)a3 forDomain:(int64_t)a4
{
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  char isEqualToDate;
  const char *v33;
  NSMutableSet *changedDomains;
  const char *v35;
  void *v36;
  const char *v37;

  objc_msgSend_stateForDomain_(self, a2, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend_lock(self, v7, v8);
    if (objc_msgSend_state(v9, v10, v11) != a3)
    {
      objc_msgSend_setState_(v9, v12, a3);
      objc_msgSend_setModified_(self, v14, 1);
    }
    objc_msgSend_unlock(self, v12, v13);
    objc_msgSend_lock(self, v15, v16);
    objc_msgSend_date(MEMORY[0x1E0C99D68], v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_dateLastModified(v9, v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!(v22 | v19))
      goto LABEL_11;
    v25 = (void *)v22;
    objc_msgSend_dateLastModified(v9, v23, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v26;
    if (v26 && v19)
    {
      objc_msgSend_dateLastModified(v9, v27, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToDate = objc_msgSend_isEqualToDate_(v30, v31, v19);

      if ((isEqualToDate & 1) != 0)
        goto LABEL_11;
    }
    else
    {

    }
    objc_msgSend_setDateLastModified_(v9, v23, v19);
    objc_msgSend_setModified_(self, v33, 1);
LABEL_11:
    objc_msgSend_unlock(self, v23, v24);

    changedDomains = self->_changedDomains;
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v35, a4);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(changedDomains, v37, (uint64_t)v36);

  }
  return v9 != 0;
}

- (BOOL)setFlags:(unint64_t)a3 forDomain:(int64_t)a4
{
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  char isEqualToDate;
  const char *v33;
  NSMutableSet *changedDomains;
  const char *v35;
  void *v36;
  const char *v37;

  objc_msgSend_stateForDomain_(self, a2, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend_lock(self, v7, v8);
    if (objc_msgSend_flags(v9, v10, v11) != a3)
    {
      objc_msgSend_setFlags_(v9, v12, a3);
      objc_msgSend_setModified_(self, v14, 1);
    }
    objc_msgSend_unlock(self, v12, v13);
    objc_msgSend_lock(self, v15, v16);
    objc_msgSend_date(MEMORY[0x1E0C99D68], v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_dateLastModified(v9, v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!(v22 | v19))
      goto LABEL_11;
    v25 = (void *)v22;
    objc_msgSend_dateLastModified(v9, v23, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v26;
    if (v26 && v19)
    {
      objc_msgSend_dateLastModified(v9, v27, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToDate = objc_msgSend_isEqualToDate_(v30, v31, v19);

      if ((isEqualToDate & 1) != 0)
        goto LABEL_11;
    }
    else
    {

    }
    objc_msgSend_setDateLastModified_(v9, v23, v19);
    objc_msgSend_setModified_(self, v33, 1);
LABEL_11:
    objc_msgSend_unlock(self, v23, v24);

    changedDomains = self->_changedDomains;
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v35, a4);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(changedDomains, v37, (uint64_t)v36);

  }
  return v9 != 0;
}

- (BOOL)setClassID:(id)a3 forDomain:(int64_t)a4
{
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  char isEqualToString;
  const char *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  char isEqualToDate;
  const char *v44;
  NSMutableSet *changedDomains;
  const char *v46;
  void *v47;
  const char *v48;

  v6 = a3;
  objc_msgSend_stateForDomain_(self, v7, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend_lock(self, v8, v9);
    v11 = (uint64_t)v6;
    objc_msgSend_classID(v10, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!(v11 | v14))
      goto LABEL_9;
    v17 = (void *)v14;
    objc_msgSend_classID(v10, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v18;
    if (v11 && v18)
    {
      objc_msgSend_classID(v10, v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v22, v23, v11);

      if ((isEqualToString & 1) != 0)
      {
LABEL_9:
        objc_msgSend_unlock(self, v15, v16);

        objc_msgSend_lock(self, v26, v27);
        objc_msgSend_date(MEMORY[0x1E0C99D68], v28, v29);
        v30 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_dateLastModified(v10, v31, v32);
        v33 = objc_claimAutoreleasedReturnValue();
        if (v33 | v30)
        {
          v36 = (void *)v33;
          objc_msgSend_dateLastModified(v10, v34, v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v37;
          if (v37 && v30)
          {
            objc_msgSend_dateLastModified(v10, v38, v39);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToDate = objc_msgSend_isEqualToDate_(v41, v42, v30);

            if ((isEqualToDate & 1) != 0)
              goto LABEL_16;
          }
          else
          {

          }
          objc_msgSend_setDateLastModified_(v10, v34, v30);
          objc_msgSend_setModified_(self, v44, 1);
        }
LABEL_16:
        objc_msgSend_unlock(self, v34, v35);

        changedDomains = self->_changedDomains;
        objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v46, a4);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(changedDomains, v48, (uint64_t)v47);

        goto LABEL_17;
      }
    }
    else
    {

    }
    objc_msgSend_setClassID_(v10, v15, v11);
    objc_msgSend_setModified_(self, v25, 1);
    goto LABEL_9;
  }
LABEL_17:

  return v10 != 0;
}

- (BOOL)setNote:(id)a3 forDomain:(int64_t)a4
{
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  char isEqualToString;
  const char *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  char isEqualToDate;
  const char *v44;
  NSMutableSet *changedDomains;
  const char *v46;
  void *v47;
  const char *v48;

  v6 = a3;
  objc_msgSend_stateForDomain_(self, v7, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend_lock(self, v8, v9);
    v11 = (uint64_t)v6;
    objc_msgSend_note(v10, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!(v11 | v14))
      goto LABEL_9;
    v17 = (void *)v14;
    objc_msgSend_note(v10, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v18;
    if (v11 && v18)
    {
      objc_msgSend_note(v10, v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v22, v23, v11);

      if ((isEqualToString & 1) != 0)
      {
LABEL_9:
        objc_msgSend_unlock(self, v15, v16);

        objc_msgSend_lock(self, v26, v27);
        objc_msgSend_date(MEMORY[0x1E0C99D68], v28, v29);
        v30 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_dateLastModified(v10, v31, v32);
        v33 = objc_claimAutoreleasedReturnValue();
        if (v33 | v30)
        {
          v36 = (void *)v33;
          objc_msgSend_dateLastModified(v10, v34, v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v37;
          if (v37 && v30)
          {
            objc_msgSend_dateLastModified(v10, v38, v39);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToDate = objc_msgSend_isEqualToDate_(v41, v42, v30);

            if ((isEqualToDate & 1) != 0)
              goto LABEL_16;
          }
          else
          {

          }
          objc_msgSend_setDateLastModified_(v10, v34, v30);
          objc_msgSend_setModified_(self, v44, 1);
        }
LABEL_16:
        objc_msgSend_unlock(self, v34, v35);

        changedDomains = self->_changedDomains;
        objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v46, a4);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(changedDomains, v48, (uint64_t)v47);

        goto LABEL_17;
      }
    }
    else
    {

    }
    objc_msgSend_setNote_(v10, v15, v11);
    objc_msgSend_setModified_(self, v25, 1);
    goto LABEL_9;
  }
LABEL_17:

  return v10 != 0;
}

- (BOOL)setAssetURL:(id)a3 forDomain:(int64_t)a4
{
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  const char *v47;
  char isEqualToDate;
  const char *v49;
  NSMutableSet *changedDomains;
  const char *v51;
  void *v52;
  const char *v53;
  uint64_t v55;

  v6 = a3;
  objc_msgSend_stateForDomain_(self, v7, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend_lock(self, v8, v9);
    v11 = (uint64_t)v6;
    objc_msgSend_assetURL(v10, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!(v11 | v14))
      goto LABEL_9;
    v17 = (void *)v14;
    objc_msgSend_assetURL(v10, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v18;
    if (v11 && v18)
    {
      objc_msgSend_assetURL(v10, v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_absoluteString(v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_absoluteString((void *)v11, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend_caseInsensitiveCompare_(v25, v29, (uint64_t)v28);

      if (!v55)
      {
LABEL_9:
        objc_msgSend_unlock(self, v15, v16);

        objc_msgSend_lock(self, v31, v32);
        objc_msgSend_date(MEMORY[0x1E0C99D68], v33, v34);
        v35 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_dateLastModified(v10, v36, v37);
        v38 = objc_claimAutoreleasedReturnValue();
        if (v38 | v35)
        {
          v41 = (void *)v38;
          objc_msgSend_dateLastModified(v10, v39, v40);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v42;
          if (v42 && v35)
          {
            objc_msgSend_dateLastModified(v10, v43, v44);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToDate = objc_msgSend_isEqualToDate_(v46, v47, v35);

            if ((isEqualToDate & 1) != 0)
              goto LABEL_16;
          }
          else
          {

          }
          objc_msgSend_setDateLastModified_(v10, v39, v35);
          objc_msgSend_setModified_(self, v49, 1);
        }
LABEL_16:
        objc_msgSend_unlock(self, v39, v40);

        changedDomains = self->_changedDomains;
        objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v51, a4);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(changedDomains, v53, (uint64_t)v52);

        goto LABEL_17;
      }
    }
    else
    {

    }
    objc_msgSend_setAssetURL_(v10, v15, v11);
    objc_msgSend_setModified_(self, v30, 1);
    goto LABEL_9;
  }
LABEL_17:

  return v10 != 0;
}

- (BOOL)setInfoValue:(id)a3 forKey:(id)a4 forDomain:(int64_t)a5
{
  id v8;
  id v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  BOOL v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  NSMutableSet *changedDomains;
  const char *v32;
  void *v33;
  const char *v34;
  id v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend_stateForDomain_(self, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11;
  if (v11)
  {
    objc_msgSend_info(v11, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend_info(v14, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend_mutableCopy(v18, v19, v20);

      if (v8)
      {
        objc_msgSend_setObject_forKeyedSubscript_(v21, v22, (uint64_t)v8, v9);
      }
      else
      {
        objc_msgSend_null(MEMORY[0x1E0C99E38], v22, v23);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v21, v28, (uint64_t)v27, v9);

      }
      objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99D80], v24, (uint64_t)v21);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setInfo_(v14, v30, (uint64_t)v29);

      goto LABEL_10;
    }
    if (v8)
    {
      v36 = v9;
      v37[0] = v8;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v16, (uint64_t)v37, &v36, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setInfo_(v14, v25, (uint64_t)v21);
LABEL_10:

      changedDomains = self->_changedDomains;
      objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v32, a5);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(changedDomains, v34, (uint64_t)v33);

      v26 = 1;
      goto LABEL_11;
    }
  }
  v26 = 0;
LABEL_11:

  return v26;
}

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CLSCollaborationStateChange;
  -[CLSObject description](&v16, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend_appendFormat_(v6, v7, (uint64_t)CFSTR(" (targetObjectID: %@)"), self->_targetObjectID);
  objc_msgSend_appendFormat_(v6, v8, (uint64_t)CFSTR(" (targetEntityName: %@)"), self->_targetEntityName);
  objc_msgSend_appendFormat_(v6, v9, (uint64_t)CFSTR(" (ownerPersonID: %@)"), self->_ownerPersonID);
  objc_msgSend_appendFormat_(v6, v10, (uint64_t)CFSTR(" (senderPersonID: %@)"), self->_senderPersonID);
  objc_msgSend_appendFormat_(v6, v11, (uint64_t)CFSTR(" (targetClassID: %@)"), self->_targetClassID);
  objc_msgSend_appendFormat_(v6, v12, (uint64_t)CFSTR(" (changedDomains: %@)"), self->_changedDomains);
  objc_msgSend_appendFormat_(v6, v13, (uint64_t)CFSTR(" (states: %@)"), self->_states);
  if (self->_recipientPersonID)
    objc_msgSend_appendFormat_(v6, v14, (uint64_t)CFSTR(" (recipientPersonID: %@)"), self->_recipientPersonID);
  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  NSString *recipientPersonID;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CLSCollaborationStateChange;
  -[CLSObject dictionaryRepresentation](&v14, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)self->_targetObjectID, CFSTR("targetObjectID"));
  objc_msgSend_setObject_forKeyedSubscript_(v3, v5, (uint64_t)self->_targetEntityName, CFSTR("targetEntityName"));
  objc_msgSend_setObject_forKeyedSubscript_(v3, v6, (uint64_t)self->_ownerPersonID, CFSTR("ownerPersonID"));
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, (uint64_t)self->_senderPersonID, CFSTR("senderPersonID"));
  objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)self->_targetClassID, CFSTR("targetClassID"));
  objc_msgSend_setObject_forKeyedSubscript_(v3, v9, (uint64_t)self->_changedDomains, CFSTR("changedDomains"));
  objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)self->_states, CFSTR("states"));
  recipientPersonID = self->_recipientPersonID;
  if (recipientPersonID)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v11, (uint64_t)recipientPersonID, CFSTR("recipientPersonID"));
  return v3;
}

- (NSString)targetObjectID
{
  return self->_targetObjectID;
}

- (void)setTargetObjectID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)targetEntityName
{
  return self->_targetEntityName;
}

- (void)setTargetEntityName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)ownerPersonID
{
  return self->_ownerPersonID;
}

- (void)setOwnerPersonID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)targetClassID
{
  return self->_targetClassID;
}

- (void)setTargetClassID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)recipientPersonID
{
  return self->_recipientPersonID;
}

- (void)setRecipientPersonID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSSet)changedDomains
{
  return &self->_changedDomains->super;
}

- (void)setChangedDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)senderPersonID
{
  return self->_senderPersonID;
}

- (NSSet)deletedDomains
{
  return self->_deletedDomains;
}

- (void)setDeletedDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSArray)states
{
  return &self->_states->super;
}

- (void)setStates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedDomains, 0);
  objc_storeStrong((id *)&self->_states, 0);
  objc_storeStrong((id *)&self->_changedDomains, 0);
  objc_storeStrong((id *)&self->_recipientPersonID, 0);
  objc_storeStrong((id *)&self->_senderPersonID, 0);
  objc_storeStrong((id *)&self->_targetClassID, 0);
  objc_storeStrong((id *)&self->_targetEntityName, 0);
  objc_storeStrong((id *)&self->_targetObjectID, 0);
  objc_storeStrong((id *)&self->_ownerPersonID, 0);
}

@end
