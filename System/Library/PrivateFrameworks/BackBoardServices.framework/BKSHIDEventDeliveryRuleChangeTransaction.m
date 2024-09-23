@implementation BKSHIDEventDeliveryRuleChangeTransaction

- (BOOL)isEqual:(id)a3
{
  BKSHIDEventDeliveryRuleChangeTransaction *v4;
  uint64_t v5;
  BKSHIDEventDeliveryRuleChangeTransaction *v6;
  BKSHIDEventDeliveryRuleChangeTransaction *v7;
  char v8;
  BKSHIDEventDeliveryRuleChangeTransaction *v9;

  v4 = (BKSHIDEventDeliveryRuleChangeTransaction *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v9 = v7;

    if (v9
      && self->_contentsMask == v9->_contentsMask
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects())
    {
      v8 = BSEqualObjects();
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (unint64_t)hash
{
  return BSHashPurifyNS();
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)setDeferringRules:(id)a3
{
  objc_storeStrong((id *)&self->_deferringRules, a3);
  self->_contentsMask |= 2uLL;
}

- (void)setDiscreteDispatchingRules:(id)a3
{
  NSArray *v4;
  NSArray *discreteDispatchingRules;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  discreteDispatchingRules = self->_discreteDispatchingRules;
  self->_discreteDispatchingRules = v4;

  self->_contentsMask |= 1uLL;
}

- (void)setBufferingPredicates:(id)a3
{
  NSArray *v4;
  NSArray *bufferingPredicates;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  bufferingPredicates = self->_bufferingPredicates;
  self->_bufferingPredicates = v4;

  self->_contentsMask |= 0x10uLL;
}

- (void)setActiveUIResponders:(id)a3
{
  NSArray *v4;
  NSArray *activeUIResponders;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  activeUIResponders = self->_activeUIResponders;
  self->_activeUIResponders = v4;

  self->_contentsMask |= 0x20uLL;
}

- (void)setKeyCommandsRegistrations:(id)a3
{
  NSArray *v4;
  NSArray *keyCommandsRegistrations;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  keyCommandsRegistrations = self->_keyCommandsRegistrations;
  self->_keyCommandsRegistrations = v4;

  self->_contentsMask |= 8uLL;
}

- (void)setKeyCommandDispatchingRules:(id)a3
{
  NSArray *v4;
  NSArray *keyCommandDispatchingRules;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  keyCommandDispatchingRules = self->_keyCommandDispatchingRules;
  self->_keyCommandDispatchingRules = v4;

  self->_contentsMask |= 4uLL;
}

- (BKSHIDEventDeliveryRuleChangeTransaction)initWithCoder:(id)a3
{
  id v4;
  BKSHIDEventDeliveryRuleChangeTransaction *v5;
  void *v6;
  uint64_t v7;
  NSArray *discreteDispatchingRules;
  void *v9;
  uint64_t v10;
  NSArray *deferringRules;
  void *v12;
  uint64_t v13;
  NSArray *keyCommandDispatchingRules;
  void *v15;
  uint64_t v16;
  NSArray *keyCommandsRegistrations;
  void *v18;
  uint64_t v19;
  NSArray *bufferingPredicates;
  void *v21;
  uint64_t v22;
  NSArray *activeUIResponders;

  v4 = a3;
  v5 = -[BKSHIDEventDeliveryRuleChangeTransaction init](self, "init");
  if (v5)
  {
    v5->_contentsMask = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("contentsMask"));
    v6 = (void *)objc_opt_class();
    _BKDecodeArrayOfClass(v4, v6, CFSTR("discreteDispatchingRules"));
    v7 = objc_claimAutoreleasedReturnValue();
    discreteDispatchingRules = v5->_discreteDispatchingRules;
    v5->_discreteDispatchingRules = (NSArray *)v7;

    v9 = (void *)objc_opt_class();
    _BKDecodeArrayOfClass(v4, v9, CFSTR("deferringRules"));
    v10 = objc_claimAutoreleasedReturnValue();
    deferringRules = v5->_deferringRules;
    v5->_deferringRules = (NSArray *)v10;

    v12 = (void *)objc_opt_class();
    _BKDecodeArrayOfClass(v4, v12, CFSTR("keyCommandDispatchingRules"));
    v13 = objc_claimAutoreleasedReturnValue();
    keyCommandDispatchingRules = v5->_keyCommandDispatchingRules;
    v5->_keyCommandDispatchingRules = (NSArray *)v13;

    v15 = (void *)objc_opt_class();
    _BKDecodeArrayOfClass(v4, v15, CFSTR("keyCommandsRegistrations"));
    v16 = objc_claimAutoreleasedReturnValue();
    keyCommandsRegistrations = v5->_keyCommandsRegistrations;
    v5->_keyCommandsRegistrations = (NSArray *)v16;

    v18 = (void *)objc_opt_class();
    _BKDecodeArrayOfClass(v4, v18, CFSTR("bufferingPredicates"));
    v19 = objc_claimAutoreleasedReturnValue();
    bufferingPredicates = v5->_bufferingPredicates;
    v5->_bufferingPredicates = (NSArray *)v19;

    v21 = (void *)objc_opt_class();
    _BKDecodeArrayOfClass(v4, v21, CFSTR("activeUIResponders"));
    v22 = objc_claimAutoreleasedReturnValue();
    activeUIResponders = v5->_activeUIResponders;
    v5->_activeUIResponders = (NSArray *)v22;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *discreteDispatchingRules;
  NSArray *deferringRules;
  NSArray *keyCommandDispatchingRules;
  void *v7;
  NSArray *keyCommandsRegistrations;
  NSArray *bufferingPredicates;
  NSArray *activeUIResponders;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "encodeInteger:forKey:", self->_contentsMask, CFSTR("contentsMask"));
  discreteDispatchingRules = self->_discreteDispatchingRules;
  if (discreteDispatchingRules)
    objc_msgSend(v11, "encodeObject:forKey:", discreteDispatchingRules, CFSTR("discreteDispatchingRules"));
  deferringRules = self->_deferringRules;
  if (deferringRules)
    objc_msgSend(v11, "encodeObject:forKey:", deferringRules, CFSTR("deferringRules"));
  keyCommandDispatchingRules = self->_keyCommandDispatchingRules;
  v7 = v11;
  if (keyCommandDispatchingRules)
  {
    objc_msgSend(v11, "encodeObject:forKey:", keyCommandDispatchingRules, CFSTR("keyCommandDispatchingRules"));
    v7 = v11;
  }
  keyCommandsRegistrations = self->_keyCommandsRegistrations;
  if (keyCommandsRegistrations)
  {
    objc_msgSend(v11, "encodeObject:forKey:", keyCommandsRegistrations, CFSTR("keyCommandsRegistrations"));
    v7 = v11;
  }
  bufferingPredicates = self->_bufferingPredicates;
  if (bufferingPredicates)
  {
    objc_msgSend(v11, "encodeObject:forKey:", bufferingPredicates, CFSTR("bufferingPredicates"));
    v7 = v11;
  }
  activeUIResponders = self->_activeUIResponders;
  if (activeUIResponders)
  {
    objc_msgSend(v11, "encodeObject:forKey:", activeUIResponders, CFSTR("activeUIResponders"));
    v7 = v11;
  }

}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  BKSHIDEventDeliveryRuleChangeTransaction *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__BKSHIDEventDeliveryRuleChangeTransaction_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E1EA1BF8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

- (unint64_t)contentsMask
{
  return self->_contentsMask;
}

- (void)setContentsMask:(unint64_t)a3
{
  self->_contentsMask = a3;
}

- (NSArray)discreteDispatchingRules
{
  return self->_discreteDispatchingRules;
}

- (NSArray)deferringRules
{
  return self->_deferringRules;
}

- (NSArray)keyCommandDispatchingRules
{
  return self->_keyCommandDispatchingRules;
}

- (NSArray)keyCommandsRegistrations
{
  return self->_keyCommandsRegistrations;
}

- (NSArray)bufferingPredicates
{
  return self->_bufferingPredicates;
}

- (NSArray)activeUIResponders
{
  return self->_activeUIResponders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeUIResponders, 0);
  objc_storeStrong((id *)&self->_bufferingPredicates, 0);
  objc_storeStrong((id *)&self->_keyCommandsRegistrations, 0);
  objc_storeStrong((id *)&self->_keyCommandDispatchingRules, 0);
  objc_storeStrong((id *)&self->_deferringRules, 0);
  objc_storeStrong((id *)&self->_discreteDispatchingRules, 0);
}

id __73__BKSHIDEventDeliveryRuleChangeTransaction_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUInt64:withName:format:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("contentsMask"), 1);
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("discreteDispatchingRules"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("deferringRules"));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("keyCommandDispatchingRules"));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("keyCommandsRegistrations"));
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("bufferingPredicates"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), CFSTR("activeUIResponders"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
