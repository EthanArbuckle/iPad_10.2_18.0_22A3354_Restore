@implementation BCSMeCardParser

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
  void *v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BCSContactData *v29;
  void *v30;
  BCSInvalidParsedData *v31;
  _BOOL8 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BOOL8 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v3 = a3;
  v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v4)
    +[BCSMeCardParser parseString:].cold.6(v4, v5, v6, v7, v8, v9, v10, v11);
  if ((unint64_t)objc_msgSend(v3, "length") <= 6)
  {
    v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v12)
      +[BCSMeCardParser parseString:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
LABEL_13:
    v31 = 0;
    goto LABEL_18;
  }
  if ((objc_msgSend(v3, "_bcs_hasCaseInsensitivePrefix:", CFSTR("MECARD:")) & 1) == 0)
  {
    v32 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v32)
      +[BCSMeCardParser parseString:].cold.5(v32, v33, v34, v35, v36, v37, v38, v39);
    goto LABEL_13;
  }
  objc_msgSend(getCNContactVCardSerializationClass(), "contactsWithMECARDString:error:", v3, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "count"))
  {
    v21 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v21)
      +[BCSMeCardParser parseString:].cold.3(v21, v22, v23, v24, v25, v26, v27, v28);
    v29 = [BCSContactData alloc];
    objc_msgSend(v20, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[BCSContactData initWithContact:](v29, "initWithContact:", v30);

  }
  else
  {
    v40 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v40)
      +[BCSMeCardParser parseString:].cold.2(v40, v41, v42, v43, v44, v45, v46, v47);
    v31 = -[BCSInvalidParsedData initWithInvalidDataType:invalidContents:]([BCSInvalidParsedData alloc], "initWithInvalidDataType:invalidContents:", 2, v3);
  }

LABEL_18:
  return v31;
}

+ (void)parseString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSMeCardParser: Payload length is too short", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSMeCardParser: Failed to parse contact from MECARD string", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSMeCardParser: Found contact from MECARD string", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:(_QWORD *)a3 .cold.4(void *a1, uint64_t a2, _QWORD *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = objc_begin_catch(a1);
  *a3 = v4;
  v5 = v4;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], v6, "BCSMeCardParser: Failed to parse contact from MECARD string", v7, v8, v9, v10, 0);
}

+ (void)parseString:(uint64_t)a3 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSMeCardParser: MECARD prefix is not found", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:(uint64_t)a3 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSMeCardParser: Begin parsing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
