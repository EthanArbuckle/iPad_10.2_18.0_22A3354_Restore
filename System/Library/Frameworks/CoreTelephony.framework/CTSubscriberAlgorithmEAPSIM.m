@implementation CTSubscriberAlgorithmEAPSIM

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CTSubscriberAlgorithmEAPSIM rand](self, "rand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("rand"));

}

- (CTSubscriberAlgorithmEAPSIM)initWithCoder:(id)a3
{
  id v4;
  CTSubscriberAlgorithmEAPSIM *v5;
  uint64_t v6;
  NSData *rand;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTSubscriberAlgorithmEAPSIM;
  v5 = -[CTSubscriberAlgorithmEAPSIM init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rand"));
    v6 = objc_claimAutoreleasedReturnValue();
    rand = v5->_rand;
    v5->_rand = (NSData *)v6;

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rand, 0);
}

@end
