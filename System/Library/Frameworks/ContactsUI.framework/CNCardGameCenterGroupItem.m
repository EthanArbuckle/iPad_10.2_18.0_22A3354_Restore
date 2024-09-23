@implementation CNCardGameCenterGroupItem

- (CNCardGameCenterGroupItem)initWithRelationshipResult:(id)a3
{
  id v5;
  CNCardGameCenterGroupItem *v6;
  CNCardGameCenterGroupItem *v7;
  CNCardGameCenterGroupItem *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNCardGameCenterGroupItem;
  v6 = -[CNCardGameCenterGroupItem init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_relationshipResult, a3);
    v8 = v7;
  }

  return v7;
}

- (GKContactRelationshipResult)relationshipResult
{
  return self->_relationshipResult;
}

- (void)setRelationshipResult:(id)a3
{
  objc_storeStrong((id *)&self->_relationshipResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationshipResult, 0);
}

@end
