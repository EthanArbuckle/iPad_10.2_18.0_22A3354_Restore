@implementation HMPBCharacteristicWriteAction

- (BOOL)hasActionUUID
{
  return self->_actionUUID != 0;
}

- (BOOL)hasTargetValue
{
  return self->_targetValue != 0;
}

- (BOOL)hasCharacteristicReference
{
  return self->_characteristicReference != 0;
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
  v8.super_class = (Class)HMPBCharacteristicWriteAction;
  -[HMPBCharacteristicWriteAction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPBCharacteristicWriteAction dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *actionUUID;
  NSData *targetValue;
  HMPBCharacteristicReference *characteristicReference;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  actionUUID = self->_actionUUID;
  if (actionUUID)
    objc_msgSend(v3, "setObject:forKey:", actionUUID, CFSTR("actionUUID"));
  targetValue = self->_targetValue;
  if (targetValue)
    objc_msgSend(v4, "setObject:forKey:", targetValue, CFSTR("targetValue"));
  characteristicReference = self->_characteristicReference;
  if (characteristicReference)
  {
    -[HMPBCharacteristicReference dictionaryRepresentation](characteristicReference, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("characteristicReference"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HMPBCharacteristicWriteActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_actionUUID)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_targetValue)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_characteristicReference)
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
  if (self->_actionUUID)
  {
    objc_msgSend(v4, "setActionUUID:");
    v4 = v5;
  }
  if (self->_targetValue)
  {
    objc_msgSend(v5, "setTargetValue:");
    v4 = v5;
  }
  if (self->_characteristicReference)
  {
    objc_msgSend(v5, "setCharacteristicReference:");
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
  id v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_actionUUID, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSData copyWithZone:](self->_targetValue, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[HMPBCharacteristicReference copyWithZone:](self->_characteristicReference, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *actionUUID;
  NSData *targetValue;
  HMPBCharacteristicReference *characteristicReference;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((actionUUID = self->_actionUUID, !((unint64_t)actionUUID | v4[1]))
     || -[NSData isEqual:](actionUUID, "isEqual:"))
    && ((targetValue = self->_targetValue, !((unint64_t)targetValue | v4[3]))
     || -[NSData isEqual:](targetValue, "isEqual:")))
  {
    characteristicReference = self->_characteristicReference;
    if ((unint64_t)characteristicReference | v4[2])
      v8 = -[HMPBCharacteristicReference isEqual:](characteristicReference, "isEqual:");
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
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSData hash](self->_actionUUID, "hash");
  v4 = -[NSData hash](self->_targetValue, "hash") ^ v3;
  return v4 ^ -[HMPBCharacteristicReference hash](self->_characteristicReference, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HMPBCharacteristicReference *characteristicReference;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[1])
  {
    -[HMPBCharacteristicWriteAction setActionUUID:](self, "setActionUUID:");
    v4 = v7;
  }
  if (v4[3])
  {
    -[HMPBCharacteristicWriteAction setTargetValue:](self, "setTargetValue:");
    v4 = v7;
  }
  characteristicReference = self->_characteristicReference;
  v6 = v4[2];
  if (characteristicReference)
  {
    if (v6)
    {
      -[HMPBCharacteristicReference mergeFrom:](characteristicReference, "mergeFrom:");
LABEL_10:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[HMPBCharacteristicWriteAction setCharacteristicReference:](self, "setCharacteristicReference:");
    goto LABEL_10;
  }

}

- (NSData)actionUUID
{
  return self->_actionUUID;
}

- (void)setActionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_actionUUID, a3);
}

- (NSData)targetValue
{
  return self->_targetValue;
}

- (void)setTargetValue:(id)a3
{
  objc_storeStrong((id *)&self->_targetValue, a3);
}

- (HMPBCharacteristicReference)characteristicReference
{
  return self->_characteristicReference;
}

- (void)setCharacteristicReference:(id)a3
{
  objc_storeStrong((id *)&self->_characteristicReference, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetValue, 0);
  objc_storeStrong((id *)&self->_characteristicReference, 0);
  objc_storeStrong((id *)&self->_actionUUID, 0);
}

@end
