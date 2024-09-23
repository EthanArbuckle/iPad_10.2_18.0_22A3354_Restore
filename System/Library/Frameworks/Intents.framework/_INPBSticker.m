@implementation _INPBSticker

- (void)setAppBundleID:(id)a3
{
  NSString *v4;
  NSString *appBundleID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  appBundleID = self->_appBundleID;
  self->_appBundleID = v4;

}

- (BOOL)hasAppBundleID
{
  return self->_appBundleID != 0;
}

- (void)setAvatarDescriptor:(id)a3
{
  NSString *v4;
  NSString *avatarDescriptor;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  avatarDescriptor = self->_avatarDescriptor;
  self->_avatarDescriptor = v4;

}

- (BOOL)hasAvatarDescriptor
{
  return self->_avatarDescriptor != 0;
}

- (void)setEmoji:(id)a3
{
  NSString *v4;
  NSString *emoji;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  emoji = self->_emoji;
  self->_emoji = v4;

}

- (BOOL)hasEmoji
{
  return self->_emoji != 0;
}

- (void)setStickerDescription:(id)a3
{
  NSString *v4;
  NSString *stickerDescription;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  stickerDescription = self->_stickerDescription;
  self->_stickerDescription = v4;

}

- (BOOL)hasStickerDescription
{
  return self->_stickerDescription != 0;
}

- (void)setType:(int)a3
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
    self->_type = a3;
  }
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 7)
    return off_1E22954C8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMOJI")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MEMOJI")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_BASED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GENERATED")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GENERIC")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CUSTOM")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBStickerReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_INPBSticker appBundleID](self, "appBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBSticker avatarDescriptor](self, "avatarDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[_INPBSticker emoji](self, "emoji");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[_INPBSticker stickerDescription](self, "stickerDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  if (-[_INPBSticker hasType](self, "hasType"))
    PBDataWriterWriteInt32Field();

}

- (_INPBSticker)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSticker *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSticker *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSticker *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSticker initWithData:](self, "initWithData:", v6);

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
  -[_INPBSticker data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSticker *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = -[_INPBSticker init](+[_INPBSticker allocWithZone:](_INPBSticker, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_appBundleID, "copyWithZone:", a3);
  -[_INPBSticker setAppBundleID:](v5, "setAppBundleID:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_avatarDescriptor, "copyWithZone:", a3);
  -[_INPBSticker setAvatarDescriptor:](v5, "setAvatarDescriptor:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_emoji, "copyWithZone:", a3);
  -[_INPBSticker setEmoji:](v5, "setEmoji:", v8);

  v9 = (void *)-[NSString copyWithZone:](self->_stickerDescription, "copyWithZone:", a3);
  -[_INPBSticker setStickerDescription:](v5, "setStickerDescription:", v9);

  if (-[_INPBSticker hasType](self, "hasType"))
    -[_INPBSticker setType:](v5, "setType:", -[_INPBSticker type](self, "type"));
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
  BOOL v27;
  int v29;
  int type;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[_INPBSticker appBundleID](self, "appBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBSticker appBundleID](self, "appBundleID");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBSticker appBundleID](self, "appBundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appBundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBSticker avatarDescriptor](self, "avatarDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avatarDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBSticker avatarDescriptor](self, "avatarDescriptor");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBSticker avatarDescriptor](self, "avatarDescriptor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "avatarDescriptor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBSticker emoji](self, "emoji");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emoji");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBSticker emoji](self, "emoji");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBSticker emoji](self, "emoji");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "emoji");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBSticker stickerDescription](self, "stickerDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stickerDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_21:

    goto LABEL_22;
  }
  -[_INPBSticker stickerDescription](self, "stickerDescription");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBSticker stickerDescription](self, "stickerDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stickerDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_22;
  }
  else
  {

  }
  v29 = -[_INPBSticker hasType](self, "hasType");
  if (v29 == objc_msgSend(v4, "hasType"))
  {
    if (!-[_INPBSticker hasType](self, "hasType")
      || !objc_msgSend(v4, "hasType")
      || (type = self->_type, type == objc_msgSend(v4, "type")))
    {
      v27 = 1;
      goto LABEL_23;
    }
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
  NSUInteger v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_appBundleID, "hash");
  v4 = -[NSString hash](self->_avatarDescriptor, "hash");
  v5 = -[NSString hash](self->_emoji, "hash");
  v6 = -[NSString hash](self->_stickerDescription, "hash");
  if (-[_INPBSticker hasType](self, "hasType"))
    v7 = 2654435761 * self->_type;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_appBundleID)
  {
    -[_INPBSticker appBundleID](self, "appBundleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appBundleID"));

  }
  if (self->_avatarDescriptor)
  {
    -[_INPBSticker avatarDescriptor](self, "avatarDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("avatarDescriptor"));

  }
  if (self->_emoji)
  {
    -[_INPBSticker emoji](self, "emoji");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("emoji"));

  }
  if (self->_stickerDescription)
  {
    -[_INPBSticker stickerDescription](self, "stickerDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("stickerDescription"));

  }
  if (-[_INPBSticker hasType](self, "hasType"))
  {
    v12 = -[_INPBSticker type](self, "type");
    if (v12 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E22954C8[v12];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("type"));

  }
  return v3;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (NSString)avatarDescriptor
{
  return self->_avatarDescriptor;
}

- (NSString)emoji
{
  return self->_emoji;
}

- (NSString)stickerDescription
{
  return self->_stickerDescription;
}

- (int)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerDescription, 0);
  objc_storeStrong((id *)&self->_emoji, 0);
  objc_storeStrong((id *)&self->_avatarDescriptor, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
