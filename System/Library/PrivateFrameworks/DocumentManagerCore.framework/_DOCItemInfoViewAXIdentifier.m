@implementation _DOCItemInfoViewAXIdentifier

+ (id)idBase
{
  return CFSTR("DOC.itemInfoView");
}

+ (NSString)infoContainer
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "idBase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(v2, CFSTR("infoContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)actionsContainer
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "idBase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(v2, CFSTR("actionsContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)levelOfDetailButton
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "idBase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(v2, CFSTR("levelOfDetailButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)metadataRowWithLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "idBase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(CFSTR("metadata"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  composedID(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
