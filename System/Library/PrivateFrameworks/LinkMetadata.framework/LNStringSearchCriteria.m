@implementation LNStringSearchCriteria

- (LNStringSearchCriteria)initWithTerm:(id)a3
{
  id v5;
  LNStringSearchCriteria *v6;
  uint64_t v7;
  NSString *term;
  LNStringSearchCriteria *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNStringSearchCriteria.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("term"));

  }
  v12.receiver = self;
  v12.super_class = (Class)LNStringSearchCriteria;
  v6 = -[LNStringSearchCriteria init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    term = v6->_term;
    v6->_term = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

- (LNStringSearchCriteria)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  LNStringSearchCriteria *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("term"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[LNStringSearchCriteria initWithTerm:](self, "initWithTerm:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LNStringSearchCriteria term](self, "term");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("term"));

}

- (NSString)term
{
  return self->_term;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_term, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
