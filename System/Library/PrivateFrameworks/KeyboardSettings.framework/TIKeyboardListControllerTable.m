@implementation TIKeyboardListControllerTable

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardListControllerTable;
  -[TIKeyboardListControllerTable dealloc](&v3, sel_dealloc);
}

- (void)addEditingChangeHandler:(id)a3
{
  id v5;

  if (!self->_todoList)
    self->_todoList = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (id)objc_msgSend(a3, "copy");
  -[NSMutableArray addObject:](self->_todoList, "addObject:", v5);

}

- (void)_setEditing:(BOOL)a3 animated:(BOOL)a4 forced:(BOOL)a5
{
  NSMutableArray *todoList;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)TIKeyboardListControllerTable;
  -[TIKeyboardListControllerTable _setEditing:animated:forced:](&v15, sel__setEditing_animated_forced_, a3, a4, a5);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  todoList = self->_todoList;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](todoList, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(todoList);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i) + 16))();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](todoList, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v8);
  }
  -[NSMutableArray removeAllObjects](self->_todoList, "removeAllObjects");
}

@end
