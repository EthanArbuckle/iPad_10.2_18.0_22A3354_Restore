@implementation GCGenericDeviceDriverPropertyModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceDriverPropertyModel)init
{
  -[GCGenericDeviceDriverPropertyModel doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (GCGenericDeviceDriverPropertyModel)initWithCoder:(id)a3
{
  id v3;
  GCGenericDeviceDriverPropertyModel *v4;
  uint64_t v5;
  NSString *name;
  uint64_t v7;
  GCGenericDeviceDataProcessorExpressionModel *valueExpression;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GCGenericDeviceDriverPropertyModel;
  v3 = a3;
  v4 = -[GCGenericDeviceDriverPropertyModel init](&v10, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"), v10.receiver, v10.super_class);
  v5 = objc_claimAutoreleasedReturnValue();
  name = v4->_name;
  v4->_name = (NSString *)v5;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("valueExpression"));
  v7 = objc_claimAutoreleasedReturnValue();

  valueExpression = v4->_valueExpression;
  v4->_valueExpression = (GCGenericDeviceDataProcessorExpressionModel *)v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[GCGenericDeviceDriverPropertyModel name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[GCGenericDeviceDriverPropertyModel valueExpression](self, "valueExpression");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("valueExpression"));

}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((-[GCGenericDeviceDriverPropertyModel isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    {
LABEL_8:
      v9 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !-[GCGenericDeviceDriverPropertyModel isMemberOfClass:](self, "isMemberOfClass:", objc_msgSend((id)objc_opt_class(), "modelClass")))
    {
      goto LABEL_8;
    }
  }
  -[GCGenericDeviceDriverPropertyModel name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[GCGenericDeviceDriverPropertyModel valueExpression](self, "valueExpression");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueExpression");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

LABEL_11:
  return v9;
}

+ (id)description
{
  return CFSTR("Driver Property");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  -[GCGenericDeviceDriverPropertyModel name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDriverPropertyModel valueExpression](self, "valueExpression");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("'%@' <- %@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)debugDescription
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDriverPropertyModel name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceDriverPropertyModel valueExpression](self, "valueExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p> {\n\t name = %@\n\t valueExpression = %@\n}"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)valueExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueExpression, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  id v35;
  id v36[7];
  _QWORD v37[4];
  _QWORD v38[4];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[4];

  v42[2] = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_opt_new();
  v36[0] = 0;
  objc_msgSend(a3, "gc_requiredObjectForKey:ofClass:error:", CFSTR("Name"), objc_opt_class(), v36);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v36[0];
  if (!v7)
  {
    if (a4)
    {
      v41[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v15;
      v41[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v8, "localizedFailureReason");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v42[1] = v16;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_29;
  }
  objc_msgSend(v6, "setName:", v7);

  v35 = 0;
  objc_msgSend(a3, "gc_requiredObjectForKey:ofClass:error:", CFSTR("ValueExpression"), objc_opt_class(), &v35);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v35;
  if (!v9)
  {
    if (a4)
    {
      v39[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v18;
      v39[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v10, "localizedFailureReason");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v40[1] = v19;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_29;
  }
  v34 = 0;
  +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDataProcessorExpressionModel, "modelWithDictionaryRepresentation:error:", v9, &v34);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v34;

  if (!v11)
  {
    if (a4)
    {
      v37[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v12, "localizedDescription");
      v21 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)v21;
      if (!v21)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      v31 = (void *)v21;
      v38[0] = v21;
      v37[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v12, "localizedFailureReason");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      if (!v22)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating '%@' model for key '%@'."), objc_opt_class(), CFSTR("ValueExpression"));
        v22 = objc_claimAutoreleasedReturnValue();
      }
      v30 = (void *)v22;
      v38[1] = v22;
      v37[2] = *MEMORY[0x1E0CB3388];
      v24 = (uint64_t)v12;
      if (!v12)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v24 = objc_claimAutoreleasedReturnValue();
      }
      v25 = (void *)v24;
      v38[2] = v24;
      v37[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v12, "gc_failingKeyPath");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (!v26)
        v26 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v26, "arrayByAddingObject:", CFSTR("ValueExpression"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v38[3] = v28;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v38, v37, 4);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v29);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      if (!v12)
      if (!v23)

      if (!v32)
    }

LABEL_29:
    v13 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v6, "setValueExpression:", v11);

  objc_msgSend(v6, "build");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

  return v13;
}

@end
