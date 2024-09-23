@implementation _BKSCancelTouchesTouchDeliveryPolicy

- (_BKSCancelTouchesTouchDeliveryPolicy)initWithContextId:(unsigned int)a3 initialTouchTimestamp:(double)a4
{
  _BKSCancelTouchesTouchDeliveryPolicy *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_BKSCancelTouchesTouchDeliveryPolicy;
  result = -[_BKSCancelTouchesTouchDeliveryPolicy init](&v7, sel_init);
  if (result)
  {
    result->_contextId = a3;
    result->_initialTouchTimestamp = a4;
  }
  return result;
}

- (_BKSCancelTouchesTouchDeliveryPolicy)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  _BKSCancelTouchesTouchDeliveryPolicy *v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("<%@: %p> may only be decoded by an NSXPCCoder."), objc_opt_class(), self);
  objc_msgSend(CFSTR("BKSTouchDeliveryPolicy"), "stringByAppendingString:", CFSTR("ContextId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeInt32ForKey:", v5);

  objc_msgSend(CFSTR("BKSTouchDeliveryPolicy"), "stringByAppendingString:", CFSTR("InitialTouchTimestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", v7);
  v9 = v8;

  objc_msgSend(CFSTR("BKSTouchDeliveryPolicy"), "stringByAppendingString:", CFSTR("AssertionEndpoint"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C81308], v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[_BKSCancelTouchesTouchDeliveryPolicy initWithContextId:initialTouchTimestamp:](self, "initWithContextId:initialTouchTimestamp:", v6, v9);
  -[_BKSCancelTouchesTouchDeliveryPolicy setAssertionEndpoint:](v12, "setAssertionEndpoint:", v11);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t contextId;
  void *v5;
  double initialTouchTimestamp;
  void *v7;
  OS_xpc_object *assertionEndpoint;
  void *v9;
  id v10;

  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("<%@: %p> may only be encoded by an NSXPCCoder."), objc_opt_class(), self);
  contextId = self->_contextId;
  objc_msgSend(CFSTR("BKSTouchDeliveryPolicy"), "stringByAppendingString:", CFSTR("ContextId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeInt32:forKey:", contextId, v5);

  initialTouchTimestamp = self->_initialTouchTimestamp;
  objc_msgSend(CFSTR("BKSTouchDeliveryPolicy"), "stringByAppendingString:", CFSTR("InitialTouchTimestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeDouble:forKey:", v7, initialTouchTimestamp);

  assertionEndpoint = self->_assertionEndpoint;
  objc_msgSend(CFSTR("BKSTouchDeliveryPolicy"), "stringByAppendingString:", CFSTR("AssertionEndpoint"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeXPCObject:forKey:", assertionEndpoint, v9);

}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:", self->_contextId);
  v5 = (id)objc_msgSend(v3, "appendDouble:", self->_initialTouchTimestamp);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _BKSCancelTouchesTouchDeliveryPolicy *v4;
  _BKSCancelTouchesTouchDeliveryPolicy *v5;
  BOOL v6;

  v4 = (_BKSCancelTouchesTouchDeliveryPolicy *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && self->_contextId == v5->_contextId
      && self->_initialTouchTimestamp == v5->_initialTouchTimestamp;

  return v6;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _BKSCancelTouchesTouchDeliveryPolicy *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69___BKSCancelTouchesTouchDeliveryPolicy_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E1EA1BF8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

- (id)matchSharingTouchesPolicy:(id)a3 orCancelTouchesPolicy:(id)a4 orCombinedPolicy:(id)a5
{
  return (id)(*((uint64_t (**)(id, _QWORD, double))a4 + 2))(a4, self->_contextId, self->_initialTouchTimestamp);
}

- (id)assertionEndpoint
{
  return self->_assertionEndpoint;
}

- (void)setAssertionEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_assertionEndpoint, a3);
}

- (unsigned)contextId
{
  return self->_contextId;
}

- (double)initialTouchTimestamp
{
  return self->_initialTouchTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionEndpoint, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
