@implementation NLGazetteer

+ (NLGazetteer)gazetteerWithContentsOfURL:(NSURL *)url error:(NSError *)error
{
  NSURL *v5;
  void *v6;

  v5 = url;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContentsOfURL:error:", v5, error);

  return (NLGazetteer *)v6;
}

+ (NLGazetteer)gazetteerWithData:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithData:error:", v5, a4);

  return (NLGazetteer *)v6;
}

+ (NLGazetteer)gazetteerWithMLModel:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMLModel:error:", v5, a4);

  return (NLGazetteer *)v6;
}

- (NLGazetteer)initWithContentsOfURL:(NSURL *)url error:(NSError *)error
{
  NSURL *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NLGazetteer *v12;
  void *v13;
  void *v14;
  const __CFString **v15;
  uint64_t *v16;
  void *v17;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  id v24;
  char v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  NSURL *v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v6 = url;
  -[NSURL path](v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  if ((objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v7, &v25) & 1) == 0)
  {
    if (!error)
      goto LABEL_10;
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0CB2D50];
    v33[0] = CFSTR("Could not find gazetteer file");
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = (const __CFString **)v33;
    v16 = &v32;
    goto LABEL_8;
  }
  if (v25)
    goto LABEL_3;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("mlmodel")))
  {
    if (!error)
      goto LABEL_10;
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CB2D50];
    v31 = CFSTR("Cannot load gazetteer from uncompiled mlmodel file");
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = &v31;
    v16 = &v30;
LABEL_8:
    objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 1, v17);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  if (!v25)
  {
    v24 = 0;
    v28 = *MEMORY[0x1E0D173B0];
    v29 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = NLGazetteerCreate();
    if (v19)
    {
      v20 = (void *)v19;
      v23.receiver = self;
      v23.super_class = (Class)NLGazetteer;
      v12 = -[NLGazetteer init](&v23, sel_init);
      if (v12)
        v12->_gazetteer = v20;
      goto LABEL_5;
    }
    if (error)
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0CB2D50];
      v27 = CFSTR("Failed to load gazetteer file");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 1, v22);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();

    }
  }
LABEL_3:
  +[NLModel modelWithContentsOfURL:error:](NLModel, "modelWithContentsOfURL:error:", v6, error);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
LABEL_9:
    error = 0;
    goto LABEL_10;
  }
  v11 = (void *)v10;
  v12 = -[NLGazetteer initWithNLModel:error:](self, "initWithNLModel:error:", v10, error);
LABEL_5:
  self = v12;

  error = (NSError **)self;
LABEL_10:

  return (NLGazetteer *)error;
}

- (NLGazetteer)initWithData:(NSData *)data error:(NSError *)error
{
  NSData *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NLGazetteer *v10;
  NLGazetteer *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;
  id v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = data;
  v18 = 0;
  v21 = *MEMORY[0x1E0D173A8];
  v22[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = NLGazetteerCreate();
  if (v8)
  {
    v9 = (void *)v8;
    v17.receiver = self;
    v17.super_class = (Class)NLGazetteer;
    v10 = -[NLGazetteer init](&v17, sel_init);
    if (v10)
      v10->_gazetteer = v9;
    self = v10;
    v11 = self;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2D50];
    v20 = CFSTR("Failed to load gazetteer data");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 5, v13);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();

    +[NLModel modelWithData:error:](NLModel, "modelWithData:error:", v6, error);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      self = -[NLGazetteer initWithNLModel:error:](self, "initWithNLModel:error:", v14, error);

      v11 = self;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (void)_gazetteerRef
{
  return self->_gazetteer;
}

- (NLGazetteer)initWithNLModel:(id)a3 error:(id *)p_isa
{
  id v7;
  void *v8;
  const void *v9;
  NLGazetteer *v10;
  void *v11;
  void *v12;
  objc_super v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "gazetteer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (const void *)objc_msgSend(v8, "_gazetteerRef");

  if (v9)
  {
    v14.receiver = self;
    v14.super_class = (Class)NLGazetteer;
    v10 = -[NLGazetteer init](&v14, sel_init);
    if (v10)
    {
      v10->_gazetteer = (void *)CFRetain(v9);
      objc_storeStrong((id *)&v10->_nlModel, a3);
    }
    self = v10;
    p_isa = (id *)&self->super.isa;
  }
  else if (p_isa)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2D50];
    v16[0] = CFSTR("Failed to load gazetteer file");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 6, v12);
    *p_isa = (id)objc_claimAutoreleasedReturnValue();

    p_isa = 0;
  }

  return (NLGazetteer *)p_isa;
}

- (NLGazetteer)initWithMLModel:(id)a3 error:(id *)a4
{
  void *v6;
  NLGazetteer *v7;
  NLGazetteer *v8;

  +[NLModel modelWithMLModel:error:](NLModel, "modelWithMLModel:error:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    self = -[NLGazetteer initWithNLModel:error:](self, "initWithNLModel:error:", v6, a4);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  return v8;
}

- (NLGazetteer)initWithDictionary:(NSDictionary *)dictionary language:(NLLanguage)language error:(NSError *)error
{
  NSDictionary *v8;
  NSString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NLGazetteer *v14;
  objc_super v16;
  id v17;

  v8 = dictionary;
  v9 = language;
  v17 = 0;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v8, *MEMORY[0x1E0D173B8], v10, *MEMORY[0x1E0D173C0], 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = NLGazetteerCreate();
  if (v12)
  {
    v13 = (void *)v12;
    v16.receiver = self;
    v16.super_class = (Class)NLGazetteer;
    v14 = -[NLGazetteer init](&v16, sel_init);
    self = v14;
    if (v14)
      v14->_gazetteer = v13;
  }
  else if (error)
  {
    *error = (NSError *)v17;
  }

  return self;
}

- (void)dealloc
{
  void *gazetteer;
  objc_super v4;

  gazetteer = self->_gazetteer;
  if (gazetteer)
    CFRelease(gazetteer);
  v4.receiver = self;
  v4.super_class = (Class)NLGazetteer;
  -[NLGazetteer dealloc](&v4, sel_dealloc);
}

- (NSString)labelForString:(NSString *)string
{
  return (NSString *)(id)NLGazetteerCopyLabel();
}

- (id)labels
{
  return (id)NLGazetteerCopyAvailableLabels();
}

- (NSData)data
{
  return (NSData *)(id)NLGazetteerCopyCompressedModel();
}

+ (BOOL)writeGazetteerForDictionary:(NSDictionary *)dictionary language:(NLLanguage)language toURL:(NSURL *)url error:(NSError *)error
{
  NSURL *v9;
  NSString *v10;
  NSDictionary *v11;
  void *v12;
  void *v13;
  char v14;

  v9 = url;
  v10 = language;
  v11 = dictionary;
  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDictionary:language:error:", v11, v10, error);

  if (v12)
  {
    objc_msgSend(v12, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "writeToURL:options:error:", v9, 1, error);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)modelDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  -[NLGazetteer labels](self, "labels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "count"))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("This model is a gazetteer which tags words according to set {%@}"), v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = CFSTR("This model is a gazetteer");
  }

  return v6;
}

- (BOOL)writeMLModelToURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NLModelImplG *v14;
  NLModel *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  BOOL v20;

  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1E0C99D80];
  -[NLGazetteer language](self, "language");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, CFSTR("Language"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[NLModelConfiguration defaultModelConfigurationForType:options:error:](NLModelConfiguration, "defaultModelConfigurationForType:options:error:", 0, v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[NLModelImplG initWithGazetteer:]([NLModelImplG alloc], "initWithGazetteer:", self);
  v15 = -[NLModel initWithConfiguration:modelImpl:]([NLModel alloc], "initWithConfiguration:modelImpl:", v13, v14);
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0C9E870];
    objc_msgSend(v16, "objectForKey:", *MEMORY[0x1E0C9E870]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      -[NLGazetteer modelDescription](self, "modelDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", v19, v17);

    }
    v20 = -[NLModel writeMLModelToURL:options:error:](v15, "writeMLModelToURL:options:error:", v8, v16, a5);

  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 6, 0);
    v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (BOOL)writeGazetteerMLModelForDictionary:(id)a3 language:(id)a4 toURL:(id)a5 options:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  char v16;

  v11 = a5;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDictionary:language:error:", v14, v13, a7);

  if (v15)
    v16 = objc_msgSend(v15, "writeMLModelToURL:options:error:", v11, v12, a7);
  else
    v16 = 0;

  return v16;
}

- (void)_addImplementationToArray:(__CFArray *)a3
{
  CFArrayAppendValue(a3, self->_gazetteer);
}

- (NLLanguage)language
{
  return (NLLanguage)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_nlModel, 0);
}

@end
