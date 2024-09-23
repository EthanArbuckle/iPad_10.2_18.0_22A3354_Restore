@implementation BKSTouchDeliveryPolicyAssertion

- (BKSTouchDeliveryPolicyAssertion)init
{
  BKSTouchDeliveryPolicyAssertion *v2;
  xpc_connection_t v3;
  OS_xpc_object *listener;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKSTouchDeliveryPolicyAssertion;
  v2 = -[BKSTouchDeliveryPolicyAssertion init](&v6, sel_init);
  if (v2)
  {
    v3 = xpc_connection_create(0, 0);
    listener = v2->_listener;
    v2->_listener = v3;

    xpc_connection_set_event_handler(v2->_listener, &__block_literal_global_6273);
    xpc_connection_resume(v2->_listener);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[BKSTouchDeliveryPolicyAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BKSTouchDeliveryPolicyAssertion;
  -[BKSTouchDeliveryPolicyAssertion dealloc](&v3, sel_dealloc);
}

- (id)endpoint
{
  OS_xpc_object *listener;
  id v4;

  listener = self->_listener;
  if (!listener)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Getting an endpoint from an invalidated BKSTouchDeliveryPolicyAssertion"), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  return xpc_endpoint_create(listener);
}

- (void)invalidate
{
  NSObject *v3;
  OS_xpc_object *listener;
  OS_xpc_object *v5;
  int v6;
  OS_xpc_object *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_listener)
  {
    BKLogTouchDeliveryPolicy();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      listener = self->_listener;
      v6 = 134217984;
      v7 = listener;
      _os_log_impl(&dword_18A0F0000, v3, OS_LOG_TYPE_DEFAULT, "TDPS client policy assertion invalidating <xpc_object:%p>", (uint8_t *)&v6, 0xCu);
    }

    v5 = self->_listener;
    self->_listener = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

void __39__BKSTouchDeliveryPolicyAssertion_init__block_invoke(uint64_t a1, void *a2)
{
  _xpc_connection_s *connection;

  connection = a2;
  if (MEMORY[0x18D768D50]() == MEMORY[0x1E0C812E0])
  {
    xpc_connection_set_event_handler(connection, &__block_literal_global_1);
    xpc_connection_resume(connection);
  }

}

@end
