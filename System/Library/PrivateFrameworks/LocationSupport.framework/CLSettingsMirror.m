@implementation CLSettingsMirror

- (id)initInUniverse:(id)a3
{
  CLSettingsMirror *v4;
  id *p_isa;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLSettingsMirror;
  v4 = -[CLSettingsMirror init](&v7, sel_init);
  p_isa = (id *)&v4->super.super.isa;
  if (v4)
  {
    -[CLSettingsMirror setValid:](v4, "setValid:", 1);
    objc_msgSend(p_isa, "setUniverse:", a3);
    objc_msgSend(p_isa, "setManager:", objc_msgSend((id)objc_msgSend(p_isa[5], "vendor"), "proxyForService:", CFSTR("CLSettingsManager")));
    objc_msgSend(p_isa[4], "registerDelegate:inSilo:", p_isa, objc_msgSend(p_isa[5], "silo"));
    objc_msgSend(p_isa, "setDictionary:", objc_msgSend(p_isa[4], "syncgetSettingsAndRegisterForUpdates:", p_isa));
  }
  return p_isa;
}

- (void)invalidate
{
  -[CLSettingsManagerProtocol unregisterForUpdates:](self->_manager, "unregisterForUpdates:", self);
  -[CLSettingsMirror setValid:](self, "setValid:", 0);
  -[CLSettingsMirror setManager:](self, "setManager:", 0);
  -[CLSettingsMirror setUniverse:](self, "setUniverse:", 0);
  MEMORY[0x1E0DE7D20](self, sel_setSettingsChangeHandler_);
}

- (void)dealloc
{
  objc_super v3;

  -[CLSettingsMirror invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CLSettingsMirror;
  -[CLSettingsDictionary dealloc](&v3, sel_dealloc);
}

- (void)didUpdateSettings:(id)a3
{
  void (**settingsChangeHandler)(id, CLSettingsMirror *);

  -[CLSettingsDictionary setDictionary:](self, "setDictionary:", a3);
  settingsChangeHandler = (void (**)(id, CLSettingsMirror *))self->_settingsChangeHandler;
  if (settingsChangeHandler)
    settingsChangeHandler[2](settingsChangeHandler, self);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  uint64_t v5;

  v5 = -[CLSettingsManagerProtocol syncgetSetValue:forKey:withoutNotifying:](-[CLSettingsMirror manager](self, "manager"), "syncgetSetValue:forKey:withoutNotifying:", a3, a4, self);
  if (v5)
    -[CLSettingsDictionary setDictionary:](self, "setDictionary:", v5);
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  -[CLSettingsMirror setValue:forKey:](self, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), a4);
}

- (void)setShort:(signed __int16)a3 forKey:(id)a4
{
  -[CLSettingsMirror setValue:forKey:](self, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", a3), a4);
}

- (void)setInt:(int)a3 forKey:(id)a4
{
  -[CLSettingsMirror setValue:forKey:](self, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3), a4);
}

- (void)setLong:(int64_t)a3 forKey:(id)a4
{
  -[CLSettingsMirror setValue:forKey:](self, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a3), a4);
}

- (void)setFloat:(float)a3 forKey:(id)a4
{
  -[CLSettingsMirror setValue:forKey:](self, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), a4);
}

- (void)setDouble:(double)a3 forKey:(id)a4
{
  -[CLSettingsMirror setValue:forKey:](self, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3), a4);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (id)settingsChangeHandler
{
  return self->_settingsChangeHandler;
}

- (void)setSettingsChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CLSettingsManagerProtocol)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (CLIntersiloUniverse)universe
{
  return self->_universe;
}

- (void)setUniverse:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
