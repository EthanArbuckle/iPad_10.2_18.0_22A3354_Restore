@implementation NSNotificationObservable

+ (id)observableWithName:(id)a3 object:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithName:object:", a3, a4);
}

- (NSNotificationObservable)initWithName:(id)a3 object:(id)a4
{
  NSNotificationObservable *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSNotificationObservable;
  v6 = -[NSNotificationObservable init](&v8, sel_init);
  if (v6)
    -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", v6, sel_receiveObservedValue_, a3, a4);
  return v6;
}

@end
