@implementation BMContextualActionEvent

- (BMContextualActionEvent)initWithIdentifier:(id)a3 appName:(id)a4 actionName:(id)a5 contents:(id)a6 parameters:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BMContextualActionEvent *v17;
  BMContextualActionEvent *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)BMContextualActionEvent;
  v17 = -[BMEventBase init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_identifier, a3);
    objc_storeStrong((id *)&v18->_appName, a4);
    objc_storeStrong((id *)&v18->_actionName, a5);
    objc_storeStrong((id *)&v18->_contents, a6);
    objc_storeStrong((id *)&v18->_parameters, a7);
  }

  return v18;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Contextual action event with identifier: %@ app name: %@ action name: %@"), self->_identifier, self->_appName, self->_actionName);
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  return v6;
}

- (id)jsonDict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("identifier");
  -[BMContextualActionEvent identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("appName");
  -[BMContextualActionEvent appName](self, "appName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("actionName");
  -[BMContextualActionEvent actionName](self, "actionName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("contents");
  -[BMContextualActionEvent contents](self, "contents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = CFSTR("parameters");
  -[BMContextualActionEvent parameters](self, "parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v8;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[BMContextualActionEvent jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (v5)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMPOICategoryEvent json].cold.1(v6);

  }
  return v4;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMContextualActionEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMContextualActionEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  BMContextualActionEvent *v32;
  NSObject *v33;
  id v35;
  BMContextualActionEvent *v36;
  NSObject *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = self;
      v5 = v4;
      v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
      -[NSObject contents](v5, "contents");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v37 = v5;
      -[NSObject contents](v5, "contents");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v45;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v45 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
            v15 = (void *)MEMORY[0x1E0CB3710];
            v16 = objc_opt_class();
            v43 = 0;
            objc_msgSend(v15, "unarchivedObjectOfClass:fromData:error:", v16, v14, &v43);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v43;
            if (v18)
            {
              v21 = v18;
              __biome_log_for_category();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                -[BMContextualActionEvent initWithProto:].cold.2();
              v32 = 0;
LABEL_30:
              self = v36;
              v31 = v37;
              goto LABEL_31;
            }
            objc_msgSend(v8, "addObject:", v17);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
          if (v11)
            continue;
          break;
        }
      }

      v19 = objc_alloc(MEMORY[0x1E0C99DE8]);
      -[NSObject parameters](v5, "parameters");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v19, "initWithCapacity:", objc_msgSend(v20, "count"));

      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      -[NSObject parameters](v5, "parameters");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v40;
        v35 = v4;
        while (2)
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v40 != v24)
              objc_enumerationMutation(v21);
            v26 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
            v27 = (void *)MEMORY[0x1E0CB3710];
            v28 = objc_opt_class();
            v38 = 0;
            objc_msgSend(v27, "unarchivedObjectOfClass:fromData:error:", v28, v26, &v38);
            v29 = objc_claimAutoreleasedReturnValue();
            v30 = v38;
            if (v30)
            {
              v17 = v30;
              __biome_log_for_category();
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                -[BMContextualActionEvent initWithProto:].cold.1();

              v32 = 0;
              v4 = v35;
              goto LABEL_30;
            }
            objc_msgSend(v9, "addObject:", v29);

          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
          v4 = v35;
          if (v23)
            continue;
          break;
        }
      }

      v31 = v5;
      -[NSObject identifier](v5, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject appName](v5, "appName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject actionName](v5, "actionName");
      v29 = objc_claimAutoreleasedReturnValue();
      self = -[BMContextualActionEvent initWithIdentifier:appName:actionName:contents:parameters:](v36, "initWithIdentifier:appName:actionName:contents:parameters:", v21, v17, v29, v8, v9);
      v32 = self;
LABEL_31:

    }
    else
    {
      __biome_log_for_category();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
        -[BMContextualActionEvent initWithProto:].cold.3((uint64_t)self, v31);
      v32 = 0;
    }

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (BMContextualActionEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBContextualActionEvent *v5;
  BMContextualActionEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBContextualActionEvent initWithData:]([BMPBContextualActionEvent alloc], "initWithData:", v4);

    self = -[BMContextualActionEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[BMContextualActionEvent identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdentifier:", v4);

  -[BMContextualActionEvent appName](self, "appName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAppName:", v5);

  -[BMContextualActionEvent actionName](self, "actionName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActionName:", v6);

  v7 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[BMContextualActionEvent contents](self, "contents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[BMContextualActionEvent contents](self, "contents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v41;
    while (2)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v41 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v14);
        v39 = 0;
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, &v39);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v39;
        if (v17)
        {
          v29 = v17;
          __biome_log_for_category();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            -[BMContextualActionEvent proto].cold.2();

LABEL_24:
          v28 = 0;
          goto LABEL_25;
        }
        objc_msgSend(v9, "addObject:", v16);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      if (v12)
        continue;
      break;
    }
  }

  objc_msgSend(v3, "setContents:", v9);
  v18 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[BMContextualActionEvent parameters](self, "parameters");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v18, "initWithCapacity:", objc_msgSend(v19, "count"));

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[BMContextualActionEvent parameters](self, "parameters");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v36;
    while (2)
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v36 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v24);
        v34 = 0;
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v25, 1, &v34);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v34;
        if (v27)
        {
          v31 = v27;
          __biome_log_for_category();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            -[BMContextualActionEvent proto].cold.1();

          goto LABEL_24;
        }
        objc_msgSend(v10, "addObject:", v26);

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      if (v22)
        continue;
      break;
    }
  }

  objc_msgSend(v3, "setParameters:", v10);
  v28 = v3;
LABEL_25:

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  id v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  char v21;
  void *v22;
  void *v23;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    -[BMContextualActionEvent identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 || (objc_msgSend(v8, "identifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[BMContextualActionEvent identifier](self, "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v4, "isEqual:", v5);

      if (v9)
      {
LABEL_9:

        -[BMContextualActionEvent appName](self, "appName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 || (objc_msgSend(v8, "appName"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[BMContextualActionEvent appName](self, "appName");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "appName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v5, "isEqual:", v13);

          if (v12)
          {
LABEL_15:

            -[BMContextualActionEvent actionName](self, "actionName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15 || (objc_msgSend(v8, "actionName"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              -[BMContextualActionEvent actionName](self, "actionName");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "actionName");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v16, "isEqual:", v17);

              if (v15)
              {
LABEL_21:

                -[BMContextualActionEvent parameters](self, "parameters");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "parameters");
                v20 = objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v19, "isEqual:", v20);

                -[BMContextualActionEvent contents](self, "contents");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "contents");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v20) = objc_msgSend(v22, "isEqual:", v23);

                v11 = v10 & v14 & v18 & v21 & v20;
                goto LABEL_22;
              }
            }
            else
            {
              v18 = 1;
            }

            goto LABEL_21;
          }
        }
        else
        {
          v14 = 1;
        }

        goto LABEL_15;
      }
    }
    else
    {
      v10 = 1;
    }

    goto LABEL_9;
  }
  v11 = 0;
LABEL_22:

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)appName
{
  return self->_appName;
}

- (NSString)actionName
{
  return self->_actionName;
}

- (NSArray)contents
{
  return self->_contents;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithProto:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_18D810000, v0, v1, "Error while unarchiving parameters: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)initWithProto:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_18D810000, v0, v1, "Error while unarchiving contents: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)initWithProto:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBContextualActionEvent proto", v5, 0xCu);

}

- (void)proto
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_18D810000, v0, v1, "Error while archiving contents: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
