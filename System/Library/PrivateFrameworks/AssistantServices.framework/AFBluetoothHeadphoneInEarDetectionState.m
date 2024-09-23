@implementation AFBluetoothHeadphoneInEarDetectionState

- (AFBluetoothHeadphoneInEarDetectionState)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFBluetoothHeadphoneInEarDetectionStateMutation *);
  AFBluetoothHeadphoneInEarDetectionState *v5;
  AFBluetoothHeadphoneInEarDetectionState *v6;
  _AFBluetoothHeadphoneInEarDetectionStateMutation *v7;
  objc_super v9;

  v4 = (void (**)(id, _AFBluetoothHeadphoneInEarDetectionStateMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)AFBluetoothHeadphoneInEarDetectionState;
  v5 = -[AFBluetoothHeadphoneInEarDetectionState init](&v9, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFBluetoothHeadphoneInEarDetectionStateMutation initWithBase:]([_AFBluetoothHeadphoneInEarDetectionStateMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFBluetoothHeadphoneInEarDetectionStateMutation isDirty](v7, "isDirty"))
    {
      v6->_isEnabled = -[_AFBluetoothHeadphoneInEarDetectionStateMutation getIsEnabled](v7, "getIsEnabled");
      v6->_primaryEarbudSide = -[_AFBluetoothHeadphoneInEarDetectionStateMutation getPrimaryEarbudSide](v7, "getPrimaryEarbudSide");
      v6->_primaryInEarStatus = -[_AFBluetoothHeadphoneInEarDetectionStateMutation getPrimaryInEarStatus](v7, "getPrimaryInEarStatus");
      v6->_secondaryInEarStatus = -[_AFBluetoothHeadphoneInEarDetectionStateMutation getSecondaryInEarStatus](v7, "getSecondaryInEarStatus");
    }

  }
  return v6;
}

- (AFBluetoothHeadphoneInEarDetectionState)init
{
  return -[AFBluetoothHeadphoneInEarDetectionState initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFBluetoothHeadphoneInEarDetectionState)initWithIsEnabled:(BOOL)a3 primaryEarbudSide:(int64_t)a4 primaryInEarStatus:(int64_t)a5 secondaryInEarStatus:(int64_t)a6
{
  _QWORD v7[7];
  BOOL v8;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __119__AFBluetoothHeadphoneInEarDetectionState_initWithIsEnabled_primaryEarbudSide_primaryInEarStatus_secondaryInEarStatus___block_invoke;
  v7[3] = &__block_descriptor_57_e59_v16__0___AFBluetoothHeadphoneInEarDetectionStateMutating__8l;
  v8 = a3;
  v7[4] = a4;
  v7[5] = a5;
  v7[6] = a6;
  return -[AFBluetoothHeadphoneInEarDetectionState initWithBuilder:](self, "initWithBuilder:", v7);
}

- (id)description
{
  return -[AFBluetoothHeadphoneInEarDetectionState _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t primaryEarbudSide;
  __CFString *v7;
  _BOOL4 isEnabled;
  __CFString *v9;
  unint64_t primaryInEarStatus;
  __CFString *v11;
  __CFString *v12;
  unint64_t secondaryInEarStatus;
  __CFString *v14;
  const __CFString *v15;
  __CFString *v16;
  void *v17;
  objc_super v19;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v19.receiver = self;
  v19.super_class = (Class)AFBluetoothHeadphoneInEarDetectionState;
  -[AFBluetoothHeadphoneInEarDetectionState description](&v19, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  primaryEarbudSide = self->_primaryEarbudSide;
  if (primaryEarbudSide > 2)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_1E3A30AC0[primaryEarbudSide];
  isEnabled = self->_isEnabled;
  v9 = v7;
  primaryInEarStatus = self->_primaryInEarStatus;
  if (primaryInEarStatus > 3)
    v11 = CFSTR("(unknown)");
  else
    v11 = off_1E3A34F60[primaryInEarStatus];
  v12 = v11;
  secondaryInEarStatus = self->_secondaryInEarStatus;
  if (secondaryInEarStatus > 3)
    v14 = CFSTR("(unknown)");
  else
    v14 = off_1E3A34F60[secondaryInEarStatus];
  if (isEnabled)
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  v16 = v14;
  v17 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {isEnabled = %@, primaryEarbudSide = %@, primaryInEarStatus = %@, secondaryInEarStatus = %@}"), v5, v15, v9, v12, v16);

  return v17;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isEnabled);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_primaryEarbudSide);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_primaryInEarStatus);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_secondaryInEarStatus);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  AFBluetoothHeadphoneInEarDetectionState *v4;
  AFBluetoothHeadphoneInEarDetectionState *v5;
  _BOOL4 isEnabled;
  int64_t primaryEarbudSide;
  int64_t primaryInEarStatus;
  int64_t secondaryInEarStatus;
  BOOL v10;

  v4 = (AFBluetoothHeadphoneInEarDetectionState *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      isEnabled = self->_isEnabled;
      if (isEnabled == -[AFBluetoothHeadphoneInEarDetectionState isEnabled](v5, "isEnabled")
        && (primaryEarbudSide = self->_primaryEarbudSide,
            primaryEarbudSide == -[AFBluetoothHeadphoneInEarDetectionState primaryEarbudSide](v5, "primaryEarbudSide"))
        && (primaryInEarStatus = self->_primaryInEarStatus,
            primaryInEarStatus == -[AFBluetoothHeadphoneInEarDetectionState primaryInEarStatus](v5, "primaryInEarStatus")))
      {
        secondaryInEarStatus = self->_secondaryInEarStatus;
        v10 = secondaryInEarStatus == -[AFBluetoothHeadphoneInEarDetectionState secondaryInEarStatus](v5, "secondaryInEarStatus");
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (AFBluetoothHeadphoneInEarDetectionState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBluetoothHeadphoneInEarDetectionState::isEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBluetoothHeadphoneInEarDetectionState::primaryEarbudSide"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBluetoothHeadphoneInEarDetectionState::primaryInEarStatus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBluetoothHeadphoneInEarDetectionState::secondaryInEarStatus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "integerValue");
  return -[AFBluetoothHeadphoneInEarDetectionState initWithIsEnabled:primaryEarbudSide:primaryInEarStatus:secondaryInEarStatus:](self, "initWithIsEnabled:primaryEarbudSide:primaryInEarStatus:secondaryInEarStatus:", v6, v8, v10, v12);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  _BOOL8 isEnabled;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  isEnabled = self->_isEnabled;
  v6 = a3;
  objc_msgSend(v4, "numberWithBool:", isEnabled);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("AFBluetoothHeadphoneInEarDetectionState::isEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_primaryEarbudSide);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("AFBluetoothHeadphoneInEarDetectionState::primaryEarbudSide"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_primaryInEarStatus);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("AFBluetoothHeadphoneInEarDetectionState::primaryInEarStatus"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_secondaryInEarStatus);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("AFBluetoothHeadphoneInEarDetectionState::secondaryInEarStatus"));

}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (int64_t)primaryEarbudSide
{
  return self->_primaryEarbudSide;
}

- (int64_t)primaryInEarStatus
{
  return self->_primaryInEarStatus;
}

- (int64_t)secondaryInEarStatus
{
  return self->_secondaryInEarStatus;
}

void __119__AFBluetoothHeadphoneInEarDetectionState_initWithIsEnabled_primaryEarbudSide_primaryInEarStatus_secondaryInEarStatus___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 56);
  v4 = a2;
  objc_msgSend(v4, "setIsEnabled:", v3);
  objc_msgSend(v4, "setPrimaryEarbudSide:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setPrimaryInEarStatus:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setSecondaryInEarStatus:", *(_QWORD *)(a1 + 48));

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFBluetoothHeadphoneInEarDetectionStateMutation *);
  _AFBluetoothHeadphoneInEarDetectionStateMutation *v5;
  AFBluetoothHeadphoneInEarDetectionState *v6;

  v4 = (void (**)(id, _AFBluetoothHeadphoneInEarDetectionStateMutation *))a3;
  if (v4)
  {
    v5 = -[_AFBluetoothHeadphoneInEarDetectionStateMutation initWithBase:]([_AFBluetoothHeadphoneInEarDetectionStateMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFBluetoothHeadphoneInEarDetectionStateMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFBluetoothHeadphoneInEarDetectionState);
      v6->_isEnabled = -[_AFBluetoothHeadphoneInEarDetectionStateMutation getIsEnabled](v5, "getIsEnabled");
      v6->_primaryEarbudSide = -[_AFBluetoothHeadphoneInEarDetectionStateMutation getPrimaryEarbudSide](v5, "getPrimaryEarbudSide");
      v6->_primaryInEarStatus = -[_AFBluetoothHeadphoneInEarDetectionStateMutation getPrimaryInEarStatus](v5, "getPrimaryInEarStatus");
      v6->_secondaryInEarStatus = -[_AFBluetoothHeadphoneInEarDetectionStateMutation getSecondaryInEarStatus](v5, "getSecondaryInEarStatus");
    }
    else
    {
      v6 = (AFBluetoothHeadphoneInEarDetectionState *)-[AFBluetoothHeadphoneInEarDetectionState copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFBluetoothHeadphoneInEarDetectionState *)-[AFBluetoothHeadphoneInEarDetectionState copy](self, "copy");
  }

  return v6;
}

+ (unint64_t)encodeForBTAddress:(id)a3 headphoneInEarDetectionStateDidChangeFrom:(id)a4 to:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  unint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v24 = 0;
  v10 = (void *)MEMORY[0x1E0CB3900];
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), &stru_1E3A37708);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scannerWithString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  if (objc_msgSend(v12, "scanHexLongLong:", &v24))
  {
    v24 *= 2;
    v14 = objc_msgSend(v8, "isEnabled");
    v24 = 4 * (v24 | v14);
    v15 = objc_msgSend(v8, "primaryEarbudSide");
    v24 = 4 * (v24 | v15);
    v16 = objc_msgSend(v8, "primaryInEarStatus");
    v24 = 4 * (v24 | v16);
    v17 = objc_msgSend(v8, "secondaryInEarStatus");
    v24 = 2 * (v24 | v17);
    v18 = objc_msgSend(v9, "isEnabled");
    v24 = 4 * (v24 | v18);
    v19 = objc_msgSend(v9, "primaryEarbudSide");
    v24 = 4 * (v24 | v19);
    v20 = objc_msgSend(v9, "primaryInEarStatus");
    v24 = 4 * (v24 | v20);
    v21 = objc_msgSend(v9, "secondaryInEarStatus");
    v13 = v24 | v21;
    v24 |= v21;
    v22 = AFSiriLogContextDaemon;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316162;
      v26 = "+[AFBluetoothHeadphoneInEarDetectionState(ADBluetoothObserver) encodeForBTAddress:headphoneInEarDetectionSta"
            "teDidChangeFrom:to:]";
      v27 = 2112;
      v28 = v7;
      v29 = 2112;
      v30 = v8;
      v31 = 2112;
      v32 = v9;
      v33 = 2048;
      v34 = v13;
      _os_log_debug_impl(&dword_19AF50000, v22, OS_LOG_TYPE_DEBUG, "%s Encoding (%@) %@ -> %@: %lld", buf, 0x34u);
      v13 = v24;
    }
  }

  return v13;
}

+ (void)decodeFromNotifyState:(unint64_t)a3 withCompletion:(id)a4
{
  uint64_t v5;
  id v6;
  unint64_t v7;
  id v8;
  void *v9;
  unint64_t v10;
  int8x16_t v11;
  uint64x2_t v12;
  void (**v13)(id, void *, id, id);
  _QWORD v14[4];
  int8x16_t v15;
  unint64_t v16;
  BOOL v17;
  _QWORD v18[4];
  int8x16_t v19;
  unint64_t v20;
  BOOL v21;

  v13 = (void (**)(id, void *, id, id))a4;
  v12 = (uint64x2_t)vdupq_n_s64(a3);
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __101__AFBluetoothHeadphoneInEarDetectionState_ADBluetoothObserver__decodeFromNotifyState_withCompletion___block_invoke;
  v18[3] = &__block_descriptor_57_e59_v16__0___AFBluetoothHeadphoneInEarDetectionStateMutating__8l;
  v21 = (a3 & 0x40) != 0;
  v11 = (int8x16_t)vdupq_n_s64(3uLL);
  v19 = vandq_s8((int8x16_t)vshlq_u64(v12, (uint64x2_t)xmmword_19B0EC7B0), v11);
  v20 = a3 & 3;
  v6 = +[AFBluetoothHeadphoneInEarDetectionState newWithBuilder:](AFBluetoothHeadphoneInEarDetectionState, "newWithBuilder:", v18);
  v7 = a3 >> 14;
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __101__AFBluetoothHeadphoneInEarDetectionState_ADBluetoothObserver__decodeFromNotifyState_withCompletion___block_invoke_2;
  v14[3] = &__block_descriptor_57_e59_v16__0___AFBluetoothHeadphoneInEarDetectionStateMutating__8l;
  v17 = (a3 & 0x2000) != 0;
  v15 = vandq_s8((int8x16_t)vshlq_u64(v12, (uint64x2_t)xmmword_19B0EC7C0), v11);
  v16 = (a3 >> 7) & 3;
  v8 = +[AFBluetoothHeadphoneInEarDetectionState newWithBuilder:](AFBluetoothHeadphoneInEarDetectionState, "newWithBuilder:", v14);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%2llX"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v9, "length") >= 3)
  {
    v10 = 2;
    do
    {
      objc_msgSend(v9, "insertString:atIndex:", CFSTR(":"), v10);
      v10 += 3;
    }
    while (v10 < objc_msgSend(v9, "length"));
  }
  v13[2](v13, v9, v8, v6);

}

void __101__AFBluetoothHeadphoneInEarDetectionState_ADBluetoothObserver__decodeFromNotifyState_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 56);
  v4 = a2;
  objc_msgSend(v4, "setIsEnabled:", v3);
  objc_msgSend(v4, "setPrimaryEarbudSide:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setPrimaryInEarStatus:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setSecondaryInEarStatus:", *(_QWORD *)(a1 + 48));

}

void __101__AFBluetoothHeadphoneInEarDetectionState_ADBluetoothObserver__decodeFromNotifyState_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 56);
  v4 = a2;
  objc_msgSend(v4, "setIsEnabled:", v3);
  objc_msgSend(v4, "setPrimaryEarbudSide:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setPrimaryInEarStatus:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setSecondaryInEarStatus:", *(_QWORD *)(a1 + 48));

}

@end
