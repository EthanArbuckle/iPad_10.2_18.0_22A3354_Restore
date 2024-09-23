@implementation IDSConversationGroupCypher

- (NSString)identifier
{
  return (NSString *)CFSTR("engram");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSConversationGroupCypher)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  double v26;
  IDSConversationGroupCypher *v27;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, CFSTR("IDSConversationGroupCypherGroupData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend_setWithObjects_(v9, v12, v10, v13, v11, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v15, (uint64_t)v14, v16, CFSTR("IDSConversationGroupCypherGroupParticipants"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, v20, CFSTR("IDSConversationGroupCypherGroupDeviceIdentity"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_conversationGroupWithPrivateDataRepresentation_(IDSMPConversationGroup, v22, (uint64_t)v8, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (IDSConversationGroupCypher *)objc_msgSend_initWithConversationGroup_deviceIdentity_participants_(self, v25, (uint64_t)v24, v26, v21, v17);

  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  const char *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  const char *v26;
  double v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  void *v32;
  const char *v33;
  double v34;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_conversationGroup(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend_privateDataRepresentationWithError_(v8, v9, (uint64_t)&v35, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v35;

  if (v11)
  {
    objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)v11, v15, CFSTR("IDSConversationGroupCypherGroupData"));
    objc_msgSend_participants(self, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)v19, v21, CFSTR("IDSConversationGroupCypherGroupParticipants"));

    objc_msgSend_deviceIdentity(self, v22, v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v4, v26, v25, v27, CFSTR("IDSConversationGroupCypherGroupDeviceIdentity"));

    v4 = (id)v25;
  }
  else
  {
    objc_msgSend_accountIdentity(IDSFoundationLog, v13, v14, v15);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_conversationGroup(self, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543619;
      v37 = v12;
      v38 = 2113;
      v39 = v32;
      _os_log_impl(&dword_19B949000, v28, OS_LOG_TYPE_DEFAULT, "Failed group.encodeWithCoder -- Could not create privateDataRepresentation {error: %{public}@, group: %{private}@}", buf, 0x16u);

    }
    objc_msgSend_failWithError_(v4, v33, (uint64_t)v12, v34);
  }

}

- (IDSConversationGroupCypher)initWithConversationGroup:(id)a3 deviceIdentity:(id)a4 participants:(id)a5
{
  id v9;
  id v10;
  id v11;
  IDSConversationGroupCypher *v12;
  IDSConversationGroupCypher *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IDSConversationGroupCypher;
  v12 = -[IDSConversationGroupCypher init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_conversationGroup, a3);
    objc_storeStrong((id *)&v13->_deviceIdentity, a4);
    objc_storeStrong((id *)&v13->_participants, a5);
  }

  return v13;
}

- (id)cypherData:(id)a3 withAccountIdentity:(id)a4 identifier:(id *)a5 error:(id *)a6
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  double v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  void *v18;
  char isKindOfClass;
  const char *v20;
  uint64_t v21;
  double v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  double v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  double v34;
  void *v35;
  const char *v36;
  double v37;
  void *v38;
  char *v39;
  uint64_t v40;
  double v41;
  const char *v42;
  double v43;
  uint8_t v45[16];

  v9 = a3;
  v10 = a4;
  objc_msgSend_accountIdentity(IDSFoundationLog, v11, v12, v13);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v45 = 0;
    _os_log_impl(&dword_19B949000, v14, OS_LOG_TYPE_INFO, "ConversationGroupCypher cypher data", v45, 2u);
  }

  objc_msgSend_accountKey(v10, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend_accountKey(v10, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__memberList(self, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_conversationGroup(self, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_signingIdentity(v23, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_signAndProtectData_senderSigningIdentity_members_error_(v31, v36, (uint64_t)v9, v37, v35, v27, a6);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_accountIdentity(IDSFoundationLog, v20, v21, v22);
    v39 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_FAULT))
      sub_19BAF736C(v10, v39, v40, v41);

    if (a6)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v42, (uint64_t)CFSTR("IDSConversationGroupCypherErroDomain"), v43, -2000, 0);
      v38 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = 0;
    }
  }

  return v38;
}

- (id)decypherData:(id)a3 withAccountIdentity:(id)a4 signingDevicePublicKey:(id)a5 identifier:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  double v16;
  id v17;
  const char *v18;
  uint64_t v19;
  double v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  void *v25;
  char isKindOfClass;
  const char *v27;
  uint64_t v28;
  double v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  double v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  double v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  double v41;
  void *v42;
  const char *v43;
  double v44;
  void *v45;
  char *v46;
  uint64_t v47;
  double v48;
  const char *v49;
  double v50;
  id v51;
  char *v52;
  uint64_t v53;
  double v54;
  const char *v55;
  double v56;
  uint8_t v58[16];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = v13;
    objc_msgSend_accountIdentity(IDSFoundationLog, v18, v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v58 = 0;
      _os_log_impl(&dword_19B949000, v21, OS_LOG_TYPE_INFO, "ConversationGroupCypher decypher data", v58, 2u);
    }

    objc_msgSend_accountIdentity(v17, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend__memberList(self, v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_conversationGroup(self, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_accountIdentity(v17, v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_signingIdentity(v38, v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_verifyAndExposeData_senderSigningIdentity_members_error_(v34, v43, (uint64_t)v11, v44, v42, v30, a7);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend_accountIdentity(IDSFoundationLog, v27, v28, v29);
      v52 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_FAULT))
        sub_19BAF736C(v12, v52, v53, v54);

      if (a7)
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v55, (uint64_t)CFSTR("IDSConversationGroupCypherErroDomain"), v56, -2000, 0);
        v45 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v45 = 0;
      }
    }
    v51 = v45;

  }
  else
  {
    objc_msgSend_accountIdentity(IDSFoundationLog, v14, v15, v16);
    v46 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_FAULT))
      sub_19BAF736C(v12, v46, v47, v48);

    if (a7)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v49, (uint64_t)CFSTR("IDSConversationGroupCypherErroDomain"), v50, -2000, 0);
      v51 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v51 = 0;
    }
  }

  return v51;
}

- (id)_memberList
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  double v7;
  const char *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  const char *v13;
  double v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  char isKindOfClass;
  void *v25;
  const char *v26;
  uint64_t v27;
  double v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  double v32;
  void *v33;
  const char *v34;
  double v35;
  double v36;
  id obj;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend_participants(self, v4, v5, 0.0);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v45, v7, v50, 16);
  if (v40)
  {
    v39 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v46 != v39)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        objc_msgSend_devices(v11, v8, v9, 0.0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v41, v14, v49, 16);
        if (v15)
        {
          v19 = v15;
          v20 = *(_QWORD *)v42;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v42 != v20)
                objc_enumerationMutation(v12);
              v22 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
              objc_msgSend_devicePublicKey(v22, v16, v17, v18);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) != 0)
              {
                objc_msgSend_devicePublicKey(v22, v16, v17, v18);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_modernIdentity(v25, v26, v27, v28);
                v29 = (void *)objc_claimAutoreleasedReturnValue();

                if (v29)
                {
                  objc_msgSend_modernIdentity(v25, v30, v31, v32);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_addObject_(v3, v34, (uint64_t)v33, v35);

                }
              }
            }
            v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v16, (uint64_t)&v41, v18, v49, 16);
          }
          while (v19);
        }

      }
      v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v45, v36, v50, 16);
    }
    while (v40);
  }

  return v3;
}

- (IDSMPConversationGroup)conversationGroup
{
  return self->_conversationGroup;
}

- (void)setConversationGroup:(id)a3
{
  objc_storeStrong((id *)&self->_conversationGroup, a3);
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_participants, a3);
}

- (IDSDeviceIdentity)deviceIdentity
{
  return self->_deviceIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentity, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_conversationGroup, 0);
}

@end
