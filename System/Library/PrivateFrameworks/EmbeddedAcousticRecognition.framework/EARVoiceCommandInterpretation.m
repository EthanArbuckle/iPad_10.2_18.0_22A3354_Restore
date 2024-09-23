@implementation EARVoiceCommandInterpretation

- (_NSRange)range
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  _NSRange result;

  v22 = *MEMORY[0x1E0C80C00];
  -[EARVoiceCommandInterpretation verbIndexes](self, "verbIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[EARVoiceCommandInterpretation arguments](self, "arguments", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "indexes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addIndexes:", v11);

        objc_msgSend(v10, "adpositionIndexes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addIndexes:", v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
  {
    v13 = objc_msgSend(v4, "firstIndex");
    v14 = objc_msgSend(v4, "lastIndex") - v13 + 1;
  }
  else
  {
    v14 = 0;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v15 = v13;
  v16 = v14;
  result.length = v16;
  result.location = v15;
  return result;
}

- (EARVoiceCommandInterpretation)initWithCommandIdentifier:(id)a3 suiteIdentifiers:(id)a4 verbIndexes:(id)a5 arguments:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  EARVoiceCommandInterpretation *v14;
  uint64_t v15;
  NSString *commandIdentifier;
  uint64_t v17;
  NSSet *suiteIdentifiers;
  uint64_t v19;
  NSIndexSet *verbIndexes;
  uint64_t v21;
  NSArray *arguments;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)EARVoiceCommandInterpretation;
  v14 = -[EARVoiceCommandInterpretation init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    commandIdentifier = v14->_commandIdentifier;
    v14->_commandIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    suiteIdentifiers = v14->_suiteIdentifiers;
    v14->_suiteIdentifiers = (NSSet *)v17;

    v19 = objc_msgSend(v12, "copy");
    verbIndexes = v14->_verbIndexes;
    v14->_verbIndexes = (NSIndexSet *)v19;

    v21 = objc_msgSend(v13, "copy");
    arguments = v14->_arguments;
    v14->_arguments = (NSArray *)v21;

  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  EARVoiceCommandInterpretation *v4;
  EARVoiceCommandInterpretation *v5;
  EARVoiceCommandInterpretation *v6;
  NSString *commandIdentifier;
  void *v8;
  NSSet *suiteIdentifiers;
  void *v10;
  NSIndexSet *verbIndexes;
  void *v12;
  NSArray *arguments;
  void *v14;
  char v15;

  v4 = (EARVoiceCommandInterpretation *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v15 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    commandIdentifier = self->_commandIdentifier;
    -[EARVoiceCommandInterpretation commandIdentifier](v6, "commandIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](commandIdentifier, "isEqualToString:", v8))
    {
      suiteIdentifiers = self->_suiteIdentifiers;
      -[EARVoiceCommandInterpretation suiteIdentifiers](v6, "suiteIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSSet isEqualToSet:](suiteIdentifiers, "isEqualToSet:", v10))
      {
        verbIndexes = self->_verbIndexes;
        -[EARVoiceCommandInterpretation verbIndexes](v6, "verbIndexes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSIndexSet isEqualToIndexSet:](verbIndexes, "isEqualToIndexSet:", v12))
        {
          arguments = self->_arguments;
          -[EARVoiceCommandInterpretation arguments](v6, "arguments");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[NSArray isEqualToArray:](arguments, "isEqualToArray:", v14);

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_commandIdentifier, "hash");
  v4 = -[NSSet hash](self->_suiteIdentifiers, "hash") + 1531 * v3;
  v5 = -[NSIndexSet hash](self->_verbIndexes, "hash") + 1531 * v4;
  return -[NSArray hash](self->_arguments, "hash") + 1531 * v5 + 0x4FF350C4A71;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *commandIdentifier;
  id v5;

  commandIdentifier = self->_commandIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", commandIdentifier, CFSTR("commandIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_suiteIdentifiers, CFSTR("suiteIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_verbIndexes, CFSTR("verbIndexes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_arguments, CFSTR("arguments"));

}

- (EARVoiceCommandInterpretation)initWithCoder:(id)a3
{
  id v4;
  EARVoiceCommandInterpretation *v5;
  uint64_t v6;
  NSString *commandIdentifier;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSSet *suiteIdentifiers;
  uint64_t v13;
  NSIndexSet *verbIndexes;
  uint64_t v15;
  NSArray *arguments;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)EARVoiceCommandInterpretation;
  v5 = -[EARVoiceCommandInterpretation init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("commandIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    commandIdentifier = v5->_commandIdentifier;
    v5->_commandIdentifier = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("suiteIdentifiers"));
    v11 = objc_claimAutoreleasedReturnValue();
    suiteIdentifiers = v5->_suiteIdentifiers;
    v5->_suiteIdentifiers = (NSSet *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("verbIndexes"));
    v13 = objc_claimAutoreleasedReturnValue();
    verbIndexes = v5->_verbIndexes;
    v5->_verbIndexes = (NSIndexSet *)v13;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("arguments"));
    v15 = objc_claimAutoreleasedReturnValue();
    arguments = v5->_arguments;
    v5->_arguments = (NSArray *)v15;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)commandIdentifier
{
  return self->_commandIdentifier;
}

- (NSSet)suiteIdentifiers
{
  return self->_suiteIdentifiers;
}

- (NSIndexSet)verbIndexes
{
  return self->_verbIndexes;
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_verbIndexes, 0);
  objc_storeStrong((id *)&self->_suiteIdentifiers, 0);
  objc_storeStrong((id *)&self->_commandIdentifier, 0);
}

@end
