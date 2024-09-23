@implementation FPURLOperationLocator

- (FPURLOperationLocator)initWithObject:(id)a3
{
  FPURLOperationLocator *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FPURLOperationLocator;
  result = -[FPActionOperationLocator initWithObject:](&v4, sel_initWithObject_, a3);
  if (result)
    result->_size = -1;
  return result;
}

- (id)description
{
  void *v2;
  void *v3;

  -[FPActionOperationLocator asURL](self, "asURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isExternalURL
{
  return 1;
}

- (id)identifier
{
  void *v2;
  void *v3;

  -[FPActionOperationLocator asURL](self, "asURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  comparablePathFromURL(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)parentIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[FPActionOperationLocator asURL](self, "asURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  comparablePathFromURL(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)filename
{
  void *v2;
  void *v3;

  -[FPActionOperationLocator asURL](self, "asURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)size
{
  unint64_t result;
  void *v4;
  int v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;
  int64_t v10;

  result = self->_size;
  if (result == -1)
  {
    v10 = 0;
    -[FPActionOperationLocator asURL](self, "asURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "startAccessingSecurityScopedResource");
    v9 = 0;
    v6 = objc_msgSend(v4, "fp_getSize:error:", &v10, &v9);
    v7 = v9;
    if ((v6 & 1) == 0)
    {
      fp_current_or_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[FPURLOperationLocator size].cold.1(v4, v7);

    }
    if (v5)
      objc_msgSend(v4, "stopAccessingSecurityScopedResource");
    self->_size = v10;

    return self->_size;
  }
  return result;
}

- (BOOL)isDownloaded
{
  void *v2;
  int v3;
  void *v4;
  id v5;
  int v6;
  NSObject *v8;
  id v9;

  -[FPActionOperationLocator asURL](self, "asURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "startAccessingSecurityScopedResource");
  v9 = 0;
  objc_msgSend(v2, "fp_isDatalessWithError:", &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v4)
  {
    if (v3)
LABEL_3:
      objc_msgSend(v2, "stopAccessingSecurityScopedResource");
  }
  else
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[FPURLOperationLocator isDownloaded].cold.1(v2, v5);

    if (v3)
      goto LABEL_3;
  }
  v6 = objc_msgSend(v4, "BOOLValue") ^ 1;

  return v6;
}

- (BOOL)isFolder
{
  void *v2;
  char v3;

  -[FPActionOperationLocator asURL](self, "asURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fp_isFolder");

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPURLOperationLocator;
  -[FPActionOperationLocator encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  if (self->_attachSandboxExtensionOnXPCEncoding)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPActionOperationLocator asURL](self, "asURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v5, "isWritableFileAtPath:", v7);

      -[FPActionOperationLocator asURL](self, "asURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[FPSandboxingURLWrapper wrapperWithURL:readonly:error:](FPSandboxingURLWrapper, "wrapperWithURL:readonly:error:", v9, v8 ^ 1u, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("sburl"));

    }
  }

}

- (FPURLOperationLocator)initWithCoder:(id)a3
{
  id v4;
  FPURLOperationLocator *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FPURLOperationLocator;
  v5 = -[FPActionOperationLocator initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sburl"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "url");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPActionOperationLocator _setObject:](v5, "_setObject:", v8);

    }
  }

  return v5;
}

- (void)attachSandboxExtensionOnXPCEncoding
{
  self->_attachSandboxExtensionOnXPCEncoding = 1;
}

- (BOOL)requiresCrossDeviceCopy
{
  uint64_t v2;
  id v3;
  id v5;

  -[FPActionOperationLocator asURL](self, "asURL");
  v2 = objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend((id)v2, "getResourceValue:forKey:error:", &v5, *MEMORY[0x1E0C99BF0], 0);
  v3 = v5;

  LOBYTE(v2) = objc_msgSend(v3, "BOOLValue");
  return v2 ^ 1;
}

- (void)size
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "fp_prettyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v5, v6, "[DEBUG] Failed to determine size of item at %@ (%@)", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_7();
}

- (void)isDownloaded
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "fp_prettyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v5, v6, "[DEBUG] Failed to determine dataless status of item at %@ (%@)", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_7();
}

@end
