@implementation AVCustomMenuItemButton

- (NSString)menuElementIdentifier
{
  return self->_menuElementIdentifier;
}

- (void)setMenuElementIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_menuElementIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuElementIdentifier, 0);
}

@end
