@implementation IMPeople

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, 0, 0);

  v4.receiver = self;
  v4.super_class = (Class)IMPeople;
  -[IMPeople dealloc](&v4, sel_dealloc);
}

- (void)setShouldHidePeople:(BOOL)a3
{
  id v4;

  if (self->_hidePeople != a3)
  {
    self->_hidePeople = a3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "__mainThreadPostNotificationName:object:", CFSTR("__kIMPeopleChangedNotification"), self);

  }
}

- (void)removeNotificationObserver:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", v5, CFSTR("__kIMPeopleAddedNotification"), self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", v5, CFSTR("__kIMPeopleRemovedNotification"), self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:name:object:", v5, CFSTR("__kIMPeopleChangedNotification"), self);

}

- (unint64_t)count
{
  if (-[IMPeople hidePeople](self, "hidePeople"))
    return 0;
  else
    return -[NSMutableArray count](self->_people, "count");
}

- (BOOL)containsIMHandle:(id)a3
{
  return -[NSMutableArray containsObjectIdenticalTo:](self->_people, "containsObjectIdenticalTo:", a3);
}

- (NSArray)groups
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = self->_people;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v9, "isBuddy"))
        {
          v19 = 0u;
          v20 = 0u;
          v17 = 0u;
          v18 = 0u;
          objc_msgSend(v9, "groupsArray", 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v18;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v18 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j);
                if ((objc_msgSend(v3, "containsObject:", v15) & 1) == 0)
                  objc_msgSend(v3, "addObject:", v15);
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            }
            while (v12);
          }

        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSMutableArray)people
{
  NSMutableArray *v3;

  if (-[IMPeople hidePeople](self, "hidePeople"))
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_people;
  }
  return v3;
}

- (void)addedIMHandle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[IMPeople hidePeople](self, "hidePeople"))
  {
    v4 = (void *)MEMORY[0x1E0C99D80];
    IMSingleObjectArray();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithObject:forKey:", v5, CFSTR("__kIMPeopleChangedUserInfoKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMPeopleAddedNotification"), self, v6);

  }
}

- (void)_addedPeople:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!-[IMPeople hidePeople](self, "hidePeople"))
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v6, CFSTR("__kIMPeopleChangedUserInfoKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMPeopleAddedNotification"), self, v4);

  }
}

- (void)removedIMHandle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[IMPeople hidePeople](self, "hidePeople"))
  {
    v4 = (void *)MEMORY[0x1E0C99D80];
    IMSingleObjectArray();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithObject:forKey:", v5, CFSTR("__kIMPeopleChangedUserInfoKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMPeopleRemovedNotification"), self, v6);

  }
}

- (void)beginCoalescedChanges
{
  ++self->_coalesceCount;
}

- (void)endCoalescedChanges
{
  int64_t coalesceCount;
  int64_t v4;
  void *v6;
  id v7;

  coalesceCount = self->_coalesceCount;
  if (!coalesceCount)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("IMPeople.m"), 129, CFSTR("Unbalanced calls to beginCoalescedChanges and endCoalescedChanges"));

    coalesceCount = self->_coalesceCount;
  }
  v4 = coalesceCount - 1;
  self->_coalesceCount = v4;
  if (!v4 && !-[IMPeople hidePeople](self, "hidePeople"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "__mainThreadPostNotificationName:object:", CFSTR("__kIMPeopleChangedNotification"), self);

  }
}

- (BOOL)coalescingChanges
{
  return self->_coalesceCount > 0;
}

- (BOOL)addIMHandle:(id)a3
{
  id v4;
  char v5;
  NSMutableArray *people;
  NSMutableArray *v7;
  NSMutableArray *v8;

  v4 = a3;
  v5 = -[NSMutableArray containsObjectIdenticalTo:](self->_people, "containsObjectIdenticalTo:", v4);
  if ((v5 & 1) == 0)
  {
    people = self->_people;
    if (!people)
    {
      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v8 = self->_people;
      self->_people = v7;

      people = self->_people;
    }
    -[NSMutableArray addObject:](people, "addObject:", v4);
    if (!-[IMPeople coalescingChanges](self, "coalescingChanges"))
      -[IMPeople addedIMHandle:](self, "addedIMHandle:", v4);
  }

  return v5 ^ 1;
}

- (BOOL)removeIMHandle:(id)a3
{
  id v4;
  int v5;
  NSMutableArray *people;

  v4 = a3;
  v5 = -[NSMutableArray containsObjectIdenticalTo:](self->_people, "containsObjectIdenticalTo:", v4);
  if (v5)
  {
    -[NSMutableArray removeObject:](self->_people, "removeObject:", v4);
    if (!-[IMPeople coalescingChanges](self, "coalescingChanges"))
      -[IMPeople removedIMHandle:](self, "removedIMHandle:", v4);
    if (!-[NSMutableArray count](self->_people, "count"))
    {
      people = self->_people;
      self->_people = 0;

    }
  }

  return v5;
}

- (BOOL)removePeopleFromArray:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *people;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NSMutableArray count](self->_people, "count");
  -[NSMutableArray removeObjectsInArray:](self->_people, "removeObjectsInArray:", v4);
  v6 = objc_msgSend(v4, "count");
  if (v6 < v5)
  {
    if (!-[IMPeople coalescingChanges](self, "coalescingChanges"))
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v7 = v4;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v15;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(v7);
            -[IMPeople removedIMHandle:](self, "removedIMHandle:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11++), (_QWORD)v14);
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v9);
      }

    }
    if (!-[NSMutableArray count](self->_people, "count", (_QWORD)v14))
    {
      people = self->_people;
      self->_people = 0;

    }
  }

  return v6 < v5;
}

- (BOOL)addPeopleFromArray:(id)a3 skipMe:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  NSMutableArray *people;
  NSMutableArray *v17;
  NSMutableArray *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((-[NSMutableArray containsObjectIdenticalTo:](self->_people, "containsObjectIdenticalTo:", v14, (_QWORD)v20) & 1) == 0&& (!v4 || (objc_msgSend(v14, "isLoginIMHandle") & 1) == 0))
        {
          objc_msgSend(v8, "addObject:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  v15 = objc_msgSend(v8, "count");
  if (v15)
  {
    people = self->_people;
    if (!people)
    {
      v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v18 = self->_people;
      self->_people = v17;

      people = self->_people;
    }
    -[NSMutableArray addObjectsFromArray:](people, "addObjectsFromArray:", v8, (_QWORD)v20);
    if (!-[IMPeople coalescingChanges](self, "coalescingChanges"))
      -[IMPeople _addedPeople:](self, "_addedPeople:", v8);
  }

  return v15 != 0;
}

- (BOOL)addPeopleFromArray:(id)a3
{
  return MEMORY[0x1E0DE7D20](self, sel_addPeopleFromArray_skipMe_);
}

- (void)imHandle:(id)a3 buddyStatusChanged:(BOOL)a4
{
  _BOOL4 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  if ((objc_msgSend(v6, "isLoginIMHandle") & 1) == 0)
  {
    if (v4)
      -[IMPeople addIMHandle:](self, "addIMHandle:", v6);
    else
      -[IMPeople removeIMHandle:](self, "removeIMHandle:", v6);
  }

}

- (BOOL)hidePeople
{
  return self->_hidePeople;
}

- (void)setPeople:(id)a3
{
  objc_storeStrong((id *)&self->_people, a3);
}

- (int64_t)coalesceCount
{
  return self->_coalesceCount;
}

- (void)setCoalesceCount:(int64_t)a3
{
  self->_coalesceCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_people, 0);
}

@end
