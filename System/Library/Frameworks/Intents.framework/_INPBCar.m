@implementation _INPBCar

- (void)setCarIdentifier:(id)a3
{
  NSString *v4;
  NSString *carIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  carIdentifier = self->_carIdentifier;
  self->_carIdentifier = v4;

}

- (BOOL)hasCarIdentifier
{
  return self->_carIdentifier != 0;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (BOOL)hasColor
{
  return self->_color != 0;
}

- (void)setDisplayName:(id)a3
{
  NSString *v4;
  NSString *displayName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  displayName = self->_displayName;
  self->_displayName = v4;

}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (void)setHeadUnit:(id)a3
{
  objc_storeStrong((id *)&self->_headUnit, a3);
}

- (BOOL)hasHeadUnit
{
  return self->_headUnit != 0;
}

- (void)setMake:(id)a3
{
  NSString *v4;
  NSString *make;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  make = self->_make;
  self->_make = v4;

}

- (BOOL)hasMake
{
  return self->_make != 0;
}

- (void)setModel:(id)a3
{
  NSString *v4;
  NSString *model;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  model = self->_model;
  self->_model = v4;

}

- (BOOL)hasModel
{
  return self->_model != 0;
}

- (void)setPowerPerConnectors:(id)a3
{
  NSArray *v4;
  NSArray *powerPerConnectors;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  powerPerConnectors = self->_powerPerConnectors;
  self->_powerPerConnectors = v4;

}

- (void)clearPowerPerConnectors
{
  -[NSArray removeAllObjects](self->_powerPerConnectors, "removeAllObjects");
}

- (void)addPowerPerConnector:(id)a3
{
  id v4;
  NSArray *powerPerConnectors;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  powerPerConnectors = self->_powerPerConnectors;
  v8 = v4;
  if (!powerPerConnectors)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_powerPerConnectors;
    self->_powerPerConnectors = v6;

    v4 = v8;
    powerPerConnectors = self->_powerPerConnectors;
  }
  -[NSArray addObject:](powerPerConnectors, "addObject:", v4);

}

- (unint64_t)powerPerConnectorsCount
{
  return -[NSArray count](self->_powerPerConnectors, "count");
}

- (id)powerPerConnectorAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_powerPerConnectors, "objectAtIndexedSubscript:", a3);
}

- (void)setSupportedChargingConnectors:(id)a3
{
  NSArray *v4;
  NSArray *supportedChargingConnectors;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  supportedChargingConnectors = self->_supportedChargingConnectors;
  self->_supportedChargingConnectors = v4;

}

- (void)clearSupportedChargingConnectors
{
  -[NSArray removeAllObjects](self->_supportedChargingConnectors, "removeAllObjects");
}

- (void)addSupportedChargingConnectors:(id)a3
{
  id v4;
  NSArray *supportedChargingConnectors;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  supportedChargingConnectors = self->_supportedChargingConnectors;
  v8 = v4;
  if (!supportedChargingConnectors)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_supportedChargingConnectors;
    self->_supportedChargingConnectors = v6;

    v4 = v8;
    supportedChargingConnectors = self->_supportedChargingConnectors;
  }
  -[NSArray addObject:](supportedChargingConnectors, "addObject:", v4);

}

- (unint64_t)supportedChargingConnectorsCount
{
  return -[NSArray count](self->_supportedChargingConnectors, "count");
}

- (id)supportedChargingConnectorsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_supportedChargingConnectors, "objectAtIndexedSubscript:", a3);
}

- (void)setYear:(id)a3
{
  NSString *v4;
  NSString *year;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  year = self->_year;
  self->_year = v4;

}

- (BOOL)hasYear
{
  return self->_year != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCarReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBCar carIdentifier](self, "carIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[_INPBCar color](self, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBCar color](self, "color");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBCar displayName](self, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  -[_INPBCar headUnit](self, "headUnit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_INPBCar headUnit](self, "headUnit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBCar make](self, "make");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    PBDataWriterWriteStringField();
  -[_INPBCar model](self, "model");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    PBDataWriterWriteStringField();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = self->_powerPerConnectors;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v29;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v13);
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v15);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = self->_supportedChargingConnectors;
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v25;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v18);
        PBDataWriterWriteStringField();
        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v20);
  }

  -[_INPBCar year](self, "year", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    PBDataWriterWriteStringField();

}

- (_INPBCar)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBCar *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBCar *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBCar *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBCar initWithData:](self, "initWithData:", v6);

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
  -[_INPBCar data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBCar *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = -[_INPBCar init](+[_INPBCar allocWithZone:](_INPBCar, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_carIdentifier, "copyWithZone:", a3);
  -[_INPBCar setCarIdentifier:](v5, "setCarIdentifier:", v6);

  v7 = -[_INPBColor copyWithZone:](self->_color, "copyWithZone:", a3);
  -[_INPBCar setColor:](v5, "setColor:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  -[_INPBCar setDisplayName:](v5, "setDisplayName:", v8);

  v9 = -[_INPBCarHeadUnit copyWithZone:](self->_headUnit, "copyWithZone:", a3);
  -[_INPBCar setHeadUnit:](v5, "setHeadUnit:", v9);

  v10 = (void *)-[NSString copyWithZone:](self->_make, "copyWithZone:", a3);
  -[_INPBCar setMake:](v5, "setMake:", v10);

  v11 = (void *)-[NSString copyWithZone:](self->_model, "copyWithZone:", a3);
  -[_INPBCar setModel:](v5, "setModel:", v11);

  v12 = (void *)-[NSArray copyWithZone:](self->_powerPerConnectors, "copyWithZone:", a3);
  -[_INPBCar setPowerPerConnectors:](v5, "setPowerPerConnectors:", v12);

  v13 = (void *)-[NSArray copyWithZone:](self->_supportedChargingConnectors, "copyWithZone:", a3);
  -[_INPBCar setSupportedChargingConnectors:](v5, "setSupportedChargingConnectors:", v13);

  v14 = (void *)-[NSString copyWithZone:](self->_year, "copyWithZone:", a3);
  -[_INPBCar setYear:](v5, "setYear:", v14);

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
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  BOOL v52;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_47;
  -[_INPBCar carIdentifier](self, "carIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "carIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_INPBCar carIdentifier](self, "carIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBCar carIdentifier](self, "carIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "carIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_47;
  }
  else
  {

  }
  -[_INPBCar color](self, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_INPBCar color](self, "color");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBCar color](self, "color");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "color");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_47;
  }
  else
  {

  }
  -[_INPBCar displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_INPBCar displayName](self, "displayName");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBCar displayName](self, "displayName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_47;
  }
  else
  {

  }
  -[_INPBCar headUnit](self, "headUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_INPBCar headUnit](self, "headUnit");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBCar headUnit](self, "headUnit");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "headUnit");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_47;
  }
  else
  {

  }
  -[_INPBCar make](self, "make");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "make");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_INPBCar make](self, "make");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_INPBCar make](self, "make");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "make");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_47;
  }
  else
  {

  }
  -[_INPBCar model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_INPBCar model](self, "model");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_INPBCar model](self, "model");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "model");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_47;
  }
  else
  {

  }
  -[_INPBCar powerPerConnectors](self, "powerPerConnectors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "powerPerConnectors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_INPBCar powerPerConnectors](self, "powerPerConnectors");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_INPBCar powerPerConnectors](self, "powerPerConnectors");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "powerPerConnectors");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_47;
  }
  else
  {

  }
  -[_INPBCar supportedChargingConnectors](self, "supportedChargingConnectors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supportedChargingConnectors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_INPBCar supportedChargingConnectors](self, "supportedChargingConnectors");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_INPBCar supportedChargingConnectors](self, "supportedChargingConnectors");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "supportedChargingConnectors");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_47;
  }
  else
  {

  }
  -[_INPBCar year](self, "year");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "year");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBCar year](self, "year");
    v47 = objc_claimAutoreleasedReturnValue();
    if (!v47)
    {

LABEL_50:
      v52 = 1;
      goto LABEL_48;
    }
    v48 = (void *)v47;
    -[_INPBCar year](self, "year");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "year");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if ((v51 & 1) != 0)
      goto LABEL_50;
  }
  else
  {
LABEL_46:

  }
LABEL_47:
  v52 = 0;
LABEL_48:

  return v52;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[NSString hash](self->_carIdentifier, "hash");
  v4 = -[_INPBColor hash](self->_color, "hash") ^ v3;
  v5 = -[NSString hash](self->_displayName, "hash");
  v6 = v4 ^ v5 ^ -[_INPBCarHeadUnit hash](self->_headUnit, "hash");
  v7 = -[NSString hash](self->_make, "hash");
  v8 = v7 ^ -[NSString hash](self->_model, "hash");
  v9 = v6 ^ v8 ^ -[NSArray hash](self->_powerPerConnectors, "hash");
  v10 = -[NSArray hash](self->_supportedChargingConnectors, "hash");
  return v9 ^ v10 ^ -[NSString hash](self->_year, "hash");
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_carIdentifier)
  {
    -[_INPBCar carIdentifier](self, "carIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("carIdentifier"));

  }
  -[_INPBCar color](self, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("color"));

  if (self->_displayName)
  {
    -[_INPBCar displayName](self, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("displayName"));

  }
  -[_INPBCar headUnit](self, "headUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("headUnit"));

  if (self->_make)
  {
    -[_INPBCar make](self, "make");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("make"));

  }
  if (self->_model)
  {
    -[_INPBCar model](self, "model");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("model"));

  }
  if (-[NSArray count](self->_powerPerConnectors, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v17 = self->_powerPerConnectors;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v29;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v21), "dictionaryRepresentation", (_QWORD)v28);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

          ++v21;
        }
        while (v19 != v21);
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v19);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("powerPerConnector"));
  }
  if (self->_supportedChargingConnectors)
  {
    -[_INPBCar supportedChargingConnectors](self, "supportedChargingConnectors");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("supportedChargingConnectors"));

  }
  if (self->_year)
  {
    -[_INPBCar year](self, "year");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("year"));

  }
  return v3;
}

- (NSString)carIdentifier
{
  return self->_carIdentifier;
}

- (_INPBColor)color
{
  return self->_color;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (_INPBCarHeadUnit)headUnit
{
  return self->_headUnit;
}

- (NSString)make
{
  return self->_make;
}

- (NSString)model
{
  return self->_model;
}

- (NSArray)powerPerConnectors
{
  return self->_powerPerConnectors;
}

- (NSArray)supportedChargingConnectors
{
  return self->_supportedChargingConnectors;
}

- (NSString)year
{
  return self->_year;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_year, 0);
  objc_storeStrong((id *)&self->_supportedChargingConnectors, 0);
  objc_storeStrong((id *)&self->_powerPerConnectors, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_make, 0);
  objc_storeStrong((id *)&self->_headUnit, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_carIdentifier, 0);
}

+ (Class)powerPerConnectorType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
