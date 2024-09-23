@implementation ASDTIOA2SliderControl

- (ASDTIOA2SliderControl)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 isSettable:(BOOL)a5 forElement:(unsigned int)a6 inScope:(unsigned int)a7 objectClassID:(unsigned int)a8 dictionary:(id)a9
{
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  id v14;
  NSDictionary *v15;
  uint64_t v16;
  _ASDSliderRange v17;
  void *v18;
  ASDTIOA2SliderControl *v19;
  ASDTIOA2SliderControl *v20;
  unsigned int v22;
  objc_super v24;
  _ASDSliderRange v25;
  unsigned int v26;

  v10 = *(_QWORD *)&a7;
  v11 = *(_QWORD *)&a6;
  v12 = a5;
  v14 = a3;
  v15 = (NSDictionary *)a9;
  v26 = 0;
  v25 = 0;
  if ((getValueAndRangeFromControlDict(v15, (const applesauce::CF::DictionaryRef *)&v26, &v25) & 1) != 0)
  {
    v16 = v26;
    v17 = v25;
    objc_msgSend(v14, "plugin");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24.receiver = self;
    v24.super_class = (Class)ASDTIOA2SliderControl;
    v22 = a8;
    v19 = -[ASDSliderControl initWithValue:andRange:isSettable:forElement:inScope:withPlugin:andObjectClassID:](&v24, sel_initWithValue_andRange_isSettable_forElement_inScope_withPlugin_andObjectClassID_, v16, v17, v12, v11, v10, v18, v22);

    if (v19)
    {
      -[ASDTIOA2SliderControl setIoa2Device:](v19, "setIoa2Device:", v14);
      v19->_userClientID = a4;
    }
    self = v19;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)dealloc
{
  objc_super v3;

  -[ASDControl asdtRemoveControlProperties](self, "asdtRemoveControlProperties");
  v3.receiver = self;
  v3.super_class = (Class)ASDTIOA2SliderControl;
  -[ASDTIOA2SliderControl dealloc](&v3, sel_dealloc);
}

- (NSArray)propertySelectorInfo
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("selector");
  v8[1] = CFSTR("dataType");
  v9[0] = &unk_250850380;
  v9[1] = &unk_250850398;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  v6[0] = CFSTR("selector");
  v6[1] = CFSTR("dataType");
  v7[0] = &unk_2508503B0;
  v7[1] = &unk_250850398;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (BOOL)synchronizeWithRegistryDictionary:(id)a3
{
  NSDictionary *v4;
  void *v5;
  BOOL v6;
  char ValueAndRangeFromControlDict;
  _ASDSliderRange v9;
  unsigned int v10;
  uint8_t buf[16];

  v4 = (NSDictionary *)a3;
  if (v4)
  {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->_lock);
    -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("property selectors"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ASDControl asdtAddControlProperties:](self, "asdtAddControlProperties:", v5);

    if (v6)
    {
      v10 = 0;
      v9 = 0;
      ValueAndRangeFromControlDict = getValueAndRangeFromControlDict(v4, (const applesauce::CF::DictionaryRef *)&v10, &v9);
      if ((ValueAndRangeFromControlDict & 1) != 0)
      {
        -[ASDSliderControl setRange:](self, "setRange:", v9);
        -[ASDTIOA2SliderControl pushValue:](self, "pushValue:", v10);
      }
    }
    else
    {
      ValueAndRangeFromControlDict = 0;
    }
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->_lock);
  }
  else
  {
    ValueAndRangeFromControlDict = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Error: Couldn't synchronize with registry", buf, 2u);
      ValueAndRangeFromControlDict = 0;
    }
  }

  return ValueAndRangeFromControlDict;
}

- (BOOL)changeValue:(unsigned int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (-[ASDSliderControl value](self, "value") != a3)
    -[ASDTIOA2SliderControl setValue:](self, "setValue:", v3);
  return 1;
}

- (void)doSetValue:(unsigned int)a3
{
  uint64_t v3;
  recursive_mutex *p_lock;
  void *v6;
  void *v7;
  id WeakRetained;
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
  int v26;
  uint64_t v27;

  v3 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_lock);
  if (-[ASDSliderControl value](self, "value") != (_DWORD)v3)
  {
    NSStringFromSelector(sel_value);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTIOA2SliderControl willChangeValueForKey:](self, "willChangeValueForKey:", v6);

    v14.receiver = self;
    v14.super_class = (Class)ASDTIOA2SliderControl;
    -[ASDSliderControl setValue:](&v14, sel_setValue_, v3);
    -[ASDControl asdtSendControlPropertyChangeNotificationAtIndex:](self, "asdtSendControlPropertyChangeNotificationAtIndex:", 0);
    NSStringFromSelector(sel_value);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTIOA2SliderControl didChangeValueForKey:](self, "didChangeValueForKey:", v7);

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_ioa2Device);
      objc_msgSend(WeakRetained, "deviceUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[ASDTIOA2SliderControl objectClass](self, "objectClass") >> 29
        && -[ASDTIOA2SliderControl objectClass](self, "objectClass") >> 24 <= 0x7E)
      {
        v10 = -[ASDTIOA2SliderControl objectClass](self, "objectClass") >> 24;
      }
      else
      {
        v10 = 32;
      }
      if ((-[ASDTIOA2SliderControl objectClass](self, "objectClass") & 0xE00000) != 0
        && (-[ASDTIOA2SliderControl objectClass](self, "objectClass") >> 16) <= 0x7Eu)
      {
        v11 = (-[ASDTIOA2SliderControl objectClass](self, "objectClass") >> 16);
      }
      else
      {
        v11 = 32;
      }
      if ((-[ASDTIOA2SliderControl objectClass](self, "objectClass") & 0xE000) != 0
        && ((unsigned __int16)-[ASDTIOA2SliderControl objectClass](self, "objectClass") >> 8) <= 0x7Eu)
      {
        v12 = ((unsigned __int16)-[ASDTIOA2SliderControl objectClass](self, "objectClass") >> 8);
      }
      else
      {
        v12 = 32;
      }
      if ((-[ASDTIOA2SliderControl objectClass](self, "objectClass") & 0xE0) != 0
        && -[ASDTIOA2SliderControl objectClass](self, "objectClass") <= 0x7Eu)
      {
        v13 = -[ASDTIOA2SliderControl objectClass](self, "objectClass");
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
  std::recursive_mutex::unlock((std::recursive_mutex *)p_lock);
}

+ (BOOL)automaticallyNotifiesObserversOfValue
{
  return 0;
}

- (void)setValue:(unsigned int)a3
{
  id WeakRetained;
  int v5;
  unsigned int v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_ioa2Device);
  v5 = objc_msgSend(WeakRetained, "_setControlValue:forControl:", &v6, self->_userClientID);

  if (v5)
    -[ASDTIOA2SliderControl doSetValue:](self, "doSetValue:", v6);
}

- (BOOL)marked
{
  return self->marked;
}

- (void)setMarked:(BOOL)a3
{
  self->marked = a3;
}

- (NSArray)properties
{
  return self->properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->properties, a3);
}

- (ASDTIOA2Device)ioa2Device
{
  return (ASDTIOA2Device *)objc_loadWeakRetained((id *)&self->_ioa2Device);
}

- (void)setIoa2Device:(id)a3
{
  objc_storeWeak((id *)&self->_ioa2Device, a3);
}

- (unsigned)userClientID
{
  return self->_userClientID;
}

- (void)setUserClientID:(unsigned int)a3
{
  self->_userClientID = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ioa2Device);
  objc_storeStrong((id *)&self->properties, 0);
  std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)&self->_lock);
}

- (id).cxx_construct
{
  MEMORY[0x23B802C48](&self->_lock, a2);
  return self;
}

@end
