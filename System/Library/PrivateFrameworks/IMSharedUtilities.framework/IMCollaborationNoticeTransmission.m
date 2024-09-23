@implementation IMCollaborationNoticeTransmission

- (IMCollaborationNoticeTransmission)initWithEventData:(id)a3 eventType:(int64_t)a4 guidString:(id)a5 date:(id)a6
{
  id v11;
  id v12;
  id v13;
  IMCollaborationNoticeTransmission *v14;
  IMCollaborationNoticeTransmission *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)IMCollaborationNoticeTransmission;
  v14 = -[IMCollaborationNoticeTransmission init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_guidString, a5);
    objc_storeStrong((id *)&v15->_eventData, a3);
    v15->_eventType = a4;
    objc_storeStrong((id *)&v15->_date, a6);
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[IMCollaborationNoticeTransmission guidString](self, "guidString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_guidString);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[IMCollaborationNoticeTransmission eventData](self, "eventData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_eventData);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  v9 = -[IMCollaborationNoticeTransmission eventType](self, "eventType");
  NSStringFromSelector(sel_eventType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt64:forKey:", v9, v10);

  -[IMCollaborationNoticeTransmission date](self, "date");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_date);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, v11);

}

- (IMCollaborationNoticeTransmission)initWithCoder:(id)a3
{
  id v4;
  IMCollaborationNoticeTransmission *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *guidString;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSData *eventData;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSDate *date;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)IMCollaborationNoticeTransmission;
  v5 = -[IMCollaborationNoticeTransmission init](&v20, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_guidString);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    guidString = v5->_guidString;
    v5->_guidString = (NSString *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_eventData);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    eventData = v5->_eventData;
    v5->_eventData = (NSData *)v12;

    NSStringFromSelector(sel_eventType);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_eventType = objc_msgSend(v4, "decodeInt64ForKey:", v14);

    v15 = objc_opt_class();
    NSStringFromSelector(sel_date);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v17;

  }
  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMCollaborationNoticeTransmission eventData](self, "eventData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[IMCollaborationNoticeTransmission eventType](self, "eventType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMCollaborationNoticeTransmission guidString](self, "guidString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMCollaborationNoticeTransmission date](self, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p event = %@, type = %@, guidString: %@, date: %@"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)guidString
{
  return self->_guidString;
}

- (NSData)eventData
{
  return self->_eventData;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_eventData, 0);
  objc_storeStrong((id *)&self->_guidString, 0);
}

@end
