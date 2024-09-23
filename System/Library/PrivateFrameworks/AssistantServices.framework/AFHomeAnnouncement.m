@implementation AFHomeAnnouncement

- (AFHomeAnnouncement)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFHomeAnnouncementMutation *);
  AFHomeAnnouncement *v5;
  AFHomeAnnouncement *v6;
  _AFHomeAnnouncementMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *identifier;
  void *v11;
  uint64_t v12;
  NSDate *startedDate;
  void *v14;
  uint64_t v15;
  NSDate *finishedDate;
  objc_super v18;

  v4 = (void (**)(id, _AFHomeAnnouncementMutation *))a3;
  v18.receiver = self;
  v18.super_class = (Class)AFHomeAnnouncement;
  v5 = -[AFHomeAnnouncement init](&v18, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFHomeAnnouncementMutation initWithBase:]([_AFHomeAnnouncementMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFHomeAnnouncementMutation isDirty](v7, "isDirty"))
    {
      -[_AFHomeAnnouncementMutation getIdentifier](v7, "getIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v9;

      v6->_startedHostTime = -[_AFHomeAnnouncementMutation getStartedHostTime](v7, "getStartedHostTime");
      v6->_finishedHostTime = -[_AFHomeAnnouncementMutation getFinishedHostTime](v7, "getFinishedHostTime");
      -[_AFHomeAnnouncementMutation getStartedDate](v7, "getStartedDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      startedDate = v6->_startedDate;
      v6->_startedDate = (NSDate *)v12;

      -[_AFHomeAnnouncementMutation getFinishedDate](v7, "getFinishedDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      finishedDate = v6->_finishedDate;
      v6->_finishedDate = (NSDate *)v15;

    }
  }

  return v6;
}

- (AFHomeAnnouncement)init
{
  return -[AFHomeAnnouncement initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFHomeAnnouncement)initWithIdentifier:(id)a3 startedHostTime:(unint64_t)a4 finishedHostTime:(unint64_t)a5 startedDate:(id)a6 finishedDate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  AFHomeAnnouncement *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  unint64_t v24;
  unint64_t v25;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __99__AFHomeAnnouncement_initWithIdentifier_startedHostTime_finishedHostTime_startedDate_finishedDate___block_invoke;
  v20[3] = &unk_1E3A33358;
  v24 = a4;
  v25 = a5;
  v21 = v12;
  v22 = v13;
  v23 = v14;
  v15 = v14;
  v16 = v13;
  v17 = v12;
  v18 = -[AFHomeAnnouncement initWithBuilder:](self, "initWithBuilder:", v20);

  return v18;
}

- (NSString)description
{
  return (NSString *)-[AFHomeAnnouncement _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFHomeAnnouncement;
  -[AFHomeAnnouncement description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {identifier = %@, startedHostTime = %llu, finishedHostTime = %llu, startedDate = %@, finishedDate = %@}"), v5, self->_identifier, self->_startedHostTime, self->_finishedHostTime, self->_startedDate, self->_finishedDate);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v3 = -[NSString hash](self->_identifier, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_startedHostTime);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_finishedHostTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  v8 = v5 ^ v7 ^ -[NSDate hash](self->_startedDate, "hash");
  v9 = v8 ^ -[NSDate hash](self->_finishedDate, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  AFHomeAnnouncement *v4;
  AFHomeAnnouncement *v5;
  unint64_t startedHostTime;
  unint64_t finishedHostTime;
  NSString *v8;
  NSString *identifier;
  NSDate *v10;
  NSDate *startedDate;
  NSDate *v12;
  NSDate *finishedDate;
  BOOL v14;

  v4 = (AFHomeAnnouncement *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      startedHostTime = self->_startedHostTime;
      if (startedHostTime == -[AFHomeAnnouncement startedHostTime](v5, "startedHostTime")
        && (finishedHostTime = self->_finishedHostTime,
            finishedHostTime == -[AFHomeAnnouncement finishedHostTime](v5, "finishedHostTime")))
      {
        -[AFHomeAnnouncement identifier](v5, "identifier");
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        identifier = self->_identifier;
        if (identifier == v8 || -[NSString isEqual:](identifier, "isEqual:", v8))
        {
          -[AFHomeAnnouncement startedDate](v5, "startedDate");
          v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
          startedDate = self->_startedDate;
          if (startedDate == v10 || -[NSDate isEqual:](startedDate, "isEqual:", v10))
          {
            -[AFHomeAnnouncement finishedDate](v5, "finishedDate");
            v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
            finishedDate = self->_finishedDate;
            v14 = finishedDate == v12 || -[NSDate isEqual:](finishedDate, "isEqual:", v12);

          }
          else
          {
            v14 = 0;
          }

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (AFHomeAnnouncement)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  AFHomeAnnouncement *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAnnouncement::identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAnnouncement::startedHostTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedLongLongValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAnnouncement::finishedHostTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedLongLongValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAnnouncement::startedDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAnnouncement::finishedDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[AFHomeAnnouncement initWithIdentifier:startedHostTime:finishedHostTime:startedDate:finishedDate:](self, "initWithIdentifier:startedHostTime:finishedHostTime:startedDate:finishedDate:", v5, v7, v9, v10, v11);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  void *v5;
  void *v6;
  id v7;

  identifier = self->_identifier;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", identifier, CFSTR("AFHomeAnnouncement::identifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_startedHostTime);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("AFHomeAnnouncement::startedHostTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_finishedHostTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("AFHomeAnnouncement::finishedHostTime"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_startedDate, CFSTR("AFHomeAnnouncement::startedDate"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_finishedDate, CFSTR("AFHomeAnnouncement::finishedDate"));

}

- (AFHomeAnnouncement)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  AFHomeAnnouncement *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("startedHostTime"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    v11 = objc_msgSend(v10, "unsignedLongLongValue");
    objc_msgSend(v5, "objectForKey:", CFSTR("finishedHostTime"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    v14 = objc_msgSend(v13, "unsignedLongLongValue");
    objc_msgSend(v5, "objectForKey:", CFSTR("startedDate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("finishedDate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;

    self = -[AFHomeAnnouncement initWithIdentifier:startedHostTime:finishedHostTime:startedDate:finishedDate:](self, "initWithIdentifier:startedHostTime:finishedHostTime:startedDate:finishedDate:", v7, v11, v14, v16, v18);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)buildDictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *identifier;
  void *v6;
  void *v7;
  NSDate *startedDate;
  NSDate *finishedDate;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_startedHostTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("startedHostTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_finishedHostTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("finishedHostTime"));

  startedDate = self->_startedDate;
  if (startedDate)
    objc_msgSend(v4, "setObject:forKey:", startedDate, CFSTR("startedDate"));
  finishedDate = self->_finishedDate;
  if (finishedDate)
    objc_msgSend(v4, "setObject:forKey:", finishedDate, CFSTR("finishedDate"));
  v10 = (void *)objc_msgSend(v4, "copy");

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)startedHostTime
{
  return self->_startedHostTime;
}

- (unint64_t)finishedHostTime
{
  return self->_finishedHostTime;
}

- (NSDate)startedDate
{
  return self->_startedDate;
}

- (NSDate)finishedDate
{
  return self->_finishedDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedDate, 0);
  objc_storeStrong((id *)&self->_startedDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __99__AFHomeAnnouncement_initWithIdentifier_startedHostTime_finishedHostTime_startedDate_finishedDate___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setIdentifier:", v3);
  objc_msgSend(v4, "setStartedHostTime:", a1[7]);
  objc_msgSend(v4, "setFinishedHostTime:", a1[8]);
  objc_msgSend(v4, "setStartedDate:", a1[5]);
  objc_msgSend(v4, "setFinishedDate:", a1[6]);

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFHomeAnnouncementMutation *);
  _AFHomeAnnouncementMutation *v5;
  AFHomeAnnouncement *v6;
  void *v7;
  uint64_t v8;
  NSString *identifier;
  void *v10;
  uint64_t v11;
  NSDate *startedDate;
  void *v13;
  uint64_t v14;
  NSDate *finishedDate;

  v4 = (void (**)(id, _AFHomeAnnouncementMutation *))a3;
  if (v4)
  {
    v5 = -[_AFHomeAnnouncementMutation initWithBase:]([_AFHomeAnnouncementMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFHomeAnnouncementMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFHomeAnnouncement);
      -[_AFHomeAnnouncementMutation getIdentifier](v5, "getIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v8;

      v6->_startedHostTime = -[_AFHomeAnnouncementMutation getStartedHostTime](v5, "getStartedHostTime");
      v6->_finishedHostTime = -[_AFHomeAnnouncementMutation getFinishedHostTime](v5, "getFinishedHostTime");
      -[_AFHomeAnnouncementMutation getStartedDate](v5, "getStartedDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      startedDate = v6->_startedDate;
      v6->_startedDate = (NSDate *)v11;

      -[_AFHomeAnnouncementMutation getFinishedDate](v5, "getFinishedDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      finishedDate = v6->_finishedDate;
      v6->_finishedDate = (NSDate *)v14;

    }
    else
    {
      v6 = (AFHomeAnnouncement *)-[AFHomeAnnouncement copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFHomeAnnouncement *)-[AFHomeAnnouncement copy](self, "copy");
  }

  return v6;
}

@end
