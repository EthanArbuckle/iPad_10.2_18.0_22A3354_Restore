@implementation CTSubscriberAuthRequest

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CTSubscriberAuthRequest algorithm](self, "algorithm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("algorithm"));

}

- (CTSubscriberAuthRequest)initWithCoder:(id)a3
{
  id v4;
  CTSubscriberAuthRequest *v5;
  uint64_t v6;
  CTSubscriberAlgorithm *algorithm;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTSubscriberAuthRequest;
  v5 = -[CTSubscriberAuthRequest init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("algorithm"));
    v6 = objc_claimAutoreleasedReturnValue();
    algorithm = v5->_algorithm;
    v5->_algorithm = (CTSubscriberAlgorithm *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTSubscriberAlgorithm)algorithm
{
  return self->_algorithm;
}

- (void)setAlgorithm:(id)a3
{
  objc_storeStrong((id *)&self->_algorithm, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_algorithm, 0);
}

@end
