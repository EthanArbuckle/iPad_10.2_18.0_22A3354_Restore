@implementation HKContactsPrescription

+ (HKContactsPrescription)prescriptionWithRightEyeSpecification:(HKContactsLensSpecification *)rightEyeSpecification leftEyeSpecification:(HKContactsLensSpecification *)leftEyeSpecification brand:(NSString *)brand dateIssued:(NSDate *)dateIssued expirationDate:(NSDate *)expirationDate device:(HKDevice *)device metadata:(NSDictionary *)metadata
{
  HKContactsLensSpecification *v14;
  HKContactsLensSpecification *v15;
  NSString *v16;
  NSDate *v17;
  NSDictionary *v18;
  HKDevice *v19;
  NSDate *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  NSString *v26;
  HKContactsLensSpecification *v27;
  HKContactsLensSpecification *v28;
  id v29;
  objc_super v32;
  _QWORD v33[4];
  HKContactsLensSpecification *v34;
  HKContactsLensSpecification *v35;
  NSString *v36;

  v14 = rightEyeSpecification;
  v15 = leftEyeSpecification;
  v16 = brand;
  v17 = expirationDate;
  v18 = metadata;
  v19 = device;
  v20 = dateIssued;
  +[HKObjectType visionPrescriptionType](HKObjectType, "visionPrescriptionType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceReferenceDate](v20, "timeIntervalSinceReferenceDate");
  v23 = v22;

  if (v17)
  {
    -[NSDate timeIntervalSinceReferenceDate](v17, "timeIntervalSinceReferenceDate");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v20 = (NSDate *)objc_claimAutoreleasedReturnValue();
    -[NSDate timeIntervalSinceReferenceDate](v20, "timeIntervalSinceReferenceDate");
  }
  v25 = v24;
  v33[1] = 3221225472;
  v33[2] = __133__HKContactsPrescription_prescriptionWithRightEyeSpecification_leftEyeSpecification_brand_dateIssued_expirationDate_device_metadata___block_invoke;
  v33[3] = &unk_1E37F09B0;
  v34 = v14;
  v35 = v15;
  v36 = v16;
  v32.receiver = a1;
  v32.super_class = (Class)&OBJC_METACLASS___HKContactsPrescription;
  v33[0] = MEMORY[0x1E0C809B0];
  v26 = v16;
  v27 = v15;
  v28 = v14;
  v29 = objc_msgSendSuper2(&v32, sel__newSampleWithType_startDate_endDate_device_metadata_config_, v21, v19, v18, v33, v23, v25);

  if (!v17)
  return (HKContactsPrescription *)v29;
}

void __133__HKContactsPrescription_prescriptionWithRightEyeSpecification_leftEyeSpecification_brand_dateIssued_expirationDate_device_metadata___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;

  v3 = *(void **)(a1 + 32);
  v10 = a2;
  v4 = objc_msgSend(v3, "copy");
  v5 = (void *)v10[21];
  v10[21] = v4;

  v6 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v7 = (void *)v10[22];
  v10[22] = v6;

  v8 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v9 = (void *)v10[23];
  v10[23] = v8;

  objc_msgSend(v10, "_setPrescriptionType:", 2);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p Left=%@, Right=%@, Brand=%@>"), v5, self, self->_leftEye, self->_rightEye, self->_brand);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_setRightEyeSpecification:(id)a3
{
  HKContactsLensSpecification *v4;
  HKContactsLensSpecification *rightEye;

  v4 = (HKContactsLensSpecification *)objc_msgSend(a3, "copy");
  rightEye = self->_rightEye;
  self->_rightEye = v4;

}

- (void)_setLeftEyeSpecification:(id)a3
{
  HKContactsLensSpecification *v4;
  HKContactsLensSpecification *leftEye;

  v4 = (HKContactsLensSpecification *)objc_msgSend(a3, "copy");
  leftEye = self->_leftEye;
  self->_leftEye = v4;

}

- (void)_setBrand:(id)a3
{
  NSString *v4;
  NSString *brand;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  brand = self->_brand;
  self->_brand = v4;

}

- (id)leftSphere
{
  void *v2;
  void *v3;

  -[HKContactsPrescription leftEye](self, "leftEye");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sphere");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)rightSphere
{
  void *v2;
  void *v3;

  -[HKContactsPrescription rightEye](self, "rightEye");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sphere");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)leftCylinder
{
  void *v2;
  void *v3;

  -[HKContactsPrescription leftEye](self, "leftEye");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cylinder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)rightCylinder
{
  void *v2;
  void *v3;

  -[HKContactsPrescription rightEye](self, "rightEye");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cylinder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)leftAxis
{
  void *v2;
  void *v3;

  -[HKContactsPrescription leftEye](self, "leftEye");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axis");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)rightAxis
{
  void *v2;
  void *v3;

  -[HKContactsPrescription rightEye](self, "rightEye");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axis");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)leftAddPower
{
  void *v2;
  void *v3;

  -[HKContactsPrescription leftEye](self, "leftEye");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addPower");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)rightAddPower
{
  void *v2;
  void *v3;

  -[HKContactsPrescription rightEye](self, "rightEye");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addPower");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  v5.super_class = (Class)HKContactsPrescription;
  v4 = a3;
  -[HKVisionPrescription encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_leftEye, CFSTR("LeftEye"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_rightEye, CFSTR("RightEye"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_brand, CFSTR("Brand"));

}

- (HKContactsPrescription)initWithCoder:(id)a3
{
  id v4;
  HKContactsPrescription *v5;
  uint64_t v6;
  HKContactsLensSpecification *leftEye;
  uint64_t v8;
  HKContactsLensSpecification *rightEye;
  uint64_t v10;
  NSString *brand;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKContactsPrescription;
  v5 = -[HKVisionPrescription initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LeftEye"));
    v6 = objc_claimAutoreleasedReturnValue();
    leftEye = v5->_leftEye;
    v5->_leftEye = (HKContactsLensSpecification *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RightEye"));
    v8 = objc_claimAutoreleasedReturnValue();
    rightEye = v5->_rightEye;
    v5->_rightEye = (HKContactsLensSpecification *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Brand"));
    v10 = objc_claimAutoreleasedReturnValue();
    brand = v5->_brand;
    v5->_brand = (NSString *)v10;

  }
  return v5;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  id v4;
  BOOL v5;
  void *v6;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKContactsPrescription;
  -[HKVisionPrescription _validateWithConfiguration:](&v9, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4
    || (v8 = 0,
        v5 = -[HKContactsPrescription _validateContactsFieldsWithError:](self, "_validateContactsFieldsWithError:", &v8),
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

- (BOOL)_validateContactsFieldsWithError:(id *)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  id v17;

  -[HKContactsPrescription leftSphere](self, "leftSphere");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[HKContactsPrescription rightSphere](self, "rightSphere");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_4;
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Requires atleast one sphere value for left or right eye"));
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v17;
    v16 = v17 == 0;
    if (v17)
    {
      if (a3)
      {
        v11 = objc_retainAutorelease(v17);
        v16 = 0;
        *a3 = v11;
        v9 = v11;
LABEL_22:

        goto LABEL_23;
      }
      _HKLogDroppedError(v17);
      v16 = 0;
    }
    v9 = v11;
    goto LABEL_22;
  }

LABEL_4:
  -[HKContactsPrescription leftEye](self, "leftEye");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "baseCurve");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 || objc_msgSend((id)objc_opt_class(), "_validateBaseCurve:error:", v9, a3))
  {
    -[HKContactsPrescription rightEye](self, "rightEye");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "baseCurve");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11 && !objc_msgSend((id)objc_opt_class(), "_validateBaseCurve:error:", v11, a3))
    {
      v16 = 0;
    }
    else
    {
      -[HKContactsPrescription leftEye](self, "leftEye");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "diameter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 && !objc_msgSend((id)objc_opt_class(), "_validateDiameter:error:", v13, a3))
      {
        v16 = 0;
      }
      else
      {
        -[HKContactsPrescription rightEye](self, "rightEye");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "diameter");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = !v15 || objc_msgSend((id)objc_opt_class(), "_validateDiameter:error:", v15, a3);
      }

    }
    goto LABEL_22;
  }
  v16 = 0;
LABEL_23:

  return v16;
}

+ (BOOL)_validateBaseCurve:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  BOOL v9;
  id v10;
  void *v11;

  v6 = a3;
  +[HKUnit meterUnit](HKUnit, "meterUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isCompatibleWithUnit:", v7);

  if ((v8 & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("baseCurve"), objc_opt_class(), a2, CFSTR("Base curve must be a meter quantity"));
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

+ (BOOL)_validateDiameter:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  BOOL v9;
  id v10;
  void *v11;

  v6 = a3;
  +[HKUnit meterUnit](HKUnit, "meterUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isCompatibleWithUnit:", v7);

  if ((v8 & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("diameter"), objc_opt_class(), a2, CFSTR("Diameter must be a meter quantity"));
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

- (HKContactsLensSpecification)rightEye
{
  return self->_rightEye;
}

- (HKContactsLensSpecification)leftEye
{
  return self->_leftEye;
}

- (NSString)brand
{
  return self->_brand;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brand, 0);
  objc_storeStrong((id *)&self->_leftEye, 0);
  objc_storeStrong((id *)&self->_rightEye, 0);
}

@end
