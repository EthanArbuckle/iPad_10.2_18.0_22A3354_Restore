@implementation SGRealtimeEvent

- (SGRealtimeEvent)initWithState:(int)a3 event:(id)a4 eventIdentifier:(id)a5 harvested:(BOOL)a6
{
  return -[SGRealtimeEvent initWithState:event:eventIdentifier:harvested:sourceMessageId:](self, "initWithState:event:eventIdentifier:harvested:sourceMessageId:", *(_QWORD *)&a3, a4, a5, a6, 0);
}

- (SGRealtimeEvent)initWithState:(int)a3 event:(id)a4 eventIdentifier:(id)a5 harvested:(BOOL)a6 sourceMessageId:(id)a7
{
  id v13;
  id v14;
  id v15;
  SGRealtimeEvent *v16;
  SGRealtimeEvent *v17;
  objc_super v19;

  v13 = a4;
  v14 = a5;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)SGRealtimeEvent;
  v16 = -[SGRealtimeEvent init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_state = a3;
    objc_storeStrong((id *)&v16->_event, a4);
    objc_storeStrong((id *)&v17->_eventIdentifier, a5);
    v17->_isHarvested = a6;
    objc_storeStrong((id *)&v17->_sourceMessageId, a7);
  }

  return v17;
}

- (SGRealtimeEvent)initWithCoder:(id)a3
{
  id v4;
  SGRealtimeEvent *v5;
  void *v6;
  uint64_t v7;
  SGEvent *event;
  void *v9;
  uint64_t v10;
  NSString *eventIdentifier;
  void *v12;
  uint64_t v13;
  NSString *sourceMessageId;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SGRealtimeEvent;
  v5 = -[SGRealtimeEvent init](&v16, sel_init);
  if (v5)
  {
    v5->_state = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("state"));
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("event"));
    v7 = objc_claimAutoreleasedReturnValue();
    event = v5->_event;
    v5->_event = (SGEvent *)v7;

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("eventIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    eventIdentifier = v5->_eventIdentifier;
    v5->_eventIdentifier = (NSString *)v10;

    v5->_isHarvested = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isHarvested"));
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("sourceMessageId"));
    v13 = objc_claimAutoreleasedReturnValue();
    sourceMessageId = v5->_sourceMessageId;
    v5->_sourceMessageId = (NSString *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t state;
  id v5;

  state = self->_state;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", state, CFSTR("state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_event, CFSTR("event"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eventIdentifier, CFSTR("eventIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isHarvested, CFSTR("isHarvested"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceMessageId, CFSTR("sourceMessageId"));

}

- (BOOL)isEqual:(id)a3
{
  SGRealtimeEvent *v4;
  SGRealtimeEvent *v5;
  BOOL v6;

  v4 = (SGRealtimeEvent *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGRealtimeEvent isEqualToRealtimeEvent:](self, "isEqualToRealtimeEvent:", v5);

  return v6;
}

- (BOOL)isEqualToRealtimeEvent:(id)a3
{
  id *v4;
  int state;
  NSString *eventIdentifier;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  SGEvent *event;
  SGEvent *v12;
  SGEvent *v13;
  SGEvent *v14;
  BOOL v15;
  int isHarvested;
  NSString *v17;
  NSString *v18;
  char v19;

  v4 = (id *)a3;
  state = self->_state;
  if (state != objc_msgSend(v4, "state"))
    goto LABEL_13;
  eventIdentifier = self->_eventIdentifier;
  v7 = (NSString *)v4[3];
  if (eventIdentifier == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = eventIdentifier;
    v10 = -[NSString isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_13;
  }
  event = self->_event;
  v12 = (SGEvent *)v4[2];
  if (event == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = event;
    v15 = -[SGEvent isEqual:](v14, "isEqual:", v13);

    if (!v15)
      goto LABEL_13;
  }
  isHarvested = self->_isHarvested;
  if (isHarvested != objc_msgSend(v4, "isHarvested"))
  {
LABEL_13:
    v19 = 0;
    goto LABEL_14;
  }
  v17 = self->_sourceMessageId;
  v18 = v17;
  if (v17 == v4[4])
    v19 = 1;
  else
    v19 = -[NSString isEqual:](v17, "isEqual:");

LABEL_14:
  return v19;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_eventIdentifier, "hash");
}

- (NSString)description
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<SGRealtimeEvent state=%i eventId='%@'\nevent = %@\n>"), self->_state, self->_eventIdentifier, self->_event);
}

- (int)state
{
  return self->_state;
}

- (SGEvent)event
{
  return self->_event;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (NSString)sourceMessageId
{
  return self->_sourceMessageId;
}

- (BOOL)isHarvested
{
  return self->_isHarvested;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceMessageId, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)realtimeEventForNewEvent:(id)a3
{
  return +[SGRealtimeEvent realtimeEventForNewEvent:harvested:](SGRealtimeEvent, "realtimeEventForNewEvent:harvested:", a3, 0);
}

+ (id)realtimeEventForNewEvent:(id)a3 harvested:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  SGRealtimeEvent *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[SGRealtimeEvent initWithState:event:eventIdentifier:harvested:]([SGRealtimeEvent alloc], "initWithState:event:eventIdentifier:harvested:", 1, v5, 0, v4);

  return v6;
}

+ (id)realtimeEventForCanceledEvent:(id)a3 eventIdentifier:(id)a4
{
  return +[SGRealtimeEvent realtimeEventForCanceledEvent:eventIdentifier:harvested:](SGRealtimeEvent, "realtimeEventForCanceledEvent:eventIdentifier:harvested:", a3, a4, 0);
}

+ (id)realtimeEventForCanceledEvent:(id)a3 eventIdentifier:(id)a4 harvested:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  SGRealtimeEvent *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[SGRealtimeEvent initWithState:event:eventIdentifier:harvested:]([SGRealtimeEvent alloc], "initWithState:event:eventIdentifier:harvested:", 3, v8, v7, v5);

  return v9;
}

+ (id)realtimeEventUpdateToEvent:(id)a3 withNewValues:(id)a4
{
  return +[SGRealtimeEvent realtimeEventUpdateToEvent:withNewValues:harvested:](SGRealtimeEvent, "realtimeEventUpdateToEvent:withNewValues:harvested:", a3, a4, 0);
}

+ (id)realtimeEventUpdateToEvent:(id)a3 withNewValues:(id)a4 harvested:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  SGRealtimeEvent *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[SGRealtimeEvent initWithState:event:eventIdentifier:harvested:]([SGRealtimeEvent alloc], "initWithState:event:eventIdentifier:harvested:", 2, v7, v8, v5);

  return v9;
}

+ (id)realtimeEventForDuplicateEvent:(id)a3 eventIdentifier:(id)a4
{
  return +[SGRealtimeEvent realtimeEventForDuplicateEvent:eventIdentifier:harvested:](SGRealtimeEvent, "realtimeEventForDuplicateEvent:eventIdentifier:harvested:", a3, a4, 0);
}

+ (id)realtimeEventForDuplicateEvent:(id)a3 eventIdentifier:(id)a4 harvested:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  SGRealtimeEvent *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[SGRealtimeEvent initWithState:event:eventIdentifier:harvested:]([SGRealtimeEvent alloc], "initWithState:event:eventIdentifier:harvested:", 4, v8, v7, v5);

  return v9;
}

+ (id)realtimeEventForNearDuplicateEvent:(id)a3
{
  return +[SGRealtimeEvent realtimeEventForNearDuplicateEvent:harvested:](SGRealtimeEvent, "realtimeEventForNearDuplicateEvent:harvested:", a3, 0);
}

+ (id)realtimeEventForNearDuplicateEvent:(id)a3 harvested:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  SGRealtimeEvent *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[SGRealtimeEvent initWithState:event:eventIdentifier:harvested:]([SGRealtimeEvent alloc], "initWithState:event:eventIdentifier:harvested:", 5, 0, v5, v4);

  return v6;
}

+ (id)realtimeEventForExtractionExceptionWithSourceMessageId:(id)a3
{
  id v3;
  SGRealtimeEvent *v4;

  v3 = a3;
  v4 = -[SGRealtimeEvent initWithState:event:eventIdentifier:harvested:sourceMessageId:]([SGRealtimeEvent alloc], "initWithState:event:eventIdentifier:harvested:sourceMessageId:", 6, 0, 0, 0, v3);

  return v4;
}

@end
