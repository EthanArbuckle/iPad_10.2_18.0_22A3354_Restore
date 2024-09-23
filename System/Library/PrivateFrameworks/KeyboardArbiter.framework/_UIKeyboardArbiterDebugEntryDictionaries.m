@implementation _UIKeyboardArbiterDebugEntryDictionaries

- (int)importance
{
  return 100;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaries, 0);
}

+ (id)entryWithDictionaries:(id)a3
{
  id v5;
  id *v6;
  id *v7;

  v5 = a3;
  v6 = (id *)objc_alloc_init((Class)a1);
  v7 = v6;
  if (v6)
    objc_storeStrong(v6 + 2, a3);

  return v7;
}

- (void)enumerateContents:(id)a3
{
  void (**v4)(id, _QWORD);
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIKeyboardArbiterDebugEntryDictionaries;
  -[_UIKeyboardArbiterDebugEntry enumerateContents:](&v14, sel_enumerateContents_, v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_dictionaries;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
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
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

@end
