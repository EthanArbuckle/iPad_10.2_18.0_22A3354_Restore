@implementation MADCoreMLRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADCoreMLRequest)initWithModelURL:(id)a3 error:(id *)a4
{
  id v6;
  MADCoreMLRequest *v7;
  MADCoreMLRequest *v8;
  uint64_t v9;
  NSData *extensionData;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MADCoreMLRequest;
  v7 = -[MADCoreMLRequest init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_modelURL, a3);
    -[MADCoreMLRequest _extensionData](v8, "_extensionData");
    v9 = objc_claimAutoreleasedReturnValue();
    extensionData = v8->_extensionData;
    v8->_extensionData = (NSData *)v9;

  }
  return v8;
}

+ (id)requestWithModelURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithModelURL:error:", v6, a4);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MADCoreMLRequest;
  -[MADRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_modelURL, CFSTR("ModelURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_extensionData, CFSTR("ModelURLExtensionData"));

}

- (MADCoreMLRequest)initWithCoder:(id)a3
{
  id v4;
  MADCoreMLRequest *v5;
  uint64_t v6;
  NSURL *modelURL;
  uint64_t v8;
  NSData *extensionData;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADCoreMLRequest;
  v5 = -[MADRequest initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ModelURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    modelURL = v5->_modelURL;
    v5->_modelURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ModelURLExtensionData"));
    v8 = objc_claimAutoreleasedReturnValue();
    extensionData = v5->_extensionData;
    v5->_extensionData = (NSData *)v8;

  }
  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL description](self->_modelURL, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_extensionData
{
  NSURL **p_modelURL;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[MADCoreMLRequest _extensionData].cold.3((uint64_t)self);
  p_modelURL = &self->_modelURL;
  -[NSURL path](self->_modelURL, "path");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "UTF8String");
  v5 = (void *)sandbox_extension_issue_file();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    free(v5);
    if (objc_msgSend(v6, "length"))
    {
      v7 = (void *)MEMORY[0x1E0C99D50];
      v8 = objc_retainAutorelease(v6);
      objc_msgSend(v7, "dataWithBytes:length:", objc_msgSend(v8, "UTF8String"), strlen((const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String")) + 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[MADCoreMLRequest _extensionData].cold.2((uint64_t)p_modelURL, v17, v18, v19, v20, v21, v22, v23);
      v9 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[MADCoreMLRequest _extensionData].cold.1((uint64_t)p_modelURL, v10, v11, v12, v13, v14, v15, v16);
    v9 = 0;
  }
  return v9;
}

- (void)consumeSandboxExtension
{
  OUTLINED_FUNCTION_0(&dword_1D461A000, MEMORY[0x1E0C81028], a3, "[MADCoreMLRequest] Missing sandbox extension data", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_extensionData, 0);
}

- (void)_extensionData
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = 138412290;
  v3 = v1;
  _os_log_debug_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADCoreMLRequest] Getting sandbox extension - %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

@end
