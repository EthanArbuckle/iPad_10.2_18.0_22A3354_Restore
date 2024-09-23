@implementation LAExtendedRequirement

- (id)initWithConstraint:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)LAExtendedRequirement;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

+ (LAExtendedRequirement)applicationRemainsForegroundRequirement
{
  LAExtendedRequirement *v2;
  void *v3;
  id *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = [LAExtendedRequirement alloc];
  v6 = CFSTR("af");
  v7[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[LAExtendedRequirement initWithConstraint:]((id *)&v2->super.isa, v3);

  return (LAExtendedRequirement *)v4;
}

- (void)encodeWithACLCoder:(id)a3
{
  objc_msgSend(a3, "addConstraint:", self->_constraint);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSDictionary *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = (NSDictionary *)v5[1];
    v7 = v6 == self->_constraint || -[NSDictionary isEqualToDictionary:](v6, "isEqualToDictionary:");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSDictionary hash](self->_constraint, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraint, 0);
}

@end
