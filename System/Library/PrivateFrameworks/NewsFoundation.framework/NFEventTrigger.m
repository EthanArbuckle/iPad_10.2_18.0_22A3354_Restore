@implementation NFEventTrigger

- (BOOL)fireOnce
{
  return self->_fireOnce;
}

- (NSString)key
{
  return self->_key;
}

- (NFEventTrigger)initWithKey:(id)a3 fireOnce:(BOOL)a4 fireOnAny:(BOOL)a5 events:(id)a6 block:(id)a7
{
  id v13;
  id v14;
  id v15;
  NFEventTrigger *v16;
  NFEventTrigger *v17;
  uint64_t v18;
  id block;
  objc_super v21;

  v13 = a3;
  v14 = a6;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)NFEventTrigger;
  v16 = -[NFEventTrigger init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_events, a6);
    v18 = MEMORY[0x212BF7858](v15);
    block = v17->_block;
    v17->_block = (id)v18;

    objc_storeStrong((id *)&v17->_key, a3);
    v17->_fireOnce = a4;
    v17->_fireOnAny = a5;
  }

  return v17;
}

- (BOOL)fireOnAny
{
  return self->_fireOnAny;
}

- (NSSet)events
{
  return self->_events;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
