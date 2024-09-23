@implementation ANSTISPInferenceDescriptor

- (ANSTISPInferenceDescriptor)initWithName:(id)a3 version:(unint64_t)a4 assetURL:(id)a5 assetType:(int64_t)a6 e5FunctionName:(id)a7 inputDescriptors:(id)a8 outputDescriptors:(id)a9 error:(id *)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  const char *v20;
  ANSTISPInferenceDescriptor *result;

  v15 = a3;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  result = (ANSTISPInferenceDescriptor *)objc_msgSend_doesNotRecognizeSelector_(self, v20, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTISPInferenceDescriptor)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  const char *v20;
  int InputDescriptors_outputDescriptors_forConfiguration_withError;
  id v22;
  const char *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  ANSTISPInferenceDescriptor *v27;
  ANSTISPInferenceDescriptor *v28;
  ANSTISPInferenceDescriptor *v29;
  objc_super v31;
  id v32;
  id v33;

  v6 = a3;
  if (objc_msgSend_useE5(v6, v7, v8))
    v11 = CFSTR("main");
  else
    v11 = 0;
  v12 = (void *)objc_msgSend_copy(v6, v9, v10);

  v13 = (void *)objc_opt_class();
  objc_msgSend__nameForConfiguration_withError_(v13, v14, (uint64_t)v12, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    v29 = 0;
    v18 = 0;
LABEL_12:
    v22 = 0;
    v25 = 0;
    goto LABEL_14;
  }
  v16 = (void *)objc_opt_class();
  objc_msgSend__assetURLForConfiguration_withError_(v16, v17, (uint64_t)v12, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    v29 = 0;
    goto LABEL_12;
  }
  v19 = (void *)objc_opt_class();
  v32 = 0;
  v33 = 0;
  InputDescriptors_outputDescriptors_forConfiguration_withError = objc_msgSend__getInputDescriptors_outputDescriptors_forConfiguration_withError_(v19, v20, (uint64_t)&v33, &v32, v12, a4);
  v22 = v33;
  v25 = v32;
  if (InputDescriptors_outputDescriptors_forConfiguration_withError)
  {
    v26 = objc_msgSend_version(v12, v23, v24);
    v31.receiver = self;
    v31.super_class = (Class)ANSTISPInferenceDescriptor;
    v27 = -[ANSTInferenceDescriptor initWithName:version:assetURL:assetType:e5FunctionName:inputDescriptors:outputDescriptors:error:](&v31, sel_initWithName_version_assetURL_assetType_e5FunctionName_inputDescriptors_outputDescriptors_error_, v15, v26, v18, 2, v11, v22, v25, a4);
    v28 = v27;
    if (v27)
      objc_storeStrong((id *)&v27->_configuration, v12);
    self = v28;
    v29 = self;
  }
  else
  {
    v29 = 0;
  }
LABEL_14:

  return v29;
}

+ (id)_assetURLForConfiguration:(id)a3 withError:(id *)a4
{
  id v4;
  const char *v5;
  id v6;

  v4 = a3;
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], v5, *MEMORY[0x24BDBCAB8], CFSTR("A concrete implementation of +_version is required."), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

+ (BOOL)_getInputDescriptors:(id *)a3 outputDescriptors:(id *)a4 forConfiguration:(id)a5 withError:(id *)a6
{
  id v6;
  const char *v7;
  id v8;

  v6 = a5;
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], v7, *MEMORY[0x24BDBCAB8], CFSTR("A concrete implementation of +_version is required."), 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v8);
}

- (BOOL)isEqual:(id)a3
{
  ANSTISPInferenceDescriptor *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  char isEqual;
  objc_super v14;

  v4 = (ANSTISPInferenceDescriptor *)a3;
  v14.receiver = self;
  v14.super_class = (Class)ANSTISPInferenceDescriptor;
  if (!-[ANSTInferenceDescriptor isEqual:](&v14, sel_isEqual_, v4))
    goto LABEL_6;
  if (v4 == self)
  {
    isEqual = 1;
    goto LABEL_8;
  }
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_configuration(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_configuration(v4, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v7, v11, (uint64_t)v10);

  }
  else
  {
LABEL_6:
    isEqual = 0;
  }
LABEL_8:

  return isEqual;
}

- (unint64_t)hash
{
  unint64_t v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  unint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ANSTISPInferenceDescriptor;
  v3 = -[ANSTInferenceDescriptor hash](&v11, sel_hash);
  objc_msgSend_configuration(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v6, v7, v8) ^ v3;

  return v9;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v11.receiver = self;
  v11.super_class = (Class)ANSTISPInferenceDescriptor;
  -[ANSTInferenceDescriptor debugDescription](&v11, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_debugDescription(self->_configuration, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@\n%@"), v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ANSTISPInferenceDescriptor;
  v6 = -[ANSTInferenceDescriptor copyWithZone:](&v10, sel_copyWithZone_, a3);
  if (v6)
  {
    v7 = objc_msgSend_copy(self->_configuration, v4, v5);
    v8 = (void *)v6[12];
    v6[12] = v7;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ANSTISPInferenceDescriptor;
  v4 = a3;
  -[ANSTInferenceDescriptor encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  objc_msgSend_configuration(self, v5, v6, v10.receiver, v10.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_configuration);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v7, v8);

}

- (ANSTISPInferenceDescriptor)initWithCoder:(id)a3
{
  id v4;
  ANSTISPInferenceDescriptor *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  ANSTISPInferenceConfiguration *configuration;
  const char *v11;
  ANSTISPInferenceDescriptor *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  objc_super v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ANSTISPInferenceDescriptor;
  v5 = -[ANSTInferenceDescriptor initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_3;
  v6 = objc_opt_class();
  NSStringFromSelector(sel_configuration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v6, v7);
  v9 = objc_claimAutoreleasedReturnValue();
  configuration = v5->_configuration;
  v5->_configuration = (ANSTISPInferenceConfiguration *)v9;

  if (!v5->_configuration)
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BDD0B88];
    v21 = *MEMORY[0x24BDD0BA0];
    v22[0] = CFSTR("ISP inference descriptor configuration was not encoded.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v11, (uint64_t)v22, &v21, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v13, v16, v14, 4865, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_failWithError_(v4, v18, (uint64_t)v17);

    v12 = 0;
  }
  else
  {
LABEL_3:
    v12 = v5;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ANSTISPInferenceConfiguration)configuration
{
  return self->_configuration;
}

- (ANSTTensorDescriptor)outputSalientPersonPriorMaskDescriptor
{
  return self->_outputSalientPersonPriorMaskDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputSalientPersonPriorMaskDescriptor, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (BOOL)requiresPostprocessing
{
  return 1;
}

- (id)newPostprocessorWithError:(id *)a3
{
  id v3;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB8], CFSTR("A concrete implementation of +_version is required."), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)e5DescriptorWithConfiguration:(id)a3 error:(id *)a4
{
  void *v6;
  const char *v7;
  const char *v8;
  void *v9;

  v6 = (void *)objc_msgSend_copy(a3, a2, (uint64_t)a3);
  objc_msgSend_setUseE5_(v6, v7, 1);
  objc_msgSend__descriptorWithConfiguration_error_(a1, v8, (uint64_t)v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_descriptorWithConfiguration:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  const char *v13;
  _ANSTISPInferenceDescriptorV1 *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (objc_msgSend_resolution(v5, v6, v7) == 1)
  {
    if (a4)
    {
      v10 = (void *)MEMORY[0x24BDD1540];
      v21 = *MEMORY[0x24BDD0BA0];
      v22[0] = CFSTR("Resolution 1024x576 has been deprecated. Please stop using it.");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v8, (uint64_t)v22, &v21, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v10, v12, (uint64_t)CFSTR("ANSTErrorDomain"), 2, v11);
LABEL_8:
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }
  else if (objc_msgSend_version(v5, v8, v9) == 0x10000)
  {
    v14 = [_ANSTISPInferenceDescriptorV1 alloc];
    a4 = (id *)objc_msgSend_initWithConfiguration_error_(v14, v15, (uint64_t)v5, a4);
  }
  else if (a4)
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v19 = *MEMORY[0x24BDD0BA0];
    v20 = CFSTR("Unrecognized version.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v13, (uint64_t)&v20, &v19, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v16, v17, (uint64_t)CFSTR("ANSTErrorDomain"), 14, v11);
    goto LABEL_8;
  }

  return a4;
}

@end
