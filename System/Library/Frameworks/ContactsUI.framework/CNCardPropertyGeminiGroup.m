@implementation CNCardPropertyGeminiGroup

- (void)setShouldShowGemini:(BOOL)a3
{
  self->_shouldShowGemini = a3;
}

- (void)setGeminiResult:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CNCardPropertyGroup propertyItems](self, "propertyItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setGeminiResult:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)editingItems
{
  void *v3;

  if (-[CNCardPropertyGeminiGroup shouldShowGemini](self, "shouldShowGemini"))
  {
    -[CNCardPropertyGroup propertyItems](self, "propertyItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v3;
}

- (BOOL)shouldShowGemini
{
  return self->_shouldShowGemini;
}

- (id)_loadPropertyItems
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[CNCardGroup contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_1E20507A8;
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNCardGroup contact](self, "contact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPropertyGroupItem propertyGroupItemWithLabeledValue:group:contact:](CNPropertyGroupGeminiItem, "propertyGroupItemWithLabeledValue:group:contact:", v8, self, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)displayItems
{
  return (id)MEMORY[0x1E0C9AA60];
}

@end
