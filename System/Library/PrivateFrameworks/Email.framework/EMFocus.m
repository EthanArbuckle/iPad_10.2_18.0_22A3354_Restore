@implementation EMFocus

- (EMFocus)initWithFocusedAccountIdentifiers:(id)a3
{
  id v5;
  EMFocus *v6;
  EMFocus *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMFocus;
  v6 = -[EMFocus init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_focusedAccountIdentifiers, a3);

  return v7;
}

- (BOOL)isFocusedIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[EMFocus focusedAccountIdentifiers](self, "focusedAccountIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "focusedAccountIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMFocus focusedAccountIdentifiers](self, "focusedAccountIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToSet:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)ef_publicDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EMFocus focusedAccountIdentifiers](self, "focusedAccountIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>\n\tFocusedAccountIdentifiers: %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSSet)focusedAccountIdentifiers
{
  return self->_focusedAccountIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedAccountIdentifiers, 0);
}

@end
