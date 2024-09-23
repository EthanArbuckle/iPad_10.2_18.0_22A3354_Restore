@implementation CNScriptChanges

- (id)_initWithInternalChanges:(id)a3
{
  id v4;
  CNScriptChanges *v5;
  uint64_t v6;
  NSDictionary *internalChanges;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNScriptChanges;
  v5 = -[CNScriptChanges init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    internalChanges = v5->_internalChanges;
    v5->_internalChanges = (NSDictionary *)v6;

  }
  return v5;
}

+ (id)_changesFromInternal:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithInternalChanges:", v4);

  return v5;
}

- (CNScriptChanges)initWithDataRepresentation:(NSData *)dataRepresentation
{
  NSData *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  CNScriptChanges *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  id v17;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v4 = dataRepresentation;
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  v18[2] = objc_opt_class();
  v18[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD1620];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v7, v4, &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v17;
  if (v9)
  {
    _CNLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CNScriptChanges initWithDataRepresentation:].cold.5();
    v11 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      _CNLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CNScriptChanges initWithDataRepresentation:].cold.4((uint64_t)v8, v12);

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("version"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      _CNLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CNScriptChanges initWithDataRepresentation:].cold.3((uint64_t)v10, v13);

    }
    if (-[NSObject integerValue](v10, "integerValue") == 1)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("scriptChanges"));
      v14 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        _CNLogSystem();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[CNScriptChanges initWithDataRepresentation:].cold.1((uint64_t)v14, v15);

      }
      self = (CNScriptChanges *)-[CNScriptChanges _initWithInternalChanges:](self, "_initWithInternalChanges:", v14);
      v11 = self;
    }
    else
    {
      _CNLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[CNScriptChanges initWithDataRepresentation:].cold.2();
      v11 = 0;
    }

  }
  return v11;
}

- (NSData)dataRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  id v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("version");
  v10[1] = CFSTR("scriptChanges");
  v11[0] = &unk_250452B68;
  -[CNScriptChanges internalChanges](self, "internalChanges");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v5)
  {
    _CNLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CNScriptChanges dataRepresentation].cold.1();

    v7 = 0;
  }
  else
  {
    v7 = v4;
  }

  return (NSData *)v7;
}

- (float)fNumber
{
  void *v2;
  void *v3;
  float v4;
  float v5;

  -[CNScriptChanges internalChanges](self, "internalChanges");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BE74BE0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (NSArray)userDecisions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CNScriptChanges internalChanges](self, "internalChanges");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("user_decisions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE74B50], "_mutableDecisionsWithCinematographyDictionaries:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNDecision _takeDecisionsFromInternal:](CNDecision, "_takeDecisionsFromInternal:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSArray)addedDetectionTracks
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNScriptChanges internalChanges](self, "internalChanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("user_tracks"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        v12 = objc_alloc(MEMORY[0x24BE74B70]);
        v13 = (void *)objc_msgSend(v12, "_initWithCinematographyDictionary:", v11, (_QWORD)v17);
        +[CNDetectionTrack _trackFromInternal:](CNDetectionTrack, "_trackFromInternal:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v14);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v15 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v15;
}

- (NSDictionary)internalChanges
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalChanges, 0);
}

- (void)initWithDataRepresentation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = (objc_class *)OUTLINED_FUNCTION_5();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_23307F000, a2, v5, "Error decoding script changes: changes of unexpected class %@", v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithDataRepresentation:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_23307F000, v0, v1, "Unsupported script changes version: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)initWithDataRepresentation:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = (objc_class *)OUTLINED_FUNCTION_5();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_23307F000, a2, v5, "Error decoding script changes: version of unexpected class %@", v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithDataRepresentation:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = (objc_class *)OUTLINED_FUNCTION_5();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_23307F000, a2, v5, "Error decoding script changes: root dict of unexpected class %@", v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithDataRepresentation:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_23307F000, v0, v1, "Error decoding script changes: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)dataRepresentation
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_23307F000, v0, v1, "Error encoding script changes: %@", v2);
  OUTLINED_FUNCTION_2();
}

@end
