@implementation CKDShortTokenLookupInfo

- (CKRoughlyEquivalentProperties)equivalencyProperties
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t RootRecord;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;

  v3 = (void *)objc_opt_new();
  objc_msgSend_routingKey(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, (uint64_t)v6, CFSTR("routingKey"));

  objc_msgSend_shortSharingTokenHashData(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v11, (uint64_t)v10, CFSTR("shortSharingTokenHashData"));

  v12 = (void *)MEMORY[0x1E0CB37E8];
  RootRecord = objc_msgSend_shouldFetchRootRecord(self, v13, v14);
  objc_msgSend_numberWithBool_(v12, v16, RootRecord);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v18, (uint64_t)v17, CFSTR("shouldFetchRootRecord"));

  v19 = (void *)MEMORY[0x1E0CB37E8];
  v22 = objc_msgSend_forceDSRefetch(self, v20, v21);
  objc_msgSend_numberWithBool_(v19, v23, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v25, (uint64_t)v24, CFSTR("forceDSRefetch"));

  objc_msgSend_participantID(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v29, (uint64_t)v28, CFSTR("participantID"));

  objc_msgSend_properties(v3, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKRoughlyEquivalentProperties *)v32;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_routingKey(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_copy(v7, v8, v9);
  v11 = (void *)v4[2];
  v4[2] = v10;

  objc_msgSend_shortSharingTokenHashData(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_copy(v14, v15, v16);
  v18 = (void *)v4[3];
  v4[3] = v17;

  *((_BYTE *)v4 + 8) = objc_msgSend_shouldFetchRootRecord(self, v19, v20);
  *((_BYTE *)v4 + 9) = objc_msgSend_forceDSRefetch(self, v21, v22);
  objc_msgSend_participantID(self, v23, v24);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v4[4];
  v4[4] = v25;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CKDShortTokenLookupInfo *v4;
  CKDShortTokenLookupInfo *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  int isEqualToString;
  const char *v21;
  uint64_t v22;
  char v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  int isEqualToData;
  const char *v37;
  uint64_t v38;
  int RootRecord;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  int v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;

  v4 = (CKDShortTokenLookupInfo *)a3;
  if (self == v4)
  {
    v23 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend_routingKey(v5, v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_routingKey(self, v9, v10);
      v11 = objc_claimAutoreleasedReturnValue();
      if (v8 == (void *)v11)
      {

      }
      else
      {
        v14 = (void *)v11;
        objc_msgSend_routingKey(self, v12, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_routingKey(v5, v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v15, v19, (uint64_t)v18);

        if (!isEqualToString)
          goto LABEL_15;
      }
      objc_msgSend_shortSharingTokenHashData(v5, v21, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_shortSharingTokenHashData(self, v25, v26);
      v27 = objc_claimAutoreleasedReturnValue();
      if (v24 == (void *)v27)
      {

      }
      else
      {
        v30 = (void *)v27;
        objc_msgSend_shortSharingTokenHashData(self, v28, v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_shortSharingTokenHashData(v5, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToData = objc_msgSend_isEqualToData_(v31, v35, (uint64_t)v34);

        if (!isEqualToData)
          goto LABEL_15;
      }
      RootRecord = objc_msgSend_shouldFetchRootRecord(v5, v37, v38);
      if (RootRecord == objc_msgSend_shouldFetchRootRecord(self, v40, v41))
      {
        v44 = objc_msgSend_forceDSRefetch(v5, v42, v43);
        if (v44 == objc_msgSend_forceDSRefetch(self, v45, v46))
        {
          objc_msgSend_participantID(v5, v47, v48);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_participantID(self, v51, v52);
          v53 = objc_claimAutoreleasedReturnValue();
          if (v50 == (void *)v53)
          {
            v23 = 1;
            v56 = v50;
          }
          else
          {
            v56 = (void *)v53;
            objc_msgSend_participantID(self, v54, v55);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_participantID(v5, v58, v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend_isEqualToString_(v57, v61, (uint64_t)v60);

          }
          goto LABEL_16;
        }
      }
LABEL_15:
      v23 = 0;
LABEL_16:

      goto LABEL_17;
    }
    v23 = 0;
  }
LABEL_17:

  return v23;
}

- (unint64_t)hash
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  unint64_t v19;

  objc_msgSend_routingKey(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_hash(v4, v5, v6);
  objc_msgSend_shortSharingTokenHashData(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_hash(v10, v11, v12) ^ v7;
  objc_msgSend_participantID(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v13 ^ objc_msgSend_hash(v16, v17, v18);

  return v19;
}

- (NSString)routingKey
{
  return self->_routingKey;
}

- (void)setRoutingKey:(id)a3
{
  objc_storeStrong((id *)&self->_routingKey, a3);
}

- (NSData)shortSharingTokenHashData
{
  return self->_shortSharingTokenHashData;
}

- (void)setShortSharingTokenHashData:(id)a3
{
  objc_storeStrong((id *)&self->_shortSharingTokenHashData, a3);
}

- (BOOL)shouldFetchRootRecord
{
  return self->_shouldFetchRootRecord;
}

- (void)setShouldFetchRootRecord:(BOOL)a3
{
  self->_shouldFetchRootRecord = a3;
}

- (BOOL)forceDSRefetch
{
  return self->_forceDSRefetch;
}

- (void)setForceDSRefetch:(BOOL)a3
{
  self->_forceDSRefetch = a3;
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
  objc_storeStrong((id *)&self->_participantID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_shortSharingTokenHashData, 0);
  objc_storeStrong((id *)&self->_routingKey, 0);
}

@end
