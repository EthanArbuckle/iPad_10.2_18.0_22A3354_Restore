@implementation CTSubscriberAuthResult

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CTSubscriberAuthResult auts](self, "auts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("auts"));

  -[CTSubscriberAuthResult res](self, "res");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("res"));

  -[CTSubscriberAuthResult sres](self, "sres");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("sres"));

  -[CTSubscriberAuthResult kc](self, "kc");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("kc"));

  -[CTSubscriberAuthResult ck](self, "ck");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("ck"));

  -[CTSubscriberAuthResult ik](self, "ik");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("ik"));

}

- (CTSubscriberAuthResult)initWithCoder:(id)a3
{
  id v4;
  CTSubscriberAuthResult *v5;
  uint64_t v6;
  NSData *auts;
  uint64_t v8;
  NSData *res;
  uint64_t v10;
  NSData *sres;
  uint64_t v12;
  NSData *kc;
  uint64_t v14;
  NSData *ck;
  uint64_t v16;
  NSData *ik;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CTSubscriberAuthResult;
  v5 = -[CTSubscriberAuthResult init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("auts"));
    v6 = objc_claimAutoreleasedReturnValue();
    auts = v5->_auts;
    v5->_auts = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("res"));
    v8 = objc_claimAutoreleasedReturnValue();
    res = v5->_res;
    v5->_res = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sres"));
    v10 = objc_claimAutoreleasedReturnValue();
    sres = v5->_sres;
    v5->_sres = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kc"));
    v12 = objc_claimAutoreleasedReturnValue();
    kc = v5->_kc;
    v5->_kc = (NSData *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ck"));
    v14 = objc_claimAutoreleasedReturnValue();
    ck = v5->_ck;
    v5->_ck = (NSData *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ik"));
    v16 = objc_claimAutoreleasedReturnValue();
    ik = v5->_ik;
    v5->_ik = (NSData *)v16;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)auts
{
  return self->_auts;
}

- (void)setAuts:(id)a3
{
  objc_storeStrong((id *)&self->_auts, a3);
}

- (NSData)res
{
  return self->_res;
}

- (void)setRes:(id)a3
{
  objc_storeStrong((id *)&self->_res, a3);
}

- (NSData)sres
{
  return self->_sres;
}

- (void)setSres:(id)a3
{
  objc_storeStrong((id *)&self->_sres, a3);
}

- (NSData)kc
{
  return self->_kc;
}

- (void)setKc:(id)a3
{
  objc_storeStrong((id *)&self->_kc, a3);
}

- (NSData)ck
{
  return self->_ck;
}

- (void)setCk:(id)a3
{
  objc_storeStrong((id *)&self->_ck, a3);
}

- (NSData)ik
{
  return self->_ik;
}

- (void)setIk:(id)a3
{
  objc_storeStrong((id *)&self->_ik, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ik, 0);
  objc_storeStrong((id *)&self->_ck, 0);
  objc_storeStrong((id *)&self->_kc, 0);
  objc_storeStrong((id *)&self->_sres, 0);
  objc_storeStrong((id *)&self->_res, 0);
  objc_storeStrong((id *)&self->_auts, 0);
}

@end
