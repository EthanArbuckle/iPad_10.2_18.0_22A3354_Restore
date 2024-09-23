@implementation EKDirectoryGroup

+ (id)recordFromSearchResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___EKDirectoryGroup;
  v3 = a3;
  objc_msgSendSuper2(&v7, sel_recordFromSearchResult_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "principalPath", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setPrincipalPath:", v5);
  return v4;
}

@end
