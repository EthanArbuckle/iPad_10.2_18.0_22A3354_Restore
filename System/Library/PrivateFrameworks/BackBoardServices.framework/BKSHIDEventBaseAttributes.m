@implementation BKSHIDEventBaseAttributes

- (unsigned)contextID
{
  return -[BKSHIDEventDeferringToken _identifierOfCAContext](self->_token, "_identifierOfCAContext");
}

- (unsigned)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_display, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_authenticationMessage, 0);
}

- (int)source
{
  return self->_source;
}

- (void)setOptions:(unsigned __int16)a3
{
  self->_options = a3;
}

+ (id)baseAttributesFromProvider:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v3, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnvironment:", v5);

  objc_msgSend(v3, "display");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplay:", v6);

  objc_msgSend(v3, "token");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setToken:", v7);
  return v4;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (void)setDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_display, a3);
}

+ (id)protobufSchema
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__BKSHIDEventBaseAttributes_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_150 != -1)
    dispatch_once(&protobufSchema_onceToken_150, block);
  return (id)protobufSchema_schema_149;
}

void __43__BKSHIDEventBaseAttributes_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D01838], "buildSchemaForClass:builder:", *(_QWORD *)(a1 + 32), &__block_literal_global_151);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)protobufSchema_schema_149;
  protobufSchema_schema_149 = v1;

}

void __43__BKSHIDEventBaseAttributes_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "addField:", "_authenticationMessage");
  objc_msgSend(v2, "addField:", "_environment");
  objc_msgSend(v2, "addField:", "_display");
  objc_msgSend(v2, "addField:", "_token");
  objc_msgSend(v2, "addField:", "_source");
  objc_msgSend(v2, "addField:", "_options");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 16), self->_authenticationMessage);
  objc_storeStrong((id *)(v4 + 24), self->_environment);
  objc_storeStrong((id *)(v4 + 32), self->_display);
  objc_storeStrong((id *)(v4 + 40), self->_token);
  *(_DWORD *)(v4 + 12) = self->_source;
  *(_WORD *)(v4 + 8) = self->_options;
  return (id)v4;
}

- (NSString)description
{
  return (NSString *)-[BKSHIDEventBaseAttributes descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _DWORD *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && self->_source == v5[3]
      && self->_options == *((unsigned __int16 *)v5 + 4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BKSHIDEventBaseAttributes succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[BKSHIDEventBaseAttributes descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;

  -[BKSHIDEventBaseAttributes succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKSHIDEventBaseAttributes appendDescriptionToFormatter:](self, "appendDescriptionToFormatter:", v4);
  return v4;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  BKSHIDEventAuthenticationMessage *authenticationMessage;
  id v6;
  id v7;
  BKSHIDEventDisplay *display;
  id v9;
  BKSHIDEventDeferringToken *token;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v4 = a3;
  authenticationMessage = self->_authenticationMessage;
  v15 = v4;
  if (authenticationMessage)
  {
    v6 = (id)objc_msgSend(v4, "appendObject:withName:", authenticationMessage, CFSTR("authenticationMessage"));
    v4 = v15;
  }
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", self->_environment, CFSTR("environment"));
  display = self->_display;
  if (display)
    v9 = (id)objc_msgSend(v15, "appendObject:withName:", display, CFSTR("display"));
  token = self->_token;
  if (token)
    v11 = (id)objc_msgSend(v15, "appendObject:withName:", token, CFSTR("token"));
  NSStringFromBKSHIDEventSource(self->_source);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v15, "appendObject:withName:", v12, CFSTR("source"));

  NSStringFromBKSHIDEventAttributeOptions(self->_options);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendString:withName:", v14, CFSTR("options"));

}

- (BKSHIDEventAuthenticationMessage)authenticationMessage
{
  return self->_authenticationMessage;
}

- (void)setAuthenticationMessage:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationMessage, a3);
}

- (BKSHIDEventDeferringEnvironment)environment
{
  return self->_environment;
}

- (BKSHIDEventDisplay)display
{
  return self->_display;
}

- (BKSHIDEventDeferringToken)token
{
  return self->_token;
}

- (void)setSource:(int)a3
{
  self->_source = a3;
}

@end
