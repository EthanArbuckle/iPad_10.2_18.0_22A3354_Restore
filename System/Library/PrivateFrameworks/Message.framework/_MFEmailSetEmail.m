@implementation _MFEmailSetEmail

- (_MFEmailSetEmail)initWithAddress:(id)a3
{
  _MFEmailSetEmail *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MFEmailSetEmail;
  v4 = -[_MFEmailSetEmail init](&v6, sel_init);
  -[_MFEmailSetEmail setAddress:](v4, "setAddress:", a3);
  if (!v4->_encodedAddress)
  {

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MFEmailSetEmail;
  -[_MFEmailSetEmail dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%lu) %@"), -[_MFEmailSetEmail hash](self, "hash"), -[_MFEmailSetEmail address](self, "address"));
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqualToEmail:(id)a3
{
  return -[NSString mf_isEqualToAddress:](self->_encodedAddress, "mf_isEqualToAddress:", *((_QWORD *)a3 + 2));
}

- (void)setAddress:(id)a3
{
  void *v5;
  id v6;

  self->_encodedAddress = 0;
  v6 = (id)objc_msgSend(a3, "mf_copyUncommentedAddress");
  v5 = (void *)objc_msgSend(v6, "mf_copyIDNAEncodedEmailAddress");
  if (objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6B8]), "initWithString:", v5))
  {
    self->_hash = CFHash((CFTypeRef)objc_msgSend(v5, "lowercaseString"));
    self->_encodedAddress = (NSString *)v5;
    self->_comment = (NSString *)objc_msgSend(a3, "mf_copyAddressComment");
  }

}

- (NSString)address
{
  return (NSString *)(id)-[NSString mf_copyIDNADecodedEmailAddress](self->_encodedAddress, "mf_copyIDNADecodedEmailAddress");
}

- (NSString)commentedAddress
{
  return (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "mf_formattedAddressWithName:email:useQuotes:", self->_comment, self->_encodedAddress, 1), "mf_copyIDNADecodedEmailAddress");
}

@end
