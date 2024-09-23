@implementation _NSIndexSetEnumerator

- (_NSIndexSetEnumerator)initWithIndexSet:(id)a3
{
  _NSIndexSetEnumerator *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)_NSIndexSetEnumerator;
  v4 = -[_NSIndexSetEnumerator init](&v6, sel_init);
  if (v4)
  {
    v4->_indexSet = (NSIndexSet *)a3;
    v4->_index = objc_msgSend(a3, "firstIndex");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_NSIndexSetEnumerator;
  -[_NSIndexSetEnumerator dealloc](&v3, sel_dealloc);
}

- (id)nextObject
{
  unint64_t index;

  index = self->_index;
  if (index == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  self->_index = -[NSIndexSet indexGreaterThanIndex:](self->_indexSet, "indexGreaterThanIndex:", index);
  return +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", index);
}

@end
