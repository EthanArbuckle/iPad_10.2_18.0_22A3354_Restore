@implementation CNAutocompleteSupplementalGroup

- (CNAutocompleteSupplementalGroup)initWithIdentifier:(id)a3 title:(id)a4 members:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNAutocompleteSupplementalGroup *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSString *title;
  uint64_t v16;
  NSArray *groupMembers;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CNAutocompleteSupplementalGroup;
  v11 = -[CNAutocompleteSupplementalGroup init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    title = v11->_title;
    v11->_title = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    groupMembers = v11->_groupMembers;
    v11->_groupMembers = (NSArray *)v16;

  }
  return v11;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)groupMembers
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupMembers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
