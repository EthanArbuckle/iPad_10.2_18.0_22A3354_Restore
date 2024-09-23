@implementation MSEmailModel

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", 1, CFSTR("MSCodingKeyVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_subject, CFSTR("MSCodingKeySubject"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sender, CFSTR("MSCodingKeySender"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_to, CFSTR("MSCodingKeyTo"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cc, CFSTR("MSCodingKeyCc"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bcc, CFSTR("MSCodingKeyBcc"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_body, CFSTR("MSCodingKeyBody"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_reference, CFSTR("MSCodingKeyReference"));
  objc_msgSend(v4, "encodeInt32:forKey:", LODWORD(self->_type), CFSTR("MSCodingKeyType"));

}

- (MSEmailModel)initWithCoder:(id)a3
{
  id v4;
  MSEmailModel *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *subject;
  uint64_t v11;
  NSString *body;
  uint64_t v13;
  NSString *sender;
  uint64_t v15;
  NSArray *to;
  uint64_t v17;
  NSArray *cc;
  uint64_t v19;
  NSArray *bcc;
  uint64_t v21;
  NSURL *reference;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[MSEmailModel init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("MSCodingKeyVersion"))
      && objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("MSCodingKeyVersion")) == 1)
    {
      v6 = (void *)MEMORY[0x24BDBCF20];
      v24[0] = objc_opt_class();
      v24[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setWithArray:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSCodingKeySubject"));
      v9 = objc_claimAutoreleasedReturnValue();
      subject = v5->_subject;
      v5->_subject = (NSString *)v9;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSCodingKeyBody"));
      v11 = objc_claimAutoreleasedReturnValue();
      body = v5->_body;
      v5->_body = (NSString *)v11;

      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("MSCodingKeySender"));
      v13 = objc_claimAutoreleasedReturnValue();
      sender = v5->_sender;
      v5->_sender = (NSString *)v13;

      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("MSCodingKeyTo"));
      v15 = objc_claimAutoreleasedReturnValue();
      to = v5->_to;
      v5->_to = (NSArray *)v15;

      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("MSCodingKeyCc"));
      v17 = objc_claimAutoreleasedReturnValue();
      cc = v5->_cc;
      v5->_cc = (NSArray *)v17;

      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("MSCodingKeyBcc"));
      v19 = objc_claimAutoreleasedReturnValue();
      bcc = v5->_bcc;
      v5->_bcc = (NSArray *)v19;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSCodingKeyReference"));
      v21 = objc_claimAutoreleasedReturnValue();
      reference = v5->_reference;
      v5->_reference = (NSURL *)v21;

      v5->_type = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("MSCodingKeyType"));
    }
    else
    {

      v5 = 0;
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)to
{
  return self->_to;
}

- (void)setTo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)cc
{
  return self->_cc;
}

- (void)setCc:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)bcc
{
  return self->_bcc;
}

- (void)setBcc:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_storeStrong((id *)&self->_body, a3);
}

- (NSURL)reference
{
  return self->_reference;
}

- (void)setReference:(id)a3
{
  objc_storeStrong((id *)&self->_reference, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reference, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_bcc, 0);
  objc_storeStrong((id *)&self->_cc, 0);
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_subject, 0);
}

@end
