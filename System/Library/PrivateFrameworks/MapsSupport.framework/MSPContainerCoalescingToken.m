@implementation MSPContainerCoalescingToken

- (MSPContainerCoalescingToken)init
{
  MSPContainerCoalescingToken *result;

  result = (MSPContainerCoalescingToken *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (MSPContainerCoalescingToken)initWithContainerOwner:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  MSPContainerCoalescingToken *v8;
  MSPContainerCoalescingToken *v9;
  uint64_t v10;
  NSObject *context;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MSPContainerCoalescingToken;
  v8 = -[MSPContainerCoalescingToken init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_container, v6);
    v10 = objc_msgSend(v7, "copy");
    context = v9->_context;
    v9->_context = v10;

  }
  return v9;
}

- (void)endCoalescingEdits
{
  id WeakRetained;

  if (!self->_invalidated)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_container);
    objc_msgSend(WeakRetained, "_endCoalescingEditsForContext:", self->_context);

    self->_invalidated = 1;
  }
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_invalidated)
    -[MSPContainerCoalescingToken endCoalescingEdits](self, "endCoalescingEdits");
  v3.receiver = self;
  v3.super_class = (Class)MSPContainerCoalescingToken;
  -[MSPContainerCoalescingToken dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_container);
}

@end
