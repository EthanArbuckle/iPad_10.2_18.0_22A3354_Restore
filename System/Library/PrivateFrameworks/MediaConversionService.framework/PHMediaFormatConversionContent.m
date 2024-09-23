@implementation PHMediaFormatConversionContent

- (BOOL)isVideo
{
  return self->_mediaType == 1;
}

- (BOOL)isImage
{
  return self->_mediaType == 2;
}

- (NSURL)fileURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

- (void)setFileURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (unint64_t)length
{
  unint64_t result;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  result = self->_length;
  if (!result)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMediaFormatConversionContent fileURL](self, "fileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    objc_msgSend(v4, "attributesOfItemAtPath:error:", v6, &v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    self->_length = objc_msgSend(v7, "fileSize");
    return self->_length;
  }
  return result;
}

- (BOOL)isAssetBundle
{
  return self->_mediaType == 4;
}

- (id)typeFromFileExtensionWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  -[NSURL pathExtension](self->_fileURL, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    if (self->_mediaType == 1)
      v6 = (id)*MEMORY[0x1E0CEC568];
    else
      v6 = 0;
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:conformingToType:", v5, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;
    if (v9)
    {
      v10 = v9;
    }
    else if (a3)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0CB2D50];
      v15 = CFSTR("Unable to determine source media type from filename extension");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("PHMediaFormatConversionErrorDomain"), 2, v12);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    if (!a3)
    {
      v8 = 0;
      goto LABEL_13;
    }
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D50];
    v17[0] = CFSTR("Unable to determine source media type for filename without extension");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("PHMediaFormatConversionErrorDomain"), 2, v6);
    v8 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_13:
  return v8;
}

- (NSString)fileType
{
  void *v2;
  void *v3;

  -[PHMediaFormatConversionContent typeFromFileExtensionWithError:](self, "typeFromFileExtensionWithError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)fileSignature
{
  NSString *fileSignature;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSString *v8;
  id v9;
  NSString *v10;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  fileSignature = self->_fileSignature;
  if (!fileSignature)
  {
    v4 = (void *)MEMORY[0x1E0CB3608];
    -[PHMediaFormatConversionContent fileURL](self, "fileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v4, "fileHandleForReadingFromURL:error:", v5, &v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;

    if (v6)
    {
      v12 = v7;
      objc_msgSend(MEMORY[0x1E0D750B0], "fingerPrintForFileDescriptor:error:", objc_msgSend(v6, "fileDescriptor"), &v12);
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = v12;

      v10 = self->_fileSignature;
      self->_fileSignature = v8;

      if (!self->_fileSignature && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v9;
        _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to calculate file signature: %@", buf, 0xCu);
      }
      objc_msgSend(v6, "closeFile");
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v7;
        _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to read file for signature calculation: %@", buf, 0xCu);
      }
      v9 = v7;
    }

    fileSignature = self->_fileSignature;
  }
  return fileSignature;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMediaFormatConversionContent fileURL](self, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p path=%@>"), v5, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileSignature, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
