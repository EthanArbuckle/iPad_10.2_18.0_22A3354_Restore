@implementation ENNoteSearch

- (ENNoteSearch)init
{
  return -[ENNoteSearch initWithSearchString:](self, "initWithSearchString:", &stru_24F8BBA48);
}

- (ENNoteSearch)initWithSearchString:(id)a3
{
  id v4;
  ENNoteSearch *v5;
  void *v6;
  ENNoteSearch *v7;
  objc_super v9;

  v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)ENNoteSearch;
    v5 = -[ENNoteSearch init](&v9, sel_init);
    if (v5)
    {
      v6 = (void *)objc_msgSend(v4, "copy");
      -[ENNoteSearch setSearchString:](v5, "setSearchString:", v6);

    }
    self = v5;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_storeStrong((id *)&self->_searchString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchString, 0);
}

+ (id)noteSearchWithSearchString:(id)a3
{
  id v3;
  ENNoteSearch *v4;

  v3 = a3;
  v4 = -[ENNoteSearch initWithSearchString:]([ENNoteSearch alloc], "initWithSearchString:", v3);

  return v4;
}

+ (id)noteSearchCreatedByThisApplication
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  ENNoteSearch *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  +[ENSession sharedSession](ENSession, "sharedSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("sourceApplication:%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ENNoteSearch initWithSearchString:]([ENNoteSearch alloc], "initWithSearchString:", v5);
  return v6;
}

@end
