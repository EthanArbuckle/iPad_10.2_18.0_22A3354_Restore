@implementation _INPBRunWorkflowIntentResponse

- (void)setContinueRunning:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_continueRunning = a3;
}

- (BOOL)hasContinueRunning
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasContinueRunning:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setRequestsIntentExecution:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_requestsIntentExecution = a3;
}

- (BOOL)hasRequestsIntentExecution
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasRequestsIntentExecution:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setSteps:(id)a3
{
  NSArray *v4;
  NSArray *steps;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  steps = self->_steps;
  self->_steps = v4;

}

- (void)clearSteps
{
  -[NSArray removeAllObjects](self->_steps, "removeAllObjects");
}

- (void)addStep:(id)a3
{
  id v4;
  NSArray *steps;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  steps = self->_steps;
  v8 = v4;
  if (!steps)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_steps;
    self->_steps = v6;

    v4 = v8;
    steps = self->_steps;
  }
  -[NSArray addObject:](steps, "addObject:", v4);

}

- (unint64_t)stepsCount
{
  return -[NSArray count](self->_steps, "count");
}

- (id)stepAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_steps, "objectAtIndexedSubscript:", a3);
}

- (void)setUnderlyingIntent:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingIntent, a3);
}

- (BOOL)hasUnderlyingIntent
{
  return self->_underlyingIntent != 0;
}

- (void)setUnderlyingIntentResponse:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingIntentResponse, a3);
}

- (BOOL)hasUnderlyingIntentResponse
{
  return self->_underlyingIntentResponse != 0;
}

- (void)setUtterance:(id)a3
{
  NSString *v4;
  NSString *utterance;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  utterance = self->_utterance;
  self->_utterance = v4;

}

- (BOOL)hasUtterance
{
  return self->_utterance != 0;
}

- (void)setWaitingForResume:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_waitingForResume = a3;
}

- (BOOL)hasWaitingForResume
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasWaitingForResume:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRunWorkflowIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_INPBRunWorkflowIntentResponse hasContinueRunning](self, "hasContinueRunning"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBRunWorkflowIntentResponse hasRequestsIntentExecution](self, "hasRequestsIntentExecution"))
    PBDataWriterWriteBOOLField();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_steps;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  -[_INPBRunWorkflowIntentResponse underlyingIntent](self, "underlyingIntent", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBRunWorkflowIntentResponse underlyingIntent](self, "underlyingIntent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRunWorkflowIntentResponse underlyingIntentResponse](self, "underlyingIntentResponse");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBRunWorkflowIntentResponse underlyingIntentResponse](self, "underlyingIntentResponse");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRunWorkflowIntentResponse utterance](self, "utterance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    PBDataWriterWriteStringField();
  if (-[_INPBRunWorkflowIntentResponse hasWaitingForResume](self, "hasWaitingForResume"))
    PBDataWriterWriteBOOLField();

}

- (_INPBRunWorkflowIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBRunWorkflowIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBRunWorkflowIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBRunWorkflowIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBRunWorkflowIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBRunWorkflowIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBRunWorkflowIntentResponse *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  v5 = -[_INPBRunWorkflowIntentResponse init](+[_INPBRunWorkflowIntentResponse allocWithZone:](_INPBRunWorkflowIntentResponse, "allocWithZone:"), "init");
  if (-[_INPBRunWorkflowIntentResponse hasContinueRunning](self, "hasContinueRunning"))
    -[_INPBRunWorkflowIntentResponse setContinueRunning:](v5, "setContinueRunning:", -[_INPBRunWorkflowIntentResponse continueRunning](self, "continueRunning"));
  if (-[_INPBRunWorkflowIntentResponse hasRequestsIntentExecution](self, "hasRequestsIntentExecution"))
    -[_INPBRunWorkflowIntentResponse setRequestsIntentExecution:](v5, "setRequestsIntentExecution:", -[_INPBRunWorkflowIntentResponse requestsIntentExecution](self, "requestsIntentExecution"));
  v6 = (void *)-[NSArray copyWithZone:](self->_steps, "copyWithZone:", a3);
  -[_INPBRunWorkflowIntentResponse setSteps:](v5, "setSteps:", v6);

  v7 = -[_INPBArchivedObject copyWithZone:](self->_underlyingIntent, "copyWithZone:", a3);
  -[_INPBRunWorkflowIntentResponse setUnderlyingIntent:](v5, "setUnderlyingIntent:", v7);

  v8 = -[_INPBArchivedObject copyWithZone:](self->_underlyingIntentResponse, "copyWithZone:", a3);
  -[_INPBRunWorkflowIntentResponse setUnderlyingIntentResponse:](v5, "setUnderlyingIntentResponse:", v8);

  v9 = (void *)-[NSString copyWithZone:](self->_utterance, "copyWithZone:", a3);
  -[_INPBRunWorkflowIntentResponse setUtterance:](v5, "setUtterance:", v9);

  if (-[_INPBRunWorkflowIntentResponse hasWaitingForResume](self, "hasWaitingForResume"))
    -[_INPBRunWorkflowIntentResponse setWaitingForResume:](v5, "setWaitingForResume:", -[_INPBRunWorkflowIntentResponse waitingForResume](self, "waitingForResume"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int continueRunning;
  int v7;
  int requestsIntentExecution;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  BOOL v31;
  int v33;
  int waitingForResume;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  v5 = -[_INPBRunWorkflowIntentResponse hasContinueRunning](self, "hasContinueRunning");
  if (v5 != objc_msgSend(v4, "hasContinueRunning"))
    goto LABEL_30;
  if (-[_INPBRunWorkflowIntentResponse hasContinueRunning](self, "hasContinueRunning"))
  {
    if (objc_msgSend(v4, "hasContinueRunning"))
    {
      continueRunning = self->_continueRunning;
      if (continueRunning != objc_msgSend(v4, "continueRunning"))
        goto LABEL_30;
    }
  }
  v7 = -[_INPBRunWorkflowIntentResponse hasRequestsIntentExecution](self, "hasRequestsIntentExecution");
  if (v7 != objc_msgSend(v4, "hasRequestsIntentExecution"))
    goto LABEL_30;
  if (-[_INPBRunWorkflowIntentResponse hasRequestsIntentExecution](self, "hasRequestsIntentExecution"))
  {
    if (objc_msgSend(v4, "hasRequestsIntentExecution"))
    {
      requestsIntentExecution = self->_requestsIntentExecution;
      if (requestsIntentExecution != objc_msgSend(v4, "requestsIntentExecution"))
        goto LABEL_30;
    }
  }
  -[_INPBRunWorkflowIntentResponse steps](self, "steps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "steps");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 == 0) == (v10 != 0))
    goto LABEL_29;
  -[_INPBRunWorkflowIntentResponse steps](self, "steps");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[_INPBRunWorkflowIntentResponse steps](self, "steps");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "steps");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqual:", v14);

    if (!v15)
      goto LABEL_30;
  }
  else
  {

  }
  -[_INPBRunWorkflowIntentResponse underlyingIntent](self, "underlyingIntent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "underlyingIntent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 == 0) == (v10 != 0))
    goto LABEL_29;
  -[_INPBRunWorkflowIntentResponse underlyingIntent](self, "underlyingIntent");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[_INPBRunWorkflowIntentResponse underlyingIntent](self, "underlyingIntent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "underlyingIntent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if (!v20)
      goto LABEL_30;
  }
  else
  {

  }
  -[_INPBRunWorkflowIntentResponse underlyingIntentResponse](self, "underlyingIntentResponse");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "underlyingIntentResponse");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 == 0) == (v10 != 0))
    goto LABEL_29;
  -[_INPBRunWorkflowIntentResponse underlyingIntentResponse](self, "underlyingIntentResponse");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    -[_INPBRunWorkflowIntentResponse underlyingIntentResponse](self, "underlyingIntentResponse");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "underlyingIntentResponse");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if (!v25)
      goto LABEL_30;
  }
  else
  {

  }
  -[_INPBRunWorkflowIntentResponse utterance](self, "utterance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "utterance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 == 0) == (v10 != 0))
  {
LABEL_29:

    goto LABEL_30;
  }
  -[_INPBRunWorkflowIntentResponse utterance](self, "utterance");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[_INPBRunWorkflowIntentResponse utterance](self, "utterance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "utterance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if (!v30)
      goto LABEL_30;
  }
  else
  {

  }
  v33 = -[_INPBRunWorkflowIntentResponse hasWaitingForResume](self, "hasWaitingForResume");
  if (v33 == objc_msgSend(v4, "hasWaitingForResume"))
  {
    if (!-[_INPBRunWorkflowIntentResponse hasWaitingForResume](self, "hasWaitingForResume")
      || !objc_msgSend(v4, "hasWaitingForResume")
      || (waitingForResume = self->_waitingForResume,
          waitingForResume == objc_msgSend(v4, "waitingForResume")))
    {
      v31 = 1;
      goto LABEL_31;
    }
  }
LABEL_30:
  v31 = 0;
LABEL_31:

  return v31;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  NSUInteger v8;
  uint64_t v9;

  if (-[_INPBRunWorkflowIntentResponse hasContinueRunning](self, "hasContinueRunning"))
    v3 = 2654435761 * self->_continueRunning;
  else
    v3 = 0;
  if (-[_INPBRunWorkflowIntentResponse hasRequestsIntentExecution](self, "hasRequestsIntentExecution"))
    v4 = 2654435761 * self->_requestsIntentExecution;
  else
    v4 = 0;
  v5 = -[NSArray hash](self->_steps, "hash");
  v6 = -[_INPBArchivedObject hash](self->_underlyingIntent, "hash");
  v7 = -[_INPBArchivedObject hash](self->_underlyingIntentResponse, "hash");
  v8 = -[NSString hash](self->_utterance, "hash");
  if (-[_INPBRunWorkflowIntentResponse hasWaitingForResume](self, "hasWaitingForResume"))
    v9 = 2654435761 * self->_waitingForResume;
  else
    v9 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBRunWorkflowIntentResponse hasContinueRunning](self, "hasContinueRunning"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBRunWorkflowIntentResponse continueRunning](self, "continueRunning"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("continueRunning"));

  }
  if (-[_INPBRunWorkflowIntentResponse hasRequestsIntentExecution](self, "hasRequestsIntentExecution"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBRunWorkflowIntentResponse requestsIntentExecution](self, "requestsIntentExecution"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("requestsIntentExecution"));

  }
  if (-[NSArray count](self->_steps, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = self->_steps;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v11), "dictionaryRepresentation", (_QWORD)v21);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("step"));
  }
  -[_INPBRunWorkflowIntentResponse underlyingIntent](self, "underlyingIntent", (_QWORD)v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("underlyingIntent"));

  -[_INPBRunWorkflowIntentResponse underlyingIntentResponse](self, "underlyingIntentResponse");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("underlyingIntentResponse"));

  if (self->_utterance)
  {
    -[_INPBRunWorkflowIntentResponse utterance](self, "utterance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("utterance"));

  }
  if (-[_INPBRunWorkflowIntentResponse hasWaitingForResume](self, "hasWaitingForResume"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBRunWorkflowIntentResponse waitingForResume](self, "waitingForResume"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("waitingForResume"));

  }
  return v3;
}

- (BOOL)continueRunning
{
  return self->_continueRunning;
}

- (BOOL)requestsIntentExecution
{
  return self->_requestsIntentExecution;
}

- (NSArray)steps
{
  return self->_steps;
}

- (_INPBArchivedObject)underlyingIntent
{
  return self->_underlyingIntent;
}

- (_INPBArchivedObject)underlyingIntentResponse
{
  return self->_underlyingIntentResponse;
}

- (NSString)utterance
{
  return self->_utterance;
}

- (BOOL)waitingForResume
{
  return self->_waitingForResume;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_underlyingIntentResponse, 0);
  objc_storeStrong((id *)&self->_underlyingIntent, 0);
  objc_storeStrong((id *)&self->_steps, 0);
}

+ (Class)stepType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
