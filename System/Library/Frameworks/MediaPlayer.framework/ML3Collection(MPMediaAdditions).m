@implementation ML3Collection(MPMediaAdditions)

+ (id)propertyForMPMediaEntityProperty:()MPMediaAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  if (propertyForMPMediaEntityProperty__once_4 != -1)
    dispatch_once(&propertyForMPMediaEntityProperty__once_4, &__block_literal_global_5);
  objc_msgSend((id)propertyForMPMediaEntityProperty__ML3ForMP_3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&off_1EE35CE00;
    objc_msgSendSuper2(&v10, sel_propertyForMPMediaEntityProperty_, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

@end
