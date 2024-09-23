@implementation ISGraphicSymbolDescriptor

+ (id)descriptorFromGraphicSymbolRecipe:(id)a3
{
  id v3;
  ISGraphicSymbolDescriptor *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint8_t v26[16];
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(ISGraphicSymbolDescriptor);
  _ISDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[ISGraphicSymbolDescriptor descriptorFromGraphicSymbolRecipe:].cold.3((uint64_t)v3, v5);

  if (!v3)
  {
    _ISDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_1AA928000, v6, OS_LOG_TYPE_INFO, "No graphic variant recipe was provided", v26, 2u);
    }

  }
  objc_msgSend(v3, "_IF_stringForKey:", CFSTR("ISTypeIdentifier"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_17;
  objc_msgSend(MEMORY[0x1E0CA5928], "typeRecordWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "isDeclared"))
  {
    objc_msgSend(v9, "iconDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_IF_dictionaryForKey:", CFSTR("ISGraphicIconConfiguration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  if (!v11)
  {
    v7 = 0;
LABEL_17:
    v13 = 1;
    goto LABEL_18;
  }
  _ISDefaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    +[ISGraphicSymbolDescriptor descriptorFromGraphicSymbolRecipe:].cold.2((uint64_t)v3, (uint64_t)v11, v12);

  v7 = v11;
  v13 = 0;
  v3 = v7;
LABEL_18:
  nameFromGraphicSymbolRecipe(v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFGraphicSymbolDescriptor setName:](v4, "setName:", v14);

  colorsFromGraphicSymbolRecipe(v3, CFSTR("ISSymbolColor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFGraphicSymbolDescriptor setSymbolColors:](v4, "setSymbolColors:", v15);

  colorsFromGraphicSymbolRecipe(v3, CFSTR("ISEnclosureColor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFGraphicSymbolDescriptor setEnclosureColors:](v4, "setEnclosureColors:", v16);

  -[IFGraphicSymbolDescriptor setRenderingMode:](v4, "setRenderingMode:", rendingModeFromGraphicSymbolRecipe(v3));
  +[ISDefaults sharedInstance](ISDefaults, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isDebugGraphicIconColourEnabled");

  if (v18)
  {
    +[ISDefaults sharedInstance](ISDefaults, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "debugGraphicIconColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v13 & 1) == 0)
    {
      +[ISDefaults sharedInstance](ISDefaults, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "debugPreDefinedGraphicIconColor");
      v22 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v22;
    }
    if (v20)
    {
      v27[0] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[IFGraphicSymbolDescriptor setEnclosureColors:](v4, "setEnclosureColors:", v23);

      -[IFGraphicSymbolDescriptor setDebugColourSet:](v4, "setDebugColourSet:", 1);
    }

  }
  _ISDefaultLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    +[ISGraphicSymbolDescriptor descriptorFromGraphicSymbolRecipe:].cold.1(v4);

  return v4;
}

+ (id)descriptorFromGraphicIconConfiguration:(id)a3
{
  id v3;
  ISGraphicSymbolDescriptor *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(ISGraphicSymbolDescriptor);
  objc_msgSend(v3, "symbolColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFGraphicSymbolDescriptor setSymbolColors:](v4, "setSymbolColors:", v5);

  objc_msgSend(v3, "enclosureColors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFGraphicSymbolDescriptor setEnclosureColors:](v4, "setEnclosureColors:", v6);

  -[IFGraphicSymbolDescriptor setRenderingMode:](v4, "setRenderingMode:", objc_msgSend(v3, "renderingMode"));
  +[ISDefaults sharedInstance](ISDefaults, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isDebugGraphicIconColourEnabled");

  if (v8)
  {
    +[ISDefaults sharedInstance](ISDefaults, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "debugISIconGraphicIconColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v14[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[IFGraphicSymbolDescriptor setEnclosureColors:](v4, "setEnclosureColors:", v11);

      -[IFGraphicSymbolDescriptor setDebugColourSet:](v4, "setDebugColourSet:", 1);
    }

  }
  _ISDefaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    +[ISGraphicSymbolDescriptor descriptorFromGraphicIconConfiguration:].cold.1(v4);

  return v4;
}

- (BOOL)placeholder
{
  void *v2;
  void *v3;
  void *v5;
  int v6;
  void *v7;
  uint64_t v9;
  void *v10;
  void *v11;

  -[IFGraphicSymbolDescriptor symbolColors](self, "symbolColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[IFGraphicSymbolDescriptor symbolColors](self, "symbolColors");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "count"))
    {
      LOBYTE(v6) = 1;
LABEL_12:

      goto LABEL_13;
    }
  }
  -[IFGraphicSymbolDescriptor enclosureColors](self, "enclosureColors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[IFGraphicSymbolDescriptor enclosureColors](self, "enclosureColors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count") || -[IFGraphicSymbolDescriptor renderingMode](self, "renderingMode"))
    {
      LOBYTE(v6) = 1;
LABEL_8:

      goto LABEL_11;
    }
  }
  else if (-[IFGraphicSymbolDescriptor renderingMode](self, "renderingMode"))
  {
    LOBYTE(v6) = 1;
    goto LABEL_11;
  }
  -[IFGraphicSymbolDescriptor name](self, "name");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[IFGraphicSymbolDescriptor name](self, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v11, "isEqual:", CFSTR("questionmark.app.dashed")) ^ 1;

    if (v7)
      goto LABEL_8;
  }
  else
  {
    LOBYTE(v6) = 0;
    if (v7)
      goto LABEL_8;
  }
LABEL_11:
  if (v5)
    goto LABEL_12;
LABEL_13:

  return v6 ^ 1;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[IFGraphicSymbolDescriptor name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFGraphicSymbolDescriptor size](self, "size");
  v7 = v6;
  -[IFGraphicSymbolDescriptor size](self, "size");
  v9 = v8;
  -[IFSymbolImageDescriptor scale](self, "scale");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> %@ - (%0.2f, %0.2f)@%.0fx"), v4, self, v5, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSURL)_url
{
  return (NSURL *)objc_getProperty(self, a2, 256, 1);
}

- (void)set_url:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__url, 0);
}

+ (void)descriptorFromGraphicSymbolRecipe:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_6(&dword_1AA928000, v2, v3, "Created %@ from graphic variant dictionary %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_3();
}

+ (void)descriptorFromGraphicSymbolRecipe:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_1AA928000, log, OS_LOG_TYPE_DEBUG, "Updated recipe found for %@ => %@", (uint8_t *)&v3, 0x16u);
}

+ (void)descriptorFromGraphicSymbolRecipe:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1AA928000, a2, OS_LOG_TYPE_DEBUG, "Attempting to make descriptor for %@", (uint8_t *)&v2, 0xCu);
}

+ (void)descriptorFromGraphicIconConfiguration:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_6(&dword_1AA928000, v2, v3, "Created %@ from graphic icon configuration %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_3();
}

@end
