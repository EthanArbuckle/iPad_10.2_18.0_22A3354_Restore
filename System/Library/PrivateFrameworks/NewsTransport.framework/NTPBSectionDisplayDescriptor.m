@implementation NTPBSectionDisplayDescriptor

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasNameColorLight
{
  return self->_nameColorLight != 0;
}

- (BOOL)hasBackgroundGradientColor
{
  return self->_backgroundGradientColor != 0;
}

- (BOOL)hasActionTitle
{
  return self->_actionTitle != 0;
}

- (BOOL)hasActionURLString
{
  return self->_actionURLString != 0;
}

- (BOOL)hasNameColorDark
{
  return self->_nameColorDark != 0;
}

- (BOOL)hasNameActionURLString
{
  return self->_nameActionURLString != 0;
}

- (BOOL)hasBackgroundColorLight
{
  return self->_backgroundColorLight != 0;
}

- (BOOL)hasBackgroundColorDark
{
  return self->_backgroundColorDark != 0;
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
  v8.super_class = (Class)NTPBSectionDisplayDescriptor;
  -[NTPBSectionDisplayDescriptor description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBSectionDisplayDescriptor dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *name;
  NSString *nameColorLight;
  NSString *backgroundGradientColor;
  NSString *actionTitle;
  NSString *actionURLString;
  NSString *nameColorDark;
  NSString *nameActionURLString;
  NSString *backgroundColorLight;
  NSString *backgroundColorDark;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  nameColorLight = self->_nameColorLight;
  if (nameColorLight)
    objc_msgSend(v4, "setObject:forKey:", nameColorLight, CFSTR("name_color_light"));
  backgroundGradientColor = self->_backgroundGradientColor;
  if (backgroundGradientColor)
    objc_msgSend(v4, "setObject:forKey:", backgroundGradientColor, CFSTR("background_gradient_color"));
  actionTitle = self->_actionTitle;
  if (actionTitle)
    objc_msgSend(v4, "setObject:forKey:", actionTitle, CFSTR("actionTitle"));
  actionURLString = self->_actionURLString;
  if (actionURLString)
    objc_msgSend(v4, "setObject:forKey:", actionURLString, CFSTR("action_URL_string"));
  nameColorDark = self->_nameColorDark;
  if (nameColorDark)
    objc_msgSend(v4, "setObject:forKey:", nameColorDark, CFSTR("name_color_dark"));
  nameActionURLString = self->_nameActionURLString;
  if (nameActionURLString)
    objc_msgSend(v4, "setObject:forKey:", nameActionURLString, CFSTR("name_action_URL_string"));
  backgroundColorLight = self->_backgroundColorLight;
  if (backgroundColorLight)
    objc_msgSend(v4, "setObject:forKey:", backgroundColorLight, CFSTR("background_color_light"));
  backgroundColorDark = self->_backgroundColorDark;
  if (backgroundColorDark)
    objc_msgSend(v4, "setObject:forKey:", backgroundColorDark, CFSTR("background_color_dark"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBSectionDisplayDescriptorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_nameColorLight)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_backgroundGradientColor)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_actionTitle)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_actionURLString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_nameColorDark)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_nameActionURLString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_backgroundColorLight)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_backgroundColorDark)
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
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = (void *)v5[6];
  v5[6] = v6;

  v8 = -[NSString copyWithZone:](self->_nameColorLight, "copyWithZone:", a3);
  v9 = (void *)v5[9];
  v5[9] = v8;

  v10 = -[NSString copyWithZone:](self->_backgroundGradientColor, "copyWithZone:", a3);
  v11 = (void *)v5[5];
  v5[5] = v10;

  v12 = -[NSString copyWithZone:](self->_actionTitle, "copyWithZone:", a3);
  v13 = (void *)v5[1];
  v5[1] = v12;

  v14 = -[NSString copyWithZone:](self->_actionURLString, "copyWithZone:", a3);
  v15 = (void *)v5[2];
  v5[2] = v14;

  v16 = -[NSString copyWithZone:](self->_nameColorDark, "copyWithZone:", a3);
  v17 = (void *)v5[8];
  v5[8] = v16;

  v18 = -[NSString copyWithZone:](self->_nameActionURLString, "copyWithZone:", a3);
  v19 = (void *)v5[7];
  v5[7] = v18;

  v20 = -[NSString copyWithZone:](self->_backgroundColorLight, "copyWithZone:", a3);
  v21 = (void *)v5[4];
  v5[4] = v20;

  v22 = -[NSString copyWithZone:](self->_backgroundColorDark, "copyWithZone:", a3);
  v23 = (void *)v5[3];
  v5[3] = v22;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *name;
  NSString *nameColorLight;
  NSString *backgroundGradientColor;
  NSString *actionTitle;
  NSString *actionURLString;
  NSString *nameColorDark;
  NSString *nameActionURLString;
  NSString *backgroundColorLight;
  NSString *backgroundColorDark;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  name = self->_name;
  if ((unint64_t)name | v4[6])
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_20;
  }
  if (((nameColorLight = self->_nameColorLight, !((unint64_t)nameColorLight | v4[9]))
     || -[NSString isEqual:](nameColorLight, "isEqual:"))
    && ((backgroundGradientColor = self->_backgroundGradientColor, !((unint64_t)backgroundGradientColor | v4[5]))
     || -[NSString isEqual:](backgroundGradientColor, "isEqual:"))
    && ((actionTitle = self->_actionTitle, !((unint64_t)actionTitle | v4[1]))
     || -[NSString isEqual:](actionTitle, "isEqual:"))
    && ((actionURLString = self->_actionURLString, !((unint64_t)actionURLString | v4[2]))
     || -[NSString isEqual:](actionURLString, "isEqual:"))
    && ((nameColorDark = self->_nameColorDark, !((unint64_t)nameColorDark | v4[8]))
     || -[NSString isEqual:](nameColorDark, "isEqual:"))
    && ((nameActionURLString = self->_nameActionURLString, !((unint64_t)nameActionURLString | v4[7]))
     || -[NSString isEqual:](nameActionURLString, "isEqual:"))
    && ((backgroundColorLight = self->_backgroundColorLight, !((unint64_t)backgroundColorLight | v4[4]))
     || -[NSString isEqual:](backgroundColorLight, "isEqual:")))
  {
    backgroundColorDark = self->_backgroundColorDark;
    if ((unint64_t)backgroundColorDark | v4[3])
      v14 = -[NSString isEqual:](backgroundColorDark, "isEqual:");
    else
      v14 = 1;
  }
  else
  {
LABEL_20:
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_nameColorLight, "hash") ^ v3;
  v5 = -[NSString hash](self->_backgroundGradientColor, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_actionTitle, "hash");
  v7 = -[NSString hash](self->_actionURLString, "hash");
  v8 = v7 ^ -[NSString hash](self->_nameColorDark, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_nameActionURLString, "hash");
  v10 = -[NSString hash](self->_backgroundColorLight, "hash");
  return v9 ^ v10 ^ -[NSString hash](self->_backgroundColorDark, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[6])
    -[NTPBSectionDisplayDescriptor setName:](self, "setName:");
  if (v4[9])
    -[NTPBSectionDisplayDescriptor setNameColorLight:](self, "setNameColorLight:");
  if (v4[5])
    -[NTPBSectionDisplayDescriptor setBackgroundGradientColor:](self, "setBackgroundGradientColor:");
  if (v4[1])
    -[NTPBSectionDisplayDescriptor setActionTitle:](self, "setActionTitle:");
  if (v4[2])
    -[NTPBSectionDisplayDescriptor setActionURLString:](self, "setActionURLString:");
  if (v4[8])
    -[NTPBSectionDisplayDescriptor setNameColorDark:](self, "setNameColorDark:");
  if (v4[7])
    -[NTPBSectionDisplayDescriptor setNameActionURLString:](self, "setNameActionURLString:");
  if (v4[4])
    -[NTPBSectionDisplayDescriptor setBackgroundColorLight:](self, "setBackgroundColorLight:");
  if (v4[3])
    -[NTPBSectionDisplayDescriptor setBackgroundColorDark:](self, "setBackgroundColorDark:");

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)nameColorLight
{
  return self->_nameColorLight;
}

- (void)setNameColorLight:(id)a3
{
  objc_storeStrong((id *)&self->_nameColorLight, a3);
}

- (NSString)backgroundGradientColor
{
  return self->_backgroundGradientColor;
}

- (void)setBackgroundGradientColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundGradientColor, a3);
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (void)setActionTitle:(id)a3
{
  objc_storeStrong((id *)&self->_actionTitle, a3);
}

- (NSString)actionURLString
{
  return self->_actionURLString;
}

- (void)setActionURLString:(id)a3
{
  objc_storeStrong((id *)&self->_actionURLString, a3);
}

- (NSString)nameColorDark
{
  return self->_nameColorDark;
}

- (void)setNameColorDark:(id)a3
{
  objc_storeStrong((id *)&self->_nameColorDark, a3);
}

- (NSString)nameActionURLString
{
  return self->_nameActionURLString;
}

- (void)setNameActionURLString:(id)a3
{
  objc_storeStrong((id *)&self->_nameActionURLString, a3);
}

- (NSString)backgroundColorLight
{
  return self->_backgroundColorLight;
}

- (void)setBackgroundColorLight:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColorLight, a3);
}

- (NSString)backgroundColorDark
{
  return self->_backgroundColorDark;
}

- (void)setBackgroundColorDark:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColorDark, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameColorLight, 0);
  objc_storeStrong((id *)&self->_nameColorDark, 0);
  objc_storeStrong((id *)&self->_nameActionURLString, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_backgroundGradientColor, 0);
  objc_storeStrong((id *)&self->_backgroundColorLight, 0);
  objc_storeStrong((id *)&self->_backgroundColorDark, 0);
  objc_storeStrong((id *)&self->_actionURLString, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
}

@end
