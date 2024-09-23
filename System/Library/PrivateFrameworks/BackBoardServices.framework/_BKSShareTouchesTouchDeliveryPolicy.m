@implementation _BKSShareTouchesTouchDeliveryPolicy

- (id)matchSharingTouchesPolicy:(id)a3 orCancelTouchesPolicy:(id)a4 orCombinedPolicy:(id)a5
{
  return (id)(*((uint64_t (**)(id, _QWORD, _QWORD))a3 + 2))(a3, self->_childContextId, self->_hostContextId);
}

- (_BKSShareTouchesTouchDeliveryPolicy)initWithChildContextId:(unsigned int)a3 hostContextId:(unsigned int)a4
{
  _BKSShareTouchesTouchDeliveryPolicy *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_BKSShareTouchesTouchDeliveryPolicy;
  result = -[_BKSShareTouchesTouchDeliveryPolicy init](&v7, sel_init);
  if (result)
  {
    result->_childContextId = a3;
    result->_hostContextId = a4;
  }
  return result;
}

- (_BKSShareTouchesTouchDeliveryPolicy)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BKSShareTouchesTouchDeliveryPolicy *v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("<%@: %p> may only be decoded by an NSXPCCoder."), objc_opt_class(), self);
  objc_msgSend(CFSTR("BKSTouchDeliveryPolicy"), "stringByAppendingString:", CFSTR("ChildContextId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeInt32ForKey:", v5);

  objc_msgSend(CFSTR("BKSTouchDeliveryPolicy"), "stringByAppendingString:", CFSTR("HostContextId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeInt32ForKey:", v7);

  objc_msgSend(CFSTR("BKSTouchDeliveryPolicy"), "stringByAppendingString:", CFSTR("AssertionEndpoint"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C81308], v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[_BKSShareTouchesTouchDeliveryPolicy initWithChildContextId:hostContextId:](self, "initWithChildContextId:hostContextId:", v6, v8);
  -[_BKSShareTouchesTouchDeliveryPolicy setAssertionEndpoint:](v11, "setAssertionEndpoint:", v10);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t childContextId;
  void *v5;
  uint64_t hostContextId;
  void *v7;
  OS_xpc_object *assertionEndpoint;
  void *v9;
  id v10;

  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("<%@: %p> may only be encoded by an NSXPCCoder."), objc_opt_class(), self);
  childContextId = self->_childContextId;
  objc_msgSend(CFSTR("BKSTouchDeliveryPolicy"), "stringByAppendingString:", CFSTR("ChildContextId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeInt32:forKey:", childContextId, v5);

  hostContextId = self->_hostContextId;
  objc_msgSend(CFSTR("BKSTouchDeliveryPolicy"), "stringByAppendingString:", CFSTR("HostContextId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeInt32:forKey:", hostContextId, v7);

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
  v4 = (id)objc_msgSend(v3, "appendInteger:", self->_childContextId);
  v5 = (id)objc_msgSend(v3, "appendInteger:", self->_hostContextId);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _BKSShareTouchesTouchDeliveryPolicy *v4;
  _BKSShareTouchesTouchDeliveryPolicy *v5;
  BOOL v6;

  v4 = (_BKSShareTouchesTouchDeliveryPolicy *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && self->_childContextId == v5->_childContextId
      && self->_hostContextId == v5->_hostContextId;

  return v6;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _BKSShareTouchesTouchDeliveryPolicy *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68___BKSShareTouchesTouchDeliveryPolicy_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E1EA1BF8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

- (id)assertionEndpoint
{
  return self->_assertionEndpoint;
}

- (void)setAssertionEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_assertionEndpoint, a3);
}

- (unsigned)childContextId
{
  return self->_childContextId;
}

- (unsigned)hostContextId
{
  return self->_hostContextId;
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
