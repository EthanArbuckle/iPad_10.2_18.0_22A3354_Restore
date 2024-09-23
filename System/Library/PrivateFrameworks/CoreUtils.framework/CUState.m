@implementation CUState

- (CUState)initWithName:(id)a3 parent:(id)a4
{
  id v6;
  id v7;
  CUState *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CUState *v16;
  uint64_t v17;
  NSString *name;
  CUState *v19;
  CUState *parent;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CUState;
  v8 = -[CUState init](&v22, sel_init);
  if (!v8)
    FatalErrorF((uint64_t)"init failed", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v22.receiver);
  v16 = v8;
  v17 = objc_msgSend(v6, "copy");
  name = v16->_name;
  v16->_name = (NSString *)v17;

  v19 = (CUState *)v7;
  parent = v16->_parent;
  v16->_parent = v19;

  return v16;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString *name;
  objc_super v10;

  if (self->_eventHandler || self->_lcaMap || self->_parent)
    FatalErrorF((uint64_t)"State %@: invalidate not called", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self->_name);
  name = self->_name;
  self->_name = 0;

  v10.receiver = self;
  v10.super_class = (Class)CUState;
  -[CUState dealloc](&v10, sel_dealloc);
}

- (id)description
{
  return (id)-[NSString copy](self->_name, "copy");
}

- (void)invalidate
{
  id eventHandler;
  NSPointerArray *lcaMap;
  CUState *parent;

  eventHandler = self->_eventHandler;
  self->_eventHandler = 0;

  -[NSPointerArray setCount:](self->_lcaMap, "setCount:", 0);
  lcaMap = self->_lcaMap;
  self->_lcaMap = 0;

  parent = self->_parent;
  self->_parent = 0;

}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lcaMap, 0);
  objc_storeStrong(&self->_eventHandler, 0);
}

@end
