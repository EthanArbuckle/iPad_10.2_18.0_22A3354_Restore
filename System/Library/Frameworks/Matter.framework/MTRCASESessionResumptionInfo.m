@implementation MTRCASESessionResumptionInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MTRCASESessionResumptionInfo)initWithCoder:(id)a3
{
  id v4;
  MTRCASESessionResumptionInfo *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSNumber *nodeID;
  NSNumber **p_nodeID;
  NSNumber *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  NSData *resumptionID;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  NSData *sharedSecret;
  uint64_t v20;
  const char *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  NSData *v27;
  const char *v28;
  uint64_t v29;
  unint64_t v30;
  BOOL v31;
  char v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  NSSet *caseAuthenticatedTags;
  MTRCASESessionResumptionInfo *v37;
  NSObject *v38;
  NSNumber *v39;
  NSObject *v40;
  NSNumber *v41;
  NSObject *v42;
  NSData *v43;
  NSObject *v44;
  NSData *v45;
  NSObject *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  objc_super v52;
  uint8_t v53[128];
  uint8_t buf[4];
  NSData *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)MTRCASESessionResumptionInfo;
  v5 = -[MTRCASESessionResumptionInfo init](&v52, sel_init);
  if (!v5)
    goto LABEL_43;
  v6 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("nodeID"));
  v8 = objc_claimAutoreleasedReturnValue();
  p_nodeID = &v5->_nodeID;
  nodeID = v5->_nodeID;
  v5->_nodeID = (NSNumber *)v8;

  if (v5->_nodeID)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      sub_234117B80(0, "NotSpecified");
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = *p_nodeID;
        *(_DWORD *)buf = 138412290;
        v55 = (NSData *)v41;
        _os_log_impl(&dword_233BF3000, v40, OS_LOG_TYPE_ERROR, "MTRCASESessionResumptionInfo got %@ for node ID, not NSNumber.", buf, 0xCu);
      }

      if (!sub_234114844(1u))
        goto LABEL_43;
LABEL_42:
      sub_2341147D0(0, 1);
LABEL_43:
      v37 = 0;
      goto LABEL_44;
    }
    v11 = *p_nodeID;
  }
  else
  {
    v11 = 0;
  }
  if (!sub_233FF8CFC(v11))
  {
    sub_234117B80(0, "NotSpecified");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = *p_nodeID;
      *(_DWORD *)buf = 138412290;
      v55 = (NSData *)v39;
      _os_log_impl(&dword_233BF3000, v38, OS_LOG_TYPE_ERROR, "MTRCASESessionResumptionInfo node ID has invalid value: %@", buf, 0xCu);
    }

    if (!sub_234114844(1u))
      goto LABEL_43;
    goto LABEL_42;
  }
  v12 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, CFSTR("resumptionID"));
  v14 = objc_claimAutoreleasedReturnValue();
  resumptionID = v5->_resumptionID;
  v5->_resumptionID = (NSData *)v14;

  if (v5->_resumptionID)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      sub_234117B80(0, "NotSpecified");
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v43 = v5->_resumptionID;
        *(_DWORD *)buf = 138412290;
        v55 = v43;
        _os_log_impl(&dword_233BF3000, v42, OS_LOG_TYPE_ERROR, "MTRCASESessionResumptionInfo got %@ for resumption ID, not NSData.", buf, 0xCu);
      }

      if (!sub_234114844(1u))
        goto LABEL_43;
      goto LABEL_42;
    }
  }
  v16 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, CFSTR("sharedSecret"));
  v18 = objc_claimAutoreleasedReturnValue();
  sharedSecret = v5->_sharedSecret;
  v5->_sharedSecret = (NSData *)v18;

  if (v5->_sharedSecret)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      sub_234117B80(0, "NotSpecified");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v45 = v5->_sharedSecret;
        *(_DWORD *)buf = 138412290;
        v55 = v45;
        _os_log_impl(&dword_233BF3000, v44, OS_LOG_TYPE_ERROR, "MTRCASESessionResumptionInfo got %@ for shared secret, not NSData.", buf, 0xCu);
      }

      if (!sub_234114844(1u))
        goto LABEL_43;
      goto LABEL_42;
    }
  }
  v20 = objc_opt_class();
  objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v21, v20, CFSTR("CATs"));
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v48, v53, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v49;
    while (2)
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v49 != v25)
          objc_enumerationMutation(v22);
        v27 = (NSData *)*(id *)(*((_QWORD *)&v48 + 1) + 8 * i);
        if (!sub_233FFFF20(v27))
        {

LABEL_46:
          sub_234117B80(0, "NotSpecified");
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v55 = v27;
            _os_log_impl(&dword_233BF3000, v47, OS_LOG_TYPE_ERROR, "MTRCASESessionResumptionInfo CASE tag has invalid value: %@", buf, 0xCu);
          }

          if (sub_234114844(1u))
            sub_2341147D0(0, 1);

          v37 = 0;
          goto LABEL_51;
        }
        v30 = objc_msgSend_unsignedLongLongValue(v27, v28, v29);
        if ((_WORD)v30)
          v31 = HIDWORD(v30) == 0;
        else
          v31 = 0;
        v32 = v31;

        if ((v32 & 1) == 0)
          goto LABEL_46;
      }
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v33, (uint64_t)&v48, v53, 16);
      if (v24)
        continue;
      break;
    }
  }

  objc_msgSend_setWithArray_(MEMORY[0x24BDBCF20], v34, (uint64_t)v22);
  v35 = objc_claimAutoreleasedReturnValue();
  caseAuthenticatedTags = v5->_caseAuthenticatedTags;
  v5->_caseAuthenticatedTags = (NSSet *)v35;

  v37 = v5;
LABEL_51:

LABEL_44:
  return v37;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  id v23;

  v23 = a3;
  objc_msgSend_nodeID(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v23, v7, (uint64_t)v6, CFSTR("nodeID"));

  objc_msgSend_resumptionID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v23, v11, (uint64_t)v10, CFSTR("resumptionID"));

  objc_msgSend_sharedSecret(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v23, v15, (uint64_t)v14, CFSTR("sharedSecret"));

  objc_msgSend_caseAuthenticatedTags(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v23, v22, (uint64_t)v21, CFSTR("CATs"));

}

- (NSNumber)nodeID
{
  return self->_nodeID;
}

- (void)setNodeID:(id)a3
{
  objc_storeStrong((id *)&self->_nodeID, a3);
}

- (NSData)resumptionID
{
  return self->_resumptionID;
}

- (void)setResumptionID:(id)a3
{
  objc_storeStrong((id *)&self->_resumptionID, a3);
}

- (NSData)sharedSecret
{
  return self->_sharedSecret;
}

- (void)setSharedSecret:(id)a3
{
  objc_storeStrong((id *)&self->_sharedSecret, a3);
}

- (NSSet)caseAuthenticatedTags
{
  return self->_caseAuthenticatedTags;
}

- (void)setCaseAuthenticatedTags:(id)a3
{
  objc_storeStrong((id *)&self->_caseAuthenticatedTags, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caseAuthenticatedTags, 0);
  objc_storeStrong((id *)&self->_sharedSecret, 0);
  objc_storeStrong((id *)&self->_resumptionID, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);
}

@end
