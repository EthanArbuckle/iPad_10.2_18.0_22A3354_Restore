@implementation IKDOMSchema

- (IKDOMSchema)initWithSchemaData:(id)a3
{
  id v4;
  IKDOMSchema *v5;
  id v6;
  xmlDoc *Memory;
  xmlDoc *v8;
  xmlSchemaParserCtxt *v9;
  xmlSchemaParserCtxt *v10;
  IKDOMSchema *v11;
  NSObject *v12;
  NSObject *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IKDOMSchema;
  v5 = -[IKDOMSchema init](&v15, sel_init);
  if (!v5)
    goto LABEL_5;
  v6 = objc_retainAutorelease(v4);
  Memory = xmlReadMemory((const char *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"), 0, 0, 0);
  if (!Memory)
  {
    ITMLKitGetLogObject(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[IKDOMSchema initWithSchemaData:].cold.1();
    goto LABEL_13;
  }
  v8 = Memory;
  v9 = xmlSchemaNewDocParserCtxt(Memory);
  if (!v9)
  {
    ITMLKitGetLogObject(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[IKDOMSchema initWithSchemaData:].cold.2();

    xmlFreeDoc(v8);
    goto LABEL_14;
  }
  v10 = v9;
  xmlSchemaSetParserErrors(v9, MEMORY[0x1E0C83478], 0, (void *)*MEMORY[0x1E0C80C10]);
  v5->_schemaPtr = xmlSchemaParse(v10);
  xmlSchemaFreeParserCtxt(v10);
  xmlFreeDoc(v8);
  if (!v5->_schemaPtr)
  {
    ITMLKitGetLogObject(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[IKDOMSchema initWithSchemaData:].cold.3();
LABEL_13:

LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
LABEL_5:
  v11 = v5;
LABEL_15:

  return v11;
}

- (void)dealloc
{
  _xmlSchema *schemaPtr;
  objc_super v4;

  schemaPtr = self->_schemaPtr;
  if (schemaPtr)
    xmlSchemaFree(schemaPtr);
  v4.receiver = self;
  v4.super_class = (Class)IKDOMSchema;
  -[IKDOMSchema dealloc](&v4, sel_dealloc);
}

- (BOOL)validateDocument:(id)a3 error:(id *)a4
{
  uint64_t v6;
  xmlDoc *v7;
  _xmlSchema *schemaPtr;
  xmlSchemaValidCtxt *v9;
  xmlSchemaValidCtxt *v10;
  int v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  void *v15;
  const __CFString **v16;
  uint64_t *v17;
  void *v18;
  NSObject *v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a3, "nodePtr");
  if (!v6 || (v7 = (xmlDoc *)v6, (schemaPtr = self->_schemaPtr) == 0))
  {
    ITMLKitGetLogObject(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[IKDOMSchema validateDocument:error:].cold.1();

    if (!a4)
      return 0;
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2D50];
    v22 = CFSTR("Invalid docPtr or schemaPtr given for validating DOM Document");
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = &v22;
    v17 = &v21;
    goto LABEL_12;
  }
  v9 = xmlSchemaNewValidCtxt(schemaPtr);
  if (!v9)
  {
    ITMLKitGetLogObject(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[IKDOMSchema validateDocument:error:].cold.2();

    if (!a4)
      return 0;
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    v24[0] = CFSTR("Failed to create schema context");
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = (const __CFString **)v24;
    v17 = &v23;
LABEL_12:
    objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("ITMLKitErrorDomain"), 201, v18);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    return 0;
  }
  v10 = v9;
  xmlSchemaSetValidErrors(v9, MEMORY[0x1E0C83478], 0, (void *)*MEMORY[0x1E0C80C10]);
  v11 = xmlSchemaValidateDoc(v10, v7);
  v12 = v11 == 0;
  if (a4 && v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ITMLKitErrorDomain"), 201, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  xmlSchemaFreeValidCtxt(v10);
  return v12;
}

- (void)initWithSchemaData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_5(&dword_1D95F2000, v0, v1, "Schema could not be loaded", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)initWithSchemaData:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_5(&dword_1D95F2000, v0, v1, "Failed to create parser context for schema", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)initWithSchemaData:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_5(&dword_1D95F2000, v0, v1, "Schema is not valid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)validateDocument:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_5(&dword_1D95F2000, v0, v1, "Invalid docPtr or schemaPtr given for validating DOM Document", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)validateDocument:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_5(&dword_1D95F2000, v0, v1, "Failed to create schema context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

@end
