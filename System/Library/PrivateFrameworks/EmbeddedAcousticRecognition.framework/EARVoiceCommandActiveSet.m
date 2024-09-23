@implementation EARVoiceCommandActiveSet

- (EARVoiceCommandActiveSet)initWithSuites:(id)a3 resourceBaseURL:(id)a4
{
  id v6;
  id v7;
  EARVoiceCommandActiveSet *v8;
  uint64_t v9;
  NSSet *suites;
  uint64_t v11;
  NSURL *resourceBaseURL;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EARVoiceCommandActiveSet;
  v8 = -[EARVoiceCommandActiveSet init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    suites = v8->_suites;
    v8->_suites = (NSSet *)v9;

    v11 = objc_msgSend(v7, "copy");
    resourceBaseURL = v8->_resourceBaseURL;
    v8->_resourceBaseURL = (NSURL *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  EARVoiceCommandActiveSet *v4;
  EARVoiceCommandActiveSet *v5;
  EARVoiceCommandActiveSet *v6;
  NSSet *suites;
  void *v8;
  NSURL *resourceBaseURL;
  void *v10;
  char v11;

  v4 = (EARVoiceCommandActiveSet *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    suites = self->_suites;
    -[EARVoiceCommandActiveSet suites](v6, "suites");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSSet isEqualToSet:](suites, "isEqualToSet:", v8))
    {
      resourceBaseURL = self->_resourceBaseURL;
      -[EARVoiceCommandActiveSet resourceBaseURL](v6, "resourceBaseURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[NSURL isEqual:](resourceBaseURL, "isEqual:", v10);

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

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSSet hash](self->_suites, "hash");
  return -[NSURL hash](self->_resourceBaseURL, "hash") + 773 * v3 + 597529;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", 0, CFSTR("version"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_suites, CFSTR("suites"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_resourceBaseURL, CFSTR("resourceBaseURL"));

}

- (EARVoiceCommandActiveSet)initWithCoder:(id)a3
{
  id v4;
  EARVoiceCommandActiveSet *v5;
  quasar *v6;
  NSObject *v7;
  void *resourceBaseURL;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSSet *suites;
  uint64_t v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)EARVoiceCommandActiveSet;
  v5 = -[EARVoiceCommandActiveSet init](&v16, sel_init);
  if (v5)
  {
    v6 = (quasar *)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
    if (v6)
    {
      quasar::QuasarCLogger(v6);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[EARVoiceCommandActiveSet initWithCoder:].cold.1();

      resourceBaseURL = v5;
      v5 = 0;
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0C99E60];
      v10 = objc_opt_class();
      objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("suites"));
      v12 = objc_claimAutoreleasedReturnValue();
      suites = v5->_suites;
      v5->_suites = (NSSet *)v12;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resourceBaseURL"));
      v14 = objc_claimAutoreleasedReturnValue();
      resourceBaseURL = v5->_resourceBaseURL;
      v5->_resourceBaseURL = (NSURL *)v14;
    }

  }
  return v5;
}

- (id)plistJSONDictionary
{
  NSSet **p_suites;
  void *v4;
  NSSet *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  p_suites = &self->_suites;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSSet count](self->_suites, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *p_suites;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __47__EARVoiceCommandActiveSet_plistJSONDictionary__block_invoke;
  v13 = &unk_1E5D489C8;
  v6 = v4;
  v14 = v6;
  -[NSSet enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:", &v10);
  v15[0] = CFSTR("version");
  v15[1] = CFSTR("suites");
  v16[0] = &unk_1E5D5BDF8;
  v16[1] = v6;
  v15[2] = CFSTR("resourceBaseURL");
  -[NSURL absoluteString](self->_resourceBaseURL, "absoluteString", v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __47__EARVoiceCommandActiveSet_plistJSONDictionary__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "plistJSONDictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

- (EARVoiceCommandActiveSet)initWithPlistJSONDictionary:(id)a3
{
  id v5;
  EARVoiceCommandActiveSet *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  uint64_t v11;
  quasar *v12;
  NSObject *p_super;
  EARVoiceCommandActiveSet *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSSet *suites;
  void *v25;
  void *v26;
  uint64_t v27;
  NSURL *resourceBaseURL;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  EARVoiceCommandActiveSet *v37;
  objc_super v38;

  v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)EARVoiceCommandActiveSet;
  v6 = -[EARVoiceCommandActiveSet init](&v38, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("version"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("EARVoiceCommandActiveSet.mm"), 110, CFSTR("Missing key \"%@\" of type NSNumber"), CFSTR("version"));

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("version"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("EARVoiceCommandActiveSet.mm"), 110, CFSTR("Wrong value type for key \"%@\"; expecting NSNumber"),
        CFSTR("version"));

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("version"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    if (v11)
    {
      quasar::QuasarCLogger(v12);
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        -[EARVoiceCommandActiveSet initWithCoder:].cold.1();
      v14 = v6;
      v6 = 0;
    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("suites"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("EARVoiceCommandActiveSet.mm"), 114, CFSTR("Missing key \"%@\" of type NSArray"), CFSTR("suites"));

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("suites"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v17 = objc_opt_isKindOfClass();

      if ((v17 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("EARVoiceCommandActiveSet.mm"), 114, CFSTR("Wrong value type for key \"%@\"; expecting NSArray"),
          CFSTR("suites"));

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("resourceBaseURL"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("EARVoiceCommandActiveSet.mm"), 115, CFSTR("Missing key \"%@\" of type NSString"), CFSTR("resourceBaseURL"));

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("resourceBaseURL"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v20 = objc_opt_isKindOfClass();

      if ((v20 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("EARVoiceCommandActiveSet.mm"), 115, CFSTR("Wrong value type for key \"%@\"; expecting NSString"),
          CFSTR("resourceBaseURL"));

      }
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("suites"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __56__EARVoiceCommandActiveSet_initWithPlistJSONDictionary___block_invoke;
      v36[3] = &unk_1E5D489F0;
      v14 = v21;
      v37 = v14;
      objc_msgSend(v22, "enumerateObjectsUsingBlock:", v36);

      v23 = -[EARVoiceCommandActiveSet copy](v14, "copy");
      suites = v6->_suites;
      v6->_suites = (NSSet *)v23;

      v25 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("resourceBaseURL"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "URLWithString:", v26);
      v27 = objc_claimAutoreleasedReturnValue();
      resourceBaseURL = v6->_resourceBaseURL;
      v6->_resourceBaseURL = (NSURL *)v27;

      p_super = &v37->super;
    }

  }
  return v6;
}

void __56__EARVoiceCommandActiveSet_initWithPlistJSONDictionary___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  EARVoiceCommandSuite *v4;
  id v5;

  v5 = a2;
  v3 = *(void **)(a1 + 32);
  v4 = -[EARVoiceCommandSuite initWithPlistJSONDictionary:]([EARVoiceCommandSuite alloc], "initWithPlistJSONDictionary:", v5);
  objc_msgSend(v3, "addObject:", v4);

}

- (NSSet)suites
{
  return self->_suites;
}

- (NSURL)resourceBaseURL
{
  return self->_resourceBaseURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceBaseURL, 0);
  objc_storeStrong((id *)&self->_suites, 0);
}

- (void)initWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_1AD756000, v0, v1, "Unknown EARVoiceCommandActiveSet serialized version", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

@end
