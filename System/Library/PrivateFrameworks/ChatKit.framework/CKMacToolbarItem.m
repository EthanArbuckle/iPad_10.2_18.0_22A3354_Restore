@implementation CKMacToolbarItem

- (CKMacToolbarItem)init
{
  CKMacToolbarItem *v2;
  CKMacToolbarItem *v3;
  NSString *itemIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKMacToolbarItem;
  v2 = -[CKMacToolbarItem init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    itemIdentifier = v2->_itemIdentifier;
    v2->_itemIdentifier = (NSString *)&stru_1E276D870;

  }
  return v3;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end
