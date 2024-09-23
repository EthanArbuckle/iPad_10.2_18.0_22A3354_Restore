@implementation _SingleCommunicationLimitSpecifiers

- (_SingleCommunicationLimitSpecifiers)initWithHeaderText:(id)a3 communicationLimit:(id)a4 maximumCommunicationLimit:(id)a5
{
  id v8;
  id v9;
  id v10;
  _SingleCommunicationLimitSpecifiers *v11;
  uint64_t v12;
  PSSpecifier *groupSpecifier;
  void *v14;
  void *v15;
  uint64_t v16;
  PSSpecifier *selectedContactsSpecifier;
  void *v18;
  void *v19;
  uint64_t v20;
  PSSpecifier *allContactsSpecifier;
  void *v22;
  void *v23;
  uint64_t v24;
  PSSpecifier *everyoneSpecifier;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)_SingleCommunicationLimitSpecifiers;
  v11 = -[_SingleCommunicationLimitSpecifiers init](&v27, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithName:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    groupSpecifier = v11->_groupSpecifier;
    v11->_groupSpecifier = (PSSpecifier *)v12;

    -[PSSpecifier setProperty:forKey:](v11->_groupSpecifier, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80898]);
    v14 = (void *)MEMORY[0x1E0D804E8];
    AXUILocalizedStringForKey(CFSTR("FAVORITES"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, 0, 0, 0, 0, 3, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    selectedContactsSpecifier = v11->_selectedContactsSpecifier;
    v11->_selectedContactsSpecifier = (PSSpecifier *)v16;

    v18 = (void *)MEMORY[0x1E0D804E8];
    AXUILocalizedStringForKey(CFSTR("CONTACTS"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v19, 0, 0, 0, 0, 3, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    allContactsSpecifier = v11->_allContactsSpecifier;
    v11->_allContactsSpecifier = (PSSpecifier *)v20;

    v22 = (void *)MEMORY[0x1E0D804E8];
    AXUILocalizedStringForKey(CFSTR("ANYONE"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v23, 0, 0, 0, 0, 3, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    everyoneSpecifier = v11->_everyoneSpecifier;
    v11->_everyoneSpecifier = (PSSpecifier *)v24;

    -[_SingleCommunicationLimitSpecifiers updateForCommunicationLimit:maximumCommunicationLimit:](v11, "updateForCommunicationLimit:maximumCommunicationLimit:", v9, v10);
  }

  return v11;
}

- (NSArray)allSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  -[_SingleCommunicationLimitSpecifiers groupSpecifier](self, "groupSpecifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  -[_SingleCommunicationLimitSpecifiers selectedContactsSpecifier](self, "selectedContactsSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  -[_SingleCommunicationLimitSpecifiers allContactsSpecifier](self, "allContactsSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  -[_SingleCommunicationLimitSpecifiers everyoneSpecifier](self, "everyoneSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (id)specifierForCommunicationLimit:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D10720]))
  {
    -[_SingleCommunicationLimitSpecifiers allContactsSpecifier](self, "allContactsSpecifier");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D10738]))
  {
    -[_SingleCommunicationLimitSpecifiers selectedContactsSpecifier](self, "selectedContactsSpecifier");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D10730]))
    {
      v6 = 0;
      goto LABEL_8;
    }
    -[_SingleCommunicationLimitSpecifiers everyoneSpecifier](self, "everyoneSpecifier");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_8:

  return v6;
}

- (id)communicationLimitForSpecifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  id *v9;
  id v10;

  v4 = a3;
  -[_SingleCommunicationLimitSpecifiers allContactsSpecifier](self, "allContactsSpecifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    -[_SingleCommunicationLimitSpecifiers selectedContactsSpecifier](self, "selectedContactsSpecifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      v9 = (id *)MEMORY[0x1E0D10738];
      goto LABEL_10;
    }
    -[_SingleCommunicationLimitSpecifiers everyoneSpecifier](self, "everyoneSpecifier");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v4)
    {
      v9 = (id *)MEMORY[0x1E0D10730];
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0D10750], "commonLog");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[_SingleCommunicationLimitSpecifiers communicationLimitForSpecifier:].cold.1();

  }
  v9 = (id *)MEMORY[0x1E0D10720];
LABEL_10:
  v10 = *v9;

  return v10;
}

- (void)updateForCommunicationLimit:(id)a3 maximumCommunicationLimit:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[6];

  v6 = a4;
  v7 = a3;
  -[_SingleCommunicationLimitSpecifiers groupSpecifier](self, "groupSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SingleCommunicationLimitSpecifiers specifierForCommunicationLimit:](self, "specifierForCommunicationLimit:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setProperty:forKey:", v9, *MEMORY[0x1E0D808E0]);
  CLFSortedCommunicationLimits();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "indexOfObject:", v6);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0D10750], "commonLog");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[_SingleCommunicationLimitSpecifiers updateForCommunicationLimit:maximumCommunicationLimit:].cold.1();

  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __93___SingleCommunicationLimitSpecifiers_updateForCommunicationLimit_maximumCommunicationLimit___block_invoke;
    v13[3] = &unk_1E76ABE30;
    v13[4] = self;
    v13[5] = v11;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);
  }

}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupSpecifier, a3);
}

- (PSSpecifier)selectedContactsSpecifier
{
  return self->_selectedContactsSpecifier;
}

- (void)setSelectedContactsSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_selectedContactsSpecifier, a3);
}

- (PSSpecifier)allContactsSpecifier
{
  return self->_allContactsSpecifier;
}

- (void)setAllContactsSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_allContactsSpecifier, a3);
}

- (PSSpecifier)everyoneSpecifier
{
  return self->_everyoneSpecifier;
}

- (void)setEveryoneSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_everyoneSpecifier, a3);
}

- (void)setAllSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_allSpecifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allSpecifiers, 0);
  objc_storeStrong((id *)&self->_everyoneSpecifier, 0);
  objc_storeStrong((id *)&self->_allContactsSpecifier, 0);
  objc_storeStrong((id *)&self->_selectedContactsSpecifier, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
}

- (void)communicationLimitForSpecifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8_0(&dword_1BD892000, v0, v1, "Unhandled incoming communication limit specifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updateForCommunicationLimit:maximumCommunicationLimit:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8_0(&dword_1BD892000, v0, v1, "Unable to find maximum communication limit \"%@\" in sorted list.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
