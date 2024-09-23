@implementation BuddyExpressWalletFeatureCardView

- (BuddyExpressWalletFeatureCardView)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5
{
  id v7;
  BuddyExpressWalletFeatureCardView *v8;
  id v9;
  void *v10;
  BuddyExpressWalletFeatureCardView *v11;
  objc_super v13;
  id v14;
  id v15;
  id location[2];
  id v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = 0;
  objc_storeStrong(&v14, a5);
  v7 = v17;
  v17 = 0;
  v13.receiver = v7;
  v13.super_class = (Class)BuddyExpressWalletFeatureCardView;
  v8 = -[BuddyExpressSetupFeatureCardView initWithTitle:subtitle:icon:](&v13, "initWithTitle:subtitle:icon:", location[0], v15, v14);
  v17 = v8;
  objc_storeStrong(&v17, v8);
  if (v8)
  {
    v9 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    v10 = (void *)*((_QWORD *)v17 + 7);
    *((_QWORD *)v17 + 7) = v9;

  }
  v11 = (BuddyExpressWalletFeatureCardView *)v17;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v17, 0);
  return v11;
}

- (void)addCardCell:(id)a3
{
  id v3;
  id v4;
  NSMutableDictionary *v5;
  id v6;
  objc_super v7;
  id location[2];
  BuddyExpressWalletFeatureCardView *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend(location[0], "uniqueIdentifier");

  if (v3)
  {
    v4 = location[0];
    v5 = -[BuddyExpressWalletFeatureCardView featureCardCellMap](v9, "featureCardCellMap");
    v6 = objc_msgSend(location[0], "uniqueIdentifier");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v4, v6);

  }
  v7.receiver = v9;
  v7.super_class = (Class)BuddyExpressWalletFeatureCardView;
  -[BuddyExpressSetupFeatureCardView addCardCell:](&v7, "addCardCell:", location[0]);
  objc_storeStrong(location, 0);
}

- (CGSize)setupAssistantCredentialCardArtSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = sub_100096244();
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setupAssistantCredentialUpdatedCardArt:(id)a3
{
  NSMutableDictionary *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id location[2];
  BuddyExpressWalletFeatureCardView *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyExpressWalletFeatureCardView featureCardCellMap](v9, "featureCardCellMap");
  v4 = objc_msgSend(location[0], "uniqueIdentifier");
  v7 = -[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v4);

  if (v7)
  {
    v5 = objc_msgSend(v7, "accessoryView");
    v6 = objc_msgSend(location[0], "passSnapshot");
    objc_msgSend(v5, "setImage:", v6);

  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (NSMutableDictionary)featureCardCellMap
{
  return self->_featureCardCellMap;
}

- (void)setFeatureCardCellMap:(id)a3
{
  objc_storeStrong((id *)&self->_featureCardCellMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureCardCellMap, 0);
}

@end
