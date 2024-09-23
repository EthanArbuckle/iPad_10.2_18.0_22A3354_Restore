@implementation ABCPbSummarySubmitResponse

- (BOOL)hasStatus
{
  return self->_status != 0;
}

- (BOOL)hasMessage
{
  return self->_message != 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ABCPbSummarySubmitResponse;
  -[ABCPbSummarySubmitResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABCPbSummarySubmitResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *status;
  NSString *message;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  status = self->_status;
  if (status)
    objc_msgSend(v3, "setObject:forKey:", status, CFSTR("status"));
  message = self->_message;
  if (message)
    objc_msgSend(v4, "setObject:forKey:", message, CFSTR("message"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ABCPbSummarySubmitResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_status)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_message)
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
  if (self->_status)
  {
    objc_msgSend(v4, "setStatus:");
    v4 = v5;
  }
  if (self->_message)
  {
    objc_msgSend(v5, "setMessage:");
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
  v6 = -[NSString copyWithZone:](self->_status, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_message, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *status;
  NSString *message;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((status = self->_status, !((unint64_t)status | v4[2]))
     || -[NSString isEqual:](status, "isEqual:")))
  {
    message = self->_message;
    if ((unint64_t)message | v4[1])
      v7 = -[NSString isEqual:](message, "isEqual:");
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

  v3 = -[NSString hash](self->_status, "hash");
  return -[NSString hash](self->_message, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[ABCPbSummarySubmitResponse setStatus:](self, "setStatus:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[ABCPbSummarySubmitResponse setMessage:](self, "setMessage:");
    v4 = v5;
  }

}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
