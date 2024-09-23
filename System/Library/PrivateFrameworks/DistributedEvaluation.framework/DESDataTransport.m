@implementation DESDataTransport

- (BOOL)hasBinary64
{
  return self->_binary64 != 0;
}

- (BOOL)hasBinary32
{
  return self->_binary32 != 0;
}

- (BOOL)hasBfloat16
{
  return self->_bfloat16 != 0;
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
  v8.super_class = (Class)DESDataTransport;
  -[DESDataTransport description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DESDataTransport dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  DESBinary64Transport *binary64;
  void *v5;
  DESBinary32Transport *binary32;
  void *v7;
  DESBfloat16Transport *bfloat16;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  binary64 = self->_binary64;
  if (binary64)
  {
    -[DESBinary64Transport dictionaryRepresentation](binary64, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("binary64"));

  }
  binary32 = self->_binary32;
  if (binary32)
  {
    -[DESBinary32Transport dictionaryRepresentation](binary32, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("binary32"));

  }
  bfloat16 = self->_bfloat16;
  if (bfloat16)
  {
    -[DESBfloat16Transport dictionaryRepresentation](bfloat16, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("bfloat16"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DESDataTransportReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_binary64)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_binary32)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_bfloat16)
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
  if (self->_binary64)
  {
    objc_msgSend(v4, "setBinary64:");
    v4 = v5;
  }
  if (self->_binary32)
  {
    objc_msgSend(v5, "setBinary32:");
    v4 = v5;
  }
  if (self->_bfloat16)
  {
    objc_msgSend(v5, "setBfloat16:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[DESBinary64Transport copyWithZone:](self->_binary64, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[DESBinary32Transport copyWithZone:](self->_binary32, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[DESBfloat16Transport copyWithZone:](self->_bfloat16, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  DESBinary64Transport *binary64;
  DESBinary32Transport *binary32;
  DESBfloat16Transport *bfloat16;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((binary64 = self->_binary64, !((unint64_t)binary64 | v4[3]))
     || -[DESBinary64Transport isEqual:](binary64, "isEqual:"))
    && ((binary32 = self->_binary32, !((unint64_t)binary32 | v4[2]))
     || -[DESBinary32Transport isEqual:](binary32, "isEqual:")))
  {
    bfloat16 = self->_bfloat16;
    if ((unint64_t)bfloat16 | v4[1])
      v8 = -[DESBfloat16Transport isEqual:](bfloat16, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[DESBinary64Transport hash](self->_binary64, "hash");
  v4 = -[DESBinary32Transport hash](self->_binary32, "hash") ^ v3;
  return v4 ^ -[DESBfloat16Transport hash](self->_bfloat16, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  DESBinary64Transport *binary64;
  uint64_t v6;
  DESBinary32Transport *binary32;
  uint64_t v8;
  DESBfloat16Transport *bfloat16;
  uint64_t v10;
  _QWORD *v11;

  v4 = a3;
  binary64 = self->_binary64;
  v6 = v4[3];
  v11 = v4;
  if (binary64)
  {
    if (!v6)
      goto LABEL_7;
    -[DESBinary64Transport mergeFrom:](binary64, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[DESDataTransport setBinary64:](self, "setBinary64:");
  }
  v4 = v11;
LABEL_7:
  binary32 = self->_binary32;
  v8 = v4[2];
  if (binary32)
  {
    if (!v8)
      goto LABEL_13;
    -[DESBinary32Transport mergeFrom:](binary32, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[DESDataTransport setBinary32:](self, "setBinary32:");
  }
  v4 = v11;
LABEL_13:
  bfloat16 = self->_bfloat16;
  v10 = v4[1];
  if (bfloat16)
  {
    if (v10)
    {
      -[DESBfloat16Transport mergeFrom:](bfloat16, "mergeFrom:");
LABEL_18:
      v4 = v11;
    }
  }
  else if (v10)
  {
    -[DESDataTransport setBfloat16:](self, "setBfloat16:");
    goto LABEL_18;
  }

}

- (DESBinary64Transport)binary64
{
  return self->_binary64;
}

- (void)setBinary64:(id)a3
{
  objc_storeStrong((id *)&self->_binary64, a3);
}

- (DESBinary32Transport)binary32
{
  return self->_binary32;
}

- (void)setBinary32:(id)a3
{
  objc_storeStrong((id *)&self->_binary32, a3);
}

- (DESBfloat16Transport)bfloat16
{
  return self->_bfloat16;
}

- (void)setBfloat16:(id)a3
{
  objc_storeStrong((id *)&self->_bfloat16, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_binary64, 0);
  objc_storeStrong((id *)&self->_binary32, 0);
  objc_storeStrong((id *)&self->_bfloat16, 0);
}

@end
