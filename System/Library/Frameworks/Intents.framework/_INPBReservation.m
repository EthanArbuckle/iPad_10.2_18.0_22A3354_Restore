@implementation _INPBReservation

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (void)setActions:(id)a3
{
  NSArray *v4;
  NSArray *actions;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  actions = self->_actions;
  self->_actions = v4;

}

- (void)clearActions
{
  -[NSArray removeAllObjects](self->_actions, "removeAllObjects");
}

- (void)addActions:(id)a3
{
  id v4;
  NSArray *actions;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  actions = self->_actions;
  v8 = v4;
  if (!actions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_actions;
    self->_actions = v6;

    v4 = v8;
    actions = self->_actions;
  }
  -[NSArray addObject:](actions, "addObject:", v4);

}

- (unint64_t)actionsCount
{
  return -[NSArray count](self->_actions, "count");
}

- (id)actionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_actions, "objectAtIndexedSubscript:", a3);
}

- (void)setBookingTime:(id)a3
{
  objc_storeStrong((id *)&self->_bookingTime, a3);
}

- (BOOL)hasBookingTime
{
  return self->_bookingTime != 0;
}

- (void)setItemReference:(id)a3
{
  objc_storeStrong((id *)&self->_itemReference, a3);
}

- (BOOL)hasItemReference
{
  return self->_itemReference != 0;
}

- (void)setReservationHolderName:(id)a3
{
  NSString *v4;
  NSString *reservationHolderName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  reservationHolderName = self->_reservationHolderName;
  self->_reservationHolderName = v4;

}

- (BOOL)hasReservationHolderName
{
  return self->_reservationHolderName != 0;
}

- (void)setReservationNumber:(id)a3
{
  NSString *v4;
  NSString *reservationNumber;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  reservationNumber = self->_reservationNumber;
  self->_reservationNumber = v4;

}

- (BOOL)hasReservationNumber
{
  return self->_reservationNumber != 0;
}

- (void)setReservationStatus:(int)a3
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
    self->_reservationStatus = a3;
  }
}

- (BOOL)hasReservationStatus
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasReservationStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)reservationStatusAsString:(int)a3
{
  if ((a3 - 1) < 5)
    return *(&off_1E2293B28 + (a3 - 1));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsReservationStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_RESERVATION_STATUS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CANCELED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PENDING")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HOLD")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CONFIRMED")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBReservationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBReservation url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBReservation url](self, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = self->_actions;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  -[_INPBReservation bookingTime](self, "bookingTime", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBReservation bookingTime](self, "bookingTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBReservation itemReference](self, "itemReference");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[_INPBReservation itemReference](self, "itemReference");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBReservation reservationHolderName](self, "reservationHolderName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    PBDataWriterWriteStringField();
  -[_INPBReservation reservationNumber](self, "reservationNumber");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    PBDataWriterWriteStringField();
  if (-[_INPBReservation hasReservationStatus](self, "hasReservationStatus"))
    PBDataWriterWriteInt32Field();

}

- (_INPBReservation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBReservation *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBReservation *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBReservation *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBReservation initWithData:](self, "initWithData:", v6);

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
  -[_INPBReservation data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBReservation *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v5 = -[_INPBReservation init](+[_INPBReservation allocWithZone:](_INPBReservation, "allocWithZone:"), "init");
  v6 = -[_INPBURLValue copyWithZone:](self->_url, "copyWithZone:", a3);
  -[_INPBReservation setUrl:](v5, "setUrl:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_actions, "copyWithZone:", a3);
  -[_INPBReservation setActions:](v5, "setActions:", v7);

  v8 = -[_INPBTimestamp copyWithZone:](self->_bookingTime, "copyWithZone:", a3);
  -[_INPBReservation setBookingTime:](v5, "setBookingTime:", v8);

  v9 = -[_INPBDataString copyWithZone:](self->_itemReference, "copyWithZone:", a3);
  -[_INPBReservation setItemReference:](v5, "setItemReference:", v9);

  v10 = (void *)-[NSString copyWithZone:](self->_reservationHolderName, "copyWithZone:", a3);
  -[_INPBReservation setReservationHolderName:](v5, "setReservationHolderName:", v10);

  v11 = (void *)-[NSString copyWithZone:](self->_reservationNumber, "copyWithZone:", a3);
  -[_INPBReservation setReservationNumber:](v5, "setReservationNumber:", v11);

  if (-[_INPBReservation hasReservationStatus](self, "hasReservationStatus"))
    -[_INPBReservation setReservationStatus:](v5, "setReservationStatus:", -[_INPBReservation reservationStatus](self, "reservationStatus"));
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
  BOOL v37;
  int v39;
  int reservationStatus;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  -[_INPBReservation url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBReservation url](self, "url");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBReservation url](self, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBReservation actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBReservation actions](self, "actions");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBReservation actions](self, "actions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBReservation bookingTime](self, "bookingTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bookingTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBReservation bookingTime](self, "bookingTime");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBReservation bookingTime](self, "bookingTime");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bookingTime");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBReservation itemReference](self, "itemReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBReservation itemReference](self, "itemReference");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBReservation itemReference](self, "itemReference");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemReference");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBReservation reservationHolderName](self, "reservationHolderName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reservationHolderName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBReservation reservationHolderName](self, "reservationHolderName");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_INPBReservation reservationHolderName](self, "reservationHolderName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reservationHolderName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBReservation reservationNumber](self, "reservationNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reservationNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_31:

    goto LABEL_32;
  }
  -[_INPBReservation reservationNumber](self, "reservationNumber");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_INPBReservation reservationNumber](self, "reservationNumber");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reservationNumber");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_32;
  }
  else
  {

  }
  v39 = -[_INPBReservation hasReservationStatus](self, "hasReservationStatus");
  if (v39 == objc_msgSend(v4, "hasReservationStatus"))
  {
    if (!-[_INPBReservation hasReservationStatus](self, "hasReservationStatus")
      || !objc_msgSend(v4, "hasReservationStatus")
      || (reservationStatus = self->_reservationStatus,
          reservationStatus == objc_msgSend(v4, "reservationStatus")))
    {
      v37 = 1;
      goto LABEL_33;
    }
  }
LABEL_32:
  v37 = 0;
LABEL_33:

  return v37;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;

  v3 = -[_INPBURLValue hash](self->_url, "hash");
  v4 = -[NSArray hash](self->_actions, "hash");
  v5 = -[_INPBTimestamp hash](self->_bookingTime, "hash");
  v6 = -[_INPBDataString hash](self->_itemReference, "hash");
  v7 = -[NSString hash](self->_reservationHolderName, "hash");
  v8 = -[NSString hash](self->_reservationNumber, "hash");
  if (-[_INPBReservation hasReservationStatus](self, "hasReservationStatus"))
    v9 = 2654435761 * self->_reservationStatus;
  else
    v9 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBReservation url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("URL"));

  if (-[NSArray count](self->_actions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = self->_actions;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("actions"));
  }
  -[_INPBReservation bookingTime](self, "bookingTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("bookingTime"));

  -[_INPBReservation itemReference](self, "itemReference");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("itemReference"));

  if (self->_reservationHolderName)
  {
    -[_INPBReservation reservationHolderName](self, "reservationHolderName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("reservationHolderName"));

  }
  if (self->_reservationNumber)
  {
    -[_INPBReservation reservationNumber](self, "reservationNumber");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("reservationNumber"));

  }
  if (-[_INPBReservation hasReservationStatus](self, "hasReservationStatus"))
  {
    v21 = -[_INPBReservation reservationStatus](self, "reservationStatus");
    if ((v21 - 1) >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = *(&off_1E2293B28 + (v21 - 1));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("reservationStatus"));

  }
  return v3;
}

- (_INPBURLValue)url
{
  return self->_url;
}

- (NSArray)actions
{
  return self->_actions;
}

- (_INPBTimestamp)bookingTime
{
  return self->_bookingTime;
}

- (_INPBDataString)itemReference
{
  return self->_itemReference;
}

- (NSString)reservationHolderName
{
  return self->_reservationHolderName;
}

- (NSString)reservationNumber
{
  return self->_reservationNumber;
}

- (int)reservationStatus
{
  return self->_reservationStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reservationNumber, 0);
  objc_storeStrong((id *)&self->_reservationHolderName, 0);
  objc_storeStrong((id *)&self->_itemReference, 0);
  objc_storeStrong((id *)&self->_bookingTime, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

+ (Class)actionsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
