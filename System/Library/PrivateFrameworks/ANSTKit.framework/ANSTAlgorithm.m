@implementation ANSTAlgorithm

+ (id)new
{
  id result;

  result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTAlgorithm)init
{
  ANSTAlgorithm *result;

  result = (ANSTAlgorithm *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
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
  unint64_t result;

  result = objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

+ (Class)_concreteClassOfVersion:(unint64_t)a3
{
  return 0;
}

- (ANSTAlgorithm)initWithConfiguration:(id)a3
{
  id v4;
  ANSTAlgorithm *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  const char *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ANSTAlgorithm;
  v5 = -[ANSTAlgorithm init](&v19, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_class();
    v9 = objc_msgSend_version(v4, v7, v8);
    v11 = objc_msgSend__concreteClassOfVersion_(v6, v10, v9);
    if (v11)
    {
      v12 = (objc_class *)v11;
      v13 = (void *)objc_opt_class();
      if ((objc_msgSend_isSubclassOfClass_(v13, v14, (uint64_t)v12) & 1) == 0)
      {
        v15 = [v12 alloc];
        v17 = objc_msgSend_initWithConfiguration_(v15, v16, (uint64_t)v4);

        v5 = (ANSTAlgorithm *)v17;
      }
    }
  }

  return v5;
}

- (BOOL)prepareWithError:(id *)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;

  v4 = (void *)objc_opt_class();
  v6 = objc_msgSend_methodForSelector_(v4, v5, (uint64_t)sel__version);
  v8 = objc_msgSend_methodForSelector_(ANSTAlgorithm, v7, (uint64_t)sel__version);
  v10 = v8;
  if (a3 && v6 == v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v9, (uint64_t)CFSTR("ANSTErrorDomain"), 1, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6 != v10;
}

- (__CVBuffer)createPixelBuffer:(unsigned int)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  const __CFDictionary *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __CVBuffer *v24;
  CVPixelBufferRef v26;
  _QWORD v27[4];
  _QWORD v28[5];

  v7 = *(_QWORD *)&a3;
  v28[4] = *MEMORY[0x24BDAC8D0];
  v27[0] = *MEMORY[0x24BDC5708];
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], a2, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v8;
  v27[1] = *MEMORY[0x24BDC5650];
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v10;
  v27[2] = *MEMORY[0x24BDC56B8];
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = *MEMORY[0x24BDC5668];
  v28[2] = v12;
  v28[3] = MEMORY[0x24BDBD1B8];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v13, (uint64_t)v28, v27, 4);
  v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v26 = 0;
  v15 = CVPixelBufferCreate(0, a4, a5, v7, v14, &v26);
  if ((_DWORD)v15)
  {
    v16 = v15;
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_235910E40(v16, v17, v18, v19, v20, v21, v22, v23);

    v24 = 0;
  }
  else
  {
    v24 = v26;
  }

  return v24;
}

- (__CVPixelBufferPool)pixelBufferPoolCreateWithMinCapacity:(unint64_t)a3 width:(unint64_t)a4 height:(unint64_t)a5 pixelFormat:(unsigned int)a6
{
  uint64_t v6;
  void *v9;
  const char *v10;
  const __CFDictionary *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  const __CFDictionary *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __CVPixelBufferPool *v29;
  CVPixelBufferPoolRef v31;
  _QWORD v32[4];
  _QWORD v33[4];
  uint64_t v34;
  _QWORD v35[2];

  v6 = *(_QWORD *)&a6;
  v35[1] = *MEMORY[0x24BDAC8D0];
  v31 = 0;
  v34 = *MEMORY[0x24BDC56F0];
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], a2, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v9;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v10, (uint64_t)v35, &v34, 1);
  v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v32[0] = *MEMORY[0x24BDC5708];
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v12, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v13;
  v32[1] = *MEMORY[0x24BDC5650];
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v14, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v15;
  v32[2] = *MEMORY[0x24BDC56B8];
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v16, v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = *MEMORY[0x24BDC5668];
  v33[2] = v17;
  v33[3] = MEMORY[0x24BDBD1B8];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v18, (uint64_t)v33, v32, 4);
  v19 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v20 = CVPixelBufferPoolCreate(0, v11, v19, &v31);
  if ((_DWORD)v20)
  {
    v21 = v20;
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_235910EA8(v21, v22, v23, v24, v25, v26, v27, v28);

    v29 = 0;
  }
  else
  {
    v29 = v31;
  }

  return v29;
}

@end
