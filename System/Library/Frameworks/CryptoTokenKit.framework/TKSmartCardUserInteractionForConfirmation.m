@implementation TKSmartCardUserInteractionForConfirmation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKSmartCardUserInteractionForConfirmation)initWithCoder:(id)a3
{
  id v4;
  TKSmartCardUserInteractionForConfirmation *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TKSmartCardUserInteractionForConfirmation;
  v5 = -[TKSmartCardUserInteraction initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("result"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_result = objc_msgSend(v6, "integerValue") != 0;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TKSmartCardUserInteractionForConfirmation;
  v4 = a3;
  -[TKSmartCardUserInteraction encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_result, v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("result"));

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
  -[TKSmartCardUserInteractionForConfirmation slot](self, "slot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__TKSmartCardUserInteractionForConfirmation_runWithReply___block_invoke;
  v12[3] = &unk_1E70893A0;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "synchronous:remoteSlotWithErrorHandler:", 0, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __58__TKSmartCardUserInteractionForConfirmation_runWithReply___block_invoke_2;
  v10[3] = &unk_1E7089728;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "runUserInteraction:reply:", self, v10);

}

uint64_t __58__TKSmartCardUserInteractionForConfirmation_runWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__TKSmartCardUserInteractionForConfirmation_runWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)result
{
  return self->_result;
}

- (void)setResult:(BOOL)a3
{
  self->_result = a3;
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
}

@end
