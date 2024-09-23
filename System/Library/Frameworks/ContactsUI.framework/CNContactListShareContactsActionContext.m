@implementation CNContactListShareContactsActionContext

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_groupName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupName, 0);
}

@end
