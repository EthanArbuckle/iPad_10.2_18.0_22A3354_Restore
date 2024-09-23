@implementation CAXPBContextualActionsFeedbackEvent

- (BOOL)hasSelectedAction
{
  return self->_selectedAction != 0;
}

- (BOOL)hasSuggestion
{
  return self->_suggestion != 0;
}

- (BOOL)hasDeviceContext
{
  return self->_deviceContext != 0;
}

- (BOOL)hasSessionIdentifier
{
  return self->_sessionIdentifier != 0;
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
  v8.super_class = (Class)CAXPBContextualActionsFeedbackEvent;
  -[CAXPBContextualActionsFeedbackEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAXPBContextualActionsFeedbackEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  CAXPBContextualAction *selectedAction;
  void *v5;
  CAXPBSuggestion *suggestion;
  void *v7;
  CAXPBPredictionContext *deviceContext;
  void *v9;
  NSString *sessionIdentifier;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  selectedAction = self->_selectedAction;
  if (selectedAction)
  {
    -[CAXPBContextualAction dictionaryRepresentation](selectedAction, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("selectedAction"));

  }
  suggestion = self->_suggestion;
  if (suggestion)
  {
    -[CAXPBSuggestion dictionaryRepresentation](suggestion, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("suggestion"));

  }
  deviceContext = self->_deviceContext;
  if (deviceContext)
  {
    -[CAXPBPredictionContext dictionaryRepresentation](deviceContext, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("deviceContext"));

  }
  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier)
    objc_msgSend(v3, "setObject:forKey:", sessionIdentifier, CFSTR("sessionIdentifier"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CAXPBContextualActionsFeedbackEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_selectedAction)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_suggestion)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_deviceContext)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_sessionIdentifier)
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
  if (self->_selectedAction)
  {
    objc_msgSend(v4, "setSelectedAction:");
    v4 = v5;
  }
  if (self->_suggestion)
  {
    objc_msgSend(v5, "setSuggestion:");
    v4 = v5;
  }
  if (self->_deviceContext)
  {
    objc_msgSend(v5, "setDeviceContext:");
    v4 = v5;
  }
  if (self->_sessionIdentifier)
  {
    objc_msgSend(v5, "setSessionIdentifier:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[CAXPBContextualAction copyWithZone:](self->_selectedAction, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[CAXPBSuggestion copyWithZone:](self->_suggestion, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[CAXPBPredictionContext copyWithZone:](self->_deviceContext, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  v12 = -[NSString copyWithZone:](self->_sessionIdentifier, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  CAXPBContextualAction *selectedAction;
  CAXPBSuggestion *suggestion;
  CAXPBPredictionContext *deviceContext;
  NSString *sessionIdentifier;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((selectedAction = self->_selectedAction, !((unint64_t)selectedAction | v4[2]))
     || -[CAXPBContextualAction isEqual:](selectedAction, "isEqual:"))
    && ((suggestion = self->_suggestion, !((unint64_t)suggestion | v4[4]))
     || -[CAXPBSuggestion isEqual:](suggestion, "isEqual:"))
    && ((deviceContext = self->_deviceContext, !((unint64_t)deviceContext | v4[1]))
     || -[CAXPBPredictionContext isEqual:](deviceContext, "isEqual:")))
  {
    sessionIdentifier = self->_sessionIdentifier;
    if ((unint64_t)sessionIdentifier | v4[3])
      v9 = -[NSString isEqual:](sessionIdentifier, "isEqual:");
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
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[CAXPBContextualAction hash](self->_selectedAction, "hash");
  v4 = -[CAXPBSuggestion hash](self->_suggestion, "hash") ^ v3;
  v5 = -[CAXPBPredictionContext hash](self->_deviceContext, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_sessionIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  CAXPBContextualAction *selectedAction;
  uint64_t v6;
  CAXPBSuggestion *suggestion;
  uint64_t v8;
  CAXPBPredictionContext *deviceContext;
  uint64_t v10;
  _QWORD *v11;

  v4 = a3;
  selectedAction = self->_selectedAction;
  v6 = v4[2];
  v11 = v4;
  if (selectedAction)
  {
    if (!v6)
      goto LABEL_7;
    -[CAXPBContextualAction mergeFrom:](selectedAction, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[CAXPBContextualActionsFeedbackEvent setSelectedAction:](self, "setSelectedAction:");
  }
  v4 = v11;
LABEL_7:
  suggestion = self->_suggestion;
  v8 = v4[4];
  if (suggestion)
  {
    if (!v8)
      goto LABEL_13;
    -[CAXPBSuggestion mergeFrom:](suggestion, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[CAXPBContextualActionsFeedbackEvent setSuggestion:](self, "setSuggestion:");
  }
  v4 = v11;
LABEL_13:
  deviceContext = self->_deviceContext;
  v10 = v4[1];
  if (deviceContext)
  {
    if (!v10)
      goto LABEL_19;
    -[CAXPBPredictionContext mergeFrom:](deviceContext, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_19;
    -[CAXPBContextualActionsFeedbackEvent setDeviceContext:](self, "setDeviceContext:");
  }
  v4 = v11;
LABEL_19:
  if (v4[3])
  {
    -[CAXPBContextualActionsFeedbackEvent setSessionIdentifier:](self, "setSessionIdentifier:");
    v4 = v11;
  }

}

- (CAXPBContextualAction)selectedAction
{
  return self->_selectedAction;
}

- (void)setSelectedAction:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAction, a3);
}

- (CAXPBSuggestion)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_suggestion, a3);
}

- (CAXPBPredictionContext)deviceContext
{
  return self->_deviceContext;
}

- (void)setDeviceContext:(id)a3
{
  objc_storeStrong((id *)&self->_deviceContext, a3);
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_selectedAction, 0);
  objc_storeStrong((id *)&self->_deviceContext, 0);
}

@end
