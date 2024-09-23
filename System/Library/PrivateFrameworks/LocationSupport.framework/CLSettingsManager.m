@implementation CLSettingsManager

- (CLSettingsManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSettingsManager;
  return -[CLIntersiloService initWithInboundProtocol:outboundProtocol:](&v3, sel_initWithInboundProtocol_outboundProtocol_, &unk_1EE64E010, &unk_1EE64D850);
}

- (void)beginService
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLSettingsManager;
  -[CLSettingsManagerInternal beginService](&v7, sel_beginService);
  v3 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  objc_msgSend(v3, "setUnderlyingQueue:", -[CLSilo queue](-[CLIntersiloService silo](self, "silo"), "queue"));
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = *MEMORY[0x1E0CB3420];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1A1A0D0F0;
  v6[3] = &unk_1E45FBA68;
  v6[4] = self;
  -[CLSettingsManager setNotificationObserver:](self, "setNotificationObserver:", objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", v5, 0, v3, v6));

  -[CLSettingsManager refresh](self, "refresh");
}

- (void)endService
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", -[CLSettingsManager notificationObserver](self, "notificationObserver"));
  v3.receiver = self;
  v3.super_class = (Class)CLSettingsManager;
  -[CLSettingsManagerInternal endService](&v3, sel_endService);
}

- (void)refresh
{
  -[CLSettingsManagerInternal setSettingsDictionary:](self, "setSettingsDictionary:", (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "dictionaryRepresentation"), "cl_deepMutableCopy"));
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", -[CLSettingsManagerInternal settingsDictionary](self, "settingsDictionary"));
  MEMORY[0x1E0DE7D20](self, sel_updateClientsWithDictionary_);
}

- (id)syncgetSetValue:(id)a3 forKey:(id)a4 withoutNotifying:(id)a5
{
  objc_super v10;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "setValue:forKey:", a3, a4);
  v10.receiver = self;
  v10.super_class = (Class)CLSettingsManager;
  return -[CLSettingsManagerInternal syncgetSetValue:forKey:withoutNotifying:](&v10, sel_syncgetSetValue_forKey_withoutNotifying_, a3, a4, a5);
}

- (id)notificationObserver
{
  return self->_notificationObserver;
}

- (void)setNotificationObserver:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
