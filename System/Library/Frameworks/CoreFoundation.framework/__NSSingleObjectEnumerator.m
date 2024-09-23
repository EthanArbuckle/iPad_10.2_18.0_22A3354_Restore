@implementation __NSSingleObjectEnumerator

- (id)nextObject
{
  id v3;
  id theCollection;

  v3 = self->_theObjectToReturn;
  self->_theObjectToReturn = 0;
  theCollection = self->_theCollection;
  self->_theCollection = 0;

  return v3;
}

- (__NSSingleObjectEnumerator)initWithObject:(id)a3 collection:(id)a4
{
  __NSSingleObjectEnumerator *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return -[__NSSingleObjectEnumerator init](self, "init");
  v8.receiver = self;
  v8.super_class = (Class)__NSSingleObjectEnumerator;
  v6 = -[__NSSingleObjectEnumerator init](&v8, sel_init);
  if (v6)
  {
    v6->_theObjectToReturn = a3;
    v6->_theCollection = a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)__NSSingleObjectEnumerator;
  -[__NSSingleObjectEnumerator dealloc](&v3, sel_dealloc);
}

- (__NSSingleObjectEnumerator)init
{
  qword_1EDCD1038 = (uint64_t)"Attempt to create a single-object enumerator with no object/collection";
  __break(1u);
  return self;
}

- (id)description
{
  __CFString *Mutable;
  id v5;
  id v6;
  objc_super v7;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  Mutable = CFStringCreateMutable(0, 0);
  if (self->_theObjectToReturn)
  {
    v8.receiver = self;
    v8.super_class = (Class)__NSSingleObjectEnumerator;
    v5 = -[NSObject description](&v8, sel_description);
    CFStringAppendFormat(Mutable, 0, CFSTR("%@ that will yield %@"), v5, self->_theObjectToReturn);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)__NSSingleObjectEnumerator;
    v6 = -[NSObject description](&v7, sel_description);
    CFStringAppendFormat(Mutable, 0, CFSTR("%@ that yielded its object"), v6);
  }
  return (id)CFAutorelease(Mutable);
}

@end
