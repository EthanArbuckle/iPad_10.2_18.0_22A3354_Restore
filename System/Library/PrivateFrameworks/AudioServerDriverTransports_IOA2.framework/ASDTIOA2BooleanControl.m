@implementation ASDTIOA2BooleanControl

- (ASDTIOA2BooleanControl)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 isSettable:(BOOL)a5 element:(unsigned int)a6 scope:(unsigned int)a7 objectClassID:(unsigned int)a8 dictionary:(id)a9
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
  id v20;
  objc_super v22;

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
  v22.receiver = self;
  v22.super_class = (Class)ASDTIOA2BooleanControl;
  v20 = -[ASDBooleanControl initWithValue:isSettable:forElement:inScope:withPlugin:andObjectClassID:](&v22, sel_initWithValue_isSettable_forElement_inScope_withPlugin_andObjectClassID_, v18 != 0, v12, v11, v10, v19, v9);

  if (v20)
  {
    *((_DWORD *)v20 + 43) = a4;
    objc_storeWeak((id *)v20 + 24, v15);
  }

  return (ASDTIOA2BooleanControl *)v20;
}

- (NSArray)propertySelectorInfo
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("selector");
  v5[1] = CFSTR("dataType");
  v6[0] = &unk_2508502A8;
  v6[1] = &unk_2508502C0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)synchronizeWithRegistryDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  uint8_t v10[16];

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = 0;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Error: Couldn't synchronize with registry", v10, 2u);
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("property selectors"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ASDControl asdtAddControlProperties:](self, "asdtAddControlProperties:", v6);

  if (!v7)
    goto LABEL_6;
  -[ASDTIOA2BooleanControl pushValue:](self, "pushValue:", objc_msgSend(v5, "unsignedIntValue"));
  v8 = 1;
LABEL_7:

  return v8;
}

- (BOOL)changeValue:(BOOL)a3
{
  -[ASDTIOA2BooleanControl setValue:](self, "setValue:", a3);
  return 1;
}

- (void)doSetValue:(BOOL)a3
{
  _BOOL8 v3;
  std::mutex *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v3 = a3;
  v29 = *MEMORY[0x24BDAC8D0];
  v5 = (std::mutex *)((char *)self + 104);
  std::mutex::lock((std::mutex *)((char *)self + 104));
  if (-[ASDBooleanControl value](self, "value") != v3)
  {
    -[ASDTIOA2BooleanControl setterBlock](self, "setterBlock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[ASDTIOA2BooleanControl setterBlock](self, "setterBlock");
      v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v7[2](v7, v3);

    }
    NSStringFromSelector(sel_value);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTIOA2BooleanControl willChangeValueForKey:](self, "willChangeValueForKey:", v8);

    v16.receiver = self;
    v16.super_class = (Class)ASDTIOA2BooleanControl;
    -[ASDBooleanControl setValue:](&v16, sel_setValue_, v3);
    -[ASDControl asdtSendControlPropertyChangeNotificationAtIndex:](self, "asdtSendControlPropertyChangeNotificationAtIndex:", 0);
    NSStringFromSelector(sel_value);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTIOA2BooleanControl didChangeValueForKey:](self, "didChangeValueForKey:", v9);

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      WeakRetained = objc_loadWeakRetained((id *)self + 24);
      objc_msgSend(WeakRetained, "deviceUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[ASDTIOA2BooleanControl objectClass](self, "objectClass") >> 29
        && -[ASDTIOA2BooleanControl objectClass](self, "objectClass") >> 24 <= 0x7E)
      {
        v12 = -[ASDTIOA2BooleanControl objectClass](self, "objectClass") >> 24;
      }
      else
      {
        v12 = 32;
      }
      if ((-[ASDTIOA2BooleanControl objectClass](self, "objectClass") & 0xE00000) != 0
        && (-[ASDTIOA2BooleanControl objectClass](self, "objectClass") >> 16) <= 0x7Eu)
      {
        v13 = (-[ASDTIOA2BooleanControl objectClass](self, "objectClass") >> 16);
      }
      else
      {
        v13 = 32;
      }
      if ((-[ASDTIOA2BooleanControl objectClass](self, "objectClass") & 0xE000) != 0
        && ((unsigned __int16)-[ASDTIOA2BooleanControl objectClass](self, "objectClass") >> 8) <= 0x7Eu)
      {
        v14 = ((unsigned __int16)-[ASDTIOA2BooleanControl objectClass](self, "objectClass") >> 8);
      }
      else
      {
        v14 = 32;
      }
      if ((-[ASDTIOA2BooleanControl objectClass](self, "objectClass") & 0xE0) != 0
        && -[ASDTIOA2BooleanControl objectClass](self, "objectClass") <= 0x7Eu)
      {
        v15 = -[ASDTIOA2BooleanControl objectClass](self, "objectClass");
      }
      else
      {
        v15 = 32;
      }
      *(_DWORD *)buf = 138413570;
      v18 = v11;
      v19 = 1024;
      v20 = v12;
      v21 = 1024;
      v22 = v13;
      v23 = 1024;
      v24 = v14;
      v25 = 1024;
      v26 = v15;
      v27 = 1024;
      v28 = v3;
      _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Control '%c%c%c%c' changed to: %u", buf, 0x2Au);

    }
  }
  std::mutex::unlock(v5);
}

+ (BOOL)automaticallyNotifiesObserversOfValue
{
  return 0;
}

- (void)setValue:(BOOL)a3
{
  id WeakRetained;
  int v5;
  _BOOL4 v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)self + 24);
  v5 = objc_msgSend(WeakRetained, "_setControlValue:forControl:", &v6, *((unsigned int *)self + 43));

  if (v5)
    -[ASDTIOA2BooleanControl doSetValue:](self, "doSetValue:", v6);
}

- (void)pushValue:(unsigned int)a3
{
  -[ASDTIOA2BooleanControl doSetValue:](self, "doSetValue:", a3 != 0);
}

- (NSArray)properties
{
  return (NSArray *)*((_QWORD *)self + 22);
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)self + 22, a3);
}

- (BOOL)marked
{
  return *((_BYTE *)self + 168);
}

- (void)setMarked:(BOOL)a3
{
  *((_BYTE *)self + 168) = a3;
}

- (id)setterBlock
{
  return (id)*((_QWORD *)self + 23);
}

- (void)setSetterBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (ASDTIOA2Device)ioa2Device
{
  return (ASDTIOA2Device *)objc_loadWeakRetained((id *)self + 24);
}

- (void)setIoa2Device:(id)a3
{
  objc_storeWeak((id *)self + 24, a3);
}

- (unsigned)userClientID
{
  return *((_DWORD *)self + 43);
}

- (void)setUserClientID:(unsigned int)a3
{
  *((_DWORD *)self + 43) = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)self + 24);
  objc_storeStrong((id *)self + 23, 0);
  objc_storeStrong((id *)self + 22, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 104));
}

- (id).cxx_construct
{
  *((_QWORD *)self + 13) = 850045863;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_QWORD *)self + 20) = 0;
  return self;
}

@end
