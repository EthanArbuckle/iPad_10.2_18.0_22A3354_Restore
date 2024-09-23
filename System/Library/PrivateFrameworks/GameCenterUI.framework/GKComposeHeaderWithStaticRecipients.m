@implementation GKComposeHeaderWithStaticRecipients

- (void)setRecipientNameStrings:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_recipientNameStrings != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_recipientNameStrings, a3);
    -[GKComposeHeaderWithStaticRecipients setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  float v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  objc_super v10;

  -[GKComposeHeaderWithStaticRecipients recipientNameStrings](self, "recipientNameStrings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKComposeHeaderField valueFrame](self, "valueFrame");
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0D25B28], "textStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "composeFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = v5;
  objc_msgSend(v3, "_gkCommaSeparatedRecipientListWithWidth:forTextStyle:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKComposeHeaderField setValueText:](self, "setValueText:", v9);

  v10.receiver = self;
  v10.super_class = (Class)GKComposeHeaderWithStaticRecipients;
  -[GKComposeHeaderWithStaticRecipients layoutSubviews](&v10, sel_layoutSubviews);
}

- (NSArray)recipientNameStrings
{
  return self->_recipientNameStrings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientNameStrings, 0);
}

@end
