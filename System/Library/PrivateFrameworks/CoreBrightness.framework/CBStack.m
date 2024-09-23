@implementation CBStack

- (void)pushObj:(id)a3
{
  -[NSMutableArray addObject:](self->_stack, "addObject:", a3);
  ++self->_length;
}

- (id)popObj
{
  id v2;
  id v4;

  v4 = (id)-[NSMutableArray objectAtIndex:](self->_stack, "objectAtIndex:");
  v2 = v4;
  -[NSMutableArray removeObjectAtIndex:](self->_stack, "removeObjectAtIndex:", 0);
  --self->_length;
  return v4;
}

- (NSMutableArray)stack
{
  return self->_stack;
}

- (CBStack)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Invalid initialiser for %@."), +[CBStack className](CBStack, "className"));
  return 0;
}

- (CBStack)initWithLength:(unint64_t)a3
{
  os_log_t v3;
  id v4;
  uint64_t v5;
  objc_super v7;
  unint64_t v8;
  SEL v9;
  CBStack *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CBStack;
  v10 = -[CBStack init](&v7, sel_init);
  if (v10)
  {
    v3 = os_log_create("com.apple.CoreBrightness.CBStack", "default");
    v10->_logHandle = (OS_os_log *)v3;
    v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v5 = objc_msgSend(v4, "initWithCapacity:", v8);
    v10->_stack = (NSMutableArray *)v5;
    v10->_length = v8;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBStack *v4;

  v4 = self;
  v3 = a2;
  if (self->_logHandle)
  {

    v4->_logHandle = 0;
  }

  v2.receiver = v4;
  v2.super_class = (Class)CBStack;
  -[CBStack dealloc](&v2, sel_dealloc);
}

- (void)clear
{
  -[NSMutableArray removeAllObjects](self->_stack, "removeAllObjects", a2, self);
}

- (void)printStack
{
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_stack, "enumerateObjectsUsingBlock:", &__block_literal_global_17, a2, self);
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

- (id)objectToPop
{
  return self->_objectToPop;
}

@end
