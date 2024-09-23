@implementation TKSmartCardUserInteractionForSecurePINVerification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKSmartCardUserInteractionForSecurePINVerification)initWithCoder:(id)a3
{
  id v4;
  TKSmartCardUserInteractionForSecurePINVerification *v5;
  void *v6;
  uint64_t v7;
  TKSmartCardPINFormat *PINFormat;
  void *v9;
  uint64_t v10;
  NSData *APDU;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TKSmartCardUserInteractionForSecurePINVerification;
  v5 = -[TKSmartCardUserInteractionForPINOperation initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PINFormat"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    PINFormat = v5->_PINFormat;
    v5->_PINFormat = (TKSmartCardPINFormat *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("APDU"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    APDU = v5->_APDU;
    v5->_APDU = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PINByteOffset"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_PINByteOffset = objc_msgSend(v12, "integerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TKSmartCardUserInteractionForSecurePINVerification;
  v4 = a3;
  -[TKSmartCardUserInteractionForPINOperation encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_PINFormat, CFSTR("PINFormat"), v6.receiver, v6.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_APDU, CFSTR("APDU"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_PINByteOffset);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("PINByteOffset"));

}

- (void)setSlot:(id)a3 PINFormat:(id)a4 APDU:(id)a5 PINByteOffset:(int64_t)a6
{
  id v10;
  id v11;

  v10 = a5;
  v11 = a4;
  -[TKSmartCardUserInteractionForSecurePINVerification setSlot:](self, "setSlot:", a3);
  -[TKSmartCardUserInteractionForSecurePINVerification setPINFormat:](self, "setPINFormat:", v11);

  -[TKSmartCardUserInteractionForSecurePINVerification setAPDU:](self, "setAPDU:", v10);
  -[TKSmartCardUserInteractionForSecurePINVerification setPINByteOffset:](self, "setPINByteOffset:", a6);
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
  -[TKSmartCardUserInteractionForSecurePINVerification slot](self, "slot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__TKSmartCardUserInteractionForSecurePINVerification_runWithReply___block_invoke;
  v12[3] = &unk_1E70893A0;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "synchronous:remoteSlotWithErrorHandler:", 0, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __67__TKSmartCardUserInteractionForSecurePINVerification_runWithReply___block_invoke_2;
  v10[3] = &unk_1E70895B0;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "runUserInteraction:reply:", self, v10);

}

uint64_t __67__TKSmartCardUserInteractionForSecurePINVerification_runWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__TKSmartCardUserInteractionForSecurePINVerification_runWithReply___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  return (TKSmartCardPINFormat *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPINFormat:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSData)APDU
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAPDU:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (int64_t)PINByteOffset
{
  return self->_PINByteOffset;
}

- (void)setPINByteOffset:(int64_t)a3
{
  self->_PINByteOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_APDU, 0);
  objc_storeStrong((id *)&self->_PINFormat, 0);
  objc_destroyWeak((id *)&self->_slot);
}

@end
