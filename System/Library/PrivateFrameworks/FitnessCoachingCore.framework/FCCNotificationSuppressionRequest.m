@implementation FCCNotificationSuppressionRequest

- (FCCNotificationSuppressionRequest)initWithIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  FCCNotificationSuppressionRequest *v8;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", 3600.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCCNotificationSuppressionRequest initWithIdentifier:expirationDate:](self, "initWithIdentifier:expirationDate:", v5, v7);

  return v8;
}

- (FCCNotificationSuppressionRequest)initWithIdentifier:(id)a3 expirationDate:(id)a4
{
  id v7;
  id v8;
  FCCNotificationSuppressionRequest *v9;
  FCCNotificationSuppressionRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCCNotificationSuppressionRequest;
  v9 = -[FCCNotificationSuppressionRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_expirationDate, a4);
  }

  return v10;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FCCNotificationSuppressionRequest: identifier: %@, expirationDate: %@"), self->_identifier, self->_expirationDate);
}

- (FCCNotificationSuppressionRequest)initWithTransportData:(id)a3
{
  id v4;
  FCCNotificationSuppressionRequestProtobuf *v5;
  void *v6;
  id v7;
  void *v8;
  FCCNotificationSuppressionRequest *v9;

  v4 = a3;
  v5 = -[FCCNotificationSuppressionRequestProtobuf initWithData:]([FCCNotificationSuppressionRequestProtobuf alloc], "initWithData:", v4);

  -[FCCNotificationSuppressionRequestProtobuf identifier](v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[FCCNotificationSuppressionRequestProtobuf hasExpirationDate](v5, "hasExpirationDate"))
  {
    v7 = objc_alloc(MEMORY[0x1E0C99D68]);
    -[FCCNotificationSuppressionRequestProtobuf expirationDate](v5, "expirationDate");
    v8 = (void *)objc_msgSend(v7, "initWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    v8 = 0;
  }
  v9 = -[FCCNotificationSuppressionRequest initWithIdentifier:expirationDate:](self, "initWithIdentifier:expirationDate:", v6, v8);

  return v9;
}

- (id)transportData
{
  FCCNotificationSuppressionRequestProtobuf *v3;
  void *v4;

  v3 = objc_alloc_init(FCCNotificationSuppressionRequestProtobuf);
  -[FCCNotificationSuppressionRequestProtobuf setIdentifier:](v3, "setIdentifier:", self->_identifier);
  -[NSDate timeIntervalSinceReferenceDate](self->_expirationDate, "timeIntervalSinceReferenceDate");
  -[FCCNotificationSuppressionRequestProtobuf setExpirationDate:](v3, "setExpirationDate:");
  -[FCCNotificationSuppressionRequestProtobuf data](v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
