@implementation InteractionAnalysisPETInteractionEvent

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)InteractionAnalysisPETInteractionEvent;
  -[InteractionAnalysisPETInteractionEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[InteractionAnalysisPETInteractionEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *eventMechanism;
  NSString *bundleID;
  NSString *direction;
  NSString *interactionID;
  NSString *associatedMemberIDs;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  eventMechanism = self->_eventMechanism;
  if (eventMechanism)
    objc_msgSend(v3, "setObject:forKey:", eventMechanism, CFSTR("eventMechanism"));
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v3, "setObject:forKey:", bundleID, CFSTR("bundleID"));
  direction = self->_direction;
  if (direction)
    objc_msgSend(v3, "setObject:forKey:", direction, CFSTR("direction"));
  interactionID = self->_interactionID;
  if (interactionID)
    objc_msgSend(v3, "setObject:forKey:", interactionID, CFSTR("interactionID"));
  associatedMemberIDs = self->_associatedMemberIDs;
  if (associatedMemberIDs)
    objc_msgSend(v3, "setObject:forKey:", associatedMemberIDs, CFSTR("associatedMemberIDs"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return InteractionAnalysisPETInteractionEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteDoubleField();
  if (!self->_eventMechanism)
    -[InteractionAnalysisPETInteractionEvent writeTo:].cold.1();
  PBDataWriterWriteStringField();
  if (!self->_bundleID)
    -[InteractionAnalysisPETInteractionEvent writeTo:].cold.2();
  PBDataWriterWriteStringField();
  if (!self->_direction)
    -[InteractionAnalysisPETInteractionEvent writeTo:].cold.3();
  PBDataWriterWriteStringField();
  if (self->_interactionID)
    PBDataWriterWriteStringField();
  if (self->_associatedMemberIDs)
    PBDataWriterWriteStringField();

}

- (void)setEventMechanism:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)setBundleID:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setDirection:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setInteractionID:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

- (void)setAssociatedMemberIDs:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v5 + 8) = self->_timestamp;
  v6 = -[NSString copyWithZone:](self->_eventMechanism, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_direction, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[NSString copyWithZone:](self->_interactionID, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v12;

  v14 = -[NSString copyWithZone:](self->_associatedMemberIDs, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *eventMechanism;
  NSString *bundleID;
  NSString *direction;
  NSString *interactionID;
  NSString *associatedMemberIDs;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_timestamp == *((double *)v4 + 1)
    && ((eventMechanism = self->_eventMechanism, !((unint64_t)eventMechanism | v4[5]))
     || -[NSString isEqual:](eventMechanism, "isEqual:"))
    && ((bundleID = self->_bundleID, !((unint64_t)bundleID | v4[3]))
     || -[NSString isEqual:](bundleID, "isEqual:"))
    && ((direction = self->_direction, !((unint64_t)direction | v4[4]))
     || -[NSString isEqual:](direction, "isEqual:"))
    && ((interactionID = self->_interactionID, !((unint64_t)interactionID | v4[6]))
     || -[NSString isEqual:](interactionID, "isEqual:")))
  {
    associatedMemberIDs = self->_associatedMemberIDs;
    if ((unint64_t)associatedMemberIDs | v4[2])
      v10 = -[NSString isEqual:](associatedMemberIDs, "isEqual:");
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
  double timestamp;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;

  timestamp = self->_timestamp;
  v4 = -timestamp;
  if (timestamp >= 0.0)
    v4 = self->_timestamp;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = fmod(v5, 1.84467441e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0)
    v11 = v10;
  else
    v11 = v9;
  v12 = -[NSString hash](self->_eventMechanism, "hash");
  v13 = v11 ^ -[NSString hash](self->_bundleID, "hash");
  v14 = v12 ^ -[NSString hash](self->_direction, "hash");
  v15 = v14 ^ -[NSString hash](self->_interactionID, "hash");
  return v15 ^ -[NSString hash](self->_associatedMemberIDs, "hash") ^ v13;
}

- (uint64_t)setTimestamp:(uint64_t)result
{
  if (result)
    *(double *)(result + 8) = a2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionID, 0);
  objc_storeStrong((id *)&self->_eventMechanism, 0);
  objc_storeStrong((id *)&self->_direction, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_associatedMemberIDs, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[InteractionAnalysisPETInteractionEvent writeTo:]", "InteractionAnalysisPETInteractionEvent.m", 135, "nil != self->_eventMechanism");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[InteractionAnalysisPETInteractionEvent writeTo:]", "InteractionAnalysisPETInteractionEvent.m", 140, "nil != self->_bundleID");
}

- (void)writeTo:.cold.3()
{
  __assert_rtn("-[InteractionAnalysisPETInteractionEvent writeTo:]", "InteractionAnalysisPETInteractionEvent.m", 145, "nil != self->_direction");
}

@end
