@implementation BCSChoppedItemIdentifierInfo

+ (BCSChoppedItemIdentifierInfo)newWithLinkItemIdentifier:(int64_t)a3 chopID:
{
  id v5;
  BCSChoppedItemIdentifierInfo *v6;
  BCSChoppedItemIdentifierInfo *v7;

  v5 = a2;
  objc_opt_self();
  v6 = objc_alloc_init(BCSChoppedItemIdentifierInfo);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_itemIdentifier, a2);

    v7->_chopID = a3;
  }
  else
  {

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end
