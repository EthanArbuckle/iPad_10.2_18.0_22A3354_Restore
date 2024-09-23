@implementation ARPPredictionContext

- (ARPPredictionContext)initWithPredictionDate:(id)a3 microLocationEventDate:(id)a4 microLocationProbabilityVector:(id)a5
{
  id v8;
  id v9;
  id v10;
  ARPPredictionContext *v11;
  uint64_t v12;
  NSDate *predictionDate;
  uint64_t v14;
  NSDate *microLocationEventDate;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ARPPredictionContext;
  v11 = -[ARPPredictionContext init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    predictionDate = v11->_predictionDate;
    v11->_predictionDate = (NSDate *)v12;

    v14 = objc_msgSend(v9, "copy");
    microLocationEventDate = v11->_microLocationEventDate;
    v11->_microLocationEventDate = (NSDate *)v14;

    objc_storeStrong((id *)&v11->_microLocationProbabilityVector, a5);
  }

  return v11;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[ARPPredictionContext predictionDate](self, "predictionDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPPredictionContext microLocationEventDate](self, "microLocationEventDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPPredictionContext microLocationProbabilityVector](self, "microLocationProbabilityVector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> predictionDate: %@, microLocationEventDate: %@, microLocationProbabilityVector: %@"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDate)microLocationEventDate
{
  return self->_microLocationEventDate;
}

- (NSDate)predictionDate
{
  return self->_predictionDate;
}

- (NSDictionary)microLocationProbabilityVector
{
  return self->_microLocationProbabilityVector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_microLocationProbabilityVector, 0);
  objc_storeStrong((id *)&self->_predictionDate, 0);
  objc_storeStrong((id *)&self->_microLocationEventDate, 0);
}

@end
