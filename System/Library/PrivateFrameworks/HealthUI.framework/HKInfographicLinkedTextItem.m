@implementation HKInfographicLinkedTextItem

- (HKInfographicLinkedTextItem)initWithDescription:(id)a3 didTapLinkedText:(id)a4
{
  id v6;
  id v7;
  HKInfographicLinkedTextItem *v8;
  HKInfographicLinkedTextItem *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HKInfographicLinkedTextItem;
  v8 = -[HKInfographicLinkedTextItem init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[HKInfographicLinkedTextItem setDescriptionString:](v8, "setDescriptionString:", v6);
    -[HKInfographicLinkedTextItem setDidTapLinkedText:](v9, "setDidTapLinkedText:", v7);
  }

  return v9;
}

- (NSAttributedString)descriptionString
{
  return self->_descriptionString;
}

- (void)setDescriptionString:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionString, a3);
}

- (id)didTapLinkedText
{
  return self->_didTapLinkedText;
}

- (void)setDidTapLinkedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)baseIdentifier
{
  return self->_baseIdentifier;
}

- (void)setBaseIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseIdentifier, 0);
  objc_storeStrong(&self->_didTapLinkedText, 0);
  objc_storeStrong((id *)&self->_descriptionString, 0);
}

@end
