@implementation CSQuickActionsComponent

- (CSQuickActionsComponent)init
{
  CSQuickActionsComponent *v2;
  CSQuickActionsComponent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSQuickActionsComponent;
  v2 = -[CSComponent init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CSComponent setType:](v2, "setType:", 14);
    -[CSQuickActionsComponent setSuppressVisibleChanges:](v3, "setSuppressVisibleChanges:", 0x7FFFFFFFFFFFFFFFLL);
  }
  return v3;
}

- (id)suppressVisibleChanges:(int64_t)a3
{
  -[CSQuickActionsComponent setSuppressVisibleChanges:](self, "setSuppressVisibleChanges:", a3);
  return self;
}

- (void)setSuppressVisibleChanges:(int64_t)a3
{
  if (-[CSComponent flag](self, "flag") != a3)
    -[CSComponent setFlag:](self, "setFlag:", a3);
}

@end
