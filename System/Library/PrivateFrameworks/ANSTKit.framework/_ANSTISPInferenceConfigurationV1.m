@implementation _ANSTISPInferenceConfigurationV1

+ (unint64_t)_version
{
  return 0x10000;
}

- (id)initForVersion:(unint64_t)a3 withError:(id *)a4
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_ANSTISPInferenceConfigurationV1;
  result = -[ANSTISPInferenceConfiguration initForVersion:withError:](&v5, sel_initForVersion_withError_, a3, a4);
  if (result)
  {
    *((_BYTE *)result + 16) = 1;
    *((_BYTE *)result + 17) = 1;
    *((_QWORD *)result + 3) = 0;
    *((_QWORD *)result + 4) = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_ANSTISPInferenceConfigurationV1;
  result = -[ANSTISPInferenceConfiguration copyWithZone:](&v5, sel_copyWithZone_, a3);
  if (result)
  {
    *((_BYTE *)result + 16) = self->_objectTrackingEnabled;
    *((_BYTE *)result + 17) = self->_segmentationEnabled;
    *((_QWORD *)result + 3) = self->_resolution;
    *((_QWORD *)result + 4) = self->_frameRate;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t isObjectTrackingEnabled;
  const char *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t isSegmentationEnabled;
  const char *v17;
  void *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  void *v35;
  const char *v36;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)_ANSTISPInferenceConfigurationV1;
  v4 = a3;
  -[ANSTISPInferenceConfiguration encodeWithCoder:](&v37, sel_encodeWithCoder_, v4);
  v5 = (void *)MEMORY[0x24BDD16E0];
  isObjectTrackingEnabled = objc_msgSend_isObjectTrackingEnabled(self, v6, v7, v37.receiver, v37.super_class);
  objc_msgSend_numberWithBool_(v5, v9, isObjectTrackingEnabled);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isObjectTrackingEnabled);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v10, v11);

  v13 = (void *)MEMORY[0x24BDD16E0];
  isSegmentationEnabled = objc_msgSend_isSegmentationEnabled(self, v14, v15);
  objc_msgSend_numberWithBool_(v13, v17, isSegmentationEnabled);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isSegmentationEnabled);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)v18, v19);

  v21 = (void *)MEMORY[0x24BDD16E0];
  v24 = objc_msgSend_resolution(self, v22, v23);
  objc_msgSend_numberWithInteger_(v21, v25, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_resolution);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v28, (uint64_t)v26, v27);

  v29 = (void *)MEMORY[0x24BDD16E0];
  v32 = objc_msgSend_frameRate(self, v30, v31);
  objc_msgSend_numberWithInteger_(v29, v33, v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_frameRate);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v36, (uint64_t)v34, v35);

}

- (_ANSTISPInferenceConfigurationV1)initWithCoder:(id)a3
{
  id v4;
  _ANSTISPInferenceConfigurationV1 *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  _ANSTISPInferenceConfigurationV1 *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  void *v43;
  uint64_t v44;
  const char *v45;
  void *v46;
  const char *v47;
  void *v48;
  uint64_t v49;
  const char *v50;
  void *v51;
  const char *v52;
  objc_super v54;
  uint64_t v55;
  const __CFString *v56;
  uint64_t v57;
  const __CFString *v58;
  uint64_t v59;
  const __CFString *v60;
  uint64_t v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)_ANSTISPInferenceConfigurationV1;
  v5 = -[ANSTISPInferenceConfiguration initWithCoder:](&v54, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_7;
  v6 = objc_opt_class();
  NSStringFromSelector(sel_isObjectTrackingEnabled);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v31 = (void *)MEMORY[0x24BDD1540];
    v32 = *MEMORY[0x24BDD0B88];
    v61 = *MEMORY[0x24BDD0BA0];
    v62[0] = CFSTR("-isObjectTrackingEnabled was not encoded.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v10, (uint64_t)v62, &v61, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v31, v34, v32, 4865, v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_failWithError_(v4, v36, (uint64_t)v35);

LABEL_14:
    v30 = 0;
    goto LABEL_15;
  }
  v5->_objectTrackingEnabled = objc_msgSend_BOOLValue(v9, v10, v11);
  v12 = objc_opt_class();
  NSStringFromSelector(sel_isSegmentationEnabled);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v37 = (void *)MEMORY[0x24BDD1540];
    v38 = *MEMORY[0x24BDD0B88];
    v59 = *MEMORY[0x24BDD0BA0];
    v60 = CFSTR("-isSegmentationEnabled was not encoded.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v16, (uint64_t)&v60, &v59, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v37, v40, v38, 4865, v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_failWithError_(v4, v42, (uint64_t)v41);

LABEL_13:
    goto LABEL_14;
  }
  v5->_segmentationEnabled = objc_msgSend_BOOLValue(v15, v16, v17);
  v18 = objc_opt_class();
  NSStringFromSelector(sel_resolution);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v18, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    v43 = (void *)MEMORY[0x24BDD1540];
    v44 = *MEMORY[0x24BDD0B88];
    v57 = *MEMORY[0x24BDD0BA0];
    v58 = CFSTR("-resolution was not encoded.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v22, (uint64_t)&v58, &v57, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v43, v45, v44, 4865, v27);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_failWithError_(v4, v47, (uint64_t)v46);
LABEL_12:

    goto LABEL_13;
  }
  v5->_resolution = objc_msgSend_integerValue(v21, v22, v23);
  v24 = objc_opt_class();
  NSStringFromSelector(sel_frameRate);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v24, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
    v48 = (void *)MEMORY[0x24BDD1540];
    v49 = *MEMORY[0x24BDD0B88];
    v55 = *MEMORY[0x24BDD0BA0];
    v56 = CFSTR("-frameRate was not encoded.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v28, (uint64_t)&v56, &v55, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v48, v50, v49, 4865, v46);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_failWithError_(v4, v52, (uint64_t)v51);

    goto LABEL_12;
  }
  v5->_frameRate = objc_msgSend_integerValue(v27, v28, v29);

LABEL_7:
  v30 = v5;
LABEL_15:

  return v30;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isObjectTrackingEnabled
{
  return self->_objectTrackingEnabled;
}

- (void)setObjectTrackingEnabled:(BOOL)a3
{
  self->_objectTrackingEnabled = a3;
}

- (BOOL)isSegmentationEnabled
{
  return self->_segmentationEnabled;
}

- (void)setSegmentationEnabled:(BOOL)a3
{
  self->_segmentationEnabled = a3;
}

- (int64_t)resolution
{
  return self->_resolution;
}

- (void)setResolution:(int64_t)a3
{
  self->_resolution = a3;
}

- (int64_t)frameRate
{
  return self->_frameRate;
}

- (void)setFrameRate:(int64_t)a3
{
  self->_frameRate = a3;
}

@end
