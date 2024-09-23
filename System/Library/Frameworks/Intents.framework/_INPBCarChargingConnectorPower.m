@implementation _INPBCarChargingConnectorPower

- (void)setChargingConnector:(int)a3
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
    self->_chargingConnector = a3;
  }
}

- (BOOL)hasChargingConnector
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasChargingConnector:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)chargingConnectorAsString:(int)a3
{
  if ((a3 - 2) < 0xA)
    return off_1E22950D8[a3 - 2];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsChargingConnector:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("J1772")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("C_C_S1")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("C_C_S2")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHAdeMO")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("G_B_T_A_C")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("G_B_T_D_C")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Tesla")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Mennekes")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("N_A_C_S_D_C")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("N_A_C_S_A_C")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 2;
  }

  return v4;
}

- (void)setMaximumPower:(id)a3
{
  objc_storeStrong((id *)&self->_maximumPower, a3);
}

- (BOOL)hasMaximumPower
{
  return self->_maximumPower != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCarChargingConnectorPowerReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_INPBCarChargingConnectorPower hasChargingConnector](self, "hasChargingConnector"))
    PBDataWriterWriteInt32Field();
  -[_INPBCarChargingConnectorPower maximumPower](self, "maximumPower");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4)
  {
    -[_INPBCarChargingConnectorPower maximumPower](self, "maximumPower");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }

}

- (_INPBCarChargingConnectorPower)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBCarChargingConnectorPower *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBCarChargingConnectorPower *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBCarChargingConnectorPower *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBCarChargingConnectorPower initWithData:](self, "initWithData:", v6);

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
  -[_INPBCarChargingConnectorPower data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBCarChargingConnectorPower *v5;
  id v6;

  v5 = -[_INPBCarChargingConnectorPower init](+[_INPBCarChargingConnectorPower allocWithZone:](_INPBCarChargingConnectorPower, "allocWithZone:"), "init");
  if (-[_INPBCarChargingConnectorPower hasChargingConnector](self, "hasChargingConnector"))
    -[_INPBCarChargingConnectorPower setChargingConnector:](v5, "setChargingConnector:", -[_INPBCarChargingConnectorPower chargingConnector](self, "chargingConnector"));
  v6 = -[_INPBPower copyWithZone:](self->_maximumPower, "copyWithZone:", a3);
  -[_INPBCarChargingConnectorPower setMaximumPower:](v5, "setMaximumPower:", v6);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int chargingConnector;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[_INPBCarChargingConnectorPower hasChargingConnector](self, "hasChargingConnector");
    if (v5 == objc_msgSend(v4, "hasChargingConnector"))
    {
      if (!-[_INPBCarChargingConnectorPower hasChargingConnector](self, "hasChargingConnector")
        || !objc_msgSend(v4, "hasChargingConnector")
        || (chargingConnector = self->_chargingConnector,
            chargingConnector == objc_msgSend(v4, "chargingConnector")))
      {
        -[_INPBCarChargingConnectorPower maximumPower](self, "maximumPower");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "maximumPower");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if ((v7 == 0) != (v8 != 0))
        {
          -[_INPBCarChargingConnectorPower maximumPower](self, "maximumPower");
          v10 = objc_claimAutoreleasedReturnValue();
          if (!v10)
          {

LABEL_14:
            v15 = 1;
            goto LABEL_12;
          }
          v11 = (void *)v10;
          -[_INPBCarChargingConnectorPower maximumPower](self, "maximumPower");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "maximumPower");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if ((v14 & 1) != 0)
            goto LABEL_14;
        }
        else
        {

        }
      }
    }
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3;

  if (-[_INPBCarChargingConnectorPower hasChargingConnector](self, "hasChargingConnector"))
    v3 = 2654435761 * self->_chargingConnector;
  else
    v3 = 0;
  return -[_INPBPower hash](self->_maximumPower, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBCarChargingConnectorPower hasChargingConnector](self, "hasChargingConnector"))
  {
    v4 = -[_INPBCarChargingConnectorPower chargingConnector](self, "chargingConnector");
    if ((v4 - 2) >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E22950D8[(v4 - 2)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("chargingConnector"));

  }
  -[_INPBCarChargingConnectorPower maximumPower](self, "maximumPower");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("maximumPower"));

  return v3;
}

- (int)chargingConnector
{
  return self->_chargingConnector;
}

- (_INPBPower)maximumPower
{
  return self->_maximumPower;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumPower, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
