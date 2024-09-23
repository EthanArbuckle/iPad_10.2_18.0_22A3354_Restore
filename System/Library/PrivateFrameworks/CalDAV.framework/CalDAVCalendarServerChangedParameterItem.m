@implementation CalDAVCalendarServerChangedParameterItem

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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = *MEMORY[0x24BE1AEE0];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v8);

        if (v12)
        {
          objc_msgSend(v10, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[CalDAVCalendarServerChangedParameterItem setNameAttribute:](self, "setNameAttribute:", v13);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

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
}

@end
