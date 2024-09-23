@implementation HKInfographicTextItem

- (HKInfographicTextItem)initWithDescription:(id)a3
{
  id v4;
  HKInfographicTextItem *v5;
  HKInfographicTextItem *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKInfographicTextItem;
  v5 = -[HKInfographicTextItem init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[HKInfographicTextItem setDescriptionString:](v5, "setDescriptionString:", v4);

  return v6;
}

- (NSAttributedString)descriptionString
{
  return self->_descriptionString;
}

- (void)setDescriptionString:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionString, a3);
}

- (NSString)baseIdentifier
{
  return self->_baseIdentifier;
}

- (void)setBaseIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseIdentifier, 0);
  objc_storeStrong((id *)&self->_descriptionString, 0);
}

@end
