@implementation HPSSiriAvailableLanguages

- (HPSSiriAvailableLanguages)initWithCoder:(id)a3
{
  HPSSiriAvailableLanguages *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  HPSSiriAvailableLanguages *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)HPSSiriAvailableLanguages;
  v3 = -[HPSSetting initWithCoder:](&v17, sel_initWithCoder_, a3);
  if (v3)
  {
    objc_opt_class();
    -[HPSSetting value](v3, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
LABEL_14:
      v11 = 0;
      goto LABEL_15;
    }
    v15 = 0u;
    v16 = 0u;
    v14 = 0u;
    -[HPSSiriAvailableLanguages languages](v3, "languages", 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_14;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v8)
          continue;
        break;
      }
    }

  }
  v11 = v3;
LABEL_15:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)valueClasses
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

@end
