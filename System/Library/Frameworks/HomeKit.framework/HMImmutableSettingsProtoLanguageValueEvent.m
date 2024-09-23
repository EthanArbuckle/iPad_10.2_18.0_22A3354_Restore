@implementation HMImmutableSettingsProtoLanguageValueEvent

- (BOOL)hasInputLanguageCode
{
  return self->_inputLanguageCode != 0;
}

- (BOOL)hasOutputVoiceLanguageCode
{
  return self->_outputVoiceLanguageCode != 0;
}

- (BOOL)hasOutputVoiceGenderCode
{
  return self->_outputVoiceGenderCode != 0;
}

- (BOOL)hasVoiceName
{
  return self->_voiceName != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HMImmutableSettingsProtoLanguageValueEvent;
  -[HMImmutableSettingsProtoLanguageValueEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMImmutableSettingsProtoLanguageValueEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *inputLanguageCode;
  NSString *outputVoiceLanguageCode;
  NSString *outputVoiceGenderCode;
  NSString *voiceName;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  inputLanguageCode = self->_inputLanguageCode;
  if (inputLanguageCode)
    objc_msgSend(v3, "setObject:forKey:", inputLanguageCode, CFSTR("inputLanguageCode"));
  outputVoiceLanguageCode = self->_outputVoiceLanguageCode;
  if (outputVoiceLanguageCode)
    objc_msgSend(v4, "setObject:forKey:", outputVoiceLanguageCode, CFSTR("outputVoiceLanguageCode"));
  outputVoiceGenderCode = self->_outputVoiceGenderCode;
  if (outputVoiceGenderCode)
    objc_msgSend(v4, "setObject:forKey:", outputVoiceGenderCode, CFSTR("outputVoiceGenderCode"));
  voiceName = self->_voiceName;
  if (voiceName)
    objc_msgSend(v4, "setObject:forKey:", voiceName, CFSTR("voiceName"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HMImmutableSettingsProtoLanguageValueEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_inputLanguageCode)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_outputVoiceLanguageCode)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_outputVoiceGenderCode)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_voiceName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_inputLanguageCode)
  {
    objc_msgSend(v4, "setInputLanguageCode:");
    v4 = v5;
  }
  if (self->_outputVoiceLanguageCode)
  {
    objc_msgSend(v5, "setOutputVoiceLanguageCode:");
    v4 = v5;
  }
  if (self->_outputVoiceGenderCode)
  {
    objc_msgSend(v5, "setOutputVoiceGenderCode:");
    v4 = v5;
  }
  if (self->_voiceName)
  {
    objc_msgSend(v5, "setVoiceName:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_inputLanguageCode, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_outputVoiceLanguageCode, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_outputVoiceGenderCode, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v12 = -[NSString copyWithZone:](self->_voiceName, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *inputLanguageCode;
  NSString *outputVoiceLanguageCode;
  NSString *outputVoiceGenderCode;
  NSString *voiceName;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((inputLanguageCode = self->_inputLanguageCode, !((unint64_t)inputLanguageCode | v4[1]))
     || -[NSString isEqual:](inputLanguageCode, "isEqual:"))
    && ((outputVoiceLanguageCode = self->_outputVoiceLanguageCode, !((unint64_t)outputVoiceLanguageCode | v4[3]))
     || -[NSString isEqual:](outputVoiceLanguageCode, "isEqual:"))
    && ((outputVoiceGenderCode = self->_outputVoiceGenderCode, !((unint64_t)outputVoiceGenderCode | v4[2]))
     || -[NSString isEqual:](outputVoiceGenderCode, "isEqual:")))
  {
    voiceName = self->_voiceName;
    if ((unint64_t)voiceName | v4[4])
      v9 = -[NSString isEqual:](voiceName, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_inputLanguageCode, "hash");
  v4 = -[NSString hash](self->_outputVoiceLanguageCode, "hash") ^ v3;
  v5 = -[NSString hash](self->_outputVoiceGenderCode, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_voiceName, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[1])
    -[HMImmutableSettingsProtoLanguageValueEvent setInputLanguageCode:](self, "setInputLanguageCode:");
  if (v4[3])
    -[HMImmutableSettingsProtoLanguageValueEvent setOutputVoiceLanguageCode:](self, "setOutputVoiceLanguageCode:");
  if (v4[2])
    -[HMImmutableSettingsProtoLanguageValueEvent setOutputVoiceGenderCode:](self, "setOutputVoiceGenderCode:");
  if (v4[4])
    -[HMImmutableSettingsProtoLanguageValueEvent setVoiceName:](self, "setVoiceName:");

}

- (NSString)inputLanguageCode
{
  return self->_inputLanguageCode;
}

- (void)setInputLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_inputLanguageCode, a3);
}

- (NSString)outputVoiceLanguageCode
{
  return self->_outputVoiceLanguageCode;
}

- (void)setOutputVoiceLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_outputVoiceLanguageCode, a3);
}

- (NSString)outputVoiceGenderCode
{
  return self->_outputVoiceGenderCode;
}

- (void)setOutputVoiceGenderCode:(id)a3
{
  objc_storeStrong((id *)&self->_outputVoiceGenderCode, a3);
}

- (NSString)voiceName
{
  return self->_voiceName;
}

- (void)setVoiceName:(id)a3
{
  objc_storeStrong((id *)&self->_voiceName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceName, 0);
  objc_storeStrong((id *)&self->_outputVoiceLanguageCode, 0);
  objc_storeStrong((id *)&self->_outputVoiceGenderCode, 0);
  objc_storeStrong((id *)&self->_inputLanguageCode, 0);
}

@end
