@implementation HKCodableColorRepresentation

- (BOOL)hasObjectTypeIdentifier
{
  return self->_objectTypeIdentifier != 0;
}

- (void)setDisplayCategoryIdentifier:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_displayCategoryIdentifier = a3;
}

- (void)setHasDisplayCategoryIdentifier:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDisplayCategoryIdentifier
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasSemanticColorName
{
  return self->_semanticColorName != 0;
}

- (BOOL)hasRgbConfiguration
{
  return self->_rgbConfiguration != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HKCodableColorRepresentation;
  -[HKCodableColorRepresentation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableColorRepresentation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *objectTypeIdentifier;
  void *v6;
  NSString *semanticColorName;
  HKCodableRGBConfiguration *rgbConfiguration;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  objectTypeIdentifier = self->_objectTypeIdentifier;
  if (objectTypeIdentifier)
    objc_msgSend(v3, "setObject:forKey:", objectTypeIdentifier, CFSTR("objectTypeIdentifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_displayCategoryIdentifier);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("displayCategoryIdentifier"));

  }
  semanticColorName = self->_semanticColorName;
  if (semanticColorName)
    objc_msgSend(v4, "setObject:forKey:", semanticColorName, CFSTR("semanticColorName"));
  rgbConfiguration = self->_rgbConfiguration;
  if (rgbConfiguration)
  {
    -[HKCodableRGBConfiguration dictionaryRepresentation](rgbConfiguration, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("rgbConfiguration"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableColorRepresentationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_objectTypeIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_semanticColorName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_rgbConfiguration)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_objectTypeIdentifier)
  {
    objc_msgSend(v4, "setObjectTypeIdentifier:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_displayCategoryIdentifier;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  if (self->_semanticColorName)
  {
    objc_msgSend(v5, "setSemanticColorName:");
    v4 = v5;
  }
  if (self->_rgbConfiguration)
  {
    objc_msgSend(v5, "setRgbConfiguration:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_objectTypeIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_displayCategoryIdentifier;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_semanticColorName, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[HKCodableRGBConfiguration copyWithZone:](self->_rgbConfiguration, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *objectTypeIdentifier;
  NSString *semanticColorName;
  HKCodableRGBConfiguration *rgbConfiguration;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  objectTypeIdentifier = self->_objectTypeIdentifier;
  if ((unint64_t)objectTypeIdentifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](objectTypeIdentifier, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_displayCategoryIdentifier != *((_QWORD *)v4 + 1))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  semanticColorName = self->_semanticColorName;
  if ((unint64_t)semanticColorName | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](semanticColorName, "isEqual:"))
  {
    goto LABEL_13;
  }
  rgbConfiguration = self->_rgbConfiguration;
  if ((unint64_t)rgbConfiguration | *((_QWORD *)v4 + 3))
    v8 = -[HKCodableRGBConfiguration isEqual:](rgbConfiguration, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_objectTypeIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_displayCategoryIdentifier;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[NSString hash](self->_semanticColorName, "hash");
  return v5 ^ v6 ^ -[HKCodableRGBConfiguration hash](self->_rgbConfiguration, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HKCodableRGBConfiguration *rgbConfiguration;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[HKCodableColorRepresentation setObjectTypeIdentifier:](self, "setObjectTypeIdentifier:");
    v4 = v7;
  }
  if ((v4[5] & 1) != 0)
  {
    self->_displayCategoryIdentifier = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (v4[4])
  {
    -[HKCodableColorRepresentation setSemanticColorName:](self, "setSemanticColorName:");
    v4 = v7;
  }
  rgbConfiguration = self->_rgbConfiguration;
  v6 = v4[3];
  if (rgbConfiguration)
  {
    if (v6)
    {
      -[HKCodableRGBConfiguration mergeFrom:](rgbConfiguration, "mergeFrom:");
LABEL_12:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[HKCodableColorRepresentation setRgbConfiguration:](self, "setRgbConfiguration:");
    goto LABEL_12;
  }

}

- (NSString)objectTypeIdentifier
{
  return self->_objectTypeIdentifier;
}

- (void)setObjectTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_objectTypeIdentifier, a3);
}

- (int64_t)displayCategoryIdentifier
{
  return self->_displayCategoryIdentifier;
}

- (NSString)semanticColorName
{
  return self->_semanticColorName;
}

- (void)setSemanticColorName:(id)a3
{
  objc_storeStrong((id *)&self->_semanticColorName, a3);
}

- (HKCodableRGBConfiguration)rgbConfiguration
{
  return self->_rgbConfiguration;
}

- (void)setRgbConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_rgbConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semanticColorName, 0);
  objc_storeStrong((id *)&self->_rgbConfiguration, 0);
  objc_storeStrong((id *)&self->_objectTypeIdentifier, 0);
}

@end
