@implementation MULabeledTokenViewModel

- (MULabeledTokenViewModel)initWithLabelValue:(id)a3 tokenValue:(id)a4
{
  id v7;
  id v8;
  MULabeledTokenViewModel *v9;
  MULabeledTokenViewModel *v10;
  void *v11;
  uint64_t v12;
  NSString *labelValue;
  void *v14;
  uint64_t v15;
  NSString *tokenValue;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MULabeledTokenViewModel;
  v9 = -[MULabeledTokenViewModel init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_unalteredLabelValue, a3);
    objc_storeStrong((id *)&v10->_unalteredTokenValue, a4);
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    labelValue = v10->_labelValue;
    v10->_labelValue = (NSString *)v12;

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    tokenValue = v10->_tokenValue;
    v10->_tokenValue = (NSString *)v15;

  }
  return v10;
}

- (NSString)labelValue
{
  return self->_labelValue;
}

- (NSString)tokenValue
{
  return self->_tokenValue;
}

- (NSString)unalteredLabelValue
{
  return self->_unalteredLabelValue;
}

- (NSString)unalteredTokenValue
{
  return self->_unalteredTokenValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unalteredTokenValue, 0);
  objc_storeStrong((id *)&self->_unalteredLabelValue, 0);
  objc_storeStrong((id *)&self->_tokenValue, 0);
  objc_storeStrong((id *)&self->_labelValue, 0);
}

@end
