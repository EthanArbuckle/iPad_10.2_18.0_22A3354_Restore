@implementation NPKProtoRemotePassActionSelectItemRequest

- (BOOL)hasPlanIdentifier
{
  return self->_planIdentifier != 0;
}

- (BOOL)hasPlanLabel
{
  return self->_planLabel != 0;
}

- (BOOL)hasPlanDetailLabel
{
  return self->_planDetailLabel != 0;
}

- (BOOL)hasStartDateData
{
  return self->_startDateData != 0;
}

- (BOOL)hasExpiryDateData
{
  return self->_expiryDateData != 0;
}

- (BOOL)hasPaymentPassActionData
{
  return self->_paymentPassActionData != 0;
}

- (BOOL)hasDeviceIdentifier
{
  return self->_deviceIdentifier != 0;
}

- (BOOL)hasPassTypeIdentifier
{
  return self->_passTypeIdentifier != 0;
}

- (BOOL)hasPassSerialNumber
{
  return self->_passSerialNumber != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoRemotePassActionSelectItemRequest;
  -[NPKProtoRemotePassActionSelectItemRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRemotePassActionSelectItemRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *requestUniqueID;
  NSString *planIdentifier;
  NSString *planLabel;
  NSString *planDetailLabel;
  NSData *startDateData;
  NSData *expiryDateData;
  NSData *paymentPassActionData;
  NSString *deviceIdentifier;
  NSString *passTypeIdentifier;
  NSString *passSerialNumber;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  requestUniqueID = self->_requestUniqueID;
  if (requestUniqueID)
    objc_msgSend(v3, "setObject:forKey:", requestUniqueID, CFSTR("requestUniqueID"));
  planIdentifier = self->_planIdentifier;
  if (planIdentifier)
    objc_msgSend(v4, "setObject:forKey:", planIdentifier, CFSTR("planIdentifier"));
  planLabel = self->_planLabel;
  if (planLabel)
    objc_msgSend(v4, "setObject:forKey:", planLabel, CFSTR("planLabel"));
  planDetailLabel = self->_planDetailLabel;
  if (planDetailLabel)
    objc_msgSend(v4, "setObject:forKey:", planDetailLabel, CFSTR("planDetailLabel"));
  startDateData = self->_startDateData;
  if (startDateData)
    objc_msgSend(v4, "setObject:forKey:", startDateData, CFSTR("startDateData"));
  expiryDateData = self->_expiryDateData;
  if (expiryDateData)
    objc_msgSend(v4, "setObject:forKey:", expiryDateData, CFSTR("expiryDateData"));
  paymentPassActionData = self->_paymentPassActionData;
  if (paymentPassActionData)
    objc_msgSend(v4, "setObject:forKey:", paymentPassActionData, CFSTR("paymentPassActionData"));
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier)
    objc_msgSend(v4, "setObject:forKey:", deviceIdentifier, CFSTR("deviceIdentifier"));
  passTypeIdentifier = self->_passTypeIdentifier;
  if (passTypeIdentifier)
    objc_msgSend(v4, "setObject:forKey:", passTypeIdentifier, CFSTR("passTypeIdentifier"));
  passSerialNumber = self->_passSerialNumber;
  if (passSerialNumber)
    objc_msgSend(v4, "setObject:forKey:", passSerialNumber, CFSTR("passSerialNumber"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRemotePassActionSelectItemRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (!self->_requestUniqueID)
    -[NPKProtoRemotePassActionSelectItemRequest writeTo:].cold.1();
  v6 = v4;
  PBDataWriterWriteStringField();
  if (self->_planIdentifier)
    PBDataWriterWriteStringField();
  if (self->_planLabel)
    PBDataWriterWriteStringField();
  v5 = v6;
  if (self->_planDetailLabel)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if (self->_startDateData)
  {
    PBDataWriterWriteDataField();
    v5 = v6;
  }
  if (self->_expiryDateData)
  {
    PBDataWriterWriteDataField();
    v5 = v6;
  }
  if (self->_paymentPassActionData)
  {
    PBDataWriterWriteDataField();
    v5 = v6;
  }
  if (self->_deviceIdentifier)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if (self->_passTypeIdentifier)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if (self->_passSerialNumber)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }

}

- (void)copyTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setRequestUniqueID:", self->_requestUniqueID);
  if (self->_planIdentifier)
    objc_msgSend(v5, "setPlanIdentifier:");
  if (self->_planLabel)
    objc_msgSend(v5, "setPlanLabel:");
  v4 = v5;
  if (self->_planDetailLabel)
  {
    objc_msgSend(v5, "setPlanDetailLabel:");
    v4 = v5;
  }
  if (self->_startDateData)
  {
    objc_msgSend(v5, "setStartDateData:");
    v4 = v5;
  }
  if (self->_expiryDateData)
  {
    objc_msgSend(v5, "setExpiryDateData:");
    v4 = v5;
  }
  if (self->_paymentPassActionData)
  {
    objc_msgSend(v5, "setPaymentPassActionData:");
    v4 = v5;
  }
  if (self->_deviceIdentifier)
  {
    objc_msgSend(v5, "setDeviceIdentifier:");
    v4 = v5;
  }
  if (self->_passTypeIdentifier)
  {
    objc_msgSend(v5, "setPassTypeIdentifier:");
    v4 = v5;
  }
  if (self->_passSerialNumber)
  {
    objc_msgSend(v5, "setPassSerialNumber:");
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
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_requestUniqueID, "copyWithZone:", a3);
  v7 = (void *)v5[9];
  v5[9] = v6;

  v8 = -[NSString copyWithZone:](self->_planIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[7];
  v5[7] = v8;

  v10 = -[NSString copyWithZone:](self->_planLabel, "copyWithZone:", a3);
  v11 = (void *)v5[8];
  v5[8] = v10;

  v12 = -[NSString copyWithZone:](self->_planDetailLabel, "copyWithZone:", a3);
  v13 = (void *)v5[6];
  v5[6] = v12;

  v14 = -[NSData copyWithZone:](self->_startDateData, "copyWithZone:", a3);
  v15 = (void *)v5[10];
  v5[10] = v14;

  v16 = -[NSData copyWithZone:](self->_expiryDateData, "copyWithZone:", a3);
  v17 = (void *)v5[2];
  v5[2] = v16;

  v18 = -[NSData copyWithZone:](self->_paymentPassActionData, "copyWithZone:", a3);
  v19 = (void *)v5[5];
  v5[5] = v18;

  v20 = -[NSString copyWithZone:](self->_deviceIdentifier, "copyWithZone:", a3);
  v21 = (void *)v5[1];
  v5[1] = v20;

  v22 = -[NSString copyWithZone:](self->_passTypeIdentifier, "copyWithZone:", a3);
  v23 = (void *)v5[4];
  v5[4] = v22;

  v24 = -[NSString copyWithZone:](self->_passSerialNumber, "copyWithZone:", a3);
  v25 = (void *)v5[3];
  v5[3] = v24;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *requestUniqueID;
  NSString *planIdentifier;
  NSString *planLabel;
  NSString *planDetailLabel;
  NSData *startDateData;
  NSData *expiryDateData;
  NSData *paymentPassActionData;
  NSString *deviceIdentifier;
  NSString *passTypeIdentifier;
  NSString *passSerialNumber;
  char v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  requestUniqueID = self->_requestUniqueID;
  if ((unint64_t)requestUniqueID | v4[9])
  {
    if (!-[NSString isEqual:](requestUniqueID, "isEqual:"))
      goto LABEL_22;
  }
  planIdentifier = self->_planIdentifier;
  if ((unint64_t)planIdentifier | v4[7] && !-[NSString isEqual:](planIdentifier, "isEqual:"))
    goto LABEL_22;
  if (((planLabel = self->_planLabel, !((unint64_t)planLabel | v4[8]))
     || -[NSString isEqual:](planLabel, "isEqual:"))
    && ((planDetailLabel = self->_planDetailLabel, !((unint64_t)planDetailLabel | v4[6]))
     || -[NSString isEqual:](planDetailLabel, "isEqual:"))
    && ((startDateData = self->_startDateData, !((unint64_t)startDateData | v4[10]))
     || -[NSData isEqual:](startDateData, "isEqual:"))
    && ((expiryDateData = self->_expiryDateData, !((unint64_t)expiryDateData | v4[2]))
     || -[NSData isEqual:](expiryDateData, "isEqual:"))
    && ((paymentPassActionData = self->_paymentPassActionData, !((unint64_t)paymentPassActionData | v4[5]))
     || -[NSData isEqual:](paymentPassActionData, "isEqual:"))
    && ((deviceIdentifier = self->_deviceIdentifier, !((unint64_t)deviceIdentifier | v4[1]))
     || -[NSString isEqual:](deviceIdentifier, "isEqual:"))
    && ((passTypeIdentifier = self->_passTypeIdentifier, !((unint64_t)passTypeIdentifier | v4[4]))
     || -[NSString isEqual:](passTypeIdentifier, "isEqual:")))
  {
    passSerialNumber = self->_passSerialNumber;
    if ((unint64_t)passSerialNumber | v4[3])
      v15 = -[NSString isEqual:](passSerialNumber, "isEqual:");
    else
      v15 = 1;
  }
  else
  {
LABEL_22:
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;

  v3 = -[NSString hash](self->_requestUniqueID, "hash");
  v4 = -[NSString hash](self->_planIdentifier, "hash") ^ v3;
  v5 = -[NSString hash](self->_planLabel, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_planDetailLabel, "hash");
  v7 = -[NSData hash](self->_startDateData, "hash");
  v8 = v7 ^ -[NSData hash](self->_expiryDateData, "hash");
  v9 = v6 ^ v8 ^ -[NSData hash](self->_paymentPassActionData, "hash");
  v10 = -[NSString hash](self->_deviceIdentifier, "hash");
  v11 = v10 ^ -[NSString hash](self->_passTypeIdentifier, "hash");
  return v9 ^ v11 ^ -[NSString hash](self->_passSerialNumber, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[9])
    -[NPKProtoRemotePassActionSelectItemRequest setRequestUniqueID:](self, "setRequestUniqueID:");
  if (v4[7])
    -[NPKProtoRemotePassActionSelectItemRequest setPlanIdentifier:](self, "setPlanIdentifier:");
  if (v4[8])
    -[NPKProtoRemotePassActionSelectItemRequest setPlanLabel:](self, "setPlanLabel:");
  if (v4[6])
    -[NPKProtoRemotePassActionSelectItemRequest setPlanDetailLabel:](self, "setPlanDetailLabel:");
  if (v4[10])
    -[NPKProtoRemotePassActionSelectItemRequest setStartDateData:](self, "setStartDateData:");
  if (v4[2])
    -[NPKProtoRemotePassActionSelectItemRequest setExpiryDateData:](self, "setExpiryDateData:");
  if (v4[5])
    -[NPKProtoRemotePassActionSelectItemRequest setPaymentPassActionData:](self, "setPaymentPassActionData:");
  if (v4[1])
    -[NPKProtoRemotePassActionSelectItemRequest setDeviceIdentifier:](self, "setDeviceIdentifier:");
  if (v4[4])
    -[NPKProtoRemotePassActionSelectItemRequest setPassTypeIdentifier:](self, "setPassTypeIdentifier:");
  if (v4[3])
    -[NPKProtoRemotePassActionSelectItemRequest setPassSerialNumber:](self, "setPassSerialNumber:");

}

- (NSString)requestUniqueID
{
  return self->_requestUniqueID;
}

- (void)setRequestUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_requestUniqueID, a3);
}

- (NSString)planIdentifier
{
  return self->_planIdentifier;
}

- (void)setPlanIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_planIdentifier, a3);
}

- (NSString)planLabel
{
  return self->_planLabel;
}

- (void)setPlanLabel:(id)a3
{
  objc_storeStrong((id *)&self->_planLabel, a3);
}

- (NSString)planDetailLabel
{
  return self->_planDetailLabel;
}

- (void)setPlanDetailLabel:(id)a3
{
  objc_storeStrong((id *)&self->_planDetailLabel, a3);
}

- (NSData)startDateData
{
  return self->_startDateData;
}

- (void)setStartDateData:(id)a3
{
  objc_storeStrong((id *)&self->_startDateData, a3);
}

- (NSData)expiryDateData
{
  return self->_expiryDateData;
}

- (void)setExpiryDateData:(id)a3
{
  objc_storeStrong((id *)&self->_expiryDateData, a3);
}

- (NSData)paymentPassActionData
{
  return self->_paymentPassActionData;
}

- (void)setPaymentPassActionData:(id)a3
{
  objc_storeStrong((id *)&self->_paymentPassActionData, a3);
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIdentifier, a3);
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_passTypeIdentifier, a3);
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (void)setPassSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_passSerialNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDateData, 0);
  objc_storeStrong((id *)&self->_requestUniqueID, 0);
  objc_storeStrong((id *)&self->_planLabel, 0);
  objc_storeStrong((id *)&self->_planIdentifier, 0);
  objc_storeStrong((id *)&self->_planDetailLabel, 0);
  objc_storeStrong((id *)&self->_paymentPassActionData, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_expiryDateData, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoRemotePassActionSelectItemRequest writeTo:]", "NPKProtoRemotePassActionSelectItemRequest.m", 207, "nil != self->_requestUniqueID");
}

@end
