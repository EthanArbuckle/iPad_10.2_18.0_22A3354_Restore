@implementation BCSURLDataParser

+ (id)parseString:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _BOOL8 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v4 = a3;
  v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v5)
    +[BCSURLDataParser parseString:].cold.4(v5, v6, v7, v8, v9, v10, v11, v12);
  if ((unint64_t)objc_msgSend(v4, "length") < 0xFA1)
  {
    if (objc_msgSend(v4, "_bcs_hasCaseInsensitivePrefix:", CFSTR("URL:")))
    {
      v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v14)
        +[BCSURLDataParser parseString:].cold.3(v14, v15, v16, v17, v18, v19, v20, v21);
      objc_msgSend(v4, "substringFromIndex:", 4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_bcs_trimmedString");
      v23 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v23;
    }
    objc_msgSend(MEMORY[0x24BDBCF48], "_bcs_URLWithUserTypedString:", v4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(a1, "parseURL:originalString:", v24, v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v25)
        +[BCSURLDataParser parseString:].cold.2(v25, v26, v27, v28, v29, v30, v31, v32);
      v13 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[BCSURLDataParser parseString:].cold.1(v4);
    v13 = 0;
  }

  return v13;
}

+ (id)parseURL:(id)a3
{
  return (id)objc_msgSend(a1, "parseURL:originalString:", a3, 0);
}

+ (id)parseURL:(id)a3 originalString:(id)a4
{
  id v6;
  id v7;
  BCSParsedURLData *v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  BCSParsedURLData *v41;
  id v42;
  uint64_t v43;
  _BOOL8 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  BCSParsedURLData *v52;
  void *v53;
  BCSParsedURLData *v54;
  _BOOL8 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _BOOL8 v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _BOOL8 v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v85;
  _QWORD v86[5];
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "_bcs_isMapsURL"))
  {
    objc_msgSend(v6, "scheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lowercaseString");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!-[__CFString length](v10, "length"))
    {
      v20 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v20)
        +[BCSURLDataParser parseURL:originalString:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);
      v8 = 0;
      goto LABEL_45;
    }
    if ((-[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("smsto")) & 1) != 0
      || -[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("sms")))
    {
      objc_msgSend(a1, "_canonicalizeMessageURL:", v6);
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = CFSTR("sms");
      v6 = (id)v11;
    }
    if (-[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("continuitycamera")))
    {
      v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v12)
        +[BCSURLDataParser parseURL:originalString:].cold.2(v12, v13, v14, v15, v16, v17, v18, v19);
      v8 = -[BCSParsedURLData initWithURL:type:]([BCSParsedURLData alloc], "initWithURL:type:", v6, 15);
      goto LABEL_45;
    }
    v87 = 0;
    v88 = &v87;
    v89 = 0x2050000000;
    v28 = (void *)getHMAccessorySetupCoordinatorClass_softClass;
    v90 = getHMAccessorySetupCoordinatorClass_softClass;
    if (!getHMAccessorySetupCoordinatorClass_softClass)
    {
      v86[0] = MEMORY[0x24BDAC760];
      v86[1] = 3221225472;
      v86[2] = __getHMAccessorySetupCoordinatorClass_block_invoke;
      v86[3] = &unk_24D787158;
      v86[4] = &v87;
      __getHMAccessorySetupCoordinatorClass_block_invoke((uint64_t)v86);
      v28 = (void *)v88[3];
    }
    v29 = objc_retainAutorelease(v28);
    _Block_object_dispose(&v87, 8);
    objc_msgSend(v6, "absoluteString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "communicationProtocolForSetupPayloadURLString:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      v32 = objc_msgSend(v31, "integerValue");
      if (v32 == 2)
      {
        v63 = (void *)MEMORY[0x24BDBCF48];
        v64 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v6, "absoluteString");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "stringWithFormat:", CFSTR("com.apple.Home-private://addAccessory?payload=%@"), v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "_bcs_URLWithUserTypedString:", v66);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        v67 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
        if (v67)
          +[BCSURLDataParser parseURL:originalString:].cold.7(v67, v68, v69, v70, v71, v72, v73, v74);
        v54 = -[BCSParsedURLData initWithURL:type:]([BCSParsedURLData alloc], "initWithURL:type:", v53, 12);
        goto LABEL_36;
      }
      if (v32 == 1)
      {
        v33 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
        if (v33)
          +[BCSURLDataParser parseURL:originalString:].cold.6(v33, v34, v35, v36, v37, v38, v39, v40);
        v41 = [BCSParsedURLData alloc];
        v42 = v6;
        v43 = 9;
        goto LABEL_42;
      }
    }
    if (!objc_msgSend(v6, "_bcs_isSHCURL"))
    {
      if (objc_msgSend(v6, "_bcs_isWalletRemoteRequestURL") && _os_feature_enabled_impl())
      {
        v41 = [BCSParsedURLData alloc];
        v42 = v6;
        v43 = 16;
      }
      else if (objc_msgSend(v6, "as_isPasskeyRegistrationURL"))
      {
        v55 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
        if (v55)
          +[BCSURLDataParser parseURL:originalString:].cold.4(v55, v56, v57, v58, v59, v60, v61, v62);
        v41 = [BCSParsedURLData alloc];
        v42 = v6;
        v43 = 14;
      }
      else if ((objc_msgSend(v6, "as_isPasskeyURL") & 1) != 0
             || objc_msgSend(v6, "_bcs_hasScheme:", CFSTR("fido")))
      {
        v75 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
        if (v75)
          +[BCSURLDataParser parseURL:originalString:].cold.5(v75, v76, v77, v78, v79, v80, v81, v82);
        v41 = [BCSParsedURLData alloc];
        v42 = v6;
        v43 = 13;
      }
      else
      {
        v85 = objc_msgSend(a1, "_dataTypeForSchemeIfSupportedByDataDetectors:", v10);
        v41 = [BCSParsedURLData alloc];
        v42 = v6;
        if (!v85)
        {
          v83 = -[BCSParsedURLData initWithURL:](v41, "initWithURL:", v6);
          goto LABEL_43;
        }
        v43 = v85;
      }
LABEL_42:
      v83 = -[BCSParsedURLData initWithURL:type:](v41, "initWithURL:type:", v42, v43);
LABEL_43:
      v8 = (BCSParsedURLData *)v83;
      goto LABEL_44;
    }
    v44 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v44)
      +[BCSURLDataParser parseURL:originalString:].cold.3(v44, v45, v46, v47, v48, v49, v50, v51);
    v52 = [BCSParsedURLData alloc];
    objc_msgSend(v6, "_bcs_redirectedHealthURLWithOriginalString:", v7);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = -[BCSParsedURLData initWithURL:](v52, "initWithURL:", v53);
LABEL_36:
    v8 = v54;

LABEL_44:
LABEL_45:

    goto LABEL_46;
  }
  v8 = -[BCSParsedURLData initWithURL:type:]([BCSParsedURLData alloc], "initWithURL:type:", v6, 6);
LABEL_46:

  return v8;
}

+ (int64_t)_dataTypeForSchemeIfSupportedByDataDetectors:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("tel")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("facetime")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("facetime-audio")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("mailto")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("sms")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_canonicalizeMessageURL:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = (objc_class *)MEMORY[0x24BDD1808];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithURL:resolvingAgainstBaseURL:", v4, 0);
  objc_msgSend(v4, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("smsto"));

  if (v8)
  {
    objc_msgSend(v5, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "rangeOfString:", CFSTR(":"));
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v9, "substringToIndex:", v10);
      v11 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "setPath:", v11);
      v9 = (void *)v11;
    }
    objc_msgSend(v5, "setQuery:", 0);

  }
  objc_msgSend(v5, "setScheme:", CFSTR("sms"));
  objc_msgSend(v5, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (void)parseString:(void *)a1 .cold.1(void *a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 134217984;
  v2 = objc_msgSend(a1, "length");
  _os_log_error_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "BCSURLDataParser: QR code payload, with %ld characters, is too long", (uint8_t *)&v1, 0xCu);
}

+ (void)parseString:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSURLDataParser: Cannot create URL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSURLDataParser: QR code payload has the URL: scheme", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSURLDataParser: Begin parsing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseURL:(uint64_t)a3 originalString:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSURLDataParser: URL has no scheme", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseURL:(uint64_t)a3 originalString:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSURLDataParser: Found Continuity Camera URL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseURL:(uint64_t)a3 originalString:(uint64_t)a4 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSURLDataParser: Found SMARTHealthCard URL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseURL:(uint64_t)a3 originalString:(uint64_t)a4 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSURLDataParser: Found Passkey Registration URL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseURL:(uint64_t)a3 originalString:(uint64_t)a4 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSURLDataParser: Found Passkey Assertion URL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseURL:(uint64_t)a3 originalString:(uint64_t)a4 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSURLDataParser: Found HomeKit URL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseURL:(uint64_t)a3 originalString:(uint64_t)a4 .cold.7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSURLDataParser: Found CHIP URL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
