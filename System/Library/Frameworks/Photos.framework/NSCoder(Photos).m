@implementation NSCoder(Photos)

- (void)ph_encodeSandboxedURL:()Photos forKey:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(a1, "encodeObject:forKey:", v10, v6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v10, "isFileURL"))
    {
      objc_msgSend(v10, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PLGetSandboxExtensionToken();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(a1, "_ph_sandboxExtensionTokenKeyForURLKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "encodeObject:forKey:", v8, v9);

  }
}

- (id)ph_decodeSandboxedURLForKey:()Photos sandboxExtensionWrapper:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "_ph_sandboxExtensionTokenKeyForURLKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHSandboxExtensionWrapper wrapperWithToken:](PHSandboxExtensionWrapper, "wrapperWithToken:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  v10 = 0;
  if (a4)
LABEL_5:
    *a4 = objc_retainAutorelease(v10);
LABEL_6:

  return v7;
}

- (uint64_t)_ph_sandboxExtensionTokenKeyForURLKey:()Photos
{
  return objc_msgSend(a3, "stringByAppendingString:", CFSTR("##__sandbox-extension-token__"));
}

@end
