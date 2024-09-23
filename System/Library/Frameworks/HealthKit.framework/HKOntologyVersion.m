@implementation HKOntologyVersion

- (HKOntologyVersion)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKOntologyVersion)initWithString:(id)a3
{
  id v4;
  HKOntologyVersion *v5;
  uint64_t v6;
  NSString *string;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKOntologyVersion;
  v5 = -[HKOntologyVersion init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    string = v5->_string;
    v5->_string = (NSString *)v6;

  }
  return v5;
}

- (id)initEmptyVersion
{
  return -[HKOntologyVersion initWithString:](self, "initWithString:", &stru_1E37FD4C0);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %@>"), objc_opt_class(), self, self->_string);
}

- (BOOL)isEmptyVersion
{
  return -[NSString isEqualToString:](self->_string, "isEqualToString:", &stru_1E37FD4C0);
}

- (HKOntologyVersion)initWithShardEntries:(id)a3
{
  void *v4;
  HKOntologyVersion *v5;

  +[HKOntologyVersion _stableStringRepresentationOfEntries:]((uint64_t)HKOntologyVersion, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HKOntologyVersion initWithString:](self, "initWithString:", v4);

  return v5;
}

+ (id)_stableStringRepresentationOfEntries:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "hk_mapToSet:", &__block_literal_global_18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("|"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_string, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HKOntologyVersion *v4;
  NSString *string;
  NSString *v6;
  char v7;

  v4 = (HKOntologyVersion *)a3;
  if (v4 == self)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  string = self->_string;
  v6 = v4->_string;
  if (string == v6)
  {
LABEL_6:
    v7 = 1;
    goto LABEL_8;
  }
  if (!v6)
    goto LABEL_7;
  v7 = -[NSString isEqualToString:](string, "isEqualToString:");
LABEL_8:

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_string, CFSTR("string"));
}

- (HKOntologyVersion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HKOntologyVersion *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("string"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HKOntologyVersion initWithString:](self, "initWithString:", v5);
  return v6;
}

id __58__HKOntologyVersion__stableStringRepresentationOfEntries___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = (objc_class *)MEMORY[0x1E0CB3940];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "currentVersion");

  v7 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@,%lld"), v5, v6);
  return v7;
}

- (NSString)string
{
  return self->_string;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
