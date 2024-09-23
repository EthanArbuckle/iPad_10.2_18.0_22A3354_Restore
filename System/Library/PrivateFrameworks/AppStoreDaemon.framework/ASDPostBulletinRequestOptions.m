@implementation ASDPostBulletinRequestOptions

- (id)copyWithZone:(_NSZone *)a3
{
  ASDPostBulletinRequestOptions *v5;
  uint64_t v6;
  NSString *actionButtonTitle;
  uint64_t v8;
  NSURL *actionButtonURL;
  uint64_t v10;
  NSDate *creationDate;
  uint64_t v12;
  NSURL *launchURL;
  uint64_t v14;
  NSString *message;
  uint64_t v16;
  NSString *recordID;
  uint64_t v18;
  NSString *title;

  v5 = -[ASDPostBulletinRequestOptions init](+[ASDPostBulletinRequestOptions allocWithZone:](ASDPostBulletinRequestOptions, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_actionButtonTitle, "copyWithZone:", a3);
  actionButtonTitle = v5->_actionButtonTitle;
  v5->_actionButtonTitle = (NSString *)v6;

  v8 = -[NSURL copyWithZone:](self->_actionButtonURL, "copyWithZone:", a3);
  actionButtonURL = v5->_actionButtonURL;
  v5->_actionButtonURL = (NSURL *)v8;

  v10 = -[NSDate copyWithZone:](self->_creationDate, "copyWithZone:", a3);
  creationDate = v5->_creationDate;
  v5->_creationDate = (NSDate *)v10;

  v5->_destinations = self->_destinations;
  v12 = -[NSURL copyWithZone:](self->_launchURL, "copyWithZone:", a3);
  launchURL = v5->_launchURL;
  v5->_launchURL = (NSURL *)v12;

  v14 = -[NSString copyWithZone:](self->_message, "copyWithZone:", a3);
  message = v5->_message;
  v5->_message = (NSString *)v14;

  v16 = -[NSString copyWithZone:](self->_recordID, "copyWithZone:", a3);
  recordID = v5->_recordID;
  v5->_recordID = (NSString *)v16;

  v18 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  title = v5->_title;
  v5->_title = (NSString *)v18;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDPostBulletinRequestOptions)initWithCoder:(id)a3
{
  id v4;
  ASDPostBulletinRequestOptions *v5;
  uint64_t v6;
  NSString *actionButtonTitle;
  uint64_t v8;
  NSURL *actionButtonURL;
  uint64_t v10;
  NSDate *creationDate;
  uint64_t v12;
  NSURL *launchURL;
  uint64_t v14;
  NSString *message;
  uint64_t v16;
  NSString *recordID;
  uint64_t v18;
  NSString *title;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ASDPostBulletinRequestOptions;
  v5 = -[ASDRequestOptions initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionButtonTitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    actionButtonTitle = v5->_actionButtonTitle;
    v5->_actionButtonTitle = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionButtonURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    actionButtonURL = v5->_actionButtonURL;
    v5->_actionButtonURL = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v10;

    v5->_destinations = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("destinations"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("launchURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    launchURL = v5->_launchURL;
    v5->_launchURL = (NSURL *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("message"));
    v14 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recordID"));
    v16 = objc_claimAutoreleasedReturnValue();
    recordID = v5->_recordID;
    v5->_recordID = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v18 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[ASDPostBulletinRequestOptions actionButtonTitle](self, "actionButtonTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("actionButtonTitle"));

  -[ASDPostBulletinRequestOptions actionButtonURL](self, "actionButtonURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("actionButtonURL"));

  -[ASDPostBulletinRequestOptions creationDate](self, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("creationDate"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[ASDPostBulletinRequestOptions destinations](self, "destinations"), CFSTR("destinations"));
  -[ASDPostBulletinRequestOptions launchURL](self, "launchURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("launchURL"));

  -[ASDPostBulletinRequestOptions message](self, "message");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("message"));

  -[ASDPostBulletinRequestOptions recordID](self, "recordID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("recordID"));

  -[ASDPostBulletinRequestOptions title](self, "title");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("title"));

}

- (NSString)actionButtonTitle
{
  return self->_actionButtonTitle;
}

- (void)setActionButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSURL)actionButtonURL
{
  return self->_actionButtonURL;
}

- (void)setActionButtonURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(unint64_t)a3
{
  self->_destinations = a3;
}

- (NSURL)launchURL
{
  return self->_launchURL;
}

- (void)setLaunchURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_actionButtonURL, 0);
  objc_storeStrong((id *)&self->_actionButtonTitle, 0);
}

@end
