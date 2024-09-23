@implementation CTSMSDataType

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const char *v6;
  const char *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTSMSDataType transport](self, "transport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", transport=%@"), v4);

  -[CTSMSDataType ctFormat](self, "ctFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", ctFormat=%@"), v5);

  if (-[CTSMSDataType parseSMSC](self, "parseSMSC"))
    v6 = "YES";
  else
    v6 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR(", parseSMSC=%s"), v6);
  if (-[CTSMSDataType waitForAck](self, "waitForAck"))
    v7 = "YES";
  else
    v7 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR(", waitForAck=%s"), v7);
  -[CTSMSDataType hexPdu](self, "hexPdu");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", hexData=%@"), v8);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (CTSMSDataType)init
{
  CTSMSDataType *v2;
  CTSMSDataType *v3;
  NSData *hexPdu;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CTSMSDataType;
  v2 = -[CTSMSDataType init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_parseSMSC = 0;
    v2->_transport = 0;
    v2->_ctFormat = 0;
    hexPdu = v2->_hexPdu;
    v2->_hexPdu = 0;

  }
  return v3;
}

- (BOOL)isEqualToCTSMSDataType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v13;
  void *v14;

  v4 = a3;
  if (v4)
  {
    -[CTSMSDataType transport](self, "transport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transport");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
    {
      -[CTSMSDataType ctFormat](self, "ctFormat");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ctFormat");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v9
        && (v10 = -[CTSMSDataType parseSMSC](self, "parseSMSC"), v10 == objc_msgSend(v4, "parseSMSC"))
        && (v11 = -[CTSMSDataType waitForAck](self, "waitForAck"), v11 == objc_msgSend(v4, "waitForAck")))
      {
        -[CTSMSDataType hexPdu](self, "hexPdu");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "hexPdu");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v13, "isEqualToData:", v14);

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CTSMSDataType *v4;
  BOOL v5;

  v4 = (CTSMSDataType *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CTSMSDataType isEqualToCTSMSDataType:](self, "isEqualToCTSMSDataType:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTSMSDataType *v4;
  void *v5;

  v4 = +[CTSMSDataType allocWithZone:](CTSMSDataType, "allocWithZone:", a3);
  -[CTSMSDataType setTransport:](v4, "setTransport:", self->_transport);
  -[CTSMSDataType setCtFormat:](v4, "setCtFormat:", self->_ctFormat);
  -[CTSMSDataType setParseSMSC:](v4, "setParseSMSC:", self->_parseSMSC);
  -[CTSMSDataType setWaitForAck:](v4, "setWaitForAck:", self->_waitForAck);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", self->_hexPdu);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTSMSDataType setHexPdu:](v4, "setHexPdu:", v5);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *transport;
  id v5;

  transport = self->_transport;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", transport, CFSTR("transport"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ctFormat, CFSTR("ct_format"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_parseSMSC, CFSTR("parse_smsc"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_waitForAck, CFSTR("wait_for_ack"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hexPdu, CFSTR("hex_pdu"));

}

- (CTSMSDataType)initWithCoder:(id)a3
{
  id v4;
  CTSMSDataType *v5;
  uint64_t v6;
  NSData *hexPdu;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTSMSDataType;
  v5 = -[CTSMSDataType init](&v9, sel_init);
  if (v5)
  {
    v5->_transport = (NSNumber *)(id)objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transport"));
    v5->_ctFormat = (NSNumber *)(id)objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ct_format"));
    v5->_parseSMSC = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("parse_smsc"));
    v5->_waitForAck = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wait_for_ack"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hex_pdu"));
    v6 = objc_claimAutoreleasedReturnValue();
    hexPdu = v5->_hexPdu;
    v5->_hexPdu = (NSData *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
  self->_transport = (NSNumber *)a3;
}

- (NSNumber)ctFormat
{
  return self->_ctFormat;
}

- (void)setCtFormat:(id)a3
{
  self->_ctFormat = (NSNumber *)a3;
}

- (BOOL)parseSMSC
{
  return self->_parseSMSC;
}

- (void)setParseSMSC:(BOOL)a3
{
  self->_parseSMSC = a3;
}

- (BOOL)waitForAck
{
  return self->_waitForAck;
}

- (void)setWaitForAck:(BOOL)a3
{
  self->_waitForAck = a3;
}

- (NSData)hexPdu
{
  return self->_hexPdu;
}

- (void)setHexPdu:(id)a3
{
  objc_storeStrong((id *)&self->_hexPdu, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hexPdu, 0);
}

@end
