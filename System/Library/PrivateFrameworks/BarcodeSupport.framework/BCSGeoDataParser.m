@implementation BCSGeoDataParser

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
  unint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BCSParsedURLData *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BOOL8 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v4 = a3;
  v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v5)
    +[BCSGeoDataParser parseString:].cold.4(v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = objc_msgSend(v4, "length");
  if (v13 > 3)
  {
    v23 = v13;
    objc_msgSend(v4, "substringToIndex:", 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "lowercaseString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v25, "isEqualToString:", CFSTR("geo:")) & 1) != 0)
    {
      objc_msgSend(a1, "_validateLatitudeAndLongitudeInString:range:", v4, 4, v23 - 4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "length"))
      {
        v27 = (void *)MEMORY[0x24BDBCF48];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("http://maps.apple.com/?q=%@"), v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "URLWithString:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
        if (v30)
          +[BCSGeoDataParser parseString:].cold.2(v30, v31, v32, v33, v34, v35, v36, v37);
        v22 = -[BCSParsedURLData initWithURL:type:]([BCSParsedURLData alloc], "initWithURL:type:", v29, 6);

      }
      else
      {
        v22 = -[BCSInvalidParsedData initWithInvalidDataType:invalidContents:]([BCSInvalidParsedData alloc], "initWithInvalidDataType:invalidContents:", 6, v4);
      }

    }
    else
    {
      v38 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v38)
        +[BCSGeoDataParser parseString:].cold.3(v38, v39, v40, v41, v42, v43, v44, v45);
      v22 = 0;
    }

  }
  else
  {
    v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v14)
      +[BCSGeoDataParser parseString:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
    v22 = 0;
  }

  return v22;
}

+ (id)_validateLatitudeAndLongitudeInString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BOOL8 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  length = a4.length;
  location = a4.location;
  v6 = a3;
  if (_validateLatitudeAndLongitudeInString_range__once != -1)
    dispatch_once(&_validateLatitudeAndLongitudeInString_range__once, &__block_literal_global_2);
  objc_msgSend((id)_validateLatitudeAndLongitudeInString_range__geoLatLongPattern, "firstMatchInString:options:range:", v6, 0, location, length);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    v22 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v22)
      +[BCSGeoDataParser _validateLatitudeAndLongitudeInString:range:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);
    goto LABEL_15;
  }
  v9 = objc_msgSend(v7, "rangeAtIndex:", 1);
  objc_msgSend(v6, "substringWithRange:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  if (v13 < -90.0 || v13 > 90.0)
  {
    v30 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v30)
      +[BCSGeoDataParser _validateLatitudeAndLongitudeInString:range:].cold.2(v30, v31, v32, v33, v34, v35, v36, v37);
    goto LABEL_15;
  }
  v14 = objc_msgSend(v8, "rangeAtIndex:", 2);
  objc_msgSend(v6, "substringWithRange:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  if (v18 < -180.0 || v18 > 180.0)
  {
    v38 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v38)
      +[BCSGeoDataParser _validateLatitudeAndLongitudeInString:range:].cold.3(v38, v39, v40, v41, v42, v43, v44, v45);
LABEL_15:
    v21 = 0;
    goto LABEL_16;
  }
  v19 = objc_msgSend(v8, "range");
  objc_msgSend(v6, "substringWithRange:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v21;
}

void __64__BCSGeoDataParser__validateLatitudeAndLongitudeInString_range___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", CFSTR("^(-?\\d{1,2}(?:\\.\\d+)?),(-?\\d{1,3}(?:\\.\\d+)?)"), 0, 0);
  v1 = (void *)_validateLatitudeAndLongitudeInString_range__geoLatLongPattern;
  _validateLatitudeAndLongitudeInString_range__geoLatLongPattern = v0;

}

+ (void)parseString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSGeoDataParser: Payload length is too short", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSGeoDataParser: Successfully converted geo link to maps link.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSGeoDataParser: geo scheme not found.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSGeoDataParser: Begin parsing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_validateLatitudeAndLongitudeInString:(uint64_t)a3 range:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSGeoDataParser: invalid latitude and longitude.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_validateLatitudeAndLongitudeInString:(uint64_t)a3 range:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSGeoDataParser: latitude is out of range.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_validateLatitudeAndLongitudeInString:(uint64_t)a3 range:(uint64_t)a4 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSGeoDataParser: longitude is out of range.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
