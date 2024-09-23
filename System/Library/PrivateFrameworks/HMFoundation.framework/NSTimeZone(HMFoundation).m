@implementation NSTimeZone(HMFoundation)

+ (id)hmf_unarchiveFromData:()HMFoundation error:
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CB3710];
  v6 = a3;
  objc_msgSend(v5, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
