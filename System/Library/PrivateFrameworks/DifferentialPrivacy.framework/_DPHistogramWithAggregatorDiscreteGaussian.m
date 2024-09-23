@implementation _DPHistogramWithAggregatorDiscreteGaussian

- (_DPHistogramWithAggregatorDiscreteGaussian)initWithSigma:(double)a3 rappor:(id)a4 error:(id *)a5
{
  id v9;
  _BOOL4 v10;
  _BOOL4 v11;
  int v12;
  void *v13;
  NSObject *v14;
  _DPHistogramWithAggregatorDiscreteGaussian *v15;
  _DPHistogramWithAggregatorDiscreteGaussian *v16;
  _DPHistogramWithAggregatorDiscreteGaussian *v17;
  objc_super v19;

  v9 = a4;
  v10 = (*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 1 < 0xFFFFFFFFFFFFFLL;
  v11 = ((*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF;
  if (a3 >= 0.0)
  {
    v11 = 0;
    v10 = 0;
  }
  if ((*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFLL) == 0)
    v10 = 1;
  v12 = (*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFLL) == 0x7FF0000000000000 || v10;
  if ((v12 | v11) == 1)
  {
    _DPPrivacyBudgetError(1, CFSTR("Gaussian sigma must be finite, not NAN, and greater than 0.0."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DPLog framework](_DPLog, "framework");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[_DPDediscoError logAndStoreInError:].cold.1((uint64_t)v13, v14);

    if (a5)
      *a5 = objc_retainAutorelease(v13);

    v15 = 0;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)_DPHistogramWithAggregatorDiscreteGaussian;
    v16 = -[_DPHistogramWithAggregatorDiscreteGaussian init](&v19, sel_init);
    v17 = v16;
    if (v16)
    {
      v16->_sigma = a3;
      objc_storeStrong((id *)&v16->_rappor, a4);
      v17->_squaredL2Sensitivity = 2.0;
    }
    self = v17;
    v15 = self;
  }

  return v15;
}

- (id)exceedApproximateDPBudget:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[_DPHistogramWithAggregatorDiscreteGaussian zeroConcentratedDPWithError:](self, "zeroConcentratedDPWithError:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "epsilon");
    objc_msgSend(v7, "approximateDPForEpsilon:error:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "exceed:", v6));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)zeroConcentratedDPWithError:(id *)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[_DPHistogramWithAggregatorDiscreteGaussian squaredL2Sensitivity](self, "squaredL2Sensitivity");
  v6 = v5;
  -[_DPHistogramWithAggregatorDiscreteGaussian sigma](self, "sigma");
  v8 = v6 / v7;
  -[_DPHistogramWithAggregatorDiscreteGaussian sigma](self, "sigma");
  return -[_DPZeroConcentratedDP initWithRho:error:]([_DPZeroConcentratedDP alloc], "initWithRho:error:", a3, v8 / v9 * 0.5);
}

- (double)sigma
{
  return self->_sigma;
}

- (_DPSymmetricRAPPORWithOHE)rappor
{
  return self->_rappor;
}

- (double)squaredL2Sensitivity
{
  return self->_squaredL2Sensitivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rappor, 0);
}

@end
