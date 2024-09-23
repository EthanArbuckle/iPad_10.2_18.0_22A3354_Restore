@implementation _INPBDeleteParkingLocationIntentResponse

- (void)setParkingLocation:(id)a3
{
  objc_storeStrong((id *)&self->_parkingLocation, a3);
}

- (BOOL)hasParkingLocation
{
  return self->_parkingLocation != 0;
}

- (void)setParkingNote:(id)a3
{
  objc_storeStrong((id *)&self->_parkingNote, a3);
}

- (BOOL)hasParkingNote
{
  return self->_parkingNote != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDeleteParkingLocationIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_INPBDeleteParkingLocationIntentResponse parkingLocation](self, "parkingLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBDeleteParkingLocationIntentResponse parkingLocation](self, "parkingLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBDeleteParkingLocationIntentResponse parkingNote](self, "parkingNote");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBDeleteParkingLocationIntentResponse parkingNote](self, "parkingNote");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBDeleteParkingLocationIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBDeleteParkingLocationIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBDeleteParkingLocationIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBDeleteParkingLocationIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBDeleteParkingLocationIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBDeleteParkingLocationIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBDeleteParkingLocationIntentResponse *v5;
  id v6;
  id v7;

  v5 = -[_INPBDeleteParkingLocationIntentResponse init](+[_INPBDeleteParkingLocationIntentResponse allocWithZone:](_INPBDeleteParkingLocationIntentResponse, "allocWithZone:"), "init");
  v6 = -[_INPBLocation copyWithZone:](self->_parkingLocation, "copyWithZone:", a3);
  -[_INPBDeleteParkingLocationIntentResponse setParkingLocation:](v5, "setParkingLocation:", v6);

  v7 = -[_INPBString copyWithZone:](self->_parkingNote, "copyWithZone:", a3);
  -[_INPBDeleteParkingLocationIntentResponse setParkingNote:](v5, "setParkingNote:", v7);

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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_INPBDeleteParkingLocationIntentResponse parkingLocation](self, "parkingLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parkingLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBDeleteParkingLocationIntentResponse parkingLocation](self, "parkingLocation");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBDeleteParkingLocationIntentResponse parkingLocation](self, "parkingLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parkingLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBDeleteParkingLocationIntentResponse parkingNote](self, "parkingNote");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parkingNote");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBDeleteParkingLocationIntentResponse parkingNote](self, "parkingNote");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_INPBDeleteParkingLocationIntentResponse parkingNote](self, "parkingNote");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parkingNote");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[_INPBLocation hash](self->_parkingLocation, "hash");
  return -[_INPBString hash](self->_parkingNote, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBDeleteParkingLocationIntentResponse parkingLocation](self, "parkingLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("parkingLocation"));

  -[_INPBDeleteParkingLocationIntentResponse parkingNote](self, "parkingNote");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("parkingNote"));

  return v3;
}

- (_INPBLocation)parkingLocation
{
  return self->_parkingLocation;
}

- (_INPBString)parkingNote
{
  return self->_parkingNote;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parkingNote, 0);
  objc_storeStrong((id *)&self->_parkingLocation, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
