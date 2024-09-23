@implementation QLUTIAnalyzer

+ (id)UTIForURL:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "contentTypeForURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)contentTypeForURL:(id)a3
{
  id v3;
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  __int128 v22;
  uint64_t v23;
  id v24;
  id v25;
  _OWORD v26[49];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "startAccessingSecurityScopedResource");
  v5 = v4;
  if (!v3)
  {
    v9 = 0;
    v8 = 0;
    if (!v4)
      goto LABEL_20;
    goto LABEL_19;
  }
  v25 = 0;
  v6 = *MEMORY[0x1E0C998E0];
  v24 = 0;
  v7 = objc_msgSend(v3, "getPromisedItemResourceValue:forKey:error:", &v25, v6, &v24);
  v8 = v25;
  v9 = v24;
  if (!v7
    || (objc_msgSend(v8, "isDynamic") & 1) != 0
    || objc_msgSend(v8, "isEqual:", *MEMORY[0x1E0CEC678]))
  {
    objc_msgSend(v3, "pathComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v10, "count") >= 2
      && (objc_msgSend(v10, "objectAtIndex:", 1),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "isEqualToString:", CFSTR(".vol")),
          v11,
          v12))
    {
      v23 = 0;
      v22 = xmmword_1AE428810;
      memset(v26, 0, 512);
      v13 = objc_retainAutorelease(v3);
      if ((getattrlist((const char *)objc_msgSend(v13, "fileSystemRepresentation", 0x100000005, 0, 0), &v22, v26, 0x30CuLL, 0x20u) & 0x80000000) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (char *)v26 + SDWORD1(v26[0]) + 4);
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      v15 = v13;
    }
    else
    {
      v15 = v3;
    }
    objc_msgSend(v15, "lastPathComponent");
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v16 = (void *)v14;
    objc_msgSend((id)objc_opt_class(), "privateContentTypeFromFileName:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17 && (objc_msgSend(v17, "isDynamic") & 1) == 0)
    {
      v19 = v18;

      v8 = v19;
    }

  }
  if (!v8 || objc_msgSend(v8, "isDynamic"))
  {
    v20 = (id)*MEMORY[0x1E0CEC4A0];

    v8 = v20;
  }
  if (v5)
LABEL_19:
    objc_msgSend(v3, "stopAccessingSecurityScopedResource");
LABEL_20:

  return v8;
}

+ (id)knownExtensions
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)knownExtensions_knownExtensions;
  if (!knownExtensions_knownExtensions)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("UTIOverrides"), CFSTR("plist"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)knownExtensions_knownExtensions;
      knownExtensions_knownExtensions = v5;

    }
    if (!knownExtensions_knownExtensions)
    {
      knownExtensions_knownExtensions = MEMORY[0x1E0C9AA70];

    }
    v2 = (void *)knownExtensions_knownExtensions;
  }
  return v2;
}

+ (id)removeSpacesFromString:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "stringByRemovingPercentEncoding");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR(" ")) & 1) != 0 || objc_msgSend(v3, "hasSuffix:", CFSTR(" ")))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(" "));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = v3;
  }

  return v5;
}

+ (id)privateContentTypeFromFileName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "pathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isEqualToString:", CFSTR("zip")))
    {
      objc_msgSend(v5, "stringByDeletingPathExtension");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pathExtension");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "removeSpacesFromString:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 && objc_msgSend(v10, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:conformingToType:", v10, *MEMORY[0x1E0CEC588]);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = v10;

          v13 = v11;
          v7 = v12;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("synced")))
    {
      objc_msgSend(v5, "stringByDeletingPathExtension");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "pathExtension");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "removeSpacesFromString:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16 && objc_msgSend(v16, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:conformingToType:", v16, *MEMORY[0x1E0CEC590]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = v16;

          v19 = v17;
          v7 = v18;
          v11 = v19;
        }

      }
    }
    if (!v11 || objc_msgSend(v11, "isDynamic"))
    {
      if (v7)
      {
        objc_msgSend(a1, "knownExtensions");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lowercaseString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v22);
          v23 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v23;
        }
      }
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (QLUTIAnalyzer)initWithContentType:(id)a3
{
  id v5;
  QLUTIAnalyzer *v6;
  QLUTIAnalyzer *v7;
  QLUTIAnalyzer *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)QLUTIAnalyzer;
  v6 = -[QLUTIAnalyzer init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentType, a3);
    v8 = v7;
  }

  return v7;
}

- (QLUTIAnalyzer)initWithURL:(id)a3
{
  id v4;
  QLUTIAnalyzer *v5;
  uint64_t v6;
  NSString *contentType;
  QLUTIAnalyzer *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)QLUTIAnalyzer;
  v5 = -[QLUTIAnalyzer init](&v10, sel_init);
  if (v5)
  {
    +[QLUTIAnalyzer UTIForURL:](QLUTIAnalyzer, "UTIForURL:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    contentType = v5->_contentType;
    v5->_contentType = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (BOOL)isAudioOnly
{
  return objc_msgSend((id)objc_opt_class(), "isTypeAudioOnly:", self->_contentType);
}

+ (BOOL)isTypeAudioOnly:(id)a3
{
  void *v4;

  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "isContentTypeAudioOnly:", v4);

  return (char)a1;
}

+ (BOOL)isContentTypeAudioOnly:(id)a3
{
  return objc_msgSend(a3, "conformsToType:", *MEMORY[0x1E0CEC450]);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *contentType;

  contentType = self->_contentType;
  if (contentType)
    objc_msgSend(a3, "encodeObject:forKey:", contentType, CFSTR("contentType"));
}

- (QLUTIAnalyzer)initWithCoder:(id)a3
{
  id v4;
  QLUTIAnalyzer *v5;
  uint64_t v6;
  NSString *contentType;
  QLUTIAnalyzer *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)QLUTIAnalyzer;
  v5 = -[QLUTIAnalyzer init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentType"));
    v6 = objc_claimAutoreleasedReturnValue();
    contentType = v5->_contentType;
    v5->_contentType = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (NSString)contentType
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
}

@end
