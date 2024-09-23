@implementation CALNNotificationIdentifier

+ (id)_constructNotificationIdentifierStringRepresentationFromComponents:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[CALNNotificationIdentifier _constructNotificationIdentifierStringRepresentationFromComponents:].cold.5();

  objc_msgSend(v4, "sourceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceClientIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[CALNNotificationIdentifier _constructNotificationIdentifierStringRepresentationFromComponents:].cold.1();
    goto LABEL_13;
  }
  if (!objc_msgSend(v7, "length"))
  {
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[CALNNotificationIdentifier _constructNotificationIdentifierStringRepresentationFromComponents:].cold.2();
LABEL_13:
    v12 = 0;
    goto LABEL_18;
  }
  objc_msgSend(a1, "_allowedCharacterSetForEncodingNotificationIdentifierComponents");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v7, "stringByAddingPercentEncodingWithAllowedCharacters:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    v15[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR("/"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      +[CALNNotificationIdentifier _constructNotificationIdentifierStringRepresentationFromComponents:].cold.4();

  }
  else
  {
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[CALNNotificationIdentifier _constructNotificationIdentifierStringRepresentationFromComponents:].cold.3();
    v12 = 0;
  }

LABEL_18:
  return v12;
}

+ (id)_deconstructNotificationIdentifierStringRepresentationIntoComponents:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  CALNNotificationIdentifierComponents *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[CALNNotificationIdentifier _deconstructNotificationIdentifierStringRepresentationIntoComponents:].cold.4();

  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("/"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 2)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject stringByRemovingPercentEncoding](v6, "stringByRemovingPercentEncoding");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByRemovingPercentEncoding");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      if (objc_msgSend(v9, "length"))
      {
        v10 = -[CALNNotificationIdentifierComponents initWithSourceIdentifier:sourceClientIdentifier:]([CALNNotificationIdentifierComponents alloc], "initWithSourceIdentifier:sourceClientIdentifier:", v8, v9);
        +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          +[CALNNotificationIdentifier _deconstructNotificationIdentifierStringRepresentationIntoComponents:].cold.3();
        goto LABEL_16;
      }
      +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[CALNNotificationIdentifier _deconstructNotificationIdentifierStringRepresentationIntoComponents:].cold.2();
    }
    else
    {
      +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[CALNNotificationIdentifier _deconstructNotificationIdentifierStringRepresentationIntoComponents:].cold.1();
    }
    v10 = 0;
LABEL_16:

    goto LABEL_17;
  }
  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544130;
    v15 = &unk_24D49BED8;
    v16 = 2114;
    v17 = v12;
    v18 = 2114;
    v19 = v5;
    v20 = 2114;
    v21 = v3;
    _os_log_impl(&dword_215D9B000, v6, OS_LOG_TYPE_DEFAULT, "Cannot deconstruct notification identifier string representation into components since there are an unexpected number of encoded components. Expected encoded component count: %{public}@. Actual encoded component count: %{public}@. Encoded components: %{public}@. String representation: %{public}@.", (uint8_t *)&v14, 0x2Au);

  }
  v10 = 0;
LABEL_17:

  return v10;
}

+ (id)_allowedCharacterSetForEncodingNotificationIdentifierComponents
{
  if (_allowedCharacterSetForEncodingNotificationIdentifierComponents_onceToken != -1)
    dispatch_once(&_allowedCharacterSetForEncodingNotificationIdentifierComponents_onceToken, &__block_literal_global_10);
  return (id)_allowedCharacterSetForEncodingNotificationIdentifierComponents_allowedCharacterSet;
}

void __93__CALNNotificationIdentifier__allowedCharacterSetForEncodingNotificationIdentifierComponents__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(CFSTR("/"), "stringByAppendingString:", CFSTR("%"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", v3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "invertedSet");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_allowedCharacterSetForEncodingNotificationIdentifierComponents_allowedCharacterSet;
  _allowedCharacterSetForEncodingNotificationIdentifierComponents_allowedCharacterSet = v1;

}

- (CALNNotificationIdentifier)initWithSourceIdentifier:(id)a3 sourceClientIdentifier:(id)a4
{
  id v6;
  id v7;
  CALNNotificationIdentifierComponents *v8;
  void *v9;
  CALNNotificationIdentifier *v10;
  NSObject *v11;

  v6 = a3;
  v7 = a4;
  v8 = -[CALNNotificationIdentifierComponents initWithSourceIdentifier:sourceClientIdentifier:]([CALNNotificationIdentifierComponents alloc], "initWithSourceIdentifier:sourceClientIdentifier:", v6, v7);
  objc_msgSend((id)objc_opt_class(), "_constructNotificationIdentifierStringRepresentationFromComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    self = -[CALNNotificationIdentifier initWithSourceIdentifier:sourceClientIdentifier:stringRepresentation:](self, "initWithSourceIdentifier:sourceClientIdentifier:stringRepresentation:", v6, v7, v9);
    v10 = self;
  }
  else
  {
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CALNNotificationIdentifier initWithSourceIdentifier:sourceClientIdentifier:].cold.1();

    v10 = 0;
  }

  return v10;
}

- (CALNNotificationIdentifier)initWithStringRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CALNNotificationIdentifier *v9;
  NSObject *v10;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_deconstructNotificationIdentifierStringRepresentationIntoComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "sourceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sourceClientIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[CALNNotificationIdentifier initWithSourceIdentifier:sourceClientIdentifier:stringRepresentation:](self, "initWithSourceIdentifier:sourceClientIdentifier:stringRepresentation:", v7, v8, v4);

    v9 = self;
  }
  else
  {
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CALNNotificationIdentifier initWithStringRepresentation:].cold.1();

    v9 = 0;
  }

  return v9;
}

- (CALNNotificationIdentifier)initWithSourceIdentifier:(id)a3 sourceClientIdentifier:(id)a4 stringRepresentation:(id)a5
{
  id v8;
  id v9;
  id v10;
  CALNNotificationIdentifier *v11;
  uint64_t v12;
  NSString *sourceIdentifier;
  uint64_t v14;
  NSString *sourceClientIdentifier;
  uint64_t v16;
  NSString *stringRepresentation;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CALNNotificationIdentifier;
  v11 = -[CALNNotificationIdentifier init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    sourceIdentifier = v11->_sourceIdentifier;
    v11->_sourceIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    sourceClientIdentifier = v11->_sourceClientIdentifier;
    v11->_sourceClientIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    stringRepresentation = v11->_stringRepresentation;
    v11->_stringRepresentation = (NSString *)v16;

  }
  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[CALNNotificationIdentifier sourceIdentifier](self, "sourceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[CALNNotificationIdentifier sourceClientIdentifier](self, "sourceClientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[CALNNotificationIdentifier sourceIdentifier](self, "sourceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[CALNNotificationIdentifier isEqualToNotificationIdentifier:](self, "isEqualToNotificationIdentifier:", v4);

  return v5;
}

- (BOOL)isEqualToNotificationIdentifier:(id)a3
{
  CALNNotificationIdentifier *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (CALNNotificationIdentifier *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    -[CALNNotificationIdentifier sourceIdentifier](self, "sourceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNNotificationIdentifier sourceIdentifier](v4, "sourceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CalEqualStrings();

    if (v7
      && (-[CALNNotificationIdentifier sourceClientIdentifier](self, "sourceClientIdentifier"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          -[CALNNotificationIdentifier sourceClientIdentifier](v4, "sourceClientIdentifier"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = CalEqualStrings(),
          v9,
          v8,
          v10))
    {
      -[CALNNotificationIdentifier stringRepresentation](self, "stringRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CALNNotificationIdentifier stringRepresentation](v4, "stringRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CalEqualStrings();

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CALNNotificationIdentifier sourceIdentifier](self, "sourceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationIdentifier sourceClientIdentifier](self, "sourceClientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNNotificationIdentifier stringRepresentation](self, "stringRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>(sourceIdentifier = %@, sourceClientIdentifier = %@, stringRepresentation = %@)"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (NSString)sourceClientIdentifier
{
  return self->_sourceClientIdentifier;
}

- (NSString)stringRepresentation
{
  return self->_stringRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringRepresentation, 0);
  objc_storeStrong((id *)&self->_sourceClientIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
}

+ (void)_constructNotificationIdentifierStringRepresentationFromComponents:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Cannot construct notification identifier string representation from components since source identifier is an empty string. Components: %{public}@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_constructNotificationIdentifierStringRepresentationFromComponents:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Cannot construct notification identifier string representation from components since source client identifier is an empty string. Components: %{public}@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_constructNotificationIdentifierStringRepresentationFromComponents:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Cannot construct notification identifier string representation from components since source identifier could not be encoded. Components: %{public}@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_constructNotificationIdentifierStringRepresentationFromComponents:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_3(&dword_215D9B000, v0, v1, "Constructed notification identifier string representation from components. String representation: %{public}@. Components: %{public}@.");
  OUTLINED_FUNCTION_1_0();
}

+ (void)_constructNotificationIdentifierStringRepresentationFromComponents:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_215D9B000, v0, v1, "Constructing notification identifier string representation from components: %{public}@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_deconstructNotificationIdentifierStringRepresentationIntoComponents:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Cannot deconstruct notification identifier string representation into components since source identifier is an empty string. String representation: %{public}@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_deconstructNotificationIdentifierStringRepresentationIntoComponents:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Cannot deconstruct notification identifier string representation into components since source client identifier is an empty string. String representation: %{public}@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_deconstructNotificationIdentifierStringRepresentationIntoComponents:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_3(&dword_215D9B000, v0, v1, "Deconstructed notification identifier string representation into components. String representation: %{public}@. Components: %{public}@.");
  OUTLINED_FUNCTION_1_0();
}

+ (void)_deconstructNotificationIdentifierStringRepresentationIntoComponents:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_215D9B000, v0, v1, "Deconstructing notification identifier string representation into components. String representation: %{public}@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithSourceIdentifier:sourceClientIdentifier:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_215D9B000, v0, OS_LOG_TYPE_ERROR, "Cannot initialize notification identifier with source client identifier and source client identifier because a string representation could not be constructed. Source identifier: %{public}@. Source Client identifier: %{public}@.", v1, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithStringRepresentation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Cannot initialize notification identifier with string representation because string representation could not be deconstructed into components. String representation: %{public}@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
