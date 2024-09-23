@implementation _MFMailboxUidChildrenEnumerator

- (id)nextObject
{
  unint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = -[NSMutableArray count](self->_mailboxes, "count");
  while (self->_index < v3)
  {
    -[NSMutableArray objectAtIndex:](self->_mailboxes, "objectAtIndex:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    ++self->_index;
    if (self->_includeHidden || objc_msgSend(v4, "isVisible"))
      v6 = v5;
    else
      v6 = 0;

    if (v6)
      return v6;
  }
  v6 = 0;
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxes, 0);
}

- (id)_initWithMailbox:(id)a3 includeHiddenChildren:(BOOL)a4
{
  id v6;
  _MFMailboxUidChildrenEnumerator *v7;
  uint64_t v8;
  NSMutableArray *mailboxes;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_MFMailboxUidChildrenEnumerator;
  v7 = -[_MFMailboxUidChildrenEnumerator init](&v11, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "_mutableChildren");
    v8 = objc_claimAutoreleasedReturnValue();
    mailboxes = v7->_mailboxes;
    v7->_mailboxes = (NSMutableArray *)v8;

    v7->_includeHidden = a4;
  }

  return v7;
}

@end
