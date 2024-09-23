@implementation AXSDDetectionResult

- (AXSDDetectionResult)initWithTimeStamp:(id)a3 identifier:(id)a4 confidence:(double)a5
{
  id v9;
  id v10;
  AXSDDetectionResult *v11;
  AXSDDetectionResult *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AXSDDetectionResult;
  v11 = -[AXSDDetectionResult init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_timestamp, a3);
    objc_storeStrong((id *)&v12->_identifier, a4);
    v12->_confidence = a5;
  }

  return v12;
}

- (AXSDDetectionResult)initWithResult:(id)a3
{
  id v4;
  AXSDDetectionResult *v5;
  AXSDTimeStamp *v6;
  AXSDTimeStamp *timestamp;
  AXSDTimeStamp *v8;
  uint64_t v9;
  NSString *identifier;
  double v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AXSDDetectionResult;
  v5 = -[AXSDDetectionResult init](&v13, sel_init);
  if (v5)
  {
    v6 = -[AXSDTimeStamp initWithResult:]([AXSDTimeStamp alloc], "initWithResult:", v4);
    timestamp = v5->_timestamp;
    v5->_timestamp = v6;
    v8 = v6;

    objc_msgSend(v4, "identifier");
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v9;

    objc_msgSend(v4, "confidence");
    v5->_confidence = v11;
  }

  return v5;
}

- (AXSDTimeStamp)timestamp
{
  return self->_timestamp;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)confidence
{
  return self->_confidence;
}

- (NSString)debug
{
  void *v3;
  NSString *identifier;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  identifier = self->_identifier;
  -[AXSDTimeStamp time](self->_timestamp, "time");
  v6 = v5;
  -[AXSDTimeStamp duration](self->_timestamp, "duration");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("Result Identifier: %@, Time Stamp: %f, Duration: %f, Confidence: %f"), identifier, v6, v7, *(_QWORD *)&self->_confidence);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
