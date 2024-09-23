@implementation _CFXPreferencesHandle

- (id)copyPrefs
{
  os_unfair_lock_s *p_lock;
  int overrideEUID;
  _CFXPreferences *prefs;
  _CFXPreferences *v6;
  _CFXPreferences *v7;
  NSObject *v8;
  _BOOL4 v9;
  _CFXPreferences *v10;
  unsigned int euid;
  unsigned int v13;
  _DWORD v14[2];
  __int16 v15;
  unsigned int v16;
  __int16 v17;
  _CFXPreferences *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  overrideEUID = self->overrideEUID;
  if (overrideEUID == -1)
    overrideEUID = _CFGetEUID();
  prefs = self->prefs;
  if (prefs->_euid == overrideEUID)
  {
    v6 = self->prefs;
    prefs = 0;
  }
  else
  {
    v7 = objc_alloc_init(_CFXPreferences);
    self->prefs = v7;
    -[_CFXPreferences ingestVolatileStateFromPreferences:]((uint64_t)v7, (uint64_t)prefs);
    v8 = _CFPrefsClientLog();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    v6 = self->prefs;
    if (v9)
    {
      euid = prefs->_euid;
      v13 = v6->_euid;
      v14[0] = 67109634;
      v14[1] = euid;
      v15 = 1024;
      v16 = v13;
      v17 = 2114;
      v18 = v6;
      _os_log_debug_impl(&dword_182A8C000, v8, OS_LOG_TYPE_DEBUG, "Replacing preferences for EUID change: %u -> %u %{public}@", (uint8_t *)v14, 0x18u);
      v6 = self->prefs;
    }
  }
  v10 = v6;
  os_unfair_lock_unlock(p_lock);
  if (prefs)

  return v10;
}

- (_CFXPreferencesHandle)init
{
  _CFXPreferencesHandle *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)_CFXPreferencesHandle;
  v2 = -[_CFXPreferencesHandle init](&v4, sel_init);
  if (v2)
  {
    v2->prefs = objc_alloc_init(_CFXPreferences);
    *(_QWORD *)&v2->lock._os_unfair_lock_opaque = 0xFFFFFFFF00000000;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_CFXPreferencesHandle;
  -[_CFXPreferencesHandle dealloc](&v3, sel_dealloc);
}

- (void)setEUIDOverride:(unsigned int)a3
{
  self->overrideEUID = a3;
}

@end
