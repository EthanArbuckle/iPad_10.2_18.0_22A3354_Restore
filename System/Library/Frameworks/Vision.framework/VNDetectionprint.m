@implementation VNDetectionprint

- (unint64_t)hash
{
  return -[NSDictionary hash](self->_tensorsDictionary, "hash") ^ __ROR8__(-[VNRequestSpecifier hash](self->_originatingRequestSpecifier, "hash"), 51);
}

- (BOOL)isEqual:(id)a3
{
  VNDetectionprint *v4;
  VNDetectionprint *v5;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;

  v4 = (VNDetectionprint *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VNDetectionprint originatingRequestSpecifier](self, "originatingRequestSpecifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNDetectionprint originatingRequestSpecifier](v5, "originatingRequestSpecifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      v9 = (v8 & 1) != 0
        && -[NSDictionary isEqualToDictionary:](self->_tensorsDictionary, "isEqualToDictionary:", v5->_tensorsDictionary);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (NSArray)tensorKeys
{
  return -[NSDictionary allKeys](self->_tensorsDictionary, "allKeys");
}

- (id)tensorForKey:(id)a3 error:(id *)a4
{
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  v6 = (NSString *)a3;
  -[NSDictionary objectForKey:](self->_tensorsDictionary, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else if (a4)
  {
    _unavailableTensorKeyError(v6);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (VNDetectionprint)initWithTensorsDictionary:(id)a3 originatingRequestSpecifier:(id)a4
{
  id v6;
  id v7;
  VNDetectionprint *v8;
  uint64_t v9;
  NSDictionary *tensorsDictionary;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VNDetectionprint;
  v8 = -[VNDetectionprint init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    tensorsDictionary = v8->_tensorsDictionary;
    v8->_tensorsDictionary = (NSDictionary *)v9;

    objc_storeStrong((id *)&v8->_originatingRequestSpecifier, a4);
  }

  return v8;
}

- (VNDetectionprint)initWithTensorsDictionary:(id)a3 requestRevision:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  VNDetectionprint *v10;
  id v12;

  v6 = a3;
  v12 = 0;
  +[VNRequestSpecifier specifierForRequestClass:revision:error:](VNRequestSpecifier, "specifierForRequestClass:revision:error:", objc_opt_class(), a4, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  objc_msgSend(v8, "localizedDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", v7 != 0, v9);

  v10 = -[VNDetectionprint initWithTensorsDictionary:originatingRequestSpecifier:](self, "initWithTensorsDictionary:originatingRequestSpecifier:", v6, v7);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_tensorsDictionary, CFSTR("tensors"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_originatingRequestSpecifier, CFSTR("request"));

}

- (VNDetectionprint)initWithCoder:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  VNDetectionprint *v12;
  id v14;
  id v15;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99E60]);
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v5, "initWithObjects:", v6, v7, objc_opt_class(), 0);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("tensors"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_6;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("request"));
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
    goto LABEL_3;
  if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("request")) & 1) != 0)
  {
LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
  v15 = 0;
  objc_msgSend((id)objc_opt_class(), "originatingRequestSpecifierForRequestRevision:error:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("requestRevision")), &v15);
  v10 = objc_claimAutoreleasedReturnValue();
  v14 = v15;
  v11 = v14;
  if (!v10)
  {
    objc_msgSend(v4, "failWithError:", v14);
    v12 = 0;
    goto LABEL_4;
  }

LABEL_3:
  self = -[VNDetectionprint initWithTensorsDictionary:originatingRequestSpecifier:](self, "initWithTensorsDictionary:originatingRequestSpecifier:", v9, v10);
  v11 = (void *)v10;
  v12 = self;
LABEL_4:

LABEL_7:
  return v12;
}

- (unint64_t)requestRevision
{
  void *v2;
  unint64_t v3;

  -[VNDetectionprint originatingRequestSpecifier](self, "originatingRequestSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requestRevision");

  return v3;
}

- (VNRequestSpecifier)originatingRequestSpecifier
{
  return self->_originatingRequestSpecifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingRequestSpecifier, 0);
  objc_storeStrong((id *)&self->_tensorsDictionary, 0);
}

+ (id)knownTensorKeysForRequestRevision:(unint64_t)a3 error:(id *)a4
{
  void *v4;
  _QWORD *v5;
  void *v6;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (a3 == 2)
  {
    v9[0] = CFSTR("VNDetectionprintTensorKeyStride8FeatureMap");
    v9[1] = CFSTR("VNDetectionprintTensorKeyStride16FeatureMap");
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = v9;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v10[0] = CFSTR("VNDetectionprintTensorKeyMixed2");
    v10[1] = CFSTR("VNDetectionprintTensorKeyMixed6");
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = v10;
LABEL_5:
    objc_msgSend(v4, "arrayWithObjects:count:", v5, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequestClass:](VNError, "errorForUnsupportedRevision:ofRequestClass:", a3, objc_opt_class());
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    return 0;
  }
  v6 = 0;
  return v6;
}

+ (id)tensorShapeForKey:(id)a3 error:(id *)a4
{
  NSString *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = (NSString *)a3;
  if (+[VNDetectionprint tensorShapeForKey:error:]::onceToken != -1)
    dispatch_once(&+[VNDetectionprint tensorShapeForKey:error:]::onceToken, &__block_literal_global_17791);
  objc_msgSend((id)+[VNDetectionprint tensorShapeForKey:error:]::tensorShapes, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else if (a4)
  {
    _unavailableTensorKeyError(v5);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __44__VNDetectionprint_tensorShapeForKey_error___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("VNDetectionprintTensorKeyMixed2");
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6C50]), "initWithBatchNumber:channels:height:width:", 1, 288, 35, 35);
  v7[0] = v0;
  v6[1] = CFSTR("VNDetectionprintTensorKeyMixed6");
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6C50]), "initWithBatchNumber:channels:height:width:", 1, 768, 17, 17);
  v7[1] = v1;
  v6[2] = CFSTR("VNDetectionprintTensorKeyStride8FeatureMap");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6C50]), "initWithBatchNumber:channels:height:width:", 1, 128, 45, 45);
  v7[2] = v2;
  v6[3] = CFSTR("VNDetectionprintTensorKeyStride16FeatureMap");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6C50]), "initWithBatchNumber:channels:height:width:", 1, 168, 23, 23);
  v7[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)+[VNDetectionprint tensorShapeForKey:error:]::tensorShapes;
  +[VNDetectionprint tensorShapeForKey:error:]::tensorShapes = v4;

}

@end
