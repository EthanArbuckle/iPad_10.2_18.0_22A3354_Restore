@implementation ABSAssistantManager

- (ABSAssistantManager)init
{
  ABSAddressBook *v3;
  ABSAssistantManager *v4;

  v3 = objc_alloc_init(ABSAddressBook);
  v4 = -[ABSAssistantManager initWithAddressBook:](self, "initWithAddressBook:", v3);

  return v4;
}

- (ABSAssistantManager)initWithAddressBook:(id)a3
{
  id v5;
  ABSAssistantManager *v6;
  ABSAssistantManager *v7;
  ABSAssistantManager *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ABSAssistantManager;
  v6 = -[ABSAssistantManager init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_addressBook, a3);
    v8 = v7;
  }

  return v7;
}

- (id)newSAPersonFromABPerson:(void *)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[objc_class descriptorsForRequiredKeys](getCNAssistantConversionClass(), "descriptorsForRequiredKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ABSPublicABCNCompatibility contactFromPublicABPerson:keysToFetch:](ABSPublicABCNCompatibility, "contactFromPublicABPerson:keysToFetch:", a3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[objc_class createSAPersonFromCNContact:](getCNAssistantConversionClass(), "createSAPersonFromCNContact:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (ABSAddressBook)addressBook
{
  return self->_addressBook;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressBook, 0);
}

@end
