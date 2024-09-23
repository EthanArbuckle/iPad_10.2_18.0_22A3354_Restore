@implementation DAESubscribedCalendarSummary

- (DAESubscribedCalendarSummary)initWithCoder:(id)a3
{
  id v4;
  DAESubscribedCalendarSummary *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *notes;
  uint64_t v10;
  NSString *color;
  double v12;
  uint64_t v13;
  NSString *subscriptionID;
  uint64_t v15;
  NSURL *subscriptionURL;
  uint64_t v17;
  NSData *data;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DAESubscribedCalendarSummary;
  v5 = -[DAESubscribedCalendarSummary init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notes"));
    v8 = objc_claimAutoreleasedReturnValue();
    notes = v5->_notes;
    v5->_notes = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("color"));
    v10 = objc_claimAutoreleasedReturnValue();
    color = v5->_color;
    v5->_color = (NSString *)v10;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("refreshInterval"));
    v5->_refreshInterval = v12;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subscriptionID"));
    v13 = objc_claimAutoreleasedReturnValue();
    subscriptionID = v5->_subscriptionID;
    v5->_subscriptionID = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subscriptionURL"));
    v15 = objc_claimAutoreleasedReturnValue();
    subscriptionURL = v5->_subscriptionURL;
    v5->_subscriptionURL = (NSURL *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subscriptionICSData"));
    v17 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v17;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_notes, CFSTR("notes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_color, CFSTR("color"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("refreshInterval"), self->_refreshInterval);
  objc_msgSend(v5, "encodeObject:forKey:", self->_subscriptionID, CFSTR("subscriptionID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subscriptionURL, CFSTR("subscriptionURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_data, CFSTR("subscriptionICSData"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
  objc_storeStrong((id *)&self->_notes, a3);
}

- (NSString)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (double)refreshInterval
{
  return self->_refreshInterval;
}

- (void)setRefreshInterval:(double)a3
{
  self->_refreshInterval = a3;
}

- (NSString)subscriptionID
{
  return self->_subscriptionID;
}

- (void)setSubscriptionID:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionID, a3);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSURL)subscriptionURL
{
  return self->_subscriptionURL;
}

- (void)setSubscriptionURL:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionURL, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_subscriptionID, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
