@implementation ASFriendListSection

- (NSDate)startDate
{
  return self->_startDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rows, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (NSArray)rows
{
  return self->_rows;
}

- (ASFriendListSection)initWithDate:(id)a3 andRows:(id)a4
{
  id v6;
  id v7;
  ASFriendListSection *v8;
  ASFriendListSection *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ASFriendListSection;
  v8 = -[ASFriendListSection init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ASFriendListSection setStartDate:](v8, "setStartDate:", v6);
    -[ASFriendListSection setRows:](v9, "setRows:", v7);
  }

  return v9;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (void)setRows:(id)a3
{
  objc_storeStrong((id *)&self->_rows, a3);
}

- (BOOL)containsFriendListRow:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ASFriendListSection rows](self, "rows", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(v4, "isEqual:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSDate)endDate
{
  id v3;
  void *v4;
  void *v5;

  if (self->_startDate)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v3, "setDay:", 1);
    objc_msgSend(v3, "setSecond:", -1);
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateByAddingComponents:toDate:options:", v3, self->_startDate, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (NSDate *)v5;
}

@end
