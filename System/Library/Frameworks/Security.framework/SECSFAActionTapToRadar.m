@implementation SECSFAActionTapToRadar

- (BOOL)hasAlert
{
  return self->_alert != 0;
}

- (BOOL)hasRadarDescription
{
  return self->_radarDescription != 0;
}

- (BOOL)hasComponentName
{
  return self->_componentName != 0;
}

- (BOOL)hasComponentVersion
{
  return self->_componentVersion != 0;
}

- (BOOL)hasComponentID
{
  return self->_componentID != 0;
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
  v8.super_class = (Class)SECSFAActionTapToRadar;
  -[SECSFAActionTapToRadar description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SECSFAActionTapToRadar dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *alert;
  NSString *radarDescription;
  NSString *componentName;
  NSString *componentVersion;
  NSString *componentID;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  alert = self->_alert;
  if (alert)
    objc_msgSend(v3, "setObject:forKey:", alert, CFSTR("alert"));
  radarDescription = self->_radarDescription;
  if (radarDescription)
    objc_msgSend(v4, "setObject:forKey:", radarDescription, CFSTR("radarDescription"));
  componentName = self->_componentName;
  if (componentName)
    objc_msgSend(v4, "setObject:forKey:", componentName, CFSTR("componentName"));
  componentVersion = self->_componentVersion;
  if (componentVersion)
    objc_msgSend(v4, "setObject:forKey:", componentVersion, CFSTR("componentVersion"));
  componentID = self->_componentID;
  if (componentID)
    objc_msgSend(v4, "setObject:forKey:", componentID, CFSTR("componentID"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SECSFAActionTapToRadarReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_alert)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_radarDescription)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_componentName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_componentVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_componentID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_alert)
  {
    objc_msgSend(v4, "setAlert:");
    v4 = v5;
  }
  if (self->_radarDescription)
  {
    objc_msgSend(v5, "setRadarDescription:");
    v4 = v5;
  }
  if (self->_componentName)
  {
    objc_msgSend(v5, "setComponentName:");
    v4 = v5;
  }
  if (self->_componentVersion)
  {
    objc_msgSend(v5, "setComponentVersion:");
    v4 = v5;
  }
  if (self->_componentID)
  {
    objc_msgSend(v5, "setComponentID:");
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_alert, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_radarDescription, "copyWithZone:", a3);
  v9 = (void *)v5[5];
  v5[5] = v8;

  v10 = -[NSString copyWithZone:](self->_componentName, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSString copyWithZone:](self->_componentVersion, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[NSString copyWithZone:](self->_componentID, "copyWithZone:", a3);
  v15 = (void *)v5[2];
  v5[2] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *alert;
  NSString *radarDescription;
  NSString *componentName;
  NSString *componentVersion;
  NSString *componentID;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((alert = self->_alert, !((unint64_t)alert | v4[1]))
     || -[NSString isEqual:](alert, "isEqual:"))
    && ((radarDescription = self->_radarDescription, !((unint64_t)radarDescription | v4[5]))
     || -[NSString isEqual:](radarDescription, "isEqual:"))
    && ((componentName = self->_componentName, !((unint64_t)componentName | v4[3]))
     || -[NSString isEqual:](componentName, "isEqual:"))
    && ((componentVersion = self->_componentVersion, !((unint64_t)componentVersion | v4[4]))
     || -[NSString isEqual:](componentVersion, "isEqual:")))
  {
    componentID = self->_componentID;
    if ((unint64_t)componentID | v4[2])
      v10 = -[NSString isEqual:](componentID, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_alert, "hash");
  v4 = -[NSString hash](self->_radarDescription, "hash") ^ v3;
  v5 = -[NSString hash](self->_componentName, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_componentVersion, "hash");
  return v6 ^ -[NSString hash](self->_componentID, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[1])
    -[SECSFAActionTapToRadar setAlert:](self, "setAlert:");
  if (v4[5])
    -[SECSFAActionTapToRadar setRadarDescription:](self, "setRadarDescription:");
  if (v4[3])
    -[SECSFAActionTapToRadar setComponentName:](self, "setComponentName:");
  if (v4[4])
    -[SECSFAActionTapToRadar setComponentVersion:](self, "setComponentVersion:");
  if (v4[2])
    -[SECSFAActionTapToRadar setComponentID:](self, "setComponentID:");

}

- (NSString)alert
{
  return self->_alert;
}

- (void)setAlert:(id)a3
{
  objc_storeStrong((id *)&self->_alert, a3);
}

- (NSString)radarDescription
{
  return self->_radarDescription;
}

- (void)setRadarDescription:(id)a3
{
  objc_storeStrong((id *)&self->_radarDescription, a3);
}

- (NSString)componentName
{
  return self->_componentName;
}

- (void)setComponentName:(id)a3
{
  objc_storeStrong((id *)&self->_componentName, a3);
}

- (NSString)componentVersion
{
  return self->_componentVersion;
}

- (void)setComponentVersion:(id)a3
{
  objc_storeStrong((id *)&self->_componentVersion, a3);
}

- (NSString)componentID
{
  return self->_componentID;
}

- (void)setComponentID:(id)a3
{
  objc_storeStrong((id *)&self->_componentID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radarDescription, 0);
  objc_storeStrong((id *)&self->_componentVersion, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
  objc_storeStrong((id *)&self->_componentID, 0);
  objc_storeStrong((id *)&self->_alert, 0);
}

@end
