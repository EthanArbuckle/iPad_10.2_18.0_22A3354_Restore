@implementation AXSSMotionTrackingCameraInput

+ (id)captureDeviceForMotionTrackingInput:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  objc_msgSend(v3, "captureDeviceUniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v5 = (void *)getAVCaptureDeviceClass_softClass;
    v13 = getAVCaptureDeviceClass_softClass;
    if (!getAVCaptureDeviceClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getAVCaptureDeviceClass_block_invoke;
      v9[3] = &unk_1E5F99048;
      v9[4] = &v10;
      __getAVCaptureDeviceClass_block_invoke((uint64_t)v9);
      v5 = (void *)v11[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v10, 8);
    objc_msgSend(v6, "deviceWithUniqueID:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)motionTrackingCameraInputWithAVCaptureDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  AXSSMotionTrackingCameraInput *v13;
  _Unwind_Exception *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a3;
  objc_msgSend(v3, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v6 = (_QWORD *)getAVMediaTypeVideoSymbolLoc_ptr;
  v19 = getAVMediaTypeVideoSymbolLoc_ptr;
  if (!getAVMediaTypeVideoSymbolLoc_ptr)
  {
    v7 = (void *)AVFoundationLibrary();
    v6 = dlsym(v7, "AVMediaTypeVideo");
    v17[3] = (uint64_t)v6;
    getAVMediaTypeVideoSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v16, 8);
  if (!v6)
  {
    v15 = (_Unwind_Exception *)+[AXSSMotionTrackingCameraInput motionTrackingCameraInputWithAVCaptureDevice:].cold.1();
    _Block_object_dispose(&v16, 8);
    _Unwind_Resume(v15);
  }
  if (objc_msgSend(v3, "hasMediaType:", *v6, v16)
    && (getAVMediaTypeMetadataObject(),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v3, "hasMediaType:", v8),
        v8,
        (v9 & 1) != 0))
  {
    v10 = 3;
  }
  else
  {
    getAVMediaTypeMetadataObject();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v3, "hasMediaType:", v11);

    v10 = v12;
  }
  if (objc_msgSend(v4, "length"))
    v13 = -[AXSSMotionTrackingCameraInput initWithCaptureDeviceUniqueID:name:isBuiltIn:trackingType:]([AXSSMotionTrackingCameraInput alloc], "initWithCaptureDeviceUniqueID:name:isBuiltIn:trackingType:", v4, v5, 1, v10);
  else
    v13 = 0;

  return v13;
}

- (AXSSMotionTrackingCameraInput)initWithCaptureDeviceUniqueID:(id)a3 name:(id)a4 isBuiltIn:(BOOL)a5 trackingType:(unint64_t)a6
{
  id v10;
  id v11;
  AXSSMotionTrackingCameraInput *v12;
  uint64_t v13;
  NSString *captureDeviceUniqueID;
  uint64_t v15;
  NSString *name;
  AXSSMotionTrackingCameraInput *v17;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  if (objc_msgSend(v10, "length"))
  {
    v19.receiver = self;
    v19.super_class = (Class)AXSSMotionTrackingCameraInput;
    v12 = -[AXSSMotionTrackingInput init](&v19, sel_init);
    if (v12)
    {
      v13 = objc_msgSend(v10, "copy");
      captureDeviceUniqueID = v12->_captureDeviceUniqueID;
      v12->_captureDeviceUniqueID = (NSString *)v13;

      v15 = objc_msgSend(v11, "copy");
      name = v12->_name;
      v12->_name = (NSString *)v15;

      v12->_isBuiltIn = a5;
      v12->_trackingType = a6;
    }
    self = v12;
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[AXSSMotionTrackingCameraInput captureDeviceUniqueID](self, "captureDeviceUniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AXSSMotionTrackingCameraInput captureDeviceUniqueID](self, "captureDeviceUniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_captureDeviceUniqueID);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", v5, v6);

  }
  -[AXSSMotionTrackingCameraInput name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AXSSMotionTrackingCameraInput name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_name);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", v8, v9);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXSSMotionTrackingCameraInput isBuiltIn](self, "isBuiltIn"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isBuiltIn);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v10, v11);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AXSSMotionTrackingCameraInput trackingType](self, "trackingType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_trackingType);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v12, v13);

}

- (AXSSMotionTrackingCameraInput)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  AXSSMotionTrackingCameraInput *v19;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_captureDeviceUniqueID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_name);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  NSStringFromSelector(sel_isBuiltIn);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  v15 = objc_opt_class();
  NSStringFromSelector(sel_trackingType);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "integerValue");
  v19 = -[AXSSMotionTrackingCameraInput initWithCaptureDeviceUniqueID:name:isBuiltIn:trackingType:](self, "initWithCaptureDeviceUniqueID:name:isBuiltIn:trackingType:", v7, v10, v14, v18);

  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)AXSSMotionTrackingCameraInput;
  -[AXSSMotionTrackingCameraInput description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSMotionTrackingCameraInput captureDeviceUniqueID](self, "captureDeviceUniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSMotionTrackingCameraInput name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%@, %@, %d>"), v4, v5, v6, -[AXSSMotionTrackingCameraInput isBuiltIn](self, "isBuiltIn"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)plistDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)AXSSMotionTrackingCameraInput;
  -[AXSSMotionTrackingInput plistDictionary](&v15, sel_plistDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    objc_msgSend(v3, "addEntriesFromDictionary:", v4);
  -[AXSSMotionTrackingCameraInput captureDeviceUniqueID](self, "captureDeviceUniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_captureDeviceUniqueID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v6);

  -[AXSSMotionTrackingCameraInput name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_name);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXSSMotionTrackingCameraInput isBuiltIn](self, "isBuiltIn"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isBuiltIn);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AXSSMotionTrackingCameraInput trackingType](self, "trackingType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_trackingType);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v12);

  v13 = (void *)objc_msgSend(v3, "copy");
  return v13;
}

- (AXSSMotionTrackingCameraInput)initWithPlistDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  AXSSMotionTrackingCameraInput *v16;

  v4 = a3;
  NSStringFromSelector(sel_captureDeviceUniqueID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_name);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "length"))
    v9 = v8;
  else
    v9 = 0;
  NSStringFromSelector(sel_isBuiltIn);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = objc_msgSend(v11, "BOOLValue");
  else
    v12 = 0;
  NSStringFromSelector(sel_trackingType);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = objc_msgSend(v14, "unsignedIntegerValue");
  else
    v15 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "length"))
  {
    self = -[AXSSMotionTrackingCameraInput initWithCaptureDeviceUniqueID:name:isBuiltIn:trackingType:](self, "initWithCaptureDeviceUniqueID:name:isBuiltIn:trackingType:", v6, v9, v12, v15);
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)supportsExpressions
{
  return 1;
}

- (BOOL)isCamera
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)trackingType
{
  return self->_trackingType;
}

- (void)setTrackingType:(unint64_t)a3
{
  self->_trackingType = a3;
}

- (NSString)captureDeviceUniqueID
{
  return self->_captureDeviceUniqueID;
}

- (void)setCaptureDeviceUniqueID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isBuiltIn
{
  return self->_isBuiltIn;
}

- (void)setIsBuiltIn:(BOOL)a3
{
  self->_isBuiltIn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureDeviceUniqueID, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (uint64_t)motionTrackingCameraInputWithAVCaptureDevice:.cold.1()
{
  dlerror();
  abort_report_np();
  return __getAVCaptureDeviceClass_block_invoke_cold_1();
}

@end
