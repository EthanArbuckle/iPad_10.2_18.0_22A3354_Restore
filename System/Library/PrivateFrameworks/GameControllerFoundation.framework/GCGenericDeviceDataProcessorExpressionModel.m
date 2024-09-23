@implementation GCGenericDeviceDataProcessorExpressionModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceDataProcessorExpressionModel)init
{
  -[GCGenericDeviceDataProcessorExpressionModel doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (GCGenericDeviceDataProcessorExpressionModel)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GCGenericDeviceDataProcessorExpressionModel;
  return -[GCGenericDeviceDataProcessorExpressionModel init](&v4, sel_init, a3);
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((-[GCGenericDeviceDataProcessorExpressionModel isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    {
LABEL_7:
      v5 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !-[GCGenericDeviceDataProcessorExpressionModel isMemberOfClass:](self, "isMemberOfClass:", objc_msgSend((id)objc_opt_class(), "modelClass")))
    {
      goto LABEL_7;
    }
  }
  v5 = 1;
LABEL_8:

  return v5;
}

+ (id)description
{
  return CFSTR("Expression");
}

+ (id)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSString *v9;
  Class v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22[7];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v22[0] = 0;
  objc_msgSend(v5, "gc_requiredObjectForKey:ofClass:error:", CFSTR("Type"), objc_opt_class(), v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v22[0];
  v8 = v7;
  if (!v6)
  {
    if (a4)
    {
      v18 = *MEMORY[0x1E0CB2D50];
      v26[0] = CFSTR("Invalid 'Expression' definition.");
      v19 = *MEMORY[0x1E0CB2D68];
      v25[0] = v18;
      v25[1] = v19;
      objc_msgSend(v7, "localizedFailureReason");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v20;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v21);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_11;
  }
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("GCGenericDeviceData%@ExpressionModelBuilder"), v6);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = NSClassFromString(v9);
  if (!v10
    || v10 == (Class)objc_opt_class()
    || (-[objc_class isSubclassOfClass:](v10, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    if (a4)
    {
      v14 = *MEMORY[0x1E0CB2D50];
      v24[0] = CFSTR("Invalid 'Expression' definition.");
      v15 = *MEMORY[0x1E0CB2D68];
      v23[0] = v14;
      v23[1] = v15;
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("'%@' is not a valid expression type."), v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v16;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_10;
  }
  v11 = (void *)objc_msgSend([v10 alloc], "initWithDictionaryRepresentation:error:", v5, a4);
  if (!v11)
  {
LABEL_10:

LABEL_11:
    v12 = 0;
    goto LABEL_7;
  }

  objc_msgSend(v11, "build");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
LABEL_7:

  return v12;
}

- (id)buildPullExpressionWithOverrideBuilder:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v13;

  v6 = a3;
  v7 = v6;
  if (!v6)
    goto LABEL_8;
  v13 = 0;
  (*((void (**)(id, GCGenericDeviceDataProcessorExpressionModel *, id *))v6 + 2))(v6, self, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  v10 = v9;
  if (!v8)
  {
    if (v9)
    {
      v11 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v9);
      goto LABEL_4;
    }
LABEL_8:
    -[GCGenericDeviceDataProcessorExpressionModel _buildPullExpressionWithOverrideBuilder:error:](self, "_buildPullExpressionWithOverrideBuilder:error:", v7, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v11 = _Block_copy(v8);
LABEL_4:

LABEL_9:
  return v11;
}

- (id)_buildPullExpressionWithOverrideBuilder:(id)a3 error:(id *)a4
{
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v5 = *MEMORY[0x1E0CB2D68];
    v11 = *MEMORY[0x1E0CB2D50];
    v12 = v5;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Unsupported expression class: %@."), v7, v11, v12, CFSTR("Invalid expression."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v8;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v13, &v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError errorWithDomain:code:userInfo:](&off_1F03A6B68, "errorWithDomain:code:userInfo:", CFSTR("GCGenericDeviceError"), 2, v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

@end
