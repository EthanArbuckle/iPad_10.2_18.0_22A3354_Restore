@implementation SFActionableSecurityRecommendationCellID

- (SFActionableSecurityRecommendationCellID)initWithCellType:(id)a3
{
  id v5;
  SFActionableSecurityRecommendationCellID *v6;
  SFActionableSecurityRecommendationCellID *v7;
  SFActionableSecurityRecommendationCellID *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFActionableSecurityRecommendationCellID;
  v6 = -[SFActionableSecurityRecommendationCellID init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_cellType, a3);
    v8 = v7;
  }

  return v7;
}

- (id)cellType
{
  return self->_cellType;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cellType, 0);
}

@end
