@implementation IKDOMEvent

- (IKDOMEvent)initWithAppContext:(id)a3 type:(id)a4 xmlAttribute:(id)a5 canBubble:(BOOL)a6 isCancelable:(BOOL)a7
{
  id v13;
  id v14;
  IKDOMEvent *v15;
  IKDOMEvent *v16;
  objc_super v18;

  v13 = a4;
  v14 = a5;
  v18.receiver = self;
  v18.super_class = (Class)IKDOMEvent;
  v15 = -[IKJSObject initWithAppContext:](&v18, sel_initWithAppContext_, a3);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_type, a4);
    objc_storeStrong((id *)&v16->_xmlAttribute, a5);
    v16->_bubbles = a6;
    v16->_cancelable = a7;
  }

  return v16;
}

- (IKDOMEvent)initWithType:(id)a3 eventInit:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  IKDOMEvent *v16;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = a3;
  objc_msgSend(v8, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("on%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bubbles"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cancelable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
  +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[IKDOMEvent initWithAppContext:type:xmlAttribute:canBubble:isCancelable:](self, "initWithAppContext:type:xmlAttribute:canBubble:isCancelable:", v15, v8, v10, v12, v14);

  return v16;
}

- (void)updateDispatchStateWithCurrentTarget:(id)a3 phase:(int64_t)a4
{
  id v6;

  v6 = a3;
  if (!-[IKDOMEvent isPropagationStopped](self, "isPropagationStopped")
    && !-[IKDOMEvent isImmediatePropagationStopped](self, "isImmediatePropagationStopped"))
  {
    -[IKDOMEvent setCurrentTarget:](self, "setCurrentTarget:", v6);
    -[IKDOMEvent setEventPhase:](self, "setEventPhase:", a4);
  }

}

- (BOOL)isPropagationStopped
{
  int64_t v3;

  v3 = -[IKDOMEvent dispatchState](self, "dispatchState");
  if (v3 != 1)
    LOBYTE(v3) = -[IKDOMEvent dispatchState](self, "dispatchState") == 2;
  return v3;
}

- (BOOL)isImmediatePropagationStopped
{
  return -[IKDOMEvent dispatchState](self, "dispatchState") == 1;
}

- (void)stopPropagation
{
  if (!-[IKDOMEvent isPropagationStopped](self, "isPropagationStopped"))
    -[IKDOMEvent setDispatchState:](self, "setDispatchState:", 2);
}

- (void)preventDefault
{
  if (-[IKDOMEvent cancelable](self, "cancelable"))
    -[IKDOMEvent setDefaultPrevented:](self, "setDefaultPrevented:", 1);
}

- (void)stopImmediatePropagation
{
  if (!-[IKDOMEvent isImmediatePropagationStopped](self, "isImmediatePropagationStopped"))
    -[IKDOMEvent setDispatchState:](self, "setDispatchState:", 1);
}

- (NSString)type
{
  return self->_type;
}

- (IKDOMNode)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  objc_storeStrong((id *)&self->_target, a3);
}

- (BOOL)bubbles
{
  return self->_bubbles;
}

- (BOOL)cancelable
{
  return self->_cancelable;
}

- (NSDate)timeStamp
{
  return self->_timeStamp;
}

- (NSString)xmlAttribute
{
  return self->_xmlAttribute;
}

- (BOOL)isInUse
{
  return self->_inUse;
}

- (void)setInUse:(BOOL)a3
{
  self->_inUse = a3;
}

- (IKDOMNode)currentTarget
{
  return self->_currentTarget;
}

- (void)setCurrentTarget:(id)a3
{
  objc_storeStrong((id *)&self->_currentTarget, a3);
}

- (int64_t)eventPhase
{
  return self->_eventPhase;
}

- (void)setEventPhase:(int64_t)a3
{
  self->_eventPhase = a3;
}

- (int64_t)dispatchState
{
  return self->_dispatchState;
}

- (void)setDispatchState:(int64_t)a3
{
  self->_dispatchState = a3;
}

- (BOOL)defaultPrevented
{
  return self->_defaultPrevented;
}

- (void)setDefaultPrevented:(BOOL)a3
{
  self->_defaultPrevented = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTarget, 0);
  objc_storeStrong((id *)&self->_xmlAttribute, 0);
  objc_storeStrong((id *)&self->_timeStamp, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
