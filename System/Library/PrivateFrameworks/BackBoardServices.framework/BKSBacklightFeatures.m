@implementation BKSBacklightFeatures

- (BKSBacklightFeatures)init
{
  BKSBacklightFeatures *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKSBacklightFeatures;
  result = -[BKSBacklightFeatures init](&v8, sel_init);
  if (result)
  {
    __asm { FMOV            V0.2S, #-1.0 }
    *(_QWORD *)&result->_fixedBrightnessNitsWhileDisabled = _D0;
  }
  return result;
}

- (void)setFixedBrightnessNitsWhileDisabled:(float)a3
{
  void *v6;

  if (self->_fixedBrightnessLevelWhileDisabled >= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSBacklightFeatures.m"), 28, CFSTR("cannot set both brightness level and nits; choose one or the other"));

  }
  self->_fixedBrightnessNitsWhileDisabled = a3;
}

- (void)setFixedBrightnessLevelWhileDisabled:(float)a3
{
  void *v6;

  if (self->_fixedBrightnessNitsWhileDisabled >= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSBacklightFeatures.m"), 33, CFSTR("cannot set both brightness level and nits; choose one or the other"));

  }
  self->_fixedBrightnessLevelWhileDisabled = a3;
}

- (NSString)description
{
  return (NSString *)-[BKSBacklightFeatures descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BKSBacklightFeatures succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BKSBacklightFeatures descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  id v7;

  -[BKSBacklightFeatures succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendBool:withName:", self->_disableFeatures, CFSTR("disableFeatures"));
  v6 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("fixedBrightnessNitsWhileDisabled"), self->_fixedBrightnessNitsWhileDisabled);
  v7 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("fixedBrightnessLevelWhileDisabled"), self->_fixedBrightnessLevelWhileDisabled);
  return v4;
}

- (id)didFinishProtobufDecodingWithError:(id *)a3
{
  float fixedBrightnessLevelWhileDisabled;
  float fixedBrightnessNitsWhileDisabled;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  fixedBrightnessLevelWhileDisabled = self->_fixedBrightnessLevelWhileDisabled;
  if (fixedBrightnessLevelWhileDisabled == -1.0)
    return self;
  fixedBrightnessNitsWhileDisabled = self->_fixedBrightnessNitsWhileDisabled;
  if (fixedBrightnessNitsWhileDisabled == -1.0)
    return self;
  if (a3)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0CB2FE0];
    v11 = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot have both set: nitsWhileDisabled:%g levelWhileDisabled:%g"), fixedBrightnessNitsWhileDisabled, fixedBrightnessLevelWhileDisabled);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 22, v9);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (BOOL)disableFeatures
{
  return self->_disableFeatures;
}

- (void)setDisableFeatures:(BOOL)a3
{
  self->_disableFeatures = a3;
}

- (float)fixedBrightnessNitsWhileDisabled
{
  return self->_fixedBrightnessNitsWhileDisabled;
}

- (float)fixedBrightnessLevelWhileDisabled
{
  return self->_fixedBrightnessLevelWhileDisabled;
}

+ (id)protobufSchema
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__BKSBacklightFeatures_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_7270 != -1)
    dispatch_once(&protobufSchema_onceToken_7270, block);
  return (id)protobufSchema_schema_7271;
}

void __38__BKSBacklightFeatures_protobufSchema__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D01838], "buildSchemaForClass:builder:", objc_opt_class(), &__block_literal_global_7273);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)protobufSchema_schema_7271;
  protobufSchema_schema_7271 = v0;

}

void __38__BKSBacklightFeatures_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "addField:forTag:", "_disableFeatures", 1);
  objc_msgSend(v2, "addField:forTag:", "_fixedBrightnessNitsWhileDisabled", 2);
  objc_msgSend(v2, "addField:forTag:", "_fixedBrightnessLevelWhileDisabled", 3);

}

@end
