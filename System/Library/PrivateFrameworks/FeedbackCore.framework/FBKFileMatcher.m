@implementation FBKFileMatcher

+ (id)entityName
{
  return CFSTR("FileMatcher");
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  id v22;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("description"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFileMatcher setName:](self, "setName:", v6);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fba_plugin"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  FBKStringIfNSNull(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFileMatcher setOperationName:](self, "setOperationName:", v8);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ios_fba_plugin"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  FBKStringIfNSNull(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFileMatcher setDeBundleIdentifier:](self, "setDeBundleIdentifier:", v10);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("instructions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  FBKStringIfNSNull(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFileMatcher setInstructionsAsHTML:](self, "setInstructionsAsHTML:", v12);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("regex"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFileMatcher setRegularExpressionPattern:](self, "setRegularExpressionPattern:", v14);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("platform"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  FBKNilIfNSNull(v15);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = *MEMORY[0x24BE2CA00];
  if (v16)
    v19 = v16;
  else
    v19 = *MEMORY[0x24BE2CA00];
  -[FBKFileMatcher setPlatform:](self, "setPlatform:", v19);

  -[FBKFileMatcher platform](self, "platform");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", v18);

  if (v21)
  {
    +[FBKGroupedDevice currentDevicePlatform](FBKGroupedDevice, "currentDevicePlatform");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    -[FBKFileMatcher setPlatform:](self, "setPlatform:", v22);

  }
}

- (BOOL)hasPlatform
{
  void *v2;
  char v3;

  -[FBKFileMatcher platform](self, "platform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BE2CA00]) ^ 1;

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)FBKFileMatcher;
  -[FBKFileMatcher description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKFileMatcher name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKManagedFeedbackObject ID](self, "ID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ (%@)"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)matchesFilename:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FBKFileMatcher regularExpression](self, "regularExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (NSRegularExpression)regularExpression
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  NSObject *p_super;
  NSRegularExpression *v9;
  id v11;

  -[FBKFileMatcher willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("regularExpression"));
  if (!self->_regularExpression)
  {
    -[FBKFileMatcher regularExpressionPattern](self, "regularExpressionPattern");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v11 = 0;
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", v3, 0, &v11);
      v5 = v11;
      v6 = v5;
      if (v4)
        v7 = v5 == 0;
      else
        v7 = 0;
      if (v7)
      {
        v9 = v4;
        p_super = &self->_regularExpression->super;
        self->_regularExpression = v9;
      }
      else
      {
        +[FBKLog appHandle](FBKLog, "appHandle");
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          -[FBKFileMatcher regularExpression].cold.1((uint64_t)v3, (uint64_t)v6, p_super);
      }

    }
    else
    {
      v6 = 0;
    }

  }
  -[FBKFileMatcher didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("regularExpression"));
  return self->_regularExpression;
}

- (void)setRegularExpression:(id)a3
{
  NSRegularExpression *v4;
  NSRegularExpression *regularExpression;

  v4 = (NSRegularExpression *)a3;
  -[FBKFileMatcher willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("regularExpression"));
  regularExpression = self->_regularExpression;
  self->_regularExpression = v4;

  -[FBKFileMatcher didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("regularExpression"));
}

- (id)iconForRequirement
{
  return (id)objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("doc"));
}

+ (id)iconForFileName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(a1, "assetNameForFile:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemImageNamed:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)assetNameForFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString **v6;
  __CFString *v7;

  v3 = a3;
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = FBKSystemImageNamePaper;
  if (v5)
  {
    if ((objc_msgSend(v3, "isImageFile") & 1) != 0)
    {
      v6 = FBKSystemImageNamePhoto;
    }
    else if (objc_msgSend(v3, "isVideoFile"))
    {
      v6 = FBKSystemImageNameVideo;
    }
  }
  v7 = *v6;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regularExpression, 0);
}

- (void)regularExpression
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_21D9A9000, log, OS_LOG_TYPE_ERROR, "Error parsing incoming regex /%{public}@/: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
