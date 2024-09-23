@implementation BCSVCardParser

+ (id)parseString:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id CNContactVCardSerializationClass;
  void *v21;
  void *v22;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BCSContactData *v31;
  void *v32;
  BCSInvalidParsedData *v33;
  _BOOL8 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v3 = a3;
  v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v4)
    +[BCSVCardParser parseString:].cold.5(v4, v5, v6, v7, v8, v9, v10, v11);
  if ((unint64_t)objc_msgSend(v3, "length") <= 0xA)
  {
    v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v12)
      +[BCSVCardParser parseString:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
LABEL_13:
    v33 = 0;
    goto LABEL_18;
  }
  if ((objc_msgSend(v3, "_bcs_hasCaseInsensitivePrefix:", CFSTR("BEGIN:VCARD")) & 1) == 0)
  {
    v34 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v34)
      +[BCSVCardParser parseString:].cold.4(v34, v35, v36, v37, v38, v39, v40, v41);
    goto LABEL_13;
  }
  CNContactVCardSerializationClass = getCNContactVCardSerializationClass();
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CNContactVCardSerializationClass, "contactsWithData:error:", v21, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v22, "count"))
  {
    v23 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v23)
      +[BCSVCardParser parseString:].cold.3(v23, v24, v25, v26, v27, v28, v29, v30);
    v31 = [BCSContactData alloc];
    objc_msgSend(v22, "firstObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[BCSContactData initWithContact:](v31, "initWithContact:", v32);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[BCSVCardParser parseString:].cold.2();
    v33 = -[BCSInvalidParsedData initWithInvalidDataType:invalidContents:]([BCSInvalidParsedData alloc], "initWithInvalidDataType:invalidContents:", 2, v3);
  }

LABEL_18:
  return v33;
}

+ (void)parseString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSVCardParser: Payload length is too short", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:.cold.2()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "BCSVCardParser: Failed to parse contact from vCard string", v0, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSVCardParser: Found contact from vCard string", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSVCardParser: vCard prefix is not found", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:(uint64_t)a3 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSVCardParser: Begin parsing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
