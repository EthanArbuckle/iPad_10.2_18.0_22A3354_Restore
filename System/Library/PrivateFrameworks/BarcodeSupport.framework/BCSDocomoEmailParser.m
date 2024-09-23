@implementation BCSDocomoEmailParser

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
  BCSInvalidParsedData *v20;
  void *v21;
  void *v22;
  BCSKeyValueParser *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
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
  void *v48;
  _BOOL8 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _BOOL8 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  _BOOL8 v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  BCSParsedURLData *v75;
  _BOOL8 v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint8_t buf[16];

  v3 = a3;
  v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v4)
    +[BCSDocomoEmailParser parseString:].cold.8(v4, v5, v6, v7, v8, v9, v10, v11);
  if ((unint64_t)objc_msgSend(v3, "length") > 6)
  {
    objc_msgSend(v3, "substringToIndex:", 7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lowercaseString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v22, "isEqualToString:", CFSTR("matmsg:")) & 1) == 0)
    {
      v40 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v40)
        +[BCSDocomoEmailParser parseString:].cold.7(v40, v41, v42, v43, v44, v45, v46, v47);
      v20 = 0;
      goto LABEL_36;
    }
    v23 = -[BCSKeyValueParser initWithString:startIndex:]([BCSKeyValueParser alloc], "initWithString:startIndex:", v3, 7);
    -[BCSKeyValueParser keyValuePairs](v23, "keyValuePairs");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("TO"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_bcs_trimmedString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("SUB"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("BODY"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "length");
    v30 = objc_msgSend(v28, "length");
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("mailto:"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "length") && objc_msgSend(v26, "_bcs_looksLikeEmailAddress"))
    {
      objc_msgSend(v31, "appendString:", v26);
      v32 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v32)
        +[BCSDocomoEmailParser parseString:].cold.6(v32, v33, v34, v35, v36, v37, v38, v39);
    }
    else if (!(v29 | v30))
    {
      v57 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v57)
        +[BCSDocomoEmailParser parseString:].cold.5(v57, v58, v59, v60, v61, v62, v63, v64);
      v20 = -[BCSInvalidParsedData initWithInvalidDataType:invalidContents:]([BCSInvalidParsedData alloc], "initWithInvalidDataType:invalidContents:", 3, v3);
      goto LABEL_35;
    }
    if (v29 | v30)
    {
      objc_msgSend(v31, "appendString:", CFSTR("?"));
      if (v29)
      {
        objc_msgSend(v27, "_bcs_urlEncodedQueryValue");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "appendFormat:", CFSTR("subject=%@"), v48);

        v49 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
        if (v49)
        {
          +[BCSDocomoEmailParser parseString:].cold.4(v49, v50, v51, v52, v53, v54, v55, v56);
          if (v30)
            goto LABEL_20;
        }
        else if (v30)
        {
LABEL_20:
          objc_msgSend(v31, "appendString:", CFSTR("&"));
          goto LABEL_25;
        }
      }
      else if (v30)
      {
LABEL_25:
        objc_msgSend(v28, "_bcs_urlEncodedQueryValue");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "appendFormat:", CFSTR("body=%@"), v65);

        v66 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
        if (v66)
          +[BCSDocomoEmailParser parseString:].cold.3(v66, v67, v68, v69, v70, v71, v72, v73);
      }
    }
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v31);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (v74)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSDocomoEmailParser: Successfully converted matmsg data to mailto link", buf, 2u);
      }
      v75 = -[BCSParsedURLData initWithURL:type:]([BCSParsedURLData alloc], "initWithURL:type:", v74, 3);
    }
    else
    {
      v76 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v76)
        +[BCSDocomoEmailParser parseString:].cold.2(v76, v77, v78, v79, v80, v81, v82, v83);
      v75 = -[BCSInvalidParsedData initWithInvalidDataType:invalidContents:]([BCSInvalidParsedData alloc], "initWithInvalidDataType:invalidContents:", 3, v3);
    }
    v20 = (BCSInvalidParsedData *)v75;

LABEL_35:
LABEL_36:

    goto LABEL_37;
  }
  v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v12)
    +[BCSDocomoEmailParser parseString:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
  v20 = 0;
LABEL_37:

  return v20;
}

+ (void)parseString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSDocomoEmailParser: Payload length is too short", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSDocomoEmailParser: Converted mailto URL cannot be constructed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSDocomoEmailParser: Parsed email body", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSDocomoEmailParser: Parsed email subject", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:(uint64_t)a3 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSDocomoEmailParser: matmsg has no valid email address, subject, or body", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:(uint64_t)a3 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSDocomoEmailParser: Parsed valid recipient email", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:(uint64_t)a3 .cold.7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSDocomoEmailParser: matmsg scheme not found", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:(uint64_t)a3 .cold.8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSDocomoEmailParser: Begin parsing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
