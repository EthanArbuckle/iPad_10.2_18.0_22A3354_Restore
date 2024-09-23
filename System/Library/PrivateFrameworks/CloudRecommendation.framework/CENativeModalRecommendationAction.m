@implementation CENativeModalRecommendationAction

- (CENativeModalRecommendationAction)initWithIdentifier:(id)a3 title:(id)a4 detailControllerClass:(Class)a5
{
  CENativeModalRecommendationAction *v6;
  CENativeModalRecommendationAction *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CENativeModalRecommendationAction;
  v6 = -[CERecommendationAction initWithIdentifier:actionTitle:actionType:](&v9, sel_initWithIdentifier_actionTitle_actionType_, a3, a4, CFSTR("NativeModal"));
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_detailControllerClass, a5);
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CENativeModalRecommendationAction;
  v4 = a3;
  -[CERecommendationAction encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  NSStringFromClass(self->_detailControllerClass);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("viewControllerClass"), v6.receiver, v6.super_class);

}

- (CENativeModalRecommendationAction)initWithCoder:(id)a3
{
  id v4;
  CENativeModalRecommendationAction *v5;
  NSString *v6;
  uint64_t v7;
  Class detailControllerClass;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CENativeModalRecommendationAction;
  v5 = -[CERecommendationAction initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("viewControllerClass"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    detailControllerClass = v5->_detailControllerClass;
    v5->_detailControllerClass = (Class)v7;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CENativeModalRecommendationAction;
  v4 = -[CERecommendationAction copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setDetailControllerClass:", self->_detailControllerClass);
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CENativeModalRecommendationAction;
  -[CERecommendationAction description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" detailControllerClass: %@"), self->_detailControllerClass);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (Class)detailControllerClass
{
  return self->_detailControllerClass;
}

- (void)setDetailControllerClass:(Class)a3
{
  objc_storeStrong((id *)&self->_detailControllerClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailControllerClass, 0);
}

@end
