@implementation HDCodableNotificationInstructionRequest

- (BOOL)hasRequestIdentifier
{
  return self->_requestIdentifier != 0;
}

- (BOOL)hasNotificationInstruction
{
  return self->_notificationInstruction != 0;
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
  v8.super_class = (Class)HDCodableNotificationInstructionRequest;
  -[HDCodableNotificationInstructionRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableNotificationInstructionRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *requestIdentifier;
  HDCodableNotificationInstructionMessage *notificationInstruction;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  requestIdentifier = self->_requestIdentifier;
  if (requestIdentifier)
    objc_msgSend(v3, "setObject:forKey:", requestIdentifier, CFSTR("requestIdentifier"));
  notificationInstruction = self->_notificationInstruction;
  if (notificationInstruction)
  {
    -[HDCodableNotificationInstructionMessage dictionaryRepresentation](notificationInstruction, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("notificationInstruction"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableNotificationInstructionRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_requestIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_notificationInstruction)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_requestIdentifier)
  {
    objc_msgSend(v4, "setRequestIdentifier:");
    v4 = v5;
  }
  if (self->_notificationInstruction)
  {
    objc_msgSend(v5, "setNotificationInstruction:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_requestIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[HDCodableNotificationInstructionMessage copyWithZone:](self->_notificationInstruction, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *requestIdentifier;
  HDCodableNotificationInstructionMessage *notificationInstruction;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((requestIdentifier = self->_requestIdentifier, !((unint64_t)requestIdentifier | v4[2]))
     || -[NSString isEqual:](requestIdentifier, "isEqual:")))
  {
    notificationInstruction = self->_notificationInstruction;
    if ((unint64_t)notificationInstruction | v4[1])
      v7 = -[HDCodableNotificationInstructionMessage isEqual:](notificationInstruction, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_requestIdentifier, "hash");
  return -[HDCodableNotificationInstructionMessage hash](self->_notificationInstruction, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HDCodableNotificationInstructionMessage *notificationInstruction;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[HDCodableNotificationInstructionRequest setRequestIdentifier:](self, "setRequestIdentifier:");
    v4 = v7;
  }
  notificationInstruction = self->_notificationInstruction;
  v6 = v4[1];
  if (notificationInstruction)
  {
    if (v6)
    {
      -[HDCodableNotificationInstructionMessage mergeFrom:](notificationInstruction, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[HDCodableNotificationInstructionRequest setNotificationInstruction:](self, "setNotificationInstruction:");
    goto LABEL_8;
  }

}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestIdentifier, a3);
}

- (HDCodableNotificationInstructionMessage)notificationInstruction
{
  return self->_notificationInstruction;
}

- (void)setNotificationInstruction:(id)a3
{
  objc_storeStrong((id *)&self->_notificationInstruction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationInstruction, 0);
}

@end
