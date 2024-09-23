@implementation CRSDashboardFocusableItem

- (CRSDashboardFocusableItem)init
{
  CRSDashboardFocusableItem *v2;
  uint64_t v3;
  NSUUID *identifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRSDashboardFocusableItem;
  v2 = -[CRSDashboardFocusableItem init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;

  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRSDashboardFocusableItem)initWithFocusableView:(id)a3
{
  id v4;
  CRSDashboardFocusableItem *v5;
  CRSDashboardFocusableItem *v6;
  uint64_t v7;
  NSUUID *identifier;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRSDashboardFocusableItem;
  v5 = -[CRSDashboardFocusableItem init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_focusProvidingItem, v4);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSUUID *)v7;

  }
  return v6;
}

- (CRSDashboardFocusableItem)initWithCoder:(id)a3
{
  id v4;
  CRSDashboardFocusableItem *v5;
  uint64_t v6;
  NSUUID *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRSDashboardFocusableItem;
  v5 = -[CRSDashboardFocusableItem init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("frameInWindow"));
    -[CRSDashboardFocusableItem setFrameInWindow:](v5, "setFrameInWindow:");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("focusableIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CRSDashboardFocusableItem identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("focusableIdentifier"));

  -[CRSDashboardFocusableItem frameInWindow](self, "frameInWindow");
  objc_msgSend(v5, "encodeCGRect:forKey:", CFSTR("frameInWindow"));

}

- (CGRect)frameInWindow
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frameInWindow.origin.x;
  y = self->_frameInWindow.origin.y;
  width = self->_frameInWindow.size.width;
  height = self->_frameInWindow.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrameInWindow:(CGRect)a3
{
  self->_frameInWindow = a3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (CRSUIDashboardFocusableItemProviding)focusProvidingItem
{
  return (CRSUIDashboardFocusableItemProviding *)objc_loadWeakRetained((id *)&self->_focusProvidingItem);
}

- (void)setFocusProvidingItem:(id)a3
{
  objc_storeWeak((id *)&self->_focusProvidingItem, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_focusProvidingItem);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
