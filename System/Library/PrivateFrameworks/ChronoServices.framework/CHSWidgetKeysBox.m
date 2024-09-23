@implementation CHSWidgetKeysBox

- (CHSWidgetKeysBox)initWithWidgetKeys:(id)a3
{
  id v4;
  CHSWidgetKeysBox *v5;
  uint64_t v6;
  NSArray *widgetKeys;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSWidgetKeysBox;
  v5 = -[CHSWidgetKeysBox init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    widgetKeys = v5->_widgetKeys;
    v5->_widgetKeys = (NSArray *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_widgetKeys, CFSTR("_r"));
}

- (CHSWidgetKeysBox)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  CHSWidgetKeysBox *v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("_r"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  __34__CHSWidgetKeysBox_initWithCoder___block_invoke(v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    self = -[CHSWidgetKeysBox initWithWidgetKeys:](self, "initWithWidgetKeys:", v10);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id __34__CHSWidgetKeysBox_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v10;
      while (2)
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v3);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_12;
          }
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          continue;
        break;
      }
    }

    v7 = v3;
  }
  else
  {
LABEL_12:
    v7 = 0;
  }

  return v7;
}

- (NSArray)widgetKeys
{
  return self->_widgetKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetKeys, 0);
}

@end
