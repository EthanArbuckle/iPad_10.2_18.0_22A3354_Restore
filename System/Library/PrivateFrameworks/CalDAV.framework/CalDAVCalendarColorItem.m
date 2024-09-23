@implementation CalDAVCalendarColorItem

- (CalDAVCalendarColorItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", *MEMORY[0x24BE1AF88], *MEMORY[0x24BE1AD10]);
}

- (void)parserFoundAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "name", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("symbolic-color"));

        if (v11)
        {
          objc_msgSend(v9, "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "lowercaseString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[CalDAVCalendarColorItem setSymbolicColorName:](self, "setSymbolicColorName:", v13);

          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

}

- (NSString)symbolicColorName
{
  NSString *symbolicColorName;
  NSString *v3;
  void *v4;
  void *v5;

  symbolicColorName = self->_symbolicColorName;
  if (!symbolicColorName)
  {
    v4 = (void *)MEMORY[0x24BEC6F88];
    -[CalDAVCalendarColorItem colorString](self, "colorString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "symbolicColorForLegacyRGB:", v5);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (v3)
      return v3;
    symbolicColorName = (NSString *)*MEMORY[0x24BEC7078];
  }
  v3 = symbolicColorName;
  return v3;
}

- (void)write:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  -[CalDAVCalendarColorItem symbolicColorName](self, "symbolicColorName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    -[CoreDAVItem name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVItem nameSpace](self, "nameSpace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVItem payloadAsString](self, "payloadAsString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVCalendarColorItem symbolicColorName](self, "symbolicColorName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", v7, v8, v9, CFSTR("symbolic-color"), v10, 0);

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CalDAVCalendarColorItem;
    -[CoreDAVItem write:](&v11, sel_write_, v4);
  }

}

- (void)setSymbolicColorName:(id)a3
{
  objc_storeStrong((id *)&self->_symbolicColorName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolicColorName, 0);
}

@end
