@implementation CAFCharacteristicMetadata

- (NSString)formatString
{
  return (NSString *)NSStringFromCharacteristicMetadataFormat(-[CAFCharacteristicMetadata format](self, "format"));
}

- (CAFCharacteristicMetadata)initWithConfig:(id)a3
{
  id v4;
  CAFCharacteristicMetadata *v5;
  id v6;
  id v7;
  id v8;
  NSNumber *v9;
  NSNumber *minimumValue;
  id v11;
  NSNumber *v12;
  NSNumber *maximumValue;
  id v14;
  NSNumber *v15;
  NSNumber *maximumLength;
  id v17;
  NSNumber *v18;
  NSNumber *stepValue;
  id v20;
  NSArray *v21;
  NSArray *validValues;
  id v23;
  NSNumber *v24;
  NSNumber *units;
  NSObject *v26;
  CAFCharacteristicMetadata *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CAFCharacteristicMetadata;
  v5 = -[CAFCharacteristicMetadata init](&v29, sel_init);
  if (v5)
  {
    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("format"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    if (v7)
    {
      v5->_format = objc_msgSend(v7, "unsignedIntValue");
      objc_opt_class();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minimumValue"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (v8 && (objc_opt_isKindOfClass() & 1) != 0)
        v9 = (NSNumber *)v8;
      else
        v9 = 0;

      minimumValue = v5->_minimumValue;
      v5->_minimumValue = v9;

      objc_opt_class();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maximumValue"));
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v11 && (objc_opt_isKindOfClass() & 1) != 0)
        v12 = (NSNumber *)v11;
      else
        v12 = 0;

      maximumValue = v5->_maximumValue;
      v5->_maximumValue = v12;

      objc_opt_class();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maximumLength"));
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v14 && (objc_opt_isKindOfClass() & 1) != 0)
        v15 = (NSNumber *)v14;
      else
        v15 = 0;

      maximumLength = v5->_maximumLength;
      v5->_maximumLength = v15;

      objc_opt_class();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stepValue"));
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (v17 && (objc_opt_isKindOfClass() & 1) != 0)
        v18 = (NSNumber *)v17;
      else
        v18 = 0;

      stepValue = v5->_stepValue;
      v5->_stepValue = v18;

      objc_opt_class();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("validValues"));
      v20 = (id)objc_claimAutoreleasedReturnValue();
      if (v20 && (objc_opt_isKindOfClass() & 1) != 0)
        v21 = (NSArray *)v20;
      else
        v21 = 0;

      validValues = v5->_validValues;
      v5->_validValues = v21;

      objc_opt_class();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("units"));
      v23 = (id)objc_claimAutoreleasedReturnValue();
      if (v23 && (objc_opt_isKindOfClass() & 1) != 0)
        v24 = (NSNumber *)v23;
      else
        v24 = 0;

      units = v5->_units;
      v5->_units = v24;

      switch(v5->_format)
      {
        case 1uLL:
        case 2uLL:
        case 3uLL:
        case 4uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
        case 8uLL:
        case 9uLL:
          if (v5->_minimumValue && v5->_maximumValue && v5->_stepValue)
            goto LABEL_50;
          CAFCharacteristicLogging();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            -[CAFCharacteristicMetadata initWithConfig:].cold.3();
          goto LABEL_39;
        case 0xAuLL:
          if (v5->_maximumLength)
            goto LABEL_50;
          CAFCharacteristicLogging();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            -[CAFCharacteristicMetadata initWithConfig:].cold.4();
          goto LABEL_39;
        case 0xBuLL:
          if (v5->_maximumLength)
            goto LABEL_50;
          CAFCharacteristicLogging();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            -[CAFCharacteristicMetadata initWithConfig:].cold.5();
          goto LABEL_39;
        case 0xCuLL:
          if (v5->_maximumLength)
            goto LABEL_50;
          CAFCharacteristicLogging();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            -[CAFCharacteristicMetadata initWithConfig:].cold.2();
          goto LABEL_39;
        case 0xDuLL:
          if (v5->_maximumLength)
            goto LABEL_50;
          CAFCharacteristicLogging();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            -[CAFCharacteristicMetadata initWithConfig:].cold.6();
          goto LABEL_39;
        default:
LABEL_50:

          goto LABEL_51;
      }
    }
    CAFCharacteristicLogging();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[CAFCharacteristicMetadata initWithConfig:].cold.1();
LABEL_39:

    v27 = 0;
  }
  else
  {
LABEL_51:
    v27 = v5;
  }

  return v27;
}

- (unint64_t)format
{
  return self->_format;
}

- (NSNumber)minimumValue
{
  return self->_minimumValue;
}

- (NSNumber)maximumValue
{
  return self->_maximumValue;
}

- (NSNumber)maximumLength
{
  return self->_maximumLength;
}

- (NSNumber)stepValue
{
  return self->_stepValue;
}

- (NSArray)validValues
{
  return self->_validValues;
}

- (NSNumber)units
{
  return self->_units;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_units, 0);
  objc_storeStrong((id *)&self->_validValues, 0);
  objc_storeStrong((id *)&self->_stepValue, 0);
  objc_storeStrong((id *)&self->_maximumLength, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
}

- (void)initWithConfig:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_1(&dword_237717000, v0, v1, "Parsing characteristic metadata failed for format", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_15();
}

- (void)initWithConfig:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_1(&dword_237717000, v0, v1, "Parsing characteristic metadata failed for dictionary format constraints", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_15();
}

- (void)initWithConfig:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_1(&dword_237717000, v0, v1, "Parsing characteristic metadata failed for number format constraints", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_15();
}

- (void)initWithConfig:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_1(&dword_237717000, v0, v1, "Parsing characteristic metadata failed for string format constraints", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_15();
}

- (void)initWithConfig:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_1(&dword_237717000, v0, v1, "Parsing characteristic metadata failed for data format constraints", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_15();
}

- (void)initWithConfig:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_1(&dword_237717000, v0, v1, "Parsing characteristic metadata failed for array format constraints", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_15();
}

@end
