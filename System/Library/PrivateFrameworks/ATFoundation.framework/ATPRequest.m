@implementation ATPRequest

- (BOOL)hasCommand
{
  return self->_command != 0;
}

- (BOOL)hasDataClass
{
  return self->_dataClass != 0;
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
  v8.super_class = (Class)ATPRequest;
  -[ATPRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATPRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *command;
  NSString *dataClass;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  command = self->_command;
  if (command)
    objc_msgSend(v3, "setObject:forKey:", command, CFSTR("command"));
  dataClass = self->_dataClass;
  if (dataClass)
    objc_msgSend(v4, "setObject:forKey:", dataClass, CFSTR("dataClass"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATPRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_command)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_dataClass)
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
  if (self->_command)
  {
    objc_msgSend(v4, "setCommand:");
    v4 = v5;
  }
  if (self->_dataClass)
  {
    objc_msgSend(v5, "setDataClass:");
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_command, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_dataClass, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *command;
  NSString *dataClass;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((command = self->_command, !((unint64_t)command | v4[1]))
     || -[NSString isEqual:](command, "isEqual:")))
  {
    dataClass = self->_dataClass;
    if ((unint64_t)dataClass | v4[2])
      v7 = -[NSString isEqual:](dataClass, "isEqual:");
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

  v3 = -[NSString hash](self->_command, "hash");
  return -[NSString hash](self->_dataClass, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[ATPRequest setCommand:](self, "setCommand:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[ATPRequest setDataClass:](self, "setDataClass:");
    v4 = v5;
  }

}

- (NSString)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
  objc_storeStrong((id *)&self->_command, a3);
}

- (NSString)dataClass
{
  return self->_dataClass;
}

- (void)setDataClass:(id)a3
{
  objc_storeStrong((id *)&self->_dataClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataClass, 0);
  objc_storeStrong((id *)&self->_command, 0);
}

@end
