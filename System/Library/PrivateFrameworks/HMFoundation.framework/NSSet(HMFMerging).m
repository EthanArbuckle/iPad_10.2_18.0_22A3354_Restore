@implementation NSSet(HMFMerging)

- (id)hmf_removedObjectsFromSet:()HMFMerging
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "minusSet:", v4);

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

- (id)hmf_addedObjectsFromSet:()HMFMerging
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v4, "minusSet:", a1);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (id)hmf_commonObjectsFromSet:()HMFMerging
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "intersectSet:", v4);

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

@end
