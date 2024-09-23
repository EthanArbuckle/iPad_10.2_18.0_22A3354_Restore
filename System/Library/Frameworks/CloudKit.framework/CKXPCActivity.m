@implementation CKXPCActivity

- (CKXPCActivity)initWithXPCActivity:(id)a3
{
  _xpc_activity_s *v5;
  CKXPCActivity *v6;
  CKXPCActivity *v7;
  OS_xpc_object *v8;
  OS_xpc_object *criteria;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSString *identifier;
  objc_super v17;

  v5 = (_xpc_activity_s *)a3;
  v17.receiver = self;
  v17.super_class = (Class)CKXPCActivity;
  v6 = -[CKXPCActivity init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_activity, a3);
    v8 = (OS_xpc_object *)xpc_activity_copy_criteria(v5);
    criteria = v7->_criteria;
    v7->_criteria = v8;

    v10 = xpc_activity_copy_identifier();
    if (v10)
    {
      v13 = (void *)v10;
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v11, v10, v12);
      v14 = objc_claimAutoreleasedReturnValue();
      identifier = v7->_identifier;
      v7->_identifier = (NSString *)v14;

      free(v13);
    }
    v7->_shouldBeDataBudgeted = xpc_activity_should_be_data_budgeted();
  }

  return v7;
}

- (BOOL)shouldBeDataBudgeted
{
  return self->_shouldBeDataBudgeted;
}

- (_xpc_activity_eligibility_changed_handler_s)addEligibilityChangedHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _xpc_activity_eligibility_changed_handler_s *v9;

  v4 = a3;
  objc_msgSend_activity(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (_xpc_activity_eligibility_changed_handler_s *)xpc_activity_add_eligibility_changed_handler();

  return v9;
}

- (void)removeEligibilityChangedHandler:(_xpc_activity_eligibility_changed_handler_s *)a3
{
  xpc_activity_remove_eligibility_changed_handler();
}

- (int64_t)state
{
  uint64_t v2;
  uint64_t v3;
  _xpc_activity_s *v4;
  xpc_activity_state_t state;

  objc_msgSend_activity(self, a2, v2, v3);
  v4 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
  state = xpc_activity_get_state(v4);

  return state;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (OS_xpc_object)criteria
{
  return self->_criteria;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
