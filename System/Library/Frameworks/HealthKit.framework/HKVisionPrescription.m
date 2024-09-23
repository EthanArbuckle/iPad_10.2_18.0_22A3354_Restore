@implementation HKVisionPrescription

+ (HKVisionPrescription)prescriptionWithType:(HKVisionPrescriptionType)type dateIssued:(NSDate *)dateIssued expirationDate:(NSDate *)expirationDate device:(HKDevice *)device metadata:(NSDictionary *)metadata
{
  NSDate *v12;
  NSDictionary *v13;
  HKDevice *v14;
  NSDate *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  _QWORD v22[5];

  v12 = expirationDate;
  v13 = metadata;
  v14 = device;
  v15 = dateIssued;
  +[HKObjectType visionPrescriptionType](HKObjectType, "visionPrescriptionType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceReferenceDate](v15, "timeIntervalSinceReferenceDate");
  v18 = v17;

  if (v12)
  {
    -[NSDate timeIntervalSinceReferenceDate](v12, "timeIntervalSinceReferenceDate");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
    -[NSDate timeIntervalSinceReferenceDate](v15, "timeIntervalSinceReferenceDate");
  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __87__HKVisionPrescription_prescriptionWithType_dateIssued_expirationDate_device_metadata___block_invoke;
  v22[3] = &__block_descriptor_40_e30_v16__0__HKVisionPrescription_8l;
  v22[4] = type;
  v20 = (void *)objc_msgSend(a1, "_newSampleWithType:startDate:endDate:device:metadata:config:", v16, v14, v13, v22, v18, v19);

  if (!v12)
  return (HKVisionPrescription *)v20;
}

uint64_t __87__HKVisionPrescription_prescriptionWithType_dateIssued_expirationDate_device_metadata___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(a2 + 96) = *(_QWORD *)(result + 32);
  return result;
}

- (NSDate)expirationDate
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;

  -[HKSample endDate](self, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = v7;

  if (v5 >= v8)
  {
    v9 = 0;
  }
  else
  {
    -[HKSample endDate](self, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t prescriptionType;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  prescriptionType = self->_prescriptionType;
  -[HKVisionPrescription dateIssued](self, "dateIssued");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKVisionPrescription expirationDate](self, "expirationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p PrescriptionType=%lu, dateIssued=%@, expirationDate=%@>"), v5, self, prescriptionType, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_setPrescriptionType:(unint64_t)a3
{
  self->_prescriptionType = a3;
}

- (BOOL)_validateForSavingWithClientEntitlements:(id)a3 applicationSDKVersionToken:(unint64_t)a4 isAppleWatch:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  objc_super v11;

  v7 = a5;
  v11.receiver = self;
  v11.super_class = (Class)HKVisionPrescription;
  v8 = -[HKObject _validateForSavingWithClientEntitlements:applicationSDKVersionToken:isAppleWatch:error:](&v11, sel__validateForSavingWithClientEntitlements_applicationSDKVersionToken_isAppleWatch_error_, a3, a4);
  if (v8 && v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a6, 2, CFSTR("Unable to save vision samples on this device"));
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKVisionPrescription;
  result = -[HKObject copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 12) = self->_prescriptionType;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKVisionPrescription;
  v4 = a3;
  -[HKSample encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_prescriptionType, CFSTR("PrescriptionType"), v5.receiver, v5.super_class);

}

- (HKVisionPrescription)initWithCoder:(id)a3
{
  id v4;
  HKVisionPrescription *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKVisionPrescription;
  v5 = -[HKSample initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_prescriptionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PrescriptionType"));

  return v5;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  id v4;
  BOOL v5;
  void *v6;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKVisionPrescription;
  -[HKSample _validateWithConfiguration:](&v9, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4
    || (v8 = 0,
        v5 = -[HKVisionPrescription _validateCommonFieldsWithError:](self, "_validateCommonFieldsWithError:", &v8),
        v4 = v8,
        !v5))
  {
    v4 = v4;
    v6 = v4;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_validateCommonFieldsWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;

  -[HKVisionPrescription leftSphere](self, "leftSphere");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && !objc_msgSend((id)objc_opt_class(), "_validateSphere:error:", v5, a3))
  {
    v13 = 0;
  }
  else
  {
    -[HKVisionPrescription rightSphere](self, "rightSphere");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && !objc_msgSend((id)objc_opt_class(), "_validateSphere:error:", v6, a3))
    {
      v13 = 0;
    }
    else
    {
      -[HKVisionPrescription leftCylinder](self, "leftCylinder");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 && !objc_msgSend((id)objc_opt_class(), "_validateCylinder:error:", v7, a3))
      {
        v13 = 0;
      }
      else
      {
        -[HKVisionPrescription rightCylinder](self, "rightCylinder");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 && !objc_msgSend((id)objc_opt_class(), "_validateCylinder:error:", v8, a3))
        {
          v13 = 0;
        }
        else
        {
          -[HKVisionPrescription leftAxis](self, "leftAxis");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9 && !objc_msgSend((id)objc_opt_class(), "_validateAxis:error:", v9, a3))
          {
            v13 = 0;
          }
          else
          {
            -[HKVisionPrescription rightAxis](self, "rightAxis");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (v10 && !objc_msgSend((id)objc_opt_class(), "_validateAxis:error:", v10, a3))
            {
              v13 = 0;
            }
            else
            {
              -[HKVisionPrescription leftAddPower](self, "leftAddPower");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              if (v11 && !objc_msgSend((id)objc_opt_class(), "_validateAddPower:error:", v11, a3))
              {
                v13 = 0;
              }
              else
              {
                -[HKVisionPrescription rightAddPower](self, "rightAddPower");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = !v12 || objc_msgSend((id)objc_opt_class(), "_validateAddPower:error:", v12, a3);

              }
            }

          }
        }

      }
    }

  }
  return v13;
}

+ (BOOL)_validateSphere:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  BOOL v9;
  id v10;
  void *v11;

  v6 = a3;
  +[HKUnit diopterUnit](HKUnit, "diopterUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isCompatibleWithUnit:", v7);

  if ((v8 & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("sphere"), objc_opt_class(), a2, CFSTR("Sphere must be a Diopter quantity"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v9 = v10 == 0;
  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    else
      _HKLogDroppedError(v10);
  }

  return v9;
}

+ (BOOL)_validateCylinder:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  BOOL v9;
  id v10;
  void *v11;

  v6 = a3;
  +[HKUnit diopterUnit](HKUnit, "diopterUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isCompatibleWithUnit:", v7);

  if ((v8 & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("cylinder"), objc_opt_class(), a2, CFSTR("Cylinder must be an Diopter quantity"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v9 = v10 == 0;
  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    else
      _HKLogDroppedError(v10);
  }

  return v9;
}

+ (BOOL)_validateAxis:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  BOOL v9;
  id v10;
  void *v11;

  v6 = a3;
  +[HKUnit degreeAngleUnit](HKUnit, "degreeAngleUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isCompatibleWithUnit:", v7);

  if ((v8 & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("axis"), objc_opt_class(), a2, CFSTR("Axis must be an Angle quantity"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v9 = v10 == 0;
  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    else
      _HKLogDroppedError(v10);
  }

  return v9;
}

+ (BOOL)_validateAddPower:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  BOOL v9;
  id v10;
  void *v11;

  v6 = a3;
  +[HKUnit diopterUnit](HKUnit, "diopterUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isCompatibleWithUnit:", v7);

  if ((v8 & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("addPower"), objc_opt_class(), a2, CFSTR("Add power must be a Diopter quantity"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v9 = v10 == 0;
  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    else
      _HKLogDroppedError(v10);
  }

  return v9;
}

- (HKVisionPrescriptionType)prescriptionType
{
  return self->_prescriptionType;
}

- (HKQuantity)leftSphere
{
  return self->_leftSphere;
}

- (HKQuantity)rightSphere
{
  return self->_rightSphere;
}

- (HKQuantity)leftCylinder
{
  return self->_leftCylinder;
}

- (HKQuantity)rightCylinder
{
  return self->_rightCylinder;
}

- (HKQuantity)leftAxis
{
  return self->_leftAxis;
}

- (HKQuantity)rightAxis
{
  return self->_rightAxis;
}

- (HKQuantity)leftAddPower
{
  return self->_leftAddPower;
}

- (HKQuantity)rightAddPower
{
  return self->_rightAddPower;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightAddPower, 0);
  objc_storeStrong((id *)&self->_leftAddPower, 0);
  objc_storeStrong((id *)&self->_rightAxis, 0);
  objc_storeStrong((id *)&self->_leftAxis, 0);
  objc_storeStrong((id *)&self->_rightCylinder, 0);
  objc_storeStrong((id *)&self->_leftCylinder, 0);
  objc_storeStrong((id *)&self->_rightSphere, 0);
  objc_storeStrong((id *)&self->_leftSphere, 0);
}

@end
