@implementation EARVoiceCommandSuite

- (EARVoiceCommandSuite)initWithIdentifier:(id)a3 commands:(id)a4
{
  id v6;
  id v7;
  EARVoiceCommandSuite *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSSet *commandSpecs;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EARVoiceCommandSuite;
  v8 = -[EARVoiceCommandSuite init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    commandSpecs = v8->_commandSpecs;
    v8->_commandSpecs = (NSSet *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  EARVoiceCommandSuite *v4;
  EARVoiceCommandSuite *v5;
  EARVoiceCommandSuite *v6;
  NSString *identifier;
  void *v8;
  NSSet *commandSpecs;
  void *v10;
  char v11;

  v4 = (EARVoiceCommandSuite *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    identifier = self->_identifier;
    -[EARVoiceCommandSuite identifier](v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](identifier, "isEqualToString:", v8))
    {
      commandSpecs = self->_commandSpecs;
      -[EARVoiceCommandSuite commandSpecs](v6, "commandSpecs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[NSSet isEqualToSet:](commandSpecs, "isEqualToSet:", v10);

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
  NSUInteger v3;

  v3 = -[NSString hash](self->_identifier, "hash");
  return -[NSSet hash](self->_commandSpecs, "hash") + 727 * v3 + 528529;
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
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_commandSpecs, CFSTR("commandSpecs"));

}

- (EARVoiceCommandSuite)initWithCoder:(id)a3
{
  id v4;
  EARVoiceCommandSuite *v5;
  quasar *v6;
  NSObject *p_super;
  void *v8;
  uint64_t v9;
  NSString *identifier;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EARVoiceCommandSuite;
  v5 = -[EARVoiceCommandSuite init](&v15, sel_init);
  if (v5)
  {
    v6 = (quasar *)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
    if (v6)
    {
      quasar::QuasarCLogger(v6);
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        -[EARVoiceCommandSuite initWithCoder:].cold.1();
      v8 = v5;
      v5 = 0;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
      v9 = objc_claimAutoreleasedReturnValue();
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v9;

      v11 = (void *)MEMORY[0x1E0C99E60];
      v12 = objc_opt_class();
      objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("commandSpecs"));
      v13 = objc_claimAutoreleasedReturnValue();
      p_super = &v5->_commandSpecs->super;
      v5->_commandSpecs = (NSSet *)v13;
    }

  }
  return v5;
}

- (id)plistJSONDictionary
{
  NSSet **p_commandSpecs;
  void *v4;
  NSSet *v5;
  id v6;
  NSString *identifier;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  p_commandSpecs = &self->_commandSpecs;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSSet count](self->_commandSpecs, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *p_commandSpecs;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __43__EARVoiceCommandSuite_plistJSONDictionary__block_invoke;
  v13 = &unk_1E5D48A18;
  v6 = v4;
  v14 = v6;
  -[NSSet enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:", &v10);
  v15[0] = CFSTR("version");
  v15[1] = CFSTR("identifier");
  identifier = self->_identifier;
  v16[0] = &unk_1E5D5BDF8;
  v16[1] = identifier;
  v15[2] = CFSTR("commandSpecs");
  v16[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __43__EARVoiceCommandSuite_plistJSONDictionary__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "plistJSONDictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

- (EARVoiceCommandSuite)initWithPlistJSONDictionary:(id)a3
{
  id v5;
  EARVoiceCommandSuite *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  uint64_t v11;
  quasar *v12;
  NSObject *p_super;
  EARVoiceCommandSuite *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSString *identifier;
  uint64_t v25;
  NSSet *commandSpecs;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  EARVoiceCommandSuite *v35;
  objc_super v36;

  v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)EARVoiceCommandSuite;
  v6 = -[EARVoiceCommandSuite init](&v36, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("version"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("EARVoiceCommandActiveSet.mm"), 226, CFSTR("Missing key \"%@\" of type NSNumber"), CFSTR("version"));

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("version"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("EARVoiceCommandActiveSet.mm"), 226, CFSTR("Wrong value type for key \"%@\"; expecting NSNumber"),
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
        -[EARVoiceCommandSuite initWithCoder:].cold.1();
      v14 = v6;
      v6 = 0;
    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("EARVoiceCommandActiveSet.mm"), 230, CFSTR("Missing key \"%@\" of type NSString"), CFSTR("identifier"));

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v17 = objc_opt_isKindOfClass();

      if ((v17 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("EARVoiceCommandActiveSet.mm"), 230, CFSTR("Wrong value type for key \"%@\"; expecting NSString"),
          CFSTR("identifier"));

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("commandSpecs"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("EARVoiceCommandActiveSet.mm"), 231, CFSTR("Missing key \"%@\" of type NSArray"), CFSTR("commandSpecs"));

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("commandSpecs"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v20 = objc_opt_isKindOfClass();

      if ((v20 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("EARVoiceCommandActiveSet.mm"), 231, CFSTR("Wrong value type for key \"%@\"; expecting NSArray"),
          CFSTR("commandSpecs"));

      }
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("commandSpecs"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __52__EARVoiceCommandSuite_initWithPlistJSONDictionary___block_invoke;
      v34[3] = &unk_1E5D489F0;
      v14 = v21;
      v35 = v14;
      objc_msgSend(v22, "enumerateObjectsUsingBlock:", v34);

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
      v23 = objc_claimAutoreleasedReturnValue();
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v23;

      v25 = -[EARVoiceCommandSuite copy](v14, "copy");
      commandSpecs = v6->_commandSpecs;
      v6->_commandSpecs = (NSSet *)v25;

      p_super = &v35->super;
    }

  }
  return v6;
}

void __52__EARVoiceCommandSuite_initWithPlistJSONDictionary___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  EARVoiceCommandSpec *v4;
  id v5;

  v5 = a2;
  v3 = *(void **)(a1 + 32);
  v4 = -[EARVoiceCommandSpec initWithPlistJSONDictionary:]([EARVoiceCommandSpec alloc], "initWithPlistJSONDictionary:", v5);
  objc_msgSend(v3, "addObject:", v4);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSSet)commandSpecs
{
  return self->_commandSpecs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandSpecs, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
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
  OUTLINED_FUNCTION_0_2(&dword_1AD756000, v0, v1, "Unknown EARVoiceCommandSuite serialized version", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

@end
