@implementation _INURLImage

- (id)_copyWithSubclass:(Class)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_INURLImage;
  v4 = -[INImage _copyWithSubclass:](&v10, sel__copyWithSubclass_, a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[_INURLImage imageURL](self, "imageURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setUri:", v6);

  }
  else
  {
    v5 = 0;
  }
  if (v5)
    v7 = v5;
  else
    v7 = v4;
  v8 = v7;

  return v8;
}

- (id)_identifier
{
  void *v2;
  void *v3;

  -[_INURLImage imageURL](self, "imageURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)_setUri:(id)a3
{
  NSURL **p_imageURL;
  id v5;

  p_imageURL = &self->_imageURL;
  v5 = a3;
  if ((-[NSURL isEqual:](*p_imageURL, "isEqual:") & 1) == 0)
    objc_storeStrong((id *)p_imageURL, a3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionData, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_INURLImage;
  v4 = a3;
  -[INImage encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageURL, CFSTR("imageURL"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sandboxExtensionData, CFSTR("_sandboxExtensionData"));

}

- (_INURLImage)initWithCoder:(id)a3
{
  id v4;
  _INURLImage *v5;
  uint64_t v6;
  NSURL *imageURL;
  uint64_t v8;
  NSData *sandboxExtensionData;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_INURLImage;
  v5 = -[INImage initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    imageURL = v5->_imageURL;
    v5->_imageURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sandboxExtensionData"));
    v8 = objc_claimAutoreleasedReturnValue();
    sandboxExtensionData = v5->_sandboxExtensionData;
    v5->_sandboxExtensionData = (NSData *)v8;

    if (v5->_imageURL)
    {
      if (v5->_sandboxExtensionData)
        MEMORY[0x18D780D9C]();
    }
  }

  return v5;
}

- (_INURLImage)initWithImageURL:(id)a3
{
  id v5;
  id *v6;
  _INURLImage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_INURLImage;
  v6 = -[INImage _initWithIdentifier:](&v9, sel__initWithIdentifier_, 0);
  v7 = (_INURLImage *)v6;
  if (v6)
    objc_storeStrong(v6 + 8, a3);

  return v7;
}

- (void)_setSandboxExtensionData:(id)a3
{
  NSData *v4;
  NSData *sandboxExtensionData;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  sandboxExtensionData = self->_sandboxExtensionData;
  self->_sandboxExtensionData = v4;

}

- (id)_sandboxExtensionData
{
  return self->_sandboxExtensionData;
}

- (BOOL)_isSupportedForDonation
{
  void *v2;
  BOOL v3;

  -[_INURLImage imageURL](self, "imageURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isFileURL") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    if (INThisProcessIsSystemProcess_onceToken != -1)
      dispatch_once(&INThisProcessIsSystemProcess_onceToken, &__block_literal_global_32_68971);
    v3 = INThisProcessIsSystemProcess_isSystemProcess != 0;
  }

  return v3;
}

- (BOOL)_isEligibleForProxying
{
  void *v2;
  char v3;

  -[_INURLImage imageURL](self, "imageURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFileURL");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSURL *imageURL;
  void *v6;
  void *v7;
  objc_super v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)_INURLImage;
  -[INImage _dictionaryRepresentation](&v9, sel__dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v10 = CFSTR("imageURL");
  imageURL = self->_imageURL;
  v6 = imageURL;
  if (!imageURL)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v7);

  if (!imageURL)
  return v4;
}

- (BOOL)_requiresRetrieval
{
  return 1;
}

- (void)_loadImageDataAndSizeWithHelper:(id)a3 accessSpecifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  char v16;
  uint64_t v17;
  id v18;
  void (**v19)(_QWORD);
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  char v43;
  _QWORD v44[4];
  id v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  id v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v51 = "-[_INURLImage(INPortableImageLoader) _loadImageDataAndSizeWithHelper:accessSpecifier:completion:]";
      _os_log_impl(&dword_18BEBC000, v11, OS_LOG_TYPE_INFO, "%s Attempting URL image loading strategy without the sent helper", buf, 0xCu);
    }
    -[_INURLImage imageURL](self, "imageURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v13 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v51 = "-[_INURLImage(INPortableImageLoader) _loadImageDataAndSizeWithHelper:accessSpecifier:completion:]";
        v52 = 2112;
        v53 = v8;
        _os_log_impl(&dword_18BEBC000, v13, OS_LOG_TYPE_INFO, "%s Attempting URL image loading strategy with helper: %@", buf, 0x16u);
      }
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __97___INURLImage_INPortableImageLoader___loadImageDataAndSizeWithHelper_accessSpecifier_completion___block_invoke;
      v44[3] = &unk_1E2293D30;
      v45 = v10;
      objc_msgSend(v8, "loadImageDataFromURL:completion:", v12, v44);
      v14 = v45;
      goto LABEL_26;
    }
    if (!objc_msgSend(v12, "isFileURL"))
    {
      if (v12)
      {
        v24 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v51 = "-[_INURLImage(INPortableImageLoader) _loadImageDataAndSizeWithHelper:accessSpecifier:completion:]";
          _os_log_impl(&dword_18BEBC000, v24, OS_LOG_TYPE_INFO, "%s Attempting remote URL image loading strategy", buf, 0xCu);
        }
        objc_msgSend(MEMORY[0x1E0CB39F8], "ephemeralSessionConfiguration");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setURLCache:", 0);
        objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:", v12);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setTimeoutInterval:", 4.0);
        objc_msgSend(v25, "setCachePolicy:", 1);
        objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:", v14);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __97___INURLImage_INPortableImageLoader___loadImageDataAndSizeWithHelper_accessSpecifier_completion___block_invoke_119;
        v34[3] = &unk_1E228FE38;
        v34[4] = self;
        v37 = v10;
        v35 = v8;
        v36 = v9;
        objc_msgSend(v26, "dataTaskWithRequest:completionHandler:", v25, v34);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "resume");

      }
      else
      {
        v28 = (void *)MEMORY[0x1E0CB35C8];
        v46 = *MEMORY[0x1E0CB2D50];
        v29 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(0, "absoluteString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringWithFormat:", CFSTR("Failed to load image %@ from URL %@"), self, v14);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6003, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, _QWORD, void *, double, double))v10 + 2))(v10, 0, 0, v32, 0.0, 0.0);

      }
      goto LABEL_26;
    }
    v15 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v51 = "-[_INURLImage(INPortableImageLoader) _loadImageDataAndSizeWithHelper:accessSpecifier:completion:]";
      _os_log_impl(&dword_18BEBC000, v15, OS_LOG_TYPE_INFO, "%s Attempting file URL image loading strategy", buf, 0xCu);
    }
    v16 = objc_msgSend(v12, "startAccessingSecurityScopedResource");
    v17 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __97___INURLImage_INPortableImageLoader___loadImageDataAndSizeWithHelper_accessSpecifier_completion___block_invoke_113;
    v41[3] = &unk_1E228FE10;
    v43 = v16;
    v18 = v12;
    v42 = v18;
    v19 = (void (**)(_QWORD))MEMORY[0x18D7812C4](v41);
    v40 = 0;
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v18, 0, &v40);
    v21 = v40;
    if (v20)
    {
      +[INImage imageWithImageData:](INImage, "imageWithImageData:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v17;
      v38[1] = 3221225472;
      v38[2] = __97___INURLImage_INPortableImageLoader___loadImageDataAndSizeWithHelper_accessSpecifier_completion___block_invoke_115;
      v38[3] = &unk_1E228FDE8;
      v39 = v10;
      objc_msgSend(v22, "_retrieveImageDataWithReply:", v38);
      v23 = v39;
LABEL_25:

      v19[2](v19);
      v14 = v42;
LABEL_26:

      goto LABEL_27;
    }
    v33 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v51 = "-[_INURLImage(INPortableImageLoader) _loadImageDataAndSizeWithHelper:accessSpecifier:completion:]";
      v52 = 2114;
      v53 = v18;
      v54 = 2114;
      v55 = v21;
      _os_log_error_impl(&dword_18BEBC000, v33, OS_LOG_TYPE_ERROR, "%s Failed to load image from file URL %{public}@: %{public}@", buf, 0x20u);
      if (v21)
        goto LABEL_21;
    }
    else if (v21)
    {
LABEL_21:
      v48 = *MEMORY[0x1E0CB3388];
      v49 = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6003, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *, double, double))v10 + 2))(v10, 0, 0, v23, 0.0, 0.0);
      goto LABEL_25;
    }
    v22 = 0;
    goto LABEL_24;
  }
LABEL_27:

}

@end
