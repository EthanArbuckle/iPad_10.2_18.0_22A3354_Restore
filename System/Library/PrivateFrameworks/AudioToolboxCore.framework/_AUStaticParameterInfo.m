@implementation _AUStaticParameterInfo

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v4 = a3;
  *(float *)&v5 = self->_minValue;
  v8 = v4;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("min"), v5);
  *(float *)&v6 = self->_maxValue;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("max"), v6);
  objc_msgSend(v8, "encodeInt32:forKey:", self->_unit, CFSTR("unit"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_unitName, CFSTR("unitName"));
  objc_msgSend(v8, "encodeInt64:forKey:", self->_flags, CFSTR("flags"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_valueStrings, CFSTR("values"));
  objc_msgSend(v8, "encodeInt32:forKey:", self->_clumpID, CFSTR("clump"));
  *(float *)&v7 = self->_defaultValue;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("default"), v7);
  objc_msgSend(v8, "encodeInt32:forKey:", self->_originalOrder, CFSTR("originalOrder"));

}

- (_AUStaticParameterInfo)initWithCoder:(id)a3
{
  id v4;
  unsigned __int8 v5;
  _AUStaticParameterInfo *v6;
  float v7;
  float v8;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  id v14;
  void *v15;
  void *v16;
  objc_super v17;

  v4 = a3;
  if ((v5 & 1) == 0
  {
    v14 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_opt_self();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_AUStaticParameterInfo initWithCoder:]::valueStringClasses = objc_msgSend(v14, "initWithObjects:", v15, v16, 0);

  }
  v17.receiver = self;
  v17.super_class = (Class)_AUStaticParameterInfo;
  v6 = -[_AUStaticParameterInfo init](&v17, sel_init);
  if (v6)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("min"));
    v6->_minValue = v7;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("max"));
    v6->_maxValue = v8;
    v6->_unit = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("unit"));
    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("unitName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v6->_unitName, v10);

    v6->_flags = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("flags"));
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", -[_AUStaticParameterInfo initWithCoder:]::valueStringClasses, CFSTR("values"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v6->_valueStrings, v11);

    v6->_clumpID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("clump"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("default"));
    v6->_defaultValue = v12;
    v6->_originalOrder = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("originalOrder"));
  }

  return v6;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_AUStaticParameterInfo;
  -[_AUStaticParameterInfo dealloc](&v2, sel_dealloc);
}

- (float)minValue
{
  return self->_minValue;
}

- (void)setMinValue:(float)a3
{
  self->_minValue = a3;
}

- (float)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(float)a3
{
  self->_maxValue = a3;
}

- (unsigned)unit
{
  return self->_unit;
}

- (void)setUnit:(unsigned int)a3
{
  self->_unit = a3;
}

- (NSString)unitName
{
  return self->_unitName;
}

- (void)setUnitName:(id)a3
{
  objc_storeStrong((id *)&self->_unitName, a3);
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (NSArray)valueStrings
{
  return self->_valueStrings;
}

- (void)setValueStrings:(id)a3
{
  objc_storeStrong((id *)&self->_valueStrings, a3);
}

- (unsigned)clumpID
{
  return self->_clumpID;
}

- (void)setClumpID:(unsigned int)a3
{
  self->_clumpID = a3;
}

- (float)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(float)a3
{
  self->_defaultValue = a3;
}

- (unsigned)originalOrder
{
  return self->_originalOrder;
}

- (void)setOriginalOrder:(unsigned int)a3
{
  self->_originalOrder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueStrings, 0);
  objc_storeStrong((id *)&self->_unitName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
