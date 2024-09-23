@implementation AXOnboardingTeachableItemBridge

- (NSString)itemTitle
{
  return self->_itemTitle;
}

- (void)setItemTitle:(id)a3
{
  objc_storeStrong((id *)&self->_itemTitle, a3);
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (void)setItemDescription:(id)a3
{
  objc_storeStrong((id *)&self->_itemDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_itemTitle, 0);
}

@end
