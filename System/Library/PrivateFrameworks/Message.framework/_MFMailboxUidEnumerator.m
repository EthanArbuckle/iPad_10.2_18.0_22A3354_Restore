@implementation _MFMailboxUidEnumerator

- (id)nextObject
{
  unint64_t index;
  void *v4;

  index = self->_index;
  if (index >= -[NSMutableArray count](self->_mailboxes, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_mailboxes, "objectAtIndex:", self->_index);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ++self->_index;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxes, 0);
}

- (_MFMailboxUidEnumerator)initWithMailbox:(id)a3
{
  id v4;
  _MFMailboxUidEnumerator *v5;
  NSMutableArray *v6;
  NSMutableArray *mailboxes;
  _MFMailboxUidEnumerator *v8;
  objc_super v10;

  v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)_MFMailboxUidEnumerator;
    v5 = -[_MFMailboxUidEnumerator init](&v10, sel_init);
    if (v5)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      mailboxes = v5->_mailboxes;
      v5->_mailboxes = v6;

      objc_msgSend(v4, "addToPostOrderTraversal:", v5->_mailboxes);
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
