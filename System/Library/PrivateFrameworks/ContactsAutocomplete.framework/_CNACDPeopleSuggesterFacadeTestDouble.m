@implementation _CNACDPeopleSuggesterFacadeTestDouble

- (_CNACDPeopleSuggesterFacadeTestDouble)init
{
  return -[_CNACDPeopleSuggesterFacadeTestDouble initWithDelegate:](self, "initWithDelegate:", 0);
}

- (_CNACDPeopleSuggesterFacadeTestDouble)initWithDelegate:(id)a3
{
  id v5;
  _CNACDPeopleSuggesterFacadeTestDouble *v6;
  _CNACDPeopleSuggesterFacadeTestDouble *v7;
  uint64_t v8;
  NSMutableArray *suggestions;
  _CNACDPeopleSuggesterFacadeTestDouble *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CNACDPeopleSuggesterFacadeTestDouble;
  v6 = -[_CNACDPeopleSuggesterFacadeTestDouble init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    v8 = objc_opt_new();
    suggestions = v7->_suggestions;
    v7->_suggestions = (NSMutableArray *)v8;

    v10 = v7;
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("delegate"), self->_delegate);
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("suggestions"), self->_suggestions);
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)addPersonWithDisplayName:(id)a3 handle:(id)a4 contactIdentifier:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  id v14;

  v8 = (objc_class *)MEMORY[0x1E0D15880];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(v8);
  objc_msgSend(v12, "setDisplayName:", v11);

  objc_msgSend(v12, "setIdentifier:", v10);
  objc_msgSend(v12, "setPersonId:", v9);

  objc_msgSend(v12, "setPersonIdType:", 3);
  v13 = -[_CNACDPeopleSuggesterFacadeTestDouble typeOfHandle:](self, "typeOfHandle:", v10);

  objc_msgSend(v12, "setType:", v13);
  v14 = objc_alloc_init(MEMORY[0x1E0D15948]);
  objc_msgSend(v14, "setContact:", v12);
  -[NSMutableArray addObject:](self->_suggestions, "addObject:", v14);

  return v14;
}

- (unint64_t)typeOfHandle:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0D13A70];
    v13[0] = v3;
    v4 = 1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "classificationOfHandleStrings:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "phoneNumbers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (!v9)
    {
      objc_msgSend(v7, "emailAddresses");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count") != 0;

      v4 = 2 * v11;
    }

  }
  return v4;
}

- (id)suggestPeopleWithContext:(id)a3 settings:(id)a4 error:(id *)a5
{
  -[_CNACDPeopleSuggesterFacadeTestDoubleDelegate didQueryCDPeopleSuggesterWithContext:settings:](self->_delegate, "didQueryCDPeopleSuggesterWithContext:settings:", a3, a4, a5);
  return (id)-[NSMutableArray copy](self->_suggestions, "copy");
}

- (_CNACDPeopleSuggesterFacadeTestDoubleDelegate)delegate
{
  return (_CNACDPeopleSuggesterFacadeTestDoubleDelegate *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
}

@end
