@implementation AVEventManagerAction

- (BOOL)isEqual:(id)a3
{
  AVEventManagerAction *v4;
  NSString *event;
  char v6;

  v4 = (AVEventManagerAction *)a3;
  if (v4 == self)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
    goto LABEL_7;
  }
  event = self->_event;
  if (event == v4->_event)
LABEL_5:
    v6 = 1;
  else
    v6 = -[NSString isEqualToString:](event, "isEqualToString:");
LABEL_7:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
}

+ (id)actionWithTarget:(id)a3 selector:(SEL)a4 event:(id)a5
{
  id v7;
  id v8;
  AVEventManagerSelectorAction *v9;

  v7 = a5;
  v8 = a3;
  v9 = -[AVEventManagerSelectorAction initWithTarget:selector:event:]([AVEventManagerSelectorAction alloc], "initWithTarget:selector:event:", v8, a4, v7);

  return v9;
}

- (AVEventManagerAction)initWithEvent:(id)a3
{
  id v5;
  AVEventManagerAction *v6;
  AVEventManagerAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVEventManagerAction;
  v6 = -[AVEventManagerAction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_event, a3);

  return v7;
}

- (BOOL)hasMatchingEvent:(id)a3
{
  NSString *event;

  event = self->_event;
  return event == a3 || -[NSString isEqualToString:](event, "isEqualToString:");
}

- (BOOL)hasMatchingTarget:(id)a3 withSelector:(SEL)a4 forEvent:(id)a5
{
  return 0;
}

- (void)sendAction:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("sendAction: must be implmemented by subclass."));
}

- (NSString)event
{
  return self->_event;
}

+ (id)actionWithBlock:(id)a3 event:(id)a4
{
  id v5;
  id v6;
  AVEventManagerBlockAction *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[AVEventManagerBlockAction initWithBlock:event:]([AVEventManagerBlockAction alloc], "initWithBlock:event:", v6, v5);

  return v7;
}

@end
