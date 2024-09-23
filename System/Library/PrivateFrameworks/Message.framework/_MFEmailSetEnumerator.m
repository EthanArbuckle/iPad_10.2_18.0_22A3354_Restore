@implementation _MFEmailSetEnumerator

- (_MFEmailSetEnumerator)initWithSet:(id)a3
{
  _MFEmailSetEnumerator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MFEmailSetEnumerator;
  v4 = -[_MFEmailSetEnumerator init](&v6, sel_init);
  if (v4)
    v4->_set = (MFEmailSet *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MFEmailSetEnumerator;
  -[_MFEmailSetEnumerator dealloc](&v3, sel_dealloc);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[MFEmailSet countByEnumeratingWithState:objects:count:](self->_set, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (id)nextObject
{
  void *v3;

  v3 = (void *)0xAAAAAAAAAAAAAAAALL;
  if (-[MFEmailSet countByEnumeratingWithState:objects:count:](self->_set, "countByEnumeratingWithState:objects:count:", &self->_state, &v3, 1))
  {
    return v3;
  }
  else
  {
    return 0;
  }
}

@end
