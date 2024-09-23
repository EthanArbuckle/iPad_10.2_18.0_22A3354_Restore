@implementation CRAttestationBaseDeviceHandler

- (CRAttestationBaseDeviceHandler)init
{
  CRAttestationBaseDeviceHandler *v2;
  uint64_t v3;
  NSMutableDictionary *componentsMapping;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRAttestationBaseDeviceHandler;
  v2 = -[CRAttestationBaseDeviceHandler init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    componentsMapping = v2->componentsMapping;
    v2->componentsMapping = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)challengeComponentsWith:(id)a3 withReply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *, void *);
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  const char *v24;
  void *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  void *v31;
  const char *v32;
  void *v33;
  dispatch_queue_t v34;
  dispatch_queue_t queue;
  dispatch_group_t group;
  void *v37;
  uint64_t v38;
  const __CFString *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  _QWORD v45[4];

  v45[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *, void *))a4;
  dispatch_get_global_queue(21, 0);
  queue = (dispatch_queue_t)objc_claimAutoreleasedReturnValue();
  group = dispatch_group_create();
  v37 = (void *)objc_opt_new();
  v34 = dispatch_queue_create("serialQueues", 0);
  objc_msgSend_allKeys(self->componentsMapping, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getLocalSealingManifest(CRFDRUtils, v12, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v19 = (void *)MEMORY[0x24BDD1540];
    v44 = *MEMORY[0x24BDD0FC8];
    v45[0] = CFSTR("Failed to get local sealing manifest");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v15, (uint64_t)v45, (uint64_t)&v44, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v19, v20, (uint64_t)CFSTR("com.apple.corerepair"), -28, v31);
LABEL_9:
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!AMFDRCreateWithOptions())
  {
    handleForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_214571510(v21);

    v22 = (void *)MEMORY[0x24BDD1540];
    v42 = *MEMORY[0x24BDD0FC8];
    v43 = CFSTR("Failed to create FDR object");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v23, (uint64_t)&v43, (uint64_t)&v42, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v22, v24, (uint64_t)CFSTR("com.apple.corerepair"), -32, v31);
    goto LABEL_9;
  }
  if (AMFDRSealingManifestCopyDataClassesInstancesAndProperties())
  {
    v30 = (void *)MEMORY[0x24BDD1540];
    v38 = *MEMORY[0x24BDD0FC8];
    v39 = CFSTR("Number of data classes and instances mismatches");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v17, (uint64_t)&v39, (uint64_t)&v38, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v30, v32, (uint64_t)CFSTR("com.apple.corerepair"), -42, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = (void *)MEMORY[0x24BDD1540];
    v40 = *MEMORY[0x24BDD0FC8];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v17, (uint64_t)CFSTR("Failed to decode sealing manifest: %@"), v18, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v26;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v27, (uint64_t)&v41, (uint64_t)&v40, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v25, v29, (uint64_t)CFSTR("com.apple.corerepair"), -28, v28);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = 0;
  }
LABEL_11:

  v7[2](v7, 0, v37, v33);
}

- (void)getStrongComponentsWithReply:(id)a3
{
  void (**v4)(id, uint64_t, void *, void *);
  NSMutableDictionary *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CRStrongComponent *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  NSObject *p_super;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  void *v58;
  const char *v59;
  void (**v60)(id, uint64_t, void *, void *);
  NSMutableDictionary *obj;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t buf[4];
  void *v68;
  uint64_t v69;
  void *v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, void *, void *))a3;
  v62 = (void *)objc_opt_new();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v5 = self->componentsMapping;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v63, (uint64_t)v71, 16);
  if (v7)
  {
    v10 = v7;
    v11 = *(_QWORD *)v64;
    v60 = v4;
    obj = v5;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v64 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(self->componentsMapping, v8, v13, v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifierBase64(v14, v15, v16, v17);
        v18 = objc_claimAutoreleasedReturnValue();
        if (!v18)
        {

LABEL_14:
          handleForCategory(0);
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            sub_214571668(v13, v46, v47, v48, v49, v50, v51, v52);

          v53 = (void *)MEMORY[0x24BDD1540];
          v69 = *MEMORY[0x24BDD0FC8];
          objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v54, (uint64_t)CFSTR("unable to get identifier:%@"), v55, v13);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = v56;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v57, (uint64_t)&v70, (uint64_t)&v69, 1);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_userInfo_(v53, v59, (uint64_t)CFSTR("com.apple.corerepair"), -32, v58);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          v45 = 0;
          v4 = v60;
          p_super = &obj->super.super;
          goto LABEL_17;
        }
        v21 = (void *)v18;
        objc_msgSend_objectForKeyedSubscript_(self->componentsMapping, v19, v13, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifierBase64(v22, v23, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend_length(v26, v27, v28, v29);

        if (!v30)
          goto LABEL_14;
        v31 = [CRStrongComponent alloc];
        objc_msgSend_objectForKeyedSubscript_(self->componentsMapping, v32, v13, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifierBase64(v34, v35, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)objc_msgSend_initWithComponentType_identifier_fwVersion_(v31, v39, v13, (uint64_t)v38, 0);

        objc_msgSend_addObject_(v62, v41, (uint64_t)v40, v42);
      }
      v5 = obj;
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v63, (uint64_t)v71, 16);
      v4 = v60;
      if (v10)
        continue;
      break;
    }
  }

  handleForCategory(0);
  p_super = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v68 = v62;
    _os_log_impl(&dword_214503000, p_super, OS_LOG_TYPE_DEFAULT, "Stong Components:%@", buf, 0xCu);
  }
  v44 = 0;
  v45 = 1;
LABEL_17:

  v4[2](v4, v45, v62, v44);
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(CRAttestationBaseDeviceHandler);
}

- (NSMutableDictionary)componentsMapping
{
  return self->componentsMapping;
}

- (void)setComponentsMapping:(id)a3
{
  objc_storeStrong((id *)&self->componentsMapping, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->componentsMapping, 0);
}

@end
