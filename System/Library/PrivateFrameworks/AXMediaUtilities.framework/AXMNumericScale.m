@implementation AXMNumericScale

- (AXMNumericScale)init
{
  return -[AXMNumericScale initWithLowerBound:upperBound:apply:invert:](self, "initWithLowerBound:upperBound:apply:invert:", 0, 0, 0.0, 0.0);
}

- (AXMNumericScale)initWithLowerBound:(double)a3 upperBound:(double)a4 apply:(id)a5 invert:(id)a6
{
  id v10;
  id v11;
  AXMNumericScale *v12;
  AXMNumericScale *v13;
  uint64_t v14;
  id apply;
  uint64_t v16;
  id invert;
  objc_super v19;

  v10 = a5;
  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)AXMNumericScale;
  v12 = -[AXMNumericScale init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_lowerBound = a3;
    v12->_upperBound = a4;
    v14 = objc_msgSend(v10, "copy");
    apply = v13->_apply;
    v13->_apply = (id)v14;

    v16 = objc_msgSend(v11, "copy");
    invert = v13->_invert;
    v13->_invert = (id)v16;

  }
  return v13;
}

+ (id)linearScaleWithLowerBound:(double)a3 upperBound:(double)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithLowerBound:upperBound:apply:invert:", &__block_literal_global_486, &__block_literal_global_487, a3, a4);
}

+ (id)log10ScaleWithLowerBound:(double)a3 upperBound:(double)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithLowerBound:upperBound:apply:invert:", &__block_literal_global_488, &__block_literal_global_489, a3, a4);
}

+ (id)lnScaleWithLowerBound:(double)a3 upperBound:(double)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithLowerBound:upperBound:apply:invert:", &__block_literal_global_490, &__block_literal_global_491, a3, a4);
}

- (double)lowerBound
{
  return self->_lowerBound;
}

- (void)setLowerBound:(double)a3
{
  self->_lowerBound = a3;
}

- (double)upperBound
{
  return self->_upperBound;
}

- (void)setUpperBound:(double)a3
{
  self->_upperBound = a3;
}

- (id)apply
{
  return self->_apply;
}

- (void)setApply:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)invert
{
  return self->_invert;
}

- (void)setInvert:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invert, 0);
  objc_storeStrong(&self->_apply, 0);
}

@end
