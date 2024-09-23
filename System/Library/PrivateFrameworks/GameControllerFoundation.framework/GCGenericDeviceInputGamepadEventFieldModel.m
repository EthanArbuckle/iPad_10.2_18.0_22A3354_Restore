@implementation GCGenericDeviceInputGamepadEventFieldModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceInputGamepadEventFieldModel)init
{
  -[GCGenericDeviceInputGamepadEventFieldModel doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (GCGenericDeviceInputGamepadEventFieldModel)initWithCoder:(id)a3
{
  id v3;
  GCGenericDeviceInputGamepadEventFieldModel *v4;
  uint64_t v5;
  GCGenericDeviceDataProcessorExpressionModel *sourceExpression;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GCGenericDeviceInputGamepadEventFieldModel;
  v3 = a3;
  v4 = -[GCGenericDeviceInputGamepadEventFieldModel init](&v8, sel_init);
  v4->_extendedIndex = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("extendedIndex"), v8.receiver, v8.super_class);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceExpression"));
  v5 = objc_claimAutoreleasedReturnValue();

  sourceExpression = v4->_sourceExpression;
  v4->_sourceExpression = (GCGenericDeviceDataProcessorExpressionModel *)v5;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[GCGenericDeviceInputGamepadEventFieldModel extendedIndex](self, "extendedIndex"), CFSTR("extendedIndex"));
  -[GCGenericDeviceInputGamepadEventFieldModel sourceExpression](self, "sourceExpression");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sourceExpression"));

}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((-[GCGenericDeviceInputGamepadEventFieldModel isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
      goto LABEL_8;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !-[GCGenericDeviceInputGamepadEventFieldModel isMemberOfClass:](self, "isMemberOfClass:", objc_msgSend((id)objc_opt_class(), "modelClass")))
    {
      goto LABEL_8;
    }
  }
  v5 = -[GCGenericDeviceInputGamepadEventFieldModel extendedIndex](self, "extendedIndex");
  if (v5 != objc_msgSend(v4, "extendedIndex"))
  {
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  -[GCGenericDeviceInputGamepadEventFieldModel sourceExpression](self, "sourceExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

LABEL_9:
  return v8;
}

+ (id)description
{
  return CFSTR("Gamepad Event Field");
}

- (id)description
{
  int64_t v3;
  void *v4;
  void *v5;

  v3 = -[GCGenericDeviceInputGamepadEventFieldModel extendedIndex](self, "extendedIndex");
  -[GCGenericDeviceInputGamepadEventFieldModel sourceExpression](self, "sourceExpression");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("[%zd] <- %@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)debugDescription
{
  objc_class *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GCGenericDeviceInputGamepadEventFieldModel extendedIndex](self, "extendedIndex");
  -[GCGenericDeviceInputGamepadEventFieldModel sourceExpression](self, "sourceExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p> {\n\t extendedIndex = %zd\n\t sourceExpression = %@\n}"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)extendedIndex
{
  return self->_extendedIndex;
}

- (GCGenericDeviceDataProcessorExpressionModel)sourceExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceExpression, 0);
}

+ (id)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37[7];
  _QWORD v38[4];
  _QWORD v39[4];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[4];

  v43[2] = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_opt_new();
  v37[0] = 0;
  objc_msgSend(a3, "gc_objectForKey:ofClass:error:", CFSTR("ExtendedIndex"), objc_opt_class(), v37);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v37[0];
  v10 = v9;
  if (v8)
    v11 = 1;
  else
    v11 = v9 == 0;
  if (!v11)
  {
    if (a4)
    {
      v42[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v19;
      v42[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v10, "localizedFailureReason");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v43[1] = v20;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v21);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_39;
  }
  if (v8)
    objc_msgSend(v7, "setExtendedIndex:", objc_msgSend(v8, "integerValue"));

  v36 = 0;
  objc_msgSend(a3, "gc_objectForKey:ofClass:error:", CFSTR("SourceExpression"), objc_opt_class(), &v36);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v36;
  v14 = v13;
  if (!v12 && v13)
  {
    if (!a4)
    {
      v16 = v13;
      goto LABEL_38;
    }
    v40[0] = *MEMORY[0x1E0CB2D50];
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v22;
    v40[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(v14, "localizedFailureReason");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v34;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v23);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v16 = v14;
    goto LABEL_21;
  }
  if (!v12)
  {
    v16 = v13;
    goto LABEL_14;
  }
  v35 = 0;
  +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDataProcessorExpressionModel, "modelWithDictionaryRepresentation:error:", v12, &v35);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v35;

  if (!v15)
  {
    if (!a4)
    {
LABEL_38:

LABEL_39:
      v17 = 0;
      goto LABEL_15;
    }
    v38[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(v16, "localizedDescription");
    v24 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v24;
    if (!v24)
    {
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
      v24 = objc_claimAutoreleasedReturnValue();
    }
    v34 = (void *)v24;
    v39[0] = v24;
    v38[1] = *MEMORY[0x1E0CB2D68];
    objc_msgSend(v16, "localizedFailureReason");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    if (!v25)
    {
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating '%@' model for key '%@'."), objc_opt_class(), CFSTR("SourceExpression"));
      v25 = objc_claimAutoreleasedReturnValue();
    }
    v33 = (void *)v25;
    v39[1] = v25;
    v38[2] = *MEMORY[0x1E0CB3388];
    v27 = (uint64_t)v16;
    if (!v16)
    {
      +[NSNull null](&off_1F03A9C88, "null");
      v27 = objc_claimAutoreleasedReturnValue();
    }
    v28 = (void *)v27;
    v39[2] = v27;
    v38[3] = CFSTR("GCFailingKeyPathErrorKey");
    objc_msgSend(v16, "gc_failingKeyPath");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (!v29)
      v29 = (void *)MEMORY[0x1E0C9AA60];
    objc_msgSend(v29, "arrayByAddingObject:", CFSTR("SourceExpression"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v31;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v39, v38, 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v32);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    if (!v16)
    if (!v26)

    if (v22)
    {
LABEL_36:

      goto LABEL_38;
    }
LABEL_21:

    goto LABEL_36;
  }
  objc_msgSend(v7, "setSourceExpression:", v15);

LABEL_14:
  objc_msgSend(v7, "build");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v17;
}

@end
