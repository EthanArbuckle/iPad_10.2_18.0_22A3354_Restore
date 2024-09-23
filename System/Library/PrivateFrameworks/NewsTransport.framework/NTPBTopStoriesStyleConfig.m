@implementation NTPBTopStoriesStyleConfig

- (BOOL)hasType
{
  return self->_type != 0;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (BOOL)hasForegroundColor
{
  return self->_foregroundColor != 0;
}

- (BOOL)hasBackgroundColor
{
  return self->_backgroundColor != 0;
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
  v8.super_class = (Class)NTPBTopStoriesStyleConfig;
  -[NTPBTopStoriesStyleConfig description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBTopStoriesStyleConfig dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *type;
  NSString *label;
  NSString *foregroundColor;
  NSString *backgroundColor;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  type = self->_type;
  if (type)
    objc_msgSend(v3, "setObject:forKey:", type, CFSTR("type"));
  label = self->_label;
  if (label)
    objc_msgSend(v4, "setObject:forKey:", label, CFSTR("label"));
  foregroundColor = self->_foregroundColor;
  if (foregroundColor)
    objc_msgSend(v4, "setObject:forKey:", foregroundColor, CFSTR("foreground_color"));
  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
    objc_msgSend(v4, "setObject:forKey:", backgroundColor, CFSTR("background_color"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTopStoriesStyleConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_type)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_label)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_foregroundColor)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_backgroundColor)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_type, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_foregroundColor, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v12 = -[NSString copyWithZone:](self->_backgroundColor, "copyWithZone:", a3);
  v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *type;
  NSString *label;
  NSString *foregroundColor;
  NSString *backgroundColor;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((type = self->_type, !((unint64_t)type | v4[4])) || -[NSString isEqual:](type, "isEqual:"))
    && ((label = self->_label, !((unint64_t)label | v4[3]))
     || -[NSString isEqual:](label, "isEqual:"))
    && ((foregroundColor = self->_foregroundColor, !((unint64_t)foregroundColor | v4[2]))
     || -[NSString isEqual:](foregroundColor, "isEqual:")))
  {
    backgroundColor = self->_backgroundColor;
    if ((unint64_t)backgroundColor | v4[1])
      v9 = -[NSString isEqual:](backgroundColor, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_type, "hash");
  v4 = -[NSString hash](self->_label, "hash") ^ v3;
  v5 = -[NSString hash](self->_foregroundColor, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_backgroundColor, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[4])
    -[NTPBTopStoriesStyleConfig setType:](self, "setType:");
  if (v4[3])
    -[NTPBTopStoriesStyleConfig setLabel:](self, "setLabel:");
  if (v4[2])
    -[NTPBTopStoriesStyleConfig setForegroundColor:](self, "setForegroundColor:");
  if (v4[1])
    -[NTPBTopStoriesStyleConfig setBackgroundColor:](self, "setBackgroundColor:");

}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSString)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundColor, a3);
}

- (NSString)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
