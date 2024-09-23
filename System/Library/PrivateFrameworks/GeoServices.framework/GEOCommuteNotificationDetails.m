@implementation GEOCommuteNotificationDetails

- (GEOCommuteNotificationDetails)init
{
  GEOCommuteNotificationDetails *result;

  result = (GEOCommuteNotificationDetails *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOCommuteNotificationDetails)initWithTitle:(id)a3 message:(id)a4 commuteDetailsIdentifier:(id)a5 expirationDate:(id)a6 score:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  GEOCommuteNotificationDetails *v16;
  uint64_t v17;
  NSString *title;
  uint64_t v19;
  NSString *message;
  uint64_t v21;
  NSString *commuteDetailsIdentifier;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v24.receiver = self;
  v24.super_class = (Class)GEOCommuteNotificationDetails;
  v16 = -[GEOCommuteNotificationDetails init](&v24, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    title = v16->_title;
    v16->_title = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    message = v16->_message;
    v16->_message = (NSString *)v19;

    v21 = objc_msgSend(v14, "copy");
    commuteDetailsIdentifier = v16->_commuteDetailsIdentifier;
    v16->_commuteDetailsIdentifier = (NSString *)v21;

    objc_storeStrong((id *)&v16->_expirationDate, a6);
    v16->_score = a7;
  }

  return v16;
}

- (id)description
{
  NSString *title;
  int64_t score;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  NSString *v9;
  __int128 v10;
  NSDate *expirationDate;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  title = self->_title;
  v8[0] = CFSTR("title");
  v8[1] = CFSTR("message");
  v10 = *(_OWORD *)&self->_message;
  v8[2] = CFSTR("identifier");
  v8[3] = CFSTR("expiration date");
  score = self->_score;
  expirationDate = self->_expirationDate;
  v8[4] = CFSTR("score");
  v9 = title;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", score);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, v8, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (GEOCommuteNotificationDetails)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  GEOCommuteNotificationDetails *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TitleKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MessageKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CommuteDetailsIdentifierKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ExpirationDateKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ScoreKey"));

  v10 = -[GEOCommuteNotificationDetails initWithTitle:message:commuteDetailsIdentifier:expirationDate:score:](self, "initWithTitle:message:commuteDetailsIdentifier:expirationDate:score:", v5, v6, v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("TitleKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_message, CFSTR("MessageKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_commuteDetailsIdentifier, CFSTR("CommuteDetailsIdentifierKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("ExpirationDateKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_score, CFSTR("ScoreKey"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (NSString)commuteDetailsIdentifier
{
  return self->_commuteDetailsIdentifier;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (int64_t)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_commuteDetailsIdentifier, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
