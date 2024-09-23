@implementation AKFontListController

- (AKFontListController)initWithController:(id)a3
{
  AKFontListController *v3;
  AKFontListController *v4;
  uint64_t v5;
  NSArray *fonts;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AKFontListController;
  v3 = -[AKFontListController init](&v8, sel_init, a3);
  v4 = v3;
  if (v3)
  {
    -[AKFontListController _createFontsList](v3, "_createFontsList");
    v5 = objc_claimAutoreleasedReturnValue();
    fonts = v4->_fonts;
    v4->_fonts = (NSArray *)v5;

  }
  return v4;
}

- (id)_createFontsList
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  +[AKController akBundle](AKController, "akBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("FontPresets"), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:", v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", CFSTR("fonts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "valueForKey:", CFSTR("fontFamily"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "valueForKey:", CFSTR("default"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "BOOLValue");

        objc_msgSend(MEMORY[0x24BDF6A70], "fontWithName:size:", v11, 18.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v5, "addObject:", v14);
          if (v13)
            -[AKFontListController setDefaultFont:](self, "setDefaultFont:", v14);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  -[AKFontListController setFonts:](self, "setFonts:", v5);
  return v5;
}

+ (id)attributedStringForFont:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "familyName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v4);
  objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x24BDF65F8], v3, 0, objc_msgSend(v4, "length"));

  return v5;
}

- (NSArray)fonts
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFonts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (UIFont)defaultFont
{
  return (UIFont *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDefaultFont:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultFont, 0);
  objc_storeStrong((id *)&self->_fonts, 0);
}

@end
