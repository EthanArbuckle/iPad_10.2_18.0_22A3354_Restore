@implementation CNContactClassifiedHandleStringInterpreter

- (CNContactClassifiedHandleStringInterpreter)init
{
  CNContactClassifiedHandleStringInterpreter *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNContactClassifiedHandleStringInterpreter)initWithHandleStringClassification:(id)a3
{
  id v5;
  CNContactClassifiedHandleStringInterpreter *v6;
  CNContactClassifiedHandleStringInterpreter *v7;
  NSMutableArray *v8;
  NSMutableArray *emailAddressesImpl;
  NSMutableArray *v10;
  NSMutableArray *phoneNumbersImpl;
  NSMutableArray *v12;
  NSMutableArray *unconvertableHandles;
  CNContactClassifiedHandleStringInterpreter *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNContactClassifiedHandleStringInterpreter;
  v6 = -[CNContactClassifiedHandleStringInterpreter init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_classification, a3);
    v7->_hasBeenInterpreted = 0;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    emailAddressesImpl = v7->_emailAddressesImpl;
    v7->_emailAddressesImpl = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    phoneNumbersImpl = v7->_phoneNumbersImpl;
    v7->_phoneNumbersImpl = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    unconvertableHandles = v7->_unconvertableHandles;
    v7->_unconvertableHandles = v12;

    v14 = v7;
  }

  return v7;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("classification"), self->_classification);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)interpretValues
{
  -[CNContactClassifiedHandleStringInterpreter interpretEmailAddresses](self, "interpretEmailAddresses");
  -[CNContactClassifiedHandleStringInterpreter interpretPhoneNumbers](self, "interpretPhoneNumbers");
  -[CNContactClassifiedHandleStringInterpreter interpretUnknownsAsEmailAddresses](self, "interpretUnknownsAsEmailAddresses");
  -[CNContactClassifiedHandleStringInterpreter setHasBeenInterpreted:](self, "setHasBeenInterpreted:", 1);
}

- (void)interpretEmailAddresses
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CNHandleStringClassification emailAddresses](self->_classification, "emailAddresses", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        +[CNLabeledValue labeledValueWithLabel:value:](CNLabeledValue, "labeledValueWithLabel:value:", 0, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](self->_emailAddressesImpl, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)interpretPhoneNumbers
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CNHandleStringClassification phoneNumbers](self->_classification, "phoneNumbers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v15;
    *(_QWORD *)&v5 = 138412290;
    v13 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        +[CNPhoneNumber phoneNumberWithStringValue:](CNPhoneNumber, "phoneNumberWithStringValue:", v9, v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          +[CNLabeledValue labeledValueWithLabel:value:](CNLabeledValue, "labeledValueWithLabel:value:", 0, v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](self->_phoneNumbersImpl, "addObject:", v11);

        }
        else
        {
          +[CNContact os_log](CNContact, "os_log");
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v13;
            v19 = v9;
            _os_log_error_impl(&dword_18F8BD000, v12, OS_LOG_TYPE_ERROR, "Handle “%@” was classified as a phone number, but could not be converted to CNPhoneNumber. Will be treated as an email address.", buf, 0xCu);
          }

          -[NSMutableArray addObject:](self->_unconvertableHandles, "addObject:", v9);
        }

      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v6);
  }

}

- (void)interpretUnknownsAsEmailAddresses
{
  void *v3;
  void *v4;
  NSMutableArray *unconvertableHandles;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  -[CNHandleStringClassification unknown](self->_classification, "unknown");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_each:", &__block_literal_global_86);

  -[CNHandleStringClassification unknown](self->_classification, "unknown");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  unconvertableHandles = self->_unconvertableHandles;
  v19[0] = v4;
  v19[1] = unconvertableHandles;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_cn_flatten");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        +[CNLabeledValue labeledValueWithLabel:value:](CNLabeledValue, "labeledValueWithLabel:value:", 0, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12), (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](self->_emailAddressesImpl, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

void __79__CNContactClassifiedHandleStringInterpreter_interpretUnknownsAsEmailAddresses__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[CNContact os_log](CNContact, "os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_18F8BD000, v3, OS_LOG_TYPE_DEFAULT, "Handle “%@” could not be classified; it will be included as an email address.",
      (uint8_t *)&v4,
      0xCu);
  }

}

- (NSArray)emailAddresses
{
  if (!self->_hasBeenInterpreted)
    -[CNContactClassifiedHandleStringInterpreter interpretValues](self, "interpretValues");
  return (NSArray *)self->_emailAddressesImpl;
}

- (NSArray)phoneNumbers
{
  if (!self->_hasBeenInterpreted)
    -[CNContactClassifiedHandleStringInterpreter interpretValues](self, "interpretValues");
  return (NSArray *)self->_phoneNumbersImpl;
}

- (CNHandleStringClassification)classification
{
  return self->_classification;
}

- (NSMutableArray)emailAddressesImpl
{
  return self->_emailAddressesImpl;
}

- (NSMutableArray)phoneNumbersImpl
{
  return self->_phoneNumbersImpl;
}

- (NSMutableArray)unconvertableHandles
{
  return self->_unconvertableHandles;
}

- (BOOL)hasBeenInterpreted
{
  return self->_hasBeenInterpreted;
}

- (void)setHasBeenInterpreted:(BOOL)a3
{
  self->_hasBeenInterpreted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unconvertableHandles, 0);
  objc_storeStrong((id *)&self->_phoneNumbersImpl, 0);
  objc_storeStrong((id *)&self->_emailAddressesImpl, 0);
  objc_storeStrong((id *)&self->_classification, 0);
}

@end
