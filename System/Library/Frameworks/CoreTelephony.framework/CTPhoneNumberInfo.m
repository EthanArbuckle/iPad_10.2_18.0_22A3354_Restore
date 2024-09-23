@implementation CTPhoneNumberInfo

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTPhoneNumberInfo label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", label=%@"), v4);

  -[CTPhoneNumberInfo number](self, "number");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", number=%@"), v5);

  -[CTPhoneNumberInfo displayPhoneNumber](self, "displayPhoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", displayPhoneNumber=%@"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR(", isPresent=%d"), -[CTPhoneNumberInfo isPresent](self, "isPresent"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", isEditable=%d"), -[CTPhoneNumberInfo isEditable](self, "isEditable"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", isRead=%d"), -[CTPhoneNumberInfo isRead](self, "isRead"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (NSString)number
{
  return self->_number;
}

- (NSString)displayPhoneNumber
{
  return self->_displayPhoneNumber;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayPhoneNumber, 0);
  objc_storeStrong((id *)&self->_number, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (CTPhoneNumberInfo)initWithCoder:(id)a3
{
  id v4;
  CTPhoneNumberInfo *v5;
  uint64_t v6;
  NSString *label;
  uint64_t v8;
  NSString *number;
  uint64_t v10;
  NSString *displayPhoneNumber;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTPhoneNumberInfo;
  v5 = -[CTPhoneNumberInfo init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v6 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("number"));
    v8 = objc_claimAutoreleasedReturnValue();
    number = v5->_number;
    v5->_number = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayPhoneNumber"));
    v10 = objc_claimAutoreleasedReturnValue();
    displayPhoneNumber = v5->_displayPhoneNumber;
    v5->_displayPhoneNumber = (NSString *)v10;

    v5->_isPresent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPresent"));
    v5->_isEditable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEditable"));
    v5->_isRead = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isRead"));
  }

  return v5;
}

- (void)setNumber:(id)a3
{
  objc_storeStrong((id *)&self->_number, a3);
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void)setIsRead:(BOOL)a3
{
  self->_isRead = a3;
}

- (void)setIsPresent:(BOOL)a3
{
  self->_isPresent = a3;
}

- (void)setIsEditable:(BOOL)a3
{
  self->_isEditable = a3;
}

- (void)setDisplayPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_displayPhoneNumber, a3);
}

- (NSString)label
{
  return self->_label;
}

- (BOOL)isRead
{
  return self->_isRead;
}

- (BOOL)isPresent
{
  return self->_isPresent;
}

- (BOOL)isEditable
{
  return self->_isEditable;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CTPhoneNumberInfo label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("label"));

  -[CTPhoneNumberInfo number](self, "number");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("number"));

  -[CTPhoneNumberInfo displayPhoneNumber](self, "displayPhoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("displayPhoneNumber"));

  objc_msgSend(v7, "encodeBool:forKey:", -[CTPhoneNumberInfo isPresent](self, "isPresent"), CFSTR("isPresent"));
  objc_msgSend(v7, "encodeBool:forKey:", -[CTPhoneNumberInfo isEditable](self, "isEditable"), CFSTR("isEditable"));
  objc_msgSend(v7, "encodeBool:forKey:", -[CTPhoneNumberInfo isRead](self, "isRead"), CFSTR("isRead"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTPhoneNumberInfo label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabel:", v5);

  -[CTPhoneNumberInfo number](self, "number");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumber:", v6);

  -[CTPhoneNumberInfo displayPhoneNumber](self, "displayPhoneNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayPhoneNumber:", v7);

  objc_msgSend(v4, "setIsPresent:", -[CTPhoneNumberInfo isPresent](self, "isPresent"));
  objc_msgSend(v4, "setIsEditable:", -[CTPhoneNumberInfo isEditable](self, "isEditable"));
  objc_msgSend(v4, "setIsRead:", -[CTPhoneNumberInfo isRead](self, "isRead"));
  return v4;
}

@end
