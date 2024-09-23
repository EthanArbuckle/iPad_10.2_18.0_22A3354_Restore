@implementation NPNameComponentsData

- (NPNameComponentsData)init
{
  NPNameComponentsData *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSDictionary *nameComponents;
  NPNameComponentsData *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NPNameComponentsData;
  v2 = -[NPNameComponentsData init](&v12, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1DF09A480]();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathForResource:ofType:", CFSTR("name_components_data"), CFSTR("plist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v5, 1, 0);
    if (!v6)
    {

      objc_autoreleasePoolPop(v3);
      v10 = 0;
      goto LABEL_6;
    }
    v7 = (void *)v6;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v6, 0, 0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    nameComponents = v2->_nameComponents;
    v2->_nameComponents = (NSDictionary *)v8;

    objc_autoreleasePoolPop(v3);
  }
  v10 = v2;
LABEL_6:

  return v10;
}

- (id)_keyForDataEntry:(unint64_t)a3
{
  if (a3 > 8)
    return 0;
  else
    return off_1EA0BC698[a3];
}

- (id)objectValueForEntry:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[NPNameComponentsData _keyForDataEntry:](self, "_keyForDataEntry:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_nameComponents, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)collectionForEntry:(unint64_t)a3 contains:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;

  v6 = a4;
  if (v6)
  {
    -[NPNameComponentsData objectValueForEntry:](self, "objectValueForEntry:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v8 = (objc_opt_isKindOfClass() & 1) != 0
      && objc_msgSend(v7, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, objc_msgSend(v7, "count"), 256, &__block_literal_global) != 0x7FFFFFFFFFFFFFFFLL;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __52__NPNameComponentsData_collectionForEntry_contains___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "caseInsensitiveCompare:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameComponents, 0);
}

@end
