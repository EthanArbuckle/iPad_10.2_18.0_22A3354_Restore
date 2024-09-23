@implementation BCSSMSTODataParser

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
  BCSParsedURLData *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  BCSParsedURLData *v41;
  void *v42;

  v3 = a3;
  v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v4)
    +[BCSSMSTODataParser parseString:].cold.3(v4, v5, v6, v7, v8, v9, v10, v11);
  if ((unint64_t)objc_msgSend(v3, "length") > 5)
  {
    objc_msgSend(v3, "substringToIndex:", 6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lowercaseString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v22, "isEqualToString:", CFSTR("smsto:")) & 1) != 0)
    {
      objc_msgSend(v3, "substringFromIndex:", 6);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "rangeOfString:", CFSTR(":"));
      if (v24 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v25 = 0;
      }
      else
      {
        v34 = v24;
        objc_msgSend(v23, "substringFromIndex:", v24 + 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "substringToIndex:", v34);
        v35 = objc_claimAutoreleasedReturnValue();

        v23 = (void *)v35;
      }
      objc_msgSend(v23, "_bcs_trimmedString");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = objc_msgSend(v25, "length");
      v38 = (void *)MEMORY[0x24BDD17C8];
      if (v37)
      {
        objc_msgSend(v25, "_bcs_urlEncodedQueryValue");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "stringWithFormat:", CFSTR("sms:%@&body=%@"), v36, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sms:%@"), v36);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v41 = [BCSParsedURLData alloc];
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[BCSParsedURLData initWithURL:type:](v41, "initWithURL:type:", v42, 5);

    }
    else
    {
      v26 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v26)
        +[BCSSMSTODataParser parseString:].cold.2(v26, v27, v28, v29, v30, v31, v32, v33);
      v20 = 0;
    }

  }
  else
  {
    v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v12)
      +[BCSSMSTODataParser parseString:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    v20 = 0;
  }

  return v20;
}

+ (void)parseString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSSMSTODataParser: Payload length is too short", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSSMSTODataParser: smsto scheme not found.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSSMSTODataParser: Begin parsing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
