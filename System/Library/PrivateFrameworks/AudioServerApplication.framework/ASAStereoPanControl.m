@implementation ASAStereoPanControl

- (void)setValue:(float)a3
{
  uint8_t v3[12];
  float v4;

  v4 = a3;
  if (!-[ASAObject setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1936745334, &v4, 4, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not set value property\n", v3, 2u);
  }
}

- (float)value
{
  uint8_t v3[8];
  float v4;
  int v5;

  v5 = 4;
  v4 = 0.0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1936745334, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read value property\n", v3, 2u);
  }
  return v4;
}

- (unsigned)getPanChannel:(BOOL)a3
{
  _BOOL4 v3;
  uint8_t v5[12];
  int v6;
  _QWORD v7[2];

  v3 = a3;
  v7[1] = *MEMORY[0x24BDAC8D0];
  v7[0] = 0;
  v6 = 8;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1936745315, v7, &v6, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read panning channels property\n", v5, 2u);
  }
  return *(_DWORD *)((unint64_t)v7 | (4 * !v3));
}

- (unsigned)leftPanChannel
{
  return -[ASAStereoPanControl getPanChannel:](self, "getPanChannel:", 1);
}

- (unsigned)rightPanChannel
{
  return -[ASAStereoPanControl getPanChannel:](self, "getPanChannel:", 0);
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  float v8;
  objc_super v10;

  v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ASAStereoPanControl;
  v6 = a3;
  -[ASAControl diagnosticDescriptionWithIndent:walkTree:](&v10, sel_diagnosticDescriptionWithIndent_walkTree_, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAStereoPanControl value](self, "value");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Value: %f\n"), v6, v8, v10.receiver, v10.super_class);
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Left Pan Channel: %d\n"), v6, -[ASAStereoPanControl leftPanChannel](self, "leftPanChannel"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Right Pan Channel: %d\n"), v6, -[ASAStereoPanControl rightPanChannel](self, "rightPanChannel"));

  return v7;
}

- (id)coreAudioClassName
{
  return CFSTR("AudioStereoPanControl");
}

@end
