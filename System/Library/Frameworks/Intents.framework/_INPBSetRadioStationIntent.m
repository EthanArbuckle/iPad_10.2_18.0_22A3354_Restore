@implementation _INPBSetRadioStationIntent

- (void)setChannel:(id)a3
{
  objc_storeStrong((id *)&self->_channel, a3);
}

- (BOOL)hasChannel
{
  return self->_channel != 0;
}

- (void)setFrequency:(id)a3
{
  objc_storeStrong((id *)&self->_frequency, a3);
}

- (BOOL)hasFrequency
{
  return self->_frequency != 0;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setPresetNumber:(id)a3
{
  objc_storeStrong((id *)&self->_presetNumber, a3);
}

- (BOOL)hasPresetNumber
{
  return self->_presetNumber != 0;
}

- (void)setRadioType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_radioType = a3;
  }
}

- (BOOL)hasRadioType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasRadioType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)radioTypeAsString:(int)a3
{
  if ((a3 - 1) < 5)
    return off_1E228FA10[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRadioType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AM")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FM")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HD")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SATELLITE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DAB")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setStationName:(id)a3
{
  objc_storeStrong((id *)&self->_stationName, a3);
}

- (BOOL)hasStationName
{
  return self->_stationName != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetRadioStationIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[_INPBSetRadioStationIntent channel](self, "channel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBSetRadioStationIntent channel](self, "channel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSetRadioStationIntent frequency](self, "frequency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBSetRadioStationIntent frequency](self, "frequency");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSetRadioStationIntent intentMetadata](self, "intentMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBSetRadioStationIntent intentMetadata](self, "intentMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSetRadioStationIntent presetNumber](self, "presetNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBSetRadioStationIntent presetNumber](self, "presetNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBSetRadioStationIntent hasRadioType](self, "hasRadioType"))
    PBDataWriterWriteInt32Field();
  -[_INPBSetRadioStationIntent stationName](self, "stationName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v15;
  if (v12)
  {
    -[_INPBSetRadioStationIntent stationName](self, "stationName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v13 = v15;
  }

}

- (_INPBSetRadioStationIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSetRadioStationIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSetRadioStationIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSetRadioStationIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSetRadioStationIntent initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBSetRadioStationIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSetRadioStationIntent *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v5 = -[_INPBSetRadioStationIntent init](+[_INPBSetRadioStationIntent allocWithZone:](_INPBSetRadioStationIntent, "allocWithZone:"), "init");
  v6 = -[_INPBString copyWithZone:](self->_channel, "copyWithZone:", a3);
  -[_INPBSetRadioStationIntent setChannel:](v5, "setChannel:", v6);

  v7 = -[_INPBDouble copyWithZone:](self->_frequency, "copyWithZone:", a3);
  -[_INPBSetRadioStationIntent setFrequency:](v5, "setFrequency:", v7);

  v8 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBSetRadioStationIntent setIntentMetadata:](v5, "setIntentMetadata:", v8);

  v9 = -[_INPBInteger copyWithZone:](self->_presetNumber, "copyWithZone:", a3);
  -[_INPBSetRadioStationIntent setPresetNumber:](v5, "setPresetNumber:", v9);

  if (-[_INPBSetRadioStationIntent hasRadioType](self, "hasRadioType"))
    -[_INPBSetRadioStationIntent setRadioType:](v5, "setRadioType:", -[_INPBSetRadioStationIntent radioType](self, "radioType"));
  v10 = -[_INPBString copyWithZone:](self->_stationName, "copyWithZone:", a3);
  -[_INPBSetRadioStationIntent setStationName:](v5, "setStationName:", v10);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  int radioType;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  BOOL v34;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  -[_INPBSetRadioStationIntent channel](self, "channel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "channel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_30;
  -[_INPBSetRadioStationIntent channel](self, "channel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBSetRadioStationIntent channel](self, "channel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "channel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_31;
  }
  else
  {

  }
  -[_INPBSetRadioStationIntent frequency](self, "frequency");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frequency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_30;
  -[_INPBSetRadioStationIntent frequency](self, "frequency");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBSetRadioStationIntent frequency](self, "frequency");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frequency");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_31;
  }
  else
  {

  }
  -[_INPBSetRadioStationIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_30;
  -[_INPBSetRadioStationIntent intentMetadata](self, "intentMetadata");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBSetRadioStationIntent intentMetadata](self, "intentMetadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_31;
  }
  else
  {

  }
  -[_INPBSetRadioStationIntent presetNumber](self, "presetNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presetNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_30;
  -[_INPBSetRadioStationIntent presetNumber](self, "presetNumber");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBSetRadioStationIntent presetNumber](self, "presetNumber");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presetNumber");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_31;
  }
  else
  {

  }
  v27 = -[_INPBSetRadioStationIntent hasRadioType](self, "hasRadioType");
  if (v27 != objc_msgSend(v4, "hasRadioType"))
    goto LABEL_31;
  if (-[_INPBSetRadioStationIntent hasRadioType](self, "hasRadioType"))
  {
    if (objc_msgSend(v4, "hasRadioType"))
    {
      radioType = self->_radioType;
      if (radioType != objc_msgSend(v4, "radioType"))
        goto LABEL_31;
    }
  }
  -[_INPBSetRadioStationIntent stationName](self, "stationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBSetRadioStationIntent stationName](self, "stationName");
    v29 = objc_claimAutoreleasedReturnValue();
    if (!v29)
    {

LABEL_34:
      v34 = 1;
      goto LABEL_32;
    }
    v30 = (void *)v29;
    -[_INPBSetRadioStationIntent stationName](self, "stationName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stationName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if ((v33 & 1) != 0)
      goto LABEL_34;
  }
  else
  {
LABEL_30:

  }
LABEL_31:
  v34 = 0;
LABEL_32:

  return v34;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v3 = -[_INPBString hash](self->_channel, "hash");
  v4 = -[_INPBDouble hash](self->_frequency, "hash");
  v5 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  v6 = -[_INPBInteger hash](self->_presetNumber, "hash");
  if (-[_INPBSetRadioStationIntent hasRadioType](self, "hasRadioType"))
    v7 = 2654435761 * self->_radioType;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[_INPBString hash](self->_stationName, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBSetRadioStationIntent channel](self, "channel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("channel"));

  -[_INPBSetRadioStationIntent frequency](self, "frequency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("frequency"));

  -[_INPBSetRadioStationIntent intentMetadata](self, "intentMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("intentMetadata"));

  -[_INPBSetRadioStationIntent presetNumber](self, "presetNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("presetNumber"));

  if (-[_INPBSetRadioStationIntent hasRadioType](self, "hasRadioType"))
  {
    v12 = -[_INPBSetRadioStationIntent radioType](self, "radioType");
    if ((v12 - 1) >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E228FA10[(v12 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("radioType"));

  }
  -[_INPBSetRadioStationIntent stationName](self, "stationName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("stationName"));

  return v3;
}

- (_INPBString)channel
{
  return self->_channel;
}

- (_INPBDouble)frequency
{
  return self->_frequency;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBInteger)presetNumber
{
  return self->_presetNumber;
}

- (int)radioType
{
  return self->_radioType;
}

- (_INPBString)stationName
{
  return self->_stationName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationName, 0);
  objc_storeStrong((id *)&self->_presetNumber, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_frequency, 0);
  objc_storeStrong((id *)&self->_channel, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
