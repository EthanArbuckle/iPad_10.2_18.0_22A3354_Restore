@implementation AFAnalyticsEventRecord

- (AFAnalyticsEventRecord)initWithEvent:(id)a3 streamUID:(id)a4 dateCreated:(id)a5 speechId:(id)a6
{
  return -[AFAnalyticsEventRecord initWithEvent:streamUID:dateCreated:speechId:recordId:](self, "initWithEvent:streamUID:dateCreated:speechId:recordId:", a3, a4, a5, a6, 0);
}

- (AFAnalyticsEventRecord)initWithEvent:(id)a3 streamUID:(id)a4 dateCreated:(id)a5 speechId:(id)a6 recordId:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  AFAnalyticsEventRecord *v17;
  uint64_t v18;
  AFAnalyticsEvent *event;
  uint64_t v20;
  NSString *streamUID;
  uint64_t v22;
  NSDate *dateCreated;
  uint64_t v24;
  NSString *speechId;
  uint64_t v26;
  void *recordId;
  uint64_t v28;
  NSString *v29;
  objc_super v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v31.receiver = self;
  v31.super_class = (Class)AFAnalyticsEventRecord;
  v17 = -[AFAnalyticsEventRecord init](&v31, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    event = v17->_event;
    v17->_event = (AFAnalyticsEvent *)v18;

    v20 = objc_msgSend(v13, "copy");
    streamUID = v17->_streamUID;
    v17->_streamUID = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    dateCreated = v17->_dateCreated;
    v17->_dateCreated = (NSDate *)v22;

    v24 = objc_msgSend(v15, "copy");
    speechId = v17->_speechId;
    v17->_speechId = (NSString *)v24;

    if (v16)
    {
      v26 = objc_msgSend(v16, "copy");
      recordId = v17->_recordId;
      v17->_recordId = (NSString *)v26;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      recordId = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(recordId, "UUIDString");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v17->_recordId;
      v17->_recordId = (NSString *)v28;

    }
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  AFAnalyticsEvent *event;
  id v5;

  event = self->_event;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", event, CFSTR("_event"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_streamUID, CFSTR("_streamUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateCreated, CFSTR("_dateCreated"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_speechId, CFSTR("_speechId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordId, CFSTR("_recordId"));

}

- (AFAnalyticsEventRecord)initWithCoder:(id)a3
{
  id v4;
  AFAnalyticsEventRecord *v5;
  uint64_t v6;
  AFAnalyticsEvent *event;
  uint64_t v8;
  NSString *streamUID;
  uint64_t v10;
  NSDate *dateCreated;
  uint64_t v12;
  NSString *speechId;
  uint64_t v14;
  NSString *recordId;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AFAnalyticsEventRecord;
  v5 = -[AFAnalyticsEventRecord init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_event"));
    v6 = objc_claimAutoreleasedReturnValue();
    event = v5->_event;
    v5->_event = (AFAnalyticsEvent *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_streamUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    streamUID = v5->_streamUID;
    v5->_streamUID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_dateCreated"));
    v10 = objc_claimAutoreleasedReturnValue();
    dateCreated = v5->_dateCreated;
    v5->_dateCreated = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_speechId"));
    v12 = objc_claimAutoreleasedReturnValue();
    speechId = v5->_speechId;
    v5->_speechId = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_recordId"));
    v14 = objc_claimAutoreleasedReturnValue();
    recordId = v5->_recordId;
    v5->_recordId = (NSString *)v14;

  }
  return v5;
}

- (AFAnalyticsEvent)event
{
  return self->_event;
}

- (NSString)streamUID
{
  return self->_streamUID;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSString)speechId
{
  return self->_speechId;
}

- (NSString)recordId
{
  return self->_recordId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordId, 0);
  objc_storeStrong((id *)&self->_speechId, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_streamUID, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)siriCoreSQLiteRecord_enumerateColumnNamesAndValuesUsingBlock:(id)a3
{
  void (**v4)(id, const __CFString *, NSString *, _BYTE *);
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  NSString *speechId;
  NSString *v13;
  NSString *recordId;
  void *v15;
  NSString *v16;
  char v17;

  v4 = (void (**)(id, const __CFString *, NSString *, _BYTE *))a3;
  if (v4
    && self->_streamUID
    && (-[AFAnalyticsEvent deliveryStream](self->_event, "deliveryStream")
     || -[AFAnalyticsEvent type](self->_event, "type")))
  {
    v17 = 0;
    v4[2](v4, CFSTR("stream_uid"), self->_streamUID, &v17);
    if (!v17)
    {
      v5 = (void *)MEMORY[0x1E0CB37E8];
      -[NSDate timeIntervalSince1970](self->_dateCreated, "timeIntervalSince1970");
      objc_msgSend(v5, "numberWithDouble:");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, CFSTR("date_created"), v6, &v17);

      if (!v17)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AFAnalyticsEvent type](self->_event, "type"));
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, CFSTR("type"), v7, &v17);

        if (!v17)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AFAnalyticsEvent deliveryStream](self->_event, "deliveryStream"));
          v8 = (NSString *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, CFSTR("delivery_stream"), v8, &v17);

          if (!v17)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[AFAnalyticsEvent timestamp](self->_event, "timestamp"));
            v9 = (NSString *)objc_claimAutoreleasedReturnValue();
            v4[2](v4, CFSTR("timestamp"), v9, &v17);

            if (!v17)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AFAnalyticsEvent contextDataType](self->_event, "contextDataType"));
              v10 = (NSString *)objc_claimAutoreleasedReturnValue();
              v4[2](v4, CFSTR("context_data_type"), v10, &v17);

              if (!v17)
              {
                -[AFAnalyticsEvent contextData](self->_event, "contextData");
                v11 = (NSString *)objc_claimAutoreleasedReturnValue();
                if (v11)
                  v4[2](v4, CFSTR("context_data"), v11, &v17);
                if (!v17)
                {
                  speechId = self->_speechId;
                  if (speechId)
                  {
                    v4[2](v4, CFSTR("assistant_id"), speechId, &v17);
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0C99E38], "null");
                    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
                    v4[2](v4, CFSTR("assistant_id"), v13, &v17);

                  }
                  if (!v17)
                  {
                    recordId = self->_recordId;
                    if (recordId)
                    {
                      v4[2](v4, CFSTR("record_id"), recordId, &v17);
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                      v15 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v15, "UUIDString");
                      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
                      v4[2](v4, CFSTR("record_id"), v16, &v17);

                    }
                  }
                }

              }
            }
          }
        }
      }
    }
  }

}

@end
