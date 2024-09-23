@implementation PKInputPointRollNoiseFilter

- (void)resetFilter
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKInputPointRollNoiseFilter;
  -[PKInputPointBaseFilter resetFilter](&v3, sel_resetFilter);
  -[PKInputPointRollNoiseFilter _recalculateOffset](self, "_recalculateOffset");
}

- (void)_recalculateOffset
{
  double rollOffsetNoise;
  double v3[3];
  char v4;

  if (self)
    rollOffsetNoise = self->_rollOffsetNoise;
  else
    rollOffsetNoise = 0.0;
  v3[0] = 0.0;
  v3[1] = rollOffsetNoise;
  v4 = 0;
  self->currentRollOffsetValue = std::normal_distribution<double>::operator()<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>((uint64_t)v3, &self->generator.__x_, v3)* 0.0174532925;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 38) = 1;
  return self;
}

- (void)addInputPoint:(id *)a3
{
  double rollJitterNoise;
  double v6;
  long double v7;
  double v9[3];
  char v10;

  if (!self)
  {
    rollJitterNoise = 0.0;
LABEL_3:
    if (self->currentRollOffsetValue <= 0.0)
      goto LABEL_14;
    goto LABEL_4;
  }
  ++self->super._numInputPoints;
  rollJitterNoise = self->_rollJitterNoise;
  if (rollJitterNoise <= 0.0)
    goto LABEL_3;
LABEL_4:
  v9[0] = 0.0;
  v9[1] = rollJitterNoise;
  v10 = 0;
  v6 = a3->var12
     + std::normal_distribution<double>::operator()<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>((uint64_t)v9, &self->generator.__x_, v9)* 0.0174532925+ self->currentRollOffsetValue;
  v7 = fmod(v6, 6.28318531);
  if (v6 <= 6.28318531 && v6 >= 0.0)
    v7 = v6;
  if (v7 < 0.0)
    v7 = v7 + 6.28318531;
  if (v7 == 0.0)
    v7 = 0.0;
  a3->var12 = v7;
LABEL_14:
  memmove(&self->super._filteredPoint, a3, 0x80uLL);
}

@end
