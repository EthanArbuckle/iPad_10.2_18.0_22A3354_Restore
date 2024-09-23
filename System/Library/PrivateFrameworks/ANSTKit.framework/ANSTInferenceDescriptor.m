@implementation ANSTInferenceDescriptor

- (ANSTInferenceDescriptor)initWithName:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  ANSTInferenceDescriptor *result;

  v6 = a3;
  result = (ANSTInferenceDescriptor *)objc_msgSend_doesNotRecognizeSelector_(self, v7, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTInferenceDescriptor)initWithName:(id)a3 version:(unint64_t)a4 assetURL:(id)a5 assetType:(int64_t)a6 e5FunctionName:(id)a7 inputDescriptors:(id)a8 outputDescriptors:(id)a9 error:(id *)a10
{
  ANSTInferenceDescriptor *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  const char *v22;
  void *v23;
  ANSTInferenceDescriptor *v24;
  const char *v25;
  uint64_t v26;
  NSURL *v27;
  NSURL *assetURL;
  const char *v29;
  uint64_t v30;
  NSString *v31;
  NSString *e5FunctionName;
  const char *v33;
  uint64_t v34;
  NSArray *v35;
  NSArray *inputDescriptors;
  const char *v37;
  uint64_t v38;
  NSArray *v39;
  NSArray *outputDescriptors;
  const char *v41;
  void *v42;
  void *v43;
  const char *v44;
  objc_super v46;
  uint64_t v47;
  _QWORD v48[2];

  v16 = (ANSTInferenceDescriptor *)a10;
  v48[1] = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v18 = a5;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v23 = v21;
  if (!v18 || !v20 || !v21)
  {
    if (!a10)
      goto LABEL_10;
    v42 = (void *)MEMORY[0x24BDD1540];
    v47 = *MEMORY[0x24BDD0BA0];
    v48[0] = CFSTR("ANSTInferenceDescriptor initialization requires nonnil assetURL, inputDescriptors, and outputDescriptors.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v22, (uint64_t)v48, &v47, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v42, v44, (uint64_t)CFSTR("ANSTErrorDomain"), 2, v43);
    *a10 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
    v16 = 0;
    goto LABEL_10;
  }
  v46.receiver = self;
  v46.super_class = (Class)ANSTInferenceDescriptor;
  v24 = -[ANSTDescriptor initWithName:error:](&v46, sel_initWithName_error_, v17, a10);
  self = v24;
  if (v24)
  {
    v24->_version = a4;
    v27 = (NSURL *)objc_msgSend_copy(v18, v25, v26);
    assetURL = self->_assetURL;
    self->_assetURL = v27;

    self->_assetType = a6;
    v31 = (NSString *)objc_msgSend_copy(v19, v29, v30);
    e5FunctionName = self->_e5FunctionName;
    self->_e5FunctionName = v31;

    v35 = (NSArray *)objc_msgSend_copy(v20, v33, v34);
    inputDescriptors = self->_inputDescriptors;
    self->_inputDescriptors = v35;

    v39 = (NSArray *)objc_msgSend_copy(v23, v37, v38);
    outputDescriptors = self->_outputDescriptors;
    self->_outputDescriptors = v39;

    if (!objc_msgSend__buildCategorizedDescriptorsCacheWithError_(self, v41, (uint64_t)a10))
      goto LABEL_9;
  }
  self = self;
  v16 = self;
LABEL_10:

  return v16;
}

- (BOOL)_buildCategorizedDescriptorsCacheWithError:(id *)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  NSArray *outputPixelBufferDescriptors;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  const char *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  NSDictionary *inputTensorDescriptors;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  NSDictionary *outputTensorDescriptors;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  NSDictionary *inputPixelBufferDescriptors;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  BOOL v73;
  id *v74;
  void *v75;
  void *v76;
  const char *v77;
  void *v78;
  const char *v79;
  void *v80;
  id *v81;
  void *v82;
  void *v83;
  void *v84;
  const char *v85;
  const char *v86;
  const char *v87;
  ANSTInferenceDescriptor *v89;
  uint64_t v90;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _QWORD v104[2];
  _QWORD v105[2];
  _QWORD v106[2];
  _QWORD v107[2];
  _QWORD v108[2];
  _QWORD v109[2];
  _QWORD v110[2];
  _QWORD v111[2];
  _QWORD v112[2];
  _QWORD v113[2];
  _BYTE v114[128];
  _QWORD v115[2];
  _QWORD v116[2];
  _QWORD v117[2];
  _QWORD v118[2];
  _QWORD v119[2];
  _QWORD v120[2];
  _QWORD v121[2];
  _QWORD v122[2];
  _QWORD v123[2];
  _QWORD v124[2];
  _BYTE v125[128];
  uint64_t v126;

  v126 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, (uint64_t)a3);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v4, v5);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v9, v10);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v89 = self;
  outputPixelBufferDescriptors = self->_inputDescriptors;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(outputPixelBufferDescriptors, v12, (uint64_t)&v100, v125, 16);
  v95 = v8;
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v101;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v101 != v15)
          objc_enumerationMutation(outputPixelBufferDescriptors);
        v17 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_name(v17, v18, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v20;
          if (!v20 || !objc_msgSend_length(v20, v21, v22))
          {
            v74 = a3;
            if (a3)
            {
              v75 = (void *)MEMORY[0x24BDD1540];
              v123[0] = *MEMORY[0x24BDD0BA0];
              v123[1] = CFSTR("ANSTDescriptor");
              v124[0] = CFSTR("Descriptor name should not be empty.");
              v124[1] = v17;
              objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v21, (uint64_t)v124, v123, 2);
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_errorWithDomain_code_userInfo_(v75, v77, (uint64_t)CFSTR("ANSTErrorDomain"), 10, v76, v89);
              goto LABEL_62;
            }
            goto LABEL_53;
          }
          objc_msgSend_objectForKey_(v94, v21, (uint64_t)v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            v74 = a3;
            if (a3)
            {
              v83 = (void *)MEMORY[0x24BDD1540];
              v121[0] = *MEMORY[0x24BDD0BA0];
              v121[1] = CFSTR("ANSTDescriptor");
              v122[0] = CFSTR("Descriptors should not have duplicated names.");
              v122[1] = v17;
              objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v25, (uint64_t)v122, v121, 2, v89);
              goto LABEL_61;
            }
LABEL_58:
            v60 = v93;
            v55 = v94;
            v8 = v95;
            goto LABEL_54;
          }
          objc_msgSend_setObject_forKey_(v94, v25, (uint64_t)v17, v23);
          v8 = v95;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v81 = a3;
            if (!a3)
            {
LABEL_55:
              v73 = 0;
              v60 = v93;
              v55 = v94;
              v69 = v92;
              goto LABEL_66;
            }
            v82 = (void *)MEMORY[0x24BDD1540];
            v115[0] = *MEMORY[0x24BDD0BA0];
            v115[1] = CFSTR("ANSTDescriptor");
            v116[0] = CFSTR("Invalid descriptor, expects either tensor or pixel buffer descriptor.");
            v116[1] = v17;
            objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v26, (uint64_t)v116, v115, 2, v89);
LABEL_52:
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = v95;
            objc_msgSend_errorWithDomain_code_userInfo_(v82, v86, (uint64_t)CFSTR("ANSTErrorDomain"), 10, v23);
            *v81 = (id)objc_claimAutoreleasedReturnValue();
LABEL_53:
            v60 = v93;
            v55 = v94;
LABEL_54:
            v69 = v92;
            goto LABEL_65;
          }
          objc_msgSend_name(v17, v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v28;
          if (!v28 || !objc_msgSend_length(v28, v29, v30))
          {
            v60 = v93;
            v55 = v94;
            v74 = a3;
            v69 = v92;
            if (a3)
            {
              v78 = (void *)MEMORY[0x24BDD1540];
              v119[0] = *MEMORY[0x24BDD0BA0];
              v119[1] = CFSTR("ANSTDescriptor");
              v120[0] = CFSTR("Descriptor name should not be empty.");
              v120[1] = v17;
              objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v29, (uint64_t)v120, v119, 2);
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_errorWithDomain_code_userInfo_(v78, v79, (uint64_t)CFSTR("ANSTErrorDomain"), 10, v76);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_64;
            }
LABEL_65:

            v73 = 0;
            goto LABEL_66;
          }
          objc_msgSend_objectForKey_(v8, v29, (uint64_t)v23);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31)
          {
            v74 = a3;
            if (a3)
            {
              v83 = (void *)MEMORY[0x24BDD1540];
              v117[0] = *MEMORY[0x24BDD0BA0];
              v117[1] = CFSTR("ANSTDescriptor");
              v118[0] = CFSTR("Descriptors should not have duplicated names.");
              v118[1] = v17;
              objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v32, (uint64_t)v118, v117, 2, v89);
              goto LABEL_61;
            }
            goto LABEL_53;
          }
          objc_msgSend_setObject_forKey_(v8, v32, (uint64_t)v17, v23);
        }

      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(outputPixelBufferDescriptors, v33, (uint64_t)&v100, v125, 16);
    }
    while (v14);
  }

  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  outputPixelBufferDescriptors = v89->_outputDescriptors;
  v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(outputPixelBufferDescriptors, v34, (uint64_t)&v96, v114, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v97;
LABEL_20:
    v38 = 0;
    while (1)
    {
      if (*(_QWORD *)v97 != v37)
        objc_enumerationMutation(outputPixelBufferDescriptors);
      v39 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v38);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_name(v39, v40, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v42;
        if (!v42 || !objc_msgSend_length(v42, v43, v44))
        {
          v74 = a3;
          if (!a3)
            goto LABEL_53;
          v83 = (void *)MEMORY[0x24BDD1540];
          v112[0] = *MEMORY[0x24BDD0BA0];
          v112[1] = CFSTR("ANSTDescriptor");
          v113[0] = CFSTR("Descriptor name should not be empty.");
          v113[1] = v39;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v43, (uint64_t)v113, v112, 2, v89);
          goto LABEL_61;
        }
        objc_msgSend_objectForKey_(v93, v43, (uint64_t)v23);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        if (v45)
        {
          v74 = a3;
          if (!a3)
            goto LABEL_58;
          v83 = (void *)MEMORY[0x24BDD1540];
          v110[0] = *MEMORY[0x24BDD0BA0];
          v110[1] = CFSTR("ANSTDescriptor");
          v111[0] = CFSTR("Descriptors should not have duplicated names.");
          v111[1] = v39;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v46, (uint64_t)v111, v110, 2, v89);
          goto LABEL_61;
        }
        objc_msgSend_setObject_forKey_(v93, v46, (uint64_t)v39, v23);
        v8 = v95;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v81 = a3;
          if (!a3)
            goto LABEL_55;
          v82 = (void *)MEMORY[0x24BDD1540];
          v104[0] = *MEMORY[0x24BDD0BA0];
          v104[1] = CFSTR("ANSTDescriptor");
          v105[0] = CFSTR("Invalid descriptor, expects either tensor or pixel buffer descriptor.");
          v105[1] = v39;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v47, (uint64_t)v105, v104, 2, v89);
          goto LABEL_52;
        }
        objc_msgSend_name(v39, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v49;
        if (!v49 || !objc_msgSend_length(v49, v50, v51))
        {
          v60 = v93;
          v55 = v94;
          v74 = a3;
          if (!a3)
            goto LABEL_54;
          v84 = (void *)MEMORY[0x24BDD1540];
          v108[0] = *MEMORY[0x24BDD0BA0];
          v108[1] = CFSTR("ANSTDescriptor");
          v109[0] = CFSTR("Descriptor name should not be empty.");
          v109[1] = v39;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v50, (uint64_t)v109, v108, 2);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_userInfo_(v84, v85, (uint64_t)CFSTR("ANSTErrorDomain"), 10, v76);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_63;
        }
        objc_msgSend_objectForKey_(v92, v50, (uint64_t)v23);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        if (v52)
        {
          v74 = a3;
          if (!a3)
            goto LABEL_53;
          v83 = (void *)MEMORY[0x24BDD1540];
          v106[0] = *MEMORY[0x24BDD0BA0];
          v106[1] = CFSTR("ANSTDescriptor");
          v107[0] = CFSTR("Descriptors should not have duplicated names.");
          v107[1] = v39;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v53, (uint64_t)v107, v106, 2, v89);
LABEL_61:
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_userInfo_(v83, v87, (uint64_t)CFSTR("ANSTErrorDomain"), 10, v76, v90);
LABEL_62:
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = v93;
          v55 = v94;
LABEL_63:
          v69 = v92;
LABEL_64:
          *v74 = v80;

          v8 = v95;
          goto LABEL_65;
        }
        objc_msgSend_setObject_forKey_(v92, v53, (uint64_t)v39, v23);
      }

      if (v36 == ++v38)
      {
        v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(outputPixelBufferDescriptors, v54, (uint64_t)&v96, v114, 16);
        if (v36)
          goto LABEL_20;
        break;
      }
    }
  }

  v55 = v94;
  v58 = objc_msgSend_copy(v94, v56, v57);
  inputTensorDescriptors = v89->_inputTensorDescriptors;
  v89->_inputTensorDescriptors = (NSDictionary *)v58;

  v60 = v93;
  v63 = objc_msgSend_copy(v93, v61, v62);
  outputTensorDescriptors = v89->_outputTensorDescriptors;
  v89->_outputTensorDescriptors = (NSDictionary *)v63;

  v67 = objc_msgSend_copy(v8, v65, v66);
  inputPixelBufferDescriptors = v89->_inputPixelBufferDescriptors;
  v89->_inputPixelBufferDescriptors = (NSDictionary *)v67;

  v69 = v92;
  v72 = objc_msgSend_copy(v92, v70, v71);
  outputPixelBufferDescriptors = (NSArray *)v89->_outputPixelBufferDescriptors;
  v89->_outputPixelBufferDescriptors = (NSDictionary *)v72;
  v73 = 1;
LABEL_66:

  return v73;
}

- (NSURL)networkFileURL
{
  return self->_assetURL;
}

- (BOOL)isEqual:(id)a3
{
  ANSTInferenceDescriptor *v4;
  ANSTInferenceDescriptor *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  int isEqualToArray;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  char isEqualToString;
  void *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  objc_super v53;

  v4 = (ANSTInferenceDescriptor *)a3;
  v53.receiver = self;
  v53.super_class = (Class)ANSTInferenceDescriptor;
  if (-[ANSTDescriptor isEqual:](&v53, sel_isEqual_, v4))
  {
    if (v4 == self)
    {
      isEqualToString = 1;
      goto LABEL_22;
    }
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v4;
        v8 = objc_msgSend_assetType(self, v6, v7);
        if (v8 != objc_msgSend_assetType(v5, v9, v10))
          goto LABEL_20;
        objc_msgSend_assetURL(self, v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_assetURL(v5, v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqual_(v13, v17, (uint64_t)v16))
        {
          objc_msgSend_inputDescriptors(self, v18, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_inputDescriptors(v5, v21, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_isEqualToArray_(v20, v24, (uint64_t)v23))
          {
            objc_msgSend_outputDescriptors(self, v25, v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_outputDescriptors(v5, v28, v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToArray = objc_msgSend_isEqualToArray_(v27, v31, (uint64_t)v30);

            if (isEqualToArray)
            {
              objc_msgSend_e5FunctionName(self, v33, v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              if (v35)
              {

              }
              else
              {
                objc_msgSend_e5FunctionName(v5, v36, v37);
                v41 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v41)
                {
                  isEqualToString = 1;
                  goto LABEL_21;
                }
              }
              objc_msgSend_e5FunctionName(self, v38, v39);
              v42 = objc_claimAutoreleasedReturnValue();
              if (v42)
              {
                v45 = (void *)v42;
                objc_msgSend_e5FunctionName(v5, v43, v44);
                v46 = (void *)objc_claimAutoreleasedReturnValue();

                if (v46)
                {
                  objc_msgSend_e5FunctionName(self, v47, v48);
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_e5FunctionName(v5, v49, v50);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  isEqualToString = objc_msgSend_isEqualToString_(v13, v51, (uint64_t)v16);
                  goto LABEL_15;
                }
              }
            }
LABEL_20:
            isEqualToString = 0;
            goto LABEL_21;
          }

        }
        isEqualToString = 0;
LABEL_15:

LABEL_21:
        goto LABEL_22;
      }
    }
  }
  isEqualToString = 0;
LABEL_22:

  return isEqualToString;
}

- (unint64_t)hash
{
  unint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  unint64_t v33;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)ANSTInferenceDescriptor;
  v3 = -[ANSTDescriptor hash](&v35, sel_hash);
  v6 = objc_msgSend_version(self, v4, v5);
  objc_msgSend_assetURL(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6 ^ objc_msgSend_hash(v9, v10, v11);

  v15 = v12 ^ objc_msgSend_assetType(self, v13, v14);
  objc_msgSend_e5FunctionName(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v15 ^ objc_msgSend_hash(v18, v19, v20);

  objc_msgSend_inputDescriptors(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v21 ^ objc_msgSend_hash(v24, v25, v26) ^ v3;

  objc_msgSend_outputDescriptors(self, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v27 ^ objc_msgSend_hash(v30, v31, v32);

  return v33;
}

- (id)description
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_name(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputDescriptors(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_count(v8, v9, v10);
  objc_msgSend_outputDescriptors(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_count(v14, v15, v16);
  objc_msgSend_stringWithFormat_(v4, v18, (uint64_t)CFSTR("%@ (%zu input(s), %zu output(s))"), v5, v11, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)debugDescription
{
  id v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  unint64_t v16;
  const char *v17;
  uint64_t v18;
  unsigned __int16 v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  unint64_t v27;
  const char *v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  void *v45;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v6, (uint64_t)CFSTR("<%@ %p>\n"), v5, self);

  objc_msgSend_name(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v10, (uint64_t)CFSTR("  name %@\n"), v9);

  v13 = objc_msgSend_version(self, v11, v12);
  v16 = (unint64_t)objc_msgSend_version(self, v14, v15) >> 16;
  v19 = objc_msgSend_version(self, v17, v18);
  objc_msgSend_appendFormat_(v3, v20, (uint64_t)CFSTR("  version 0x%zx (major=%zu, minor=%zu)\n"), v13, v16, v19);
  objc_msgSend_assetURL(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v24, (uint64_t)CFSTR("  assetURL %@\n"), v23);

  v27 = objc_msgSend_assetType(self, v25, v26);
  ANSTAssetTypeToNSString(v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v30, (uint64_t)CFSTR("  assetType %@\n"), v29);

  objc_msgSend_e5FunctionName(self, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v34, (uint64_t)CFSTR("  e5FunctionName %@\n"), v33);

  objc_msgSend_inputDescriptors(self, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v38, (uint64_t)CFSTR("  inputDescriptors %@\n"), v37);

  objc_msgSend_outputDescriptors(self, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v42, (uint64_t)CFSTR("  outputDescriptors %@\n"), v41);

  v45 = (void *)objc_msgSend_copy(v3, v43, v44);
  return v45;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
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
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  objc_msgSend_name(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_version(self, v11, v12);
  objc_msgSend_assetURL(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_assetType(self, v17, v18);
  objc_msgSend_e5FunctionName(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputDescriptors(self, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_outputDescriptors(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend_initWithName_version_assetURL_assetType_e5FunctionName_inputDescriptors_outputDescriptors_error_(v7, v29, (uint64_t)v10, v13, v16, v19, v22, v25, v28, 0);

  return v30;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)ANSTInferenceDescriptor;
  -[ANSTDescriptor encodeWithCoder:](&v44, sel_encodeWithCoder_, v4);
  v5 = (void *)MEMORY[0x24BDD16E0];
  v8 = objc_msgSend_version(self, v6, v7);
  objc_msgSend_numberWithUnsignedInteger_(v5, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_version);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v10, v11);

  objc_msgSend_assetURL(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_assetURL);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)v15, v16);

  v18 = (void *)MEMORY[0x24BDD16E0];
  v21 = objc_msgSend_assetType(self, v19, v20);
  objc_msgSend_numberWithInteger_(v18, v22, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_assetType);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v25, (uint64_t)v23, v24);

  objc_msgSend_inputDescriptors(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_inputDescriptors);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v30, (uint64_t)v28, v29);

  objc_msgSend_outputDescriptors(self, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_outputDescriptors);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v35, (uint64_t)v33, v34);

  objc_msgSend_e5FunctionName(self, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend_e5FunctionName(self, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_e5FunctionName);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v4, v43, (uint64_t)v41, v42);

  }
}

- (ANSTInferenceDescriptor)initWithCoder:(id)a3
{
  id v4;
  ANSTInferenceDescriptor *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  NSURL *assetURL;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  NSString *e5FunctionName;
  void *v30;
  const char *v31;
  int v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  uint64_t v40;
  const char *v41;
  const char *v42;
  const char *v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  NSArray *inputDescriptors;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  NSArray *outputDescriptors;
  const char *v60;
  uint64_t v61;
  char v62;
  id v63;
  const char *v64;
  uint64_t v65;
  ANSTInferenceDescriptor *v66;
  uint64_t v67;
  const char *v68;
  const char *v69;
  void *v70;
  const char *v71;
  void *v72;
  uint64_t v73;
  const char *v74;
  const char *v75;
  const char *v76;
  void *v77;
  const char *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  const char *v83;
  void *v84;
  const char *v85;
  id v87;
  objc_super v88;
  _QWORD v89[3];
  _QWORD v90[3];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[2];
  _QWORD v94[2];
  _QWORD v95[2];
  _QWORD v96[2];
  _QWORD v97[2];
  _QWORD v98[2];
  _QWORD v99[2];
  _QWORD v100[2];
  _QWORD v101[2];
  _QWORD v102[2];
  _QWORD v103[4];

  v103[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v88.receiver = self;
  v88.super_class = (Class)ANSTInferenceDescriptor;
  v5 = -[ANSTDescriptor initWithCoder:](&v88, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_15;
  v6 = objc_opt_class();
  NSStringFromSelector(sel_version);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v39 = (void *)MEMORY[0x24BDD1540];
    v40 = *MEMORY[0x24BDD0B88];
    v102[0] = *MEMORY[0x24BDD0BA0];
    v102[1] = CFSTR("ANSTDescriptorName");
    v103[0] = CFSTR("Inference descriptor version was not encoded.");
    objc_msgSend_name(v5, v10, v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v103[1] = v22;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v41, (uint64_t)v103, v102, 2);
LABEL_10:
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v39, v43, v40, 4865, v37);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_failWithError_(v4, v45, (uint64_t)v44);
LABEL_24:

    v66 = 0;
    goto LABEL_25;
  }
  v5->_version = objc_msgSend_unsignedIntegerValue(v9, v10, v11);
  v12 = objc_opt_class();
  NSStringFromSelector(sel_assetURL);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v12, v13);
  v15 = objc_claimAutoreleasedReturnValue();
  assetURL = v5->_assetURL;
  v5->_assetURL = (NSURL *)v15;

  if (!v5->_assetURL)
  {
    v39 = (void *)MEMORY[0x24BDD1540];
    v40 = *MEMORY[0x24BDD0B88];
    v100[0] = *MEMORY[0x24BDD0BA0];
    v100[1] = CFSTR("ANSTDescriptorName");
    v101[0] = CFSTR("Inference descriptor asset URL was not encoded.");
    objc_msgSend_name(v5, v17, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v101[1] = v22;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v42, (uint64_t)v101, v100, 2);
    goto LABEL_10;
  }
  v19 = objc_opt_class();
  NSStringFromSelector(sel_assetType);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    v35 = (void *)MEMORY[0x24BDD1540];
    v36 = *MEMORY[0x24BDD0B88];
    v67 = *MEMORY[0x24BDD0BA0];
    v99[0] = CFSTR("Inference descriptor asset type was not encoded.");
    v98[0] = v67;
    v98[1] = CFSTR("ANSTDescriptorName");
    objc_msgSend_name(v5, v23, v24);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v99[1] = v37;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v68, (uint64_t)v99, v98, 2);
    goto LABEL_17;
  }
  v5->_assetType = objc_msgSend_integerValue(v22, v23, v24);
  v25 = objc_opt_class();
  NSStringFromSelector(sel_e5FunctionName);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v25, v26);
  v28 = objc_claimAutoreleasedReturnValue();
  e5FunctionName = v5->_e5FunctionName;
  v5->_e5FunctionName = (NSString *)v28;

  if (!v5->_e5FunctionName)
  {
    NSStringFromSelector(sel_e5FunctionName);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend_containsValueForKey_(v4, v31, (uint64_t)v30);

    if (v32)
    {
      v35 = (void *)MEMORY[0x24BDD1540];
      v36 = *MEMORY[0x24BDD0B88];
      v96[0] = *MEMORY[0x24BDD0BA0];
      v96[1] = CFSTR("ANSTDescriptorName");
      v97[0] = CFSTR("Inference descriptor E5 function name was not properly encoded.");
      objc_msgSend_name(v5, v33, v34);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v97[1] = v37;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v38, (uint64_t)v97, v96, 2);
LABEL_17:
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v35, v69, v36, 4865, v44);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v4, v71, (uint64_t)v70);
LABEL_23:

      goto LABEL_24;
    }
  }
  v46 = (void *)MEMORY[0x24BDBCF20];
  v95[0] = objc_opt_class();
  v95[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v47, (uint64_t)v95, 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v46, v49, (uint64_t)v48);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_inputDescriptors);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeArrayOfObjectsOfClasses_forKey_(v4, v51, (uint64_t)v37, v50);
  v52 = objc_claimAutoreleasedReturnValue();
  inputDescriptors = v5->_inputDescriptors;
  v5->_inputDescriptors = (NSArray *)v52;

  if (!v5->_inputDescriptors)
  {
    v72 = (void *)MEMORY[0x24BDD1540];
    v73 = *MEMORY[0x24BDD0B88];
    v93[0] = *MEMORY[0x24BDD0BA0];
    v93[1] = CFSTR("ANSTDescriptorName");
    v94[0] = CFSTR("Inference descriptor input descriptors were not encoded.");
    objc_msgSend_name(v5, v54, v55);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v94[1] = v44;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v74, (uint64_t)v94, v93, 2);
LABEL_20:
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v72, v76, v73, 4865, v70);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_failWithError_(v4, v78, (uint64_t)v77);
LABEL_22:

    goto LABEL_23;
  }
  NSStringFromSelector(sel_outputDescriptors);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeArrayOfObjectsOfClasses_forKey_(v4, v57, (uint64_t)v37, v56);
  v58 = objc_claimAutoreleasedReturnValue();
  outputDescriptors = v5->_outputDescriptors;
  v5->_outputDescriptors = (NSArray *)v58;

  if (!v5->_outputDescriptors)
  {
    v72 = (void *)MEMORY[0x24BDD1540];
    v73 = *MEMORY[0x24BDD0B88];
    v91[0] = *MEMORY[0x24BDD0BA0];
    v91[1] = CFSTR("ANSTDescriptorName");
    v92[0] = CFSTR("Inference descriptor output descriptors were not encoded.");
    objc_msgSend_name(v5, v60, v61);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v92[1] = v44;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v75, (uint64_t)v92, v91, 2);
    goto LABEL_20;
  }
  v87 = 0;
  v62 = objc_msgSend__buildCategorizedDescriptorsCacheWithError_(v5, v60, (uint64_t)&v87);
  v63 = v87;
  v44 = v63;
  if ((v62 & 1) == 0)
  {
    v79 = (void *)MEMORY[0x24BDD1540];
    v80 = *MEMORY[0x24BDD0B88];
    v81 = *MEMORY[0x24BDD0BA0];
    v90[0] = CFSTR("Inference descriptor contains invalid input and/or output descriptors.");
    v89[0] = v81;
    v89[1] = CFSTR("ANSTDescriptorName");
    objc_msgSend_name(v5, v64, v65);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v89[2] = *MEMORY[0x24BDD1398];
    v90[1] = v70;
    v90[2] = v44;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v82, (uint64_t)v90, v89, 3);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v79, v83, v80, 4864, v77);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_failWithError_(v4, v85, (uint64_t)v84);

    goto LABEL_22;
  }

LABEL_15:
  v66 = v5;
LABEL_25:

  return v66;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (int64_t)assetType
{
  return self->_assetType;
}

- (NSString)e5FunctionName
{
  return self->_e5FunctionName;
}

- (NSArray)inputDescriptors
{
  return self->_inputDescriptors;
}

- (NSArray)outputDescriptors
{
  return self->_outputDescriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDescriptors, 0);
  objc_storeStrong((id *)&self->_inputDescriptors, 0);
  objc_storeStrong((id *)&self->_e5FunctionName, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_storeStrong((id *)&self->_outputPixelBufferDescriptors, 0);
  objc_storeStrong((id *)&self->_inputPixelBufferDescriptors, 0);
  objc_storeStrong((id *)&self->_outputTensorDescriptors, 0);
  objc_storeStrong((id *)&self->_inputTensorDescriptors, 0);
}

- (NSArray)allInputTensorDescriptors
{
  return (NSArray *)((uint64_t (*)(NSDictionary *, char *))MEMORY[0x24BEDD108])(self->_inputTensorDescriptors, sel_allValues);
}

- (NSArray)allOutputTensorDescriptors
{
  return (NSArray *)((uint64_t (*)(NSDictionary *, char *))MEMORY[0x24BEDD108])(self->_outputTensorDescriptors, sel_allValues);
}

- (id)inputTensorDescriptorNamed:(id)a3
{
  return (id)objc_msgSend_objectForKey_(self->_inputTensorDescriptors, a2, (uint64_t)a3);
}

- (id)outputTensorDescriptorNamed:(id)a3
{
  return (id)objc_msgSend_objectForKey_(self->_outputTensorDescriptors, a2, (uint64_t)a3);
}

- (NSArray)allInputPixelBufferDescriptors
{
  return (NSArray *)((uint64_t (*)(NSDictionary *, char *))MEMORY[0x24BEDD108])(self->_inputPixelBufferDescriptors, sel_allValues);
}

- (NSArray)allOutputPixelBufferDescriptors
{
  return (NSArray *)((uint64_t (*)(NSDictionary *, char *))MEMORY[0x24BEDD108])(self->_outputPixelBufferDescriptors, sel_allValues);
}

- (id)inputPixelBufferDescriptorNamed:(id)a3
{
  return (id)objc_msgSend_objectForKey_(self->_inputPixelBufferDescriptors, a2, (uint64_t)a3);
}

- (id)outputPixelBufferDescriptorNamed:(id)a3
{
  return (id)objc_msgSend_objectForKey_(self->_outputPixelBufferDescriptors, a2, (uint64_t)a3);
}

- (BOOL)requiresPostprocessing
{
  return 0;
}

- (id)newPostprocessorWithError:(id *)a3
{
  return 0;
}

- (NSString)espressoConfigurationName
{
  return 0;
}

@end
