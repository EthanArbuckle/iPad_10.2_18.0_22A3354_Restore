@implementation NSSet(HMFoundation)

- (BOOL)hmf_isEmpty
{
  return objc_msgSend(a1, "count") == 0;
}

- (id)privateDescription
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "allObjects");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "privateDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)shortDescription
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "allObjects");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "shortDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (NSString)shortDescription
{
  objc_class *v0;

  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

- (void)hmf_enumerateWithAutoreleasePoolUsingBlock:()HMFoundation
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__NSSet_HMFoundation__hmf_enumerateWithAutoreleasePoolUsingBlock___block_invoke;
  v6[3] = &unk_1E3B396A8;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v6);

}

@end
