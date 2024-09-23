@implementation DRSProtoTaskingConfigReceipt

- (BOOL)hasTaskingConfigMetadata
{
  return self->_taskingConfigMetadata != 0;
}

- (BOOL)hasReceiptResult
{
  return self->_receiptResult != 0;
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
  v8.super_class = (Class)DRSProtoTaskingConfigReceipt;
  -[DRSProtoTaskingConfigReceipt description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSProtoTaskingConfigReceipt dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  DRSProtoTaskingConfigMetadata *taskingConfigMetadata;
  void *v5;
  NSString *receiptResult;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  taskingConfigMetadata = self->_taskingConfigMetadata;
  if (taskingConfigMetadata)
  {
    -[DRSProtoTaskingConfigMetadata dictionaryRepresentation](taskingConfigMetadata, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("tasking_config_metadata"));

  }
  receiptResult = self->_receiptResult;
  if (receiptResult)
    objc_msgSend(v3, "setObject:forKey:", receiptResult, CFSTR("receipt_result"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoTaskingConfigReceiptReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_taskingConfigMetadata)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_receiptResult)
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
  if (self->_taskingConfigMetadata)
  {
    objc_msgSend(v4, "setTaskingConfigMetadata:");
    v4 = v5;
  }
  if (self->_receiptResult)
  {
    objc_msgSend(v5, "setReceiptResult:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[DRSProtoTaskingConfigMetadata copyWithZone:](self->_taskingConfigMetadata, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_receiptResult, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  DRSProtoTaskingConfigMetadata *taskingConfigMetadata;
  NSString *receiptResult;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((taskingConfigMetadata = self->_taskingConfigMetadata, !((unint64_t)taskingConfigMetadata | v4[2]))
     || -[DRSProtoTaskingConfigMetadata isEqual:](taskingConfigMetadata, "isEqual:")))
  {
    receiptResult = self->_receiptResult;
    if ((unint64_t)receiptResult | v4[1])
      v7 = -[NSString isEqual:](receiptResult, "isEqual:");
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
  unint64_t v3;

  v3 = -[DRSProtoTaskingConfigMetadata hash](self->_taskingConfigMetadata, "hash");
  return -[NSString hash](self->_receiptResult, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  DRSProtoTaskingConfigMetadata *taskingConfigMetadata;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  taskingConfigMetadata = self->_taskingConfigMetadata;
  v6 = v4[2];
  v7 = v4;
  if (taskingConfigMetadata)
  {
    if (!v6)
      goto LABEL_7;
    -[DRSProtoTaskingConfigMetadata mergeFrom:](taskingConfigMetadata, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[DRSProtoTaskingConfigReceipt setTaskingConfigMetadata:](self, "setTaskingConfigMetadata:");
  }
  v4 = v7;
LABEL_7:
  if (v4[1])
  {
    -[DRSProtoTaskingConfigReceipt setReceiptResult:](self, "setReceiptResult:");
    v4 = v7;
  }

}

- (DRSProtoTaskingConfigMetadata)taskingConfigMetadata
{
  return self->_taskingConfigMetadata;
}

- (void)setTaskingConfigMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_taskingConfigMetadata, a3);
}

- (NSString)receiptResult
{
  return self->_receiptResult;
}

- (void)setReceiptResult:(id)a3
{
  objc_storeStrong((id *)&self->_receiptResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskingConfigMetadata, 0);
  objc_storeStrong((id *)&self->_receiptResult, 0);
}

@end
