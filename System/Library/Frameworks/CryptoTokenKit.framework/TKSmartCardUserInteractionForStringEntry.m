@implementation TKSmartCardUserInteractionForStringEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKSmartCardUserInteractionForStringEntry)initWithCoder:(id)a3
{
  id v4;
  TKSmartCardUserInteractionForStringEntry *v5;
  void *v6;
  uint64_t v7;
  NSString *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TKSmartCardUserInteractionForStringEntry;
  v5 = -[TKSmartCardUserInteraction initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("result"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    v8 = v5->_result;
    v5->_result = (NSString *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TKSmartCardUserInteractionForStringEntry;
  v4 = a3;
  -[TKSmartCardUserInteraction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_result, CFSTR("result"), v5.receiver, v5.super_class);

}

- (void)runWithReply:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[TKSmartCardUserInteractionForStringEntry slot](self, "slot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__TKSmartCardUserInteractionForStringEntry_runWithReply___block_invoke;
  v12[3] = &unk_1E70893A0;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "synchronous:remoteSlotWithErrorHandler:", 0, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __57__TKSmartCardUserInteractionForStringEntry_runWithReply___block_invoke_2;
  v10[3] = &unk_1E7089728;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "runUserInteraction:reply:", self, v10);

}

uint64_t __57__TKSmartCardUserInteractionForStringEntry_runWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__TKSmartCardUserInteractionForStringEntry_runWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSString)result
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (TKSmartCardSlot)slot
{
  return (TKSmartCardSlot *)objc_loadWeakRetained((id *)&self->_slot);
}

- (void)setSlot:(id)a3
{
  objc_storeWeak((id *)&self->_slot, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_slot);
  objc_storeStrong((id *)&self->_result, 0);
}

@end
