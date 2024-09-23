@implementation ASDTIOA2LevelControl

+ (VolumeCurve)volumeCurveFromControlInfo:(SEL)a3
{
  id v5;
  id v6;
  void *v7;
  ASDT::VolumeCurve *v8;
  VolumeCurve *result;
  CFTypeRef cf;

  v5 = a4;
  ASDT::VolumeCurve::VolumeCurve((ASDT::VolumeCurve *)retstr);
  v6 = v5;
  v7 = v6;
  if (v6)
    CFRetain(v6);
  applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, v7);

  if (!ASDT::IOA2UserClient::SetupVolumeCurve((const __CFDictionary **)&cf, (const applesauce::CF::DictionaryRef *)retstr, v8)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    +[ASDTIOA2LevelControl volumeCurveFromControlInfo:].cold.1((uint64_t)v7);
  }
  if (cf)
    CFRelease(cf);

  return result;
}

- (ASDTIOA2LevelControl)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 isSettable:(BOOL)a5 forElement:(unsigned int)a6 inScope:(unsigned int)a7 objectClassID:(unsigned int)a8 dictionary:(id)a9
{
  uint64_t v9;
  _BOOL8 v10;
  id v12;
  id v13;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<ASDT::RawPoint, ASDT::DBPoint>, void *>>> *p_pair1;
  _QWORD *v15;
  unint64_t v16;
  void *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  ASDTIOA2LevelControl *v28;
  objc_super v33;
  unsigned int v34;
  _QWORD *v35;
  _QWORD *v36;
  unint64_t v37;
  __int128 v38;

  v9 = *(_QWORD *)&a6;
  v10 = a5;
  v12 = a3;
  v13 = a9;
  +[ASDTIOA2LevelControl volumeCurveFromControlInfo:](ASDTIOA2LevelControl, "volumeCurveFromControlInfo:", v13);
  self->_volumeCurve.mTag = v34;
  p_pair1 = &self->_volumeCurve.mCurveMap.__tree_.__pair1_;
  std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy((uint64_t)&self->_volumeCurve.mCurveMap, (_QWORD *)self->_volumeCurve.mCurveMap.__tree_.__pair1_.__value_.__left_);
  v15 = v36;
  self->_volumeCurve.mCurveMap.__tree_.__begin_node_ = v35;
  self->_volumeCurve.mCurveMap.__tree_.__pair1_.__value_.__left_ = v15;
  v16 = v37;
  self->_volumeCurve.mCurveMap.__tree_.__pair3_.__value_ = v37;
  if (v16)
  {
    v15[2] = p_pair1;
    v35 = &v36;
    v36 = 0;
    v37 = 0;
    v15 = 0;
  }
  else
  {
    self->_volumeCurve.mCurveMap.__tree_.__begin_node_ = p_pair1;
  }
  *(_OWORD *)&self->_volumeCurve.mIsApplyingTransferFunction = v38;
  std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy((uint64_t)&v35, v15);
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("value"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  self->_rawValue = objc_msgSend(v17, "unsignedIntValue");

  ASDT::VolumeCurve::ConvertRawToDB((ASDT::VolumeCurve *)&self->_volumeCurve);
  v19 = v18;
  ASDT::VolumeCurve::GetMinimumDB((ASDT::VolumeCurve *)&self->_volumeCurve);
  v21 = v20;
  ASDT::VolumeCurve::GetMaximumDB((ASDT::VolumeCurve *)&self->_volumeCurve);
  v23 = v22;
  objc_msgSend(v12, "plugin");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v33.receiver = self;
  v33.super_class = (Class)ASDTIOA2LevelControl;
  LODWORD(v25) = v19;
  LODWORD(v26) = v21;
  LODWORD(v27) = v23;
  v28 = -[ASDLevelControl initWithDecibelValue:minimumValue:maximumValue:isSettable:forElement:inScope:withPlugin:andObjectClassID:](&v33, sel_initWithDecibelValue_minimumValue_maximumValue_isSettable_forElement_inScope_withPlugin_andObjectClassID_, v10, v9, a7, v24, a8, v25, v26, v27);

  if (v28)
  {
    objc_storeWeak((id *)&v28->_ioa2Device, v12);
    v28->_userClientID = a4;
  }

  return v28;
}

- (void)dealloc
{
  objc_super v3;

  -[ASDControl asdtRemoveControlProperties](self, "asdtRemoveControlProperties");
  v3.receiver = self;
  v3.super_class = (Class)ASDTIOA2LevelControl;
  -[ASDTIOA2LevelControl dealloc](&v3, sel_dealloc);
}

- (NSArray)propertySelectorInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[7];

  v22[6] = *MEMORY[0x24BDAC8D0];
  v20[0] = CFSTR("selector");
  v20[1] = CFSTR("dataType");
  v21[0] = &unk_2508503C8;
  v21[1] = &unk_2508503E0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v2;
  v18[0] = CFSTR("selector");
  v18[1] = CFSTR("dataType");
  v19[0] = &unk_2508503F8;
  v19[1] = &unk_2508503E0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v3;
  v16[0] = CFSTR("selector");
  v16[1] = CFSTR("dataType");
  v17[0] = &unk_250850410;
  v17[1] = &unk_2508503E0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v4;
  v14[0] = CFSTR("selector");
  v14[1] = CFSTR("dataType");
  v15[0] = &unk_250850428;
  v15[1] = &unk_2508503E0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v5;
  v12[0] = CFSTR("selector");
  v12[1] = CFSTR("dataType");
  v13[0] = &unk_250850440;
  v13[1] = &unk_2508503E0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v6;
  v10[0] = CFSTR("selector");
  v10[1] = CFSTR("dataType");
  v11[0] = &unk_250850458;
  v11[1] = &unk_2508503E0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v8;
}

- (BOOL)synchronizeWithRegistryDictionary:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  objc_class *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->_lock);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("property selectors"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ASDControl asdtAddControlProperties:](self, "asdtAddControlProperties:", v5);

    if (v6)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[ASDTIOA2LevelControl pushValue:](self, "pushValue:", objc_msgSend(v7, "unsignedIntValue"));

    }
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->_lock);
  }
  else
  {
    v6 = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Couldn't synchronize with registry", (uint8_t *)&v11, 0xCu);

      v6 = 0;
    }
  }

  return v6;
}

- (BOOL)changeDecibelValue:(float)a3
{
  -[ASDTIOA2LevelControl setDecibelValue:](self, "setDecibelValue:");
  return 1;
}

- (void)doSetValue:(unsigned int)a3
{
  recursive_mutex *p_lock;
  void *v6;
  void *v7;
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
  unsigned int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_lock);
  if (self->_rawValue != a3)
  {
    self->_rawValue = a3;
    NSStringFromSelector(sel_decibelValue);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTIOA2LevelControl willChangeValueForKey:](self, "willChangeValueForKey:", v6);

    NSStringFromSelector(sel_scalarValue);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTIOA2LevelControl willChangeValueForKey:](self, "willChangeValueForKey:", v7);

    ASDT::VolumeCurve::ConvertRawToDB((ASDT::VolumeCurve *)&self->_volumeCurve);
    v16.receiver = self;
    v16.super_class = (Class)ASDTIOA2LevelControl;
    -[ASDLevelControl setDecibelValue:](&v16, sel_setDecibelValue_);
    -[ASDControl asdtSendControlPropertyChangeNotificationAtIndex:](self, "asdtSendControlPropertyChangeNotificationAtIndex:", 0);
    -[ASDControl asdtSendControlPropertyChangeNotificationAtIndex:](self, "asdtSendControlPropertyChangeNotificationAtIndex:", 1);
    NSStringFromSelector(sel_decibelValue);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTIOA2LevelControl didChangeValueForKey:](self, "didChangeValueForKey:", v8);

    NSStringFromSelector(sel_scalarValue);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTIOA2LevelControl didChangeValueForKey:](self, "didChangeValueForKey:", v9);

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_ioa2Device);
      objc_msgSend(WeakRetained, "deviceUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[ASDTIOA2LevelControl objectClass](self, "objectClass") >> 29
        && -[ASDTIOA2LevelControl objectClass](self, "objectClass") >> 24 <= 0x7E)
      {
        v12 = -[ASDTIOA2LevelControl objectClass](self, "objectClass") >> 24;
      }
      else
      {
        v12 = 32;
      }
      if ((-[ASDTIOA2LevelControl objectClass](self, "objectClass") & 0xE00000) != 0
        && (-[ASDTIOA2LevelControl objectClass](self, "objectClass") >> 16) <= 0x7Eu)
      {
        v13 = (-[ASDTIOA2LevelControl objectClass](self, "objectClass") >> 16);
      }
      else
      {
        v13 = 32;
      }
      if ((-[ASDTIOA2LevelControl objectClass](self, "objectClass") & 0xE000) != 0
        && ((unsigned __int16)-[ASDTIOA2LevelControl objectClass](self, "objectClass") >> 8) <= 0x7Eu)
      {
        v14 = ((unsigned __int16)-[ASDTIOA2LevelControl objectClass](self, "objectClass") >> 8);
      }
      else
      {
        v14 = 32;
      }
      if ((-[ASDTIOA2LevelControl objectClass](self, "objectClass") & 0xE0) != 0
        && -[ASDTIOA2LevelControl objectClass](self, "objectClass") <= 0x7Eu)
      {
        v15 = -[ASDTIOA2LevelControl objectClass](self, "objectClass");
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
      v28 = a3;
      _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Control '%c%c%c%c' changed to: %u", buf, 0x2Au);

    }
  }
  std::recursive_mutex::unlock((std::recursive_mutex *)p_lock);
}

+ (BOOL)automaticallyNotifiesObserversOfDecibelValue
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfScalarValue
{
  return 0;
}

- (void)setDecibelValue:(float)a3
{
  id WeakRetained;
  int v5;
  unsigned int v6;

  v6 = ASDT::VolumeCurve::ConvertDBToRaw((ASDT::VolumeCurve *)&self->_volumeCurve, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_ioa2Device);
  v5 = objc_msgSend(WeakRetained, "_setControlValue:forControl:", &v6, self->_userClientID);

  if (v5)
    -[ASDTIOA2LevelControl doSetValue:](self, "doSetValue:", v6);
}

- (BOOL)changeScalarValue:(float)a3
{
  ASDT::VolumeCurve::ConvertScalarToDB((ASDT::VolumeCurve *)&self->_volumeCurve, a3);
  return -[ASDTIOA2LevelControl changeDecibelValue:](self, "changeDecibelValue:");
}

- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3
{
  objc_super v4;

  if (!a3)
    return 0;
  if (a3->mSelector == 1818457190)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)ASDTIOA2LevelControl;
  return -[ASDLevelControl hasProperty:](&v4, sel_hasProperty_);
}

- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3
{
  objc_super v4;

  if (!a3)
    return 0;
  if (a3->mSelector == 1818457190)
    return -[ASDLevelControl isSettable](self, "isSettable");
  v4.receiver = self;
  v4.super_class = (Class)ASDTIOA2LevelControl;
  return -[ASDLevelControl isPropertySettable:](&v4, sel_isPropertySettable_);
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  objc_super v6;

  if (!a3)
    return 0;
  if (a3->mSelector == 1818457190)
    return 4;
  v6.receiver = self;
  v6.super_class = (Class)ASDTIOA2LevelControl;
  return -[ASDLevelControl dataSizeForProperty:withQualifierSize:andQualifierData:](&v6, sel_dataSizeForProperty_withQualifierSize_andQualifierData_);
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  BOOL v8;
  objc_super v10;

  if (!a3)
    return 0;
  if (a3->mSelector == 1818457190)
  {
    v8 = 0;
    if (a6 && a7)
    {
      if (*a6 >= 4)
      {
        *(_DWORD *)a7 = self->_volumeCurve.mTransferFunction;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)ASDTIOA2LevelControl;
    return -[ASDLevelControl getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v10, sel_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_);
  }
  return v8;
}

- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8
{
  BOOL v8;
  objc_super v10;

  if (!a3)
    return 0;
  if (a3->mSelector == 1818457190)
  {
    v8 = 0;
    if (a6 >= 4 && a7)
    {
      ASDT::VolumeCurve::SetTransferFunction((ASDT::VolumeCurve *)&self->_volumeCurve);
      return 1;
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)ASDTIOA2LevelControl;
    return -[ASDLevelControl setProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v10, sel_setProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_);
  }
  return v8;
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
  std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy((uint64_t)&self->_volumeCurve.mCurveMap, (_QWORD *)self->_volumeCurve.mCurveMap.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  ASDT::VolumeCurve::VolumeCurve((ASDT::VolumeCurve *)&self->_volumeCurve);
  MEMORY[0x23B802C48](&self->_lock);
  return self;
}

+ (void)volumeCurveFromControlInfo:(uint64_t)a1 .cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "ASDTIOA2LevelControl: Bad control info: %@", (uint8_t *)&v1, 0xCu);
}

@end
