@implementation _CSContactSearchResult

- (_CSContactSearchResult)initWithDisplayName:(id)a3 nameComponents:(id)a4 emailAddresses:(id)a5 contactIdentifier:(id)a6 recentsIdentifier:(id)a7 sourceType:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _CSContactSearchResult *v19;
  uint64_t v20;
  NSString *displayName;
  uint64_t v22;
  NSPersonNameComponents *nameComponents;
  uint64_t v24;
  NSArray *emailAddresses;
  uint64_t v26;
  NSString *contactIdentifier;
  objc_super v29;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v29.receiver = self;
  v29.super_class = (Class)_CSContactSearchResult;
  v19 = -[_CSContactSearchResult init](&v29, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v14, "copy");
    displayName = v19->_displayName;
    v19->_displayName = (NSString *)v20;

    v22 = objc_msgSend(v15, "copy");
    nameComponents = v19->_nameComponents;
    v19->_nameComponents = (NSPersonNameComponents *)v22;

    v24 = objc_msgSend(v16, "copy");
    emailAddresses = v19->_emailAddresses;
    v19->_emailAddresses = (NSArray *)v24;

    v26 = objc_msgSend(v17, "copy");
    contactIdentifier = v19->_contactIdentifier;
    v19->_contactIdentifier = (NSString *)v26;

    objc_storeStrong((id *)&v19->_recentsIdentifier, a7);
    v19->_sourceType = a8;
  }

  return v19;
}

- (_CSContactSearchResult)initWithDisplayName:(id)a3 emailAddresses:(id)a4 contactIdentifier:(id)a5 recentsIdentifier:(id)a6 sourceType:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _CSContactSearchResult *v16;
  uint64_t v17;
  NSString *displayName;
  NSPersonNameComponents *nameComponents;
  uint64_t v20;
  NSArray *emailAddresses;
  uint64_t v22;
  NSString *contactIdentifier;
  objc_super v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v25.receiver = self;
  v25.super_class = (Class)_CSContactSearchResult;
  v16 = -[_CSContactSearchResult init](&v25, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    displayName = v16->_displayName;
    v16->_displayName = (NSString *)v17;

    nameComponents = v16->_nameComponents;
    v16->_nameComponents = 0;

    v20 = objc_msgSend(v13, "copy");
    emailAddresses = v16->_emailAddresses;
    v16->_emailAddresses = (NSArray *)v20;

    v22 = objc_msgSend(v14, "copy");
    contactIdentifier = v16->_contactIdentifier;
    v16->_contactIdentifier = (NSString *)v22;

    objc_storeStrong((id *)&v16->_recentsIdentifier, a6);
    v16->_sourceType = a7;
  }

  return v16;
}

- (BOOL)contact
{
  return (LOBYTE(self->_sourceType) >> 1) & 1;
}

- (BOOL)recent
{
  return self->_sourceType & 1;
}

+ (id)generateQueryStringForContact:(id)a3 filterQueries:(id)a4 includeSecondaryRecipients:(BOOL)a5 inputScope:(unint64_t)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;
  __CFString *v12;
  __CFString **v13;
  __CFString *v14;
  id v15;
  __CFString *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void *v26;
  id v27;
  __CFString *v28;

  v7 = a5;
  v9 = a3;
  v10 = a4;
  if (v9 && objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("kMDItemAuthorEmailAddresses");
    if (a6 == 2)
    {
      v13 = MDItemRecipientEmailAddresses;
      if (!v7)
        v13 = MDItemPrimaryRecipientEmailAddresses;
      v14 = *v13;

      v12 = v14;
    }
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __108___CSContactSearchResult_generateQueryStringForContact_filterQueries_includeSecondaryRecipients_inputScope___block_invoke;
    v26 = &unk_1E2404BC0;
    v15 = v11;
    v27 = v15;
    v16 = v12;
    v28 = v16;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v23);
    objc_msgSend(v15, "componentsJoinedByString:", CFSTR(" || "));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && objc_msgSend(v10, "count"))
    {
      if (objc_msgSend(v10, "count") == 1)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v10, "componentsJoinedByString:", CFSTR(") && ("));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("(%@)"), v21);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("((%@) && (%@))"), v17, v18, v23, v24, v25, v26, v27);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), v17);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v19 = CFSTR("(false)");
  }

  return v19;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void)setEmailAddresses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSNumber)recentsIdentifier
{
  return self->_recentsIdentifier;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (unint64_t)scope
{
  return self->_scope;
}

- (void)setScope:(unint64_t)a3
{
  self->_scope = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentsIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
