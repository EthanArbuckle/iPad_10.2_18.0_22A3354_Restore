@implementation ENExposureSummaryItem

- (ENExposureSummaryItem)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  ENExposureSummaryItem *v7;
  ENExposureSummaryItem *v8;

  v6 = a3;
  v7 = -[ENExposureSummaryItem init](self, "init");
  if (!v7)
  {
    if (a4)
      goto LABEL_11;
    goto LABEL_12;
  }
  if (MEMORY[0x20BD2F7B8](v6) != MEMORY[0x24BDACFA0])
  {
    if (a4)
    {
LABEL_11:
      ENErrorF(2);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_12:
    v8 = 0;
    goto LABEL_7;
  }
  if (!CUXPCDecodeDouble() || !CUXPCDecodeDouble() || !CUXPCDecodeDouble())
    goto LABEL_12;
  v8 = v7;
LABEL_7:

  return v8;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  double maximumScore;
  double scoreSum;
  double weightedDurationSum;
  xpc_object_t xdict;

  v4 = a3;
  maximumScore = self->_maximumScore;
  xdict = v4;
  if (maximumScore != 0.0)
  {
    xpc_dictionary_set_double(v4, "mxSc", maximumScore);
    v4 = xdict;
  }
  scoreSum = self->_scoreSum;
  if (scoreSum != 0.0)
  {
    xpc_dictionary_set_double(xdict, "scoreSum", scoreSum);
    v4 = xdict;
  }
  weightedDurationSum = self->_weightedDurationSum;
  if (weightedDurationSum != 0.0)
  {
    xpc_dictionary_set_double(xdict, "wds", weightedDurationSum);
    v4 = xdict;
  }

}

- (id)description
{
  return (id)NSPrintF();
}

- (void)roundDurations
{
  float64x2_t v2;

  v2 = (float64x2_t)vdupq_n_s64(0x404E000000000000uLL);
  *(float64x2_t *)&self->_maximumScore = vmulq_f64(vrndpq_f64(vdivq_f64(*(float64x2_t *)&self->_maximumScore, v2)), v2);
  self->_weightedDurationSum = ceil(self->_weightedDurationSum / 60.0) * 60.0;
}

- (double)maximumScore
{
  return self->_maximumScore;
}

- (void)setMaximumScore:(double)a3
{
  self->_maximumScore = a3;
}

- (double)scoreSum
{
  return self->_scoreSum;
}

- (void)setScoreSum:(double)a3
{
  self->_scoreSum = a3;
}

- (NSTimeInterval)weightedDurationSum
{
  return self->_weightedDurationSum;
}

- (void)setWeightedDurationSum:(double)a3
{
  self->_weightedDurationSum = a3;
}

@end
