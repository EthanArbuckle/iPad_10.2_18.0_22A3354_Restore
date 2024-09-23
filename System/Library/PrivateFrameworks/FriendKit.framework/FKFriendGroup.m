@implementation FKFriendGroup

- (FKFriendGroup)initWithDelegate:(id)a3 groupSize:(unint64_t)a4
{
  id v6;
  FKFriendGroup *v7;
  FKFriendGroup *v8;
  FKFriendGroup *v9;

  v6 = a3;
  v7 = -[FKFriendGroup initWithGroupSize:](self, "initWithGroupSize:", a4);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v9 = v8;
  }

  return v8;
}

- (FKFriendGroup)initWithGroupSize:(unint64_t)a3
{
  FKFriendGroup *v4;
  uint64_t v5;
  NSMutableArray *friendsManager;
  unint64_t v7;
  NSMutableArray *v8;
  void *v9;
  FKFriendGroup *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FKFriendGroup;
  v4 = -[FKFriendGroup init](&v12, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    friendsManager = v4->_friendsManager;
    v4->_friendsManager = (NSMutableArray *)v5;

    v4->_groupSize = a3;
    if (a3)
    {
      v7 = 0;
      do
      {
        v8 = v4->_friendsManager;
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v8, "addObject:", v9);

        ++v7;
      }
      while (v7 < v4->_groupSize);
    }
    v10 = v4;
  }

  return v4;
}

- (FKFriendGroup)init
{
  return -[FKFriendGroup initWithGroupSize:](self, "initWithGroupSize:", 10);
}

- (id)friendAtPosition:(unint64_t)a3
{
  void *v3;
  void *v4;
  id v5;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL || self->_groupSize <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_friendsManager, "objectAtIndex:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 == v4)
      v5 = 0;
    else
      v5 = v3;

  }
  return v5;
}

- (unint64_t)positionOfFriend:(id)a3
{
  return -[NSMutableArray indexOfObject:](self->_friendsManager, "indexOfObject:", a3);
}

- (BOOL)containsFriend:(id)a3
{
  if (a3)
    return -[NSMutableArray containsObject:](self->_friendsManager, "containsObject:");
  else
    return 0;
}

- (unint64_t)count
{
  void *v3;
  NSMutableArray *friendsManager;
  id v5;
  unint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  friendsManager = self->_friendsManager;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __22__FKFriendGroup_count__block_invoke;
  v8[3] = &unk_24CCDFC58;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  -[NSMutableArray enumerateObjectsUsingBlock:](friendsManager, "enumerateObjectsUsingBlock:", v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __22__FKFriendGroup_count__block_invoke(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(result + 32) != a2)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  return result;
}

- (BOOL)isFull
{
  return -[FKFriendGroup _firstEmptyPosition](self, "_firstEmptyPosition") == 0x7FFFFFFFFFFFFFFFLL;
}

- (void)addFriend:(id)a3 error:(unsigned int *)a4
{
  id v6;
  unint64_t v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = -[FKFriendGroup _firstEmptyPosition](self, "_firstEmptyPosition");
  if ((v7 & 0x8000000000000000) != 0 || v7 >= self->_groupSize)
  {
    _FKGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315394;
      v10 = "-[FKFriendGroup addFriend:error:]";
      v11 = 1024;
      v12 = 110;
      _os_log_impl(&dword_211A80000, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) \"unable to add friend: capacity reached\", (uint8_t *)&v9, 0x12u);
    }

    *a4 = 1;
  }
  else
  {
    -[FKFriendGroup setFriend:atPosition:error:](self, "setFriend:atPosition:error:", v6, v7, a4);
  }

}

- (void)setTitle:(id)a3
{
  unint64_t v5;
  NSString *title;
  _QWORD v7[4];
  id v8;
  id location;

  v5 = (unint64_t)a3;
  title = self->_title;
  if (v5 | (unint64_t)title && !-[NSString isEqualToString:](title, "isEqualToString:", v5))
  {
    objc_storeStrong((id *)&self->_title, a3);
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __26__FKFriendGroup_setTitle___block_invoke;
    v7[3] = &unk_24CCDFBB8;
    objc_copyWeak(&v8, &location);
    dispatch_async(MEMORY[0x24BDAC9B8], v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __26__FKFriendGroup_setTitle___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("FKFriendGroupTitleChangedNotification"), WeakRetained);

}

- (void)setFriend:(id)a3 atPosition:(unint64_t)a4 error:(unsigned int *)a5
{
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  NSObject *v12;
  unsigned int v13;
  NSMutableArray *friendsManager;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (self->_groupSize <= a4)
  {
    _FKGetLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315650;
      v17 = "-[FKFriendGroup setFriend:atPosition:error:]";
      v18 = 1024;
      v19 = 132;
      v20 = 2048;
      v21 = a4;
      _os_log_impl(&dword_211A80000, v12, OS_LOG_TYPE_DEFAULT, "%s (%d) \"unable to add friend at position %tu: out of range\", (uint8_t *)&v16, 0x1Cu);
    }
    v13 = 2;
  }
  else
  {
    _FKGetLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        objc_msgSend(v8, "displayName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 136315906;
        v17 = "-[FKFriendGroup setFriend:atPosition:error:]";
        v18 = 1024;
        v19 = 142;
        v20 = 2112;
        v21 = (unint64_t)v11;
        v22 = 2048;
        v23 = a4;
        _os_log_impl(&dword_211A80000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) \"setting [%@] in friend list at position %tu\", (uint8_t *)&v16, 0x26u);

      }
      -[NSMutableArray setObject:atIndexedSubscript:](self->_friendsManager, "setObject:atIndexedSubscript:", v8, a4);
      -[FKFriendGroup delegate](self, "delegate");
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject friendGroup:didSetFriend:atPosition:](v12, "friendGroup:didSetFriend:atPosition:", self, v8, a4);
    }
    else
    {
      if (v10)
      {
        v16 = 136315650;
        v17 = "-[FKFriendGroup setFriend:atPosition:error:]";
        v18 = 1024;
        v19 = 138;
        v20 = 2048;
        v21 = a4;
        _os_log_impl(&dword_211A80000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) \"setting empty slot in friend list at position %tu\", (uint8_t *)&v16, 0x1Cu);
      }

      friendsManager = self->_friendsManager;
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray setObject:atIndexedSubscript:](friendsManager, "setObject:atIndexedSubscript:", v15, a4);

      -[FKFriendGroup delegate](self, "delegate");
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject friendGroup:didRemoveFriend:atPosition:](v12, "friendGroup:didRemoveFriend:atPosition:", self, 0, a4);
    }
    v13 = 0;
  }

  *a5 = v13;
}

- (void)removeFriendAtPosition:(unint64_t)a3
{
  void *v5;
  NSMutableArray *friendsManager;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[FKFriendGroup friendAtPosition:](self, "friendAtPosition:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    friendsManager = self->_friendsManager;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray setObject:atIndexedSubscript:](friendsManager, "setObject:atIndexedSubscript:", v7, a3);

    _FKGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "displayName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315906;
      v12 = "-[FKFriendGroup removeFriendAtPosition:]";
      v13 = 1024;
      v14 = 160;
      v15 = 2112;
      v16 = (unint64_t)v9;
      v17 = 2048;
      v18 = a3;
      _os_log_impl(&dword_211A80000, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Removing friend [%@] from position %lu in friend group\", (uint8_t *)&v11, 0x26u);

    }
    -[FKFriendGroup delegate](self, "delegate");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject friendGroup:didRemoveFriend:atPosition:](v10, "friendGroup:didRemoveFriend:atPosition:", self, v5, a3);
  }
  else
  {
    _FKGetLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315650;
      v12 = "-[FKFriendGroup removeFriendAtPosition:]";
      v13 = 1024;
      v14 = 155;
      v15 = 2048;
      v16 = a3;
      _os_log_impl(&dword_211A80000, v10, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Position %lu is already empty\", (uint8_t *)&v11, 0x1Cu);
    }
  }

}

- (void)setFriends:(id)a3
{
  NSMutableArray *friendsManager;
  id v5;

  friendsManager = self->_friendsManager;
  v5 = a3;
  -[NSMutableArray removeAllObjects](friendsManager, "removeAllObjects");
  -[NSMutableArray addObjectsFromArray:](self->_friendsManager, "addObjectsFromArray:", v5);

}

- (id)friends
{
  return self->_friendsManager;
}

- (int64_t)_firstEmptyPosition
{
  int64_t v3;
  void *v4;
  void *v5;

  if (!self->_groupSize)
    return 0x7FFFFFFFFFFFFFFFLL;
  v3 = 0;
  while (1)
  {
    -[NSMutableArray objectAtIndex:](self->_friendsManager, "objectAtIndex:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 == v5)
      break;
    if (++v3 >= self->_groupSize)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v3;
}

- (id)displayNameForGroupWithSeparator:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FKFriendGroup title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    -[FKFriendGroup title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[NSMutableArray count](self->_friendsManager, "count"))
  {
    v30 = v4;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v10 = self->_friendsManager;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v36 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15 != v16)
          {
            v17 = v15;
            v18 = objc_msgSend(v17, "hasName");
            objc_msgSend(v17, "displayName");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
              v20 = v8;
            else
              v20 = v9;
            objc_msgSend(v20, "addObject:", v19);

          }
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v12);
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v21 = v9;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v32 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
          if (objc_msgSend(v26, "fkMessageDestinationType") == 2)
          {
            objc_msgSend(v26, "componentsSeparatedByString:", CFSTR("@"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v28);

          }
          else
          {
            objc_msgSend(v8, "addObject:", v26);
          }
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v23);
    }

    if (objc_msgSend(v8, "count"))
    {
      v4 = v30;
      objc_msgSend(v8, "componentsJoinedByString:", v30);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
      v4 = v30;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)selectedPosition
{
  return self->_selectedPosition;
}

- (void)setSelectedPosition:(unint64_t)a3
{
  self->_selectedPosition = a3;
}

- (FKFriendGroupDelegate)delegate
{
  return (FKFriendGroupDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_friendsManager, 0);
}

@end
