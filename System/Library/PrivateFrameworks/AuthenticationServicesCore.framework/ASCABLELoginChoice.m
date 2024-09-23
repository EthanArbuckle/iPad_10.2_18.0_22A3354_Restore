@implementation ASCABLELoginChoice

- (unint64_t)loginChoiceKind
{
  return 4;
}

- (ASCABLELoginChoice)initWithQRCodeURL:(id)a3
{
  id v5;
  ASCABLELoginChoice *v6;
  ASCABLELoginChoice *v7;
  ASCABLELoginChoice *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASCABLELoginChoice;
  v6 = -[ASCABLELoginChoice init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_qrCodeURL, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCABLELoginChoice)initWithCoder:(id)a3
{
  id v4;
  ASCABLELoginChoice *v5;
  uint64_t v6;
  NSURL *qrCodeURL;
  ASCABLELoginChoice *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASCABLELoginChoice;
  v5 = -[ASCABLELoginChoice init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("qrCodeURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    qrCodeURL = v5->_qrCodeURL;
    v5->_qrCodeURL = (NSURL *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_qrCodeURL, CFSTR("qrCodeURL"));
}

- (NSURL)qrCodeURL
{
  return self->_qrCodeURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qrCodeURL, 0);
}

@end
