@implementation AUParameter

- (AUParameter)initWithID:(id)a3 name:(id)a4 address:(unint64_t)a5 min:(float)a6 max:(float)a7 unit:(unsigned int)a8 unitName:(id)a9 flags:(unsigned int)a10 valueStrings:(id)a11 dependentParameters:(id)a12
{
  uint64_t v12;
  uint64_t v13;
  id v20;
  id v21;
  id v22;
  AUParameter *v23;
  _AUStaticParameterInfo *v24;
  double v25;
  double v26;
  double v27;
  _AUStaticParameterInfo *info;
  _AUStaticParameterInfo *v29;
  objc_super v31;

  v12 = *(_QWORD *)&a10;
  v13 = *(_QWORD *)&a8;
  v20 = a9;
  v21 = a11;
  v22 = a12;
  v31.receiver = self;
  v31.super_class = (Class)AUParameter;
  v23 = -[AUParameterNode initWithID:name:](&v31, sel_initWithID_name_, a3, a4);
  if (v23)
  {
    v24 = objc_alloc_init(_AUStaticParameterInfo);
    *(float *)&v25 = a6;
    -[_AUStaticParameterInfo setMinValue:](v24, "setMinValue:", v25);
    *(float *)&v26 = a7;
    -[_AUStaticParameterInfo setMaxValue:](v24, "setMaxValue:", v26);
    -[_AUStaticParameterInfo setFlags:](v24, "setFlags:", v12);
    -[_AUStaticParameterInfo setValueStrings:](v24, "setValueStrings:", v21);
    -[_AUStaticParameterInfo setUnit:](v24, "setUnit:", v13);
    -[_AUStaticParameterInfo setUnitName:](v24, "setUnitName:", v20);
    LODWORD(v27) = 0;
    -[_AUStaticParameterInfo setDefaultValue:](v24, "setDefaultValue:", v27);
    -[_AUStaticParameterInfo setOriginalOrder:](v24, "setOriginalOrder:", 0);
    info = v23->_info;
    v23->_info = v24;
    v29 = v24;

    v23->_address = a5;
    objc_storeStrong((id *)&v23->_dependentParameters, a12);

  }
  return v23;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AUParameter;
  -[AUParameterNode dealloc](&v2, sel_dealloc);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  AUParameterAddress v7;
  float v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[AUParameterNode identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AUParameterNode displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AUParameter address](self, "address");
  -[AUParameter value](self, "value");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, \"%@\", \"%@\", addr 0x%llx, val %.3f>"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)copyNodeWithOffset:(unint64_t)a3
{
  AUParameter *v5;
  void *v6;
  void *v7;
  AUParameter *v8;
  void *v9;

  v5 = [AUParameter alloc];
  -[AUParameterNode identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AUParameterNode displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AUParameterNode initWithID:name:](v5, "initWithID:name:", v6, v7);

  -[AUParameter info](self, "info");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AUParameter setInfo:](v8, "setInfo:", v9);

  -[AUParameter setAddress:](v8, "setAddress:", -[AUParameter address](self, "address") + a3);
  return v8;
}

- (BOOL)localValueStale
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_localValueStale);
  return v2 & 1;
}

- (void)setLocalValueStale:(BOOL)a3
{
  atomic_store(a3, (unsigned __int8 *)&self->_localValueStale);
}

- (float)_internalValue
{
  void *v3;
  unsigned __int8 v4;
  AUParameter *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  float value;

  -[AUParameterNode _rootParent](self, "_rootParent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = atomic_load((unsigned __int8 *)&self->_localValueStale);
  if ((v4 & 1) != 0 || (-[_AUStaticParameterInfo flags](self->_info, "flags") & 0x8000) != 0 && v3)
  {
    v5 = self;
    v6 = v5;
    while (1)
    {
      objc_msgSend(v6, "implementorValueProvider");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (v7)
        break;
      objc_msgSend(v6, "parentNode");
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v9;
      if (!v9)
        goto LABEL_9;
    }
    v5->_value = (*(float (**)(uint64_t, AUParameter *))(v7 + 16))(v7, v5);
    atomic_store(0, (unsigned __int8 *)&self->_localValueStale);

  }
LABEL_9:
  value = self->_value;

  return value;
}

- (AUValue)value
{
  void *v3;
  void *v4;
  void *v5;
  void *specific;
  NSObject *v7;
  float v8;
  float v9;
  _QWORD v11[6];
  uint64_t v12;
  float *v13;
  uint64_t v14;
  float value;

  -[AUParameterNode _rootParent](self, "_rootParent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v12 = 0;
  v13 = (float *)&v12;
  v14 = 0x2020000000;
  value = self->_value;
  if (!v3
    || (objc_msgSend(v3, "valueAccessQueue"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        specific = dispatch_get_specific(&current_queue_key),
        v5,
        specific == v5))
  {
    -[AUParameter _internalValue](self, "_internalValue");
    v8 = v9;
    v13[6] = v9;
  }
  else
  {
    objc_msgSend(v4, "valueAccessQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __20__AUParameter_value__block_invoke;
    v11[3] = &unk_1E29210C0;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v7, v11);

    v8 = v13[6];
  }
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (void)setValue:(AUValue)value
{
  void *v5;
  double v6;

  v5 = (void *)MEMORY[0x193FFEC70](self, a2);
  *(AUValue *)&v6 = value;
  -[AUParameter setValue:extOriginator:atHostTime:eventType:](self, "setValue:extOriginator:atHostTime:eventType:", 0, 0, 0, v6);
  objc_autoreleasePoolPop(v5);
}

- (void)setValue:(AUValue)value originator:(AUParameterObserverToken)originator
{
  -[AUParameter setValue:extOriginator:atHostTime:eventType:](self, "setValue:extOriginator:atHostTime:eventType:", originator & 0xFFFFFFFE, 0, 0);
}

- (void)setValue:(AUValue)value originator:(AUParameterObserverToken)originator atHostTime:(uint64_t)hostTime
{
  -[AUParameter setValue:extOriginator:atHostTime:eventType:](self, "setValue:extOriginator:atHostTime:eventType:", originator & 0xFFFFFFFE, hostTime, 0);
}

- (void)setValue:(AUValue)value originator:(AUParameterObserverToken)originator atHostTime:(uint64_t)hostTime eventType:(AUParameterAutomationEventType)eventType
{
  -[AUParameter setValue:extOriginator:atHostTime:eventType:](self, "setValue:extOriginator:atHostTime:eventType:", originator & 0xFFFFFFFE, hostTime, *(_QWORD *)&eventType);
}

- (void)setValue:(float)a3 extOriginator:(AUParameterObserverExtendedToken)a4 atHostTime:(unint64_t)a5 eventType:(unsigned int)a6
{
  void *v11;
  void *v12;
  id v13;
  void (**v14)(_QWORD);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *specific;
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  AUParameter *v28;
  id v29;
  _QWORD *v30;
  unint64_t var0;
  unint64_t v32;
  float v33;
  unsigned int v34;
  _QWORD v35[4];

  v11 = (void *)MEMORY[0x193FFEC70](self, a2);
  -[AUParameterNode _rootParent](self, "_rootParent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v35[3] = a5;
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __59__AUParameter_setValue_extOriginator_atHostTime_eventType___block_invoke;
  v27 = &unk_1E2921150;
  v33 = a3;
  v28 = self;
  var0 = a4.var0;
  v13 = v12;
  v32 = a5;
  v34 = a6;
  v29 = v13;
  v30 = v35;
  v14 = (void (**)(_QWORD))_Block_copy(&v24);
  v19 = (void *)MEMORY[0x193FFEC70](v14, v15, v16, v17, v18);
  if (!v13
    || (objc_msgSend(v13, "valueAccessQueue", v24, v25, v26, v27, v28),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        specific = dispatch_get_specific(&current_queue_key),
        v20,
        specific == v20))
  {
    v14[2](v14);
  }
  else
  {
    v22 = v13;

    objc_msgSend(v22, "valueAccessQueue");
    v23 = objc_claimAutoreleasedReturnValue();
    dispatch_sync(v23, v14);

  }
  objc_autoreleasePoolPop(v19);

  _Block_object_dispose(v35, 8);
  objc_autoreleasePoolPop(v11);
}

- (NSString)stringFromValue:(const AUValue *)value
{
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;

  -[AUParameterNode implementorStringFromValueCallback](self, "implementorStringFromValueCallback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AUParameterNode implementorStringFromValueCallback](self, "implementorStringFromValueCallback");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, AUParameter *, const AUValue *))v6)[2](v6, self, value);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v11 = (void *)v7;
    goto LABEL_10;
  }
  -[AUParameterNode _rootParent](self, "_rootParent");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v6 = v8;
  if (!v8
    || (objc_msgSend(v8, "implementorStringFromValueCallback"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        !v9))
  {
    if (!value)
      value = &self->_value;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%g"), *value);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v6, "implementorStringFromValueCallback");
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, AUParameter *, const AUValue *))v10)[2](v10, self, value);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return (NSString *)v11;
}

- (AUValue)valueFromString:(NSString *)string
{
  NSString *v4;
  void *v5;
  float (**v6)(_QWORD, _QWORD, _QWORD);
  float v7;
  float (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  float (**v11)(_QWORD, _QWORD, _QWORD);

  v4 = string;
  -[AUParameterNode implementorValueFromStringCallback](self, "implementorValueFromStringCallback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AUParameterNode implementorValueFromStringCallback](self, "implementorValueFromStringCallback");
    v6 = (float (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7 = ((float (**)(_QWORD, AUParameter *, NSString *))v6)[2](v6, self, v4);
  }
  else
  {
    -[AUParameterNode _rootParent](self, "_rootParent");
    v9 = (float (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6 = v9;
    v7 = 0.0;
    if (v9)
    {
      objc_msgSend(v9, "implementorValueFromStringCallback");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v6, "implementorValueFromStringCallback");
        v11 = (float (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v7 = ((float (**)(_QWORD, AUParameter *, NSString *))v11)[2](v11, self, v4);

      }
    }
  }

  return v7;
}

- (AUValue)minValue
{
  AUValue result;

  -[_AUStaticParameterInfo minValue](self->_info, "minValue");
  return result;
}

- (AUValue)maxValue
{
  AUValue result;

  -[_AUStaticParameterInfo maxValue](self->_info, "maxValue");
  return result;
}

- (AudioUnitParameterUnit)unit
{
  return -[_AUStaticParameterInfo unit](self->_info, "unit");
}

- (NSString)unitName
{
  void *v3;
  _AUStaticParameterInfo *info;
  uint64_t v5;
  unsigned int v6;
  __CFString *v7;
  unsigned __int8 v8;
  __CFString *v10;
  int v11;

  -[_AUStaticParameterInfo unitName](self->_info, "unitName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  info = self->_info;
  if (v3)
  {
    -[_AUStaticParameterInfo unitName](info, "unitName");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = -[_AUStaticParameterInfo unit](info, "unit");
    v7 = &stru_1E2923288;
    switch(v6)
    {
      case 0u:
      case 1u:
      case 7u:
      case 0x10u:
      case 0x11u:
      case 0x19u:
      case 0x1Au:
        return (NSString *)v7;
      case 2u:
        v7 = CFSTR("T/F");
        goto LABEL_22;
      case 3u:
        v7 = CFSTR("%");
        goto LABEL_22;
      case 4u:
        v7 = CFSTR("Secs");
        goto LABEL_22;
      case 5u:
        v7 = CFSTR("Samps");
        goto LABEL_22;
      case 6u:
      case 0xFu:
        v7 = CFSTR("Degr.");
        goto LABEL_22;
      case 8u:
        v7 = CFSTR("Hz");
        goto LABEL_22;
      case 9u:
      case 0x14u:
        v7 = CFSTR("Cents");
        goto LABEL_22;
      case 0xAu:
        v7 = CFSTR("S-T");
        goto LABEL_22;
      case 0xBu:
      case 0xCu:
      case 0x1Bu:
        v7 = CFSTR("MIDI");
        goto LABEL_22;
      case 0xDu:
        v7 = CFSTR("dB");
        goto LABEL_22;
      case 0xEu:
        v7 = CFSTR("Gain");
        goto LABEL_22;
      case 0x12u:
        v7 = CFSTR("L/R");
        goto LABEL_22;
      case 0x13u:
        v7 = CFSTR("Mtrs");
        goto LABEL_22;
      case 0x15u:
        v7 = CFSTR("8ve");
        goto LABEL_22;
      case 0x16u:
        v7 = CFSTR("BPM");
        goto LABEL_22;
      case 0x17u:
        v7 = CFSTR("Beats");
        goto LABEL_22;
      case 0x18u:
        v7 = CFSTR("msecs");
        goto LABEL_22;
      default:
        v7 = 0;
LABEL_22:
        if ((v8 & 1) == 0)
        {
          v10 = v7;
          v7 = v10;
          if (v11)
          {
            -[AUParameter unitName]::coreAudioUIBundle = objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithPath:", CFSTR("/System/Library/Frameworks/CoreAudioKit.framework"));
            v7 = v10;
          }
        }
        if (!-[AUParameter unitName]::coreAudioUIBundle)
          return (NSString *)v7;
        objc_msgSend((id)-[AUParameter unitName]::coreAudioUIBundle, "localizedStringForKey:value:table:", v7, &stru_1E2923288, CFSTR("AUParameters"));
        v5 = objc_claimAutoreleasedReturnValue();
        break;
    }
  }
  v7 = (__CFString *)v5;
  return (NSString *)v7;
}

- (AudioUnitParameterOptions)flags
{
  return -[_AUStaticParameterInfo flags](self->_info, "flags");
}

- (NSArray)valueStrings
{
  return -[_AUStaticParameterInfo valueStrings](self->_info, "valueStrings");
}

- (unsigned)_clumpID
{
  return -[_AUStaticParameterInfo clumpID](self->_info, "clumpID");
}

- (void)set_clumpID:(unsigned int)a3
{
  -[_AUStaticParameterInfo setClumpID:](self->_info, "setClumpID:", *(_QWORD *)&a3);
}

- (float)_defaultValue
{
  float result;

  -[_AUStaticParameterInfo defaultValue](self->_info, "defaultValue");
  return result;
}

- (void)set_defaultValue:(float)a3
{
  -[_AUStaticParameterInfo setDefaultValue:](self->_info, "setDefaultValue:");
}

- (unsigned)_originalOrder
{
  return -[_AUStaticParameterInfo originalOrder](self->_info, "originalOrder");
}

- (void)set_originalOrder:(unsigned int)a3
{
  -[_AUStaticParameterInfo setOriginalOrder:](self->_info, "setOriginalOrder:", *(_QWORD *)&a3);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AUParameterNode identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("id"));

  -[AUParameterNode displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("name"));

  -[AUParameter info](self, "info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("info"));

  -[AUParameter value](self, "value");
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("value"));
  objc_msgSend(v7, "encodeInt64:forKey:", -[AUParameter address](self, "address"), CFSTR("address"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_dependentParameters, CFSTR("deps"));

}

- (AUParameter)initWithCoder:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AUParameter *v10;
  void *v11;
  void *v12;
  float v13;
  void *v14;
  id v16;
  void *v17;
  void *v18;
  objc_super v19;

  v4 = a3;
  {
    v16 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_opt_self();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AUParameter initWithCoder:]::depParamClasses = objc_msgSend(v16, "initWithObjects:", v17, v18, 0);

  }
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v19.receiver = self;
  v19.super_class = (Class)AUParameter;
  v10 = -[AUParameterNode initWithID:name:](&v19, sel_initWithID_name_, v7, v9);
  if (v10)
  {
    objc_opt_self();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, CFSTR("info"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v10->_info, v12);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("value"));
    v10->_value = v13;
    v10->_address = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("address"));
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", -[AUParameter initWithCoder:]::depParamClasses, CFSTR("deps"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v10->_dependentParameters, v14);

  }
  return v10;
}

- (void)_observersChanged:(BOOL)a3 deltaCount:(int)a4
{
  int *v4;
  unsigned int *v5;
  unsigned int v6;

  v4 = &OBJC_IVAR___AUParameter__numUIObservers;
  if (a3)
    v4 = &OBJC_IVAR___AUParameter__numRecordingObservers;
  v5 = (unsigned int *)((char *)self + *v4);
  do
    v6 = __ldaxr(v5);
  while (__stlxr(v6 + a4, v5));
}

- (AUParameterAddress)address
{
  return self->_address;
}

- (void)setAddress:(unint64_t)a3
{
  self->_address = a3;
}

- (NSArray)dependentParameters
{
  return self->_dependentParameters;
}

- (_AUStaticParameterInfo)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_dependentParameters, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 88) = 0;
  *((_DWORD *)self + 23) = 0;
  *((_DWORD *)self + 24) = 0;
  return self;
}

void __59__AUParameter_setValue_extOriginator_atHostTime_eventType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  int v27;
  int v29;
  unsigned int v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  _BOOL4 v35;
  int v36;
  unsigned int v37;
  unsigned __int8 v38;
  NSObject *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  int v49;
  int v50;
  _QWORD v51[3];
  _QWORD *v52;
  id v53;
  _QWORD v54[3];
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t, void *);
  void *v59;
  _BYTE v60[24];
  _BYTE *v61;
  _QWORD v62[3];
  _QWORD *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 100) = *(_DWORD *)(a1 + 72);
  atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 88));
  v2 = *(_QWORD *)(a1 + 56);
  v3 = v2 & 0xFFFFFFFE;
  v4 = (v2 & 0xFFFFFFFE) == 2 || (_DWORD)v3 == 4;
  if (!v4 && ((_DWORD)v3 != 8 || (v2 & 1) != 0))
  {
    v5 = *(id *)(a1 + 32);
    if (v5)
    {
      v6 = v5;
      while (1)
      {
        objc_msgSend(v6, "implementorValueObserver");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)v7;
        if (v7)
          break;
        objc_msgSend(v6, "parentNode");
        v9 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v9;
        if (!v9)
          goto LABEL_13;
      }
      (*(void (**)(uint64_t, _QWORD, float))(v7 + 16))(v7, *(_QWORD *)(a1 + 32), *(float *)(a1 + 72));

    }
LABEL_13:
    v2 = *(_QWORD *)(a1 + 56);
  }
  if ((v2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "remoteParameterSynchronizerXPCConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (v3 == 4)
        v11 = 0;
      else
        v11 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 40), "remoteParameterSynchronizerXPCConnection");
      v51[0] = &off_1E2913638;
      v51[1] = &__block_literal_global_6111;
      v52 = v51;
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v53 = v12;
      v13 = v54;
      v14 = (uint64_t)v52;
      if (v52)
      {
        if (v52 == v51)
        {
          v55 = v54;
          (*(void (**)(_QWORD *, _QWORD *))(v51[0] + 24))(v51, v54);
LABEL_24:

          v15 = v52;
          if (v52 == v51)
          {
            v16 = 4;
            v15 = v51;
          }
          else
          {
            if (!v52)
              goto LABEL_29;
            v16 = 5;
          }
          (*(void (**)(void))(*v15 + 8 * v16))();
LABEL_29:

          v17 = v55;
          if (v55)
          {
            if (v55 == v54)
            {
              v63 = v62;
              (*(void (**)(_QWORD *, _QWORD *))(v54[0] + 24))(v54, v62);
              v17 = v63;
            }
            else
            {
              v17 = (_QWORD *)(*(uint64_t (**)(void))(*v55 + 16))();
              v63 = v17;
            }
            v18 = v53;
            v56 = MEMORY[0x1E0C809B0];
            v57 = 3321888768;
            v58 = ___ZN5caulk3xpc7messageIU8__strongPU44objcproto33_AURemoteParameterSynchronization11objc_objectJEE11async_proxyEv_block_invoke;
            v59 = &__block_descriptor_64_ea8_32c50_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJEEEEEE_e17_v16__0__NSError_8l;
            v19 = v60;
            if (v17)
            {
              if (v17 == v62)
              {
                v61 = v60;
                (*(void (**)(_QWORD *, _BYTE *))(v62[0] + 24))(v62, v60);
LABEL_38:
                objc_msgSend(v18, "remoteObjectProxyWithErrorHandler:", &v56);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if (v61 == v60)
                {
                  v21 = 4;
                }
                else
                {
                  if (!v61)
                    goto LABEL_43;
                  v21 = 5;
                  v19 = v61;
                }
                (*(void (**)(_QWORD *))(*v19 + 8 * v21))(v19);
LABEL_43:
                v22 = v63;
                if (v63 == v62)
                {
                  v23 = 4;
                  v22 = v62;
                }
                else
                {
                  if (!v63)
                    goto LABEL_48;
                  v23 = 5;
                }
                (*(void (**)(void))(*v22 + 8 * v23))();
LABEL_48:
                v24 = objc_msgSend(*(id *)(a1 + 32), "address");
                LODWORD(v25) = *(_DWORD *)(a1 + 72);
                objc_msgSend(v20, "syncParameter:value:extOriginator:hostTime:eventType:", v24, v11, *(_QWORD *)(a1 + 64), *(unsigned int *)(a1 + 76), v25);

                if (v55 == v54)
                {
                  v26 = 4;
                }
                else
                {
                  if (!v55)
                  {
LABEL_53:

                    goto LABEL_54;
                  }
                  v26 = 5;
                  v13 = v55;
                }
                (*(void (**)(_QWORD *))(*v13 + 8 * v26))(v13);
                goto LABEL_53;
              }
              v17 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v17 + 16))(v17);
            }
          }
          else
          {
            v63 = 0;
            v18 = v53;
            v56 = MEMORY[0x1E0C809B0];
            v57 = 3321888768;
            v58 = ___ZN5caulk3xpc7messageIU8__strongPU44objcproto33_AURemoteParameterSynchronization11objc_objectJEE11async_proxyEv_block_invoke;
            v59 = &__block_descriptor_64_ea8_32c50_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJEEEEEE_e17_v16__0__NSError_8l;
            v19 = v60;
          }
          v61 = v17;
          goto LABEL_38;
        }
        v14 = (*(uint64_t (**)(void))(*v52 + 16))();
      }
      v55 = (_QWORD *)v14;
      goto LABEL_24;
    }
  }
LABEL_54:
  objc_msgSend(*(id *)(a1 + 32), "_internalValue");
  if (*(_QWORD *)(a1 + 40))
  {
    if ((_DWORD)v3 != 6 && (_DWORD)v3 != 8)
    {
      v29 = v27;
      v30 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 32) + 92));
      if (v30 || (v31 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 32) + 96))) != 0)
      {
        v32 = *(_QWORD *)(a1 + 32);
        v33 = *(_QWORD *)(v32 + 104);
        v34 = atomic_load((unsigned int *)(v32 + 92));
        v35 = v34 != 0;
        LODWORD(v32) = atomic_load((unsigned int *)(v32 + 96));
        if ((_DWORD)v32)
          v36 = v35 | 2;
        else
          v36 = v35;
        v37 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 32) + 96));
        if (v37 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = mach_absolute_time();
        if ((v38 & 1) == 0)
        {
          {
            serialDeferralQueue(void)::gDeferralQueue = (uint64_t)dispatch_queue_create("AUParameterTree.deferralQueue", 0);
          }
        }
        v39 = serialDeferralQueue(void)::gDeferralQueue;
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __59__AUParameter_setValue_extOriginator_atHostTime_eventType___block_invoke_3;
        v43[3] = &unk_1E2921128;
        v40 = *(id *)(a1 + 40);
        v48 = v36;
        v49 = v29;
        v42 = *(_QWORD *)(a1 + 48);
        v41 = *(_QWORD *)(a1 + 56);
        v46 = v33;
        v47 = v41;
        v44 = v40;
        v45 = v42;
        v50 = *(_DWORD *)(a1 + 76);
        dispatch_async(v39, v43);

      }
    }
  }
}

void __59__AUParameter_setValue_extOriginator_atHostTime_eventType___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  __int128 v8;
  int v9;
  int v10;
  int v11;

  objc_msgSend(*(id *)(a1 + 32), "observationQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__AUParameter_setValue_extOriginator_atHostTime_eventType___block_invoke_4;
  v5[3] = &unk_1E2921128;
  v3 = *(id *)(a1 + 32);
  v9 = *(_DWORD *)(a1 + 64);
  v10 = *(_DWORD *)(a1 + 68);
  v8 = *(_OWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  v11 = *(_DWORD *)(a1 + 72);
  dispatch_sync(v2, v5);

}

uint64_t __59__AUParameter_setValue_extOriginator_atHostTime_eventType___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  unint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v18;
  unint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  char *v27;
  __int128 v28;
  __int128 v29;
  __int128 v31;
  _QWORD v32[3];
  _QWORD *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "observerController");
  v3 = v2;
  v4 = *(_DWORD *)(a1 + 64);
  v5 = *(_DWORD *)(a1 + 68);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v8 = *(_DWORD *)(a1 + 72);
  if (!*(_BYTE *)(v2 + 48))
  {
    *(_BYTE *)(v2 + 48) = 1;
    v10 = *(_QWORD *)v2;
    v9 = *(_QWORD *)(v2 + 8);
    if (v9)
    {
      v11 = (unint64_t *)(v9 + 16);
      do
        v12 = __ldxr(v11);
      while (__stxr(v12 + 1, v11));
    }
    v32[0] = &off_1E29159F0;
    v32[1] = v10;
    v32[2] = v9;
    v33 = v32;
    CAEventReceiver::createTimer(*(_QWORD *)(v2 + 32), (uint64_t)v32);
    v13 = v33;
    if (v33 == v32)
    {
      v14 = 4;
      v13 = v32;
    }
    else
    {
      if (!v33)
        goto LABEL_10;
      v14 = 5;
    }
    (*(void (**)(void))(*v13 + 8 * v14))();
  }
LABEL_10:
  if ((v4 & 1) != 0)
  {
    v15 = *(_QWORD *)(a1 + 56);
    *(_QWORD *)&v31 = v6;
    *((_QWORD *)&v31 + 1) = v15;
    std::__tree<AUObserverController::AddressOriginator>::__emplace_unique_key_args<AUObserverController::AddressOriginator,AUObserverController::AddressOriginator>((uint64_t *)(v3 + 56), v6, v15, &v31);
  }
  if ((v4 & 2) != 0)
  {
    v16 = *(_QWORD *)(a1 + 56) & 0xFFFFFFFELL;
    v18 = (_DWORD)v16 != 6 && (_DWORD)v16 != 10 && v16 != 2;
    v20 = *(_QWORD **)(v3 + 88);
    v19 = *(_QWORD *)(v3 + 96);
    if ((unint64_t)v20 >= v19)
    {
      v22 = *(_QWORD **)(v3 + 80);
      v23 = 0xCCCCCCCCCCCCCCCDLL * (v20 - v22) + 1;
      if (v23 > 0x666666666666666)
        std::vector<float>::__throw_length_error[abi:ne180100]();
      v24 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v19 - (_QWORD)v22) >> 3);
      if (2 * v24 > v23)
        v23 = 2 * v24;
      if (v24 >= 0x333333333333333)
        v25 = 0x666666666666666;
      else
        v25 = v23;
      if (v25 > 0x666666666666666)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v26 = (char *)operator new(40 * v25);
      v27 = &v26[8 * (v20 - v22)];
      *(_QWORD *)v27 = v7;
      *((_QWORD *)v27 + 1) = v6;
      *((_DWORD *)v27 + 4) = v5;
      *((_DWORD *)v27 + 5) = v8;
      *((_QWORD *)v27 + 3) = v18;
      *((_QWORD *)v27 + 4) = v16;
      v21 = v27 + 40;
      if (v20 != v22)
      {
        do
        {
          v28 = *(_OWORD *)(v20 - 5);
          v29 = *(_OWORD *)(v20 - 3);
          *((_QWORD *)v27 - 1) = *(v20 - 1);
          *(_OWORD *)(v27 - 24) = v29;
          *(_OWORD *)(v27 - 40) = v28;
          v27 -= 40;
          v20 -= 5;
        }
        while (v20 != v22);
        v20 = v22;
      }
      *(_QWORD *)(v3 + 80) = v27;
      *(_QWORD *)(v3 + 88) = v21;
      *(_QWORD *)(v3 + 96) = &v26[40 * v25];
      if (v20)
        operator delete(v20);
    }
    else
    {
      *v20 = v7;
      v20[1] = v6;
      *((_DWORD *)v20 + 4) = v5;
      *((_DWORD *)v20 + 5) = v8;
      v21 = v20 + 5;
      v20[3] = v18;
      v20[4] = v16;
    }
    *(_QWORD *)(v3 + 88) = v21;
  }
  return CAEventReceiver::Impl::timerShouldFireWithin(*(CAEventReceiver::Impl **)(v3 + 32), 0.05);
}

uint64_t __20__AUParameter_value__block_invoke(uint64_t a1)
{
  uint64_t result;
  int v3;

  result = objc_msgSend(*(id *)(a1 + 32), "_internalValue");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
