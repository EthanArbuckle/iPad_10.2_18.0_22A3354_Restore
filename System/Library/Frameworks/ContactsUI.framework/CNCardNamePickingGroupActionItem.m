@implementation CNCardNamePickingGroupActionItem

- (id)defaultActionURL
{
  return 0;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
