@implementation CKGroupUpdateBannerView

- (CKGroupUpdateBannerView)init
{
  CKGroupUpdateBannerView *v2;
  CKGroupUpdateBannerView *v3;
  NSArray *groupUpdates;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKGroupUpdateBannerView;
  v2 = -[CKGroupUpdateBannerView init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    groupUpdates = v2->_groupUpdates;
    v2->_groupUpdates = (NSArray *)MEMORY[0x1E0C9AA60];

    v3->_updateBannerType = 0;
  }
  return v3;
}

- (NSArray)groupUpdates
{
  return self->_groupUpdates;
}

- (void)setGroupUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_groupUpdates, a3);
}

- (int64_t)updateBannerType
{
  return self->_updateBannerType;
}

- (void)setUpdateBannerType:(int64_t)a3
{
  self->_updateBannerType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupUpdates, 0);
}

@end
