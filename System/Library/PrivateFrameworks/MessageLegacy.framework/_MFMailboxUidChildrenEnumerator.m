@implementation _MFMailboxUidChildrenEnumerator

- (id)_initWithMailbox:(id)a3 includeHiddenChildren:(BOOL)a4
{
  _MFMailboxUidChildrenEnumerator *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MFMailboxUidChildrenEnumerator;
  v6 = -[_MFMailboxUidChildrenEnumerator init](&v8, sel_init);
  if (v6)
  {
    v6->_mailboxes = (NSMutableArray *)(id)objc_msgSend(a3, "_mutableChildren");
    v6->_includeHidden = a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MFMailboxUidChildrenEnumerator;
  -[_MFMailboxUidChildrenEnumerator dealloc](&v3, sel_dealloc);
}

- (id)nextObject
{
  unint64_t v3;
  void *v4;
  void *v5;

  v3 = -[NSMutableArray count](self->_mailboxes, "count");
  while (self->_index < v3)
  {
    v4 = (void *)-[NSMutableArray objectAtIndex:](self->_mailboxes, "objectAtIndex:");
    v5 = v4;
    ++self->_index;
    if (!self->_includeHidden && !objc_msgSend(v4, "isVisible"))
      v5 = 0;
    if (v5)
      return v5;
  }
  return 0;
}

@end
