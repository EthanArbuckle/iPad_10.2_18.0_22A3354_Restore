@implementation MUIContactSuggestion

+ (id)suggestionWithTitle:(id)a3 contactEmailAddresses:(id)a4 contactIdentifier:(id)a5 spotlightSuggestion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:contactEmailAddresses:contactIdentifier:spotlightSuggestion:", v13, v12, v11, v10);

  return v14;
}

- (MUIContactSuggestion)initWithTitle:(id)a3 contactEmailAddresses:(id)a4 contactIdentifier:(id)a5 spotlightSuggestion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MUIContactSuggestion *v14;
  uint64_t v15;
  NSString *title;
  uint64_t v17;
  NSArray *contactEmailAddresses;
  uint64_t v19;
  NSString *contactIdentifier;
  void *v21;
  uint64_t v22;
  NSArray *attributeValues;
  objc_super v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)MUIContactSuggestion;
  v14 = -[MUIContactSuggestion init](&v25, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    title = v14->_title;
    v14->_title = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    contactEmailAddresses = v14->_contactEmailAddresses;
    v14->_contactEmailAddresses = (NSArray *)v17;

    v19 = objc_msgSend(v12, "copy");
    contactIdentifier = v14->_contactIdentifier;
    v14->_contactIdentifier = (NSString *)v19;

    v21 = (void *)objc_msgSend(v10, "copy");
    v26[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v22 = objc_claimAutoreleasedReturnValue();
    attributeValues = v14->_attributeValues;
    v14->_attributeValues = (NSArray *)v22;

    objc_storeStrong((id *)&v14->_spotlightSuggestion, a6);
  }

  return v14;
}

- (id)category
{
  return +[MUISearchSuggestionCategory contactCategory](MUISearchSuggestionCategory, "contactCategory");
}

- (id)title
{
  return self->_title;
}

- (NSArray)contactEmailAddresses
{
  return self->_contactEmailAddresses;
}

- (id)spotlightSuggestion
{
  return self->_spotlightSuggestion;
}

- (id)subtitle
{
  return 0;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSArray)attributeValues
{
  return self->_attributeValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeValues, 0);
  objc_storeStrong((id *)&self->_spotlightSuggestion, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_contactEmailAddresses, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

@end
