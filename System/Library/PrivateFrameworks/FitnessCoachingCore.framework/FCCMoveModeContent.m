@implementation FCCMoveModeContent

- (FCCMoveModeContent)initWithNotificationType:(int64_t)a3 nextActivityMoveMode:(int64_t)a4 nextActivityMoveModeStartDate:(id)a5 delay:(double)a6
{
  id v11;
  FCCMoveModeContent *v12;
  FCCMoveModeContent *v13;
  objc_super v15;

  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FCCMoveModeContent;
  v12 = -[FCCMoveModeContent init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_notificationType = a3;
    v12->_nextActivityMoveMode = a4;
    objc_storeStrong((id *)&v12->_nextActivityMoveModeStartDate, a5);
    v13->_delay = a6;
  }

  return v13;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FCCMoveModeContent: notificationType %ld nextActivityMoveMode %ld nextActivityMoveModeStartDate %@ delay %f@"), self->_notificationType, self->_nextActivityMoveMode, self->_nextActivityMoveModeStartDate, *(_QWORD *)&self->_delay);
}

- (FCCMoveModeContent)initWithTransportData:(id)a3
{
  id v4;
  FCCMoveModeProtobuf *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  FCCMoveModeContent *v10;

  v4 = a3;
  v5 = -[FCCMoveModeProtobuf initWithData:]([FCCMoveModeProtobuf alloc], "initWithData:", v4);

  v6 = -[FCCMoveModeProtobuf notificationType](v5, "notificationType");
  v7 = -[FCCMoveModeProtobuf nextActivityMoveMode](v5, "nextActivityMoveMode");
  v8 = (void *)MEMORY[0x1E0C99D68];
  -[FCCMoveModeProtobuf nextActivityMoveModeStartDate](v5, "nextActivityMoveModeStartDate");
  objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FCCMoveModeContent initWithNotificationType:nextActivityMoveMode:nextActivityMoveModeStartDate:delay:](self, "initWithNotificationType:nextActivityMoveMode:nextActivityMoveModeStartDate:delay:", v6, v7, v9, (double)-[FCCMoveModeProtobuf delay](v5, "delay"));

  return v10;
}

- (id)transportData
{
  FCCMoveModeProtobuf *v3;
  void *v4;

  v3 = objc_alloc_init(FCCMoveModeProtobuf);
  -[FCCMoveModeProtobuf setNotificationType:](v3, "setNotificationType:", self->_notificationType);
  -[FCCMoveModeProtobuf setNextActivityMoveMode:](v3, "setNextActivityMoveMode:", self->_nextActivityMoveMode);
  -[NSDate timeIntervalSinceReferenceDate](self->_nextActivityMoveModeStartDate, "timeIntervalSinceReferenceDate");
  -[FCCMoveModeProtobuf setNextActivityMoveModeStartDate:](v3, "setNextActivityMoveModeStartDate:");
  -[FCCMoveModeProtobuf setDelay:](v3, "setDelay:", (int)self->_delay);
  -[FCCMoveModeProtobuf data](v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)notificationType
{
  return self->_notificationType;
}

- (int64_t)nextActivityMoveMode
{
  return self->_nextActivityMoveMode;
}

- (NSDate)nextActivityMoveModeStartDate
{
  return self->_nextActivityMoveModeStartDate;
}

- (double)delay
{
  return self->_delay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextActivityMoveModeStartDate, 0);
}

@end
