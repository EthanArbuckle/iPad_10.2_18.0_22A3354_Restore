@implementation HKStateMachineState

- (HKStateMachineState)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKStateMachineState)initWithIndex:(int64_t)a3 label:(id)a4
{
  id v6;
  HKStateMachineState *v7;
  HKStateMachineState *v8;
  uint64_t v9;
  NSString *label;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKStateMachineState;
  v7 = -[HKStateMachineState init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_index = a3;
    v9 = objc_msgSend(v6, "copy");
    label = v8->_label;
    v8->_label = (NSString *)v9;

  }
  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%ld)"), self->_label, self->_index);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_index == v4[1]
    && -[NSString isEqualToString:](self->_label, "isEqualToString:", v4[2]);

  return v5;
}

- (int64_t)index
{
  return self->_index;
}

- (NSString)label
{
  return self->_label;
}

- (NSDictionary)incomingTransitions
{
  return self->_incomingTransitions;
}

- (void)setIncomingTransitions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)outgoingTransitions
{
  return self->_outgoingTransitions;
}

- (void)setOutgoingTransitions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outgoingTransitions, 0);
  objc_storeStrong((id *)&self->_incomingTransitions, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
