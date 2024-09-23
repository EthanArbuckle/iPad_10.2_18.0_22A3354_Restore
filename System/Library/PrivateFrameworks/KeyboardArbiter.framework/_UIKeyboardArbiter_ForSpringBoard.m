@implementation _UIKeyboardArbiter_ForSpringBoard

- (_UIKeyboardArbiter_ForSpringBoard)init
{
  _UIKeyboardArbiter_ForSpringBoard *v2;
  _UIKeyboardArbiterHost *v3;
  _UIKeyboardArbiterHost *arbiterHost;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIKeyboardArbiter_ForSpringBoard;
  v2 = -[_UIKeyboardArbiter_ForSpringBoard init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_UIKeyboardArbiterHost);
    arbiterHost = v2->_arbiterHost;
    v2->_arbiterHost = v3;

  }
  return v2;
}

+ (id)forwardingTargetForSelector:(SEL)a3
{
  return (id)objc_opt_class();
}

- (_UIKeyboardArbiterHost)arbiterHost
{
  return self->_arbiterHost;
}

- (void)setArbiterHost:(id)a3
{
  objc_storeStrong((id *)&self->_arbiterHost, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arbiterHost, 0);
}

@end
