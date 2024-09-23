@implementation ABBufferQueryCursorCount

- (ABBufferQueryCursorCount)initWithAddressBook:(void *)a3 predicate:(id)a4 includeLinkedContacts:(BOOL)a5 managedConfiguration:(id)a6
{
  ABBufferQueryCount *v7;
  ABBufferQueryCount *v8;
  ABBufferQueryCursorCount *v9;

  v7 = -[ABBufferQueryCount initWithAddressBook:predicate:includeLinkedContacts:managedConfiguration:]([ABBufferQueryCount alloc], "initWithAddressBook:predicate:includeLinkedContacts:managedConfiguration:", a3, a4, a5, a6);
  if (v7)
  {
    v8 = v7;
    v9 = -[ABBufferQueryCursorCount initWithQuery:](self, "initWithQuery:", v7);

    return v9;
  }
  else
  {

    return 0;
  }
}

- (ABBufferQueryCursorCount)initWithQuery:(id)a3
{
  ABBufferQueryCursorCount *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ABBufferQueryCursorCount;
  v4 = -[ABBufferQueryCursorCount init](&v6, sel_init);
  if (v4)
    v4->_query = (ABBufferQueryCount *)a3;
  return v4;
}

- (int64_t)fetchContactCount
{
  CPSqliteStatement *v2;
  sqlite3_stmt **v3;
  sqlite3_stmt *var1;
  int64_t v5;

  v2 = -[ABBufferQuery statement](self->_query, "statement");
  if (!v2)
    return 0;
  v3 = (sqlite3_stmt **)v2;
  var1 = v2->var1;
  if (!var1 || !*v3 || !*((_QWORD *)*v3 + 1))
    return 0;
  if (sqlite3_step(var1) == 100)
    v5 = sqlite3_column_int(v3[1], 0);
  else
    v5 = 0;
  CPSqliteStatementReset();
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ABBufferQueryCursorCount;
  -[ABBufferQueryCursorCount dealloc](&v3, sel_dealloc);
}

- (ABBufferQueryCount)query
{
  return self->_query;
}

@end
