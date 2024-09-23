@implementation BKSSecureModeViolation

- (BKSSecureModeViolation)initWithProcessId:(id)a3 contextIds:(id)a4
{
  id v7;
  id v8;
  BKSSecureModeViolation *v9;
  BKSSecureModeViolation *v10;
  uint64_t v11;
  NSArray *contextIds;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKSSecureModeViolation;
  v9 = -[BKSSecureModeViolation init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_processId, a3);
    v11 = objc_msgSend(v8, "copy");
    contextIds = v10->_contextIds;
    v10->_contextIds = (NSArray *)v11;

  }
  return v10;
}

- (NSString)description
{
  return (NSString *)-[BKSSecureModeViolation descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BKSSecureModeViolation succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:withName:", -[NSNumber integerValue](self->_processId, "integerValue"), CFSTR("processId"));
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:objectTransformer:", self->_contextIds, CFSTR("contextIds"), 1, &__block_literal_global_4197);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BKSSecureModeViolation descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BKSSecureModeViolation succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendDictionarySection:withName:multilinePrefix:skipIfEmpty:", self->_layerNamesByContext, CFSTR("layerNamesByContext"), v4, 1);

  return v5;
}

- (NSNumber)processId
{
  return self->_processId;
}

- (void)setProcessId:(id)a3
{
  objc_storeStrong((id *)&self->_processId, a3);
}

- (NSArray)contextIds
{
  return self->_contextIds;
}

- (void)setContextIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)layerNamesByContext
{
  return self->_layerNamesByContext;
}

- (void)setLayerNamesByContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerNamesByContext, 0);
  objc_storeStrong((id *)&self->_contextIds, 0);
  objc_storeStrong((id *)&self->_processId, 0);
}

uint64_t __52__BKSSecureModeViolation_succinctDescriptionBuilder__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%x"), objc_msgSend(a2, "unsignedIntValue"));
}

@end
