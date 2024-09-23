@implementation SGModelSampler

- (SGModelSampler)initWithPositiveRate:(double)a3 dynamicLabelRate:(double)a4 negativeRate:(double)a5 rng:(id)a6
{
  id v11;
  SGModelSampler *v12;
  SGModelSampler *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)SGModelSampler;
  v12 = -[SGModelSampler init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_positiveRate = a3;
    v12->_dynamicLabelRate = a4;
    v12->_negativeRate = a5;
    objc_storeStrong((id *)&v12->_rng, a6);
  }

  return v13;
}

- (BOOL)shouldSampleForLabel:(id)a3 isDynamicLabel:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  uint64_t v7;
  double v8;
  _PASRng *rng;
  BOOL v10;
  float v11;
  BOOL result;

  v4 = a4;
  v6 = objc_msgSend(a3, "unsignedIntegerValue");
  v7 = 8;
  if (v4)
    v7 = 16;
  if (!v6)
    v7 = 24;
  v8 = *(double *)((char *)&self->super.isa + v7);
  rng = self->_rng;
  if (rng)
    v10 = v8 == 1.0;
  else
    v10 = 1;
  result = 1;
  if (!v10)
  {
    -[_PASRng nextFloat](rng, "nextFloat");
    if (v8 <= v11)
      return 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rng, 0);
}

@end
