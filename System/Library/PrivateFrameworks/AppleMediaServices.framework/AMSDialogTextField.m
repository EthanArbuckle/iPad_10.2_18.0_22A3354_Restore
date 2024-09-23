@implementation AMSDialogTextField

+ (id)textFieldWithPlaceholder:(id)a3 secure:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)a1);
  objc_msgSend(v7, "setPlaceholder:", v6);

  objc_msgSend(v7, "setSecure:", v4);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeInteger:forKey:", -[AMSDialogTextField keyboardType](self, "keyboardType"), CFSTR("kCodingKeyKeyboardType"));
  -[AMSDialogTextField placeholder](self, "placeholder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AMSDialogTextField placeholder](self, "placeholder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("kCodingKeyPlaceholder"));

  }
  objc_msgSend(v8, "encodeBool:forKey:", -[AMSDialogTextField secure](self, "secure"), CFSTR("kCodingKeySecure"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[AMSDialogTextField tag](self, "tag"), CFSTR("kCodingKeyTag"));
  -[AMSDialogTextField text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AMSDialogTextField text](self, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("kCodingKeyText"));

  }
}

- (AMSDialogTextField)initWithCoder:(id)a3
{
  id v4;
  AMSDialogTextField *v5;
  uint64_t v6;
  NSString *placeholder;
  uint64_t v8;
  NSString *text;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSDialogTextField;
  v5 = -[AMSDialogTextField init](&v11, sel_init);
  if (v5)
  {
    v5->_keyboardType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCodingKeyKeyboardType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyPlaceholder"));
    v6 = objc_claimAutoreleasedReturnValue();
    placeholder = v5->_placeholder;
    v5->_placeholder = (NSString *)v6;

    v5->_secure = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kCodingKeySecure"));
    v5->_tag = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCodingKeyTag"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyText"));
    v8 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)secure
{
  return self->_secure;
}

- (void)setSecure:(BOOL)a3
{
  self->_secure = a3;
}

- (int64_t)tag
{
  return self->_tag;
}

- (void)setTag:(int64_t)a3
{
  self->_tag = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
}

@end
