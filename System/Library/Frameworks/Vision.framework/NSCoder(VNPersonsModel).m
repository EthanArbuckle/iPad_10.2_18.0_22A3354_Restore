@implementation NSCoder(VNPersonsModel)

- (id)vn_decodePersonUniqueIdentifierForKey:()VNPersonsModel
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  VNEntityUniqueIdentifierClasses();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodeObjectOfClasses:forKey:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
