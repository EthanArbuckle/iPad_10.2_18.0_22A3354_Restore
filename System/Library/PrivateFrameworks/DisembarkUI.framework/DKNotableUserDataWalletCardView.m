@implementation DKNotableUserDataWalletCardView

- (DKNotableUserDataWalletCardView)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5
{
  DKNotableUserDataWalletCardView *v5;
  uint64_t v6;
  NSMutableDictionary *featureCardCellMap;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DKNotableUserDataWalletCardView;
  v5 = -[DKNotableUserDataCardView initWithTitle:subtitle:icon:](&v9, sel_initWithTitle_subtitle_icon_, a3, a4, a5);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    featureCardCellMap = v5->_featureCardCellMap;
    v5->_featureCardCellMap = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (void)addCardCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DKNotableUserDataWalletCardView featureCardCellMap](self, "featureCardCellMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, v7);

  }
  v8.receiver = self;
  v8.super_class = (Class)DKNotableUserDataWalletCardView;
  -[DKNotableUserDataCardView addCardCell:](&v8, sel_addCardCell_, v4);

}

- (CGSize)setupAssistantCredentialCardArtSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 40.0;
  v3 = 40.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setupAssistantCredentialUpdatedCardArt:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[DKNotableUserDataWalletCardView featureCardCellMap](self, "featureCardCellMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "accessoryView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "passSnapshot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v8);

  }
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
