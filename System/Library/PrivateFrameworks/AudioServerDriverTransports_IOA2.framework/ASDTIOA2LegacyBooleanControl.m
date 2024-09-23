@implementation ASDTIOA2LegacyBooleanControl

- (ASDTIOA2LegacyBooleanControl)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 isSettable:(BOOL)a5 element:(unsigned int)a6 scope:(unsigned int)a7 objectClassID:(unsigned int)a8 dictionary:(id)a9
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  id v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  ASDTIOA2LegacyBooleanControl *v20;
  objc_super v23;

  v9 = *(_QWORD *)&a8;
  v10 = *(_QWORD *)&a7;
  v11 = *(_QWORD *)&a6;
  v12 = a5;
  v15 = a3;
  v16 = a9;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("value"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "unsignedIntValue");

  objc_msgSend(v15, "plugin");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)ASDTIOA2LegacyBooleanControl;
  v20 = -[ASDBooleanControl initWithValue:isSettable:forElement:inScope:withPlugin:andObjectClassID:](&v23, sel_initWithValue_isSettable_forElement_inScope_withPlugin_andObjectClassID_, v18 != 0, v12, v11, v10, v19, v9);

  if (v20)
  {
    v20->_userClientID = a4;
    objc_storeStrong((id *)&v20->_ioa2Device, a3);
  }

  return v20;
}

- (BOOL)synchronizeWithRegistry
{
  ASDTIOA2LegacyDevice *ioa2Device;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v8[16];
  std::recursive_mutex *v9;
  uint64_t v10;

  ioa2Device = self->_ioa2Device;
  if (ioa2Device)
  {
    -[ASDTIOA2LegacyDevice scopedLock](ioa2Device, "scopedLock");
    ioa2Device = self->_ioa2Device;
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  -[ASDTIOA2LegacyDevice _controlDictionaryForControl:](ioa2Device, "_controlDictionaryForControl:", self->_userClientID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      std::unique_lock<std::recursive_mutex>::unlock((uint64_t)&v9);
      -[ASDTIOA2LegacyBooleanControl pushValue:](self, "pushValue:", objc_msgSend(v6, "unsignedIntValue"));
    }

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Error: Couldn't synchronize with registry", v8, 2u);
  }

  if ((_BYTE)v10)
    std::recursive_mutex::unlock(v9);
  return v5 != 0;
}

- (BOOL)changeValue:(BOOL)a3
{
  -[ASDTIOA2LegacyBooleanControl setValue:](self, "setValue:", a3);
  return 1;
}

- (void)doSetValue:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  int v11;
  int v12;
  int v13;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x24BDAC8D0];
  if (-[ASDBooleanControl value](self, "value") != a3)
  {
    -[ASDTIOA2LegacyBooleanControl setterBlock](self, "setterBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[ASDTIOA2LegacyBooleanControl setterBlock](self, "setterBlock");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v6[2](v6, v3);

    }
    NSStringFromSelector(sel_value);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTIOA2LegacyBooleanControl willChangeValueForKey:](self, "willChangeValueForKey:", v7);

    v14.receiver = self;
    v14.super_class = (Class)ASDTIOA2LegacyBooleanControl;
    -[ASDBooleanControl setValue:](&v14, sel_setValue_, v3);
    NSStringFromSelector(sel_value);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTIOA2LegacyBooleanControl didChangeValueForKey:](self, "didChangeValueForKey:", v8);

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[ASDAudioDevice deviceUID](self->_ioa2Device, "deviceUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[ASDTIOA2LegacyBooleanControl objectClass](self, "objectClass") >> 29
        && -[ASDTIOA2LegacyBooleanControl objectClass](self, "objectClass") >> 24 <= 0x7E)
      {
        v10 = -[ASDTIOA2LegacyBooleanControl objectClass](self, "objectClass") >> 24;
      }
      else
      {
        v10 = 32;
      }
      if ((-[ASDTIOA2LegacyBooleanControl objectClass](self, "objectClass") & 0xE00000) != 0
        && (-[ASDTIOA2LegacyBooleanControl objectClass](self, "objectClass") >> 16) <= 0x7Eu)
      {
        v11 = (-[ASDTIOA2LegacyBooleanControl objectClass](self, "objectClass") >> 16);
      }
      else
      {
        v11 = 32;
      }
      if ((-[ASDTIOA2LegacyBooleanControl objectClass](self, "objectClass") & 0xE000) != 0
        && ((unsigned __int16)-[ASDTIOA2LegacyBooleanControl objectClass](self, "objectClass") >> 8) <= 0x7Eu)
      {
        v12 = ((unsigned __int16)-[ASDTIOA2LegacyBooleanControl objectClass](self, "objectClass") >> 8);
      }
      else
      {
        v12 = 32;
      }
      if ((-[ASDTIOA2LegacyBooleanControl objectClass](self, "objectClass") & 0xE0) != 0
        && -[ASDTIOA2LegacyBooleanControl objectClass](self, "objectClass") <= 0x7Eu)
      {
        v13 = -[ASDTIOA2LegacyBooleanControl objectClass](self, "objectClass");
      }
      else
      {
        v13 = 32;
      }
      *(_DWORD *)buf = 138413570;
      v16 = v9;
      v17 = 1024;
      v18 = v10;
      v19 = 1024;
      v20 = v11;
      v21 = 1024;
      v22 = v12;
      v23 = 1024;
      v24 = v13;
      v25 = 1024;
      v26 = v3;
      _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Control '%c%c%c%c' changed to: %u", buf, 0x2Au);

    }
  }
}

+ (BOOL)automaticallyNotifiesObserversOfValue
{
  return 0;
}

- (void)setValue:(BOOL)a3
{
  ASDTIOA2LegacyDevice *ioa2Device;
  _BOOL4 v5;
  std::recursive_mutex *v6;
  uint64_t v7;
  _BOOL4 v8;

  v8 = a3;
  ioa2Device = self->_ioa2Device;
  if (ioa2Device)
  {
    -[ASDTIOA2LegacyDevice scopedLock](ioa2Device, "scopedLock");
    ioa2Device = self->_ioa2Device;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  v5 = -[ASDTIOA2LegacyDevice _setControlValue:forControl:](ioa2Device, "_setControlValue:forControl:", &v8, self->_userClientID);
  std::unique_lock<std::recursive_mutex>::unlock((uint64_t)&v6);
  if (v5)
    -[ASDTIOA2LegacyBooleanControl doSetValue:](self, "doSetValue:", v8);
  if ((_BYTE)v7)
    std::recursive_mutex::unlock(v6);
}

- (void)pushValue:(unsigned int)a3
{
  -[ASDTIOA2LegacyBooleanControl doSetValue:](self, "doSetValue:", a3 != 0);
}

- (BOOL)marked
{
  return self->marked;
}

- (void)setMarked:(BOOL)a3
{
  self->marked = a3;
}

- (unsigned)userClientID
{
  return self->_userClientID;
}

- (id)setterBlock
{
  return self->_setterBlock;
}

- (void)setSetterBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_setterBlock, 0);
  objc_storeStrong((id *)&self->_ioa2Device, 0);
}

@end
