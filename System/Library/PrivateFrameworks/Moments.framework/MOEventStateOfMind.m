@implementation MOEventStateOfMind

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double reflectiveInterval;
  id v5;

  reflectiveInterval = self->_reflectiveInterval;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("reflectiveInterval"), reflectiveInterval);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("valence"), self->_valence);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("valenceClassification"), self->_valenceClassification);
  objc_msgSend(v5, "encodeObject:forKey:", self->_labels, CFSTR("labels"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_domains, CFSTR("domains"));

}

- (MOEventStateOfMind)initWithCoder:(id)a3
{
  id v4;
  MOEventStateOfMind *v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *labels;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSArray *domains;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MOEventStateOfMind;
  v5 = -[MOEventStateOfMind init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("reflectiveInterval"));
    v5->_reflectiveInterval = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("valence"));
    v5->_valence = v7;
    v8 = objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("valenceClassification"));
    v5->_valenceClassification = v9;
    v10 = (void *)MEMORY[0x1D1798EEC](v8);
    v11 = objc_alloc(MEMORY[0x1E0C99E60]);
    v12 = objc_opt_class();
    v13 = (void *)objc_msgSend(v11, "initWithObjects:", v12, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("labels"));
    v14 = objc_claimAutoreleasedReturnValue();
    labels = v5->_labels;
    v5->_labels = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1D1798EEC]();
    v17 = objc_alloc(MEMORY[0x1E0C99E60]);
    v18 = objc_opt_class();
    v19 = (void *)objc_msgSend(v17, "initWithObjects:", v18, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v16);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("domains"));
    v20 = objc_claimAutoreleasedReturnValue();
    domains = v5->_domains;
    v5->_domains = (NSArray *)v20;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOEventStateOfMind *v4;

  v4 = objc_alloc_init(MOEventStateOfMind);
  v4->_reflectiveInterval = self->_reflectiveInterval;
  v4->_valenceClassification = self->_valenceClassification;
  v4->_valence = self->_valence;
  objc_storeStrong((id *)&v4->_labels, self->_labels);
  objc_storeStrong((id *)&v4->_domains, self->_domains);
  return v4;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("valence, %f"), *(_QWORD *)&self->_valence);
}

- (double)reflectiveInterval
{
  return self->_reflectiveInterval;
}

- (void)setReflectiveInterval:(double)a3
{
  self->_reflectiveInterval = a3;
}

- (double)valence
{
  return self->_valence;
}

- (void)setValence:(double)a3
{
  self->_valence = a3;
}

- (double)valenceClassification
{
  return self->_valenceClassification;
}

- (void)setValenceClassification:(double)a3
{
  self->_valenceClassification = a3;
}

- (NSArray)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
  objc_storeStrong((id *)&self->_labels, a3);
}

- (NSArray)domains
{
  return self->_domains;
}

- (void)setDomains:(id)a3
{
  objc_storeStrong((id *)&self->_domains, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domains, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

@end
