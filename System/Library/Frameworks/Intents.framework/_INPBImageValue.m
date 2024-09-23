@implementation _INPBImageValue

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBImageValue *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = -[_INPBImageValue init](+[_INPBImageValue allocWithZone:](_INPBImageValue, "allocWithZone:"), "init");
  v6 = (void *)-[NSData copyWithZone:](self->_data, "copyWithZone:", a3);
  -[_INPBImageValue setData:](v5, "setData:", v6);

  if (-[_INPBImageValue hasHeight](self, "hasHeight"))
  {
    -[_INPBImageValue height](self, "height");
    -[_INPBImageValue setHeight:](v5, "setHeight:");
  }
  v7 = (void *)-[NSString copyWithZone:](self->_proxyServiceIdentifier, "copyWithZone:", a3);
  -[_INPBImageValue setProxyServiceIdentifier:](v5, "setProxyServiceIdentifier:", v7);

  if (-[_INPBImageValue hasRenderingMode](self, "hasRenderingMode"))
    -[_INPBImageValue setRenderingMode:](v5, "setRenderingMode:", -[_INPBImageValue renderingMode](self, "renderingMode"));
  if (-[_INPBImageValue hasType](self, "hasType"))
    -[_INPBImageValue setType:](v5, "setType:", -[_INPBImageValue type](self, "type"));
  v8 = (void *)-[NSString copyWithZone:](self->_uri, "copyWithZone:", a3);
  -[_INPBImageValue setUri:](v5, "setUri:", v8);

  v9 = -[_INPBValueMetadata copyWithZone:](self->_valueMetadata, "copyWithZone:", a3);
  -[_INPBImageValue setValueMetadata:](v5, "setValueMetadata:", v9);

  if (-[_INPBImageValue hasWidth](self, "hasWidth"))
  {
    -[_INPBImageValue width](self, "width");
    -[_INPBImageValue setWidth:](v5, "setWidth:");
  }
  return v5;
}

- (double)width
{
  return self->_width;
}

- (int)type
{
  return self->_type;
}

- (int)renderingMode
{
  return self->_renderingMode;
}

- (double)height
{
  return self->_height;
}

- (NSString)uri
{
  return self->_uri;
}

- (void)setWidth:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_width = a3;
}

- (void)setUri:(id)a3
{
  NSString *v4;
  NSString *uri;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  uri = self->_uri;
  self->_uri = v4;

}

- (void)setType:(int)a3
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
    self->_type = a3;
  }
}

- (void)setRenderingMode:(int)a3
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
    self->_renderingMode = a3;
  }
}

- (void)setHeight:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_height = a3;
}

- (BOOL)hasWidth
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasRenderingMode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasHeight
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setValueMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_valueMetadata, a3);
}

- (void)setProxyServiceIdentifier:(id)a3
{
  NSString *v4;
  NSString *proxyServiceIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  proxyServiceIdentifier = self->_proxyServiceIdentifier;
  self->_proxyServiceIdentifier = v4;

}

- (void)setData:(id)a3
{
  NSData *v4;
  NSData *data;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  data = self->_data;
  self->_data = v4;

}

- (unint64_t)hash
{
  uint64_t v3;
  double height;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  unint64_t v13;
  double width;
  double v15;
  long double v16;
  double v17;
  unint64_t v18;

  v3 = -[NSData hash](self->_data, "hash");
  if (-[_INPBImageValue hasHeight](self, "hasHeight"))
  {
    height = self->_height;
    v5 = -height;
    if (height >= 0.0)
      v5 = self->_height;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v8 += (unint64_t)v7;
    }
    else
    {
      v8 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v8 = 0;
  }
  v9 = -[NSString hash](self->_proxyServiceIdentifier, "hash");
  if (-[_INPBImageValue hasRenderingMode](self, "hasRenderingMode"))
    v10 = 2654435761 * self->_renderingMode;
  else
    v10 = 0;
  if (-[_INPBImageValue hasType](self, "hasType"))
    v11 = 2654435761 * self->_type;
  else
    v11 = 0;
  v12 = -[NSString hash](self->_uri, "hash");
  v13 = -[_INPBValueMetadata hash](self->_valueMetadata, "hash");
  if (-[_INPBImageValue hasWidth](self, "hasWidth"))
  {
    width = self->_width;
    v15 = -width;
    if (width >= 0.0)
      v15 = self->_width;
    v16 = floor(v15 + 0.5);
    v17 = (v15 - v16) * 1.84467441e19;
    v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0)
        v18 += (unint64_t)v17;
    }
    else
    {
      v18 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    v18 = 0;
  }
  return v8 ^ v3 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_uri, 0);
  objc_storeStrong((id *)&self->_proxyServiceIdentifier, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (BOOL)hasData
{
  return self->_data != 0;
}

- (void)setHasHeight:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasProxyServiceIdentifier
{
  return self->_proxyServiceIdentifier != 0;
}

- (void)setHasRenderingMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)renderingModeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E22903C0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRenderingMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Automatic")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AlwaysOriginal")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AlwaysTemplate")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E22903D8[a3];
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
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Data")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("URL")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Bundle")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Proxy")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasUri
{
  return self->_uri != 0;
}

- (BOOL)hasValueMetadata
{
  return self->_valueMetadata != 0;
}

- (void)setHasWidth:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBImageValueReadFrom(self, (uint64_t)a3);
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
  -[_INPBImageValue data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteDataField();
  if (-[_INPBImageValue hasHeight](self, "hasHeight"))
    PBDataWriterWriteDoubleField();
  -[_INPBImageValue proxyServiceIdentifier](self, "proxyServiceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  if (-[_INPBImageValue hasRenderingMode](self, "hasRenderingMode"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBImageValue hasType](self, "hasType"))
    PBDataWriterWriteInt32Field();
  -[_INPBImageValue uri](self, "uri");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[_INPBImageValue valueMetadata](self, "valueMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBImageValue valueMetadata](self, "valueMetadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBImageValue hasWidth](self, "hasWidth"))
    PBDataWriterWriteDoubleField();

}

- (_INPBImageValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBImageValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBImageValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBImageValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBImageValue initWithData:](self, "initWithData:", v6);

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
  -[_INPBImageValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

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
  int v12;
  double height;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  int renderingMode;
  int v22;
  int type;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  BOOL v34;
  int v36;
  double width;
  double v38;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  -[_INPBImageValue data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[_INPBImageValue data](self, "data");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBImageValue data](self, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_34;
  }
  else
  {

  }
  v12 = -[_INPBImageValue hasHeight](self, "hasHeight");
  if (v12 != objc_msgSend(v4, "hasHeight"))
    goto LABEL_34;
  if (-[_INPBImageValue hasHeight](self, "hasHeight"))
  {
    if (objc_msgSend(v4, "hasHeight"))
    {
      height = self->_height;
      objc_msgSend(v4, "height");
      if (height != v14)
        goto LABEL_34;
    }
  }
  -[_INPBImageValue proxyServiceIdentifier](self, "proxyServiceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proxyServiceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[_INPBImageValue proxyServiceIdentifier](self, "proxyServiceIdentifier");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[_INPBImageValue proxyServiceIdentifier](self, "proxyServiceIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "proxyServiceIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqual:", v18);

    if (!v19)
      goto LABEL_34;
  }
  else
  {

  }
  v20 = -[_INPBImageValue hasRenderingMode](self, "hasRenderingMode");
  if (v20 != objc_msgSend(v4, "hasRenderingMode"))
    goto LABEL_34;
  if (-[_INPBImageValue hasRenderingMode](self, "hasRenderingMode"))
  {
    if (objc_msgSend(v4, "hasRenderingMode"))
    {
      renderingMode = self->_renderingMode;
      if (renderingMode != objc_msgSend(v4, "renderingMode"))
        goto LABEL_34;
    }
  }
  v22 = -[_INPBImageValue hasType](self, "hasType");
  if (v22 != objc_msgSend(v4, "hasType"))
    goto LABEL_34;
  if (-[_INPBImageValue hasType](self, "hasType"))
  {
    if (objc_msgSend(v4, "hasType"))
    {
      type = self->_type;
      if (type != objc_msgSend(v4, "type"))
        goto LABEL_34;
    }
  }
  -[_INPBImageValue uri](self, "uri");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uri");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_33;
  -[_INPBImageValue uri](self, "uri");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[_INPBImageValue uri](self, "uri");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uri");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_34;
  }
  else
  {

  }
  -[_INPBImageValue valueMetadata](self, "valueMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_33:

    goto LABEL_34;
  }
  -[_INPBImageValue valueMetadata](self, "valueMetadata");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    -[_INPBImageValue valueMetadata](self, "valueMetadata");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueMetadata");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if (!v33)
      goto LABEL_34;
  }
  else
  {

  }
  v36 = -[_INPBImageValue hasWidth](self, "hasWidth");
  if (v36 == objc_msgSend(v4, "hasWidth"))
  {
    if (!-[_INPBImageValue hasWidth](self, "hasWidth")
      || !objc_msgSend(v4, "hasWidth")
      || (width = self->_width, objc_msgSend(v4, "width"), width == v38))
    {
      v34 = 1;
      goto LABEL_35;
    }
  }
LABEL_34:
  v34 = 0;
LABEL_35:

  return v34;
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
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_data)
  {
    -[_INPBImageValue data](self, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("data"));

  }
  if (-[_INPBImageValue hasHeight](self, "hasHeight"))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[_INPBImageValue height](self, "height");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("height"));

  }
  if (self->_proxyServiceIdentifier)
  {
    -[_INPBImageValue proxyServiceIdentifier](self, "proxyServiceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("proxyServiceIdentifier"));

  }
  if (-[_INPBImageValue hasRenderingMode](self, "hasRenderingMode"))
  {
    v10 = -[_INPBImageValue renderingMode](self, "renderingMode");
    if (v10 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E22903C0[v10];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("renderingMode"));

  }
  if (-[_INPBImageValue hasType](self, "hasType"))
  {
    v12 = -[_INPBImageValue type](self, "type");
    if (v12 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E22903D8[v12];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("type"));

  }
  if (self->_uri)
  {
    -[_INPBImageValue uri](self, "uri");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("uri"));

  }
  -[_INPBImageValue valueMetadata](self, "valueMetadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionaryRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("valueMetadata"));

  if (-[_INPBImageValue hasWidth](self, "hasWidth"))
  {
    v18 = (void *)MEMORY[0x1E0CB37E8];
    -[_INPBImageValue width](self, "width");
    objc_msgSend(v18, "numberWithDouble:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("width"));

  }
  return v3;
}

- (NSData)data
{
  return self->_data;
}

- (NSString)proxyServiceIdentifier
{
  return self->_proxyServiceIdentifier;
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
