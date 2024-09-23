@implementation TKSmartCardUserInteractionForSecurePINChange

- (TKSmartCardUserInteractionForSecurePINChange)init
{
  TKSmartCardUserInteractionForSecurePINChange *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TKSmartCardUserInteractionForSecurePINChange;
  result = -[TKSmartCardUserInteractionForPINOperation init](&v3, sel_init);
  if (result)
    result->_PINConfirmation = 0;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKSmartCardUserInteractionForSecurePINChange)initWithCoder:(id)a3
{
  id v4;
  TKSmartCardUserInteractionForSecurePINChange *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  TKSmartCardPINFormat *PINFormat;
  void *v10;
  uint64_t v11;
  NSData *APDU;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TKSmartCardUserInteractionForSecurePINChange;
  v5 = -[TKSmartCardUserInteractionForPINOperation initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PINConfirmation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_PINConfirmation = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PINFormat"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    PINFormat = v5->_PINFormat;
    v5->_PINFormat = (TKSmartCardPINFormat *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("APDU"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    APDU = v5->_APDU;
    v5->_APDU = (NSData *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentPINByteOffset"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_currentPINByteOffset = objc_msgSend(v13, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("newPINByteOffset"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_newPINByteOffset = objc_msgSend(v14, "integerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TKSmartCardUserInteractionForSecurePINChange;
  v4 = a3;
  -[TKSmartCardUserInteractionForPINOperation encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_PINConfirmation, v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("PINConfirmation"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_PINFormat, CFSTR("PINFormat"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_APDU, CFSTR("APDU"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_currentPINByteOffset);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("currentPINByteOffset"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_newPINByteOffset);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("newPINByteOffset"));

}

- (void)setSlot:(id)a3 PINFormat:(id)a4 APDU:(id)a5 currentPINByteOffset:(int64_t)a6 newPINByteOffset:(int64_t)a7
{
  id v12;
  id v13;

  v12 = a5;
  v13 = a4;
  -[TKSmartCardUserInteractionForSecurePINChange setSlot:](self, "setSlot:", a3);
  -[TKSmartCardUserInteractionForSecurePINChange setPINFormat:](self, "setPINFormat:", v13);

  -[TKSmartCardUserInteractionForSecurePINChange setAPDU:](self, "setAPDU:", v12);
  -[TKSmartCardUserInteractionForSecurePINChange setCurrentPINByteOffset:](self, "setCurrentPINByteOffset:", a6);
  -[TKSmartCardUserInteractionForSecurePINChange setNewPINByteOffset:](self, "setNewPINByteOffset:", a7);
}

- (void)runWithReply:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[TKSmartCardUserInteractionForSecurePINChange slot](self, "slot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__TKSmartCardUserInteractionForSecurePINChange_runWithReply___block_invoke;
  v12[3] = &unk_1E70893A0;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "synchronous:remoteSlotWithErrorHandler:", 0, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __61__TKSmartCardUserInteractionForSecurePINChange_runWithReply___block_invoke_2;
  v10[3] = &unk_1E70895B0;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "runUserInteraction:reply:", self, v10);

}

uint64_t __61__TKSmartCardUserInteractionForSecurePINChange_runWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__TKSmartCardUserInteractionForSecurePINChange_runWithReply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  unsigned __int16 v11;

  v11 = 0;
  v5 = (objc_class *)MEMORY[0x1E0C99DF0];
  v6 = a3;
  v7 = a2;
  v8 = objc_alloc_init(v5);
  v10 = v6;
  LODWORD(v5) = +[TKSmartCard decodeResponse:sw:appendTo:error:](TKSmartCard, "decodeResponse:sw:appendTo:error:", v7, &v11, v8, &v10);

  v9 = v10;
  if ((_DWORD)v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setResultSW:", v11);
    objc_msgSend(*(id *)(a1 + 32), "setResultData:", v8);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (TKSmartCardPINConfirmation)PINConfirmation
{
  return self->_PINConfirmation;
}

- (void)setPINConfirmation:(TKSmartCardPINConfirmation)PINConfirmation
{
  self->_PINConfirmation = PINConfirmation;
}

- (TKSmartCardSlot)slot
{
  return (TKSmartCardSlot *)objc_loadWeakRetained((id *)&self->_slot);
}

- (void)setSlot:(id)a3
{
  objc_storeWeak((id *)&self->_slot, a3);
}

- (TKSmartCardPINFormat)PINFormat
{
  return (TKSmartCardPINFormat *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPINFormat:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSData)APDU
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAPDU:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (int64_t)currentPINByteOffset
{
  return self->_currentPINByteOffset;
}

- (void)setCurrentPINByteOffset:(int64_t)a3
{
  self->_currentPINByteOffset = a3;
}

- (int64_t)newPINByteOffset
{
  return self->_newPINByteOffset;
}

- (void)setNewPINByteOffset:(int64_t)a3
{
  self->_newPINByteOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_APDU, 0);
  objc_storeStrong((id *)&self->_PINFormat, 0);
  objc_destroyWeak((id *)&self->_slot);
}

@end
