@implementation AXSSKeyboardCommandMap

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_initWithCommandsToKeyChordsDictionary:(id)a3
{
  id v5;
  AXSSKeyboardCommandMap *v6;
  AXSSKeyboardCommandMap *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXSSKeyboardCommandMap;
  v6 = -[AXSSKeyboardCommandMap init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_userDefinedCommandsToKeyChords, a3);

  return v7;
}

- (AXSSKeyboardCommandMap)init
{
  return (AXSSKeyboardCommandMap *)-[AXSSKeyboardCommandMap _initWithCommandsToKeyChordsDictionary:](self, "_initWithCommandsToKeyChordsDictionary:", 0);
}

- (AXSSKeyboardCommandMap)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  AXSSKeyboardCommandMap *v17;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("commandsToKeyChords"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && !-[AXSSKeyboardCommandMap _validateCommandsToKeyChords:](self, "_validateCommandsToKeyChords:", v9))
  {
    FKALogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AXSSKeyboardCommandMap initWithCoder:].cold.1((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);

    v9 = 0;
  }
  v17 = -[AXSSKeyboardCommandMap _initWithCommandsToKeyChordsDictionary:](self, "_initWithCommandsToKeyChordsDictionary:", v9);

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXSSKeyboardCommandMap userDefinedCommandsToKeyChords](self, "userDefinedCommandsToKeyChords");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("commandsToKeyChords"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[AXSSKeyboardCommandMap userDefinedCommandsToKeyChords](self, "userDefinedCommandsToKeyChords");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[4];
  v4[4] = v5;

  -[AXSSKeyboardCommandMap availableCommands](self, "availableCommands");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v4[1];
  v4[1] = v7;

  -[AXSSKeyboardCommandMap transientCommands](self, "transientCommands");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  v11 = (void *)v4[5];
  v4[5] = v10;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[AXSSKeyboardCommandMap isEqualToCommandMap:](self, "isEqualToCommandMap:", v4);

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[AXSSKeyboardCommandMap userDefinedCommandsToKeyChords](self, "userDefinedCommandsToKeyChords");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqualToCommandMap:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[AXSSKeyboardCommandMap userDefinedCommandsToKeyChords](self, "userDefinedCommandsToKeyChords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userDefinedCommandsToKeyChords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    -[AXSSKeyboardCommandMap userDefinedCommandsToKeyChords](self, "userDefinedCommandsToKeyChords");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userDefinedCommandsToKeyChords");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToDictionary:", v8);

  }
  return v9;
}

- (BOOL)_validateCommandsToKeyChords:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  char isKindOfClass;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", v8, (_QWORD)v13);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
            continue;
        }
        v11 = 0;
        goto LABEL_13;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v11 = 1;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v11 = 1;
  }
LABEL_13:

  return v11;
}

- (BOOL)_isAvailableCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[AXSSKeyboardCommandMap availableCommands](self, "availableCommands");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[AXSSKeyboardCommandMap availableCommands](self, "availableCommands");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v4);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)_initializeDictionariesIfNeeded
{
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, a2, a3, "Error loading default keyboard commands: %@", a5, a6, a7, a8, 2u);
}

- (id)commandForKeyChord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isNull") & 1) != 0)
  {
LABEL_2:
    v5 = 0;
    goto LABEL_15;
  }
  -[AXSSKeyboardCommandMap _initializeDictionariesIfNeeded](self, "_initializeDictionariesIfNeeded");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[AXSSKeyboardCommandMap transientCommands](self, "transientCommands", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10);
        -[AXSSKeyboardCommandMap transientCommands](self, "transientCommands");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5)
        {

          goto LABEL_15;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
        continue;
      break;
    }
  }

  -[AXSSKeyboardCommandMap keyChordsToCommands](self, "keyChordsToCommands");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v4, "keys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsObject:", CFSTR("⎋"));

    if (v16)
    {
      +[AXSSKeyboardCommand commandWithStandardCommandIdentifier:](AXSSKeyboardCommand, "commandWithStandardCommandIdentifier:", CFSTR("Escape"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    goto LABEL_2;
  }
LABEL_15:

  return v5;
}

- (id)keyChordForCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  v4 = a3;
  -[AXSSKeyboardCommandMap _initializeDictionariesIfNeeded](self, "_initializeDictionariesIfNeeded");
  -[AXSSKeyboardCommandMap commandsToArraysOfKeyChords](self, "commandsToArraysOfKeyChords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") == 1
    && (objc_msgSend(v6, "firstObject"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isNull"),
        v7,
        (v8 & 1) != 0))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (AXSSKeyboardCommandMap)commandMapWithKeyChord:(id)a3 forCommand:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[AXSSKeyboardCommandMap userDefinedCommandsToKeyChords](self, "userDefinedCommandsToKeyChords");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v7)
LABEL_3:
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v7);
LABEL_4:
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithCommandsToKeyChordsDictionary:", v9);
  -[AXSSKeyboardCommandMap availableCommands](self, "availableCommands");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAvailableCommands:", v11);

  return (AXSSKeyboardCommandMap *)v10;
}

- (id)addCommandsForTransientKeyChords:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *transientCommands;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (!self->_transientCommands)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    transientCommands = self->_transientCommands;
    self->_transientCommands = v5;

  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXSSKeyboardCommandMap transientCommands](self, "transientCommands");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, v8);

  return v8;
}

- (void)removeTransientKeyChordsForIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXSSKeyboardCommandMap transientCommands](self, "transientCommands");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v4);

}

- (NSSet)availableCommands
{
  return self->_availableCommands;
}

- (void)setAvailableCommands:(id)a3
{
  objc_storeStrong((id *)&self->_availableCommands, a3);
}

- (NSDictionary)keyChordsToCommands
{
  return self->_keyChordsToCommands;
}

- (NSDictionary)commandsToArraysOfKeyChords
{
  return self->_commandsToArraysOfKeyChords;
}

- (NSDictionary)userDefinedCommandsToKeyChords
{
  return self->_userDefinedCommandsToKeyChords;
}

- (NSMutableDictionary)transientCommands
{
  return self->_transientCommands;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transientCommands, 0);
  objc_storeStrong((id *)&self->_userDefinedCommandsToKeyChords, 0);
  objc_storeStrong((id *)&self->_commandsToArraysOfKeyChords, 0);
  objc_storeStrong((id *)&self->_keyChordsToCommands, 0);
  objc_storeStrong((id *)&self->_availableCommands, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, a2, a3, "Ignoring commands to key chords dictionary because of unexpected format: %@", a5, a6, a7, a8, 2u);
}

@end
