@implementation CLSettingsManagerMock

- (CLSettingsManagerMock)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSettingsManagerMock;
  return -[CLIntersiloService initWithInboundProtocol:outboundProtocol:](&v3, sel_initWithInboundProtocol_outboundProtocol_, &unk_1EE64E080, &unk_1EE64D850);
}

- (void)setSettings:(id)a3
{
  -[CLSettingsManagerInternal setSettingsDictionary:](self, "setSettingsDictionary:", (id)objc_msgSend(a3, "cl_deepMutableCopy"));
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", -[CLSettingsManagerInternal settingsDictionary](self, "settingsDictionary"));
  MEMORY[0x1E0DE7D20](self, sel_updateClientsWithDictionary_);
}

@end
