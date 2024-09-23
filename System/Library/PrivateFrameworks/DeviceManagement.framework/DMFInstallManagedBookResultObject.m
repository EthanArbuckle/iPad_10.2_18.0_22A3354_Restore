@implementation DMFInstallManagedBookResultObject

- (DMFInstallManagedBookResultObject)initWithBook:(id)a3
{
  id v4;
  DMFInstallManagedBookResultObject *v5;
  uint64_t v6;
  DMFBook *book;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFInstallManagedBookResultObject;
  v5 = -[CATTaskResultObject init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    book = v5->_book;
    v5->_book = (DMFBook *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFInstallManagedBookResultObject)initWithCoder:(id)a3
{
  id v4;
  DMFInstallManagedBookResultObject *v5;
  void *v6;
  uint64_t v7;
  DMFBook *book;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFInstallManagedBookResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("book"));
    v7 = objc_claimAutoreleasedReturnValue();
    book = v5->_book;
    v5->_book = (DMFBook *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMFInstallManagedBookResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[DMFInstallManagedBookResultObject book](self, "book", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("book"));

}

- (id)description
{
  void *v2;
  void *v3;

  -[DMFInstallManagedBookResultObject book](self, "book");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (DMFBook)book
{
  return self->_book;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_book, 0);
}

@end
