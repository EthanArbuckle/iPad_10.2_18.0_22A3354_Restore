@implementation HFAccessoryRepresentableTransformItem

+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4
{
  return 0;
}

- (HFAccessoryRepresentable)accessoryRepresentableObject
{
  void *v2;
  void *v3;

  -[HFTransformItem sourceItem](self, "sourceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryRepresentableObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFAccessoryRepresentable *)v3;
}

- (HFHomeKitObject)homeKitObject
{
  void *v2;
  void *v3;

  -[HFTransformItem sourceItem](self, "sourceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeKitObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFHomeKitObject *)v3;
}

@end
