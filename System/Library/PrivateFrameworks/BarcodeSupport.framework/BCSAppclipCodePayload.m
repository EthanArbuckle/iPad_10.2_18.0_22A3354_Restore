@implementation BCSAppclipCodePayload

- (BCSAppclipCodePayload)initWithData:(id)a3 version:(unint64_t)a4
{
  id v7;
  BCSAppclipCodePayload *v8;
  BCSAppclipCodePayload *v9;
  BCSAppclipCodePayload *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BCSAppclipCodePayload;
  v8 = -[BCSAppclipCodePayload init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_payload, a3);
    v9->_version = a4;
    v10 = v9;
  }

  return v9;
}

- (int64_t)codeType
{
  return 3;
}

- (BCSAppclipCodePayload)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BCSAppclipCodePayload *v7;

  v4 = a3;
  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payloadData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[BCSAppclipCodePayload initWithData:version:](self, "initWithData:version:", v5, objc_msgSend(v6, "unsignedIntegerValue"));
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *payload;
  id v5;
  id v6;

  payload = self->_payload;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", payload, CFSTR("payloadData"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_version);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("version"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
}

@end
