@implementation MADRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unint64_t)targetResolution
{
  return 12192768;
}

- (MADRequest)initWithCoder:(id)a3
{
  id v4;
  MADRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *results;
  uint64_t v11;
  NSError *error;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MADRequest;
  v5 = -[MADRequest init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("Results"));
    v9 = objc_claimAutoreleasedReturnValue();
    results = v5->_results;
    v5->_results = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Error"));
    v11 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_results, CFSTR("Results"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_error, CFSTR("Error"));

}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("results: %@, "), self->_results);
  objc_msgSend(v3, "appendFormat:", CFSTR("error: %@>"), self->_error);
  return v3;
}

- (NSArray)results
{
  return self->_results;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end
