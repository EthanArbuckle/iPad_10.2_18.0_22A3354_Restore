@implementation ATXMPBContextMenuFeedbackTracker

- (int)menuActionType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_menuActionType;
  else
    return 1;
}

- (void)setMenuActionType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_menuActionType = a3;
}

- (void)setHasMenuActionType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMenuActionType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)menuActionTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("DismissOnce");
  if (a3 == 2)
  {
    v3 = CFSTR("NeverShowAgain");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsMenuActionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DismissOnce")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("NeverShowAgain")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (BOOL)hasClientModelId
{
  return self->_clientModelId != 0;
}

- (BOOL)hasExecutableType
{
  return self->_executableType != 0;
}

- (BOOL)hasConsumerSubType
{
  return self->_consumerSubType != 0;
}

- (BOOL)hasSuggestion
{
  return self->_suggestion != 0;
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
  v8.super_class = (Class)ATXMPBContextMenuFeedbackTracker;
  -[ATXMPBContextMenuFeedbackTracker description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMPBContextMenuFeedbackTracker dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  int menuActionType;
  __CFString *v5;
  NSString *clientModelId;
  NSString *executableType;
  NSString *consumerSubType;
  NSString *suggestion;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    menuActionType = self->_menuActionType;
    if (menuActionType == 1)
    {
      v5 = CFSTR("DismissOnce");
    }
    else if (menuActionType == 2)
    {
      v5 = CFSTR("NeverShowAgain");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_menuActionType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("menuActionType"));

  }
  clientModelId = self->_clientModelId;
  if (clientModelId)
    objc_msgSend(v3, "setObject:forKey:", clientModelId, CFSTR("clientModelId"));
  executableType = self->_executableType;
  if (executableType)
    objc_msgSend(v3, "setObject:forKey:", executableType, CFSTR("executableType"));
  consumerSubType = self->_consumerSubType;
  if (consumerSubType)
    objc_msgSend(v3, "setObject:forKey:", consumerSubType, CFSTR("consumerSubType"));
  suggestion = self->_suggestion;
  if (suggestion)
    objc_msgSend(v3, "setObject:forKey:", suggestion, CFSTR("suggestion"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBContextMenuFeedbackTrackerReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_clientModelId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_executableType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_consumerSubType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_suggestion)
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
    v4[8] = self->_menuActionType;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  v5 = v4;
  if (self->_clientModelId)
  {
    objc_msgSend(v4, "setClientModelId:");
    v4 = v5;
  }
  if (self->_executableType)
  {
    objc_msgSend(v5, "setExecutableType:");
    v4 = v5;
  }
  if (self->_consumerSubType)
  {
    objc_msgSend(v5, "setConsumerSubType:");
    v4 = v5;
  }
  if (self->_suggestion)
  {
    objc_msgSend(v5, "setSuggestion:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_menuActionType;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_clientModelId, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  v9 = -[NSString copyWithZone:](self->_executableType, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  v11 = -[NSString copyWithZone:](self->_consumerSubType, "copyWithZone:", a3);
  v12 = (void *)v6[2];
  v6[2] = v11;

  v13 = -[NSString copyWithZone:](self->_suggestion, "copyWithZone:", a3);
  v14 = (void *)v6[5];
  v6[5] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *clientModelId;
  NSString *executableType;
  NSString *consumerSubType;
  NSString *suggestion;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_menuActionType != *((_DWORD *)v4 + 8))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  clientModelId = self->_clientModelId;
  if ((unint64_t)clientModelId | *((_QWORD *)v4 + 1)
    && !-[NSString isEqual:](clientModelId, "isEqual:"))
  {
    goto LABEL_15;
  }
  executableType = self->_executableType;
  if ((unint64_t)executableType | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](executableType, "isEqual:"))
      goto LABEL_15;
  }
  consumerSubType = self->_consumerSubType;
  if ((unint64_t)consumerSubType | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](consumerSubType, "isEqual:"))
      goto LABEL_15;
  }
  suggestion = self->_suggestion;
  if ((unint64_t)suggestion | *((_QWORD *)v4 + 5))
    v9 = -[NSString isEqual:](suggestion, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_menuActionType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_clientModelId, "hash") ^ v3;
  v5 = -[NSString hash](self->_executableType, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_consumerSubType, "hash");
  return v6 ^ -[NSString hash](self->_suggestion, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[12] & 1) != 0)
  {
    self->_menuActionType = v4[8];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[ATXMPBContextMenuFeedbackTracker setClientModelId:](self, "setClientModelId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[ATXMPBContextMenuFeedbackTracker setExecutableType:](self, "setExecutableType:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[ATXMPBContextMenuFeedbackTracker setConsumerSubType:](self, "setConsumerSubType:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[ATXMPBContextMenuFeedbackTracker setSuggestion:](self, "setSuggestion:");
    v4 = v5;
  }

}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (void)setClientModelId:(id)a3
{
  objc_storeStrong((id *)&self->_clientModelId, a3);
}

- (NSString)executableType
{
  return self->_executableType;
}

- (void)setExecutableType:(id)a3
{
  objc_storeStrong((id *)&self->_executableType, a3);
}

- (NSString)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(id)a3
{
  objc_storeStrong((id *)&self->_consumerSubType, a3);
}

- (NSString)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_suggestion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_executableType, 0);
  objc_storeStrong((id *)&self->_consumerSubType, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
}

@end
