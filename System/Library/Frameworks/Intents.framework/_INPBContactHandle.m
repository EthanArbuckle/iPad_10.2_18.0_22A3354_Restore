@implementation _INPBContactHandle

- (void)setEmergencyType:(int)a3
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
    self->_emergencyType = a3;
  }
}

- (BOOL)hasEmergencyType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasEmergencyType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)emergencyTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E228B878[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEmergencyType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LocalEmergency")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NonLocalEmergency")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setFaceTimeType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFD;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 2;
    self->_faceTimeType = a3;
  }
}

- (BOOL)hasFaceTimeType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasFaceTimeType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)faceTimeTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E228B890[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFaceTimeType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Undefined")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FaceTimeHandle")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NonFaceTimeHandle")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setLabel:(id)a3
{
  NSString *v4;
  NSString *label;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  label = self->_label;
  self->_label = v4;

}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (void)setSuggested:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_suggested = a3;
}

- (BOOL)hasSuggested
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasSuggested:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)setType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xF7;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 8;
    self->_type = a3;
  }
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E228B8A8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EmailAddress")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PhoneNumber")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Website")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("InstantMessage")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setValue:(id)a3
{
  NSString *v4;
  NSString *value;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  value = self->_value;
  self->_value = v4;

}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBContactHandleReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_INPBContactHandle hasEmergencyType](self, "hasEmergencyType"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBContactHandle hasFaceTimeType](self, "hasFaceTimeType"))
    PBDataWriterWriteInt32Field();
  -[_INPBContactHandle label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if (-[_INPBContactHandle hasSuggested](self, "hasSuggested"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBContactHandle hasType](self, "hasType"))
    PBDataWriterWriteInt32Field();
  -[_INPBContactHandle value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }

}

- (_INPBContactHandle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBContactHandle *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBContactHandle *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBContactHandle *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBContactHandle initWithData:](self, "initWithData:", v6);

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
  -[_INPBContactHandle data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBContactHandle *v5;
  void *v6;
  void *v7;

  v5 = -[_INPBContactHandle init](+[_INPBContactHandle allocWithZone:](_INPBContactHandle, "allocWithZone:"), "init");
  if (-[_INPBContactHandle hasEmergencyType](self, "hasEmergencyType"))
    -[_INPBContactHandle setEmergencyType:](v5, "setEmergencyType:", -[_INPBContactHandle emergencyType](self, "emergencyType"));
  if (-[_INPBContactHandle hasFaceTimeType](self, "hasFaceTimeType"))
    -[_INPBContactHandle setFaceTimeType:](v5, "setFaceTimeType:", -[_INPBContactHandle faceTimeType](self, "faceTimeType"));
  v6 = (void *)-[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
  -[_INPBContactHandle setLabel:](v5, "setLabel:", v6);

  if (-[_INPBContactHandle hasSuggested](self, "hasSuggested"))
    -[_INPBContactHandle setSuggested:](v5, "setSuggested:", -[_INPBContactHandle suggested](self, "suggested"));
  if (-[_INPBContactHandle hasType](self, "hasType"))
    -[_INPBContactHandle setType:](v5, "setType:", -[_INPBContactHandle type](self, "type"));
  v7 = (void *)-[NSString copyWithZone:](self->_value, "copyWithZone:", a3);
  -[_INPBContactHandle setValue:](v5, "setValue:", v7);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int emergencyType;
  int v7;
  int faceTimeType;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  int suggested;
  int v18;
  int type;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  BOOL v25;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  v5 = -[_INPBContactHandle hasEmergencyType](self, "hasEmergencyType");
  if (v5 != objc_msgSend(v4, "hasEmergencyType"))
    goto LABEL_28;
  if (-[_INPBContactHandle hasEmergencyType](self, "hasEmergencyType"))
  {
    if (objc_msgSend(v4, "hasEmergencyType"))
    {
      emergencyType = self->_emergencyType;
      if (emergencyType != objc_msgSend(v4, "emergencyType"))
        goto LABEL_28;
    }
  }
  v7 = -[_INPBContactHandle hasFaceTimeType](self, "hasFaceTimeType");
  if (v7 != objc_msgSend(v4, "hasFaceTimeType"))
    goto LABEL_28;
  if (-[_INPBContactHandle hasFaceTimeType](self, "hasFaceTimeType"))
  {
    if (objc_msgSend(v4, "hasFaceTimeType"))
    {
      faceTimeType = self->_faceTimeType;
      if (faceTimeType != objc_msgSend(v4, "faceTimeType"))
        goto LABEL_28;
    }
  }
  -[_INPBContactHandle label](self, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 == 0) == (v10 != 0))
    goto LABEL_27;
  -[_INPBContactHandle label](self, "label");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[_INPBContactHandle label](self, "label");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "label");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqual:", v14);

    if (!v15)
      goto LABEL_28;
  }
  else
  {

  }
  v16 = -[_INPBContactHandle hasSuggested](self, "hasSuggested");
  if (v16 != objc_msgSend(v4, "hasSuggested"))
    goto LABEL_28;
  if (-[_INPBContactHandle hasSuggested](self, "hasSuggested"))
  {
    if (objc_msgSend(v4, "hasSuggested"))
    {
      suggested = self->_suggested;
      if (suggested != objc_msgSend(v4, "suggested"))
        goto LABEL_28;
    }
  }
  v18 = -[_INPBContactHandle hasType](self, "hasType");
  if (v18 != objc_msgSend(v4, "hasType"))
    goto LABEL_28;
  if (-[_INPBContactHandle hasType](self, "hasType"))
  {
    if (objc_msgSend(v4, "hasType"))
    {
      type = self->_type;
      if (type != objc_msgSend(v4, "type"))
        goto LABEL_28;
    }
  }
  -[_INPBContactHandle value](self, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 == 0) != (v10 != 0))
  {
    -[_INPBContactHandle value](self, "value");
    v20 = objc_claimAutoreleasedReturnValue();
    if (!v20)
    {

LABEL_31:
      v25 = 1;
      goto LABEL_29;
    }
    v21 = (void *)v20;
    -[_INPBContactHandle value](self, "value");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqual:", v23);

    if ((v24 & 1) != 0)
      goto LABEL_31;
  }
  else
  {
LABEL_27:

  }
LABEL_28:
  v25 = 0;
LABEL_29:

  return v25;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;

  if (-[_INPBContactHandle hasEmergencyType](self, "hasEmergencyType"))
    v3 = 2654435761 * self->_emergencyType;
  else
    v3 = 0;
  if (-[_INPBContactHandle hasFaceTimeType](self, "hasFaceTimeType"))
    v4 = 2654435761 * self->_faceTimeType;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_label, "hash");
  if (-[_INPBContactHandle hasSuggested](self, "hasSuggested"))
    v6 = 2654435761 * self->_suggested;
  else
    v6 = 0;
  if (-[_INPBContactHandle hasType](self, "hasType"))
    v7 = 2654435761 * self->_type;
  else
    v7 = 0;
  return v4 ^ v3 ^ v6 ^ v7 ^ v5 ^ -[NSString hash](self->_value, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBContactHandle hasEmergencyType](self, "hasEmergencyType"))
  {
    v4 = -[_INPBContactHandle emergencyType](self, "emergencyType");
    if (v4 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E228B878[v4];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("emergencyType"));

  }
  if (-[_INPBContactHandle hasFaceTimeType](self, "hasFaceTimeType"))
  {
    v6 = -[_INPBContactHandle faceTimeType](self, "faceTimeType");
    if (v6 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E228B890[v6];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("faceTimeType"));

  }
  if (self->_label)
  {
    -[_INPBContactHandle label](self, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("label"));

  }
  if (-[_INPBContactHandle hasSuggested](self, "hasSuggested"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBContactHandle suggested](self, "suggested"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("suggested"));

  }
  if (-[_INPBContactHandle hasType](self, "hasType"))
  {
    v11 = -[_INPBContactHandle type](self, "type");
    if (v11 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v11);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E228B8A8[v11];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("type"));

  }
  if (self->_value)
  {
    -[_INPBContactHandle value](self, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("value"));

  }
  return v3;
}

- (int)emergencyType
{
  return self->_emergencyType;
}

- (int)faceTimeType
{
  return self->_faceTimeType;
}

- (NSString)label
{
  return self->_label;
}

- (BOOL)suggested
{
  return self->_suggested;
}

- (int)type
{
  return self->_type;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
