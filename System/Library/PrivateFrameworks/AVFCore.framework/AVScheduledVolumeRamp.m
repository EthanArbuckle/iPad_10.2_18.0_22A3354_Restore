@implementation AVScheduledVolumeRamp

+ (id)_defaultAdditionalFigRepresentationObjects
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", *MEMORY[0x1E0CC4C78]);
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

+ (id)volumeRampWithStartVolume:(float)a3 endVolume:(float)a4 timeRange:(id *)a5 rampMode:(int64_t)a6
{
  id v10;
  __int128 v11;
  _OWORD v13[2];

  v10 = objc_alloc((Class)objc_opt_class());
  v11 = *(_OWORD *)&a5->var0.var3;
  v13[0] = *(_OWORD *)&a5->var0.var0;
  v13[1] = v11;
  *(float *)&v11 = a4;
  return (id)objc_msgSend(v10, "initWithStartVolume:endVolume:timeRange:rampMode:", v13, a6, COERCE_DOUBLE(__PAIR64__(HIDWORD(*(_QWORD *)&a5->var1.var1), LODWORD(a3))), *(double *)&v11);
}

- (AVScheduledVolumeRamp)initWithStartVolume:(float)a3 endVolume:(float)a4 timeRange:(id *)a5 rampMode:(int64_t)a6
{
  __int128 v7;
  AVScheduledVolumeRamp *result;
  _OWORD v9[3];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVScheduledVolumeRamp;
  v7 = *(_OWORD *)&a5->var0.var3;
  v9[0] = *(_OWORD *)&a5->var0.var0;
  v9[1] = v7;
  v9[2] = *(_OWORD *)&a5->var1.var1;
  result = -[AVScheduledFloatValueRamp initWithStartValue:endValue:timeRange:](&v10, sel_initWithStartValue_endValue_timeRange_, v9);
  if (result)
    result->_rampMode = a6;
  return result;
}

- (float)startVolume
{
  float result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVScheduledVolumeRamp;
  -[AVScheduledFloatValueRamp startFloatValue](&v3, sel_startFloatValue);
  return result;
}

- (float)endVolume
{
  float result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVScheduledVolumeRamp;
  -[AVScheduledFloatValueRamp endFloatValue](&v3, sel_endFloatValue);
  return result;
}

- (int64_t)rampMode
{
  return self->_rampMode;
}

- (int64_t)_parameterRampMode
{
  return self->_rampMode;
}

- (id)_additionalFigRepresentationObjects
{
  int64_t v2;
  _QWORD *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = -[AVScheduledVolumeRamp rampMode](self, "rampMode");
  v3 = (_QWORD *)MEMORY[0x1E0CC4C70];
  if (v2 != 1)
    v3 = (_QWORD *)MEMORY[0x1E0CC4C78];
  v5[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", *v3);
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
}

- (id)_makeRampWithTruncatedTimeRange:(id *)a3 endValue:(float)a4
{
  void *v7;
  unsigned int v8;
  unsigned int v9;
  int64_t v10;
  __int128 v11;
  _OWORD v13[2];

  v7 = (void *)objc_opt_class();
  -[AVScheduledVolumeRamp startVolume](self, "startVolume");
  v9 = v8;
  v10 = -[AVScheduledVolumeRamp rampMode](self, "rampMode");
  v11 = *(_OWORD *)&a3->var0.var3;
  v13[0] = *(_OWORD *)&a3->var0.var0;
  v13[1] = v11;
  *(float *)&v11 = a4;
  return (id)objc_msgSend(v7, "volumeRampWithStartVolume:endVolume:timeRange:rampMode:", v13, v10, COERCE_DOUBLE(__PAIR64__(HIDWORD(*(_QWORD *)&a3->var1.var1), v9)), *(double *)&v11);
}

- (AVScheduledVolumeRamp)initWithPropertyList:(id)a3
{
  AVScheduledVolumeRamp *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVScheduledVolumeRamp;
  v4 = -[AVScheduledFloatValueRamp initWithPropertyList:](&v6, sel_initWithPropertyList_);
  if (v4)
    v4->_rampMode = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("rampMode")), "integerValue");
  return v4;
}

- (id)propertyList
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVScheduledVolumeRamp;
  v3 = -[AVScheduledFloatValueRamp propertyList](&v5, sel_propertyList);
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AVScheduledVolumeRamp rampMode](self, "rampMode")), CFSTR("rampMode"));
  return v3;
}

@end
