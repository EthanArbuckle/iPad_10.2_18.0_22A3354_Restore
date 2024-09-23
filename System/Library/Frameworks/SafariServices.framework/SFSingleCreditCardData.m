@implementation SFSingleCreditCardData

- (SFSingleCreditCardData)initWithHeaderText:(id)a3 displayText:(id)a4 type:(int64_t)a5 value:(id)a6
{
  id v11;
  id v12;
  SFSingleCreditCardData *v13;
  SFSingleCreditCardData *v14;
  SFSingleCreditCardData *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SFSingleCreditCardData;
  v13 = -[WBSSingleCreditCardData initWithValue:type:](&v17, sel_initWithValue_type_, a6, a5);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_headerText, a3);
    objc_storeStrong((id *)&v14->_displayText, a4);
    v15 = v14;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFSingleCreditCardData;
  v4 = a3;
  -[WBSSingleCreditCardData encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_headerText, CFSTR("headerText"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayText, CFSTR("displayText"));

}

- (SFSingleCreditCardData)initWithCoder:(id)a3
{
  id v4;
  SFSingleCreditCardData *v5;
  uint64_t v6;
  NSString *headerText;
  uint64_t v8;
  NSString *displayText;
  SFSingleCreditCardData *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFSingleCreditCardData;
  v5 = -[WBSSingleCreditCardData initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("headerText"));
    v6 = objc_claimAutoreleasedReturnValue();
    headerText = v5->_headerText;
    v5->_headerText = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayText"));
    v8 = objc_claimAutoreleasedReturnValue();
    displayText = v5->_displayText;
    v5->_displayText = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (NSString)headerText
{
  return self->_headerText;
}

- (NSString)displayText
{
  return self->_displayText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayText, 0);
  objc_storeStrong((id *)&self->_headerText, 0);
}

@end
