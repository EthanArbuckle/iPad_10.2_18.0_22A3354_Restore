@implementation HKCodableAudiogramSensitivityPoint

- (BOOL)hasFrequency
{
  return self->_frequency != 0;
}

- (BOOL)hasLeftEarSensitivity
{
  return self->_leftEarSensitivity != 0;
}

- (BOOL)hasRightEarSensitivity
{
  return self->_rightEarSensitivity != 0;
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
  v8.super_class = (Class)HKCodableAudiogramSensitivityPoint;
  -[HKCodableAudiogramSensitivityPoint description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableAudiogramSensitivityPoint dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HKCodableQuantity *frequency;
  void *v5;
  HKCodableQuantity *leftEarSensitivity;
  void *v7;
  HKCodableQuantity *rightEarSensitivity;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  frequency = self->_frequency;
  if (frequency)
  {
    -[HKCodableQuantity dictionaryRepresentation](frequency, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("frequency"));

  }
  leftEarSensitivity = self->_leftEarSensitivity;
  if (leftEarSensitivity)
  {
    -[HKCodableQuantity dictionaryRepresentation](leftEarSensitivity, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("leftEarSensitivity"));

  }
  rightEarSensitivity = self->_rightEarSensitivity;
  if (rightEarSensitivity)
  {
    -[HKCodableQuantity dictionaryRepresentation](rightEarSensitivity, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("rightEarSensitivity"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableAudiogramSensitivityPointReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_frequency)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_leftEarSensitivity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_rightEarSensitivity)
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
  if (self->_frequency)
  {
    objc_msgSend(v4, "setFrequency:");
    v4 = v5;
  }
  if (self->_leftEarSensitivity)
  {
    objc_msgSend(v5, "setLeftEarSensitivity:");
    v4 = v5;
  }
  if (self->_rightEarSensitivity)
  {
    objc_msgSend(v5, "setRightEarSensitivity:");
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
  v6 = -[HKCodableQuantity copyWithZone:](self->_frequency, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[HKCodableQuantity copyWithZone:](self->_leftEarSensitivity, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[HKCodableQuantity copyWithZone:](self->_rightEarSensitivity, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  HKCodableQuantity *frequency;
  HKCodableQuantity *leftEarSensitivity;
  HKCodableQuantity *rightEarSensitivity;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((frequency = self->_frequency, !((unint64_t)frequency | v4[1]))
     || -[HKCodableQuantity isEqual:](frequency, "isEqual:"))
    && ((leftEarSensitivity = self->_leftEarSensitivity, !((unint64_t)leftEarSensitivity | v4[2]))
     || -[HKCodableQuantity isEqual:](leftEarSensitivity, "isEqual:")))
  {
    rightEarSensitivity = self->_rightEarSensitivity;
    if ((unint64_t)rightEarSensitivity | v4[3])
      v8 = -[HKCodableQuantity isEqual:](rightEarSensitivity, "isEqual:");
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

  v3 = -[HKCodableQuantity hash](self->_frequency, "hash");
  v4 = -[HKCodableQuantity hash](self->_leftEarSensitivity, "hash") ^ v3;
  return v4 ^ -[HKCodableQuantity hash](self->_rightEarSensitivity, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HKCodableQuantity *frequency;
  uint64_t v6;
  HKCodableQuantity *leftEarSensitivity;
  uint64_t v8;
  HKCodableQuantity *rightEarSensitivity;
  uint64_t v10;
  _QWORD *v11;

  v4 = a3;
  frequency = self->_frequency;
  v6 = v4[1];
  v11 = v4;
  if (frequency)
  {
    if (!v6)
      goto LABEL_7;
    -[HKCodableQuantity mergeFrom:](frequency, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[HKCodableAudiogramSensitivityPoint setFrequency:](self, "setFrequency:");
  }
  v4 = v11;
LABEL_7:
  leftEarSensitivity = self->_leftEarSensitivity;
  v8 = v4[2];
  if (leftEarSensitivity)
  {
    if (!v8)
      goto LABEL_13;
    -[HKCodableQuantity mergeFrom:](leftEarSensitivity, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[HKCodableAudiogramSensitivityPoint setLeftEarSensitivity:](self, "setLeftEarSensitivity:");
  }
  v4 = v11;
LABEL_13:
  rightEarSensitivity = self->_rightEarSensitivity;
  v10 = v4[3];
  if (rightEarSensitivity)
  {
    if (v10)
    {
      -[HKCodableQuantity mergeFrom:](rightEarSensitivity, "mergeFrom:");
LABEL_18:
      v4 = v11;
    }
  }
  else if (v10)
  {
    -[HKCodableAudiogramSensitivityPoint setRightEarSensitivity:](self, "setRightEarSensitivity:");
    goto LABEL_18;
  }

}

- (HKCodableQuantity)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(id)a3
{
  objc_storeStrong((id *)&self->_frequency, a3);
}

- (HKCodableQuantity)leftEarSensitivity
{
  return self->_leftEarSensitivity;
}

- (void)setLeftEarSensitivity:(id)a3
{
  objc_storeStrong((id *)&self->_leftEarSensitivity, a3);
}

- (HKCodableQuantity)rightEarSensitivity
{
  return self->_rightEarSensitivity;
}

- (void)setRightEarSensitivity:(id)a3
{
  objc_storeStrong((id *)&self->_rightEarSensitivity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightEarSensitivity, 0);
  objc_storeStrong((id *)&self->_leftEarSensitivity, 0);
  objc_storeStrong((id *)&self->_frequency, 0);
}

@end
