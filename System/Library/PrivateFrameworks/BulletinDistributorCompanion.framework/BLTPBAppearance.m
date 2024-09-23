@implementation BLTPBAppearance

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasImage
{
  return self->_image != 0;
}

- (void)setDestructive:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_destructive = a3;
}

- (void)setHasDestructive:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDestructive
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)BLTPBAppearance;
  -[BLTPBAppearance description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBAppearance dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *title;
  BLTPBImage *image;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  image = self->_image;
  if (image)
  {
    -[BLTPBImage dictionaryRepresentation](image, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("image"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_destructive);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("destructive"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBAppearanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_image)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  v5 = v4;
  if (self->_title)
  {
    objc_msgSend(v4, "setTitle:");
    v4 = v5;
  }
  if (self->_image)
  {
    objc_msgSend(v5, "setImage:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[24] = self->_destructive;
    v4[28] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[BLTPBImage copyWithZone:](self->_image, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 24) = self->_destructive;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *title;
  BLTPBImage *image;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](title, "isEqual:"))
      goto LABEL_8;
  }
  image = self->_image;
  if ((unint64_t)image | *((_QWORD *)v4 + 1))
  {
    if (!-[BLTPBImage isEqual:](image, "isEqual:"))
      goto LABEL_8;
  }
  v7 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0)
    {
LABEL_8:
      v7 = 0;
      goto LABEL_9;
    }
    if (self->_destructive)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_8;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_8;
    }
    v7 = 1;
  }
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[BLTPBImage hash](self->_image, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_destructive;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BLTPBImage *image;
  uint64_t v6;
  BOOL *v7;

  v4 = (BOOL *)a3;
  v7 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[BLTPBAppearance setTitle:](self, "setTitle:");
    v4 = v7;
  }
  image = self->_image;
  v6 = *((_QWORD *)v4 + 1);
  if (image)
  {
    if (!v6)
      goto LABEL_9;
    -[BLTPBImage mergeFrom:](image, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[BLTPBAppearance setImage:](self, "setImage:");
  }
  v4 = v7;
LABEL_9:
  if (v4[28])
  {
    self->_destructive = v4[24];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (BLTPBImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (BOOL)destructive
{
  return self->_destructive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
