@implementation HKVisionPrism

- (HKVisionPrism)initWithAmount:(HKQuantity *)amount angle:(HKQuantity *)angle eye:(HKVisionEye)eye
{
  HKQuantity *v8;
  HKQuantity *v9;
  HKVisionPrism *v10;
  uint64_t v11;
  HKQuantity *v12;
  uint64_t v13;
  HKQuantity *v14;
  objc_super v16;

  v8 = amount;
  v9 = angle;
  v16.receiver = self;
  v16.super_class = (Class)HKVisionPrism;
  v10 = -[HKVisionPrism init](&v16, sel_init);
  if (v10)
  {
    v11 = -[HKQuantity copy](v8, "copy");
    v12 = v10->_amount;
    v10->_amount = (HKQuantity *)v11;

    v13 = -[HKQuantity copy](v9, "copy");
    v14 = v10->_angle;
    v10->_angle = (HKQuantity *)v13;

    v10->_eye = eye;
    -[HKVisionPrism _validatePolar](v10, "_validatePolar");
    -[HKVisionPrism _setRectangularValues](v10, "_setRectangularValues");
  }

  return v10;
}

- (HKVisionPrism)initWithVerticalAmount:(HKQuantity *)verticalAmount verticalBase:(HKPrismBase)verticalBase horizontalAmount:(HKQuantity *)horizontalAmount horizontalBase:(HKPrismBase)horizontalBase eye:(HKVisionEye)eye
{
  HKQuantity *v12;
  HKQuantity *v13;
  HKVisionPrism *v14;
  uint64_t v15;
  HKQuantity *v16;
  uint64_t v17;
  HKQuantity *v18;
  objc_super v20;

  v12 = verticalAmount;
  v13 = horizontalAmount;
  v20.receiver = self;
  v20.super_class = (Class)HKVisionPrism;
  v14 = -[HKVisionPrism init](&v20, sel_init);
  if (v14)
  {
    v15 = -[HKQuantity copy](v12, "copy");
    v16 = v14->_verticalAmount;
    v14->_verticalAmount = (HKQuantity *)v15;

    v14->_verticalBase = verticalBase;
    v17 = -[HKQuantity copy](v13, "copy");
    v18 = v14->_horizontalAmount;
    v14->_horizontalAmount = (HKQuantity *)v17;

    v14->_horizontalBase = horizontalBase;
    v14->_eye = eye;
    -[HKVisionPrism _validateRectangular](v14, "_validateRectangular");
    -[HKVisionPrism _setPolarValues](v14, "_setPolarValues");
  }

  return v14;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p Amount=%@, Angle=%@>"), v5, self, self->_amount, self->_angle);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_validatePolar
{
  HKQuantity *amount;
  void *v4;
  _QWORD *v5;
  HKQuantity *angle;
  void *v7;

  amount = self->_amount;
  +[HKUnit prismDiopterUnit](HKUnit, "prismDiopterUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(amount) = -[HKQuantity isCompatibleWithUnit:](amount, "isCompatibleWithUnit:", v4);

  v5 = (_QWORD *)MEMORY[0x1E0C99778];
  if ((amount & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Prism amount must be an prism diopter quantity"));
  angle = self->_angle;
  +[HKUnit radianAngleUnit](HKUnit, "radianAngleUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(angle) = -[HKQuantity isCompatibleWithUnit:](angle, "isCompatibleWithUnit:", v7);

  if ((angle & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v5, CFSTR("Prism angle must be an Angle quantity"));
}

- (void)_validateRectangular
{
  HKQuantity *verticalAmount;
  void *v4;
  _QWORD *v5;
  HKQuantity *horizontalAmount;
  void *v7;

  verticalAmount = self->_verticalAmount;
  +[HKUnit prismDiopterUnit](HKUnit, "prismDiopterUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(verticalAmount) = -[HKQuantity isCompatibleWithUnit:](verticalAmount, "isCompatibleWithUnit:", v4);

  v5 = (_QWORD *)MEMORY[0x1E0C99778];
  if ((verticalAmount & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Vertical amount must be an prism diopter quantity"));
  horizontalAmount = self->_horizontalAmount;
  +[HKUnit prismDiopterUnit](HKUnit, "prismDiopterUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(horizontalAmount) = -[HKQuantity isCompatibleWithUnit:](horizontalAmount, "isCompatibleWithUnit:", v7);

  if ((horizontalAmount & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v5, CFSTR("Horizontal amount must be an prism diopter quantity"));
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HKVisionPrism *v6;
  HKVisionPrism *v7;
  HKQuantity *amount;
  HKQuantity *v9;
  uint64_t v10;
  HKQuantity *v11;
  char v12;
  HKQuantity *angle;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HKQuantity *v18;
  void *v19;

  v6 = (HKVisionPrism *)a3;
  if (self == v6)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      amount = self->_amount;
      -[HKVisionPrism amount](v7, "amount");
      v9 = (HKQuantity *)objc_claimAutoreleasedReturnValue();
      if (amount == v9)
        goto LABEL_9;
      -[HKVisionPrism amount](v7, "amount");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v12 = 0;
LABEL_17:

        goto LABEL_18;
      }
      v3 = (void *)v10;
      v11 = self->_amount;
      -[HKVisionPrism amount](v7, "amount");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[HKQuantity isEqual:](v11, "isEqual:", v4))
      {
LABEL_9:
        angle = self->_angle;
        -[HKVisionPrism angle](v7, "angle");
        v14 = objc_claimAutoreleasedReturnValue();
        if (angle == (HKQuantity *)v14)
        {

          v12 = 1;
        }
        else
        {
          v15 = (void *)v14;
          -[HKVisionPrism angle](v7, "angle");
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = (void *)v16;
            v18 = self->_angle;
            -[HKVisionPrism angle](v7, "angle");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = -[HKQuantity isEqual:](v18, "isEqual:", v19);

          }
          else
          {

            v12 = 0;
          }
        }
        if (amount == v9)
          goto LABEL_17;
      }
      else
      {
        v12 = 0;
      }

      goto LABEL_17;
    }
    v12 = 0;
  }
LABEL_18:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKQuantity *amount;
  id v5;

  amount = self->_amount;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", amount, CFSTR("Amount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_angle, CFSTR("Base"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_eye, CFSTR("Eye"));

}

- (HKVisionPrism)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  HKVisionPrism *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Amount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Base"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Eye"));

  v8 = -[HKVisionPrism initWithAmount:angle:eye:](self, "initWithAmount:angle:eye:", v5, v6, v7);
  return v8;
}

- (void)_setRectangularValues
{
  HKQuantity *amount;
  void *v4;
  double v5;
  double v6;
  HKQuantity *angle;
  void *v8;
  double v9;
  double v10;
  __double2 v11;
  double v12;
  int64_t v13;
  uint64_t v14;
  double v15;
  int64_t v16;
  void *v17;
  HKQuantity *v18;
  HKQuantity *horizontalAmount;
  HKQuantity *v20;
  HKQuantity *verticalAmount;
  id v22;

  amount = self->_amount;
  +[HKUnit prismDiopterUnit](HKUnit, "prismDiopterUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity doubleValueForUnit:](amount, "doubleValueForUnit:", v4);
  v6 = v5;

  angle = self->_angle;
  +[HKUnit radianAngleUnit](HKUnit, "radianAngleUnit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity doubleValueForUnit:](angle, "doubleValueForUnit:", v8);
  v10 = v9;

  v11 = __sincos_stret(v10);
  v12 = v6 * v11.__cosval;
  v13 = 3;
  if (self->_eye == 2)
    v14 = 4;
  else
    v14 = 3;
  if (self->_eye != 2)
    v13 = 4;
  if (v12 <= 0.0)
    v13 = v14;
  v15 = v6 * v11.__sinval;
  v16 = 2;
  if (v15 > 0.0)
    v16 = 1;
  self->_verticalBase = v16;
  self->_horizontalBase = v13;
  +[HKUnit prismDiopterUnit](HKUnit, "prismDiopterUnit");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v17, fabs(v12));
  v18 = (HKQuantity *)objc_claimAutoreleasedReturnValue();
  horizontalAmount = self->_horizontalAmount;
  self->_horizontalAmount = v18;

  +[HKUnit prismDiopterUnit](HKUnit, "prismDiopterUnit");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v22, fabs(v15));
  v20 = (HKQuantity *)objc_claimAutoreleasedReturnValue();
  verticalAmount = self->_verticalAmount;
  self->_verticalAmount = v20;

}

- (void)_setPolarValues
{
  HKQuantity *verticalAmount;
  void *v4;
  double v5;
  double v6;
  HKQuantity *horizontalAmount;
  void *v8;
  double v9;
  double v10;
  int64_t eye;
  void *v12;
  HKQuantity *v13;
  HKQuantity *amount;
  double v15;
  double v16;
  HKQuantity *v17;
  HKQuantity *angle;
  id v19;

  verticalAmount = self->_verticalAmount;
  +[HKUnit prismDiopterUnit](HKUnit, "prismDiopterUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity doubleValueForUnit:](verticalAmount, "doubleValueForUnit:", v4);
  v6 = v5;

  horizontalAmount = self->_horizontalAmount;
  +[HKUnit prismDiopterUnit](HKUnit, "prismDiopterUnit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity doubleValueForUnit:](horizontalAmount, "doubleValueForUnit:", v8);
  v10 = v9;

  eye = self->_eye;
  if (eye == 1)
  {
    if (self->_horizontalBase != 3)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (eye == 2 && self->_horizontalBase == 4)
LABEL_6:
    v10 = -v10;
LABEL_7:
  if (self->_verticalBase == 2)
    v6 = -v6;
  +[HKUnit prismDiopterUnit](HKUnit, "prismDiopterUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v12, sqrt(v6 * v6 + v10 * v10));
  v13 = (HKQuantity *)objc_claimAutoreleasedReturnValue();
  amount = self->_amount;
  self->_amount = v13;

  v15 = round(atan2(v6, v10) * 57.2957795);
  if (v15 >= 0.0)
    v16 = v15;
  else
    v16 = v15 + 360.0;
  +[HKUnit degreeAngleUnit](HKUnit, "degreeAngleUnit");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v19, v16);
  v17 = (HKQuantity *)objc_claimAutoreleasedReturnValue();
  angle = self->_angle;
  self->_angle = v17;

}

- (HKQuantity)amount
{
  return self->_amount;
}

- (HKQuantity)angle
{
  return self->_angle;
}

- (HKQuantity)verticalAmount
{
  return self->_verticalAmount;
}

- (HKQuantity)horizontalAmount
{
  return self->_horizontalAmount;
}

- (HKPrismBase)verticalBase
{
  return self->_verticalBase;
}

- (HKPrismBase)horizontalBase
{
  return self->_horizontalBase;
}

- (HKVisionEye)eye
{
  return self->_eye;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalAmount, 0);
  objc_storeStrong((id *)&self->_verticalAmount, 0);
  objc_storeStrong((id *)&self->_angle, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

@end
