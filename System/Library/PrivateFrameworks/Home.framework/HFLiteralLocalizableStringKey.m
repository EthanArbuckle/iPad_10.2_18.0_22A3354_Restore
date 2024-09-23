@implementation HFLiteralLocalizableStringKey

- (HFLiteralLocalizableStringKey)initWithLocalizedString:(id)a3
{
  id v5;
  HFLiteralLocalizableStringKey *v6;
  HFLiteralLocalizableStringKey *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFLiteralLocalizableStringKey;
  v6 = -[HFLocalizableStringKey initWithKey:argumentKeys:](&v9, sel_initWithKey_argumentKeys_, &stru_1EA741FF8, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_localizedString, a3);

  return v7;
}

- (NSString)localizedString
{
  return self->_localizedString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedString, 0);
}

@end
