@implementation EncryptionTransformer

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

- (id)transformedValue:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  if (!v3)
  {
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logHandleForDomain:", "ch.encrypttransform");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[EncryptionTransformer transformedValue:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    goto LABEL_7;
  }
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v4;
}

- (id)reverseTransformedValue:(id)a3
{
  id v3;
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a3;
  if (!v3)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logHandleForDomain:", "ch.encrypttransform");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[EncryptionTransformer reverseTransformedValue:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    goto LABEL_7;
  }
  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = v3;
  v6 = [v4 alloc];
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");

  v10 = (void *)objc_msgSend(v6, "initWithBytes:length:encoding:", v8, v9, 4);
LABEL_8:

  return v10;
}

- (void)transformedValue:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, a1, a3, "Encryption transformation is only available for NSString", a5, a6, a7, a8, 0);
}

- (void)reverseTransformedValue:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, a1, a3, "Encryption reverse transformation is only available for NSData", a5, a6, a7, a8, 0);
}

@end
