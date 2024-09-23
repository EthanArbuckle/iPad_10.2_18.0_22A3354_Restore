@implementation MLMultiArrayConstraint

+ (MLMultiArrayConstraint)constraintWithShape:(id)a3 dataType:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithShape:dataType:shapeConstraint:defaultOptionalValue:", v6, a4, 0, 0);

  return (MLMultiArrayConstraint *)v7;
}

+ (MLMultiArrayConstraint)constraintWithShape:(id)a3 dataType:(int64_t)a4 shapeConstraint:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithShape:dataType:shapeConstraint:", v9, a4, v8);

  return (MLMultiArrayConstraint *)v10;
}

- (MLMultiArrayConstraint)initWithShape:(id)a3 dataType:(int64_t)a4 shapeConstraint:(id)a5
{
  return -[MLMultiArrayConstraint initWithShape:dataType:shapeConstraint:defaultOptionalValue:](self, "initWithShape:dataType:shapeConstraint:defaultOptionalValue:", a3, a4, a5, 0);
}

- (MLMultiArrayDataType)dataType
{
  return self->_dataType;
}

- (MLMultiArrayShapeConstraint)shapeConstraint
{
  return self->_shapeConstraint;
}

- (BOOL)isAllowedValue:(id)a3 isNeuralNetworkInputOrOutput:(BOOL)a4 usingRank5Mapping:(BOOL)a5 featureName:(id)a6 error:(id *)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  const __CFString *v14;
  BOOL v15;
  NSUInteger v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t i;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  _QWORD v34[2];

  v9 = a5;
  v34[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  if (a4)
  {
    if (objc_msgSend(v12, "isUndefined"))
    {
      if (a7)
      {
        v14 = CFSTR("MultiArrayConstraint cannot check undefined values");
LABEL_16:
        +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", v14);
        v15 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_37;
      }
      goto LABEL_17;
    }
    if (objc_msgSend(v12, "type") != 5)
    {
      if (a7)
      {
        v14 = CFSTR("MultiArrayConstraint only allows MultiArray Feature Values");
        goto LABEL_16;
      }
LABEL_17:
      v15 = 0;
      goto LABEL_37;
    }
    v16 = -[NSArray count](self->_shape, "count");
    objc_msgSend(v12, "multiArrayValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "shape");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v18, "count");
    v20 = v19;
    if (v9)
    {
      if (v16 != v19)
      {
        if (v16 + 2 == v19)
        {
          v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          if (v16)
          {
            for (i = 0; i != v16; ++i)
            {
              objc_msgSend(v18, "objectAtIndexedSubscript:", i + 2);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:atIndexedSubscript:", v23, i);

            }
          }
          goto LABEL_13;
        }
        if (v16 == 1 && v19 == 5)
        {
          objc_msgSend(v18, "objectAtIndexedSubscript:", 3);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v28, "integerValue") == 1)
          {
            objc_msgSend(v18, "objectAtIndexedSubscript:", 4);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "integerValue");

            if (v30 == 1)
            {
              objc_msgSend(v18, "objectAtIndexedSubscript:", 2);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v34[0] = v31;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
              v21 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
              v15 = -[MLMultiArrayConstraint isAllowedShape:error:](self, "isAllowedShape:error:", v21, a7);

LABEL_36:
              goto LABEL_37;
            }
          }
          else
          {

          }
          if (a7)
          {
            v32 = CFSTR("Neural network model expects vector inputs, but non-unit height or width dimensions were provided.");
            goto LABEL_34;
          }
        }
        else if (a7)
        {
          v32 = CFSTR("Neural Network (<=version 3) inputs can only be of size 1, 3, or 5.");
LABEL_34:
          +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", v32);
          v15 = 0;
          *a7 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_36;
        }
LABEL_35:
        v15 = 0;
        goto LABEL_36;
      }
    }
    else if (v19 != v16)
    {
      if (v19)
      {
        -[MLMultiArrayShapeConstraint shapeSet](self->_shapeConstraint, "shapeSet");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "count");

        if (v25 == 1)
        {
          if (a7)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("According to model description, feature '%@' must be of rank %@, instead got a multi-array value of rank %@."), v13, v26, v27);
            *a7 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_35;
        }
      }
    }
    v15 = -[MLMultiArrayConstraint isAllowedShape:error:](self, "isAllowedShape:error:", v18, a7);
    goto LABEL_36;
  }
  v15 = -[MLMultiArrayConstraint isAllowedValue:error:](self, "isAllowedValue:error:", v12, a7);
LABEL_37:

  return v15;
}

- (BOOL)isAllowedShape:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  if (-[NSArray count](self->_shape, "count"))
    v7 = -[MLMultiArrayShapeConstraint isAllowedShape:error:](self->_shapeConstraint, "isAllowedShape:error:", v6, a4);
  else
    v7 = 1;

  return v7;
}

- (MLMultiArrayConstraint)initWithShape:(id)a3 dataType:(int64_t)a4 shapeConstraint:(id)a5 defaultOptionalValue:(id)a6
{
  id v11;
  id v12;
  id v13;
  MLMultiArrayConstraint *v14;
  MLMultiArrayShapeConstraint *v15;
  uint64_t v16;
  MLMultiArrayShapeConstraint *v17;
  MLMultiArrayShapeConstraint *v18;
  void *v19;
  MLMultiArrayShapeConstraint *shapeConstraint;
  MLMultiArrayShapeConstraint *v21;
  objc_super v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)MLMultiArrayConstraint;
  v14 = -[MLMultiArrayConstraint init](&v23, sel_init);
  if (v14)
  {
    v15 = (MLMultiArrayShapeConstraint *)v12;
    if (!v15)
    {
      v16 = objc_msgSend(v11, "count");
      v17 = [MLMultiArrayShapeConstraint alloc];
      v18 = v17;
      if (v16)
      {
        v24[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[MLMultiArrayShapeConstraint initWithEnumeratedShapes:](v18, "initWithEnumeratedShapes:", v19);

      }
      else
      {
        v15 = -[MLMultiArrayShapeConstraint initUnspecified](v17, "initUnspecified");
      }
    }
    objc_storeStrong((id *)&v14->_shape, a3);
    shapeConstraint = v14->_shapeConstraint;
    v14->_dataType = a4;
    v14->_shapeConstraint = v15;
    v21 = v15;

    objc_storeStrong((id *)&v14->_defaultOptionalValue, a6);
  }

  return v14;
}

- (BOOL)isAllowedDataType:(int64_t)a3 error:(id *)a4
{
  int64_t dataType;
  void *v7;
  void *v8;

  dataType = self->_dataType;
  if (a4 && dataType != a3)
  {
    +[MLMultiArrayUtils stringForDataType:](MLMultiArrayUtils, "stringForDataType:", dataType);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLMultiArrayUtils stringForDataType:](MLMultiArrayUtils, "stringForDataType:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("MultiArray dataType should be %@ but is %@"), v7, v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return dataType == a3;
}

- (BOOL)isAllowedValue:(id)a3 error:(id *)a4
{
  id v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v6 = a3;
  if (objc_msgSend(v6, "isUndefined"))
  {
    if (a4)
    {
      v7 = CFSTR("MultiArrayConstraint cannot check undefined values");
LABEL_9:
      +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", v7);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  if (objc_msgSend(v6, "type") != 5)
  {
    if (a4)
    {
      v7 = CFSTR("MultiArrayConstraint only allows MultiArray Feature Values");
      goto LABEL_9;
    }
LABEL_10:
    v10 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v6, "multiArrayValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shape");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MLMultiArrayConstraint isAllowedShape:error:](self, "isAllowedShape:error:", v9, a4))
    v10 = -[MLMultiArrayConstraint isAllowedDataType:error:](self, "isAllowedDataType:error:", objc_msgSend(v8, "dataType"), a4);
  else
    v10 = 0;

LABEL_13:
  return v10;
}

- (id)defaultOptionalValue
{
  return self->_defaultOptionalValue;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MLMultiArrayConstraint initWithShape:dataType:shapeConstraint:](+[MLMultiArrayConstraint allocWithZone:](MLMultiArrayConstraint, "allocWithZone:", a3), "initWithShape:dataType:shapeConstraint:", self->_shape, self->_dataType, self->_shapeConstraint);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  +[MLMultiArrayUtils stringForDataType:](MLMultiArrayUtils, "stringForDataType:", self->_dataType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray componentsJoinedByString:](self->_shape, "componentsJoinedByString:", CFSTR(" × "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MLMultiArrayConstraint shape](self, "shape");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("shape"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[MLMultiArrayConstraint dataType](self, "dataType"), CFSTR("dataType"));
  -[MLMultiArrayConstraint shapeConstraint](self, "shapeConstraint");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("shapeConstraint"));

}

- (MLMultiArrayConstraint)initWithCoder:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  MLMultiArrayConstraint *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C99E20];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7, v14, v15);

  objc_msgSend(v5, "allowedClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v8);

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v6, CFSTR("shape"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("dataType"));
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shapeConstraint"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[MLMultiArrayConstraint initWithShape:dataType:shapeConstraint:](self, "initWithShape:dataType:shapeConstraint:", v9, v10, v11);
  return v12;
}

- (NSArray)shape
{
  return self->_shape;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeConstraint, 0);
  objc_storeStrong((id *)&self->_shape, 0);
  objc_storeStrong((id *)&self->_defaultOptionalValue, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
