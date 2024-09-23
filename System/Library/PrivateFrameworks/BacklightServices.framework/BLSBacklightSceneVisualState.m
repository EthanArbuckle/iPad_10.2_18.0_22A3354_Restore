@implementation BLSBacklightSceneVisualState

- (BLSBacklightSceneVisualState)initWithActiveAppearance:(int64_t)a3 updateFidelity:(int64_t)a4 adjustedLuminance:(int64_t)a5
{
  return -[BLSBacklightSceneVisualState initWithActiveAppearance:updateFidelity:adjustedLuminance:dimmed:](self, "initWithActiveAppearance:updateFidelity:adjustedLuminance:dimmed:", a3, a4, a5, 0);
}

- (BLSBacklightSceneVisualState)initWithActiveAppearance:(int64_t)a3 updateFidelity:(int64_t)a4 adjustedLuminance:(int64_t)a5 dimmed:(BOOL)a6
{
  BLSBacklightSceneVisualState *result;
  BOOL v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BLSBacklightSceneVisualState;
  result = -[BLSBacklightSceneVisualState init](&v12, sel_init);
  if (result)
  {
    result->_activeAppearance = a3;
    result->_updateFidelity = a4;
    result->_adjustedLuminance = a5;
    v11 = a5 == 2 && a6;
    result->_dimmed = v11;
  }
  return result;
}

- (BLSBacklightSceneVisualState)init
{
  return -[BLSBacklightSceneVisualState initWithActiveAppearance:updateFidelity:adjustedLuminance:](self, "initWithActiveAppearance:updateFidelity:adjustedLuminance:", 1, 3, 2);
}

- (id)newVisualStateWithUpdateFidelity:(int64_t)a3
{
  return -[BLSBacklightSceneVisualState initWithActiveAppearance:updateFidelity:adjustedLuminance:dimmed:]([BLSBacklightSceneVisualState alloc], "initWithActiveAppearance:updateFidelity:adjustedLuminance:dimmed:", self->_activeAppearance, a3, self->_adjustedLuminance, self->_dimmed);
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  int64_t adjustedLuminance;
  const __CFString *v7;
  const __CFString *v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_activeAppearance == 1, CFSTR("active"));
  NSStringFromBLSUpdateFidelity(self->_updateFidelity);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("fidelity"));

  adjustedLuminance = self->_adjustedLuminance;
  v7 = CFSTR("Off");
  if (adjustedLuminance == 1)
    v7 = CFSTR("Low");
  if (adjustedLuminance == 2)
    v8 = CFSTR("Full");
  else
    v8 = v7;
  objc_msgSend(v3, "appendString:withName:", v8, CFSTR("adjustedLuminance"));
  v9 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_dimmed, CFSTR("dimmed"), 1);
  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (id)bls_shortLoggingString
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  id (*v9)(uint64_t);
  void *v10;
  id v11;
  BLSBacklightSceneVisualState *v12;

  v3 = (void *)objc_opt_new();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __54__BLSBacklightSceneVisualState_bls_shortLoggingString__block_invoke;
  v10 = &unk_1E621A3B8;
  v11 = v3;
  v12 = self;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", 0, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __54__BLSBacklightSceneVisualState_bls_shortLoggingString__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  id v8;
  const __CFString *v9;
  id result;

  v2 = *(void **)(a1 + 32);
  NSStringFromBLSUpdateFidelity(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, 0);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
  v6 = CFSTR("Off");
  if (v5 == 1)
    v6 = CFSTR("Low");
  if (v5 == 2)
    v7 = CFSTR("Full");
  else
    v7 = v6;
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v7, 0);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) == 1)
    v9 = CFSTR("active");
  else
    v9 = CFSTR("inactive");
  result = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v9, 0);
  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 8))
    return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", CFSTR("dimmed"), 0);
  return result;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:", self->_activeAppearance);
  v5 = (id)objc_msgSend(v3, "appendInteger:", self->_updateFidelity);
  v6 = (id)objc_msgSend(v3, "appendInteger:", self->_adjustedLuminance);
  v7 = (id)objc_msgSend(v3, "appendBool:", self->_dimmed);
  v8 = objc_msgSend(v3, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  int64_t activeAppearance;
  uint64_t v7;
  id v8;
  id v9;
  int64_t updateFidelity;
  id v11;
  id v12;
  int64_t adjustedLuminance;
  id v14;
  id v15;
  uint64_t dimmed;
  id v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  activeAppearance = self->_activeAppearance;
  v7 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __40__BLSBacklightSceneVisualState_isEqual___block_invoke;
  v29[3] = &unk_1E621A830;
  v8 = v4;
  v30 = v8;
  v9 = (id)objc_msgSend(v5, "appendInteger:counterpart:", activeAppearance, v29);
  updateFidelity = self->_updateFidelity;
  v27[0] = v7;
  v27[1] = 3221225472;
  v27[2] = __40__BLSBacklightSceneVisualState_isEqual___block_invoke_2;
  v27[3] = &unk_1E621A830;
  v11 = v8;
  v28 = v11;
  v12 = (id)objc_msgSend(v5, "appendInteger:counterpart:", updateFidelity, v27);
  adjustedLuminance = self->_adjustedLuminance;
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __40__BLSBacklightSceneVisualState_isEqual___block_invoke_3;
  v25[3] = &unk_1E621A830;
  v14 = v11;
  v26 = v14;
  v15 = (id)objc_msgSend(v5, "appendInteger:counterpart:", adjustedLuminance, v25);
  dimmed = self->_dimmed;
  v20 = v7;
  v21 = 3221225472;
  v22 = __40__BLSBacklightSceneVisualState_isEqual___block_invoke_4;
  v23 = &unk_1E621ACF0;
  v24 = v14;
  v17 = v14;
  v18 = (id)objc_msgSend(v5, "appendBool:counterpart:", dimmed, &v20);
  LOBYTE(dimmed) = objc_msgSend(v5, "isEqual", v20, v21, v22, v23);

  return dimmed;
}

uint64_t __40__BLSBacklightSceneVisualState_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activeAppearance");
}

uint64_t __40__BLSBacklightSceneVisualState_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateFidelity");
}

uint64_t __40__BLSBacklightSceneVisualState_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "adjustedLuminance");
}

uint64_t __40__BLSBacklightSceneVisualState_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isDimmed");
}

- (BOOL)isEssentiallyEqualToVisualState:(id)a3
{
  id v4;
  BOOL v5;
  int dimmed;
  int64_t v7;
  uint64_t v8;
  BOOL v9;

  v4 = a3;
  if (-[BLSBacklightSceneVisualState isEqual:](self, "isEqual:", v4))
  {
    v5 = 1;
  }
  else
  {
    dimmed = self->_dimmed;
    if (dimmed == objc_msgSend(v4, "isDimmed"))
    {
      v7 = -[BLSBacklightSceneVisualState updateFidelity](self, "updateFidelity");
      v8 = objc_msgSend(v4, "updateFidelity");
      v9 = v8 == 1;
      if (v7 != 2)
        v9 = 0;
      if (v7 == 1)
        v5 = v8 == 2;
      else
        v5 = v9;
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (int64_t)grantedFidelity
{
  return self->_updateFidelity;
}

- (int64_t)expectedFidelity
{
  if (self->_activeAppearance)
    return self->_updateFidelity;
  else
    return 2;
}

- (BLSBacklightSceneVisualState)initWithXPCDictionary:(id)a3
{
  id v4;
  int64_t int64;
  int64_t v6;
  int64_t v7;
  _BOOL8 v8;

  v4 = a3;
  int64 = xpc_dictionary_get_int64(v4, "act");
  v6 = xpc_dictionary_get_int64(v4, "fid");
  v7 = xpc_dictionary_get_int64(v4, "lum");
  v8 = xpc_dictionary_get_BOOL(v4, "dim");

  return -[BLSBacklightSceneVisualState initWithActiveAppearance:updateFidelity:adjustedLuminance:dimmed:](self, "initWithActiveAppearance:updateFidelity:adjustedLuminance:dimmed:", int64, v6, v7, v8);
}

- (void)encodeWithXPCDictionary:(id)a3
{
  int64_t activeAppearance;
  xpc_object_t xdict;

  activeAppearance = self->_activeAppearance;
  xdict = a3;
  xpc_dictionary_set_int64(xdict, "act", activeAppearance);
  xpc_dictionary_set_int64(xdict, "fid", self->_updateFidelity);
  xpc_dictionary_set_int64(xdict, "lum", self->_adjustedLuminance);
  xpc_dictionary_set_BOOL(xdict, "dim", self->_dimmed);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSBacklightSceneVisualState)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(v4, "stringWithUTF8String:", "act");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "decodeIntegerForKey:", v6);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "fid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "decodeIntegerForKey:", v8);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "lum");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "decodeIntegerForKey:", v10);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "dim");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v5, "decodeBoolForKey:", v12);

  return -[BLSBacklightSceneVisualState initWithActiveAppearance:updateFidelity:adjustedLuminance:dimmed:](self, "initWithActiveAppearance:updateFidelity:adjustedLuminance:dimmed:", v7, v9, v11, v13);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t activeAppearance_low;
  void *v5;
  id v6;
  void *v7;
  uint64_t updateFidelity_low;
  void *v9;
  uint64_t adjustedLuminance_low;
  void *v11;
  _BOOL8 dimmed;
  id v13;

  activeAppearance_low = SLODWORD(self->_activeAppearance);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend(v5, "stringWithUTF8String:", "act");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeInteger:forKey:", activeAppearance_low, v7);

  updateFidelity_low = SLODWORD(self->_updateFidelity);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "fid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeInteger:forKey:", updateFidelity_low, v9);

  adjustedLuminance_low = SLODWORD(self->_adjustedLuminance);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "lum");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeInteger:forKey:", adjustedLuminance_low, v11);

  dimmed = self->_dimmed;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "dim");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeBool:forKey:", dimmed, v13);

}

- (int64_t)activeAppearance
{
  return self->_activeAppearance;
}

- (int64_t)updateFidelity
{
  return self->_updateFidelity;
}

- (int64_t)adjustedLuminance
{
  return self->_adjustedLuminance;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

@end
