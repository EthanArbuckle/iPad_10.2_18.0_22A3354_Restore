@implementation CNCollationHeaderSection

- (NSString)ICUSortKey
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (CNCollationHeaderSection)initWithKey:(id)a3 localizedName:(id)a4 ICUSortKey:(id)a5
{
  id v8;
  CNCollationHeaderSection *v9;
  uint64_t v10;
  NSString *ICUSortKey;
  CNCollationHeaderSection *v12;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CNCollationHeaderSection;
  v9 = -[CNCollationSection initWithKey:localizedName:](&v14, sel_initWithKey_localizedName_, a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    ICUSortKey = v9->_ICUSortKey;
    v9->_ICUSortKey = (NSString *)v10;

    v12 = v9;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ICUSortKey, 0);
}

@end
