@implementation IMScheduledSectionDateChatItem(CKChatItems)

- (uint64_t)__ck_chatItemClass
{
  return objc_opt_class();
}

- (uint64_t)hash
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hash");

  return v2;
}

- (uint64_t)isEqualToScheduledDateChatItem:()CKChatItems
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "isEqualToDate:", v6);
  return v7;
}

- (uint64_t)isEqual:()CKChatItems
{
  id v4;
  uint64_t v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(a1, "isEqualToScheduledDateChatItem:", v4);
  else
    v5 = 0;

  return v5;
}

@end
