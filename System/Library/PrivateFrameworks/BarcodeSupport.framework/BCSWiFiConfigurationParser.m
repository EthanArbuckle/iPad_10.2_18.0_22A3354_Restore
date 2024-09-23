@implementation BCSWiFiConfigurationParser

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
  BCSKeyValueParser *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BCSKeyValueParser *v29;
  void *v30;
  BCSInvalidParsedData *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL8 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _BOOL8 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _BOOL8 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint8_t buf[16];

  v3 = a3;
  v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v4)
    +[BCSWiFiConfigurationParser parseString:].cold.5(v4, v5, v6, v7, v8, v9, v10, v11);
  if ((unint64_t)objc_msgSend(v3, "length") > 4)
  {
    if ((objc_msgSend(v3, "hasPrefix:", CFSTR("WIFI:")) & 1) == 0)
    {
      v36 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v36)
        +[BCSWiFiConfigurationParser parseString:].cold.4(v36, v37, v38, v39, v40, v41, v42, v43);
      goto LABEL_25;
    }
    v20 = -[BCSKeyValueParser initWithString:startIndex:]([BCSKeyValueParser alloc], "initWithString:startIndex:", v3, 5);
    -[BCSKeyValueParser keyValuePairs](v20, "keyValuePairs");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("S"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v22, "length"))
    {
      v44 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v44)
        +[BCSWiFiConfigurationParser parseString:].cold.2(v44, v45, v46, v47, v48, v49, v50, v51);
      v31 = -[BCSInvalidParsedData initWithInvalidDataType:invalidContents:]([BCSInvalidParsedData alloc], "initWithInvalidDataType:invalidContents:", 8, v3);
      goto LABEL_29;
    }
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("T"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("P"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("H"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "BOOLValue");

    if (objc_msgSend(v23, "isEqualToString:", CFSTR("WEP")))
    {
      objc_msgSend(v24, "_bcs_stringWithEnclosingDoubleQuotesRemoved");
      v27 = objc_claimAutoreleasedReturnValue();

      v24 = (void *)v27;
    }
    if (v23 && !objc_msgSend(v23, "isEqualToString:", CFSTR("nopass")))
    {
      if ((objc_msgSend(v23, "isEqualToString:", CFSTR("WEP")) & 1) != 0)
      {
        v28 = 1;
      }
      else
      {
        if ((objc_msgSend(v23, "isEqualToString:", CFSTR("WPA")) & 1) == 0
          && (objc_msgSend(v23, "isEqualToString:", CFSTR("WPA2")) & 1) == 0
          && (objc_msgSend(v23, "isEqualToString:", CFSTR("WPA/WPA2")) & 1) == 0
          && (objc_msgSend(v23, "isEqualToString:", CFSTR("SAE")) & 1) == 0)
        {
          v53 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v53)
            +[BCSWiFiConfigurationParser parseString:].cold.3(v53, v54, v55, v56, v57, v58, v59, v60);
          v31 = -[BCSInvalidParsedData initWithInvalidDataType:invalidContents:]([BCSInvalidParsedData alloc], "initWithInvalidDataType:invalidContents:", 8, v3);
          goto LABEL_22;
        }
        v28 = 0;
      }
    }
    else
    {

      v28 = 0;
      v24 = 0;
    }
    v61 = v23;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSWiFiConfigurationParser: Successfully parsed WiFi Network configuration", buf, 2u);
    }
    v29 = v20;
    v30 = v22;
    v31 = -[BCSWiFiConfigurationData initWithSSID:isWEP:password:isHidden:]([BCSWiFiConfigurationData alloc], "initWithSSID:isWEP:password:isHidden:", v22, v28, v24, v26);
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("AAB"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("AAP"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("CPT"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32 && v33)
    {
      -[BCSInvalidParsedData setAirplayBrokerID:](v31, "setAirplayBrokerID:", v32);
      -[BCSInvalidParsedData setAirplayBrokerPin:](v31, "setAirplayBrokerPin:", v33);
    }
    -[BCSInvalidParsedData airplayBrokerID](v31, "airplayBrokerID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35 && v34)
      -[BCSInvalidParsedData setCaptivePortalToken:](v31, "setCaptivePortalToken:", v34);

    v20 = v29;
    v22 = v30;
    v23 = v61;
LABEL_22:

LABEL_29:
    goto LABEL_30;
  }
  v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v12)
    +[BCSWiFiConfigurationParser parseString:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
LABEL_25:
  v31 = 0;
LABEL_30:

  return v31;
}

+ (void)parseString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSWiFiConfigurationParser: Payload length is too short", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSWiFiConfigurationParser: Network SSID not specified", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSWiFiConfigurationParser: Illegal authentication type specified", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSWiFiConfigurationParser: WIFI scheme not found", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:(uint64_t)a3 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSWiFiConfigurationParser: Begin parsing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
