@implementation MDMRequestEnableLostModeCommand

+ (id)requestType
{
  return CFSTR("EnableLostMode");
}

+ (unint64_t)requiredAccessRights
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___MDMRequestEnableLostModeCommand;
  return (unint64_t)objc_msgSendSuper2(&v3, sel_requiredAccessRights);
}

+ (id)requestWithMessage:(id)a3 phoneNumber:(id)a4 footnote:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setCommandMessage:", v9);

  objc_msgSend(v10, "setCommandPhoneNumber:", v8);
  objc_msgSend(v10, "setCommandFootnote:", v7);

  return v10;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7;
  BOOL v8;

  v7 = a3;
  v8 = 0;
  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("Message"), CFSTR("commandMessage"), 0, 0, a5))
  {
    v8 = 0;
    if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("PhoneNumber"), CFSTR("commandPhoneNumber"), 0, 0, a5))
    {
      v8 = -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("Footnote"), CFSTR("commandFootnote"), 0, 0, a5);
    }
  }

  return v8;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_opt_new();
  -[MDMRequestEnableLostModeCommand commandMessage](self, "commandMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("Message"), v5, 0, 0);

  -[MDMRequestEnableLostModeCommand commandPhoneNumber](self, "commandPhoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("PhoneNumber"), v6, 0, 0);

  -[MDMRequestEnableLostModeCommand commandFootnote](self, "commandFootnote");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("Footnote"), v7, 0, 0);

  v8 = (void *)objc_msgSend(v4, "copy");
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MDMRequestEnableLostModeCommand;
  v4 = -[RMModelPayloadBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_commandMessage, "copy");
  v6 = (void *)v4[6];
  v4[6] = v5;

  v7 = -[NSString copy](self->_commandPhoneNumber, "copy");
  v8 = (void *)v4[7];
  v4[7] = v7;

  v9 = -[NSString copy](self->_commandFootnote, "copy");
  v10 = (void *)v4[8];
  v4[8] = v9;

  return v4;
}

- (NSString)commandMessage
{
  return self->_commandMessage;
}

- (void)setCommandMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)commandPhoneNumber
{
  return self->_commandPhoneNumber;
}

- (void)setCommandPhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)commandFootnote
{
  return self->_commandFootnote;
}

- (void)setCommandFootnote:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandFootnote, 0);
  objc_storeStrong((id *)&self->_commandPhoneNumber, 0);
  objc_storeStrong((id *)&self->_commandMessage, 0);
}

- (void)processRequest:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  void (**v17)(id, void *);

  v5 = (void (**)(id, void *))a4;
  -[MDMRequestEnableLostModeCommand commandMessage](self, "commandMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else
  {
    -[MDMRequestEnableLostModeCommand commandPhoneNumber](self, "commandPhoneNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v11 = (void *)MEMORY[0x24BDD1540];
      v12 = *MEMORY[0x24BE2A728];
      DMCErrorArray();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "DMCErrorWithDomain:code:descriptionArray:errorType:", v12, 12066, v13, *MEMORY[0x24BE2A588], 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDMRequestEnableLostModeCommand _responseForError:](self, "_responseForError:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v15);

      goto LABEL_5;
    }
  }
  -[MDMRequestEnableLostModeCommand commandMessage](self, "commandMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMRequestEnableLostModeCommand commandPhoneNumber](self, "commandPhoneNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMRequestEnableLostModeCommand commandFootnote](self, "commandFootnote");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __77__MDMRequestEnableLostModeCommand_Handler__processRequest_completionHandler___block_invoke;
  v16[3] = &unk_24EB69238;
  v16[4] = self;
  v17 = v5;
  +[MDMFindMyUtilities enableManagedLostModeWithMessage:phoneNumber:footnoteText:completion:](MDMFindMyUtilities, "enableManagedLostModeWithMessage:phoneNumber:footnoteText:completion:", v8, v9, v10, v16);

LABEL_5:
}

void __77__MDMRequestEnableLostModeCommand_Handler__processRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v11 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = *MEMORY[0x24BE2A728];
    DMCErrorArray();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v7, 12066, v8, v11, *MEMORY[0x24BE2A588], 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_responseForError:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v10);

  }
  else
  {
    +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v8);
  }

}

- (id)_responseForError:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    objc_msgSend(v3, "DMCVerboseDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_222CB9000, v5, OS_LOG_TYPE_ERROR, "MDMRequestEnableLostModeCommand+Handler failed to enable MDM Lost Mode with error: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
