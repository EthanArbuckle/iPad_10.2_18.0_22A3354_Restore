@implementation _INPBEventParticipant

- (void)setIsEventOrganizer:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isEventOrganizer = a3;
}

- (BOOL)hasIsEventOrganizer
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsEventOrganizer:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setIsUser:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isUser = a3;
}

- (BOOL)hasIsUser
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsUser:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (BOOL)hasPerson
{
  return self->_person != 0;
}

- (void)setStatus:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFB;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 4;
    self->_status = a3;
  }
}

- (BOOL)hasStatus
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (id)statusAsString:(int)a3
{
  if ((a3 - 1) < 8)
    return off_1E228D458[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_STATUS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PENDING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCEPTED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DECLINED")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TENTATIVE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DELEGATED")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COMPLETED")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("IN_PROCESS")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBEventParticipantReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[_INPBEventParticipant hasIsEventOrganizer](self, "hasIsEventOrganizer"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBEventParticipant hasIsUser](self, "hasIsUser"))
    PBDataWriterWriteBOOLField();
  -[_INPBEventParticipant person](self, "person");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBEventParticipant person](self, "person");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBEventParticipant hasStatus](self, "hasStatus"))
    PBDataWriterWriteInt32Field();

}

- (_INPBEventParticipant)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBEventParticipant *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBEventParticipant *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBEventParticipant *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBEventParticipant initWithData:](self, "initWithData:", v6);

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
  -[_INPBEventParticipant data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBEventParticipant *v5;
  id v6;

  v5 = -[_INPBEventParticipant init](+[_INPBEventParticipant allocWithZone:](_INPBEventParticipant, "allocWithZone:"), "init");
  if (-[_INPBEventParticipant hasIsEventOrganizer](self, "hasIsEventOrganizer"))
    -[_INPBEventParticipant setIsEventOrganizer:](v5, "setIsEventOrganizer:", -[_INPBEventParticipant isEventOrganizer](self, "isEventOrganizer"));
  if (-[_INPBEventParticipant hasIsUser](self, "hasIsUser"))
    -[_INPBEventParticipant setIsUser:](v5, "setIsUser:", -[_INPBEventParticipant isUser](self, "isUser"));
  v6 = -[_INPBContact copyWithZone:](self->_person, "copyWithZone:", a3);
  -[_INPBEventParticipant setPerson:](v5, "setPerson:", v6);

  if (-[_INPBEventParticipant hasStatus](self, "hasStatus"))
    -[_INPBEventParticipant setStatus:](v5, "setStatus:", -[_INPBEventParticipant status](self, "status"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int isEventOrganizer;
  int v7;
  int isUser;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  BOOL v18;
  int status;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  v5 = -[_INPBEventParticipant hasIsEventOrganizer](self, "hasIsEventOrganizer");
  if (v5 != objc_msgSend(v4, "hasIsEventOrganizer"))
    goto LABEL_17;
  if (-[_INPBEventParticipant hasIsEventOrganizer](self, "hasIsEventOrganizer"))
  {
    if (objc_msgSend(v4, "hasIsEventOrganizer"))
    {
      isEventOrganizer = self->_isEventOrganizer;
      if (isEventOrganizer != objc_msgSend(v4, "isEventOrganizer"))
        goto LABEL_17;
    }
  }
  v7 = -[_INPBEventParticipant hasIsUser](self, "hasIsUser");
  if (v7 != objc_msgSend(v4, "hasIsUser"))
    goto LABEL_17;
  if (-[_INPBEventParticipant hasIsUser](self, "hasIsUser"))
  {
    if (objc_msgSend(v4, "hasIsUser"))
    {
      isUser = self->_isUser;
      if (isUser != objc_msgSend(v4, "isUser"))
        goto LABEL_17;
    }
  }
  -[_INPBEventParticipant person](self, "person");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "person");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((v9 == 0) != (v10 != 0))
  {
    -[_INPBEventParticipant person](self, "person");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      -[_INPBEventParticipant person](self, "person");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "person");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqual:", v15);

      if (!v16)
        goto LABEL_17;
    }
    else
    {

    }
    v17 = -[_INPBEventParticipant hasStatus](self, "hasStatus");
    if (v17 == objc_msgSend(v4, "hasStatus"))
    {
      if (!-[_INPBEventParticipant hasStatus](self, "hasStatus")
        || !objc_msgSend(v4, "hasStatus")
        || (status = self->_status, status == objc_msgSend(v4, "status")))
      {
        v18 = 1;
        goto LABEL_18;
      }
    }
  }
  else
  {

  }
LABEL_17:
  v18 = 0;
LABEL_18:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  if (-[_INPBEventParticipant hasIsEventOrganizer](self, "hasIsEventOrganizer"))
    v3 = 2654435761 * self->_isEventOrganizer;
  else
    v3 = 0;
  if (-[_INPBEventParticipant hasIsUser](self, "hasIsUser"))
    v4 = 2654435761 * self->_isUser;
  else
    v4 = 0;
  v5 = -[_INPBContact hash](self->_person, "hash");
  if (-[_INPBEventParticipant hasStatus](self, "hasStatus"))
    v6 = 2654435761 * self->_status;
  else
    v6 = 0;
  return v4 ^ v3 ^ v6 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBEventParticipant hasIsEventOrganizer](self, "hasIsEventOrganizer"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBEventParticipant isEventOrganizer](self, "isEventOrganizer"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("isEventOrganizer"));

  }
  if (-[_INPBEventParticipant hasIsUser](self, "hasIsUser"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBEventParticipant isUser](self, "isUser"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isUser"));

  }
  -[_INPBEventParticipant person](self, "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("person"));

  if (-[_INPBEventParticipant hasStatus](self, "hasStatus"))
  {
    v8 = -[_INPBEventParticipant status](self, "status");
    if ((v8 - 1) >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E228D458[(v8 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("status"));

  }
  return v3;
}

- (BOOL)isEventOrganizer
{
  return self->_isEventOrganizer;
}

- (BOOL)isUser
{
  return self->_isUser;
}

- (_INPBContact)person
{
  return self->_person;
}

- (int)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
