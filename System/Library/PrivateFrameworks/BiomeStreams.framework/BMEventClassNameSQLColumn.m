@implementation BMEventClassNameSQLColumn

id __BMEventClassNameSQLColumn_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  objc_class *v3;
  void *v4;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
