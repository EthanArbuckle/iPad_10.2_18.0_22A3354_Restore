@implementation _MFAutocompleteResultsTableViewModel

- (void)setNumberOfSections:(unint64_t)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *sections;

  self->_numberOfSections = a3;
  v4 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", a3);
  sections = self->_sections;
  self->_sections = v4;

}

- (unint64_t)numberOfNonEmptySections
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64___MFAutocompleteResultsTableViewModel_numberOfNonEmptySections__block_invoke;
  v4[3] = &unk_1E5A65A08;
  v4[4] = &v5;
  -[_MFAutocompleteResultsTableViewModel enumerateSections:](self, "enumerateSections:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)enumerateSections:(id)a3
{
  id v4;
  NSMutableDictionary *sections;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  sections = self->_sections;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58___MFAutocompleteResultsTableViewModel_enumerateSections___block_invoke;
  v7[3] = &unk_1E5A65A30;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sections, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (_MFAutocompleteResultsTableViewModel)initWithNumberOfSections:(unint64_t)a3
{
  _MFAutocompleteResultsTableViewModel *v4;
  _MFAutocompleteResultsTableViewModel *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MFAutocompleteResultsTableViewModel;
  v4 = -[_MFAutocompleteResultsTableViewModel init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[_MFAutocompleteResultsTableViewModel setNumberOfSections:](v4, "setNumberOfSections:", a3);
  return v5;
}

- (id)sectionAtIndex:(unint64_t)a3
{
  id v3;
  NSMutableDictionary *sections;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *v9;
  void *v10;

  if (self->_numberOfSections >= a3)
  {
    sections = self->_sections;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](sections, "objectForKey:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v8;
    if (!v8)
    {
      v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v9 = self->_sections;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v3, v10);

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setSection:(id)a3 atIndex:(unint64_t)a4
{
  NSMutableDictionary *sections;
  void *v6;
  id v7;

  sections = self->_sections;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](sections, "setObject:forKey:", v7, v6);

}

- (id)computeDiffForModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t i;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _MFTableViewModelDiff *v21;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "numberOfSections");
  if (v8 == -[_MFAutocompleteResultsTableViewModel numberOfSections](self, "numberOfSections"))
  {
    for (i = 0; i < -[_MFAutocompleteResultsTableViewModel numberOfSections](self, "numberOfSections"); ++i)
    {
      v10 = objc_msgSend(v4, "numberOfSections");
      if (v10 < -[_MFAutocompleteResultsTableViewModel numberOfSections](self, "numberOfSections"))
      {
        -[_MFAutocompleteResultsTableViewModel sectionAtIndex:](self, "sectionAtIndex:", i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count"))
        {
          objc_msgSend(v4, "sectionAtIndex:", i);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "count");

          v14 = v6;
          if (!v13)
            goto LABEL_15;
        }
        else
        {

        }
      }
      v15 = objc_msgSend(v4, "numberOfSections");
      if (v15 <= -[_MFAutocompleteResultsTableViewModel numberOfSections](self, "numberOfSections"))
        goto LABEL_14;
      objc_msgSend(v4, "sectionAtIndex:", i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v16, "count"))
      {

LABEL_14:
        objc_msgSend(v4, "sectionAtIndex:", i);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count");

        v14 = v7;
        if (!v20)
          continue;
        goto LABEL_15;
      }
      -[_MFAutocompleteResultsTableViewModel sectionAtIndex:](self, "sectionAtIndex:", i);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      v14 = v5;
      if (v18)
        goto LABEL_14;
LABEL_15:
      objc_msgSend(v14, "addIndex:", i);
    }
  }
  v21 = objc_alloc_init(_MFTableViewModelDiff);
  -[_MFTableViewModelDiff setChangedRows:](v21, "setChangedRows:", v7);
  -[_MFTableViewModelDiff setDeletedRows:](v21, "setDeletedRows:", v6);
  -[_MFTableViewModelDiff setInsertedRows:](v21, "setInsertedRows:", v5);

  return v21;
}

- (unint64_t)numberOfSections
{
  return self->_numberOfSections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
