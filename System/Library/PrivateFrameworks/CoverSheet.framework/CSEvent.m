@implementation CSEvent

+ (id)eventWithType:(int64_t)a3
{
  id v4;
  _BOOL8 v6;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "setType:", a3);
  objc_msgSend(v4, "setConsumable:", (unint64_t)(a3 - 27) < 7);
  v6 = (unint64_t)a3 > 0x28 || (a3 & 0x1FFFFFFFFFFLL) == 38;
  objc_msgSend(v4, "setStateless:", v6);
  return v4;
}

- (id)description
{
  return -[CSEvent descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CSEvent succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCoverSheetEventType(self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("type"));

  v6 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_value, CFSTR("value"), 1);
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[CSEvent isConsumable](self, "isConsumable"), CFSTR("consumable"));
  v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[CSEvent isStateless](self, "isStateless"), CFSTR("stateless"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CSEvent descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)isConsumable
{
  return self->_consumable;
}

- (void)setConsumable:(BOOL)a3
{
  self->_consumable = a3;
}

- (BOOL)isStateless
{
  return self->_stateless;
}

- (void)setStateless:(BOOL)a3
{
  self->_stateless = a3;
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
