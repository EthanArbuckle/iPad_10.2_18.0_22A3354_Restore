@implementation CRPreflightResponse

- (CRPreflightResponse)initWithDictionary:(id)a3
{
  id v5;
  CRPreflightResponse *v6;
  CRPreflightResponse *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSString *requestID;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSString *sessionID;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSString *status;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSArray *details;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSString *errorCode;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  NSString *errorMessage;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  NSString *specVersion;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  NSData *signatureChallenge;
  NSMutableArray *v50;
  NSMutableArray *componentChallenges;
  NSMutableArray *v52;
  NSMutableArray *activationChallenges;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  NSObject *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t i;
  void *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  BOOL v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  char isKindOfClass;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  char v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  const char *v119;
  uint64_t v120;
  CRPreflightResponse *v121;
  id v123;
  void *v124;
  CRPreflightResponse *v125;
  id obj;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  objc_super v131;
  uint8_t v132[128];
  uint8_t buf[4];
  void *v134;
  uint64_t v135;

  v135 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v131.receiver = self;
  v131.super_class = (Class)CRPreflightResponse;
  v6 = -[CRPreflightResponse init](&v131, sel_init);
  v7 = v6;
  if (v6)
  {
    if (!v5)
    {
      v121 = 0;
      goto LABEL_49;
    }
    objc_storeStrong((id *)&v6->_rawResponse, a3);
    objc_msgSend_objectForKeyedSubscript_(v5, v8, (uint64_t)CFSTR("RequestID"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend_objectForKeyedSubscript_(v5, v11, (uint64_t)CFSTR("RequestID"), v12);
      v13 = objc_claimAutoreleasedReturnValue();
      requestID = v7->_requestID;
      v7->_requestID = (NSString *)v13;

    }
    objc_msgSend_objectForKeyedSubscript_(v5, v11, (uint64_t)CFSTR("SessionID"), v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend_objectForKeyedSubscript_(v5, v16, (uint64_t)CFSTR("SessionID"), v17);
      v18 = objc_claimAutoreleasedReturnValue();
      sessionID = v7->_sessionID;
      v7->_sessionID = (NSString *)v18;

    }
    objc_msgSend_objectForKeyedSubscript_(v5, v16, (uint64_t)CFSTR("status"), v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend_objectForKeyedSubscript_(v5, v21, (uint64_t)CFSTR("status"), v22);
      v23 = objc_claimAutoreleasedReturnValue();
      status = v7->_status;
      v7->_status = (NSString *)v23;

    }
    objc_msgSend_objectForKeyedSubscript_(v5, v21, (uint64_t)CFSTR("details"), v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend_objectForKeyedSubscript_(v5, v26, (uint64_t)CFSTR("details"), v27);
      v28 = objc_claimAutoreleasedReturnValue();
      details = v7->_details;
      v7->_details = (NSArray *)v28;

    }
    objc_msgSend_objectForKeyedSubscript_(v5, v26, (uint64_t)CFSTR("ErrorCode"), v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend_objectForKeyedSubscript_(v5, v31, (uint64_t)CFSTR("ErrorCode"), v32);
      v33 = objc_claimAutoreleasedReturnValue();
      errorCode = v7->_errorCode;
      v7->_errorCode = (NSString *)v33;

    }
    objc_msgSend_objectForKeyedSubscript_(v5, v31, (uint64_t)CFSTR("ErrorMessage"), v32);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend_objectForKeyedSubscript_(v5, v36, (uint64_t)CFSTR("ErrorMessage"), v37);
      v38 = objc_claimAutoreleasedReturnValue();
      errorMessage = v7->_errorMessage;
      v7->_errorMessage = (NSString *)v38;

    }
    objc_msgSend_objectForKeyedSubscript_(v5, v36, (uint64_t)CFSTR("SpecVersion"), v37);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      objc_msgSend_objectForKeyedSubscript_(v5, v41, (uint64_t)CFSTR("SpecVersion"), v42);
      v43 = objc_claimAutoreleasedReturnValue();
      specVersion = v7->_specVersion;
      v7->_specVersion = (NSString *)v43;

    }
    objc_msgSend_objectForKeyedSubscript_(v5, v41, (uint64_t)CFSTR("SignatureChallenge"), v42);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      objc_msgSend_objectForKeyedSubscript_(v5, v46, (uint64_t)CFSTR("SignatureChallenge"), v47);
      v48 = objc_claimAutoreleasedReturnValue();
      signatureChallenge = v7->_signatureChallenge;
      v7->_signatureChallenge = (NSData *)v48;

    }
    v50 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    componentChallenges = v7->_componentChallenges;
    v7->_componentChallenges = v50;

    v52 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    activationChallenges = v7->_activationChallenges;
    v7->_activationChallenges = v52;

    objc_msgSend_objectForKeyedSubscript_(v5, v54, (uint64_t)CFSTR("Challenges"), v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      v123 = v5;
      objc_msgSend_objectForKeyedSubscript_(v5, v57, (uint64_t)CFSTR("Challenges"), v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      handleForCategory(0);
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v134 = v59;
        _os_log_impl(&dword_214503000, v60, OS_LOG_TYPE_DEFAULT, "Challenges: %@", buf, 0xCu);
      }

      v129 = 0u;
      v130 = 0u;
      v127 = 0u;
      v128 = 0u;
      obj = v59;
      v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v61, (uint64_t)&v127, (uint64_t)v132, 16);
      if (v62)
      {
        v65 = v62;
        v66 = *(_QWORD *)v128;
        v125 = v7;
        do
        {
          for (i = 0; i != v65; ++i)
          {
            if (*(_QWORD *)v128 != v66)
              objc_enumerationMutation(obj);
            v68 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * i);
            objc_msgSend_objectForKeyedSubscript_(v68, v63, (uint64_t)CFSTR("Type"), v64);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v68, v70, (uint64_t)CFSTR("Identifier"), v71);
            v72 = objc_claimAutoreleasedReturnValue();
            v75 = (void *)v72;
            if (v69)
              v76 = v72 == 0;
            else
              v76 = 1;
            if (!v76)
            {
              objc_msgSend_objectForKeyedSubscript_(v68, v73, (uint64_t)CFSTR("nonce"), v74);
              v77 = (void *)objc_claimAutoreleasedReturnValue();

              if (v77)
              {
                v80 = (void *)objc_opt_new();
                objc_msgSend_objectForKeyedSubscript_(v68, v81, (uint64_t)CFSTR("nonce"), v82);
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKeyedSubscript_(v80, v84, (uint64_t)v69, (uint64_t)CFSTR("key"));
                objc_msgSend_setObject_forKeyedSubscript_(v80, v85, (uint64_t)v83, (uint64_t)CFSTR("nonce"));
                objc_msgSend_addObject_(v7->_componentChallenges, v86, (uint64_t)v80, v87);

              }
              objc_msgSend_objectForKeyedSubscript_(v68, v78, (uint64_t)CFSTR("Properties"), v79);
              v88 = objc_claimAutoreleasedReturnValue();
              if (v88)
              {
                v91 = (void *)v88;
                objc_msgSend_objectForKeyedSubscript_(v68, v89, (uint64_t)CFSTR("Properties"), v90);
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                isKindOfClass = objc_opt_isKindOfClass();

                if ((isKindOfClass & 1) != 0)
                {
                  objc_msgSend_objectForKeyedSubscript_(v68, v94, (uint64_t)CFSTR("Properties"), v95);
                  v96 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKeyedSubscript_(v96, v97, (uint64_t)CFSTR("activation"), v98);
                  v99 = objc_claimAutoreleasedReturnValue();
                  if (v99)
                  {
                    v102 = (void *)v99;
                    objc_msgSend_objectForKeyedSubscript_(v96, v100, (uint64_t)CFSTR("activation"), v101);
                    v103 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    v104 = objc_opt_isKindOfClass();

                    if ((v104 & 1) != 0)
                    {
                      v105 = (void *)objc_opt_new();
                      objc_msgSend_objectForKeyedSubscript_(v68, v106, (uint64_t)CFSTR("Type"), v107);
                      v108 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_objectForKeyedSubscript_(v96, v109, (uint64_t)CFSTR("activation"), v110);
                      v111 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_objectForKeyedSubscript_(v111, v112, (uint64_t)CFSTR("status"), v113);
                      v114 = (void *)objc_claimAutoreleasedReturnValue();
                      v124 = v111;
                      objc_msgSend_objectForKeyedSubscript_(v111, v115, (uint64_t)CFSTR("activationToken"), v116);
                      v117 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_setObject_forKeyedSubscript_(v105, v118, (uint64_t)v108, (uint64_t)CFSTR("key"));
                      if (v117)
                        objc_msgSend_setObject_forKeyedSubscript_(v105, v119, (uint64_t)v117, (uint64_t)CFSTR("activationToken"));
                      if (v114 && objc_msgSend_isEqual_(v114, v119, (uint64_t)CFSTR("NOCHALLENGE"), v120))
                        objc_msgSend_setObject_forKeyedSubscript_(v105, v119, (uint64_t)&stru_24D1AB488, (uint64_t)CFSTR("activationToken"));
                      objc_msgSend_addObject_(v125->_activationChallenges, v119, (uint64_t)v105, v120);

                    }
                  }

                  v7 = v125;
                }
              }
            }

          }
          v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v63, (uint64_t)&v127, (uint64_t)v132, 16);
        }
        while (v65);
      }

      v5 = v123;
    }
  }
  v121 = v7;
LABEL_49:

  return v121;
}

- (id)description
{
  objc_class *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  id v47;
  id v48;
  void *v49;

  v47 = (id)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestID(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sessionID(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentChallenges(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_activationChallenges(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_status(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_details(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorCode(self, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorMessage(self, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_specVersion(self, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_signatureChallenge(self, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v47, v44, (uint64_t)CFSTR("<%@: RequestID = %@ SessionID = %@ ComponentChallenges = %@ ActivationChallenges = %@ Status = %@ details = %@ errorCode = %@ errorMessage = %@ specVersion = %@ signatureChallenge = %@>"), v45, v49, v7, v11, v15, v19, v23, v27, v31, v35, v39, v43);
  v48 = (id)objc_claimAutoreleasedReturnValue();

  return v48;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_requestID, a3);
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (NSMutableArray)componentChallenges
{
  return self->_componentChallenges;
}

- (void)setComponentChallenges:(id)a3
{
  objc_storeStrong((id *)&self->_componentChallenges, a3);
}

- (NSMutableArray)activationChallenges
{
  return self->_activationChallenges;
}

- (void)setActivationChallenges:(id)a3
{
  objc_storeStrong((id *)&self->_activationChallenges, a3);
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (NSArray)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
  objc_storeStrong((id *)&self->_details, a3);
}

- (NSString)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
  objc_storeStrong((id *)&self->_errorCode, a3);
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
  objc_storeStrong((id *)&self->_errorMessage, a3);
}

- (NSString)specVersion
{
  return self->_specVersion;
}

- (void)setSpecVersion:(id)a3
{
  objc_storeStrong((id *)&self->_specVersion, a3);
}

- (NSData)signatureChallenge
{
  return self->_signatureChallenge;
}

- (void)setSignatureChallenge:(id)a3
{
  objc_storeStrong((id *)&self->_signatureChallenge, a3);
}

- (NSDictionary)rawResponse
{
  return self->_rawResponse;
}

- (void)setRawResponse:(id)a3
{
  objc_storeStrong((id *)&self->_rawResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawResponse, 0);
  objc_storeStrong((id *)&self->_signatureChallenge, 0);
  objc_storeStrong((id *)&self->_specVersion, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_activationChallenges, 0);
  objc_storeStrong((id *)&self->_componentChallenges, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
}

@end
