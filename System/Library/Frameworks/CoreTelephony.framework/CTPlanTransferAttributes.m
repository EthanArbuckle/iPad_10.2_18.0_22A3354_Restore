@implementation CTPlanTransferAttributes

- (CTPlanTransferAttributes)init
{
  CTPlanTransferAttributes *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CTPlanTransferAttributes;
  result = -[CTPlanTransferAttributes init](&v3, sel_init);
  if (result)
  {
    result->_isSecuredFlow = 0;
    result->_transferCapability = 0;
    result->_transferStatus = 0;
  }
  return result;
}

- (CTPlanTransferAttributes)initWithTransferCapability:(unint64_t)a3 transferStatus:(unint64_t)a4 isSecuredFlow:(BOOL)a5 transferEndpoint:(id)a6
{
  id v10;
  CTPlanTransferAttributes *v11;
  CTPlanTransferAttributes *v12;
  uint64_t v13;
  NSString *transferEndpoint;
  objc_super v16;

  v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)CTPlanTransferAttributes;
  v11 = -[CTPlanTransferAttributes init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_transferCapability = a3;
    v11->_transferStatus = a4;
    v11->_isSecuredFlow = a5;
    v13 = objc_msgSend(v10, "copy");
    transferEndpoint = v12->_transferEndpoint;
    v12->_transferEndpoint = (NSString *)v13;

  }
  return v12;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" transferCapability=%s"), CTPlanTransferCapabilityAsString(-[CTPlanTransferAttributes transferCapability](self, "transferCapability")));
  objc_msgSend(v3, "appendFormat:", CFSTR(" transferStatus=%s"), CTPlanTransferStatusAsString(-[CTPlanTransferAttributes transferStatus](self, "transferStatus")));
  objc_msgSend(v3, "appendFormat:", CFSTR(" isSecuredFlow=%d"), self->_isSecuredFlow);
  objc_msgSend(v3, "appendFormat:", CFSTR(" transferEndpoint=%@"), self->_transferEndpoint);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CTPlanTransferAttributes *v4;
  unint64_t v5;
  unint64_t v6;
  _BOOL4 v7;
  char v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (CTPlanTransferAttributes *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v5 = -[CTPlanTransferAttributes transferCapability](self, "transferCapability"),
          v5 == -[CTPlanTransferAttributes transferCapability](v4, "transferCapability"))
      && (v6 = -[CTPlanTransferAttributes transferStatus](self, "transferStatus"),
          v6 == -[CTPlanTransferAttributes transferStatus](v4, "transferStatus"))
      && (v7 = -[CTPlanTransferAttributes isSecuredFlow](self, "isSecuredFlow"),
          v7 == -[CTPlanTransferAttributes isSecuredFlow](v4, "isSecuredFlow")))
    {
      -[CTPlanTransferAttributes transferEndpoint](self, "transferEndpoint");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTPlanTransferAttributes transferEndpoint](v4, "transferEndpoint");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 == v11)
      {
        v8 = 1;
      }
      else
      {
        -[CTPlanTransferAttributes transferEndpoint](self, "transferEndpoint");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTPlanTransferAttributes transferEndpoint](v4, "transferEndpoint");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v12, "isEqualToString:", v13);

      }
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTPlanTransferAttributes)initWithCoder:(id)a3
{
  id v4;
  CTPlanTransferAttributes *v5;
  uint64_t v6;
  NSString *transferEndpoint;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTPlanTransferAttributes;
  v5 = -[CTPlanTransferAttributes init](&v9, sel_init);
  if (v5)
  {
    v5->_transferCapability = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transferCapability"));
    v5->_transferStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transferStatus"));
    v5->_isSecuredFlow = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSecuredFlow"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferEndpoint"));
    v6 = objc_claimAutoreleasedReturnValue();
    transferEndpoint = v5->_transferEndpoint;
    v5->_transferEndpoint = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t transferCapability;
  id v5;

  transferCapability = self->_transferCapability;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", transferCapability, CFSTR("transferCapability"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_transferStatus, CFSTR("transferStatus"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSecuredFlow, CFSTR("isSecuredFlow"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transferEndpoint, CFSTR("transferEndpoint"));

}

- (unint64_t)transferCapability
{
  return self->_transferCapability;
}

- (void)setTransferCapability:(unint64_t)a3
{
  self->_transferCapability = a3;
}

- (unint64_t)transferStatus
{
  return self->_transferStatus;
}

- (void)setTransferStatus:(unint64_t)a3
{
  self->_transferStatus = a3;
}

- (BOOL)isSecuredFlow
{
  return self->_isSecuredFlow;
}

- (void)setIsSecuredFlow:(BOOL)a3
{
  self->_isSecuredFlow = a3;
}

- (NSString)transferEndpoint
{
  return self->_transferEndpoint;
}

- (void)setTransferEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_transferEndpoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferEndpoint, 0);
}

@end
