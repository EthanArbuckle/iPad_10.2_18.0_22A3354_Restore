@implementation ANSTISPInferenceConfiguration

- (ANSTISPInferenceConfiguration)init
{
  ANSTISPInferenceConfiguration *result;

  result = (ANSTISPInferenceConfiguration *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

+ (id)new
{
  id result;

  result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (unint64_t)version
{
  void *v2;
  const char *v3;
  uint64_t v4;

  v2 = (void *)objc_opt_class();
  return objc_msgSend__version(v2, v3, v4);
}

+ (unint64_t)_version
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB8], CFSTR("A concrete implementation of +_version is required."), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)initForVersion:(unint64_t)a3 withError:(id *)a4
{
  ANSTISPInferenceConfiguration *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  void *v12;
  const char *v13;
  objc_super v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)ANSTISPInferenceConfiguration;
  v6 = -[ANSTISPInferenceConfiguration init](&v15, sel_init);
  if (v6 && (v7 = (void *)objc_opt_class(), objc_msgSend__version(v7, v8, v9) != a3))
  {
    if (a4)
    {
      v11 = (void *)MEMORY[0x24BDD1540];
      v16 = *MEMORY[0x24BDD0BA0];
      v17[0] = CFSTR("Mismatched version.");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v10, (uint64_t)v17, &v16, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v11, v13, (uint64_t)CFSTR("ANSTErrorDomain"), 14, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }
  else
  {
    a4 = v6;
  }

  return a4;
}

- (BOOL)isEqual:(id)a3
{
  ANSTISPInferenceConfiguration *v4;
  ANSTISPInferenceConfiguration *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  int isObjectTrackingEnabled;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  int isSegmentationEnabled;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  BOOL v31;

  v4 = (ANSTISPInferenceConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v31 = 1;
  }
  else if (v4
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
         && (v8 = objc_msgSend_version(self, v6, v7), v8 == objc_msgSend_version(v5, v9, v10))
         && (isObjectTrackingEnabled = objc_msgSend_isObjectTrackingEnabled(self, v11, v12),
             isObjectTrackingEnabled == objc_msgSend_isObjectTrackingEnabled(v5, v14, v15))
         && (isSegmentationEnabled = objc_msgSend_isSegmentationEnabled(self, v16, v17),
             isSegmentationEnabled == objc_msgSend_isSegmentationEnabled(v5, v19, v20))
         && (v23 = objc_msgSend_resolution(self, v21, v22), v23 == objc_msgSend_resolution(v5, v24, v25)))
  {
    v28 = objc_msgSend_frameRate(self, v26, v27);
    v31 = v28 == objc_msgSend_frameRate(v5, v29, v30);
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (unint64_t)hash
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t isObjectTrackingEnabled;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t isSegmentationEnabled;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  unint64_t v46;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = objc_msgSend_version(self, a2, v2);
  objc_msgSend_numberWithUnsignedInteger_(v4, v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_hash(v7, v8, v9);

  v11 = (void *)MEMORY[0x24BDD16E0];
  isObjectTrackingEnabled = objc_msgSend_isObjectTrackingEnabled(self, v12, v13);
  objc_msgSend_numberWithBool_(v11, v15, isObjectTrackingEnabled);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_hash(v16, v17, v18) ^ v10;

  v20 = (void *)MEMORY[0x24BDD16E0];
  isSegmentationEnabled = objc_msgSend_isSegmentationEnabled(self, v21, v22);
  objc_msgSend_numberWithBool_(v20, v24, isSegmentationEnabled);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_hash(v25, v26, v27);

  v29 = (void *)MEMORY[0x24BDD16E0];
  v32 = objc_msgSend_resolution(self, v30, v31);
  objc_msgSend_numberWithInteger_(v29, v33, v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v19 ^ v28 ^ objc_msgSend_hash(v34, v35, v36);

  v38 = (void *)MEMORY[0x24BDD16E0];
  v41 = objc_msgSend_frameRate(self, v39, v40);
  objc_msgSend_numberWithInteger_(v38, v42, v41);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v37 ^ objc_msgSend_hash(v43, v44, v45);

  return v46;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v6, (uint64_t)CFSTR("<%@ %p> {\n"), v5, self);

  v9 = objc_msgSend_version(self, v7, v8);
  ANSTISPInferenceVersionToNSString(v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v12, (uint64_t)CFSTR("  version %@\n"), v11);

  if (objc_msgSend_isObjectTrackingEnabled(self, v13, v14))
    objc_msgSend_appendFormat_(v3, v15, (uint64_t)CFSTR("  isObjectTrackingEnabled %@\n"), CFSTR("YES"));
  else
    objc_msgSend_appendFormat_(v3, v15, (uint64_t)CFSTR("  isObjectTrackingEnabled %@\n"), CFSTR("NO"));
  if (objc_msgSend_isSegmentationEnabled(self, v16, v17))
    objc_msgSend_appendFormat_(v3, v18, (uint64_t)CFSTR("  isSegmentationEnabled %@\n"), CFSTR("YES"));
  else
    objc_msgSend_appendFormat_(v3, v18, (uint64_t)CFSTR("  isSegmentationEnabled %@\n"), CFSTR("NO"));
  v21 = objc_msgSend_resolution(self, v19, v20);
  ANSTISPInferenceResolutionToNSString(v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v24, (uint64_t)CFSTR("  resolution %@\n"), v23);

  v27 = objc_msgSend_frameRate(self, v25, v26);
  ANSTISPInferenceFrameRateToNSString(v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v30, (uint64_t)CFSTR("  frameRate %@\n"), v29);

  objc_msgSend_appendFormat_(v3, v31, (uint64_t)CFSTR("  useE5 %d\n"), self->_useE5);
  objc_msgSend_appendString_(v3, v32, (uint64_t)CFSTR("}"));
  v35 = (void *)objc_msgSend_copy(v3, v33, v34);

  return v35;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_version(self, v8, v9);
  v12 = (void *)objc_msgSend_initForVersion_withError_(v7, v11, v10, 0);
  objc_msgSend_setUseE5_(v12, v13, self->_useE5);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  void *v11;
  const char *v12;
  _BOOL8 useE5;
  const char *v14;
  id v15;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  v8 = objc_msgSend_version(self, v6, v7);
  objc_msgSend_numberWithUnsignedInteger_(v4, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_version);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v12, (uint64_t)v10, v11);

  useE5 = self->_useE5;
  NSStringFromSelector(sel_useE5);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v5, v14, useE5, v15);

}

- (ANSTISPInferenceConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  ANSTISPInferenceConfiguration *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  objc_super v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_version);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v20 = (void *)MEMORY[0x24BDD1540];
    v21 = *MEMORY[0x24BDD0B88];
    v33 = *MEMORY[0x24BDD0BA0];
    v34[0] = CFSTR("ISP inference configuration version was not encoded.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v9, (uint64_t)v34, &v33, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v20, v23, v21, 4865, v22);
    goto LABEL_8;
  }
  v30.receiver = self;
  v30.super_class = (Class)ANSTISPInferenceConfiguration;
  self = -[ANSTISPInferenceConfiguration init](&v30, sel_init);
  if (self)
  {
    v12 = objc_msgSend_unsignedIntegerValue(v8, v10, v11);
    v13 = (void *)objc_opt_class();
    if (v12 == objc_msgSend__version(v13, v14, v15))
    {
      NSStringFromSelector(sel_useE5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      self->_useE5 = objc_msgSend_decodeBoolForKey_(v4, v18, (uint64_t)v17);

      goto LABEL_5;
    }
    v24 = (void *)MEMORY[0x24BDD1540];
    v25 = *MEMORY[0x24BDD0B88];
    v31 = *MEMORY[0x24BDD0BA0];
    v32 = CFSTR("Mismatched version.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v16, (uint64_t)&v32, &v31, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v24, v26, v25, 4864, v22);
LABEL_8:
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_failWithError_(v4, v28, (uint64_t)v27);

    v19 = 0;
    goto LABEL_9;
  }
LABEL_5:
  self = self;
  v19 = self;
LABEL_9:

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)useE5
{
  return self->_useE5;
}

- (void)setUseE5:(BOOL)a3
{
  self->_useE5 = a3;
}

+ (id)defaultConfigurationForVersion:(unint64_t)a3 withError:(id *)a4
{
  _ANSTISPInferenceConfigurationV1 *v5;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  if (a3 == 0x10000)
  {
    v5 = [_ANSTISPInferenceConfigurationV1 alloc];
    v7 = (void *)objc_msgSend_initForVersion_withError_(v5, v6, 0x10000, a4);
  }
  else
  {
    if (a4)
    {
      v8 = (void *)MEMORY[0x24BDD1540];
      v12 = *MEMORY[0x24BDD0BA0];
      v13[0] = CFSTR("Unrecognized version.");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v13, &v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v8, v10, (uint64_t)CFSTR("ANSTErrorDomain"), 14, v9);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v7 = 0;
  }
  return v7;
}

@end
