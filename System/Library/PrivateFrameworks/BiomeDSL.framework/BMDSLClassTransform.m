@implementation BMDSLClassTransform

- (BMDSLClassTransform)initWithName:(id)a3 version:(unsigned int)a4 className:(id)a5 transformName:(id)a6
{
  id v10;
  id v11;
  BMDSLClassTransform *v12;
  uint64_t v13;
  NSString *className;
  uint64_t v15;
  NSString *transformName;
  BMDSLClassTransform *v17;
  NSObject *v18;
  objc_super v20;

  v10 = a5;
  v11 = a6;
  if (a4 == 1)
  {
    v20.receiver = self;
    v20.super_class = (Class)BMDSLClassTransform;
    v12 = -[BMDSLBaseCodable initWithName:version:](&v20, sel_initWithName_version_, a3, 1);
    if (v12)
    {
      v13 = objc_msgSend(v10, "copy");
      className = v12->_className;
      v12->_className = (NSString *)v13;

      v15 = objc_msgSend(v11, "copy");
      transformName = v12->_transformName;
      v12->_transformName = (NSString *)v15;

    }
    self = v12;
    v17 = self;
  }
  else
  {
    __biome_log_for_category();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[BMDSLClassTransform initWithName:version:className:transformName:].cold.1(a4, v18);

    v17 = 0;
  }

  return v17;
}

- (BMDSLClassTransform)initWithClassName:(id)a3 transformName:(id)a4
{
  return -[BMDSLClassTransform initWithName:version:className:transformName:](self, "initWithName:version:className:transformName:", CFSTR("transformName"), 1, a3, a4);
}

- (BMDSLClassTransform)initWithClassName:(id)a3 selector:(SEL)a4
{
  id v6;
  void *v7;
  BMDSLClassTransform *v8;

  v6 = a3;
  NSStringFromSelector(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BMDSLClassTransform initWithClassName:transformName:](self, "initWithClassName:transformName:", v6, v7);

  return v8;
}

+ (id)withClassName:(id)a3 selector:(SEL)a4
{
  id v5;
  BMDSLClassTransform *v6;

  v5 = a3;
  v6 = -[BMDSLClassTransform initWithClassName:selector:]([BMDSLClassTransform alloc], "initWithClassName:selector:", v5, a4);

  return v6;
}

+ (id)withClassName:(id)a3 transformName:(id)a4
{
  id v5;
  id v6;
  BMDSLClassTransform *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[BMDSLClassTransform initWithClassName:transformName:]([BMDSLClassTransform alloc], "initWithClassName:transformName:", v6, v5);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BMDSLClassTransform;
  -[BMDSLBaseCodable encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[BMDSLClassTransform className](self, "className");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[BMDSLClassTransform className](self, "className");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("className"));

  }
  -[BMDSLClassTransform transformName](self, "transformName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("transformName"));

}

- (BMDSLClassTransform)initWithCoder:(id)a3
{
  id v4;
  BMDSLClassTransform *v5;
  BMDSLClassTransform *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  Class v11;
  objc_class *v12;
  NSObject *v13;
  void *v14;
  char v15;
  const char *v16;
  NSObject *v17;
  BMDSLClassTransform *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)BMDSLClassTransform;
  v5 = -[BMDSLBaseCodable initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("className"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[BMDSLTransforms allowedClasses](BMDSLTransforms, "allowedClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v7);

    if ((v9 & 1) != 0)
    {
      v10 = objc_retainAutorelease(v7);
      v11 = objc_lookUpClass((const char *)objc_msgSend(v10, "UTF8String"));
      if (v11)
      {
        v12 = v11;
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transformName"));
        v13 = objc_claimAutoreleasedReturnValue();
        +[BMDSLTransforms allowedTransforms](BMDSLTransforms, "allowedTransforms");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "containsObject:", v13);

        if ((v15 & 1) != 0)
        {
          v16 = NSSelectorFromString((NSString *)&v13->isa);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            if (class_getClassMethod(v12, v16))
            {
              -[BMDSLBaseCodable name](v6, "name");
              v17 = objc_claimAutoreleasedReturnValue();
              v6 = -[BMDSLClassTransform initWithName:version:className:transformName:](v6, "initWithName:version:className:transformName:", v17, -[BMDSLBaseCodable version](v6, "version"), v10, v13);
              v18 = v6;
LABEL_21:

              goto LABEL_22;
            }
            __biome_log_for_category();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
              -[BMDSLClassTransform initWithCoder:].cold.2();
          }
          else
          {
            __biome_log_for_category();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
              -[BMDSLClassTransform initWithCoder:].cold.3();
          }
        }
        else
        {
          __biome_log_for_category();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
            -[BMDSLClassTransform initWithCoder:].cold.4();
        }
        v18 = 0;
        goto LABEL_21;
      }
      __biome_log_for_category();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[BMDSLClassTransform initWithCoder:].cold.1();
    }
    else
    {
      __biome_log_for_category();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[BMDSLClassTransform initWithCoder:].cold.5();
    }
    v18 = 0;
LABEL_22:

    goto LABEL_23;
  }
  v18 = 0;
LABEL_23:

  return v18;
}

- (id)transformInput:(id)a3 combinedState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  NSString *v14;
  Class v15;
  NSString *v16;
  SEL v17;
  void *v18;
  NSObject *v19;
  id v21;

  v6 = a3;
  v7 = a4;
  if (!-[BMDSLBaseCodable allowsEvaluation](self, "allowsEvaluation"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("This operation has evaluation disabled."), 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  +[BMDSLTransforms allowedClasses](BMDSLTransforms, "allowedClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDSLClassTransform className](self, "className");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "containsObject:", v9);

  if ((v10 & 1) == 0)
  {
    __biome_log_for_category();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[BMDSLClassTransform transformInput:combinedState:].cold.2(self, v19);
    goto LABEL_9;
  }
  +[BMDSLTransforms allowedTransforms](BMDSLTransforms, "allowedTransforms");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDSLClassTransform transformName](self, "transformName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "containsObject:", v12);

  if ((v13 & 1) == 0)
  {
    __biome_log_for_category();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[BMDSLClassTransform transformInput:combinedState:].cold.1(self, v19);
LABEL_9:

    v18 = 0;
    goto LABEL_10;
  }
  -[BMDSLClassTransform className](self, "className");
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  v15 = NSClassFromString(v14);

  -[BMDSLClassTransform transformName](self, "transformName");
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  v17 = NSSelectorFromString(v16);

  +[BMDSLTransformInvocation invokeTransformWithInput:selector:target:](BMDSLTransformInvocation, "invokeTransformWithInput:selector:target:", v6, v17, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v18;
}

- (NSString)className
{
  return self->_className;
}

- (void)setClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)transformName
{
  return self->_transformName;
}

- (void)setTransformName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformName, 0);
  objc_storeStrong((id *)&self->_className, 0);
}

- (void)initWithName:(int)a1 version:(NSObject *)a2 className:transformName:.cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1AEB18000, a2, OS_LOG_TYPE_ERROR, "Unexpected version %u. Failed to initialize BMDSLClassTransform", (uint8_t *)v2, 8u);
}

- (void)initWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1AEB18000, v0, v1, "%@ is an unknown class.", v2);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_1(&dword_1AEB18000, v0, v1, "Unable to get method for realized class. (%@, %@)");
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_1(&dword_1AEB18000, v0, v1, "%@ does not respond to selector %@");
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1AEB18000, v0, v1, "Transform name not in allow list %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1AEB18000, v0, v1, "Class name not in allow list %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)transformInput:(void *)a1 combinedState:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "transformName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1AEB18000, a2, v4, "Transform name not in allow list %@", v5);

  OUTLINED_FUNCTION_5_0();
}

- (void)transformInput:(void *)a1 combinedState:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "className");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1AEB18000, a2, v4, "Class name not in allow list %@", v5);

  OUTLINED_FUNCTION_5_0();
}

@end
