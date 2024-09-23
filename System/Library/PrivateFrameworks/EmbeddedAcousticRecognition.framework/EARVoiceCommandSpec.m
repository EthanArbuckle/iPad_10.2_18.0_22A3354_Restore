@implementation EARVoiceCommandSpec

- (EARVoiceCommandSpec)initWithIdentifier:(id)a3 valence:(char)a4 fstRelativePaths:(id)a5 fstSymbol:(id)a6
{
  id v10;
  id v11;
  id v12;
  EARVoiceCommandSpec *v13;
  uint64_t v14;
  NSString *identifier;
  uint64_t v16;
  NSSet *fstRelativePaths;
  uint64_t v18;
  NSString *fstSymbol;
  objc_super v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)EARVoiceCommandSpec;
  v13 = -[EARVoiceCommandSpec init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    v13->_valence = a4;
    v16 = objc_msgSend(v11, "copy");
    fstRelativePaths = v13->_fstRelativePaths;
    v13->_fstRelativePaths = (NSSet *)v16;

    v18 = objc_msgSend(v12, "copy");
    fstSymbol = v13->_fstSymbol;
    v13->_fstSymbol = (NSString *)v18;

  }
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  EARVoiceCommandSpec *v4;
  EARVoiceCommandSpec *v5;
  EARVoiceCommandSpec *v6;
  NSString *identifier;
  void *v8;
  int valence;
  NSSet *fstRelativePaths;
  void *v11;
  NSString *fstSymbol;
  void *v13;
  char v14;

  v4 = (EARVoiceCommandSpec *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v14 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    identifier = self->_identifier;
    -[EARVoiceCommandSpec identifier](v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](identifier, "isEqualToString:", v8)
      && (valence = self->_valence,
          valence == -[EARVoiceCommandSpec valence](v6, "valence")))
    {
      fstRelativePaths = self->_fstRelativePaths;
      -[EARVoiceCommandSpec fstRelativePaths](v6, "fstRelativePaths");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSSet isEqualToSet:](fstRelativePaths, "isEqualToSet:", v11))
      {
        fstSymbol = self->_fstSymbol;
        -[EARVoiceCommandSpec fstSymbol](v6, "fstSymbol");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[NSString isEqualToString:](fstSymbol, "isEqualToString:", v13);

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = self->_valence + 571 * -[NSString hash](self->_identifier, "hash");
  v4 = -[NSSet hash](self->_fstRelativePaths, "hash") + 571 * v3;
  return -[NSString hash](self->_fstSymbol, "hash") + 571 * v4 + 0x18C022FD71;
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
  objc_msgSend(v4, "encodeInteger:forKey:", self->_valence, CFSTR("valence"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fstRelativePaths, CFSTR("FSTRelativePaths"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fstSymbol, CFSTR("FSTSymbol"));

}

- (EARVoiceCommandSpec)initWithCoder:(id)a3
{
  id v4;
  EARVoiceCommandSpec *v5;
  quasar *v6;
  NSObject *v7;
  EARVoiceCommandSpec *fstSymbol;
  uint64_t v9;
  NSString *identifier;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSSet *fstRelativePaths;
  uint64_t v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)EARVoiceCommandSpec;
  v5 = -[EARVoiceCommandSpec init](&v18, sel_init);
  if (v5)
  {
    v6 = (quasar *)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
    if (v6)
    {
      quasar::QuasarCLogger(v6);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[EARVoiceCommandSpec initWithCoder:].cold.1();

      fstSymbol = v5;
      v5 = 0;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
      v9 = objc_claimAutoreleasedReturnValue();
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v9;

      v5->_valence = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("valence"));
      v11 = (void *)MEMORY[0x1E0C99E60];
      v12 = objc_opt_class();
      objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("FSTRelativePaths"));
      v14 = objc_claimAutoreleasedReturnValue();
      fstRelativePaths = v5->_fstRelativePaths;
      v5->_fstRelativePaths = (NSSet *)v14;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FSTSymbol"));
      v16 = objc_claimAutoreleasedReturnValue();
      fstSymbol = (EARVoiceCommandSpec *)v5->_fstSymbol;
      v5->_fstSymbol = (NSString *)v16;
    }

  }
  return v5;
}

- (id)plistJSONDictionary
{
  NSString *identifier;
  void *v4;
  void *v5;
  NSString *fstSymbol;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("version");
  v9[1] = CFSTR("identifier");
  identifier = self->_identifier;
  v10[0] = &unk_1E5D5BDF8;
  v10[1] = identifier;
  v9[2] = CFSTR("valence");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", self->_valence);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v4;
  v9[3] = CFSTR("FSTRelativePaths");
  -[NSSet allObjects](self->_fstRelativePaths, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = CFSTR("FSTSymbol");
  fstSymbol = self->_fstSymbol;
  v10[3] = v5;
  v10[4] = fstSymbol;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (EARVoiceCommandSpec)initWithPlistJSONDictionary:(id)a3
{
  id v5;
  EARVoiceCommandSpec *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  uint64_t v11;
  quasar *v12;
  NSObject *v13;
  EARVoiceCommandSpec *fstSymbol;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  uint64_t v29;
  NSString *identifier;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSSet *fstRelativePaths;
  uint64_t v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  objc_super v49;

  v5 = a3;
  v49.receiver = self;
  v49.super_class = (Class)EARVoiceCommandSpec;
  v6 = -[EARVoiceCommandSpec init](&v49, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("version"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("EARVoiceCommandActiveSet.mm"), 350, CFSTR("Missing key \"%@\" of type NSNumber"), CFSTR("version"));

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("version"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("EARVoiceCommandActiveSet.mm"), 350, CFSTR("Wrong value type for key \"%@\"; expecting NSNumber"),
        CFSTR("version"));

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("version"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    if (v11)
    {
      quasar::QuasarCLogger(v12);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[EARVoiceCommandSpec initWithCoder:].cold.1();

      fstSymbol = v6;
      v6 = 0;
    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("EARVoiceCommandActiveSet.mm"), 354, CFSTR("Missing key \"%@\" of type NSString"), CFSTR("identifier"));

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v17 = objc_opt_isKindOfClass();

      if ((v17 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("EARVoiceCommandActiveSet.mm"), 354, CFSTR("Wrong value type for key \"%@\"; expecting NSString"),
          CFSTR("identifier"));

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("valence"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("EARVoiceCommandActiveSet.mm"), 355, CFSTR("Missing key \"%@\" of type NSNumber"), CFSTR("valence"));

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("valence"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v20 = objc_opt_isKindOfClass();

      if ((v20 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("EARVoiceCommandActiveSet.mm"), 355, CFSTR("Wrong value type for key \"%@\"; expecting NSNumber"),
          CFSTR("valence"));

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FSTRelativePaths"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("EARVoiceCommandActiveSet.mm"), 356, CFSTR("Missing key \"%@\" of type NSArray"), CFSTR("FSTRelativePaths"));

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FSTRelativePaths"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v23 = objc_opt_isKindOfClass();

      if ((v23 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("EARVoiceCommandActiveSet.mm"), 356, CFSTR("Wrong value type for key \"%@\"; expecting NSArray"),
          CFSTR("FSTRelativePaths"));

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FSTRelativePaths"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "indexOfObjectPassingTest:", &__block_literal_global_2);

      if (v25 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("EARVoiceCommandActiveSet.mm"), 357, CFSTR("Wrong value type in array for key \"%@\"; expecting NSString"),
          CFSTR("FSTRelativePaths"));

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FSTSymbol"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("EARVoiceCommandActiveSet.mm"), 358, CFSTR("Missing key \"%@\" of type NSString"), CFSTR("FSTSymbol"));

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FSTSymbol"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v28 = objc_opt_isKindOfClass();

      if ((v28 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("EARVoiceCommandActiveSet.mm"), 358, CFSTR("Wrong value type for key \"%@\"; expecting NSString"),
          CFSTR("FSTSymbol"));

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
      v29 = objc_claimAutoreleasedReturnValue();
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v29;

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("valence"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_valence = objc_msgSend(v31, "integerValue");

      v32 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FSTRelativePaths"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setWithArray:", v33);
      v34 = objc_claimAutoreleasedReturnValue();
      fstRelativePaths = v6->_fstRelativePaths;
      v6->_fstRelativePaths = (NSSet *)v34;

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FSTSymbol"));
      v36 = objc_claimAutoreleasedReturnValue();
      fstSymbol = (EARVoiceCommandSpec *)v6->_fstSymbol;
      v6->_fstSymbol = (NSString *)v36;
    }

  }
  return v6;
}

BOOL __51__EARVoiceCommandSpec_initWithPlistJSONDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (char)valence
{
  return self->_valence;
}

- (NSSet)fstRelativePaths
{
  return self->_fstRelativePaths;
}

- (NSString)fstSymbol
{
  return self->_fstSymbol;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fstSymbol, 0);
  objc_storeStrong((id *)&self->_fstRelativePaths, 0);
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
  OUTLINED_FUNCTION_0_2(&dword_1AD756000, v0, v1, "Unknown EARVoiceCommandSpec serialized version", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

@end
