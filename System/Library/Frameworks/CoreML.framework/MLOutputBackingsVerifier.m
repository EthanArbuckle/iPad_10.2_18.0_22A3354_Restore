@implementation MLOutputBackingsVerifier

- (MLOutputBackingsVerifier)initWithOutputDescriptions:(id)a3
{
  id v5;
  MLOutputBackingsVerifier *v6;
  MLOutputBackingsVerifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLOutputBackingsVerifier;
  v6 = -[MLOutputBackingsVerifier init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_outputDescriptions, a3);

  return v7;
}

- (BOOL)verifyOutputBackings:(id)a3 predictionUsesBatch:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[16];
  _BYTE v26[128];
  uint64_t v27;
  _QWORD v28[3];

  v6 = a4;
  v28[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v6)
    goto LABEL_9;
  if (!dyld_program_sdk_at_least())
  {
    LOBYTE(a5) = 1;
    goto LABEL_20;
  }
  if (!objc_msgSend(v8, "count"))
  {
LABEL_9:
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = v8;
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (!v13)
    {
LABEL_17:
      LOBYTE(a5) = 1;
      goto LABEL_18;
    }
    v14 = *(_QWORD *)v22;
LABEL_11:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v14)
        objc_enumerationMutation(v11);
      v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v15);
      -[MLOutputBackingsVerifier outputDescriptions](self, "outputDescriptions", (_QWORD)v21);
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v17, "objectForKeyedSubscript:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "objectForKeyedSubscript:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v17) = -[MLOutputBackingsVerifier _verifyOutputBacking:forFeature:error:](self, "_verifyOutputBacking:forFeature:error:", v19, v18, a5);

      if ((v17 & 1) == 0)
        break;
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v13)
          goto LABEL_11;
        goto LABEL_17;
      }
    }
LABEL_8:
    LOBYTE(a5) = 0;
LABEL_18:

    goto LABEL_20;
  }
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19C486000, v9, OS_LOG_TYPE_ERROR, "The output backing is not supported in a batch prediction.", buf, 2u);
  }

  if (a5)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The output backing is not supported in a batch prediction."));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v28[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v12);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
LABEL_20:

  return (char)a5;
}

- (BOOL)_verifyOutputBacking:(id)a3 forFeature:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  BOOL v10;
  CFTypeID v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = -[MLOutputBackingsVerifier _verifyMultiArrayOutputBacking:forFeature:error:](self, "_verifyMultiArrayOutputBacking:forFeature:error:", v8, v9, a5);
LABEL_3:
    LOBYTE(a5) = v10;
    goto LABEL_13;
  }
  v11 = CFGetTypeID(v8);
  if (v11 == CVPixelBufferGetTypeID())
  {
    if (dyld_program_sdk_at_least())
    {
      v10 = -[MLOutputBackingsVerifier _verifyPixelBufferOutputBacking:forFeature:error:](self, "_verifyPixelBufferOutputBacking:forFeature:error:", v8, v9, a5);
      goto LABEL_3;
    }
LABEL_12:
    LOBYTE(a5) = 1;
    goto LABEL_13;
  }
  if (!dyld_program_sdk_at_least())
    goto LABEL_12;
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v9, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v23 = v19;
    _os_log_error_impl(&dword_19C486000, v12, OS_LOG_TYPE_ERROR, "The output backing object for %@ must be either CVPixelBuffer or MLMultiArray.", buf, 0xCu);

  }
  if (a5)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2D50];
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("The output backing object for %@ must be either CVPixelBuffer or MLMultiArray."), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v17);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a5) = 0;
  }
LABEL_13:

  return (char)a5;
}

- (BOOL)_verifyMultiArrayOutputBacking:(id)a3 forFeature:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "multiArrayConstraint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v7, "shape");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isAllowedShape:error:", v10, a5);

    if ((v11 & 1) == 0)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v21 = v19;
        _os_log_error_impl(&dword_19C486000, v16, OS_LOG_TYPE_ERROR, "Output backing for %@ is not compatible with the model's output feature description.", buf, 0xCu);

      }
      goto LABEL_14;
    }
    v12 = objc_msgSend(v7, "pixelBuffer");
    if (!v12 || !objc_msgSend(v7, "backingPixelBufferWasLocked"))
    {
      LOBYTE(a5) = 1;
      goto LABEL_16;
    }
    if (a5)
    {
      objc_msgSend(v8, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("The underlying pixel buffer (%p) used in the output backing MLMultiArray object for feature %@ has been locked. The output backing cannot use such an object. Typically, the error occurs when the caller has invoked MLMultiArray's data accessing properties before the inference, or they used a locked pixel buffer to initialize the multi array. Use a newly created pixel buffer and MLMultiArray to avoid this error."), v12, v13);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_14:
      LOBYTE(a5) = 0;
    }
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v18;
      _os_log_error_impl(&dword_19C486000, v14, OS_LOG_TYPE_ERROR, "Output feature %@ doesn't have a description for the MultiArray constraints.", buf, 0xCu);

    }
    if (a5)
    {
      objc_msgSend(v8, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Output feature %@ doesn't support an output backing."), v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    }
  }
LABEL_16:

  return (char)a5;
}

- (BOOL)_verifyPixelBufferOutputBacking:(__CVBuffer *)a3 forFeature:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(v7, "imageConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (CVPixelBufferGetPixelFormatType(a3) == 32
      && (objc_msgSend(v8, "pixelType") == 20 || objc_msgSend(v8, "pixelType") == 30))
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        +[MLImageConstraint stringForImagePixelType:](MLImageConstraint, "stringForImagePixelType:", objc_msgSend(v8, "pixelType"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v29 = v22;
        _os_log_error_impl(&dword_19C486000, v9, OS_LOG_TYPE_ERROR, "%@ image output feature must use a pixel buffer of kCVPixelFormatType_32BGRA as the output backing, but kCVPixelFormatType_32ARGB pixel buffer was specified.", buf, 0xCu);

      }
      if (a5)
      {
        v10 = (void *)MEMORY[0x1E0CB35C8];
        v24 = *MEMORY[0x1E0CB2D50];
        v11 = (void *)MEMORY[0x1E0CB3940];
        +[MLImageConstraint stringForImagePixelType:](MLImageConstraint, "stringForImagePixelType:", objc_msgSend(v8, "pixelType"));
        v12 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ image output feature must use a pixel buffer of kCVPixelFormatType_32BGRA as the output backing, but kCVPixelFormatType_32ARGB pixel buffer was specified."), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v14);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
        LOBYTE(a5) = 0;
      }
    }
    else
    {
      if ((objc_msgSend(v8, "allowsPixelBuffer:error:", a3, a5) & 1) == 0)
      {
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v7, "name");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v29 = v23;
          _os_log_error_impl(&dword_19C486000, v12, OS_LOG_TYPE_ERROR, "Output backing for %@ is not compatible with the model's output feature description.", buf, 0xCu);

        }
        goto LABEL_17;
      }
      LOBYTE(a5) = 1;
    }
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v29 = v21;
      _os_log_error_impl(&dword_19C486000, v15, OS_LOG_TYPE_ERROR, "Output feature %@ doesn't have a description for the image constraints.", buf, 0xCu);

    }
    if (a5)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "name");
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("Output feature %@ doesn't have a description for the image constraints."), v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v19);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_17;
    }
  }

  return (char)a5;
}

- (NSDictionary)outputDescriptions
{
  return self->_outputDescriptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDescriptions, 0);
}

@end
