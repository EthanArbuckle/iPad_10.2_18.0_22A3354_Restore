@implementation CKDCheckSupportedDeviceCapabilitiesURLRequest

- (CKDCheckSupportedDeviceCapabilitiesURLRequest)initWithOperation:(id)a3 zoneIDs:(id)a4 desiredCapabilitySets:(id)a5 options:(id)a6
{
  id v11;
  id v12;
  id v13;
  CKDCheckSupportedDeviceCapabilitiesURLRequest *v14;
  CKDCheckSupportedDeviceCapabilitiesURLRequest *v15;
  uint64_t v16;
  NSMutableDictionary *zoneIDByRequestID;
  uint64_t v18;
  NSMutableDictionary *capabililitySetsByRequestID;
  objc_super v21;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CKDCheckSupportedDeviceCapabilitiesURLRequest;
  v14 = -[CKDURLRequest initWithOperation:](&v21, sel_initWithOperation_, a3);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_zoneIDs, a4);
    objc_storeStrong((id *)&v15->_desiredCapabilitySets, a5);
    v16 = objc_opt_new();
    zoneIDByRequestID = v15->_zoneIDByRequestID;
    v15->_zoneIDByRequestID = (NSMutableDictionary *)v16;

    v18 = objc_opt_new();
    capabililitySetsByRequestID = v15->_capabililitySetsByRequestID;
    v15->_capabililitySetsByRequestID = (NSMutableDictionary *)v18;

    objc_storeStrong((id *)&v15->_options, a6);
  }

  return v15;
}

- (void)_performRequest
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  char hasTemporaryDeviceCapabilitiesEntitlement;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  int v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  CKDDeviceCapabilityCheckResult *v53;
  const char *v54;
  void *IsSupported;
  const char *v56;
  uint64_t v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  uint64_t j;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t k;
  uint64_t v71;
  void (**v72)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v73;
  id obj;
  uint64_t v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  objc_msgSend_container(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_entitlements(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  hasTemporaryDeviceCapabilitiesEntitlement = objc_msgSend_hasTemporaryDeviceCapabilitiesEntitlement(v7, v8, v9);

  if ((hasTemporaryDeviceCapabilitiesEntitlement & 1) == 0)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v11, *MEMORY[0x1E0C94B20], 1017, CFSTR("Un-entitled client is not allowed access to temporary implementation of device capabilties"));
LABEL_5:
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishWithError_(self, v20, (uint64_t)v19);
    goto LABEL_18;
  }
  objc_msgSend_desiredCapabilitySets(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_count(v13, v14, v15);

  if (v16)
  {
    v19 = 0;
  }
  else
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v17, *MEMORY[0x1E0C94B20], 1017, CFSTR("At least one capability set must be specified."));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  objc_msgSend_desiredCapabilitySets(self, v17, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v85, v91, 16);
  if (v23)
  {
    v26 = v23;
    v27 = *(_QWORD *)v86;
    v28 = *MEMORY[0x1E0C94B20];
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v86 != v27)
          objc_enumerationMutation(v21);
        if (!objc_msgSend_count(*(void **)(*((_QWORD *)&v85 + 1) + 8 * i), v24, v25))
        {
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v24, v28, 1017, CFSTR("At least one capability must be specified in a capability set."));
          v30 = objc_claimAutoreleasedReturnValue();

          v19 = (void *)v30;
        }
      }
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v85, v91, 16);
    }
    while (v26);
  }

  if (v19
    || (objc_msgSend_zoneIDs(self, v31, v32),
        v33 = (void *)objc_claimAutoreleasedReturnValue(),
        v36 = objc_msgSend_count(v33, v34, v35),
        v33,
        !v36)
    && (objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v31, *MEMORY[0x1E0C94B20], 1017, CFSTR("At least one zone ID must be specified.")), (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend_finishWithError_(self, v31, (uint64_t)v19);
    goto LABEL_18;
  }
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v31, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isAppleInternalInstall(v38, v39, v40) & 1) == 0)
  {

    goto LABEL_38;
  }
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend_stubDeviceCapabilityChecks(v43, v44, v45);

  if (!v46)
  {
LABEL_38:
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v47, *MEMORY[0x1E0C94B20], 1001, CFSTR("Server API for device capability checking is not yet implemented."));
    goto LABEL_5;
  }
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend_isSupportedDeviceCapabilityCheckMockResult(v49, v50, v51);

  v53 = [CKDDeviceCapabilityCheckResult alloc];
  IsSupported = (void *)objc_msgSend_initWithIsSupported_(v53, v54, v52);
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  objc_msgSend_zoneIDs(self, v56, v57);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v58, (uint64_t)&v81, v90, 16);
  if (v76)
  {
    v75 = *(_QWORD *)v82;
    do
    {
      for (j = 0; j != v76; ++j)
      {
        if (*(_QWORD *)v82 != v75)
          objc_enumerationMutation(obj);
        v62 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * j);
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v80 = 0u;
        objc_msgSend_desiredCapabilitySets(self, v59, v60);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v64, (uint64_t)&v77, v89, 16);
        if (v65)
        {
          v68 = v65;
          v69 = *(_QWORD *)v78;
          do
          {
            for (k = 0; k != v68; ++k)
            {
              if (*(_QWORD *)v78 != v69)
                objc_enumerationMutation(v63);
              v71 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * k);
              objc_msgSend_supportedDeviceCapabilitiesCheckedForZoneBlock(self, v66, v67);
              v72 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, uint64_t, uint64_t, void *, _QWORD))v72)[2](v72, v62, v71, IsSupported, 0);

            }
            v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v66, (uint64_t)&v77, v89, 16);
          }
          while (v68);
        }

      }
      v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v59, (uint64_t)&v81, v90, 16);
    }
    while (v76);
  }

  v19 = 0;
  objc_msgSend_finishWithError_(self, v73, 0);
LABEL_18:

}

- (id)requestOperationClasses
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)requestDidParseNodeFailure:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void (**v37)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  id v46;

  v46 = a3;
  objc_msgSend_zoneIDByRequestID(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v46, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v6, v13, (uint64_t)v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_capabililitySetsByRequestID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v46, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v17, v24, (uint64_t)v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_zoneIDs(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_count(v28, v29, v30);

  if (v31)
  {
    objc_msgSend_supportedDeviceCapabilitiesCheckedForZoneBlock(self, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend_supportedDeviceCapabilitiesCheckedForZoneBlock(self, v35, v36);
      v37 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend_result(v46, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *, _QWORD, void *))v37)[2](v37, v14, v25, 0, v40);
LABEL_6:

    }
  }
  else
  {
    objc_msgSend_errorCheckingSupportedDeviceCapabilitiesBlock(self, v32, v33);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      objc_msgSend_errorCheckingSupportedDeviceCapabilitiesBlock(self, v42, v43);
      v37 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend_result(v46, v44, v45);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD), void *))v37[2])(v37, v40);
      goto LABEL_6;
    }
  }

}

- (id)supportedDeviceCapabilitiesCheckedForZoneBlock
{
  return self->_supportedDeviceCapabilitiesCheckedForZoneBlock;
}

- (void)setSupportedDeviceCapabilitiesCheckedForZoneBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (id)errorCheckingSupportedDeviceCapabilitiesBlock
{
  return self->_errorCheckingSupportedDeviceCapabilitiesBlock;
}

- (void)setErrorCheckingSupportedDeviceCapabilitiesBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (NSArray)zoneIDs
{
  return self->_zoneIDs;
}

- (void)setZoneIDs:(id)a3
{
  objc_storeStrong((id *)&self->_zoneIDs, a3);
}

- (NSArray)desiredCapabilitySets
{
  return self->_desiredCapabilitySets;
}

- (void)setDesiredCapabilitySets:(id)a3
{
  objc_storeStrong((id *)&self->_desiredCapabilitySets, a3);
}

- (CKDeviceCapabilityCheckOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (NSMutableDictionary)zoneIDByRequestID
{
  return self->_zoneIDByRequestID;
}

- (void)setZoneIDByRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_zoneIDByRequestID, a3);
}

- (NSMutableDictionary)capabililitySetsByRequestID
{
  return self->_capabililitySetsByRequestID;
}

- (void)setCapabililitySetsByRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_capabililitySetsByRequestID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabililitySetsByRequestID, 0);
  objc_storeStrong((id *)&self->_zoneIDByRequestID, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_desiredCapabilitySets, 0);
  objc_storeStrong((id *)&self->_zoneIDs, 0);
  objc_storeStrong(&self->_errorCheckingSupportedDeviceCapabilitiesBlock, 0);
  objc_storeStrong(&self->_supportedDeviceCapabilitiesCheckedForZoneBlock, 0);
}

@end
