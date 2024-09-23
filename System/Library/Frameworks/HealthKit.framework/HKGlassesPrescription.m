@implementation HKGlassesPrescription

+ (HKGlassesPrescription)prescriptionWithRightEyeSpecification:(HKGlassesLensSpecification *)rightEyeSpecification leftEyeSpecification:(HKGlassesLensSpecification *)leftEyeSpecification dateIssued:(NSDate *)dateIssued expirationDate:(NSDate *)expirationDate device:(HKDevice *)device metadata:(NSDictionary *)metadata
{
  HKGlassesLensSpecification *v14;
  HKGlassesLensSpecification *v15;
  NSDate *v16;
  NSDictionary *v17;
  HKDevice *v18;
  NSDate *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  HKGlassesLensSpecification *v25;
  HKGlassesLensSpecification *v26;
  id v27;
  objc_super v29;
  _QWORD v30[4];
  HKGlassesLensSpecification *v31;
  HKGlassesLensSpecification *v32;

  v14 = rightEyeSpecification;
  v15 = leftEyeSpecification;
  v16 = expirationDate;
  v17 = metadata;
  v18 = device;
  v19 = dateIssued;
  +[HKObjectType visionPrescriptionType](HKObjectType, "visionPrescriptionType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceReferenceDate](v19, "timeIntervalSinceReferenceDate");
  v22 = v21;

  if (v16)
  {
    -[NSDate timeIntervalSinceReferenceDate](v16, "timeIntervalSinceReferenceDate");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v19 = (NSDate *)objc_claimAutoreleasedReturnValue();
    -[NSDate timeIntervalSinceReferenceDate](v19, "timeIntervalSinceReferenceDate");
  }
  v24 = v23;
  v30[1] = 3221225472;
  v30[2] = __126__HKGlassesPrescription_prescriptionWithRightEyeSpecification_leftEyeSpecification_dateIssued_expirationDate_device_metadata___block_invoke;
  v30[3] = &unk_1E37F2F78;
  v31 = v14;
  v32 = v15;
  v29.receiver = a1;
  v29.super_class = (Class)&OBJC_METACLASS___HKGlassesPrescription;
  v30[0] = MEMORY[0x1E0C809B0];
  v25 = v15;
  v26 = v14;
  v27 = objc_msgSendSuper2(&v29, sel__newSampleWithType_startDate_endDate_device_metadata_config_, v20, v18, v17, v30, v22, v24);

  if (!v16)
  return (HKGlassesPrescription *)v27;
}

void __126__HKGlassesPrescription_prescriptionWithRightEyeSpecification_leftEyeSpecification_dateIssued_expirationDate_device_metadata___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;

  v3 = *(void **)(a1 + 32);
  v8 = a2;
  v4 = objc_msgSend(v3, "copy");
  v5 = (void *)v8[21];
  v8[21] = v4;

  v6 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v7 = (void *)v8[22];
  v8[22] = v6;

  objc_msgSend(v8, "_setPrescriptionType:", 1);
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p Left=%@, Right=%@>"), v5, self, self->_leftEye, self->_rightEye);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_setRightEyeSpecification:(id)a3
{
  HKGlassesLensSpecification *v4;
  HKGlassesLensSpecification *rightEye;

  v4 = (HKGlassesLensSpecification *)objc_msgSend(a3, "copy");
  rightEye = self->_rightEye;
  self->_rightEye = v4;

}

- (void)_setLeftEyeSpecification:(id)a3
{
  HKGlassesLensSpecification *v4;
  HKGlassesLensSpecification *leftEye;

  v4 = (HKGlassesLensSpecification *)objc_msgSend(a3, "copy");
  leftEye = self->_leftEye;
  self->_leftEye = v4;

}

- (id)leftSphere
{
  void *v2;
  void *v3;

  -[HKGlassesPrescription leftEye](self, "leftEye");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sphere");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)rightSphere
{
  void *v2;
  void *v3;

  -[HKGlassesPrescription rightEye](self, "rightEye");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sphere");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)leftCylinder
{
  void *v2;
  void *v3;

  -[HKGlassesPrescription leftEye](self, "leftEye");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cylinder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)rightCylinder
{
  void *v2;
  void *v3;

  -[HKGlassesPrescription rightEye](self, "rightEye");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cylinder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)leftAxis
{
  void *v2;
  void *v3;

  -[HKGlassesPrescription leftEye](self, "leftEye");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axis");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)rightAxis
{
  void *v2;
  void *v3;

  -[HKGlassesPrescription rightEye](self, "rightEye");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axis");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)leftAddPower
{
  void *v2;
  void *v3;

  -[HKGlassesPrescription leftEye](self, "leftEye");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addPower");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)rightAddPower
{
  void *v2;
  void *v3;

  -[HKGlassesPrescription rightEye](self, "rightEye");
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
  v5.super_class = (Class)HKGlassesPrescription;
  v4 = a3;
  -[HKVisionPrescription encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_leftEye, CFSTR("LeftEye"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_rightEye, CFSTR("RightEye"));

}

- (HKGlassesPrescription)initWithCoder:(id)a3
{
  id v4;
  HKGlassesPrescription *v5;
  uint64_t v6;
  HKGlassesLensSpecification *leftEye;
  uint64_t v8;
  HKGlassesLensSpecification *rightEye;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKGlassesPrescription;
  v5 = -[HKVisionPrescription initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LeftEye"));
    v6 = objc_claimAutoreleasedReturnValue();
    leftEye = v5->_leftEye;
    v5->_leftEye = (HKGlassesLensSpecification *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RightEye"));
    v8 = objc_claimAutoreleasedReturnValue();
    rightEye = v5->_rightEye;
    v5->_rightEye = (HKGlassesLensSpecification *)v8;

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
  v9.super_class = (Class)HKGlassesPrescription;
  -[HKVisionPrescription _validateWithConfiguration:](&v9, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4
    || (v8 = 0,
        v5 = -[HKGlassesPrescription _validateGlassesFieldsWithError:](self, "_validateGlassesFieldsWithError:", &v8),
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

- (BOOL)_validateGlassesFieldsWithError:(id *)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  BOOL v33;
  id v34;
  void *v35;
  uint64_t v36;
  const __CFString *v37;
  const __CFString *v38;
  id v39;
  id v40;
  void *v41;

  -[HKGlassesPrescription leftSphere](self, "leftSphere");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else
  {
    -[HKGlassesPrescription rightSphere](self, "rightSphere");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Requires atleast one sphere value for left or right eye"));
      v39 = (id)objc_claimAutoreleasedReturnValue();
      v13 = v39;
      v33 = v39 == 0;
      if (v39)
      {
        if (a3)
        {
          v13 = objc_retainAutorelease(v39);
          v33 = 0;
          *a3 = v13;
          v9 = v13;
          goto LABEL_34;
        }
        _HKLogDroppedError(v39);
        v33 = 0;
      }
      v9 = v13;
      goto LABEL_34;
    }
  }
  -[HKGlassesPrescription leftEye](self, "leftEye");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "vertexDistance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9
    || (+[HKUnit meterUnit](HKUnit, "meterUnit"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v9, "isCompatibleWithUnit:", v10),
        v10,
        (v11 & 1) != 0))
  {
    -[HKGlassesPrescription rightEye](self, "rightEye");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "vertexDistance");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13
      && (+[HKUnit meterUnit](HKUnit, "meterUnit"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v13, "isCompatibleWithUnit:", v14),
          v14,
          (v15 & 1) == 0))
    {
      v35 = (void *)MEMORY[0x1E0CB35C8];
      v36 = objc_opt_class();
      v37 = CFSTR("rightVertexDistance");
      v38 = CFSTR("Right vertex distance must be a meter quantity");
    }
    else
    {
      -[HKGlassesPrescription leftEye](self, "leftEye");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "prism");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
LABEL_11:
        -[HKGlassesPrescription rightEye](self, "rightEye");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "prism");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
        {
LABEL_14:
          v33 = 1;
          goto LABEL_34;
        }
        -[HKGlassesPrescription rightEye](self, "rightEye");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "prism");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "eye");

        if (v28 == 2)
        {
          v29 = (void *)objc_opt_class();
          -[HKGlassesPrescription rightEye](self, "rightEye");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "prism");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v29, "_validatePrism:error:", v31, a3);

          if (v32)
            goto LABEL_14;
LABEL_23:
          v33 = 0;
          goto LABEL_34;
        }
        v35 = (void *)MEMORY[0x1E0CB35C8];
        v36 = objc_opt_class();
        v37 = CFSTR("self.rightEye.prism.eye");
        v38 = CFSTR("Right prism Eye incorrect");
        goto LABEL_25;
      }
      -[HKGlassesPrescription leftEye](self, "leftEye");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "prism");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "eye");

      if (v20 == 1)
      {
        v21 = (void *)objc_opt_class();
        -[HKGlassesPrescription leftEye](self, "leftEye");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "prism");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v21) = objc_msgSend(v21, "_validatePrism:error:", v23, a3);

        if (!(_DWORD)v21)
          goto LABEL_23;
        goto LABEL_11;
      }
      v35 = (void *)MEMORY[0x1E0CB35C8];
      v36 = objc_opt_class();
      v37 = CFSTR("self.leftEye.prism.eye");
      v38 = CFSTR("Left prism Eye incorrect");
    }
LABEL_25:
    objc_msgSend(v35, "hk_errorForInvalidArgument:class:selector:format:", v37, v36, a2, v38);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    v33 = v40 == 0;
    if (v40)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v40);
      else
        _HKLogDroppedError(v40);
    }

    goto LABEL_34;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("leftVertexDistance"), objc_opt_class(), a2, CFSTR("Left vertex distance must be a meter quantity"));
  v34 = (id)objc_claimAutoreleasedReturnValue();
  v13 = v34;
  v33 = v34 == 0;
  if (v34)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v34);
    else
      _HKLogDroppedError(v34);
  }

LABEL_34:
  return v33;
}

+ (BOOL)_validatePrism:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  const __CFString *v23;
  id v24;
  id v25;

  v6 = a3;
  objc_msgSend(v6, "amount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit prismDiopterUnit](HKUnit, "prismDiopterUnit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isCompatibleWithUnit:", v8);

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v6, "angle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKUnit radianAngleUnit](HKUnit, "radianAngleUnit");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isCompatibleWithUnit:", v11);

    if ((v12 & 1) != 0)
    {
      objc_msgSend(v6, "verticalAmount");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKUnit prismDiopterUnit](HKUnit, "prismDiopterUnit");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isCompatibleWithUnit:", v14);

      if ((v15 & 1) != 0)
      {
        objc_msgSend(v6, "horizontalAmount");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKUnit prismDiopterUnit](HKUnit, "prismDiopterUnit");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isCompatibleWithUnit:", v17);

        if ((v18 & 1) != 0)
        {
          v19 = 1;
          goto LABEL_15;
        }
        v20 = (void *)MEMORY[0x1E0CB35C8];
        v21 = objc_opt_class();
        v22 = CFSTR("prism.horizontalAmount");
        v23 = CFSTR("Horizontal amount must be an prism diopter quantity");
      }
      else
      {
        v20 = (void *)MEMORY[0x1E0CB35C8];
        v21 = objc_opt_class();
        v22 = CFSTR("prism.verticalAmount");
        v23 = CFSTR("Vertical amount must be an prism diopter quantity");
      }
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v21 = objc_opt_class();
      v22 = CFSTR("prism.angle");
      v23 = CFSTR("Prism angle must be an Angle quantity");
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = objc_opt_class();
    v22 = CFSTR("prism.amount");
    v23 = CFSTR("Prism amount must be an prism diopter quantity");
  }
  objc_msgSend(v20, "hk_errorForInvalidArgument:class:selector:format:", v22, v21, a2, v23);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  v19 = v24 == 0;
  if (v24)
  {
    if (a4)
    {
      v25 = objc_retainAutorelease(v24);
      v19 = 0;
      *a4 = v25;
    }
    else
    {
      _HKLogDroppedError(v24);
      v19 = 0;
    }
  }

LABEL_15:
  return v19;
}

- (HKGlassesLensSpecification)rightEye
{
  return self->_rightEye;
}

- (HKGlassesLensSpecification)leftEye
{
  return self->_leftEye;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftEye, 0);
  objc_storeStrong((id *)&self->_rightEye, 0);
}

@end
