@implementation DAButtonSwitchSpecification

- (DAButtonSwitchSpecification)initWithDictionary:(id)a3
{
  id v4;
  DAButtonSwitchSpecification *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  void *v10;
  double v11;
  CGFloat v12;
  void *v13;
  double v14;
  CGFloat v15;
  void *v16;
  double v17;
  CGFloat v18;
  DAAsset *v19;
  void *v20;
  DAAsset *v21;
  DAAsset *asset;
  BOOL v23;
  objc_super v25;
  char v26;

  v4 = a3;
  v26 = 0;
  v25.receiver = self;
  v25.super_class = (Class)DAButtonSwitchSpecification;
  v5 = -[DASpecification initWithDictionary:](&v25, "initWithDictionary:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_dictionaryFromRequiredKey:failed:", CFSTR("position"), &v26));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("x"), &off_1000112B0, &off_1000112A0, &v26));
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("y"), &off_1000112B0, &off_1000112A0, &v26));
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("w"), &off_1000112B0, &off_1000112A0, &v26));
    objc_msgSend(v13, "doubleValue");
    v15 = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("h"), &off_1000112B0, &off_1000112A0, &v26));
    objc_msgSend(v16, "doubleValue");
    v18 = v17;

    v5->_position.origin.x = v9;
    v5->_position.origin.y = v12;
    v5->_position.size.width = v15;
    v5->_position.size.height = v18;
    v19 = [DAAsset alloc];
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_dictionaryFromRequiredKey:failed:", CFSTR("asset"), &v26));
    v21 = -[DAAsset initWithDictionary:](v19, "initWithDictionary:", v20);
    asset = v5->_asset;
    v5->_asset = v21;

    v23 = v26 == 0;
  }
  else
  {
    v23 = 1;
  }
  if (!v5->_asset || !v23)
  {

    v5 = 0;
  }

  return v5;
}

- (CGRect)position
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_position.origin.x;
  y = self->_position.origin.y;
  width = self->_position.size.width;
  height = self->_position.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPosition:(CGRect)a3
{
  self->_position = a3;
}

- (DAAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
