@implementation __CFNCoreLoggable

- (id)_initWithObject:(id)a3 name:(const char *)a4
{
  __CFNCoreLoggable *v4;
  CoreLoggable *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)__CFNCoreLoggable;
  v4 = -[__CFNCoreLoggable init](&v7, sel_init, a3, a4);
  if (v4)
  {
    v5 = (CoreLoggable *)operator new();
    v5->var0 = (void **)&off_1E14E5838;
    v4->_loggable = v5;
  }
  return v4;
}

- (__CFNCoreLoggable)initWithLoggableName:(const char *)a3
{
  return (__CFNCoreLoggable *)-[__CFNCoreLoggable _initWithObject:name:](self, "_initWithObject:name:", self, a3);
}

- (const)loggable
{
  return self->_loggable;
}

- (void)dealloc
{
  CoreLoggable *loggable;
  objc_super v4;

  loggable = self->_loggable;
  if (loggable)
    (*((void (**)(CoreLoggable *, SEL))loggable->var0 + 1))(loggable, a2);
  v4.receiver = self;
  v4.super_class = (Class)__CFNCoreLoggable;
  -[__CFNCoreLoggable dealloc](&v4, sel_dealloc);
}

@end
