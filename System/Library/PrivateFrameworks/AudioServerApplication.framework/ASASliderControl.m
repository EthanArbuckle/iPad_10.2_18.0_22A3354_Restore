@implementation ASASliderControl

- (void)setValue:(unsigned int)a3
{
  uint8_t v3[12];
  unsigned int v4;

  v4 = a3;
  if (!-[ASAObject setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1935962742, &v4, 4, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not set value property\n", v3, 2u);
  }
}

- (unsigned)value
{
  uint8_t v3[8];
  unsigned int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1935962742, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read value property\n", v3, 2u);
  }
  return v4;
}

- (_ASASliderRange)range
{
  uint8_t v3[4];
  int v4;
  _ASASliderRange v5;

  v4 = 8;
  v5 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1935962738, &v5, &v4, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read range property\n", v3, 2u);
  }
  return v5;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  _ASASliderRange v8;
  objc_super v10;

  v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ASASliderControl;
  v6 = a3;
  -[ASAControl diagnosticDescriptionWithIndent:walkTree:](&v10, sel_diagnosticDescriptionWithIndent_walkTree_, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ASASliderControl range](self, "range");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Value: %u\n"), v6, -[ASASliderControl value](self, "value"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Range: Min %u Max %u\n"), v6, v8, HIDWORD(*(unint64_t *)&v8));

  return v7;
}

- (id)coreAudioClassName
{
  return CFSTR("AudioSliderControl");
}

@end
