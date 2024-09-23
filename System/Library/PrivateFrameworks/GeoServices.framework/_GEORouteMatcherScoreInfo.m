@implementation _GEORouteMatcherScoreInfo

+ (double)infoWithScore:(double)a1 weight:(double)a2
{
  double *v4;

  objc_opt_self();
  v4 = (double *)objc_opt_new();
  v4[1] = a1;
  v4[2] = a2;
  return v4;
}

+ (id)ignored
{
  objc_opt_self();
  if (qword_1ECDBC768 != -1)
    dispatch_once(&qword_1ECDBC768, &__block_literal_global_164);
  return (id)_MergedGlobals_302;
}

+ (id)doNotMatchToThisSegment
{
  objc_opt_self();
  if (qword_1ECDBC778 != -1)
    dispatch_once(&qword_1ECDBC778, &__block_literal_global_16);
  return (id)qword_1ECDBC770;
}

- (id)debugDescription
{
  double rawScore;
  double weight;
  double v4;

  if (self)
  {
    rawScore = self->_rawScore;
    weight = self->_weight;
    v4 = rawScore * weight;
  }
  else
  {
    rawScore = MEMORY[8];
    weight = MEMORY[0x10];
    v4 = 0.0;
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Score: %0.2f | Raw: %0.2f | Weight: %0.2f"), *(_QWORD *)&v4, *(_QWORD *)&rawScore, *(_QWORD *)&weight);
}

@end
