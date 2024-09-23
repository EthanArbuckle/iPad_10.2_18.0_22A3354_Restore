@implementation ASDTIOA2LegacyLevelControl

+ (CAVolumeCurve)volumeCurveFromControlInfo:(SEL)a3
{
  __CFDictionary *v5;
  const __CFArray *v6;
  uint64_t v7;
  float v8;
  float v9;
  CAVolumeCurve *result;
  double v11;
  unsigned int v12;
  double v13;
  int v14;
  CACFDictionary v15;
  CFArrayRef theArray;
  __int16 v17;
  CACFDictionary v18;

  v5 = (__CFDictionary *)a4;
  CAVolumeCurve::CAVolumeCurve(retstr);
  v18.var0 = v5;
  *(_WORD *)&v18.var1 = 0;
  if (v5)
  {
    theArray = 0;
    v17 = 1;
    CACFDictionary::GetCACFArray(&v18, CFSTR("range map"), (CACFArray *)&theArray);
    v6 = theArray;
    if (theArray)
    {
      v7 = 0;
LABEL_4:
      LODWORD(v6) = CFArrayGetCount(v6);
      while (v7 < v6)
      {
        v15.var0 = 0;
        *(_WORD *)&v15.var1 = 1;
        CACFArray::GetCACFDictionary((CACFArray *)&theArray, v7, &v15);
        if (v15.var0)
        {
          v14 = 0;
          v13 = 0.0;
          v12 = 0;
          v11 = 0.0;
          CACFDictionary::GetSInt32(&v15, CFSTR("start int value"), &v14);
          CACFDictionary::GetFixed64(&v15, CFSTR("start db value"), &v13);
          CACFDictionary::GetUInt32(&v15, CFSTR("integer steps"), &v12);
          CACFDictionary::GetFixed64(&v15, CFSTR("db per step"), &v11);
          v8 = v13;
          v9 = v13 + (double)v12 * v11;
          CAVolumeCurve::AddRange(retstr, v14, v12 + v14, v8, v9);
        }
        CACFDictionary::~CACFDictionary(&v15);
        v7 = (v7 + 1);
        v6 = theArray;
        if (theArray)
          goto LABEL_4;
      }
    }
    LODWORD(v15.var0) = 0;
    if (CACFDictionary::GetUInt32(&v18, CFSTR("transfer function"), (unsigned int *)&v15))
      CAVolumeCurve::SetTransferFunction(retstr, (signed int)v15.var0);
    CACFArray::~CACFArray((CACFArray *)&theArray);
  }
  CACFDictionary::~CACFDictionary(&v18);

  return result;
}

- (ASDTIOA2LegacyLevelControl)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 isSettable:(BOOL)a5 forElement:(unsigned int)a6 inScope:(unsigned int)a7 objectClassID:(unsigned int)a8 dictionary:(id)a9
{
  _BOOL8 v9;
  id v12;
  id v13;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *p_pair1;
  _QWORD *v15;
  unint64_t v16;
  void *v17;
  int v18;
  int v19;
  float MinimumDB;
  float MaximumDB;
  void *v22;
  double v23;
  double v24;
  double v25;
  ASDTIOA2LegacyLevelControl *v26;
  objc_super v32;
  unsigned int v33;
  _QWORD *v34;
  _QWORD *v35;
  unint64_t v36;
  __int128 v37;

  v9 = a5;
  v12 = a3;
  v13 = a9;
  +[ASDTIOA2LegacyLevelControl volumeCurveFromControlInfo:](ASDTIOA2LegacyLevelControl, "volumeCurveFromControlInfo:", v13);
  self->_volumeCurve.mTag = v33;
  p_pair1 = &self->_volumeCurve.mCurveMap.__tree_.__pair1_;
  std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy((uint64_t)&self->_volumeCurve.mCurveMap, (_QWORD *)self->_volumeCurve.mCurveMap.__tree_.__pair1_.__value_.__left_);
  v15 = v35;
  self->_volumeCurve.mCurveMap.__tree_.__begin_node_ = v34;
  self->_volumeCurve.mCurveMap.__tree_.__pair1_.__value_.__left_ = v15;
  v16 = v36;
  self->_volumeCurve.mCurveMap.__tree_.__pair3_.__value_ = v36;
  if (v16)
  {
    v15[2] = p_pair1;
    v34 = &v35;
    v35 = 0;
    v36 = 0;
    v15 = 0;
  }
  else
  {
    self->_volumeCurve.mCurveMap.__tree_.__begin_node_ = p_pair1;
  }
  *(_OWORD *)&self->_volumeCurve.mIsApplyingTransferFunction = v37;
  std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy((uint64_t)&v34, v15);
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("value"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  self->_rawValue = objc_msgSend(v17, "unsignedIntValue");

  CAVolumeCurve::ConvertRawToDB(&self->_volumeCurve, self->_rawValue);
  v19 = v18;
  MinimumDB = CAVolumeCurve::GetMinimumDB(&self->_volumeCurve);
  MaximumDB = CAVolumeCurve::GetMaximumDB(&self->_volumeCurve);
  objc_msgSend(v12, "plugin");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32.receiver = self;
  v32.super_class = (Class)ASDTIOA2LegacyLevelControl;
  LODWORD(v23) = v19;
  *(float *)&v24 = MinimumDB;
  *(float *)&v25 = MaximumDB;
  v26 = -[ASDLevelControl initWithDecibelValue:minimumValue:maximumValue:isSettable:forElement:inScope:withPlugin:andObjectClassID:](&v32, sel_initWithDecibelValue_minimumValue_maximumValue_isSettable_forElement_inScope_withPlugin_andObjectClassID_, v9, a6, a7, v22, a8, v23, v24, v25);

  if (v26)
  {
    objc_storeStrong((id *)&v26->_ioa2Device, a3);
    v26->_userClientID = a4;
  }

  return v26;
}

- (BOOL)synchronizeWithRegistry
{
  ASDTIOA2LegacyDevice *ioa2Device;
  void *v4;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *p_pair1;
  _QWORD *v6;
  unint64_t v7;
  void *v8;
  unsigned int v10;
  _QWORD *v11;
  _QWORD *v12;
  unint64_t v13;
  __int128 v14;
  std::recursive_mutex *v15;
  uint64_t v16;

  ioa2Device = self->_ioa2Device;
  if (ioa2Device)
  {
    -[ASDTIOA2LegacyDevice scopedLock](ioa2Device, "scopedLock");
    ioa2Device = self->_ioa2Device;
  }
  else
  {
    v15 = 0;
    v16 = 0;
  }
  -[ASDTIOA2LegacyDevice _controlDictionaryForControl:](ioa2Device, "_controlDictionaryForControl:", self->_userClientID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[ASDTIOA2LegacyLevelControl volumeCurveFromControlInfo:](ASDTIOA2LegacyLevelControl, "volumeCurveFromControlInfo:", v4);
    self->_volumeCurve.mTag = v10;
    p_pair1 = &self->_volumeCurve.mCurveMap.__tree_.__pair1_;
    std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy((uint64_t)&self->_volumeCurve.mCurveMap, (_QWORD *)self->_volumeCurve.mCurveMap.__tree_.__pair1_.__value_.__left_);
    v6 = v12;
    self->_volumeCurve.mCurveMap.__tree_.__begin_node_ = v11;
    self->_volumeCurve.mCurveMap.__tree_.__pair1_.__value_.__left_ = v6;
    v7 = v13;
    self->_volumeCurve.mCurveMap.__tree_.__pair3_.__value_ = v13;
    if (v7)
    {
      v6[2] = p_pair1;
      v11 = &v12;
      v12 = 0;
      v13 = 0;
      v6 = 0;
    }
    else
    {
      self->_volumeCurve.mCurveMap.__tree_.__begin_node_ = p_pair1;
    }
    *(_OWORD *)&self->_volumeCurve.mIsApplyingTransferFunction = v14;
    std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy((uint64_t)&v11, v6);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      std::unique_lock<std::recursive_mutex>::unlock((uint64_t)&v15);
      -[ASDTIOA2LegacyLevelControl pushValue:](self, "pushValue:", objc_msgSend(v8, "unsignedIntValue"));
    }

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Error: Couldn't synchronize with registry", (uint8_t *)&v10, 2u);
  }

  if ((_BYTE)v16)
    std::recursive_mutex::unlock(v15);
  return v4 != 0;
}

- (BOOL)changeDecibelValue:(float)a3
{
  -[ASDTIOA2LegacyLevelControl setDecibelValue:](self, "setDecibelValue:");
  return 1;
}

- (void)doSetValue:(unsigned int)a3
{
  void *v5;
  void *v6;
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
  unsigned int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (self->_rawValue != a3)
  {
    self->_rawValue = a3;
    NSStringFromSelector(sel_decibelValue);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTIOA2LegacyLevelControl willChangeValueForKey:](self, "willChangeValueForKey:", v5);

    NSStringFromSelector(sel_scalarValue);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTIOA2LegacyLevelControl willChangeValueForKey:](self, "willChangeValueForKey:", v6);

    CAVolumeCurve::ConvertRawToDB(&self->_volumeCurve, a3);
    v14.receiver = self;
    v14.super_class = (Class)ASDTIOA2LegacyLevelControl;
    -[ASDLevelControl setDecibelValue:](&v14, sel_setDecibelValue_);
    NSStringFromSelector(sel_decibelValue);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTIOA2LegacyLevelControl didChangeValueForKey:](self, "didChangeValueForKey:", v7);

    NSStringFromSelector(sel_scalarValue);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTIOA2LegacyLevelControl didChangeValueForKey:](self, "didChangeValueForKey:", v8);

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[ASDAudioDevice deviceUID](self->_ioa2Device, "deviceUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[ASDTIOA2LegacyLevelControl objectClass](self, "objectClass") >> 29
        && -[ASDTIOA2LegacyLevelControl objectClass](self, "objectClass") >> 24 <= 0x7E)
      {
        v10 = -[ASDTIOA2LegacyLevelControl objectClass](self, "objectClass") >> 24;
      }
      else
      {
        v10 = 32;
      }
      if ((-[ASDTIOA2LegacyLevelControl objectClass](self, "objectClass") & 0xE00000) != 0
        && (-[ASDTIOA2LegacyLevelControl objectClass](self, "objectClass") >> 16) <= 0x7Eu)
      {
        v11 = (-[ASDTIOA2LegacyLevelControl objectClass](self, "objectClass") >> 16);
      }
      else
      {
        v11 = 32;
      }
      if ((-[ASDTIOA2LegacyLevelControl objectClass](self, "objectClass") & 0xE000) != 0
        && ((unsigned __int16)-[ASDTIOA2LegacyLevelControl objectClass](self, "objectClass") >> 8) <= 0x7Eu)
      {
        v12 = ((unsigned __int16)-[ASDTIOA2LegacyLevelControl objectClass](self, "objectClass") >> 8);
      }
      else
      {
        v12 = 32;
      }
      if ((-[ASDTIOA2LegacyLevelControl objectClass](self, "objectClass") & 0xE0) != 0
        && -[ASDTIOA2LegacyLevelControl objectClass](self, "objectClass") <= 0x7Eu)
      {
        v13 = -[ASDTIOA2LegacyLevelControl objectClass](self, "objectClass");
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
      v26 = a3;
      _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Control '%c%c%c%c' changed to: %u", buf, 0x2Au);

    }
  }
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
  ASDTIOA2LegacyDevice *ioa2Device;
  _BOOL4 v5;
  std::recursive_mutex *v6;
  uint64_t v7;
  unsigned int v8;

  v8 = CAVolumeCurve::ConvertDBToRaw(&self->_volumeCurve, a3);
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
    -[ASDTIOA2LegacyLevelControl doSetValue:](self, "doSetValue:", v8);
  if ((_BYTE)v7)
    std::recursive_mutex::unlock(v6);
}

- (BOOL)changeScalarValue:(float)a3
{
  CAVolumeCurve::ConvertScalarToDB(&self->_volumeCurve, a3);
  return -[ASDTIOA2LegacyLevelControl changeDecibelValue:](self, "changeDecibelValue:");
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

- (void).cxx_destruct
{
  std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy((uint64_t)&self->_volumeCurve.mCurveMap, (_QWORD *)self->_volumeCurve.mCurveMap.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_ioa2Device, 0);
}

- (id).cxx_construct
{
  CAVolumeCurve::CAVolumeCurve(&self->_volumeCurve);
  return self;
}

@end
