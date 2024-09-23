@implementation _MFMailboxUidEnumerator

- (id)nextObject
{
  unint64_t index;

  index = self->_index;
  if (index >= -[NSMutableArray count](self->_mailboxes, "count"))
    return 0;
  return (id)-[NSMutableArray objectAtIndex:](self->_mailboxes, "objectAtIndex:", self->_index++);
}

- (_MFMailboxUidEnumerator)initWithMailbox:(id)a3
{
  _MFMailboxUidEnumerator *v4;
  NSMutableArray *v5;
  objc_super v7;

  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)_MFMailboxUidEnumerator;
    v4 = -[_MFMailboxUidEnumerator init](&v7, sel_init);
    if (v4)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v4->_mailboxes = v5;
      objc_msgSend(a3, "addToPostOrderTraversal:", v5);
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MFMailboxUidEnumerator;
  -[_MFMailboxUidEnumerator dealloc](&v3, sel_dealloc);
}

@end
