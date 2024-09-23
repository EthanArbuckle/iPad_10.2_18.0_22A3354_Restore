@implementation CRXFCalibrationData

- (CRXFCalibrationData)initWithACCPayload:(id)a3 leftCalibrationData:(id)a4 rightCalibrationData:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRXFCalibrationData *v12;
  CRXFCalibrationData *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CRXFCalibrationData;
  v12 = -[CRXFCalibrationData init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accPayload, a3);
    objc_storeStrong((id *)&v13->_leftCalibrationData, a4);
    objc_storeStrong((id *)&v13->_rightCalibrationData, a5);
  }

  return v13;
}

- (NSData)accPayload
{
  return self->_accPayload;
}

- (NSString)leftCalibrationData
{
  return self->_leftCalibrationData;
}

- (NSString)rightCalibrationData
{
  return self->_rightCalibrationData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightCalibrationData, 0);
  objc_storeStrong((id *)&self->_leftCalibrationData, 0);
  objc_storeStrong((id *)&self->_accPayload, 0);
}

@end
