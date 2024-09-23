@implementation XRCapabilityRequirements

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)requirementsFromContext:(id)a3
{
  id v3;
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_2263603A4;
  v10[3] = &unk_24EDC4308;
  v5 = v4;
  v11 = v5;
  objc_msgSend_enumerateRequiredCapabilities_(v3, v6, (uint64_t)v10, v7, v8);

  return v5;
}

+ (id)requirementsFromPlist:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  void *v19;
  id v20;
  __CFString *v21;
  __CFString *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v32[4];
  id v33;
  _QWORD v34[7];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  _QWORD v39[3];
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  _QWORD v46[3];
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[4];

  v49[3] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v45 = 100;
  objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x24BDD1770], v6, (uint64_t)v5, 0, (uint64_t)&v45, a4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = v45;
  if (!v7 || v45 != 100)
  {
    if (!v7)
    {
LABEL_19:
      v20 = 0;
      goto LABEL_23;
    }
LABEL_13:
    if (v9 == 100)
      v21 = CFSTR("The root of the requirements file plist must be a dictionary.");
    else
      v21 = CFSTR("Requirements file must be an XML plist.");
    v22 = v21;
    v23 = *MEMORY[0x24BDD0FD8];
    v46[0] = *MEMORY[0x24BDD0FC8];
    v46[1] = v23;
    v47[0] = CFSTR("Bad Requirements Plist");
    v47[1] = v22;
    v46[2] = v46[0];
    v47[2] = CFSTR("The bundle may be corrupt or empty.  Check that the requirements file is not corrupt.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v24, (uint64_t)v47, (uint64_t)v46, 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v25, (uint64_t)CFSTR("Supported Capability Problem"), 1, (uint64_t)v26);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = v45;
    goto LABEL_13;
  }
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v40 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v13 = MEMORY[0x24BDAC760];
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_2263607E8;
  v34[3] = &unk_24EDC4358;
  v34[4] = &v41;
  v34[5] = v39;
  v34[6] = &v35;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v8, v10, (uint64_t)v34, v11, v12);
  if (*((_BYTE *)v42 + 24))
  {
    if (*((_BYTE *)v36 + 24))
      v14 = CFSTR("Requirements file plist must contain string keys and number values");
    else
      v14 = CFSTR("The details of a capability must be encoded in a required capabilities plist as integers or strings");
    v15 = v14;
    v16 = *MEMORY[0x24BDD0FD8];
    v48[0] = *MEMORY[0x24BDD0FC8];
    v48[1] = v16;
    v49[0] = CFSTR("Bad Requirements Plist");
    v49[1] = v15;
    v48[2] = v48[0];
    v49[2] = CFSTR("The bundle may be corrupt or empty.  Check that the requirements file is not corrupt.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v17, (uint64_t)v49, (uint64_t)v48, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v18, (uint64_t)CFSTR("Supported Capability Problem"), 1, (uint64_t)v19);
      v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    v27 = (void *)objc_opt_new();
    v15 = v8;
    v32[0] = v13;
    v32[1] = 3221225472;
    v32[2] = sub_2263609D0;
    v32[3] = &unk_24EDC4380;
    v20 = v27;
    v33 = v20;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v15, v28, (uint64_t)v32, v29, v30);
    v19 = v33;
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(v39, 8);
  _Block_object_dispose(&v41, 8);
LABEL_23:

  return v20;
}

- (XRCapabilityRequirements)init
{
  XRCapabilityRequirements *v2;
  uint64_t v3;
  NSMutableDictionary *capabilities;
  uint64_t v5;
  NSMutableDictionary *unimplementedResponses;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)XRCapabilityRequirements;
  v2 = -[XRCapabilityRequirements init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    capabilities = v2->_capabilities;
    v2->_capabilities = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    unimplementedResponses = v2->_unimplementedResponses;
    v2->_unimplementedResponses = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (id)plistRepresentation
{
  void *v4;
  NSMutableDictionary *capabilities;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v18;
  const char *v19;
  id v20;
  _QWORD v21[5];
  id v22;

  v4 = (void *)objc_opt_new();
  capabilities = self->_capabilities;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_226360CB0;
  v21[3] = &unk_24EDC43A8;
  v21[4] = self;
  v6 = v4;
  v22 = v6;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(capabilities, v7, (uint64_t)v21, v8, v9);
  v20 = 0;
  objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x24BDD1770], v10, (uint64_t)v6, 100, 0, &v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v20;
  if (!v11)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v12, v13, v14, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("XRCapabilityRequirements.m"), 155, CFSTR("Internal error converting contents to plist"));

  }
  return v11;
}

- (BOOL)checkRequirementsAgainstRegistery:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *capabilities;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  id *v37;
  const __CFString *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  __CFString *v48;
  __CFString *v49;
  uint64_t v50;
  const char *v51;
  void *v52;
  uint64_t v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, const char *, uint64_t, uint64_t, uint64_t);
  void *v57;
  _QWORD v58[2];
  _QWORD v59[4];
  _QWORD v60[2];
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  id v65;
  XRCapabilityRequirements *v66;
  id v67;
  uint64_t *v68;
  uint64_t *v69;
  uint64_t *v70;
  uint64_t v71;
  int *v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  int *v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  char v82;
  _QWORD v83[5];
  _QWORD v84[6];

  v84[5] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v79 = 0;
  v80 = &v79;
  v81 = 0x2020000000;
  v82 = 1;
  v75 = 0;
  v76 = (int *)&v75;
  v77 = 0x2020000000;
  v78 = 0;
  v71 = 0;
  v72 = (int *)&v71;
  v73 = 0x2020000000;
  v74 = 0;
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  capabilities = self->_capabilities;
  v12 = MEMORY[0x24BDAC760];
  v61[0] = MEMORY[0x24BDAC760];
  v61[1] = 3221225472;
  v61[2] = sub_226361214;
  v61[3] = &unk_24EDC43D0;
  v13 = v6;
  v62 = v13;
  v68 = &v79;
  v69 = &v75;
  v14 = v7;
  v63 = v14;
  v15 = v9;
  v64 = v15;
  v16 = v10;
  v70 = &v71;
  v65 = v16;
  v66 = self;
  v17 = v8;
  v67 = v17;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(capabilities, v18, (uint64_t)v61, v19, v20);
  if (*((_BYTE *)v80 + 24))
  {
    v25 = 1;
    goto LABEL_15;
  }
  if (v76[6] < 1)
  {
    if (v72[6] < 1)
      abort();
    if (!objc_msgSend_count(v17, v21, v22, v23, v24))
    {
      v49 = 0;
      v48 = CFSTR("This document appears to have been saved with a new version of this application.");
      v38 = CFSTR("Forward compatibility checks have failed.");
      goto LABEL_12;
    }
    v39 = (void *)objc_opt_new();
    v44 = objc_msgSend_count(v17, v40, v41, v42, v43);
    v54 = v12;
    v55 = 3221225472;
    v56 = sub_22636143C;
    v57 = &unk_24EDC43F8;
    v33 = v39;
    v58[0] = v33;
    v58[1] = v44;
    objc_msgSend_enumerateObjectsUsingBlock_(v17, v45, (uint64_t)&v54, v46, v47);
    v37 = (id *)v58;
    v38 = CFSTR("Forward compatibility checks have failed.");
  }
  else
  {
    if (!objc_msgSend_count(v14, v21, v22, v23, v24))
    {
      v49 = 0;
      v48 = CFSTR("An older version of this application may be able to open this document or connect to this device.");
      v38 = CFSTR("Backward compatibility checks have failed.");
      goto LABEL_12;
    }
    v27 = (void *)objc_opt_new();
    v32 = objc_msgSend_count(v14, v28, v29, v30, v31);
    v59[0] = v12;
    v59[1] = 3221225472;
    v59[2] = sub_2263613D4;
    v59[3] = &unk_24EDC43F8;
    v33 = v27;
    v60[0] = v33;
    v60[1] = v32;
    objc_msgSend_enumerateObjectsUsingBlock_(v14, v34, (uint64_t)v59, v35, v36);
    v37 = (id *)v60;
    v38 = CFSTR("Backward compatibility checks have failed.");
  }
  v48 = (__CFString *)v33;

  v49 = v48;
LABEL_12:
  v50 = *MEMORY[0x24BDD0FC8];
  v83[0] = *MEMORY[0x24BDD0FD8];
  v83[1] = v50;
  v84[0] = v38;
  v84[1] = CFSTR("Missing features");
  v83[2] = *MEMORY[0x24BDD0FF0];
  v83[3] = CFSTR("XRCapabilityRangesKey");
  v84[2] = v48;
  v84[3] = v15;
  v83[4] = CFSTR("XRRequiredVersionsKey");
  v84[4] = v16;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v26, (uint64_t)v84, (uint64_t)v83, 5, v54, v55, v56, v57);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v51, (uint64_t)CFSTR("Supported Capability Problem"), 0, (uint64_t)v52);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  v25 = *((_BYTE *)v80 + 24) != 0;
LABEL_15:

  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v79, 8);

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unimplementedResponses, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
}

@end
