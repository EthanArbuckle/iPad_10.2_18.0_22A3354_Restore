@implementation CKAppStripLayoutAttributes

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  id v7;
  int v8;
  uint64_t v9;
  objc_super v11;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = v4;
    v8 = objc_msgSend(v7, "showsBorder");
    if (v8 == -[CKAppStripLayoutAttributes showsBorder](self, "showsBorder")
      && (v9 = objc_msgSend(v7, "appStripSize"), v9 == -[CKAppStripLayoutAttributes appStripSize](self, "appStripSize")))
    {
      v11.receiver = self;
      v11.super_class = (Class)CKAppStripLayoutAttributes;
      v6 = -[UICollectionViewLayoutAttributes isEqual:](&v11, sel_isEqual_, v7);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKAppStripLayoutAttributes;
  v4 = -[UICollectionViewLayoutAttributes copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setShowsBorder:", -[CKAppStripLayoutAttributes showsBorder](self, "showsBorder"));
  objc_msgSend(v4, "setAppStripSize:", -[CKAppStripLayoutAttributes appStripSize](self, "appStripSize"));
  return v4;
}

- (int64_t)appStripSize
{
  return self->_appStripSize;
}

- (void)setAppStripSize:(int64_t)a3
{
  self->_appStripSize = a3;
}

- (BOOL)showsBorder
{
  return self->_showsBorder;
}

- (void)setShowsBorder:(BOOL)a3
{
  self->_showsBorder = a3;
}

@end
