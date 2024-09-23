@implementation IDSOpportunisticData

- (IDSOpportunisticData)initWithData:(id)a3 identifier:(id)a4 serviceName:(id)a5 accountUniqueID:(id)a6 options:(id)a7
{
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  double v20;
  IDSOpportunisticData *v21;

  v12 = (objc_class *)MEMORY[0x1E0C99E08];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = objc_alloc_init(v12);
  v21 = (IDSOpportunisticData *)objc_msgSend_initWithData_identifier_serviceName_accountUniqueID_options_sendCount_(self, v19, (uint64_t)v17, v20, v16, v15, v14, v13, v18);

  return v21;
}

- (IDSOpportunisticData)initWithData:(id)a3 identifier:(id)a4 serviceName:(id)a5 accountUniqueID:(id)a6 options:(id)a7 sendCount:(id)a8
{
  id v15;
  id v16;
  id v17;
  IDSOpportunisticData *v18;
  IDSOpportunisticData *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)IDSOpportunisticData;
  v18 = -[IDSOpportunisticData init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_data, a3);
    objc_storeStrong((id *)&v19->_identifier, a4);
    objc_storeStrong((id *)&v19->_serviceName, a5);
    objc_storeStrong((id *)&v19->_accountUniqueID, a6);
    objc_storeStrong((id *)&v19->_options, a7);
    objc_storeStrong((id *)&v19->_sendCount, a8);
  }

  return v19;
}

- (BOOL)isInvalid
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  const char *v11;
  double v12;
  BOOL v13;

  if (!self->_data)
    return 1;
  objc_msgSend_expiryDate(self->_options, a2, v2, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend_expiryDate(self->_options, v5, v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_opt_new();
    v13 = objc_msgSend_compare_(v9, v11, (uint64_t)v10, v12) == -1;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)markInvalid
{
  NSData *data;

  data = self->_data;
  self->_data = 0;

}

- (BOOL)shouldSendToDestination:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  const char *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  const char *v12;
  double v13;
  uint64_t v14;
  const char *v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  const char *v25;
  uint64_t v26;
  double v27;
  void *v28;
  const char *v29;
  double v30;
  char v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend_isInvalid(self, v5, v6, v7) & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend_normalizedURIs(v4, v8, v9, 0.0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v33, v13, v37, 16);
    if (v14)
    {
      v17 = v14;
      v18 = *(_QWORD *)v34;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v34 != v18)
            objc_enumerationMutation(v11);
          v20 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend_objectForKeyedSubscript_(self->_sendCount, v15, v20, v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_integerValue(v21, v22, v23, v24) >= 3)
          {

LABEL_15:
            v10 = 0;
            goto LABEL_16;
          }
          objc_msgSend_blocklistedDestinations(self->_options, v25, v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend_containsObject_(v28, v29, v20, v30);

          if ((v31 & 1) != 0)
            goto LABEL_15;
        }
        v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v15, (uint64_t)&v33, v16, v37, 16);
        v10 = 1;
        if (v17)
          continue;
        break;
      }
    }
    else
    {
      v10 = 1;
    }
LABEL_16:

  }
  return v10;
}

- (void)incrementSendCountForDestination:(id)a3
{
  void *v4;
  const char *v5;
  double v6;
  uint64_t v7;
  const char *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend_normalizedURIs(a3, a2, (uint64_t)a3, 0.0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v28, v6, v32, 16);
  if (v7)
  {
    v10 = v7;
    v11 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v4);
        v13 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(self->_sendCount, v8, v13, v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v17 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend_objectForKeyedSubscript_(self->_sendCount, v15, v13, v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend_integerValue(v18, v19, v20, v21);
          objc_msgSend_numberWithInteger_(v17, v23, v22 + 1, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(self->_sendCount, v26, (uint64_t)v25, v27, v13);

        }
        else
        {
          objc_msgSend_setObject_forKeyedSubscript_(self->_sendCount, v15, (uint64_t)&unk_1E3C86AA8, v16, v13);
        }
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v8, (uint64_t)&v28, v9, v32, 16);
    }
    while (v10);
  }

}

- (int64_t)sendCountForURI:(id)a3
{
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  int64_t v8;

  objc_msgSend_objectForKeyedSubscript_(self->_sendCount, a2, (uint64_t)a3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_integerValue(v4, v5, v6, v7);

  return v8;
}

- (id)copy
{
  id v3;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  void *v30;

  v3 = objc_alloc((Class)objc_opt_class());
  objc_msgSend_data(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serviceName(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountUniqueID(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sendCount(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend_initWithData_identifier_serviceName_accountUniqueID_options_sendCount_(v3, v28, (uint64_t)v7, v29, v11, v15, v19, v23, v27);

  return v30;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  void *v28;
  const char *v29;
  double v30;
  void *v31;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_identifier(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_data(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_length(v12, v13, v14, v15);
  objc_msgSend_serviceName(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountUniqueID(self, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(self, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v29, (uint64_t)CFSTR("<%@:%p %@, %llu bytes, service: %@, account: %@, options: %@>"), v30, v4, self, v8, v16, v20, v24, v28);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSOpportunisticData)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  double v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  double v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  double v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  double v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  double v30;
  void *v31;
  const char *v32;
  double v33;
  void *v34;
  const char *v35;
  double v36;
  IDSOpportunisticData *v37;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, CFSTR("data"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, v11, CFSTR("identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, v15, CFSTR("accountUniqueID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, v19, CFSTR("service"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, v23, CFSTR("options"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x1E0C99E60];
  v26 = objc_opt_class();
  v27 = objc_opt_class();
  v28 = objc_opt_class();
  objc_msgSend_setWithObjects_(v25, v29, v26, v30, v27, v28, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v32, (uint64_t)v31, v33, CFSTR("sendCount"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = (IDSOpportunisticData *)objc_msgSend_initWithData_identifier_serviceName_accountUniqueID_options_sendCount_(self, v35, (uint64_t)v8, v36, v12, v20, v16, v24, v34);
  return v37;
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
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  const char *v29;
  uint64_t v30;
  double v31;
  void *v32;
  const char *v33;
  double v34;
  const char *v35;
  uint64_t v36;
  double v37;
  const char *v38;
  double v39;
  id v40;

  v4 = a3;
  objc_msgSend_data(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, v10, CFSTR("data"));

  objc_msgSend_identifier(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, v16, CFSTR("identifier"));

  objc_msgSend_serviceName(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v21, (uint64_t)v20, v22, CFSTR("service"));

  objc_msgSend_accountUniqueID(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v27, (uint64_t)v26, v28, CFSTR("accountUniqueID"));

  objc_msgSend_options(self, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v33, (uint64_t)v32, v34, CFSTR("options"));

  objc_msgSend_sendCount(self, v35, v36, v37);
  v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)v40, v39, CFSTR("sendCount"));

}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (NSString)accountUniqueID
{
  return self->_accountUniqueID;
}

- (void)setAccountUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_accountUniqueID, a3);
}

- (IDSOpportunisticOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (NSMutableDictionary)sendCount
{
  return self->_sendCount;
}

- (void)setSendCount:(id)a3
{
  objc_storeStrong((id *)&self->_sendCount, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendCount, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_accountUniqueID, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
