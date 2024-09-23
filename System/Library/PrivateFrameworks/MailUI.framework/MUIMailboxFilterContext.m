@implementation MUIMailboxFilterContext

- (MUIMailboxFilterContext)initWithMailboxes:(id)a3 focus:(id)a4
{
  id v7;
  id v8;
  MUIMailboxFilterContext *v9;
  uint64_t v10;
  NSArray *mailboxes;
  void *v13;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MUIMailboxFilterContext.m"), 15, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mailboxes"));

  }
  v14.receiver = self;
  v14.super_class = (Class)MUIMailboxFilterContext;
  v9 = -[MUIMailboxFilterContext init](&v14, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    mailboxes = v9->_mailboxes;
    v9->_mailboxes = (NSArray *)v10;

    objc_storeStrong((id *)&v9->_focus, a4);
  }

  return v9;
}

+ (id)contextWithMailboxes:(id)a3 focus:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMailboxes:focus:", v7, v6);

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[MUIMailboxFilterContext mailboxes](self, "mailboxes", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 ^= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "hash");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[MUIMailboxFilterContext mailboxes](self, "mailboxes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mailboxes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = EFArraysAreEqual();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSArray)mailboxes
{
  return self->_mailboxes;
}

- (EMFocus)focus
{
  return self->_focus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focus, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);
}

@end
