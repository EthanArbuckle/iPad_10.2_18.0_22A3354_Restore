@implementation BCSAWDLogger

+ (id)sharedLogger
{
  return +[BCSAnalyticsLogger sharedLogger](BCSAnalyticsLogger, "sharedLogger");
}

- (id)barcodeDetectedEventForAction:(id)a3
{
  id v4;
  AWDBarcodeSupportCodeDetectedEvent *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  id v9;
  uint64_t v10;

  v4 = a3;
  v5 = objc_alloc_init(AWDBarcodeSupportCodeDetectedEvent);
  -[AWDBarcodeSupportCodeDetectedEvent setClientType:](v5, "setClientType:", -[BCSAWDLogger _awdBarcodeClientType](self, "_awdBarcodeClientType"));
  -[AWDBarcodeSupportCodeDetectedEvent setBarcodeSourceType:](v5, "setBarcodeSourceType:", -[BCSAWDLogger _awdBarcodeSourceTypeForAction:](self, "_awdBarcodeSourceTypeForAction:", v4));
  -[AWDBarcodeSupportCodeDetectedEvent setBarcodeDataType:](v5, "setBarcodeDataType:", -[BCSAWDLogger _awdBarcodeDataTypeFromAction:](self, "_awdBarcodeDataTypeFromAction:", v4));
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AWDBarcodeSupportCodeDetectedEvent setInvalidBarcodeDataType:](v5, "setInvalidBarcodeDataType:", -[BCSAWDLogger _awdInvalidBarcodeDataTypeFromInvalidData:](self, "_awdInvalidBarcodeDataTypeFromInvalidData:", v8));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v4;
    -[AWDBarcodeSupportCodeDetectedEvent setBarcodeURLType:](v5, "setBarcodeURLType:", -[BCSAWDLogger _awdBarcodeURLTypeFromURLAction:](self, "_awdBarcodeURLTypeFromURLAction:", v9));
    v10 = -[BCSAWDLogger _awdBarcodePreferredAppLinkOpenStrategyFromURLAction:](self, "_awdBarcodePreferredAppLinkOpenStrategyFromURLAction:", v9);

    -[AWDBarcodeSupportCodeDetectedEvent setAppLinkPreferredOpenStrategy:](v5, "setAppLinkPreferredOpenStrategy:", v10);
  }

  return v5;
}

- (void)logBarcodeDetectedEvent:(id)a3 startTime:(unint64_t)a4
{
  id v5;
  _BOOL4 v6;

  v5 = a3;
  objc_msgSend(v5, "setDetectionTimeMs:", (clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - a4) / 0xF4240);
  AWDPostMetric();
  LODWORD(a4) = objc_msgSend(v5, "barcodeDataType");
  v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if ((_DWORD)a4)
  {
    if (v6)
      -[BCSAWDLogger logBarcodeDetectedEvent:startTime:].cold.2(v5);
  }
  else if (v6)
  {
    -[BCSAWDLogger logBarcodeDetectedEvent:startTime:].cold.1(v5);
  }

}

- (void)logBarcodeDetectedEventForAction:(id)a3 startTime:(unint64_t)a4
{
  id v6;

  -[BCSAWDLogger barcodeDetectedEventForAction:](self, "barcodeDetectedEventForAction:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[BCSAWDLogger logBarcodeDetectedEvent:startTime:](self, "logBarcodeDetectedEvent:startTime:", v6, a4);

}

- (void)logBarcodeActivatedEventForAction:(id)a3
{
  id v4;
  AWDBarcodeSupportCodeActivatedEvent *v5;
  id v6;
  uint64_t v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_alloc_init(AWDBarcodeSupportCodeActivatedEvent);
    -[AWDBarcodeSupportCodeActivatedEvent setClientType:](v5, "setClientType:", -[BCSAWDLogger _awdBarcodeClientType](self, "_awdBarcodeClientType"));
    -[AWDBarcodeSupportCodeActivatedEvent setBarcodeSourceType:](v5, "setBarcodeSourceType:", -[BCSAWDLogger _awdBarcodeSourceTypeForAction:](self, "_awdBarcodeSourceTypeForAction:", v4));
    -[AWDBarcodeSupportCodeActivatedEvent setBarcodeDataType:](v5, "setBarcodeDataType:", -[BCSAWDLogger _awdBarcodeDataTypeFromAction:](self, "_awdBarcodeDataTypeFromAction:", v4));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      -[AWDBarcodeSupportCodeActivatedEvent setBarcodeURLType:](v5, "setBarcodeURLType:", -[BCSAWDLogger _awdBarcodeURLTypeFromURLAction:](self, "_awdBarcodeURLTypeFromURLAction:", v6));
      v7 = -[BCSAWDLogger _awdBarcodePreferredAppLinkOpenStrategyFromURLAction:](self, "_awdBarcodePreferredAppLinkOpenStrategyFromURLAction:", v6);

      -[AWDBarcodeSupportCodeActivatedEvent setAppLinkActivationOpenStrategy:](v5, "setAppLinkActivationOpenStrategy:", v7);
    }
    AWDPostMetric();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[BCSAWDLogger logBarcodeActivatedEventForAction:].cold.1(v5);

  }
}

- (void)logBarcodePreviewedEventForContentType:(int64_t)a3
{
  AWDBarcodeSupportCodePreviewedEvent *v4;

  v4 = objc_alloc_init(AWDBarcodeSupportCodePreviewedEvent);
  -[AWDBarcodeSupportCodePreviewedEvent setPreviewContentType:](v4, "setPreviewContentType:", a3);
  AWDPostMetric();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    -[BCSAWDLogger logBarcodePreviewedEventForContentType:].cold.1();

}

- (int)_awdBarcodeDataTypeFromAction:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 > 0x10)
    return 11;
  else
    return dword_2174BF650[v4];
}

- (int)_awdBarcodeClientType
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.BarcodeSupport.BarcodeNotificationService")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (_bcs_isCurrentProcessSafari())
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)_awdBarcodeSourceTypeForAction:(id)a3
{
  if ((objc_msgSend(a3, "codeType") & 0xFFFFFFFFFFFFFFFELL) == 2)
    return 2;
  else
    return 1;
}

- (int)_awdInvalidBarcodeDataTypeFromInvalidData:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  switch(objc_msgSend(v3, "invalidDataType"))
  {
    case 0:
    case 10:
    case 11:
    case 12:
    case 15:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[BCSAWDLogger _awdInvalidBarcodeDataTypeFromInvalidData:].cold.1(v3);
      v4 = 0;
      break;
    case 2:
      v4 = 2;
      break;
    case 3:
      v4 = 3;
      break;
    case 4:
      v4 = 4;
      break;
    case 5:
      v4 = 5;
      break;
    case 6:
      v4 = 6;
      break;
    case 7:
      v4 = 7;
      break;
    case 8:
      v4 = 8;
      break;
    case 9:
      v4 = 9;
      break;
    default:
      break;
  }

  return v4;
}

- (int)_awdBarcodeURLTypeFromURLAction:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "appLinkCount");
  if (v3 == 1)
    return 1;
  else
    return 2 * (v3 != 0);
}

- (int)_awdBarcodePreferredAppLinkOpenStrategyFromURLAction:(id)a3
{
  return objc_msgSend(a3, "mustOpenAppLinkInApp");
}

- (void)logBarcodeDetectedEvent:(void *)a1 startTime:.cold.1(void *a1)
{
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;

  objc_msgSend(a1, "barcodeDataType");
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5_0();
  objc_msgSend(a1, "invalidBarcodeDataType");
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x30u);
}

- (void)logBarcodeDetectedEvent:(void *)a1 startTime:.cold.2(void *a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  objc_msgSend(a1, "barcodeDataType");
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x2Au);
}

- (void)logBarcodeActivatedEventForAction:(void *)a1 .cold.1(void *a1)
{
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;

  objc_msgSend(a1, "barcodeDataType");
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1();
  objc_msgSend(a1, "barcodeURLType");
  objc_msgSend(a1, "appLinkActivationOpenStrategy");
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x20u);
}

- (void)logBarcodePreviewedEventForContentType:.cold.1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0xCu);
}

- (void)_awdInvalidBarcodeDataTypeFromInvalidData:(void *)a1 .cold.1(void *a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 134217984;
  v2 = objc_msgSend(a1, "invalidDataType");
  _os_log_error_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "BCSAWDLogger: Encountered invalid invalidDataType: %ld", (uint8_t *)&v1, 0xCu);
}

@end
