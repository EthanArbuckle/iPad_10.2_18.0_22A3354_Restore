@implementation ASAControl

- (unsigned)controlElement
{
  uint8_t v3[8];
  unsigned int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainInputProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainInputProperty:withData:ofSize:withQualifier:ofSize:", 1667591277, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read control element property\n", v3, 2u);
  }
  return v4;
}

- (unsigned)controlScope
{
  uint8_t v3[8];
  unsigned int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainOutputProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainOutputProperty:withData:ofSize:withQualifier:ofSize:", 1668506480, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read control scope property\n", v3, 2u);
  }
  return v4;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  objc_super v21;

  v4 = a4;
  v21.receiver = self;
  v21.super_class = (Class)ASAControl;
  v6 = a3;
  -[ASAObject diagnosticDescriptionWithIndent:walkTree:](&v21, sel_diagnosticDescriptionWithIndent_walkTree_, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ASAControl controlScope](self, "controlScope");
  LODWORD(v9) = v8 >> 24;
  if ((v8 - 0x20000000) >> 24 >= 0x5F)
    v9 = 32;
  else
    v9 = v9;
  LODWORD(v10) = v8 << 8 >> 24;
  if (((v8 << 8) - 0x20000000) >> 24 >= 0x5F)
    v10 = 32;
  else
    v10 = v10;
  LODWORD(v11) = (__int16)v8 >> 8;
  if (((v8 << 16) - 0x20000000) >> 24 >= 0x5F)
    v11 = 32;
  else
    v11 = v11;
  if (v8 << 24 == 2130706432 || v8 << 24 < 520093697)
    v13 = 32;
  else
    v13 = (char)v8;
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Control Scope: %c%c%c%c\n"), v6, v9, v10, v11, v13);
  v14 = -[ASAControl controlElement](self, "controlElement");
  LODWORD(v15) = v14 >> 24;
  if ((v14 - 0x20000000) >> 24 >= 0x5F)
    v15 = 32;
  else
    v15 = v15;
  LODWORD(v16) = v14 << 8 >> 24;
  if (((v14 << 8) - 0x20000000) >> 24 >= 0x5F)
    v16 = 32;
  else
    v16 = v16;
  LODWORD(v17) = (__int16)v14 >> 8;
  if (((v14 << 16) - 0x20000000) >> 24 >= 0x5F)
    v17 = 32;
  else
    v17 = v17;
  if (v14 << 24 == 2130706432 || v14 << 24 < 520093697)
    v19 = 32;
  else
    v19 = (char)v14;
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Control Element: %c%c%c%c\n"), v6, v15, v16, v17, v19);

  return v7;
}

- (id)coreAudioClassName
{
  return CFSTR("AudioControl");
}

@end
