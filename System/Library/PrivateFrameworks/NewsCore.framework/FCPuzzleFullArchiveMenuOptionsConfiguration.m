@implementation FCPuzzleFullArchiveMenuOptionsConfiguration

void __72__FCPuzzleFullArchiveMenuOptionsConfiguration_initWithConfigDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  FCPuzzleFullArchiveMenuOptionItem *v8;
  id v9;

  v3 = a2;
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("title"), &stru_1E464BC40);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("icon"), &stru_1E464BC40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = FCAppConfigurationIntegerValue(v3, (uint64_t)CFSTR("difficultyIndex"), 0);
  FCAppConfigurationStringValue(v3, (uint64_t)CFSTR("level"), &stru_1E464BC40);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("progress-unplayed")) & 1) != 0)
  {
    v7 = 2;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("progress-inprogress")) & 1) != 0)
  {
    v7 = 3;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("progress-completed")) & 1) != 0)
  {
    v7 = 4;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("difficulty-10")) & 1) != 0)
  {
    v7 = 5;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("difficulty-20")) & 1) != 0)
  {
    v7 = 6;
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("difficulty-30")))
  {
    v7 = 7;
  }
  else
  {
    v7 = 1;
  }
  v8 = -[FCPuzzleFullArchiveMenuOptionItem initWithTitle:icon:level:difficultyIndex:]([FCPuzzleFullArchiveMenuOptionItem alloc], "initWithTitle:icon:level:difficultyIndex:", v9, v4, v7, v5);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (FCPuzzleFullArchiveMenuOptionsConfiguration)initWithConfigDictionary:(id)a3
{
  id v4;
  FCPuzzleFullArchiveMenuOptionsConfiguration *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *icon;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *items;
  NSArray *v16;
  _QWORD v18[4];
  NSArray *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FCPuzzleFullArchiveMenuOptionsConfiguration;
  v5 = -[FCPuzzleFullArchiveMenuOptionsConfiguration init](&v20, sel_init);
  if (v5)
  {
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("title"), &stru_1E464BC40);
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("icon"), &stru_1E464BC40);
    v8 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (NSString *)v8;

    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("type"), &stru_1E464BC40);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("progress")))
    {
      v11 = 2;
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("difficulty")))
    {
      v11 = 3;
    }
    else
    {
      v11 = 1;
    }
    v5->_type = v11;
    FCAppConfigurationArrayValueWithDefaultValue(v4, (uint64_t)CFSTR("items"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __72__FCPuzzleFullArchiveMenuOptionsConfiguration_initWithConfigDictionary___block_invoke;
    v18[3] = &unk_1E463D0B8;
    v14 = v13;
    v19 = v14;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v18);
    items = v5->_items;
    v5->_items = v14;
    v16 = v14;

  }
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)icon
{
  return self->_icon;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSArray)items
{
  return self->_items;
}

@end
