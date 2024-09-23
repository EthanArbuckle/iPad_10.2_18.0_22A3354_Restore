@implementation FCJSONValidValueClasses

id __FCJSONValidValueClasses_block_invoke()
{
  if (qword_1ED0F88D0 != -1)
    dispatch_once(&qword_1ED0F88D0, &__block_literal_global_2_3);
  return (id)_MergedGlobals_220;
}

void __FCJSONValidValueClasses_block_invoke_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1E0C99D20];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  objc_msgSend(v0, "arrayWithObjects:", v1, v2, objc_opt_class(), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_MergedGlobals_220;
  _MergedGlobals_220 = v3;

}

@end
