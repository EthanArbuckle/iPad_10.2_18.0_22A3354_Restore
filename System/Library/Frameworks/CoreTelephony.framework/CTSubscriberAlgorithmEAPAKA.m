@implementation CTSubscriberAlgorithmEAPAKA

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CTSubscriberAlgorithmEAPAKA rand](self, "rand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("rand"));

  -[CTSubscriberAlgorithmEAPAKA autn](self, "autn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("autn"));

}

- (CTSubscriberAlgorithmEAPAKA)initWithCoder:(id)a3
{
  id v4;
  CTSubscriberAlgorithmEAPAKA *v5;
  uint64_t v6;
  NSData *rand;
  uint64_t v8;
  NSData *autn;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTSubscriberAlgorithmEAPAKA;
  v5 = -[CTSubscriberAlgorithmEAPAKA init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rand"));
    v6 = objc_claimAutoreleasedReturnValue();
    rand = v5->_rand;
    v5->_rand = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("autn"));
    v8 = objc_claimAutoreleasedReturnValue();
    autn = v5->_autn;
    v5->_autn = (NSData *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)rand
{
  return self->_rand;
}

- (void)setRand:(id)a3
{
  objc_storeStrong((id *)&self->_rand, a3);
}

- (NSData)autn
{
  return self->_autn;
}

- (void)setAutn:(id)a3
{
  objc_storeStrong((id *)&self->_autn, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autn, 0);
  objc_storeStrong((id *)&self->_rand, 0);
}

@end
