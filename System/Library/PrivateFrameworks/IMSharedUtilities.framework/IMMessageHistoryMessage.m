@implementation IMMessageHistoryMessage

- (IMMessageHistoryMessage)initWithGUID:(id)a3 date:(id)a4 messagePartCount:(int64_t)a5
{
  id v8;
  id v9;
  IMMessageHistoryMessage *v10;
  uint64_t v11;
  NSString *guid;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMMessageHistoryMessage;
  v10 = -[IMMessageHistoryMessage init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    guid = v10->_guid;
    v10->_guid = (NSString *)v11;

    objc_storeStrong((id *)&v10->_date, a4);
    v10->_messagePartCount = a5;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGUID:date:messagePartCount:", self->_guid, self->_date, self->_messagePartCount);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *guid;
  id v5;

  guid = self->_guid;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", guid, CFSTR("guid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("date"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_messagePartCount, CFSTR("messagePartCount"));

}

- (IMMessageHistoryMessage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  IMMessageHistoryMessage *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("guid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("messagePartCount"));

  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    self = -[IMMessageHistoryMessage initWithGUID:date:messagePartCount:](self, "initWithGUID:date:messagePartCount:", v5, v6, v7);
    v9 = self;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)guid
{
  return self->_guid;
}

- (NSDate)date
{
  return self->_date;
}

- (int64_t)messagePartCount
{
  return self->_messagePartCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end
