@implementation CTPNRDataType

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", mechanism=%ld"), -[CTPNRDataType pnrMechanism](self, "pnrMechanism"));
  -[CTPNRDataType svcCenterAddr](self, "svcCenterAddr");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", serviceCenter=%@"), v4);

  -[CTPNRDataType destAddr](self, "destAddr");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", destination=%@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (CTPNRDataType)init
{
  CTPNRDataType *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CTPNRDataType;
  result = -[CTPNRDataType init](&v3, sel_init);
  if (result)
    result->_pnrMechanism = 0;
  return result;
}

- (BOOL)isEqualToCTPNRDataType:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a3;
  if (!v7 || (v8 = -[CTPNRDataType pnrMechanism](self, "pnrMechanism"), v8 != objc_msgSend(v7, "pnrMechanism")))
  {
    v11 = 0;
    goto LABEL_18;
  }
  -[CTPNRDataType svcCenterAddr](self, "svcCenterAddr");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v7, "svcCenterAddr");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v12 = 0;
      goto LABEL_10;
    }
  }
  -[CTPNRDataType svcCenterAddr](self, "svcCenterAddr");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "svcCenterAddr");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == v10)
  {
    v12 = 1;
LABEL_10:
    -[CTPNRDataType destAddr](self, "destAddr");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 || (objc_msgSend(v7, "destAddr"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTPNRDataType destAddr](self, "destAddr");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "destAddr");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v14 == v15;

      if (v13)
      {

        if (!v12)
          goto LABEL_15;
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      v11 = 1;
    }

    if ((v12 & 1) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }

  v11 = 0;
LABEL_15:
  if (!v9)

LABEL_18:
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  CTPNRDataType *v4;
  BOOL v5;

  v4 = (CTPNRDataType *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CTPNRDataType isEqualToCTPNRDataType:](self, "isEqualToCTPNRDataType:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTPNRDataType *v4;

  v4 = +[CTPNRDataType allocWithZone:](CTPNRDataType, "allocWithZone:", a3);
  -[CTPNRDataType setPnrMechanism:](v4, "setPnrMechanism:", self->_pnrMechanism);
  -[CTPNRDataType setSvcCenterAddr:](v4, "setSvcCenterAddr:", self->_svcCenterAddr);
  -[CTPNRDataType setDestAddr:](v4, "setDestAddr:", self->_destAddr);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t pnrMechanism;
  id v5;

  pnrMechanism = self->_pnrMechanism;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", pnrMechanism, CFSTR("pnr_mechanism"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_svcCenterAddr, CFSTR("svc_center_addr"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_destAddr, CFSTR("dst_addr"));

}

- (CTPNRDataType)initWithCoder:(id)a3
{
  id v4;
  CTPNRDataType *v5;
  uint64_t v6;
  NSString *svcCenterAddr;
  uint64_t v8;
  NSString *destAddr;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTPNRDataType;
  v5 = -[CTPNRDataType init](&v11, sel_init);
  if (v5)
  {
    v5->_pnrMechanism = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pnr_mechanism"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("svc_center_addr"));
    v6 = objc_claimAutoreleasedReturnValue();
    svcCenterAddr = v5->_svcCenterAddr;
    v5->_svcCenterAddr = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dst_addr"));
    v8 = objc_claimAutoreleasedReturnValue();
    destAddr = v5->_destAddr;
    v5->_destAddr = (NSString *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)pnrMechanism
{
  return self->_pnrMechanism;
}

- (void)setPnrMechanism:(int64_t)a3
{
  self->_pnrMechanism = a3;
}

- (NSString)svcCenterAddr
{
  return self->_svcCenterAddr;
}

- (void)setSvcCenterAddr:(id)a3
{
  objc_storeStrong((id *)&self->_svcCenterAddr, a3);
}

- (NSString)destAddr
{
  return self->_destAddr;
}

- (void)setDestAddr:(id)a3
{
  objc_storeStrong((id *)&self->_destAddr, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destAddr, 0);
  objc_storeStrong((id *)&self->_svcCenterAddr, 0);
}

@end
