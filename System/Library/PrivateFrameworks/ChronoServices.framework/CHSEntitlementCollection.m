@implementation CHSEntitlementCollection

- (id)_initFromCollection:(id)a3
{
  _BYTE *v4;
  CHSEntitlementCollection *v5;
  CHSEntitlementCollection *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CHSEntitlementCollection;
  v5 = -[CHSEntitlementCollection init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_usesEventService = v4[8];
    v5->_canOpenSystemURLs = v4[9];
    v5->_canKeepAlive = v4[10];
    v5->_invalidatesOnStorefrontChange = v4[11];
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  CHSEntitlementCollection *v4;
  unsigned __int8 *v5;
  BOOL v6;

  v4 = (CHSEntitlementCollection *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = self->_usesEventService == v5[8]
        && self->_canOpenSystemURLs == v5[9]
        && self->_canKeepAlive == v5[10]
        && self->_invalidatesOnStorefrontChange == v5[11];

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint8x8_t v2;
  uint16x4_t v3;

  v2.i32[0] = *(_DWORD *)&self->_usesEventService;
  v3 = vshl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v2), (uint16x4_t)0x4000300020001);
  return (v3.i8[0] | v3.i8[4] | ((v3.i32[0] | v3.i32[1]) >> 16)) ^ 0x1Fu;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CHSEntitlementCollection _initFromCollection:]([CHSEntitlementCollection alloc], "_initFromCollection:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CHSEntitlementCollection _initFromCollection:]([CHSMutableEntitlementCollection alloc], "_initFromCollection:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", self->_usesEventService, CFSTR("usesEventService"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_canOpenSystemURLs, CFSTR("canOpenSystemURLs"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_canKeepAlive, CFSTR("canKeepAlive"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_invalidatesOnStorefrontChange, CFSTR("invalidatesOnStorefrontChange"));

}

- (CHSEntitlementCollection)initWithCoder:(id)a3
{
  id v4;
  CHSEntitlementCollection *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CHSEntitlementCollection;
  v5 = -[CHSEntitlementCollection init](&v7, sel_init);
  if (v5)
  {
    v5->_usesEventService = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usesEventService"));
    v5->_canOpenSystemURLs = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canOpenSystemURLs"));
    v5->_canKeepAlive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canKeepAlive"));
    v5->_invalidatesOnStorefrontChange = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("invalidatesOnStorefrontChange"));
  }

  return v5;
}

- (NSString)description
{
  return (NSString *)-[CHSEntitlementCollection descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescriptionBuilder
{
  return -[CHSEntitlementCollection descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CHSEntitlementCollection descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  CHSEntitlementCollection *v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__CHSEntitlementCollection_descriptionBuilderWithMultilinePrefix___block_invoke;
  v8[3] = &unk_1E2A5A290;
  v5 = v4;
  v9 = v5;
  v10 = self;
  objc_msgSend(v5, "appendProem:block:", self, v8);
  v6 = v5;

  return v6;
}

id __66__CHSEntitlementCollection_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("usesEventService"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 9), CFSTR("canOpenSystemURLs"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 10), CFSTR("canKeepAlive"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 11), CFSTR("invalidatesOnStorefrontChange"));
}

- (BOOL)usesEventService
{
  return self->_usesEventService;
}

- (BOOL)canOpenSystemURLs
{
  return self->_canOpenSystemURLs;
}

- (BOOL)canKeepAlive
{
  return self->_canKeepAlive;
}

- (BOOL)invalidatesOnStorefrontChange
{
  return self->_invalidatesOnStorefrontChange;
}

@end
