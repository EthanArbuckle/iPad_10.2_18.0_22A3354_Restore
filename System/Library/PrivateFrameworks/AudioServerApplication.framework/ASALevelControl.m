@implementation ASALevelControl

- (void)setScalarValue:(float)a3
{
  uint8_t v3[12];
  float v4;

  v4 = a3;
  if (!-[ASAObject setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1818456950, &v4, 4, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not set scalar value property\n", v3, 2u);
  }
}

- (float)scalarValue
{
  uint8_t v3[8];
  float v4;
  int v5;

  v5 = 4;
  v4 = 0.0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1818456950, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read current item property\n", v3, 2u);
  }
  return v4;
}

- (void)setDecibelValue:(float)a3
{
  uint8_t v3[12];
  float v4;

  v4 = a3;
  if (!-[ASAObject setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1818453110, &v4, 4, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not set decibel value property\n", v3, 2u);
  }
}

- (float)decibelValue
{
  uint8_t v3[8];
  float v4;
  int v5;

  v5 = 4;
  v4 = 0.0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1818453110, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read current item property\n", v3, 2u);
  }
  return v4;
}

- (float)minimumDecibelValue
{
  double v2;

  -[ASALevelControl decibelRange](self, "decibelRange");
  return v2;
}

- (float)maximumDecibelValue
{
  double v2;

  -[ASALevelControl decibelRange](self, "decibelRange");
  return v2;
}

- (AudioValueRange)decibelRange
{
  double v2;
  double v3;
  uint8_t v4[12];
  int v5;
  double v6;
  double v7;
  AudioValueRange result;

  v5 = 16;
  v6 = 0.0;
  v7 = 0.0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1818453106, &v6, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read decibel range property\n", v4, 2u);
  }
  v2 = v6;
  v3 = v7;
  result.mMaximum = v3;
  result.mMinimum = v2;
  return result;
}

- (float)scalarFromDecibel:(float)a3
{
  uint8_t v4[4];
  float v5;
  int v6;
  float v7;

  v7 = a3;
  v5 = 0.0;
  v6 = 4;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1818453107, &v5, &v6, &v7, 4)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read decibel to scalar property\n", v4, 2u);
  }
  return v5;
}

- (float)decibelFromScalar:(float)a3
{
  uint8_t v4[4];
  float v5;
  int v6;
  float v7;

  v7 = a3;
  v5 = 0.0;
  v6 = 4;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1818456932, &v5, &v6, &v7, 4)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read scalar to decibel property\n", v4, 2u);
  }
  return v5;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  float v8;
  float v9;
  float v10;
  double v11;
  float v12;
  objc_super v14;

  v4 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASALevelControl;
  v6 = a3;
  -[ASAControl diagnosticDescriptionWithIndent:walkTree:](&v14, sel_diagnosticDescriptionWithIndent_walkTree_, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASALevelControl scalarValue](self, "scalarValue");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Scalar Value: %f\n"), v6, v8);
  -[ASALevelControl decibelValue](self, "decibelValue");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Decibel Value: %f\n"), v6, v9);
  -[ASALevelControl minimumDecibelValue](self, "minimumDecibelValue");
  v11 = v10;
  -[ASALevelControl maximumDecibelValue](self, "maximumDecibelValue");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Decibel Range: Min %f Max %f\n"), v6, *(_QWORD *)&v11, v12);

  return v7;
}

- (id)coreAudioClassName
{
  unsigned int v2;
  const __CFString *v3;

  v2 = -[ASAObject objectClass](self, "objectClass");
  v3 = CFSTR("AudioLevelControl");
  if (v2 == 1986817381)
    v3 = CFSTR("AudioVolumeControl");
  if (v2 == 1937072758)
    return CFSTR("AudioLFEVolumeControl");
  else
    return (id)v3;
}

@end
