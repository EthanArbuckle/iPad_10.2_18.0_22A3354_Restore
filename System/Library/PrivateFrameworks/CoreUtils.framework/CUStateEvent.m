@implementation CUStateEvent

- (CUStateEvent)initWithName:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  CUStateEvent *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CUStateEvent *v16;
  uint64_t v17;
  NSString *name;
  uint64_t v19;
  NSDictionary *userInfo;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CUStateEvent;
  v8 = -[CUStateEvent init](&v22, sel_init);
  if (!v8)
    FatalErrorF((uint64_t)"init failed", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v22.receiver);
  v16 = v8;
  v17 = objc_msgSend(v6, "copy");
  name = v16->_name;
  v16->_name = (NSString *)v17;

  v19 = objc_msgSend(v7, "copy");
  userInfo = v16->_userInfo;
  v16->_userInfo = (NSDictionary *)v19;

  return v16;
}

- (void)dealloc
{
  NSString *name;
  NSDictionary *userInfo;
  objc_super v5;

  name = self->_name;
  self->_name = 0;

  userInfo = self->_userInfo;
  self->_userInfo = 0;

  v5.receiver = self;
  v5.super_class = (Class)CUStateEvent;
  -[CUStateEvent dealloc](&v5, sel_dealloc);
}

- (id)description
{
  return (id)-[NSString copy](self->_name, "copy");
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)enterState
{
  if (enterState_sInit != -1)
    dispatch_once(&enterState_sInit, &__block_literal_global_7758);
  return (id)enterState_sState;
}

+ (id)exitState
{
  if (exitState_sInit != -1)
    dispatch_once(&exitState_sInit, &__block_literal_global_31);
  return (id)exitState_sState;
}

+ (id)initialTransition
{
  if (initialTransition_sInit != -1)
    dispatch_once(&initialTransition_sInit, &__block_literal_global_34);
  return (id)initialTransition_sState;
}

void __33__CUStateEvent_initialTransition__block_invoke()
{
  CUStateEvent *v0;
  void *v1;

  v0 = -[CUStateEvent initWithName:userInfo:]([CUStateEvent alloc], "initWithName:userInfo:", CFSTR("initial"), 0);
  v1 = (void *)initialTransition_sState;
  initialTransition_sState = (uint64_t)v0;

}

void __25__CUStateEvent_exitState__block_invoke()
{
  CUStateEvent *v0;
  void *v1;

  v0 = -[CUStateEvent initWithName:userInfo:]([CUStateEvent alloc], "initWithName:userInfo:", CFSTR("exit"), 0);
  v1 = (void *)exitState_sState;
  exitState_sState = (uint64_t)v0;

}

void __26__CUStateEvent_enterState__block_invoke()
{
  CUStateEvent *v0;
  void *v1;

  v0 = -[CUStateEvent initWithName:userInfo:]([CUStateEvent alloc], "initWithName:userInfo:", CFSTR("enter"), 0);
  v1 = (void *)enterState_sState;
  enterState_sState = (uint64_t)v0;

}

@end
