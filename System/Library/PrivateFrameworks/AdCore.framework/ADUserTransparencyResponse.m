@implementation ADUserTransparencyResponse

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ADUserTransparencyResponse;
  -[ADUserTransparencyResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADUserTransparencyResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  ADTransparencyDetails *transparencyDetails;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  transparencyDetails = self->_transparencyDetails;
  if (transparencyDetails)
  {
    -[ADTransparencyDetails dictionaryRepresentation](transparencyDetails, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("transparencyDetails"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ADUserTransparencyResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_transparencyDetails)
    -[ADUserTransparencyResponse writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  objc_msgSend(a3, "setTransparencyDetails:", self->_transparencyDetails);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[ADTransparencyDetails copyWithZone:](self->_transparencyDetails, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  ADTransparencyDetails *transparencyDetails;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    transparencyDetails = self->_transparencyDetails;
    if ((unint64_t)transparencyDetails | v4[1])
      v6 = -[ADTransparencyDetails isEqual:](transparencyDetails, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[ADTransparencyDetails hash](self->_transparencyDetails, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  ADTransparencyDetails *transparencyDetails;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  transparencyDetails = self->_transparencyDetails;
  v6 = v4[1];
  if (transparencyDetails)
  {
    if (v6)
    {
      v7 = v4;
      -[ADTransparencyDetails mergeFrom:](transparencyDetails, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[ADUserTransparencyResponse setTransparencyDetails:](self, "setTransparencyDetails:");
    goto LABEL_6;
  }

}

- (ADTransparencyDetails)transparencyDetails
{
  return self->_transparencyDetails;
}

- (void)setTransparencyDetails:(id)a3
{
  objc_storeStrong((id *)&self->_transparencyDetails, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transparencyDetails, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[ADUserTransparencyResponse writeTo:]", "ADUserTransparencyResponse.m", 86, "self->_transparencyDetails != nil");
}

@end
