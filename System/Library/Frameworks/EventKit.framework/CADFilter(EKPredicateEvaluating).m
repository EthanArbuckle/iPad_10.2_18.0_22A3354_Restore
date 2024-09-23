@implementation CADFilter(EKPredicateEvaluating)

- (uint64_t)ekPredicateFilterMatches:()EKPredicateEvaluating
{
  void *v0;

  v0 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    -[CADFilter(EKPredicateEvaluating) ekPredicateFilterMatches:].cold.1(v0);
  return 0;
}

- (void)ekPredicateFilterMatches:()EKPredicateEvaluating .cold.1(void *a1)
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1A2318000, v1, OS_LOG_TYPE_ERROR, "Unknown CADFilter subclass: %@", (uint8_t *)&v4, 0xCu);

}

@end
