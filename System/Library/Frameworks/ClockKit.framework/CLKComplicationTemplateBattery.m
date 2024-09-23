@implementation CLKComplicationTemplateBattery

- (CLKComplicationTemplateBattery)initWithFamily:(int64_t)a3 textProvider:(id)a4 level:(double)a5 charging:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  CLKComplicationTemplateBattery *v11;
  CLKComplicationTemplateBattery *v12;
  objc_super v14;

  v6 = a6;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CLKComplicationTemplateBattery;
  v11 = -[CLKComplicationTemplate initPrivate](&v14, sel_initPrivate);
  v12 = v11;
  if (v11)
  {
    v11->_family = a3;
    -[CLKComplicationTemplateBattery setTextProvider:](v11, "setTextProvider:", v10);
    -[CLKComplicationTemplateBattery setLevel:](v12, "setLevel:", a5);
    -[CLKComplicationTemplateBattery setCharging:](v12, "setCharging:", v6);
  }

  return v12;
}

+ (id)templateWithFamily:(int64_t)a3 textProvider:(id)a4 level:(double)a5 charging:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;

  v6 = a6;
  v10 = a4;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFamily:textProvider:level:charging:", a3, v10, v6, a5);

  return v11;
}

- (int64_t)compatibleFamily
{
  return self->_family;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLKComplicationTemplateBattery;
  v4 = -[CLKComplicationTemplate copyWithZone:](&v6, sel_copyWithZone_, a3);
  *((_QWORD *)v4 + 9) = self->_family;
  *((_QWORD *)v4 + 12) = *(_QWORD *)&self->_level;
  *((_BYTE *)v4 + 80) = self->_charging;
  objc_storeStrong((id *)v4 + 11, self->_textProvider);
  return v4;
}

- (void)_enumerateFloatKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, uint64_t, _QWORD, char *))a3 + 2))(a3, CFSTR("level"), 1, 0, &v3);
}

- (void)_enumerateBOOLKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, uint64_t, char *))a3 + 2))(a3, CFSTR("charging"), 1, &v3);
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, _QWORD, char *))a3 + 2))(a3, CFSTR("textProvider"), 0, 0, &v3);
}

- (CLKTextProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (double)level
{
  return self->_level;
}

- (void)setLevel:(double)a3
{
  self->_level = a3;
}

- (BOOL)charging
{
  return self->_charging;
}

- (void)setCharging:(BOOL)a3
{
  self->_charging = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textProvider, 0);
}

@end
