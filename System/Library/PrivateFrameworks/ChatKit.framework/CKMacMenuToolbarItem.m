@implementation CKMacMenuToolbarItem

- (CKMacMenuToolbarItem)initWithItemIdentifier:(id)a3 menu:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKMacMenuToolbarItem;
  return -[CKMacToolbarItem init](&v5, sel_init, a3, a4);
}

- (void)setMenu:(id)a3
{
  objc_storeStrong((id *)&self->_menu, a3);
}

- (UIMenu)menu
{
  return self->_menu;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menu, 0);
}

@end
