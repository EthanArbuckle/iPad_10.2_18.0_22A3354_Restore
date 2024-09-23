@implementation CTBundleMatchingInfo

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTBundleMatchingInfo mcc](self, "mcc");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", MCC=%@"), v4);

  -[CTBundleMatchingInfo mnc](self, "mnc");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", MNC=%@"), v5);

  -[CTBundleMatchingInfo imsi](self, "imsi");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", IMSI=%@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTBundleMatchingInfo mcc](self, "mcc");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setMcc:", v6);

  -[CTBundleMatchingInfo mnc](self, "mnc");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setMnc:", v8);

  -[CTBundleMatchingInfo imsi](self, "imsi");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setImsi:", v10);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CTBundleMatchingInfo mcc](self, "mcc");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("mcc"));

  -[CTBundleMatchingInfo mnc](self, "mnc");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("mnc"));

  -[CTBundleMatchingInfo imsi](self, "imsi");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("imsi"));

}

- (CTBundleMatchingInfo)initWithCoder:(id)a3
{
  id v4;
  CTBundleMatchingInfo *v5;
  uint64_t v6;
  NSString *mcc;
  uint64_t v8;
  NSString *mnc;
  uint64_t v10;
  NSString *imsi;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTBundleMatchingInfo;
  v5 = -[CTBundleMatchingInfo init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mcc"));
    v6 = objc_claimAutoreleasedReturnValue();
    mcc = v5->_mcc;
    v5->_mcc = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mnc"));
    v8 = objc_claimAutoreleasedReturnValue();
    mnc = v5->_mnc;
    v5->_mnc = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imsi"));
    v10 = objc_claimAutoreleasedReturnValue();
    imsi = v5->_imsi;
    v5->_imsi = (NSString *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)mcc
{
  return self->_mcc;
}

- (void)setMcc:(id)a3
{
  objc_storeStrong((id *)&self->_mcc, a3);
}

- (NSString)mnc
{
  return self->_mnc;
}

- (void)setMnc:(id)a3
{
  objc_storeStrong((id *)&self->_mnc, a3);
}

- (NSString)imsi
{
  return self->_imsi;
}

- (void)setImsi:(id)a3
{
  objc_storeStrong((id *)&self->_imsi, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imsi, 0);
  objc_storeStrong((id *)&self->_mnc, 0);
  objc_storeStrong((id *)&self->_mcc, 0);
}

@end
