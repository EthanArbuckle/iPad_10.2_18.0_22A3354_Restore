@implementation BKSTouchDeliveryPolicy

- (id)reducePolicyToObjectWithBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__BKSTouchDeliveryPolicy_reducePolicyToObjectWithBlock___block_invoke;
  v9[3] = &unk_1E1EA03E8;
  v10 = v4;
  v5 = v4;
  -[BKSTouchDeliveryPolicy policyByMappingContainedPoliciesWithBlock:](self, "policyByMappingContainedPoliciesWithBlock:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v4 + 2))(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)policyByMappingContainedPoliciesWithBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v4 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__BKSTouchDeliveryPolicy_policyByMappingContainedPoliciesWithBlock___block_invoke;
  v11[3] = &unk_1E1EA0370;
  v11[4] = self;
  v9 = v4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__BKSTouchDeliveryPolicy_policyByMappingContainedPoliciesWithBlock___block_invoke_2;
  v10[3] = &unk_1E1EA0398;
  v10[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__BKSTouchDeliveryPolicy_policyByMappingContainedPoliciesWithBlock___block_invoke_3;
  v8[3] = &unk_1E1EA03C0;
  v5 = v4;
  -[BKSTouchDeliveryPolicy matchSharingTouchesPolicy:orCancelTouchesPolicy:orCombinedPolicy:](self, "matchSharingTouchesPolicy:orCancelTouchesPolicy:orCombinedPolicy:", v11, v10, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __68__BKSTouchDeliveryPolicy_policyByMappingContainedPoliciesWithBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void (**v6)(id, _QWORD);
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v6[2](v6, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "addObject:", v13, (_QWORD)v16);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  +[BKSTouchDeliveryPolicy policyByCombiningPolicies:](BKSTouchDeliveryPolicy, "policyByCombiningPolicies:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)policyByCombiningPolicies:(id)a3
{
  id v3;
  _BKSCombinedTouchDeliveryPolicy *v4;

  v3 = a3;
  v4 = -[_BKSCombinedTouchDeliveryPolicy initWithPolicies:]([_BKSCombinedTouchDeliveryPolicy alloc], "initWithPolicies:", v3);

  return v4;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v7;

  if (objc_msgSend(a1, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
    return 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___BKSTouchDeliveryPolicy;
    return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
  }
}

id __68__BKSTouchDeliveryPolicy_policyByMappingContainedPoliciesWithBlock___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __56__BKSTouchDeliveryPolicy_reducePolicyToObjectWithBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reducePolicyToObjectWithBlock:", *(_QWORD *)(a1 + 32));
}

- (BKSTouchDeliveryPolicy)initWithCoder:(id)a3
{
  -[BKSTouchDeliveryPolicy doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  -[BKSTouchDeliveryPolicy doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (unint64_t)hash
{
  -[BKSTouchDeliveryPolicy doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  -[BKSTouchDeliveryPolicy doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  -[BKSTouchDeliveryPolicy doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (id)matchSharingTouchesPolicy:(id)a3 orCancelTouchesPolicy:(id)a4 orCombinedPolicy:(id)a5
{
  -[BKSTouchDeliveryPolicy doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (OS_xpc_object)assertionEndpoint
{
  -[BKSTouchDeliveryPolicy doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setAssertionEndpoint:(id)a3
{
  -[BKSTouchDeliveryPolicy doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (id)policyIncludingPolicy:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  collectPolicies(self, v6);
  collectPolicies(v5, v6);

  +[BKSTouchDeliveryPolicy policyByCombiningPolicies:](BKSTouchDeliveryPolicy, "policyByCombiningPolicies:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)policyExcludingPolicy:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__BKSTouchDeliveryPolicy_policyExcludingPolicy___block_invoke;
  v8[3] = &unk_1E1EA0410;
  v9 = v4;
  v5 = v4;
  -[BKSTouchDeliveryPolicy reducePolicyToObjectWithBlock:](self, "reducePolicyToObjectWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)policyExcludingPolicyIdenticalTo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__BKSTouchDeliveryPolicy_policyExcludingPolicyIdenticalTo___block_invoke;
  v8[3] = &unk_1E1EA0410;
  v9 = v4;
  v5 = v4;
  -[BKSTouchDeliveryPolicy reducePolicyToObjectWithBlock:](self, "reducePolicyToObjectWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __59__BKSTouchDeliveryPolicy_policyExcludingPolicyIdenticalTo___block_invoke(uint64_t a1, void *a2)
{
  if (*(void **)(a1 + 32) == a2)
    return 0;
  else
    return a2;
}

id __48__BKSTouchDeliveryPolicy_policyExcludingPolicy___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  if (objc_msgSend(v3, "isEqual:", v2))
    v4 = 0;
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

id __68__BKSTouchDeliveryPolicy_policyByMappingContainedPoliciesWithBlock___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (BOOL)supportsSecureCoding
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

+ (id)policyRequiringSharingOfTouchesDeliveredToChildContextId:(unsigned int)a3 withHostContextId:(unsigned int)a4
{
  return -[_BKSShareTouchesTouchDeliveryPolicy initWithChildContextId:hostContextId:]([_BKSShareTouchesTouchDeliveryPolicy alloc], "initWithChildContextId:hostContextId:", *(_QWORD *)&a3, *(_QWORD *)&a4);
}

+ (id)policyCancelingTouchesDeliveredToContextId:(unsigned int)a3 withInitialTouchTimestamp:(double)a4
{
  return -[_BKSCancelTouchesTouchDeliveryPolicy initWithContextId:initialTouchTimestamp:]([_BKSCancelTouchesTouchDeliveryPolicy alloc], "initWithContextId:initialTouchTimestamp:", *(_QWORD *)&a3, a4);
}

@end
