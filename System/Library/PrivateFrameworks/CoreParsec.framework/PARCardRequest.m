@implementation PARCardRequest

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PARCardRequest;
  v4 = a3;
  -[PARRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_cardURL, CFSTR("url"), v5.receiver, v5.super_class);

}

- (PARCardRequest)initWithCoder:(id)a3
{
  id v4;
  PARCardRequest *v5;
  uint64_t v6;
  NSURL *cardURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PARCardRequest;
  v5 = -[PARRequest initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v6 = objc_claimAutoreleasedReturnValue();
    cardURL = v5->_cardURL;
    v5->_cardURL = (NSURL *)v6;

  }
  return v5;
}

- (unsigned)nwActivityLabel
{
  return 8;
}

- (NSURL)cardURL
{
  return self->_cardURL;
}

- (void)setCardURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardURL, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
