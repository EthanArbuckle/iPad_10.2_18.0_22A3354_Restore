@implementation _INPBMediaDestination

- (void)setMediaDestinationType:(int)a3
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
    self->_mediaDestinationType = a3;
  }
}

- (BOOL)hasMediaDestinationType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasMediaDestinationType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)mediaDestinationTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E2293330[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMediaDestinationType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_DESTINATION")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIBRARY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PLAYLIST")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setPlaylistName:(id)a3
{
  objc_storeStrong((id *)&self->_playlistName, a3);
}

- (BOOL)hasPlaylistName
{
  return self->_playlistName != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBMediaDestinationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_INPBMediaDestination hasMediaDestinationType](self, "hasMediaDestinationType"))
    PBDataWriterWriteInt32Field();
  -[_INPBMediaDestination playlistName](self, "playlistName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4)
  {
    -[_INPBMediaDestination playlistName](self, "playlistName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }

}

- (_INPBMediaDestination)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBMediaDestination *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBMediaDestination *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBMediaDestination *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBMediaDestination initWithData:](self, "initWithData:", v6);

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
  -[_INPBMediaDestination data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBMediaDestination *v5;
  id v6;

  v5 = -[_INPBMediaDestination init](+[_INPBMediaDestination allocWithZone:](_INPBMediaDestination, "allocWithZone:"), "init");
  if (-[_INPBMediaDestination hasMediaDestinationType](self, "hasMediaDestinationType"))
    -[_INPBMediaDestination setMediaDestinationType:](v5, "setMediaDestinationType:", -[_INPBMediaDestination mediaDestinationType](self, "mediaDestinationType"));
  v6 = -[_INPBString copyWithZone:](self->_playlistName, "copyWithZone:", a3);
  -[_INPBMediaDestination setPlaylistName:](v5, "setPlaylistName:", v6);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int mediaDestinationType;
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
    v5 = -[_INPBMediaDestination hasMediaDestinationType](self, "hasMediaDestinationType");
    if (v5 == objc_msgSend(v4, "hasMediaDestinationType"))
    {
      if (!-[_INPBMediaDestination hasMediaDestinationType](self, "hasMediaDestinationType")
        || !objc_msgSend(v4, "hasMediaDestinationType")
        || (mediaDestinationType = self->_mediaDestinationType,
            mediaDestinationType == objc_msgSend(v4, "mediaDestinationType")))
      {
        -[_INPBMediaDestination playlistName](self, "playlistName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "playlistName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if ((v7 == 0) != (v8 != 0))
        {
          -[_INPBMediaDestination playlistName](self, "playlistName");
          v10 = objc_claimAutoreleasedReturnValue();
          if (!v10)
          {

LABEL_14:
            v15 = 1;
            goto LABEL_12;
          }
          v11 = (void *)v10;
          -[_INPBMediaDestination playlistName](self, "playlistName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "playlistName");
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

  if (-[_INPBMediaDestination hasMediaDestinationType](self, "hasMediaDestinationType"))
    v3 = 2654435761 * self->_mediaDestinationType;
  else
    v3 = 0;
  return -[_INPBString hash](self->_playlistName, "hash") ^ v3;
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
  if (-[_INPBMediaDestination hasMediaDestinationType](self, "hasMediaDestinationType"))
  {
    v4 = -[_INPBMediaDestination mediaDestinationType](self, "mediaDestinationType");
    if (v4 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E2293330[v4];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("mediaDestinationType"));

  }
  -[_INPBMediaDestination playlistName](self, "playlistName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("playlistName"));

  return v3;
}

- (int)mediaDestinationType
{
  return self->_mediaDestinationType;
}

- (_INPBString)playlistName
{
  return self->_playlistName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playlistName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
