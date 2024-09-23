@implementation ADInFieldCalibrationInterSessionData

- (id)persistenceData
{
  return (id)objc_opt_new();
}

- (ADInFieldCalibrationInterSessionData)initWithDictionaryRepresentation:(id)a3
{
  ADInFieldCalibrationInterSessionData *v4;

  v4 = (ADInFieldCalibrationInterSessionData *)objc_opt_new();

  return v4;
}

- (ADInFieldCalibrationInterSessionData)init
{
  ADInFieldCalibrationInterSessionData *v2;
  ADInterSessionFilterParameters *v3;
  ADInterSessionFilterParameters *isfParameters;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ADInFieldCalibrationInterSessionData;
  v2 = -[ADInFieldCalibrationInterSessionData init](&v6, sel_init);
  if (v2)
  {
    v3 = (ADInterSessionFilterParameters *)objc_alloc_init(MEMORY[0x24BE05FD8]);
    isfParameters = v2->_isfParameters;
    v2->_isfParameters = v3;

    v2->_version = 0;
  }
  return v2;
}

- (BOOL)reset
{
  return 0;
}

- (int64_t)insertEntryAndCalculate:(id)a3 withWeight:(double)a4 toResult:(id *)a5
{
  id v6;

  -[ADInterSessionFilter insertEntryAndCalculate:withWeight:](self->_isf, "insertEntryAndCalculate:withWeight:", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  *a5 = v6;
  if (v6)
    return 0;
  else
    return -22950;
}

- (BOOL)writeToFile:(id)a3 atomically:(BOOL)a4
{
  NSObject *v4;
  os_log_type_t v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (ADDebugUtilsADVerboseLogsEnabled)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136446466;
      v8 = "/Library/Caches/com.apple.xbs/Sources/AppleDepth/AppleDepth/Utils/ADInFieldCalibrationInterSessionData.mm";
      v9 = 2082;
      v10 = "-[ADInFieldCalibrationInterSessionData writeToFile:atomically:]";
      v4 = MEMORY[0x24BDACB70];
      v5 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_20B62B000, v4, v5, "Deprecated function was called: %{public}s : %{public}s", (uint8_t *)&v7, 0x16u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v7 = 136446466;
    v8 = "/Library/Caches/com.apple.xbs/Sources/AppleDepth/AppleDepth/Utils/ADInFieldCalibrationInterSessionData.mm";
    v9 = 2082;
    v10 = "-[ADInFieldCalibrationInterSessionData writeToFile:atomically:]";
    v4 = MEMORY[0x24BDACB70];
    v5 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }
  return 0;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isf, 0);
  objc_storeStrong((id *)&self->_isfParameters, 0);
}

+ (id)interSessionDataFromFile:(id)a3
{
  NSObject *v3;
  os_log_type_t v4;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (ADDebugUtilsADVerboseLogsEnabled)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136446466;
      v7 = "/Library/Caches/com.apple.xbs/Sources/AppleDepth/AppleDepth/Utils/ADInFieldCalibrationInterSessionData.mm";
      v8 = 2082;
      v9 = "+[ADInFieldCalibrationInterSessionData interSessionDataFromFile:]";
      v3 = MEMORY[0x24BDACB70];
      v4 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_20B62B000, v3, v4, "Deprecated function was called: %{public}s : %{public}s", (uint8_t *)&v6, 0x16u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v6 = 136446466;
    v7 = "/Library/Caches/com.apple.xbs/Sources/AppleDepth/AppleDepth/Utils/ADInFieldCalibrationInterSessionData.mm";
    v8 = 2082;
    v9 = "+[ADInFieldCalibrationInterSessionData interSessionDataFromFile:]";
    v3 = MEMORY[0x24BDACB70];
    v4 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }
  return 0;
}

@end
