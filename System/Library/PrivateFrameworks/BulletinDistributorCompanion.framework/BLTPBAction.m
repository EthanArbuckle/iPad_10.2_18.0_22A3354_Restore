@implementation BLTPBAction

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasLaunchURL
{
  return self->_launchURL != 0;
}

- (void)setBehavior:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_behavior = a3;
}

- (void)setHasBehavior:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBehavior
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasBehaviorParameters
{
  return self->_behaviorParameters != 0;
}

- (BOOL)hasBehaviorParametersNulls
{
  return self->_behaviorParametersNulls != 0;
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
  v8.super_class = (Class)BLTPBAction;
  -[BLTPBAction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBAction dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  BLTPBAppearance *appearance;
  void *v7;
  void *v8;
  NSString *launchURL;
  void *v10;
  NSData *behaviorParameters;
  NSData *behaviorParametersNulls;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  appearance = self->_appearance;
  if (appearance)
  {
    -[BLTPBAppearance dictionaryRepresentation](appearance, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("appearance"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_activationMode);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("activationMode"));

  launchURL = self->_launchURL;
  if (launchURL)
    objc_msgSend(v4, "setObject:forKey:", launchURL, CFSTR("launchURL"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_behavior);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("behavior"));

  }
  behaviorParameters = self->_behaviorParameters;
  if (behaviorParameters)
    objc_msgSend(v4, "setObject:forKey:", behaviorParameters, CFSTR("behaviorParameters"));
  behaviorParametersNulls = self->_behaviorParametersNulls;
  if (behaviorParametersNulls)
    objc_msgSend(v4, "setObject:forKey:", behaviorParametersNulls, CFSTR("behaviorParametersNulls"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (self->_identifier)
    PBDataWriterWriteStringField();
  if (!self->_appearance)
    -[BLTPBAction writeTo:].cold.1();
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteInt32Field();
  if (self->_launchURL)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v4 = v5;
  if (self->_behaviorParameters)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_behaviorParametersNulls)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v5 = a3;
  if (self->_identifier)
    objc_msgSend(v5, "setIdentifier:");
  objc_msgSend(v5, "setAppearance:", self->_appearance);
  v4 = v5;
  v5[2] = self->_activationMode;
  if (self->_launchURL)
  {
    objc_msgSend(v5, "setLaunchURL:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[6] = self->_behavior;
    *((_BYTE *)v4 + 64) |= 1u;
  }
  if (self->_behaviorParameters)
  {
    objc_msgSend(v5, "setBehaviorParameters:");
    v4 = v5;
  }
  if (self->_behaviorParametersNulls)
  {
    objc_msgSend(v5, "setBehaviorParametersNulls:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v8 = -[BLTPBAppearance copyWithZone:](self->_appearance, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  *(_DWORD *)(v5 + 8) = self->_activationMode;
  v10 = -[NSString copyWithZone:](self->_launchURL, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_behavior;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v12 = -[NSData copyWithZone:](self->_behaviorParameters, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  v14 = -[NSData copyWithZone:](self->_behaviorParametersNulls, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  BLTPBAppearance *appearance;
  NSString *launchURL;
  NSData *behaviorParameters;
  NSData *behaviorParametersNulls;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_18;
  }
  appearance = self->_appearance;
  if ((unint64_t)appearance | *((_QWORD *)v4 + 2))
  {
    if (!-[BLTPBAppearance isEqual:](appearance, "isEqual:"))
      goto LABEL_18;
  }
  if (self->_activationMode != *((_DWORD *)v4 + 2))
    goto LABEL_18;
  launchURL = self->_launchURL;
  if ((unint64_t)launchURL | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](launchURL, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_behavior != *((_DWORD *)v4 + 6))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_18:
    v10 = 0;
    goto LABEL_19;
  }
  behaviorParameters = self->_behaviorParameters;
  if ((unint64_t)behaviorParameters | *((_QWORD *)v4 + 4)
    && !-[NSData isEqual:](behaviorParameters, "isEqual:"))
  {
    goto LABEL_18;
  }
  behaviorParametersNulls = self->_behaviorParametersNulls;
  if ((unint64_t)behaviorParametersNulls | *((_QWORD *)v4 + 5))
    v10 = -[NSData isEqual:](behaviorParametersNulls, "isEqual:");
  else
    v10 = 1;
LABEL_19:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t activationMode;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[BLTPBAppearance hash](self->_appearance, "hash");
  activationMode = self->_activationMode;
  v6 = -[NSString hash](self->_launchURL, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_behavior;
  else
    v7 = 0;
  v8 = v4 ^ v3 ^ v6 ^ v7 ^ -[NSData hash](self->_behaviorParameters, "hash") ^ (2654435761 * activationMode);
  return v8 ^ -[NSData hash](self->_behaviorParametersNulls, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  BLTPBAppearance *appearance;
  uint64_t v6;
  int *v7;

  v4 = (int *)a3;
  v7 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[BLTPBAction setIdentifier:](self, "setIdentifier:");
    v4 = v7;
  }
  appearance = self->_appearance;
  v6 = *((_QWORD *)v4 + 2);
  if (appearance)
  {
    if (!v6)
      goto LABEL_9;
    -[BLTPBAppearance mergeFrom:](appearance, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[BLTPBAction setAppearance:](self, "setAppearance:");
  }
  v4 = v7;
LABEL_9:
  self->_activationMode = v4[2];
  if (*((_QWORD *)v4 + 7))
  {
    -[BLTPBAction setLaunchURL:](self, "setLaunchURL:");
    v4 = v7;
  }
  if ((v4[16] & 1) != 0)
  {
    self->_behavior = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[BLTPBAction setBehaviorParameters:](self, "setBehaviorParameters:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[BLTPBAction setBehaviorParametersNulls:](self, "setBehaviorParametersNulls:");
    v4 = v7;
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (BLTPBAppearance)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_appearance, a3);
}

- (int)activationMode
{
  return self->_activationMode;
}

- (void)setActivationMode:(int)a3
{
  self->_activationMode = a3;
}

- (NSString)launchURL
{
  return self->_launchURL;
}

- (void)setLaunchURL:(id)a3
{
  objc_storeStrong((id *)&self->_launchURL, a3);
}

- (int)behavior
{
  return self->_behavior;
}

- (NSData)behaviorParameters
{
  return self->_behaviorParameters;
}

- (void)setBehaviorParameters:(id)a3
{
  objc_storeStrong((id *)&self->_behaviorParameters, a3);
}

- (NSData)behaviorParametersNulls
{
  return self->_behaviorParametersNulls;
}

- (void)setBehaviorParametersNulls:(id)a3
{
  objc_storeStrong((id *)&self->_behaviorParametersNulls, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_behaviorParametersNulls, 0);
  objc_storeStrong((id *)&self->_behaviorParameters, 0);
  objc_storeStrong((id *)&self->_appearance, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[BLTPBAction writeTo:]", "BLTPBAction.m", 184, "self->_appearance != nil");
}

@end
