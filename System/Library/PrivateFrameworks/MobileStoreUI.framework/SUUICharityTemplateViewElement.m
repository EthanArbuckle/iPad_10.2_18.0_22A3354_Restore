@implementation SUUICharityTemplateViewElement

- (SUUICharityTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUICharityTemplateViewElement *v9;
  uint64_t v10;
  NSString *campaignIdentifier;
  uint64_t v12;
  NSString *charityMetadataURLString;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUICharityTemplateViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v15, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("campaignID"));
    v10 = objc_claimAutoreleasedReturnValue();
    campaignIdentifier = v9->_campaignIdentifier;
    v9->_campaignIdentifier = (NSString *)v10;

    objc_msgSend(v8, "getAttribute:", CFSTR("src"));
    v12 = objc_claimAutoreleasedReturnValue();
    charityMetadataURLString = v9->_charityMetadataURLString;
    v9->_charityMetadataURLString = (NSString *)v12;

  }
  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUICharityTemplateViewElement *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *campaignIdentifier;
  NSString *v9;
  NSString *charityMetadataURLString;
  objc_super v12;

  v4 = (SUUICharityTemplateViewElement *)a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUICharityTemplateViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v12, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    -[SUUICharityTemplateViewElement campaignIdentifier](v4, "campaignIdentifier");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    campaignIdentifier = self->_campaignIdentifier;
    self->_campaignIdentifier = v7;

    -[SUUICharityTemplateViewElement charityMetadataURLString](v4, "charityMetadataURLString");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    charityMetadataURLString = self->_charityMetadataURLString;
    self->_charityMetadataURLString = v9;

  }
  return v6;
}

- (NSString)campaignIdentifier
{
  return self->_campaignIdentifier;
}

- (NSString)charityMetadataURLString
{
  return self->_charityMetadataURLString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_charityMetadataURLString, 0);
  objc_storeStrong((id *)&self->_campaignIdentifier, 0);
}

@end
