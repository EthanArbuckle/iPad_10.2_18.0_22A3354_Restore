@implementation VNDataDetectorResult

- (VNDataDetectorResult)initWithDDScannerResult:(id)a3 observation:(id)a4
{
  id v7;
  id v8;
  VNDataDetectorResult *v9;
  VNDataDetectorResult *v10;
  uint64_t v11;
  NSString *shortDescription;
  uint64_t v13;
  NSString *value;
  unsigned int v15;
  unint64_t v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)VNDataDetectorResult;
  v9 = -[VNDataDetectorResult init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_scannerResult, a3);
    objc_storeStrong((id *)&v10->_originalObservation, a4);
    objc_msgSend(v7, "matchedString");
    v11 = objc_claimAutoreleasedReturnValue();
    shortDescription = v10->_shortDescription;
    v10->_shortDescription = (NSString *)v11;

    objc_msgSend(v7, "value");
    v13 = objc_claimAutoreleasedReturnValue();
    value = v10->_value;
    v10->_value = (NSString *)v13;

    v15 = objc_msgSend(v7, "category") - 1;
    if (v15 > 3)
      v16 = 0;
    else
      v16 = qword_1A15F9638[v15];
    v10->_type = v16;
  }

  return v10;
}

- (VNDataDetectorResult)initWithBCSDetectedCode:(id)a3 description:(id)a4 observation:(id)a5
{
  id v9;
  id v10;
  id v11;
  VNDataDetectorResult *v12;
  VNDataDetectorResult *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VNDataDetectorResult;
  v12 = -[VNDataDetectorResult init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_detectedBarcodeSupportCode, a3);
    objc_storeStrong((id *)&v13->_originalObservation, a5);
    objc_storeStrong((id *)&v13->_shortDescription, a4);
  }

  return v13;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNDataDetectorResult;
  -[VNDataDetectorResult debugDescription](&v7, sel_debugDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNDataDetectorResult shortDescription](self, "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" shortDescription=\"%@\", type=%ld"), v4, -[VNDataDetectorResult type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (DDScannerResult)scannerResult
{
  return self->_scannerResult;
}

- (void)setScannerResult:(id)a3
{
  objc_storeStrong((id *)&self->_scannerResult, a3);
}

- (NSString)shortDescription
{
  return self->_shortDescription;
}

- (void)setShortDescription:(id)a3
{
  objc_storeStrong((id *)&self->_shortDescription, a3);
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (VNObservation)originalObservation
{
  return self->_originalObservation;
}

- (void)setOriginalObservation:(id)a3
{
  objc_storeStrong((id *)&self->_originalObservation, a3);
}

- (BCSDetectedCode)detectedBarcodeSupportCode
{
  return self->_detectedBarcodeSupportCode;
}

- (void)setDetectedBarcodeSupportCode:(id)a3
{
  objc_storeStrong((id *)&self->_detectedBarcodeSupportCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedBarcodeSupportCode, 0);
  objc_storeStrong((id *)&self->_originalObservation, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_shortDescription, 0);
  objc_storeStrong((id *)&self->_scannerResult, 0);
}

@end
