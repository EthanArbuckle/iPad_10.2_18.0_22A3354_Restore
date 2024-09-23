@implementation EDPBInteractionEvent

- (int)messageFrameType
{
  return 1;
}

- (id)ed_oneOfConcreteEvent
{
  uint64_t v4;
  void *v5;

  v4 = -[EDPBInteractionEvent eventName](self, "eventName");
  switch((int)v4)
  {
    case 0:
    case 1:
    case 3:
    case 4:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDPBGeneratedExtensions.m"), 232, CFSTR("INVALID event, we should not have reached this point"));

      v4 = 0;
      break;
    case 2:
      -[EDPBInteractionEvent messageSent](self, "messageSent");
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      -[EDPBInteractionEvent messageMoved](self, "messageMoved");
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[EDPBInteractionEvent messageCopied](self, "messageCopied");
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      -[EDPBInteractionEvent linkClicked](self, "linkClicked");
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      -[EDPBInteractionEvent appLaunch](self, "appLaunch");
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      -[EDPBInteractionEvent appBackground](self, "appBackground");
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      -[EDPBInteractionEvent appResume](self, "appResume");
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    case 11:
      -[EDPBInteractionEvent flagChanged](self, "flagChanged");
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    case 12:
      -[EDPBInteractionEvent readChanged](self, "readChanged");
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    case 13:
      -[EDPBInteractionEvent messageViewStart](self, "messageViewStart");
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    case 14:
      -[EDPBInteractionEvent messageViewEnd](self, "messageViewEnd");
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    case 15:
      -[EDPBInteractionEvent replyDraftStarted](self, "replyDraftStarted");
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    case 16:
      -[EDPBInteractionEvent forwardDraftStarted](self, "forwardDraftStarted");
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    case 17:
      -[EDPBInteractionEvent replySent](self, "replySent");
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    case 18:
      -[EDPBInteractionEvent forwardSent](self, "forwardSent");
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    case 19:
      -[EDPBInteractionEvent markedMuteThread](self, "markedMuteThread");
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    case 20:
      -[EDPBInteractionEvent categoryMarked](self, "categoryMarked");
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    case 21:
      -[EDPBInteractionEvent categoryInferred](self, "categoryInferred");
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      return (id)v4;
  }
  return (id)v4;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v5;
  unsigned __int8 v6;
  objc_super v8;

  if (_EDPBDataSettersDefinesMethod((char *)a3))
  {
    -[EDPBInteractionEvent ed_oneOfConcreteEvent](self, "ed_oneOfConcreteEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)EDPBInteractionEvent;
    v6 = -[EDPBInteractionEvent respondsToSelector:](&v8, sel_respondsToSelector_, a3);
  }
  return v6 & 1;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  if (_EDPBDataSettersDefinesMethod((char *)objc_msgSend(v4, "selector")))
  {
    -[EDPBInteractionEvent ed_oneOfConcreteEvent](self, "ed_oneOfConcreteEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invokeWithTarget:", v5);

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)EDPBInteractionEvent;
    -[EDPBInteractionEvent forwardInvocation:](&v6, sel_forwardInvocation_, v4);
  }

}

- (void)setSequenceNumber:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_sequenceNumber = a3;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSequenceNumber
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)eventName
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_eventName;
  else
    return 0;
}

- (void)setEventName:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_eventName = a3;
}

- (void)setHasEventName:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEventName
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)eventNameAsString:(int)a3
{
  if (a3 < 0x16)
    return off_1E949F268[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEventName:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVALID")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MESSAGE_FETCHED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MESSAGE_SENT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MESSAGE_LIST_DISPLAY_STARTED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MESSAGE_LIST_DISPLAY_ENDED")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MESSAGE_MOVED")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MESSAGE_COPIED")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LINK_CLICKED")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_LAUNCH")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_BACKGROUND")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_RESUME")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLAG_CHANGED")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("READ_CHANGED")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MESSAGE_VIEW_START")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MESSAGE_VIEW_END")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REPLY_DRAFT_STARTED")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FORWARD_DRAFT_STARTED")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REPLY_SENT")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FORWARD_SENT")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MARKED_MUTE_THREAD")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_MARKED")) & 1) != 0)
  {
    v4 = 20;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_INFERRED")))
  {
    v4 = 21;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasMessageFetched
{
  return self->_messageFetched != 0;
}

- (BOOL)hasMessageSent
{
  return self->_messageSent != 0;
}

- (BOOL)hasMessageMoved
{
  return self->_messageMoved != 0;
}

- (BOOL)hasMessageCopied
{
  return self->_messageCopied != 0;
}

- (BOOL)hasLinkClicked
{
  return self->_linkClicked != 0;
}

- (BOOL)hasAppLaunch
{
  return self->_appLaunch != 0;
}

- (BOOL)hasAppBackground
{
  return self->_appBackground != 0;
}

- (BOOL)hasAppResume
{
  return self->_appResume != 0;
}

- (BOOL)hasFlagChanged
{
  return self->_flagChanged != 0;
}

- (BOOL)hasReadChanged
{
  return self->_readChanged != 0;
}

- (BOOL)hasMessageViewStart
{
  return self->_messageViewStart != 0;
}

- (BOOL)hasMessageViewEnd
{
  return self->_messageViewEnd != 0;
}

- (BOOL)hasReplyDraftStarted
{
  return self->_replyDraftStarted != 0;
}

- (BOOL)hasForwardDraftStarted
{
  return self->_forwardDraftStarted != 0;
}

- (BOOL)hasReplySent
{
  return self->_replySent != 0;
}

- (BOOL)hasForwardSent
{
  return self->_forwardSent != 0;
}

- (BOOL)hasMarkedMuteThread
{
  return self->_markedMuteThread != 0;
}

- (BOOL)hasCategoryMarked
{
  return self->_categoryMarked != 0;
}

- (BOOL)hasCategoryInferred
{
  return self->_categoryInferred != 0;
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
  v8.super_class = (Class)EDPBInteractionEvent;
  -[EDPBInteractionEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDPBInteractionEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  uint64_t eventName;
  __CFString *v8;
  EDPBInteractionEventMessageFetched *messageFetched;
  void *v10;
  EDPBInteractionEventMessageSent *messageSent;
  void *v12;
  EDPBInteractionEventMessageMoved *messageMoved;
  void *v14;
  EDPBInteractionEventMessageCopied *messageCopied;
  void *v16;
  EDPBInteractionEventLinkClicked *linkClicked;
  void *v18;
  EDPBInteractionEventAppLaunch *appLaunch;
  void *v20;
  EDPBInteractionEventAppBackground *appBackground;
  void *v22;
  EDPBInteractionEventAppResume *appResume;
  void *v24;
  EDPBInteractionEventFlagChanged *flagChanged;
  void *v26;
  EDPBInteractionEventReadChanged *readChanged;
  void *v28;
  EDPBInteractionEventMessageViewStart *messageViewStart;
  void *v30;
  EDPBInteractionEventMessageViewEnd *messageViewEnd;
  void *v32;
  EDPBInteractionEventReplyDraftStarted *replyDraftStarted;
  void *v34;
  EDPBInteractionEventForwardDraftStarted *forwardDraftStarted;
  void *v36;
  EDPBInteractionEventReplySent *replySent;
  void *v38;
  EDPBInteractionEventForwardSent *forwardSent;
  void *v40;
  EDPBInteractionEventMarkedMuteThread *markedMuteThread;
  void *v42;
  EDPBInteractionEventCategoryMarked *categoryMarked;
  void *v44;
  EDPBInteractionEventCategoryInferred *categoryInferred;
  void *v46;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_sequenceNumber);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sequence_number"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("timestamp"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    eventName = self->_eventName;
    if (eventName >= 0x16)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_eventName);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E949F268[eventName];
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("event_name"));

  }
  messageFetched = self->_messageFetched;
  if (messageFetched)
  {
    -[EDPBInteractionEventMessageFetched dictionaryRepresentation](messageFetched, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("message_fetched"));

  }
  messageSent = self->_messageSent;
  if (messageSent)
  {
    -[EDPBInteractionEventMessageSent dictionaryRepresentation](messageSent, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("message_sent"));

  }
  messageMoved = self->_messageMoved;
  if (messageMoved)
  {
    -[EDPBInteractionEventMessageMoved dictionaryRepresentation](messageMoved, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("message_moved"));

  }
  messageCopied = self->_messageCopied;
  if (messageCopied)
  {
    -[EDPBInteractionEventMessageCopied dictionaryRepresentation](messageCopied, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("message_copied"));

  }
  linkClicked = self->_linkClicked;
  if (linkClicked)
  {
    -[EDPBInteractionEventLinkClicked dictionaryRepresentation](linkClicked, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("link_clicked"));

  }
  appLaunch = self->_appLaunch;
  if (appLaunch)
  {
    -[EDPBInteractionEventAppLaunch dictionaryRepresentation](appLaunch, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("app_launch"));

  }
  appBackground = self->_appBackground;
  if (appBackground)
  {
    -[EDPBInteractionEventAppBackground dictionaryRepresentation](appBackground, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("app_background"));

  }
  appResume = self->_appResume;
  if (appResume)
  {
    -[EDPBInteractionEventAppResume dictionaryRepresentation](appResume, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("app_resume"));

  }
  flagChanged = self->_flagChanged;
  if (flagChanged)
  {
    -[EDPBInteractionEventFlagChanged dictionaryRepresentation](flagChanged, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("flag_changed"));

  }
  readChanged = self->_readChanged;
  if (readChanged)
  {
    -[EDPBInteractionEventReadChanged dictionaryRepresentation](readChanged, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("read_changed"));

  }
  messageViewStart = self->_messageViewStart;
  if (messageViewStart)
  {
    -[EDPBInteractionEventMessageViewStart dictionaryRepresentation](messageViewStart, "dictionaryRepresentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("message_view_start"));

  }
  messageViewEnd = self->_messageViewEnd;
  if (messageViewEnd)
  {
    -[EDPBInteractionEventMessageViewEnd dictionaryRepresentation](messageViewEnd, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("message_view_end"));

  }
  replyDraftStarted = self->_replyDraftStarted;
  if (replyDraftStarted)
  {
    -[EDPBInteractionEventReplyDraftStarted dictionaryRepresentation](replyDraftStarted, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("reply_draft_started"));

  }
  forwardDraftStarted = self->_forwardDraftStarted;
  if (forwardDraftStarted)
  {
    -[EDPBInteractionEventForwardDraftStarted dictionaryRepresentation](forwardDraftStarted, "dictionaryRepresentation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("forward_draft_started"));

  }
  replySent = self->_replySent;
  if (replySent)
  {
    -[EDPBInteractionEventReplySent dictionaryRepresentation](replySent, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("reply_sent"));

  }
  forwardSent = self->_forwardSent;
  if (forwardSent)
  {
    -[EDPBInteractionEventForwardSent dictionaryRepresentation](forwardSent, "dictionaryRepresentation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("forward_sent"));

  }
  markedMuteThread = self->_markedMuteThread;
  if (markedMuteThread)
  {
    -[EDPBInteractionEventMarkedMuteThread dictionaryRepresentation](markedMuteThread, "dictionaryRepresentation");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("marked_mute_thread"));

  }
  categoryMarked = self->_categoryMarked;
  if (categoryMarked)
  {
    -[EDPBInteractionEventCategoryMarked dictionaryRepresentation](categoryMarked, "dictionaryRepresentation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("category_marked"));

  }
  categoryInferred = self->_categoryInferred;
  if (categoryInferred)
  {
    -[EDPBInteractionEventCategoryInferred dictionaryRepresentation](categoryInferred, "dictionaryRepresentation");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("category_inferred"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return EDPBInteractionEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_messageFetched)
    PBDataWriterWriteSubmessage();
  if (self->_messageSent)
    PBDataWriterWriteSubmessage();
  if (self->_messageMoved)
    PBDataWriterWriteSubmessage();
  if (self->_messageCopied)
    PBDataWriterWriteSubmessage();
  if (self->_linkClicked)
    PBDataWriterWriteSubmessage();
  if (self->_appLaunch)
    PBDataWriterWriteSubmessage();
  if (self->_appBackground)
    PBDataWriterWriteSubmessage();
  if (self->_appResume)
    PBDataWriterWriteSubmessage();
  if (self->_flagChanged)
    PBDataWriterWriteSubmessage();
  if (self->_readChanged)
    PBDataWriterWriteSubmessage();
  if (self->_messageViewStart)
    PBDataWriterWriteSubmessage();
  if (self->_messageViewEnd)
    PBDataWriterWriteSubmessage();
  if (self->_replyDraftStarted)
    PBDataWriterWriteSubmessage();
  if (self->_forwardDraftStarted)
    PBDataWriterWriteSubmessage();
  if (self->_replySent)
    PBDataWriterWriteSubmessage();
  if (self->_forwardSent)
    PBDataWriterWriteSubmessage();
  if (self->_markedMuteThread)
    PBDataWriterWriteSubmessage();
  if (self->_categoryMarked)
    PBDataWriterWriteSubmessage();
  if (self->_categoryInferred)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  char has;
  _DWORD *v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5[44] = self->_sequenceNumber;
    *((_BYTE *)v5 + 180) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)v5 + 1) = self->_timestamp;
  *((_BYTE *)v5 + 180) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5[14] = self->_eventName;
    *((_BYTE *)v5 + 180) |= 2u;
  }
LABEL_5:
  if (self->_messageFetched)
    objc_msgSend(v5, "setMessageFetched:");
  if (self->_messageSent)
    objc_msgSend(v5, "setMessageSent:");
  if (self->_messageMoved)
    objc_msgSend(v5, "setMessageMoved:");
  if (self->_messageCopied)
    objc_msgSend(v5, "setMessageCopied:");
  if (self->_linkClicked)
    objc_msgSend(v5, "setLinkClicked:");
  if (self->_appLaunch)
    objc_msgSend(v5, "setAppLaunch:");
  if (self->_appBackground)
    objc_msgSend(v5, "setAppBackground:");
  if (self->_appResume)
    objc_msgSend(v5, "setAppResume:");
  if (self->_flagChanged)
    objc_msgSend(v5, "setFlagChanged:");
  if (self->_readChanged)
    objc_msgSend(v5, "setReadChanged:");
  if (self->_messageViewStart)
    objc_msgSend(v5, "setMessageViewStart:");
  if (self->_messageViewEnd)
    objc_msgSend(v5, "setMessageViewEnd:");
  if (self->_replyDraftStarted)
    objc_msgSend(v5, "setReplyDraftStarted:");
  if (self->_forwardDraftStarted)
    objc_msgSend(v5, "setForwardDraftStarted:");
  if (self->_replySent)
    objc_msgSend(v5, "setReplySent:");
  if (self->_forwardSent)
    objc_msgSend(v5, "setForwardSent:");
  if (self->_markedMuteThread)
    objc_msgSend(v5, "setMarkedMuteThread:");
  if (self->_categoryMarked)
    objc_msgSend(v5, "setCategoryMarked:");
  if (self->_categoryInferred)
    objc_msgSend(v5, "setCategoryInferred:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 180) |= 1u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 176) = self->_sequenceNumber;
  *(_BYTE *)(v5 + 180) |= 4u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 56) = self->_eventName;
    *(_BYTE *)(v5 + 180) |= 2u;
  }
LABEL_5:
  v8 = -[EDPBInteractionEventMessageFetched copyWithZone:](self->_messageFetched, "copyWithZone:", a3);
  v9 = (void *)v6[14];
  v6[14] = v8;

  v10 = -[EDPBInteractionEventMessageSent copyWithZone:](self->_messageSent, "copyWithZone:", a3);
  v11 = (void *)v6[16];
  v6[16] = v10;

  v12 = -[EDPBInteractionEventMessageMoved copyWithZone:](self->_messageMoved, "copyWithZone:", a3);
  v13 = (void *)v6[15];
  v6[15] = v12;

  v14 = -[EDPBInteractionEventMessageCopied copyWithZone:](self->_messageCopied, "copyWithZone:", a3);
  v15 = (void *)v6[13];
  v6[13] = v14;

  v16 = -[EDPBInteractionEventLinkClicked copyWithZone:](self->_linkClicked, "copyWithZone:", a3);
  v17 = (void *)v6[11];
  v6[11] = v16;

  v18 = -[EDPBInteractionEventAppLaunch copyWithZone:](self->_appLaunch, "copyWithZone:", a3);
  v19 = (void *)v6[3];
  v6[3] = v18;

  v20 = -[EDPBInteractionEventAppBackground copyWithZone:](self->_appBackground, "copyWithZone:", a3);
  v21 = (void *)v6[2];
  v6[2] = v20;

  v22 = -[EDPBInteractionEventAppResume copyWithZone:](self->_appResume, "copyWithZone:", a3);
  v23 = (void *)v6[4];
  v6[4] = v22;

  v24 = -[EDPBInteractionEventFlagChanged copyWithZone:](self->_flagChanged, "copyWithZone:", a3);
  v25 = (void *)v6[8];
  v6[8] = v24;

  v26 = -[EDPBInteractionEventReadChanged copyWithZone:](self->_readChanged, "copyWithZone:", a3);
  v27 = (void *)v6[19];
  v6[19] = v26;

  v28 = -[EDPBInteractionEventMessageViewStart copyWithZone:](self->_messageViewStart, "copyWithZone:", a3);
  v29 = (void *)v6[18];
  v6[18] = v28;

  v30 = -[EDPBInteractionEventMessageViewEnd copyWithZone:](self->_messageViewEnd, "copyWithZone:", a3);
  v31 = (void *)v6[17];
  v6[17] = v30;

  v32 = -[EDPBInteractionEventReplyDraftStarted copyWithZone:](self->_replyDraftStarted, "copyWithZone:", a3);
  v33 = (void *)v6[20];
  v6[20] = v32;

  v34 = -[EDPBInteractionEventForwardDraftStarted copyWithZone:](self->_forwardDraftStarted, "copyWithZone:", a3);
  v35 = (void *)v6[9];
  v6[9] = v34;

  v36 = -[EDPBInteractionEventReplySent copyWithZone:](self->_replySent, "copyWithZone:", a3);
  v37 = (void *)v6[21];
  v6[21] = v36;

  v38 = -[EDPBInteractionEventForwardSent copyWithZone:](self->_forwardSent, "copyWithZone:", a3);
  v39 = (void *)v6[10];
  v6[10] = v38;

  v40 = -[EDPBInteractionEventMarkedMuteThread copyWithZone:](self->_markedMuteThread, "copyWithZone:", a3);
  v41 = (void *)v6[12];
  v6[12] = v40;

  v42 = -[EDPBInteractionEventCategoryMarked copyWithZone:](self->_categoryMarked, "copyWithZone:", a3);
  v43 = (void *)v6[6];
  v6[6] = v42;

  v44 = -[EDPBInteractionEventCategoryInferred copyWithZone:](self->_categoryInferred, "copyWithZone:", a3);
  v45 = (void *)v6[5];
  v6[5] = v44;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  EDPBInteractionEventMessageFetched *messageFetched;
  EDPBInteractionEventMessageSent *messageSent;
  EDPBInteractionEventMessageMoved *messageMoved;
  EDPBInteractionEventMessageCopied *messageCopied;
  EDPBInteractionEventLinkClicked *linkClicked;
  EDPBInteractionEventAppLaunch *appLaunch;
  EDPBInteractionEventAppBackground *appBackground;
  EDPBInteractionEventAppResume *appResume;
  EDPBInteractionEventFlagChanged *flagChanged;
  EDPBInteractionEventReadChanged *readChanged;
  EDPBInteractionEventMessageViewStart *messageViewStart;
  EDPBInteractionEventMessageViewEnd *messageViewEnd;
  EDPBInteractionEventReplyDraftStarted *replyDraftStarted;
  EDPBInteractionEventForwardDraftStarted *forwardDraftStarted;
  EDPBInteractionEventReplySent *replySent;
  EDPBInteractionEventForwardSent *forwardSent;
  EDPBInteractionEventMarkedMuteThread *markedMuteThread;
  EDPBInteractionEventCategoryMarked *categoryMarked;
  EDPBInteractionEventCategoryInferred *categoryInferred;
  char v24;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_55;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 180) & 4) == 0 || self->_sequenceNumber != *((_DWORD *)v4 + 44))
      goto LABEL_55;
  }
  else if ((*((_BYTE *)v4 + 180) & 4) != 0)
  {
LABEL_55:
    v24 = 0;
    goto LABEL_56;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 180) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_55;
  }
  else if ((*((_BYTE *)v4 + 180) & 1) != 0)
  {
    goto LABEL_55;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 180) & 2) == 0 || self->_eventName != *((_DWORD *)v4 + 14))
      goto LABEL_55;
  }
  else if ((*((_BYTE *)v4 + 180) & 2) != 0)
  {
    goto LABEL_55;
  }
  messageFetched = self->_messageFetched;
  if ((unint64_t)messageFetched | *((_QWORD *)v4 + 14)
    && !-[EDPBInteractionEventMessageFetched isEqual:](messageFetched, "isEqual:"))
  {
    goto LABEL_55;
  }
  messageSent = self->_messageSent;
  if ((unint64_t)messageSent | *((_QWORD *)v4 + 16))
  {
    if (!-[EDPBInteractionEventMessageSent isEqual:](messageSent, "isEqual:"))
      goto LABEL_55;
  }
  messageMoved = self->_messageMoved;
  if ((unint64_t)messageMoved | *((_QWORD *)v4 + 15))
  {
    if (!-[EDPBInteractionEventMessageMoved isEqual:](messageMoved, "isEqual:"))
      goto LABEL_55;
  }
  messageCopied = self->_messageCopied;
  if ((unint64_t)messageCopied | *((_QWORD *)v4 + 13))
  {
    if (!-[EDPBInteractionEventMessageCopied isEqual:](messageCopied, "isEqual:"))
      goto LABEL_55;
  }
  linkClicked = self->_linkClicked;
  if ((unint64_t)linkClicked | *((_QWORD *)v4 + 11))
  {
    if (!-[EDPBInteractionEventLinkClicked isEqual:](linkClicked, "isEqual:"))
      goto LABEL_55;
  }
  appLaunch = self->_appLaunch;
  if ((unint64_t)appLaunch | *((_QWORD *)v4 + 3))
  {
    if (!-[EDPBInteractionEventAppLaunch isEqual:](appLaunch, "isEqual:"))
      goto LABEL_55;
  }
  appBackground = self->_appBackground;
  if ((unint64_t)appBackground | *((_QWORD *)v4 + 2))
  {
    if (!-[EDPBInteractionEventAppBackground isEqual:](appBackground, "isEqual:"))
      goto LABEL_55;
  }
  appResume = self->_appResume;
  if ((unint64_t)appResume | *((_QWORD *)v4 + 4))
  {
    if (!-[EDPBInteractionEventAppResume isEqual:](appResume, "isEqual:"))
      goto LABEL_55;
  }
  flagChanged = self->_flagChanged;
  if ((unint64_t)flagChanged | *((_QWORD *)v4 + 8))
  {
    if (!-[EDPBInteractionEventFlagChanged isEqual:](flagChanged, "isEqual:"))
      goto LABEL_55;
  }
  readChanged = self->_readChanged;
  if ((unint64_t)readChanged | *((_QWORD *)v4 + 19))
  {
    if (!-[EDPBInteractionEventReadChanged isEqual:](readChanged, "isEqual:"))
      goto LABEL_55;
  }
  messageViewStart = self->_messageViewStart;
  if ((unint64_t)messageViewStart | *((_QWORD *)v4 + 18))
  {
    if (!-[EDPBInteractionEventMessageViewStart isEqual:](messageViewStart, "isEqual:"))
      goto LABEL_55;
  }
  messageViewEnd = self->_messageViewEnd;
  if ((unint64_t)messageViewEnd | *((_QWORD *)v4 + 17))
  {
    if (!-[EDPBInteractionEventMessageViewEnd isEqual:](messageViewEnd, "isEqual:"))
      goto LABEL_55;
  }
  replyDraftStarted = self->_replyDraftStarted;
  if ((unint64_t)replyDraftStarted | *((_QWORD *)v4 + 20))
  {
    if (!-[EDPBInteractionEventReplyDraftStarted isEqual:](replyDraftStarted, "isEqual:"))
      goto LABEL_55;
  }
  forwardDraftStarted = self->_forwardDraftStarted;
  if ((unint64_t)forwardDraftStarted | *((_QWORD *)v4 + 9))
  {
    if (!-[EDPBInteractionEventForwardDraftStarted isEqual:](forwardDraftStarted, "isEqual:"))
      goto LABEL_55;
  }
  replySent = self->_replySent;
  if ((unint64_t)replySent | *((_QWORD *)v4 + 21))
  {
    if (!-[EDPBInteractionEventReplySent isEqual:](replySent, "isEqual:"))
      goto LABEL_55;
  }
  forwardSent = self->_forwardSent;
  if ((unint64_t)forwardSent | *((_QWORD *)v4 + 10))
  {
    if (!-[EDPBInteractionEventForwardSent isEqual:](forwardSent, "isEqual:"))
      goto LABEL_55;
  }
  markedMuteThread = self->_markedMuteThread;
  if ((unint64_t)markedMuteThread | *((_QWORD *)v4 + 12))
  {
    if (!-[EDPBInteractionEventMarkedMuteThread isEqual:](markedMuteThread, "isEqual:"))
      goto LABEL_55;
  }
  categoryMarked = self->_categoryMarked;
  if ((unint64_t)categoryMarked | *((_QWORD *)v4 + 6))
  {
    if (!-[EDPBInteractionEventCategoryMarked isEqual:](categoryMarked, "isEqual:"))
      goto LABEL_55;
  }
  categoryInferred = self->_categoryInferred;
  if ((unint64_t)categoryInferred | *((_QWORD *)v4 + 5))
    v24 = -[EDPBInteractionEventCategoryInferred isEqual:](categoryInferred, "isEqual:");
  else
    v24 = 1;
LABEL_56:

  return v24;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;

  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v3 = 2654435761 * self->_sequenceNumber;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761u * self->_timestamp;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_eventName;
LABEL_8:
  v6 = v4 ^ v3 ^ v5 ^ -[EDPBInteractionEventMessageFetched hash](self->_messageFetched, "hash");
  v7 = -[EDPBInteractionEventMessageSent hash](self->_messageSent, "hash");
  v8 = v6 ^ v7 ^ -[EDPBInteractionEventMessageMoved hash](self->_messageMoved, "hash");
  v9 = -[EDPBInteractionEventMessageCopied hash](self->_messageCopied, "hash");
  v10 = v9 ^ -[EDPBInteractionEventLinkClicked hash](self->_linkClicked, "hash");
  v11 = v8 ^ v10 ^ -[EDPBInteractionEventAppLaunch hash](self->_appLaunch, "hash");
  v12 = -[EDPBInteractionEventAppBackground hash](self->_appBackground, "hash");
  v13 = v12 ^ -[EDPBInteractionEventAppResume hash](self->_appResume, "hash");
  v14 = v13 ^ -[EDPBInteractionEventFlagChanged hash](self->_flagChanged, "hash");
  v15 = v11 ^ v14 ^ -[EDPBInteractionEventReadChanged hash](self->_readChanged, "hash");
  v16 = -[EDPBInteractionEventMessageViewStart hash](self->_messageViewStart, "hash");
  v17 = v16 ^ -[EDPBInteractionEventMessageViewEnd hash](self->_messageViewEnd, "hash");
  v18 = v17 ^ -[EDPBInteractionEventReplyDraftStarted hash](self->_replyDraftStarted, "hash");
  v19 = v18 ^ -[EDPBInteractionEventForwardDraftStarted hash](self->_forwardDraftStarted, "hash");
  v20 = v15 ^ v19 ^ -[EDPBInteractionEventReplySent hash](self->_replySent, "hash");
  v21 = -[EDPBInteractionEventForwardSent hash](self->_forwardSent, "hash");
  v22 = v21 ^ -[EDPBInteractionEventMarkedMuteThread hash](self->_markedMuteThread, "hash");
  v23 = v22 ^ -[EDPBInteractionEventCategoryMarked hash](self->_categoryMarked, "hash");
  return v20 ^ v23 ^ -[EDPBInteractionEventCategoryInferred hash](self->_categoryInferred, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v4;
  EDPBInteractionEventMessageFetched *messageFetched;
  uint64_t v6;
  EDPBInteractionEventMessageSent *messageSent;
  uint64_t v8;
  EDPBInteractionEventMessageMoved *messageMoved;
  uint64_t v10;
  EDPBInteractionEventMessageCopied *messageCopied;
  uint64_t v12;
  EDPBInteractionEventLinkClicked *linkClicked;
  uint64_t v14;
  EDPBInteractionEventAppLaunch *appLaunch;
  uint64_t v16;
  EDPBInteractionEventAppBackground *appBackground;
  uint64_t v18;
  EDPBInteractionEventAppResume *appResume;
  uint64_t v20;
  EDPBInteractionEventFlagChanged *flagChanged;
  uint64_t v22;
  EDPBInteractionEventReadChanged *readChanged;
  uint64_t v24;
  EDPBInteractionEventMessageViewStart *messageViewStart;
  uint64_t v26;
  EDPBInteractionEventMessageViewEnd *messageViewEnd;
  uint64_t v28;
  EDPBInteractionEventReplyDraftStarted *replyDraftStarted;
  uint64_t v30;
  EDPBInteractionEventForwardDraftStarted *forwardDraftStarted;
  uint64_t v32;
  EDPBInteractionEventReplySent *replySent;
  uint64_t v34;
  EDPBInteractionEventForwardSent *forwardSent;
  uint64_t v36;
  EDPBInteractionEventMarkedMuteThread *markedMuteThread;
  uint64_t v38;
  EDPBInteractionEventCategoryMarked *categoryMarked;
  uint64_t v40;
  EDPBInteractionEventCategoryInferred *categoryInferred;
  uint64_t v42;
  id v43;

  v43 = a3;
  v4 = *((_BYTE *)v43 + 180);
  if ((v4 & 4) != 0)
  {
    self->_sequenceNumber = *((_DWORD *)v43 + 44);
    *(_BYTE *)&self->_has |= 4u;
    v4 = *((_BYTE *)v43 + 180);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v43 + 180) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_timestamp = *((_QWORD *)v43 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v43 + 180) & 2) != 0)
  {
LABEL_4:
    self->_eventName = *((_DWORD *)v43 + 14);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_5:
  messageFetched = self->_messageFetched;
  v6 = *((_QWORD *)v43 + 14);
  if (messageFetched)
  {
    if (v6)
      -[EDPBInteractionEventMessageFetched mergeFrom:](messageFetched, "mergeFrom:");
  }
  else if (v6)
  {
    -[EDPBInteractionEvent setMessageFetched:](self, "setMessageFetched:");
  }
  messageSent = self->_messageSent;
  v8 = *((_QWORD *)v43 + 16);
  if (messageSent)
  {
    if (v8)
      -[EDPBInteractionEventMessageSent mergeFrom:](messageSent, "mergeFrom:");
  }
  else if (v8)
  {
    -[EDPBInteractionEvent setMessageSent:](self, "setMessageSent:");
  }
  messageMoved = self->_messageMoved;
  v10 = *((_QWORD *)v43 + 15);
  if (messageMoved)
  {
    if (v10)
      -[EDPBInteractionEventMessageMoved mergeFrom:](messageMoved, "mergeFrom:");
  }
  else if (v10)
  {
    -[EDPBInteractionEvent setMessageMoved:](self, "setMessageMoved:");
  }
  messageCopied = self->_messageCopied;
  v12 = *((_QWORD *)v43 + 13);
  if (messageCopied)
  {
    if (v12)
      -[EDPBInteractionEventMessageCopied mergeFrom:](messageCopied, "mergeFrom:");
  }
  else if (v12)
  {
    -[EDPBInteractionEvent setMessageCopied:](self, "setMessageCopied:");
  }
  linkClicked = self->_linkClicked;
  v14 = *((_QWORD *)v43 + 11);
  if (linkClicked)
  {
    if (v14)
      -[EDPBInteractionEventLinkClicked mergeFrom:](linkClicked, "mergeFrom:");
  }
  else if (v14)
  {
    -[EDPBInteractionEvent setLinkClicked:](self, "setLinkClicked:");
  }
  appLaunch = self->_appLaunch;
  v16 = *((_QWORD *)v43 + 3);
  if (appLaunch)
  {
    if (v16)
      -[EDPBInteractionEventAppLaunch mergeFrom:](appLaunch, "mergeFrom:");
  }
  else if (v16)
  {
    -[EDPBInteractionEvent setAppLaunch:](self, "setAppLaunch:");
  }
  appBackground = self->_appBackground;
  v18 = *((_QWORD *)v43 + 2);
  if (appBackground)
  {
    if (v18)
      -[EDPBInteractionEventAppBackground mergeFrom:](appBackground, "mergeFrom:");
  }
  else if (v18)
  {
    -[EDPBInteractionEvent setAppBackground:](self, "setAppBackground:");
  }
  appResume = self->_appResume;
  v20 = *((_QWORD *)v43 + 4);
  if (appResume)
  {
    if (v20)
      -[EDPBInteractionEventAppResume mergeFrom:](appResume, "mergeFrom:");
  }
  else if (v20)
  {
    -[EDPBInteractionEvent setAppResume:](self, "setAppResume:");
  }
  flagChanged = self->_flagChanged;
  v22 = *((_QWORD *)v43 + 8);
  if (flagChanged)
  {
    if (v22)
      -[EDPBInteractionEventFlagChanged mergeFrom:](flagChanged, "mergeFrom:");
  }
  else if (v22)
  {
    -[EDPBInteractionEvent setFlagChanged:](self, "setFlagChanged:");
  }
  readChanged = self->_readChanged;
  v24 = *((_QWORD *)v43 + 19);
  if (readChanged)
  {
    if (v24)
      -[EDPBInteractionEventReadChanged mergeFrom:](readChanged, "mergeFrom:");
  }
  else if (v24)
  {
    -[EDPBInteractionEvent setReadChanged:](self, "setReadChanged:");
  }
  messageViewStart = self->_messageViewStart;
  v26 = *((_QWORD *)v43 + 18);
  if (messageViewStart)
  {
    if (v26)
      -[EDPBInteractionEventMessageViewStart mergeFrom:](messageViewStart, "mergeFrom:");
  }
  else if (v26)
  {
    -[EDPBInteractionEvent setMessageViewStart:](self, "setMessageViewStart:");
  }
  messageViewEnd = self->_messageViewEnd;
  v28 = *((_QWORD *)v43 + 17);
  if (messageViewEnd)
  {
    if (v28)
      -[EDPBInteractionEventMessageViewEnd mergeFrom:](messageViewEnd, "mergeFrom:");
  }
  else if (v28)
  {
    -[EDPBInteractionEvent setMessageViewEnd:](self, "setMessageViewEnd:");
  }
  replyDraftStarted = self->_replyDraftStarted;
  v30 = *((_QWORD *)v43 + 20);
  if (replyDraftStarted)
  {
    if (v30)
      -[EDPBInteractionEventReplyDraftStarted mergeFrom:](replyDraftStarted, "mergeFrom:");
  }
  else if (v30)
  {
    -[EDPBInteractionEvent setReplyDraftStarted:](self, "setReplyDraftStarted:");
  }
  forwardDraftStarted = self->_forwardDraftStarted;
  v32 = *((_QWORD *)v43 + 9);
  if (forwardDraftStarted)
  {
    if (v32)
      -[EDPBInteractionEventForwardDraftStarted mergeFrom:](forwardDraftStarted, "mergeFrom:");
  }
  else if (v32)
  {
    -[EDPBInteractionEvent setForwardDraftStarted:](self, "setForwardDraftStarted:");
  }
  replySent = self->_replySent;
  v34 = *((_QWORD *)v43 + 21);
  if (replySent)
  {
    if (v34)
      -[EDPBInteractionEventReplySent mergeFrom:](replySent, "mergeFrom:");
  }
  else if (v34)
  {
    -[EDPBInteractionEvent setReplySent:](self, "setReplySent:");
  }
  forwardSent = self->_forwardSent;
  v36 = *((_QWORD *)v43 + 10);
  if (forwardSent)
  {
    if (v36)
      -[EDPBInteractionEventForwardSent mergeFrom:](forwardSent, "mergeFrom:");
  }
  else if (v36)
  {
    -[EDPBInteractionEvent setForwardSent:](self, "setForwardSent:");
  }
  markedMuteThread = self->_markedMuteThread;
  v38 = *((_QWORD *)v43 + 12);
  if (markedMuteThread)
  {
    if (v38)
      -[EDPBInteractionEventMarkedMuteThread mergeFrom:](markedMuteThread, "mergeFrom:");
  }
  else if (v38)
  {
    -[EDPBInteractionEvent setMarkedMuteThread:](self, "setMarkedMuteThread:");
  }
  categoryMarked = self->_categoryMarked;
  v40 = *((_QWORD *)v43 + 6);
  if (categoryMarked)
  {
    if (v40)
      -[EDPBInteractionEventCategoryMarked mergeFrom:](categoryMarked, "mergeFrom:");
  }
  else if (v40)
  {
    -[EDPBInteractionEvent setCategoryMarked:](self, "setCategoryMarked:");
  }
  categoryInferred = self->_categoryInferred;
  v42 = *((_QWORD *)v43 + 5);
  if (categoryInferred)
  {
    if (v42)
      -[EDPBInteractionEventCategoryInferred mergeFrom:](categoryInferred, "mergeFrom:");
  }
  else if (v42)
  {
    -[EDPBInteractionEvent setCategoryInferred:](self, "setCategoryInferred:");
  }

}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (EDPBInteractionEventMessageFetched)messageFetched
{
  return self->_messageFetched;
}

- (void)setMessageFetched:(id)a3
{
  objc_storeStrong((id *)&self->_messageFetched, a3);
}

- (EDPBInteractionEventMessageSent)messageSent
{
  return self->_messageSent;
}

- (void)setMessageSent:(id)a3
{
  objc_storeStrong((id *)&self->_messageSent, a3);
}

- (EDPBInteractionEventMessageMoved)messageMoved
{
  return self->_messageMoved;
}

- (void)setMessageMoved:(id)a3
{
  objc_storeStrong((id *)&self->_messageMoved, a3);
}

- (EDPBInteractionEventMessageCopied)messageCopied
{
  return self->_messageCopied;
}

- (void)setMessageCopied:(id)a3
{
  objc_storeStrong((id *)&self->_messageCopied, a3);
}

- (EDPBInteractionEventLinkClicked)linkClicked
{
  return self->_linkClicked;
}

- (void)setLinkClicked:(id)a3
{
  objc_storeStrong((id *)&self->_linkClicked, a3);
}

- (EDPBInteractionEventAppLaunch)appLaunch
{
  return self->_appLaunch;
}

- (void)setAppLaunch:(id)a3
{
  objc_storeStrong((id *)&self->_appLaunch, a3);
}

- (EDPBInteractionEventAppBackground)appBackground
{
  return self->_appBackground;
}

- (void)setAppBackground:(id)a3
{
  objc_storeStrong((id *)&self->_appBackground, a3);
}

- (EDPBInteractionEventAppResume)appResume
{
  return self->_appResume;
}

- (void)setAppResume:(id)a3
{
  objc_storeStrong((id *)&self->_appResume, a3);
}

- (EDPBInteractionEventFlagChanged)flagChanged
{
  return self->_flagChanged;
}

- (void)setFlagChanged:(id)a3
{
  objc_storeStrong((id *)&self->_flagChanged, a3);
}

- (EDPBInteractionEventReadChanged)readChanged
{
  return self->_readChanged;
}

- (void)setReadChanged:(id)a3
{
  objc_storeStrong((id *)&self->_readChanged, a3);
}

- (EDPBInteractionEventMessageViewStart)messageViewStart
{
  return self->_messageViewStart;
}

- (void)setMessageViewStart:(id)a3
{
  objc_storeStrong((id *)&self->_messageViewStart, a3);
}

- (EDPBInteractionEventMessageViewEnd)messageViewEnd
{
  return self->_messageViewEnd;
}

- (void)setMessageViewEnd:(id)a3
{
  objc_storeStrong((id *)&self->_messageViewEnd, a3);
}

- (EDPBInteractionEventReplyDraftStarted)replyDraftStarted
{
  return self->_replyDraftStarted;
}

- (void)setReplyDraftStarted:(id)a3
{
  objc_storeStrong((id *)&self->_replyDraftStarted, a3);
}

- (EDPBInteractionEventForwardDraftStarted)forwardDraftStarted
{
  return self->_forwardDraftStarted;
}

- (void)setForwardDraftStarted:(id)a3
{
  objc_storeStrong((id *)&self->_forwardDraftStarted, a3);
}

- (EDPBInteractionEventReplySent)replySent
{
  return self->_replySent;
}

- (void)setReplySent:(id)a3
{
  objc_storeStrong((id *)&self->_replySent, a3);
}

- (EDPBInteractionEventForwardSent)forwardSent
{
  return self->_forwardSent;
}

- (void)setForwardSent:(id)a3
{
  objc_storeStrong((id *)&self->_forwardSent, a3);
}

- (EDPBInteractionEventMarkedMuteThread)markedMuteThread
{
  return self->_markedMuteThread;
}

- (void)setMarkedMuteThread:(id)a3
{
  objc_storeStrong((id *)&self->_markedMuteThread, a3);
}

- (EDPBInteractionEventCategoryMarked)categoryMarked
{
  return self->_categoryMarked;
}

- (void)setCategoryMarked:(id)a3
{
  objc_storeStrong((id *)&self->_categoryMarked, a3);
}

- (EDPBInteractionEventCategoryInferred)categoryInferred
{
  return self->_categoryInferred;
}

- (void)setCategoryInferred:(id)a3
{
  objc_storeStrong((id *)&self->_categoryInferred, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replySent, 0);
  objc_storeStrong((id *)&self->_replyDraftStarted, 0);
  objc_storeStrong((id *)&self->_readChanged, 0);
  objc_storeStrong((id *)&self->_messageViewStart, 0);
  objc_storeStrong((id *)&self->_messageViewEnd, 0);
  objc_storeStrong((id *)&self->_messageSent, 0);
  objc_storeStrong((id *)&self->_messageMoved, 0);
  objc_storeStrong((id *)&self->_messageFetched, 0);
  objc_storeStrong((id *)&self->_messageCopied, 0);
  objc_storeStrong((id *)&self->_markedMuteThread, 0);
  objc_storeStrong((id *)&self->_linkClicked, 0);
  objc_storeStrong((id *)&self->_forwardSent, 0);
  objc_storeStrong((id *)&self->_forwardDraftStarted, 0);
  objc_storeStrong((id *)&self->_flagChanged, 0);
  objc_storeStrong((id *)&self->_categoryMarked, 0);
  objc_storeStrong((id *)&self->_categoryInferred, 0);
  objc_storeStrong((id *)&self->_appResume, 0);
  objc_storeStrong((id *)&self->_appLaunch, 0);
  objc_storeStrong((id *)&self->_appBackground, 0);
}

@end
