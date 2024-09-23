@implementation CalDAVCalendarServerChangedPropertyItem

- (CalDAVCalendarServerChangedPropertyItem)initWithNameSpace:(id)a3 andName:(id)a4
{
  CalDAVCalendarServerChangedPropertyItem *v4;
  NSMutableSet *v5;
  NSMutableSet *changedParameters;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CalDAVCalendarServerChangedPropertyItem;
  v4 = -[CoreDAVItem initWithNameSpace:andName:](&v8, sel_initWithNameSpace_andName_, a3, a4);
  if (v4)
  {
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    changedParameters = v4->_changedParameters;
    v4->_changedParameters = v5;

  }
  return v4;
}

- (void)parserFoundAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v8 = *MEMORY[0x24BE1AEE0];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v8);

        if (v12)
        {
          objc_msgSend(v10, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[CalDAVCalendarServerChangedPropertyItem setNameAttribute:](self, "setNameAttribute:", v13);

        }
        objc_msgSend(v10, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("change-type"));

        if (v15)
        {
          objc_msgSend(v10, "value");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[CalDAVCalendarServerChangedPropertyItem setTypeAttribute:](self, "setTypeAttribute:", v16);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

}

- (void)addChangedParameter:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CalDAVCalendarServerChangedPropertyItem changedParameters](self, "changedParameters");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (id)copyParseRules
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x24BDBCE70]);
  v3 = *MEMORY[0x24BE1ADC8];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 0x7FFFFFFFLL, *MEMORY[0x24BE1ADC8], CFSTR("changed-parameter"), objc_opt_class(), sel_addChangedParameter_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v3, CFSTR("changed-parameter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithObjectsAndKeys:", v4, v5, 0);

  return v6;
}

- (NSMutableSet)changedParameters
{
  return self->_changedParameters;
}

- (void)setChangedParameters:(id)a3
{
  objc_storeStrong((id *)&self->_changedParameters, a3);
}

- (NSString)nameAttribute
{
  return self->_nameAttribute;
}

- (void)setNameAttribute:(id)a3
{
  objc_storeStrong((id *)&self->_nameAttribute, a3);
}

- (NSString)typeAttribute
{
  return self->_typeAttribute;
}

- (void)setTypeAttribute:(id)a3
{
  objc_storeStrong((id *)&self->_typeAttribute, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeAttribute, 0);
  objc_storeStrong((id *)&self->_nameAttribute, 0);
  objc_storeStrong((id *)&self->_changedParameters, 0);
}

@end
