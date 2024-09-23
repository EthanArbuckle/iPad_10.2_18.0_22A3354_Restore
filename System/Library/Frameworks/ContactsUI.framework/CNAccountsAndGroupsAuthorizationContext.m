@implementation CNAccountsAndGroupsAuthorizationContext

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (CNAccountsAndGroupsItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (CNContainerPickerItem)containerItem
{
  return self->_containerItem;
}

- (void)setContainerItem:(id)a3
{
  objc_storeStrong((id *)&self->_containerItem, a3);
}

- (CNAccountsAndGroupsCell)cell
{
  return self->_cell;
}

- (void)setCell:(id)a3
{
  objc_storeStrong((id *)&self->_cell, a3);
}

- (NSArray)contactsToAddToDropDestination
{
  return self->_contactsToAddToDropDestination;
}

- (void)setContactsToAddToDropDestination:(id)a3
{
  objc_storeStrong((id *)&self->_contactsToAddToDropDestination, a3);
}

- (id)actionCompletionHandler
{
  return self->_actionCompletionHandler;
}

- (void)setActionCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionCompletionHandler, 0);
  objc_storeStrong((id *)&self->_contactsToAddToDropDestination, 0);
  objc_storeStrong((id *)&self->_cell, 0);
  objc_storeStrong((id *)&self->_containerItem, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
