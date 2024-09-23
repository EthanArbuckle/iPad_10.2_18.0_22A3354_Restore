@implementation _INPBSeat

- (void)setSeatNumber:(id)a3
{
  NSString *v4;
  NSString *seatNumber;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  seatNumber = self->_seatNumber;
  self->_seatNumber = v4;

}

- (BOOL)hasSeatNumber
{
  return self->_seatNumber != 0;
}

- (void)setSeatRow:(id)a3
{
  NSString *v4;
  NSString *seatRow;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  seatRow = self->_seatRow;
  self->_seatRow = v4;

}

- (BOOL)hasSeatRow
{
  return self->_seatRow != 0;
}

- (void)setSeatSection:(id)a3
{
  NSString *v4;
  NSString *seatSection;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  seatSection = self->_seatSection;
  self->_seatSection = v4;

}

- (BOOL)hasSeatSection
{
  return self->_seatSection != 0;
}

- (void)setSeatingType:(id)a3
{
  NSString *v4;
  NSString *seatingType;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  seatingType = self->_seatingType;
  self->_seatingType = v4;

}

- (BOOL)hasSeatingType
{
  return self->_seatingType != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSeatReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_INPBSeat seatNumber](self, "seatNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBSeat seatRow](self, "seatRow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[_INPBSeat seatSection](self, "seatSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[_INPBSeat seatingType](self, "seatingType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
  }

}

- (_INPBSeat)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSeat *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSeat *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSeat *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSeat initWithData:](self, "initWithData:", v6);

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
  -[_INPBSeat data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSeat *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = -[_INPBSeat init](+[_INPBSeat allocWithZone:](_INPBSeat, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_seatNumber, "copyWithZone:", a3);
  -[_INPBSeat setSeatNumber:](v5, "setSeatNumber:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_seatRow, "copyWithZone:", a3);
  -[_INPBSeat setSeatRow:](v5, "setSeatRow:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_seatSection, "copyWithZone:", a3);
  -[_INPBSeat setSeatSection:](v5, "setSeatSection:", v8);

  v9 = (void *)-[NSString copyWithZone:](self->_seatingType, "copyWithZone:", a3);
  -[_INPBSeat setSeatingType:](v5, "setSeatingType:", v9);

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
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[_INPBSeat seatNumber](self, "seatNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "seatNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBSeat seatNumber](self, "seatNumber");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBSeat seatNumber](self, "seatNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "seatNumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBSeat seatRow](self, "seatRow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "seatRow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBSeat seatRow](self, "seatRow");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBSeat seatRow](self, "seatRow");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "seatRow");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBSeat seatSection](self, "seatSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "seatSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBSeat seatSection](self, "seatSection");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBSeat seatSection](self, "seatSection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "seatSection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBSeat seatingType](self, "seatingType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "seatingType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBSeat seatingType](self, "seatingType");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[_INPBSeat seatingType](self, "seatingType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "seatingType");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_seatNumber, "hash");
  v4 = -[NSString hash](self->_seatRow, "hash") ^ v3;
  v5 = -[NSString hash](self->_seatSection, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_seatingType, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_seatNumber)
  {
    -[_INPBSeat seatNumber](self, "seatNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("seatNumber"));

  }
  if (self->_seatRow)
  {
    -[_INPBSeat seatRow](self, "seatRow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("seatRow"));

  }
  if (self->_seatSection)
  {
    -[_INPBSeat seatSection](self, "seatSection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("seatSection"));

  }
  if (self->_seatingType)
  {
    -[_INPBSeat seatingType](self, "seatingType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("seatingType"));

  }
  return v3;
}

- (NSString)seatNumber
{
  return self->_seatNumber;
}

- (NSString)seatRow
{
  return self->_seatRow;
}

- (NSString)seatSection
{
  return self->_seatSection;
}

- (NSString)seatingType
{
  return self->_seatingType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seatingType, 0);
  objc_storeStrong((id *)&self->_seatSection, 0);
  objc_storeStrong((id *)&self->_seatRow, 0);
  objc_storeStrong((id *)&self->_seatNumber, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
