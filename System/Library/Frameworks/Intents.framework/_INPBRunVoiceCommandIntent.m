@implementation _INPBRunVoiceCommandIntent

- (void)setExecutionResult:(id)a3
{
  objc_storeStrong((id *)&self->_executionResult, a3);
}

- (BOOL)hasExecutionResult
{
  return self->_executionResult != 0;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setOriginDevice:(id)a3
{
  objc_storeStrong((id *)&self->_originDevice, a3);
}

- (BOOL)hasOriginDevice
{
  return self->_originDevice != 0;
}

- (void)setPreviousIntentIdentifier:(id)a3
{
  NSString *v4;
  NSString *previousIntentIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  previousIntentIdentifier = self->_previousIntentIdentifier;
  self->_previousIntentIdentifier = v4;

}

- (BOOL)hasPreviousIntentIdentifier
{
  return self->_previousIntentIdentifier != 0;
}

- (void)setVoiceCommand:(id)a3
{
  objc_storeStrong((id *)&self->_voiceCommand, a3);
}

- (BOOL)hasVoiceCommand
{
  return self->_voiceCommand != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRunVoiceCommandIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[_INPBRunVoiceCommandIntent executionResult](self, "executionResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBRunVoiceCommandIntent executionResult](self, "executionResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRunVoiceCommandIntent intentMetadata](self, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBRunVoiceCommandIntent intentMetadata](self, "intentMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRunVoiceCommandIntent originDevice](self, "originDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBRunVoiceCommandIntent originDevice](self, "originDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRunVoiceCommandIntent previousIntentIdentifier](self, "previousIntentIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  -[_INPBRunVoiceCommandIntent voiceCommand](self, "voiceCommand");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[_INPBRunVoiceCommandIntent voiceCommand](self, "voiceCommand");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBRunVoiceCommandIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBRunVoiceCommandIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBRunVoiceCommandIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBRunVoiceCommandIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBRunVoiceCommandIntent initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBRunVoiceCommandIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBRunVoiceCommandIntent *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = -[_INPBRunVoiceCommandIntent init](+[_INPBRunVoiceCommandIntent allocWithZone:](_INPBRunVoiceCommandIntent, "allocWithZone:"), "init");
  v6 = -[_INPBIntentExecutionResult copyWithZone:](self->_executionResult, "copyWithZone:", a3);
  -[_INPBRunVoiceCommandIntent setExecutionResult:](v5, "setExecutionResult:", v6);

  v7 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBRunVoiceCommandIntent setIntentMetadata:](v5, "setIntentMetadata:", v7);

  v8 = -[_INPBVoiceCommandDeviceInformation copyWithZone:](self->_originDevice, "copyWithZone:", a3);
  -[_INPBRunVoiceCommandIntent setOriginDevice:](v5, "setOriginDevice:", v8);

  v9 = (void *)-[NSString copyWithZone:](self->_previousIntentIdentifier, "copyWithZone:", a3);
  -[_INPBRunVoiceCommandIntent setPreviousIntentIdentifier:](v5, "setPreviousIntentIdentifier:", v9);

  v10 = -[_INPBDataString copyWithZone:](self->_voiceCommand, "copyWithZone:", a3);
  -[_INPBRunVoiceCommandIntent setVoiceCommand:](v5, "setVoiceCommand:", v10);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  BOOL v32;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[_INPBRunVoiceCommandIntent executionResult](self, "executionResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executionResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBRunVoiceCommandIntent executionResult](self, "executionResult");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBRunVoiceCommandIntent executionResult](self, "executionResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executionResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBRunVoiceCommandIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBRunVoiceCommandIntent intentMetadata](self, "intentMetadata");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBRunVoiceCommandIntent intentMetadata](self, "intentMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBRunVoiceCommandIntent originDevice](self, "originDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBRunVoiceCommandIntent originDevice](self, "originDevice");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBRunVoiceCommandIntent originDevice](self, "originDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBRunVoiceCommandIntent previousIntentIdentifier](self, "previousIntentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previousIntentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBRunVoiceCommandIntent previousIntentIdentifier](self, "previousIntentIdentifier");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBRunVoiceCommandIntent previousIntentIdentifier](self, "previousIntentIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previousIntentIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBRunVoiceCommandIntent voiceCommand](self, "voiceCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceCommand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBRunVoiceCommandIntent voiceCommand](self, "voiceCommand");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

LABEL_30:
      v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    -[_INPBRunVoiceCommandIntent voiceCommand](self, "voiceCommand");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceCommand");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if ((v31 & 1) != 0)
      goto LABEL_30;
  }
  else
  {
LABEL_26:

  }
LABEL_27:
  v32 = 0;
LABEL_28:

  return v32;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  NSUInteger v6;

  v3 = -[_INPBIntentExecutionResult hash](self->_executionResult, "hash");
  v4 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash") ^ v3;
  v5 = -[_INPBVoiceCommandDeviceInformation hash](self->_originDevice, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_previousIntentIdentifier, "hash");
  return v6 ^ -[_INPBDataString hash](self->_voiceCommand, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBRunVoiceCommandIntent executionResult](self, "executionResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("executionResult"));

  -[_INPBRunVoiceCommandIntent intentMetadata](self, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("intentMetadata"));

  -[_INPBRunVoiceCommandIntent originDevice](self, "originDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("originDevice"));

  if (self->_previousIntentIdentifier)
  {
    -[_INPBRunVoiceCommandIntent previousIntentIdentifier](self, "previousIntentIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("previousIntentIdentifier"));

  }
  -[_INPBRunVoiceCommandIntent voiceCommand](self, "voiceCommand");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("voiceCommand"));

  return v3;
}

- (_INPBIntentExecutionResult)executionResult
{
  return self->_executionResult;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBVoiceCommandDeviceInformation)originDevice
{
  return self->_originDevice;
}

- (NSString)previousIntentIdentifier
{
  return self->_previousIntentIdentifier;
}

- (_INPBDataString)voiceCommand
{
  return self->_voiceCommand;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceCommand, 0);
  objc_storeStrong((id *)&self->_previousIntentIdentifier, 0);
  objc_storeStrong((id *)&self->_originDevice, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_executionResult, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
