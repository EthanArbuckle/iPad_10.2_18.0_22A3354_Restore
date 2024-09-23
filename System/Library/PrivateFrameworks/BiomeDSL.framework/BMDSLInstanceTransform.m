@implementation BMDSLInstanceTransform

- (BMDSLInstanceTransform)initWithName:(id)a3 version:(unsigned int)a4 transformName:(id)a5
{
  id v8;
  NSString *v9;
  NSString *transformName;
  void *v11;
  char v12;
  BMDSLInstanceTransform *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v23;

  v8 = a5;
  if (a4 != 1)
  {
    __biome_log_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[BMDSLInstanceTransform initWithName:version:transformName:].cold.2(a4, v14);

    goto LABEL_11;
  }
  v23.receiver = self;
  v23.super_class = (Class)BMDSLInstanceTransform;
  self = -[BMDSLBaseCodable initWithName:version:](&v23, sel_initWithName_version_, a3, 1);
  if (self)
  {
    v9 = (NSString *)objc_msgSend(v8, "copy");
    transformName = self->_transformName;
    self->_transformName = v9;

    +[BMDSLTransforms allowedTransforms](BMDSLTransforms, "allowedTransforms");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v8);

    if ((v12 & 1) == 0)
    {
      __biome_log_for_category();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[BMDSLInstanceTransform initWithName:version:transformName:].cold.1((uint64_t)v8, v15, v16, v17, v18, v19, v20, v21);

LABEL_11:
      v13 = 0;
      goto LABEL_12;
    }
  }
  self = self;
  v13 = self;
LABEL_12:

  return v13;
}

- (BMDSLInstanceTransform)initWithSelector:(SEL)a3
{
  void *v4;
  BMDSLInstanceTransform *v5;

  NSStringFromSelector(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BMDSLInstanceTransform initWithName:version:transformName:](self, "initWithName:version:transformName:", CFSTR("transformName"), 1, v4);

  return v5;
}

+ (id)withSelector:(SEL)a3
{
  return -[BMDSLInstanceTransform initWithSelector:]([BMDSLInstanceTransform alloc], "initWithSelector:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BMDSLInstanceTransform;
  v4 = a3;
  -[BMDSLBaseCodable encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[BMDSLInstanceTransform transformName](self, "transformName", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("transformName"));

}

- (BMDSLInstanceTransform)initWithCoder:(id)a3
{
  id v4;
  BMDSLInstanceTransform *v5;
  BMDSLInstanceTransform *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  BMDSLInstanceTransform *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BMDSLInstanceTransform;
  v5 = -[BMDSLBaseCodable initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transformName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[BMDSLTransforms allowedTransforms](BMDSLTransforms, "allowedTransforms");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v7);

    if ((v9 & 1) != 0)
    {
      -[BMDSLBaseCodable name](v6, "name");
      v10 = objc_claimAutoreleasedReturnValue();
      v6 = -[BMDSLInstanceTransform initWithName:version:transformName:](v6, "initWithName:version:transformName:", v10, -[BMDSLBaseCodable version](v6, "version"), v7);
      v11 = v6;
    }
    else
    {
      __biome_log_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[BMDSLInstanceTransform initWithCoder:].cold.1((uint64_t)v7, v10, v12, v13, v14, v15, v16, v17);
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)transformInput:(id)a3 combinedState:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  NSString *v12;
  SEL v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  id v23;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMDSLInstanceTransform.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[input isKindOfClass:[NSArray class]]"));

  }
  if (!-[BMDSLBaseCodable allowsEvaluation](self, "allowsEvaluation"))
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99768];
    v22 = CFSTR("This operation has evaluation disabled.");
    goto LABEL_8;
  }
  +[BMDSLTransforms allowedTransforms](BMDSLTransforms, "allowedTransforms");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDSLInstanceTransform transformName](self, "transformName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "containsObject:", v10);

  if ((v11 & 1) == 0)
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99768];
    v22 = CFSTR("Transform name not in allow list");
LABEL_8:
    objc_msgSend(v20, "exceptionWithName:reason:userInfo:", v21, v22, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  -[BMDSLInstanceTransform transformName](self, "transformName");
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  v13 = NSSelectorFromString(v12);

  v14 = v7;
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "subarrayWithRange:", objc_msgSend(v14, "count") != 0, objc_msgSend(v14, "count") - 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[BMDSLTransformInvocation invokeTransformWithInput:selector:target:](BMDSLTransformInvocation, "invokeTransformWithInput:selector:target:", v16, v13, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSString)transformName
{
  return self->_transformName;
}

- (void)setTransformName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformName, 0);
}

- (void)initWithName:(uint64_t)a3 version:(uint64_t)a4 transformName:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1AEB18000, a2, a3, "Transform name not in allow list for instance transform (%@)", a5, a6, a7, a8, 2u);
}

- (void)initWithName:(int)a1 version:(NSObject *)a2 transformName:.cold.2(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1AEB18000, a2, OS_LOG_TYPE_ERROR, "Unexpected version %u. Failed to initialize BMDSLInstanceTransform", (uint8_t *)v2, 8u);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1AEB18000, a2, a3, "Decoded transform name not in allow list for instance transform (%@)", a5, a6, a7, a8, 2u);
}

@end
