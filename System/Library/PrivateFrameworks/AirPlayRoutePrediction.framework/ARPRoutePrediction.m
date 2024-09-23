@implementation ARPRoutePrediction

- (ARPRoutePrediction)initWithOutputDeviceID:(id)a3 confidence:(double)a4
{
  id v6;
  ARPRoutePrediction *v7;
  uint64_t v8;
  NSString *outputDeviceID;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ARPRoutePrediction;
  v7 = -[ARPRoutePrediction init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    outputDeviceID = v7->_outputDeviceID;
    v7->_outputDeviceID = (NSString *)v8;

    v7->_confidence = a4;
  }

  return v7;
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
  -[ARPRoutePrediction outputDeviceID](self, "outputDeviceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[ARPRoutePrediction confidence](self, "confidence");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> outputDeviceID: %@, confidence: %@"), v4, self, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)outputDeviceID
{
  return self->_outputDeviceID;
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDeviceID, 0);
}

@end
