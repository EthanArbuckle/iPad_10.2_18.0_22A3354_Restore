@implementation DMCManagedBookPayload

+ (id)typeStrings
{
  return &unk_24D548750;
}

+ (id)localizedSingularForm
{
  return DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_BOOKS_SINGULAR"));
}

+ (id)localizedPluralForm
{
  return DMCEnrollmentLocalizedString(CFSTR("DMC_MANAGED_BOOKS_PLURAL"));
}

- (DMCManagedBookPayload)initWithBook:(id)a3
{
  id v5;
  DMCManagedBookPayload *v6;
  DMCManagedBookPayload *v7;

  v5 = a3;
  v6 = -[DMCManagedBookPayload init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_book, a3);

  return v7;
}

- (id)title
{
  void *v2;
  void *v3;

  -[DMCManagedBookPayload book](self, "book");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "friendlyName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (MDMBook)book
{
  return self->_book;
}

- (void)setBook:(id)a3
{
  objc_storeStrong((id *)&self->_book, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_book, 0);
}

@end
