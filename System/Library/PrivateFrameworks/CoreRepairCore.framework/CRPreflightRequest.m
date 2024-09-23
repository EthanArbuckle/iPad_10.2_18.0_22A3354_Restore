@implementation CRPreflightRequest

- (CRPreflightRequest)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRPreflightRequest;
  return -[CRPreflightRequest init](&v3, sel_init);
}

+ (id)request
{
  return objc_alloc_init((Class)a1);
}

- (id)payload
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t i;
  void *v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  BOOL v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  int isEqual;
  const char *v87;
  const char *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t j;
  void *v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  BOOL v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  int v112;
  const char *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  void *v123;
  void *v124;
  id v125;
  NSObject *v126;
  id v127;
  void *v129;
  uint64_t v130;
  void *v131;
  CRPreflightRequest *v132;
  uint64_t v133;
  id obj;
  uint64_t v135;
  void *v136;
  id v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  uint64_t v153;

  v153 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend_requestID(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_requestID(self, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v12, (uint64_t)v11, (uint64_t)CFSTR("RequestID"));

  }
  objc_msgSend_bikCertificate(self, v8, v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend_bikCertificate(self, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v18, (uint64_t)v17, (uint64_t)CFSTR("BIKCertificate"));

  }
  objc_msgSend_sessionID(self, v14, v15, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend_sessionID(self, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v24, (uint64_t)v23, (uint64_t)CFSTR("SessionID"));

  }
  objc_msgSend_components(self, v20, v21, v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v129 = v3;
    v27 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v146 = 0u;
    v147 = 0u;
    v148 = 0u;
    v149 = 0u;
    objc_msgSend_components(self, v28, v29, v30);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v146, (uint64_t)v152, 16);
    if (v32)
    {
      v36 = v32;
      v37 = *(_QWORD *)v147;
      v131 = v27;
      v132 = self;
      v130 = *(_QWORD *)v147;
      do
      {
        v38 = 0;
        v133 = v36;
        do
        {
          if (*(_QWORD *)v147 != v37)
            objc_enumerationMutation(obj);
          v39 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * v38);
          objc_msgSend_type(v39, v33, v34, v35);
          v40 = objc_claimAutoreleasedReturnValue();
          if (v40)
          {
            v41 = (void *)v40;
            objc_msgSend_identifier(v39, v33, v34, v35);
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            if (v42)
            {
              v135 = v38;
              v43 = objc_alloc_init(MEMORY[0x24BDBCED8]);
              v44 = objc_alloc_init(MEMORY[0x24BDBCED8]);
              objc_msgSend_type(v39, v45, v46, v47);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v43, v49, (uint64_t)v48, (uint64_t)CFSTR("Type"));

              objc_msgSend_identifier(v39, v50, v51, v52);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v43, v54, (uint64_t)v53, (uint64_t)CFSTR("Identifier"));

              objc_msgSend_asid(v39, v55, v56, v57);
              v58 = (void *)objc_claimAutoreleasedReturnValue();

              if (v58)
              {
                objc_msgSend_asid(v39, v59, v60, v61);
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKeyedSubscript_(v44, v63, (uint64_t)v62, (uint64_t)CFSTR("asid"));

              }
              v136 = v44;
              v144 = 0u;
              v145 = 0u;
              v142 = 0u;
              v143 = 0u;
              objc_msgSend_componentResponses(self, v59, v60, v61);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v65, (uint64_t)&v142, (uint64_t)v151, 16);
              if (v66)
              {
                v69 = v66;
                v70 = *(_QWORD *)v143;
                do
                {
                  for (i = 0; i != v69; ++i)
                  {
                    if (*(_QWORD *)v143 != v70)
                      objc_enumerationMutation(v64);
                    v72 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * i);
                    objc_msgSend_objectForKeyedSubscript_(v72, v67, (uint64_t)CFSTR("key"), v68);
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_objectForKeyedSubscript_(v72, v74, (uint64_t)CFSTR("signature"), v75);
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_objectForKeyedSubscript_(v72, v77, (uint64_t)CFSTR("deviceNonce"), v78);
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v73)
                      v82 = v76 == 0;
                    else
                      v82 = 1;
                    if (!v82)
                    {
                      objc_msgSend_objectForKeyedSubscript_(v43, v79, (uint64_t)CFSTR("Type"), v80);
                      v83 = (void *)objc_claimAutoreleasedReturnValue();
                      isEqual = objc_msgSend_isEqual_(v83, v84, (uint64_t)v73, v85);

                      if (isEqual)
                      {
                        objc_msgSend_setObject_forKeyedSubscript_(v43, v87, (uint64_t)v76, (uint64_t)CFSTR("Response"));
                        if (v81)
                          objc_msgSend_setObject_forKeyedSubscript_(v136, v88, (uint64_t)v81, (uint64_t)CFSTR("deviceNonce"));
                      }
                    }

                  }
                  v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v67, (uint64_t)&v142, (uint64_t)v151, 16);
                }
                while (v69);
              }

              v140 = 0u;
              v141 = 0u;
              v138 = 0u;
              v139 = 0u;
              self = v132;
              objc_msgSend_activationResponses(v132, v89, v90, v91);
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(v92, v93, (uint64_t)&v138, (uint64_t)v150, 16);
              if (v94)
              {
                v97 = v94;
                v98 = *(_QWORD *)v139;
                do
                {
                  for (j = 0; j != v97; ++j)
                  {
                    if (*(_QWORD *)v139 != v98)
                      objc_enumerationMutation(v92);
                    v100 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * j);
                    objc_msgSend_objectForKeyedSubscript_(v100, v95, (uint64_t)CFSTR("key"), v96);
                    v101 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_objectForKeyedSubscript_(v100, v102, (uint64_t)CFSTR("activationToken"), v103);
                    v104 = objc_claimAutoreleasedReturnValue();
                    v107 = (void *)v104;
                    if (v101)
                      v108 = v104 == 0;
                    else
                      v108 = 1;
                    if (!v108)
                    {
                      objc_msgSend_objectForKeyedSubscript_(v43, v105, (uint64_t)CFSTR("Type"), v106);
                      v109 = (void *)objc_claimAutoreleasedReturnValue();
                      v112 = objc_msgSend_isEqual_(v109, v110, (uint64_t)v101, v111);

                      if (v112)
                        objc_msgSend_setObject_forKeyedSubscript_(v136, v113, (uint64_t)v107, (uint64_t)CFSTR("activationToken"));
                    }

                  }
                  v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v92, v95, (uint64_t)&v138, (uint64_t)v150, 16);
                }
                while (v97);
              }

              if (objc_msgSend_count(v136, v114, v115, v116))
                objc_msgSend_setObject_forKeyedSubscript_(v43, v117, (uint64_t)v136, (uint64_t)CFSTR("Properties"));
              v27 = v131;
              objc_msgSend_addObject_(v131, v117, (uint64_t)v43, v118);

              v36 = v133;
              v37 = v130;
              v38 = v135;
            }
          }
          ++v38;
        }
        while (v38 != v36);
        v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v33, (uint64_t)&v146, (uint64_t)v152, 16);
      }
      while (v36);
    }

    v3 = v129;
    if (objc_msgSend_count(v27, v119, v120, v121))
      objc_msgSend_setObject_forKeyedSubscript_(v129, v122, (uint64_t)v27, (uint64_t)CFSTR("Components"));

  }
  v137 = 0;
  v123 = v3;
  objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x24BDD1770], v26, (uint64_t)v3, 100, 0, &v137);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = v137;
  if (v125)
  {
    handleForCategory(0);
    v126 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
      sub_214567410((uint64_t)v125, v126);

    v127 = 0;
  }
  else
  {
    v127 = v124;
  }

  return v127;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestID(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sessionID(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bikCertificate(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_components(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentResponses(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_activationResponses(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_signatureChallenge(self, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v34, (uint64_t)CFSTR("<%@: RequestID = %@ SessionID = %@ bikCertificate = %@ components = %@ componentResponses = %@ activationResponses = %@, signatureChallenge = %@>"), v35, v5, v9, v13, v17, v21, v25, v29, v33);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (NSURL)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
  objc_storeStrong((id *)&self->_server, a3);
}

- (NSData)signatureChallenge
{
  return self->_signatureChallenge;
}

- (void)setSignatureChallenge:(id)a3
{
  objc_storeStrong((id *)&self->_signatureChallenge, a3);
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

- (NSData)bikCertificate
{
  return self->_bikCertificate;
}

- (void)setBikCertificate:(id)a3
{
  objc_storeStrong((id *)&self->_bikCertificate, a3);
}

- (NSArray)components
{
  return self->_components;
}

- (void)setComponents:(id)a3
{
  objc_storeStrong((id *)&self->_components, a3);
}

- (NSArray)componentResponses
{
  return self->_componentResponses;
}

- (void)setComponentResponses:(id)a3
{
  objc_storeStrong((id *)&self->_componentResponses, a3);
}

- (NSArray)activationResponses
{
  return self->_activationResponses;
}

- (void)setActivationResponses:(id)a3
{
  objc_storeStrong((id *)&self->_activationResponses, a3);
}

- (NSString)phase
{
  return self->_phase;
}

- (void)setPhase:(id)a3
{
  objc_storeStrong((id *)&self->_phase, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phase, 0);
  objc_storeStrong((id *)&self->_activationResponses, 0);
  objc_storeStrong((id *)&self->_componentResponses, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_bikCertificate, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_signatureChallenge, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

@end
