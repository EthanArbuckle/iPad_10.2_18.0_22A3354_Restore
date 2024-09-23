@implementation ASABooleanControl

- (void)setValue:(BOOL)a3
{
  uint8_t v3[12];
  _BOOL4 v4;

  v4 = a3;
  if (!-[ASAObject setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1650685548, &v4, 4, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not set value property", v3, 2u);
  }
}

- (BOOL)value
{
  uint8_t v3[8];
  int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1650685548, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read value property\n", v3, 2u);
  }
  return v4 != 0;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  _BOOL4 v8;
  const __CFString *v9;
  objc_super v11;

  v4 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ASABooleanControl;
  v6 = a3;
  -[ASAControl diagnosticDescriptionWithIndent:walkTree:](&v11, sel_diagnosticDescriptionWithIndent_walkTree_, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ASABooleanControl value](self, "value");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Value: %@\n"), v6, v9, v11.receiver, v11.super_class);

  return v7;
}

- (id)coreAudioClassName
{
  int v2;
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;

  v2 = -[ASAObject objectClass](self, "objectClass");
  v3 = CFSTR("AudioBooleanControl");
  if (v2 <= 1885888877)
  {
    v4 = 1819504225;
    v8 = CFSTR("AudioMuteControl");
    if (v2 != 1836414053)
      v8 = CFSTR("AudioBooleanControl");
    if (v2 == 1819504226)
      v7 = CFSTR("AudioListenbackControl");
    else
      v7 = v8;
    if (v2 == 1784767339)
      v3 = CFSTR("AudioJackControl");
    if (v2 == 1668049264)
      v3 = CFSTR("AudioClipLightControl");
  }
  else
  {
    v4 = 1936682094;
    v5 = CFSTR("AudioLFEMuteControl");
    v6 = CFSTR("AudioTalkbackControl");
    if (v2 != 1952541794)
      v6 = CFSTR("AudioBooleanControl");
    if (v2 != 1937072749)
      v5 = v6;
    if (v2 == 1936682095)
      v7 = CFSTR("AudioSoloControl");
    else
      v7 = v5;
    if (v2 == 1885893481)
      v3 = CFSTR("AudioInvertControl");
    if (v2 == 1885888878)
      v3 = CFSTR("AudioPhantomPowerControl");
  }
  if (v2 <= v4)
    return (id)v3;
  else
    return (id)v7;
}

@end
