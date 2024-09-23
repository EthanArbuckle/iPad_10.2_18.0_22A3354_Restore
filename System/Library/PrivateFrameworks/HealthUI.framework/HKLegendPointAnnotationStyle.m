@implementation HKLegendPointAnnotationStyle

+ (HKLegendPointAnnotationStyle)annotationStyleWithLabelStyle:(id)a3 localizedLabelKey:(id)a4 leftOfSeries:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setLabelStyle:", v8);

  objc_msgSend(v9, "setLeftOfSeries:", v5);
  objc_msgSend(v9, "setLocalizedLabelKey:", v7);

  return (HKLegendPointAnnotationStyle *)v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[HKAxisLabelStyle copy](self->_labelStyle, "copy");
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  *(_BYTE *)(v4 + 8) = self->_leftOfSeries;
  v7 = -[NSString copy](self->_localizedLabelKey, "copy");
  v8 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v7;

  return (id)v4;
}

- (HKAxisLabelStyle)labelStyle
{
  return self->_labelStyle;
}

- (void)setLabelStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)localizedLabelKey
{
  return self->_localizedLabelKey;
}

- (void)setLocalizedLabelKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)leftOfSeries
{
  return self->_leftOfSeries;
}

- (void)setLeftOfSeries:(BOOL)a3
{
  self->_leftOfSeries = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedLabelKey, 0);
  objc_storeStrong((id *)&self->_labelStyle, 0);
}

@end
