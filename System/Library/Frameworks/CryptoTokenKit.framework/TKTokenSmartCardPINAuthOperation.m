@implementation TKTokenSmartCardPINAuthOperation

- (TKTokenSmartCardPINAuthOperation)init
{
  TKTokenSmartCardPINAuthOperation *v2;
  uint64_t v3;
  TKSmartCardPINFormat *PINFormat;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TKTokenSmartCardPINAuthOperation;
  v2 = -[TKTokenSmartCardPINAuthOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    PINFormat = v2->_PINFormat;
    v2->_PINFormat = (TKSmartCardPINFormat *)v3;

  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKTokenSmartCardPINAuthOperation)initWithCoder:(id)a3
{
  id v4;
  TKTokenSmartCardPINAuthOperation *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  TKSmartCardPINFormat *PINFormat;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSData *APDUTemplate;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSString *PIN;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSString *localizedPINLabel;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)TKTokenSmartCardPINAuthOperation;
  v5 = -[TKTokenAuthOperation initWithCoder:](&v26, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_PINFormat);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    PINFormat = v5->_PINFormat;
    v5->_PINFormat = (TKSmartCardPINFormat *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_APDUTemplate);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    APDUTemplate = v5->_APDUTemplate;
    v5->_APDUTemplate = (NSData *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_PINByteOffset);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_PINByteOffset = objc_msgSend(v16, "integerValue");

    v17 = objc_opt_class();
    NSStringFromSelector("PIN");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    PIN = v5->_PIN;
    v5->_PIN = (NSString *)v19;

    v21 = objc_opt_class();
    NSStringFromSelector(sel_localizedPINLabel);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    localizedPINLabel = v5->_localizedPINLabel;
    v5->_localizedPINLabel = (NSString *)v23;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  TKSmartCardPINFormat *PINFormat;
  void *v6;
  NSData *APDUTemplate;
  void *v8;
  void *v9;
  void *v10;
  NSString *PIN;
  void *v12;
  NSString *localizedPINLabel;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TKTokenSmartCardPINAuthOperation;
  v4 = a3;
  -[TKTokenAuthOperation encodeWithCoder:](&v15, sel_encodeWithCoder_, v4);
  PINFormat = self->_PINFormat;
  NSStringFromSelector(sel_PINFormat);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", PINFormat, v6, v15.receiver, v15.super_class);

  APDUTemplate = self->_APDUTemplate;
  NSStringFromSelector(sel_APDUTemplate);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", APDUTemplate, v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_PINByteOffset);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_PINByteOffset);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  PIN = self->_PIN;
  NSStringFromSelector("PIN");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", PIN, v12);

  localizedPINLabel = self->_localizedPINLabel;
  NSStringFromSelector(sel_localizedPINLabel);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", localizedPINLabel, v14);

}

- (BOOL)finishWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  BOOL v18;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  -[TKTokenSmartCardPINAuthOperation APDUTemplate](self, "APDUTemplate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 1;
  -[TKTokenSmartCardPINAuthOperation APDUTemplate](self, "APDUTemplate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  -[TKTokenSmartCardPINAuthOperation PINFormat](self, "PINFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKTokenSmartCardPINAuthOperation PIN](self, "PIN");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "fillPIN:intoAPDUTemplate:PINByteOffset:error:", v9, v7, -[TKTokenSmartCardPINAuthOperation PINByteOffset](self, "PINByteOffset"), a3);

  if (v10)
  {
    -[TKTokenSmartCardPINAuthOperation setPIN:](self, "setPIN:", 0);
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__3;
    v31 = __Block_byref_object_dispose__3;
    v32 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__3;
    v25 = __Block_byref_object_dispose__3;
    v26 = 0;
    -[TKTokenSmartCardPINAuthOperation smartCard](self, "smartCard");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSynchronous:", 1);

    -[TKTokenSmartCardPINAuthOperation smartCard](self, "smartCard");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __52__TKTokenSmartCardPINAuthOperation_finishWithError___block_invoke;
    v20[3] = &unk_1E7089F48;
    v20[4] = &v27;
    v20[5] = &v21;
    objc_msgSend(v12, "transmitRequest:reply:", v7, v20);

    -[TKTokenSmartCardPINAuthOperation smartCard](self, "smartCard");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSynchronous:", 0);

    v14 = v28[5];
    if (a3 && !v14)
    {
      *a3 = objc_retainAutorelease((id)v22[5]);
      v14 = v28[5];
    }
    if (v14
      && (-[TKTokenSmartCardPINAuthOperation smartCard](self, "smartCard"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "checkAPDUResponse:error:", v28[5], a3),
          v15,
          v16))
    {
      -[TKTokenSmartCardPINAuthOperation smartCard](self, "smartCard");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setSensitive:", 1);

      v18 = 1;
    }
    else
    {
      v18 = 0;
    }
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void __52__TKTokenSmartCardPINAuthOperation_finishWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);

}

- (Class)baseClassForUI
{
  return (Class)objc_opt_class();
}

- (void)importOperation:(id)a3
{
  id v4;
  TKSmartCardPINFormat *v5;
  TKSmartCardPINFormat *PINFormat;
  NSData *v7;
  NSData *APDUTemplate;
  NSString *v9;
  NSString *localizedPINLabel;
  NSString *v11;
  NSString *PIN;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TKTokenSmartCardPINAuthOperation;
  v4 = a3;
  -[TKTokenAuthOperation importOperation:](&v13, sel_importOperation_, v4);
  objc_msgSend(v4, "PINFormat", v13.receiver, v13.super_class);
  v5 = (TKSmartCardPINFormat *)objc_claimAutoreleasedReturnValue();
  PINFormat = self->_PINFormat;
  self->_PINFormat = v5;

  objc_msgSend(v4, "APDUTemplate");
  v7 = (NSData *)objc_claimAutoreleasedReturnValue();
  APDUTemplate = self->_APDUTemplate;
  self->_APDUTemplate = v7;

  self->_PINByteOffset = objc_msgSend(v4, "PINByteOffset");
  objc_msgSend(v4, "localizedPINLabel");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  localizedPINLabel = self->_localizedPINLabel;
  self->_localizedPINLabel = v9;

  objc_msgSend(v4, "PIN");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();

  PIN = self->_PIN;
  self->_PIN = v11;

}

- (TKSmartCardPINFormat)PINFormat
{
  return (TKSmartCardPINFormat *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPINFormat:(TKSmartCardPINFormat *)PINFormat
{
  objc_setProperty_atomic(self, a2, PINFormat, 16);
}

- (NSData)APDUTemplate
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAPDUTemplate:(NSData *)APDUTemplate
{
  objc_setProperty_atomic_copy(self, a2, APDUTemplate, 24);
}

- (NSInteger)PINByteOffset
{
  return self->_PINByteOffset;
}

- (void)setPINByteOffset:(NSInteger)PINByteOffset
{
  self->_PINByteOffset = PINByteOffset;
}

- (TKSmartCard)smartCard
{
  return (TKSmartCard *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSmartCard:(TKSmartCard *)smartCard
{
  objc_setProperty_atomic(self, a2, smartCard, 40);
}

- (NSString)PIN
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPIN:(NSString *)PIN
{
  objc_setProperty_atomic_copy(self, a2, PIN, 48);
}

- (NSString)localizedPINLabel
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLocalizedPINLabel:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedPINLabel, 0);
  objc_storeStrong((id *)&self->_PIN, 0);
  objc_storeStrong((id *)&self->_smartCard, 0);
  objc_storeStrong((id *)&self->_APDUTemplate, 0);
  objc_storeStrong((id *)&self->_PINFormat, 0);
}

@end
