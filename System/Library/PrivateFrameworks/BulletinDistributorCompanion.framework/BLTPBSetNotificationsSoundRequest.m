@implementation BLTPBSetNotificationsSoundRequest

- (int)sound
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_sound;
  else
    return 0;
}

- (void)setSound:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sound = a3;
}

- (void)setHasSound:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSound
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)soundAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Off");
  if (a3 == 1)
  {
    v3 = CFSTR("On");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsSound:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Off")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("On"));

  return v4;
}

- (BOOL)hasSectionID
{
  return self->_sectionID != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)BLTPBSetNotificationsSoundRequest;
  -[BLTPBSetNotificationsSoundRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBSetNotificationsSoundRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  int sound;
  __CFString *v5;
  NSString *sectionID;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    sound = self->_sound;
    if (sound)
    {
      if (sound == 1)
      {
        v5 = CFSTR("On");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_sound);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = CFSTR("Off");
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sound"));

  }
  sectionID = self->_sectionID;
  if (sectionID)
    objc_msgSend(v3, "setObject:forKey:", sectionID, CFSTR("sectionID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBSetNotificationsSoundRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_sectionID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_sound;
    *((_BYTE *)v4 + 20) |= 1u;
  }
  if (self->_sectionID)
  {
    v5 = v4;
    objc_msgSend(v4, "setSectionID:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_sound;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_sectionID, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *sectionID;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_sound != *((_DWORD *)v4 + 4))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  sectionID = self->_sectionID;
  if ((unint64_t)sectionID | *((_QWORD *)v4 + 1))
    v6 = -[NSString isEqual:](sectionID, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_sound;
  else
    v2 = 0;
  return -[NSString hash](self->_sectionID, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[5] & 1) != 0)
  {
    self->_sound = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    v5 = v4;
    -[BLTPBSetNotificationsSoundRequest setSectionID:](self, "setSectionID:");
    v4 = v5;
  }

}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
  objc_storeStrong((id *)&self->_sectionID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionID, 0);
}

@end
