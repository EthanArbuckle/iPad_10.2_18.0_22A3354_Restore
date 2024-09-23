@implementation NSString(AuthKit)

+ (id)ak_base64EncodedJsonFromObject:()AuthKit
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v8;

  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a3, 0, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v4)
  {
    _AKLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[NSString(AuthKit) ak_base64EncodedJsonFromObject:].cold.1((uint64_t)v4, v5);

    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "base64EncodedStringWithOptions:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)ak_truncatedCopy
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = (void *)objc_msgSend(a1, "copy");
  if ((unint64_t)objc_msgSend(v1, "length") >= 7)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v1, "substringToIndex:", 6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("%@..."), v3);
    v4 = objc_claimAutoreleasedReturnValue();

    v1 = (void *)v4;
  }
  return v1;
}

- (id)ak_stringByZeroPaddingOccurencesOfString:()AuthKit
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("​%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)ak_safeBase64String
{
  void *v2;
  char v3;
  id v4;
  NSObject *v5;

  if (objc_msgSend(a1, "length")
    && (objc_msgSend(a1, "substringFromIndex:", objc_msgSend(a1, "length") - 1),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("=")),
        v2,
        (v3 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=="), a1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    _AKLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[NSString(AuthKit) ak_safeBase64String].cold.1((uint64_t)v4, v5);

  }
  else
  {
    v4 = a1;
  }
  return v4;
}

- (id)ak_numberObject
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v2, "setNumberStyle:", 1);
  objc_msgSend(v2, "numberFromString:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)ak_isEmailAddress
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF MATCHES %@"), CFSTR("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "evaluateWithObject:", a1);

  return v3;
}

+ (void)ak_base64EncodedJsonFromObject:()AuthKit .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19202F000, a2, OS_LOG_TYPE_ERROR, "Error converting object to json string: %@", (uint8_t *)&v2, 0xCu);
}

- (void)ak_safeBase64String
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138477827;
  v3 = a1;
  _os_log_debug_impl(&dword_19202F000, a2, OS_LOG_TYPE_DEBUG, "Adding padding to the string: %{private}@", (uint8_t *)&v2, 0xCu);
}

@end
