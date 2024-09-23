@implementation ASTResponse

- (ASTResponse)init
{
  return -[ASTResponse initWithDictionary:](self, "initWithDictionary:", MEMORY[0x24BDBD1B8]);
}

- (ASTResponse)initWithDictionary:(id)a3
{
  id v4;
  ASTResponse *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *commandString;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSDictionary *data;
  uint64_t v25;
  NSNumber *testId;
  uint64_t v27;
  void *progress;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  objc_super v52;

  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)ASTResponse;
  v5 = -[ASTResponse init](&v52, sel_init);
  if (v5)
  {
    if (-[ASTResponse validateResponse:key:expectedClass:](v5, "validateResponse:key:expectedClass:", v4, CFSTR("statusResponse"), objc_opt_class()))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("statusResponse"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      ASTLogHandleForCategory(1);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[ASTResponse initWithDictionary:].cold.4(v7, v8, v9, v10, v11, v12, v13, v14);

      v6 = 0;
      v5 = 0;
    }
    +[ASTResponse _stringToCommand](ASTResponse, "_stringToCommand");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5
      && -[ASTResponse validateResponse:key:expectedClass:](v5, "validateResponse:key:expectedClass:", v6, CFSTR("command"), objc_opt_class())&& (objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("command")), v16 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v15, "objectForKeyedSubscript:", v16), v17 = (void *)objc_claimAutoreleasedReturnValue(), v17, v16, v17))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("command"));
      v18 = objc_claimAutoreleasedReturnValue();
      commandString = v5->_commandString;
      v5->_commandString = (NSString *)v18;

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("command"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_command = objc_msgSend(v21, "integerValue");

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("data"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASTResponse validateData:command:](v5, "validateData:command:", v22, v5->_command);
      v23 = objc_claimAutoreleasedReturnValue();
      data = v5->_data;
      v5->_data = (NSDictionary *)v23;

      if (v5->_data)
      {
        if (-[ASTResponse validateResponse:key:expectedClass:](v5, "validateResponse:key:expectedClass:", v6, CFSTR("testId"), objc_opt_class()))
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("testId"));
          v25 = objc_claimAutoreleasedReturnValue();
          testId = v5->_testId;
          v5->_testId = (NSNumber *)v25;

        }
        if (-[ASTResponse validateTestId:command:](v5, "validateTestId:command:", v5->_testId, v5->_command))
        {
          if (!-[ASTResponse validateResponse:key:expectedClass:](v5, "validateResponse:key:expectedClass:", v6, CFSTR("progress"), objc_opt_class()))
          {
LABEL_20:

            goto LABEL_21;
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("progress"));
          v27 = objc_claimAutoreleasedReturnValue();
          progress = v5->_progress;
          v5->_progress = (NSNumber *)v27;
LABEL_19:

          goto LABEL_20;
        }
        ASTLogHandleForCategory(1);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          -[ASTResponse initWithDictionary:].cold.3(v29, v45, v46, v47, v48, v49, v50, v51);
      }
      else
      {
        ASTLogHandleForCategory(1);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          -[ASTResponse initWithDictionary:].cold.2(v29, v38, v39, v40, v41, v42, v43, v44);
      }
    }
    else
    {
      ASTLogHandleForCategory(1);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[ASTResponse initWithDictionary:].cold.1(v29, v30, v31, v32, v33, v34, v35, v36);
    }

    progress = v5;
    v5 = 0;
    goto LABEL_19;
  }
LABEL_21:

  return v5;
}

+ (id)responseWithDictionary:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:", v4);

  return v5;
}

+ (id)_stringToCommand
{
  return &unk_24F976218;
}

+ (id)stringFromCommand:(int64_t)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__ASTResponse_stringFromCommand___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (stringFromCommand__onceToken != -1)
    dispatch_once(&stringFromCommand__onceToken, block);
  v4 = (void *)stringFromCommand___stringFromCommand;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = CFSTR("Unknown");
  v8 = v6;

  return v8;
}

void __33__ASTResponse_stringFromCommand___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_stringToCommand");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v8, (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, v9);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  v10 = objc_msgSend(v2, "copy");
  v11 = (void *)stringFromCommand___stringFromCommand;
  stringFromCommand___stringFromCommand = v10;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ASTResponse commandString](self, "commandString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTResponse data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTResponse testId](self, "testId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTResponse progress](self, "progress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Command: %@, Data: %@, TestId: %@, Progress: %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)validateResponse:(id)a3 key:(id)a4 expectedClass:(Class)a5
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  char v13;
  void *v14;
  BOOL v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)v8,
        objc_msgSend(v6, "objectForKeyedSubscript:", v7),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v10,
        v9,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length") != 0;

    }
    else
    {
      v15 = 1;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)validateTestId:(id)a3 command:(int64_t)a4
{
  BOOL v4;
  BOOL v5;
  NSObject *v6;

  if (a3)
    v4 = 0;
  else
    v4 = (unint64_t)(a4 - 5) >= 0xFFFFFFFFFFFFFFFELL;
  v5 = !v4;
  if (v4)
  {
    ASTLogHandleForCategory(1);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ASTResponse validateTestId:command:].cold.1();

  }
  return v5;
}

- (id)validateData:(id)a3 command:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  char v19;
  _BOOL4 v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  v8 = (id)MEMORY[0x24BDBD1B8];
  switch(a4)
  {
    case 2:
      if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        ASTLogHandleForCategory(1);
        v9 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          goto LABEL_66;
        goto LABEL_58;
      }
      if (-[ASTResponse validateResponse:key:expectedClass:](self, "validateResponse:key:expectedClass:", v7, CFSTR("imageName"), objc_opt_class())|| -[ASTResponse validateResponse:key:expectedClass:](self, "validateResponse:key:expectedClass:", v7, CFSTR("action"), objc_opt_class())&& -[ASTResponse validateResponse:key:expectedClass:](self, "validateResponse:key:expectedClass:", v7, CFSTR("viewTitle"), objc_opt_class())&& -[ASTResponse validateResponse:key:expectedClass:](self,
             "validateResponse:key:expectedClass:",
             v7,
             CFSTR("suiteName"),
             objc_opt_class()))
      {
        goto LABEL_39;
      }
      ASTLogHandleForCategory(1);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[ASTResponse validateData:command:].cold.3();
      goto LABEL_66;
    case 3:
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObjectsAndKeys:", v8, CFSTR("predicates"), v8, CFSTR("parameters"), v8, CFSTR("specifications"), 0);
          v8 = (id)objc_claimAutoreleasedReturnValue();
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          objc_msgSend(v8, "allKeys");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)objc_msgSend(v10, "copy");

          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v23;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v23 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
                if (-[ASTResponse validateResponse:key:expectedClass:](self, "validateResponse:key:expectedClass:", v7, v16, objc_opt_class()))
                {
                  objc_msgSend(v7, "objectForKeyedSubscript:", v16);
                  v17 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, v16);
                }
                else
                {
                  ASTLogHandleForCategory(1);
                  v17 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v27 = v16;
                    _os_log_impl(&dword_22D91B000, v17, OS_LOG_TYPE_DEFAULT, "Warning: statusResponse is missing %@ key. Defaulting to empty dictionary.", buf, 0xCu);
                  }
                }

              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
            }
            while (v13);
          }

          goto LABEL_68;
        }
      }
      ASTLogHandleForCategory(1);
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        goto LABEL_66;
      goto LABEL_58;
    case 5:
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (-[ASTResponse validateResponse:key:expectedClass:](self, "validateResponse:key:expectedClass:", v7, CFSTR("propertyItems"), objc_opt_class()))
          {
            goto LABEL_39;
          }
          ASTLogHandleForCategory(1);
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            -[ASTResponse validateData:command:].cold.5();
          goto LABEL_66;
        }
      }
      ASTLogHandleForCategory(1);
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        goto LABEL_66;
      goto LABEL_58;
    case 6:
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_39;
      }
      ASTLogHandleForCategory(1);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        goto LABEL_58;
      goto LABEL_66;
    case 10:
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (-[ASTResponse validateResponse:key:expectedClass:](self, "validateResponse:key:expectedClass:", v7, CFSTR("actions"), objc_opt_class()))
          {
            goto LABEL_39;
          }
          ASTLogHandleForCategory(1);
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            -[ASTResponse validateData:command:].cold.8();
          goto LABEL_66;
        }
      }
      ASTLogHandleForCategory(1);
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        goto LABEL_66;
      goto LABEL_58;
    case 11:
    case 12:
      if (!v6)
        goto LABEL_67;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_67;
      goto LABEL_39;
    case 13:
      if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        ASTLogHandleForCategory(1);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
LABEL_58:
          -[ASTResponse validateData:command:].cold.1();
        goto LABEL_66;
      }
      if (!-[ASTResponse validateResponse:key:expectedClass:](self, "validateResponse:key:expectedClass:", v7, CFSTR("instructionId"), objc_opt_class())|| !-[ASTResponse validateResponse:key:expectedClass:](self, "validateResponse:key:expectedClass:", v7, CFSTR("type"), objc_opt_class()))
      {
        goto LABEL_64;
      }
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("Alert"));
      if ((v19 & 1) == 0)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type"));
        a4 = objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend((id)a4, "isEqualToString:", CFSTR("Query")) & 1) == 0)
        {

          goto LABEL_64;
        }
      }
      v20 = -[ASTResponse validateResponse:key:expectedClass:](self, "validateResponse:key:expectedClass:", v7, CFSTR("reference"), objc_opt_class());
      if ((v19 & 1) != 0)
      {

        if (!v20)
          goto LABEL_64;
LABEL_39:
        v8 = v7;
        goto LABEL_68;
      }

      if (v20)
        goto LABEL_39;
LABEL_64:
      ASTLogHandleForCategory(1);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[ASTResponse validateData:command:].cold.10();
LABEL_66:

LABEL_67:
      v8 = 0;
LABEL_68:

      return v8;
    default:
      goto LABEL_68;
  }
}

- (int64_t)command
{
  return self->_command;
}

- (NSDictionary)data
{
  return self->_data;
}

- (NSNumber)progress
{
  return self->_progress;
}

- (NSNumber)testId
{
  return self->_testId;
}

- (NSDictionary)stringToCommand
{
  return self->_stringToCommand;
}

- (void)setStringToCommand:(id)a3
{
  objc_storeStrong((id *)&self->_stringToCommand, a3);
}

- (NSString)commandString
{
  return self->_commandString;
}

- (void)setCommandString:(id)a3
{
  objc_storeStrong((id *)&self->_commandString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandString, 0);
  objc_storeStrong((id *)&self->_stringToCommand, 0);
  objc_storeStrong((id *)&self->_testId, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)initWithDictionary:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22D91B000, a1, a3, "Could not validate %@ key in response object.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDictionary:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22D91B000, a1, a3, "Could not validate %@ key in response object.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDictionary:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22D91B000, a1, a3, "Could not validate %@ key in response object.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDictionary:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22D91B000, a1, a3, "Could not validate %@ key in response object.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)validateTestId:command:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "testId key missing from statusResponse", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)validateData:command:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "data key missing or invalid from statusResponse", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)validateData:command:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "imageName or action, viewTitle, and suiteName keys missing from data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)validateData:command:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "propertyItems key missing from data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)validateData:command:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "actions key missing from data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)validateData:command:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "instructionId or type and reference keys are missing or contain invalid data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
