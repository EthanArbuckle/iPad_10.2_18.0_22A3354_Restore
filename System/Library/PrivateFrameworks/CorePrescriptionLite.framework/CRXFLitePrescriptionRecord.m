@implementation CRXFLitePrescriptionRecord

- (CRXFLitePrescriptionRecord)initWithACCPayload:(id)a3 enrollmentName:(id)a4 enrollmentDate:(id)a5 leftEyeRX:(id)a6 rightEyeRX:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  CRXFLitePrescriptionRecord *v18;
  CRXFLitePrescriptionRecord *v19;
  NSDate *v20;
  NSDate *enrollmentDate;
  objc_super v23;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CRXFLitePrescriptionRecord;
  v18 = -[CRXFLitePrescriptionRecord init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_accPayload, a3);
    objc_storeStrong((id *)&v19->_enrollmentName, a4);
    if (v15)
    {
      v20 = (NSDate *)v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v20 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    enrollmentDate = v19->_enrollmentDate;
    v19->_enrollmentDate = v20;

    objc_storeStrong((id *)&v19->_leftEyeRX, a6);
    objc_storeStrong((id *)&v19->_rightEyeRX, a7);
  }

  return v19;
}

- (void)addLeftCalibrationData:(id)a3 rightCalibrationData:(id)a4
{
  NSString *v6;
  NSString *v7;
  NSString *leftCalibrationData;
  NSString *rightCalibrationData;
  NSString *v10;

  v6 = (NSString *)a3;
  v7 = (NSString *)a4;
  leftCalibrationData = self->_leftCalibrationData;
  self->_leftCalibrationData = v6;
  v10 = v6;

  rightCalibrationData = self->_rightCalibrationData;
  self->_rightCalibrationData = v7;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRXFLitePrescriptionRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CRXFLitePrescriptionRecord *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("acc"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ek"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ed"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lc"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rc"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lrx"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rrx"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[CRXFLitePrescriptionRecord initWithACCPayload:enrollmentName:enrollmentDate:leftEyeRX:rightEyeRX:](self, "initWithACCPayload:enrollmentName:enrollmentDate:leftEyeRX:rightEyeRX:", v5, v6, v7, v10, v11);
    -[CRXFLitePrescriptionRecord addLeftCalibrationData:rightCalibrationData:](self, "addLeftCalibrationData:rightCalibrationData:", v8, v9);
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[CRXFLitePrescriptionRecord accPayload](self, "accPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("acc"));

  -[CRXFLitePrescriptionRecord enrollmentName](self, "enrollmentName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("ek"));

  -[CRXFLitePrescriptionRecord enrollmentDate](self, "enrollmentDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("ed"));

  -[CRXFLitePrescriptionRecord leftCalibrationData](self, "leftCalibrationData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("lc"));

  -[CRXFLitePrescriptionRecord rightCalibrationData](self, "rightCalibrationData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("rc"));

  -[CRXFLitePrescriptionRecord leftEyeRX](self, "leftEyeRX");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("lrx"));

  -[CRXFLitePrescriptionRecord rightEyeRX](self, "rightEyeRX");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("rrx"));

}

- (NSData)accPayload
{
  return self->_accPayload;
}

- (NSString)enrollmentName
{
  return self->_enrollmentName;
}

- (NSDate)enrollmentDate
{
  return self->_enrollmentDate;
}

- (NSString)leftCalibrationData
{
  return self->_leftCalibrationData;
}

- (NSString)rightCalibrationData
{
  return self->_rightCalibrationData;
}

- (CRXFLiteRXValues)leftEyeRX
{
  return self->_leftEyeRX;
}

- (CRXFLiteRXValues)rightEyeRX
{
  return self->_rightEyeRX;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightEyeRX, 0);
  objc_storeStrong((id *)&self->_leftEyeRX, 0);
  objc_storeStrong((id *)&self->_rightCalibrationData, 0);
  objc_storeStrong((id *)&self->_leftCalibrationData, 0);
  objc_storeStrong((id *)&self->_enrollmentDate, 0);
  objc_storeStrong((id *)&self->_enrollmentName, 0);
  objc_storeStrong((id *)&self->_accPayload, 0);
}

@end
