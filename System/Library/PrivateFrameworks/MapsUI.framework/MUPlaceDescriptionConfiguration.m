@implementation MUPlaceDescriptionConfiguration

- (MUPlaceDescriptionConfiguration)initWithTitle:(id)a3 descriptionText:(id)a4 attribution:(id)a5
{
  id v9;
  id v10;
  id v11;
  MUPlaceDescriptionConfiguration *v12;
  MUPlaceDescriptionConfiguration *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MUPlaceDescriptionConfiguration;
  v12 = -[MUPlaceDescriptionConfiguration init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_titleText, a3);
    objc_storeStrong((id *)&v13->_textBlockText, a4);
    objc_storeStrong((id *)&v13->_attribution, a5);
    v13->_showSectionTitle = 1;
  }

  return v13;
}

+ (id)configurationWithEncyclopedicInfo:(id)a3
{
  id v3;
  MUPlaceDescriptionConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  MUPlaceDescriptionConfiguration *v8;

  v3 = a3;
  v4 = [MUPlaceDescriptionConfiguration alloc];
  objc_msgSend(v3, "textBlockTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textBlockText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "encyclopedicAttribution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[MUPlaceDescriptionConfiguration initWithTitle:descriptionText:attribution:](v4, "initWithTitle:descriptionText:attribution:", v5, v6, v7);
  return v8;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)textBlockText
{
  return self->_textBlockText;
}

- (GEOMapItemAttribution)attribution
{
  return self->_attribution;
}

- (BOOL)showSectionTitle
{
  return self->_showSectionTitle;
}

- (void)setShowSectionTitle:(BOOL)a3
{
  self->_showSectionTitle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_textBlockText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end
