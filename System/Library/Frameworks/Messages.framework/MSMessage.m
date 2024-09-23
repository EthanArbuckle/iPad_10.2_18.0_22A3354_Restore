@implementation MSMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSMessage)initWithSession:(MSSession *)session
{
  MSSession *v5;
  MSMessage *v6;
  MSMessage *v7;
  objc_super v9;

  v5 = session;
  v9.receiver = self;
  v9.super_class = (Class)MSMessage;
  v6 = -[MSMessage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_session, session);

  return v7;
}

- (MSMessage)initWithCoder:(id)a3
{
  id v4;
  MSMessage *v5;
  uint64_t v6;
  MSSession *session;
  uint64_t v8;
  NSString *accessibilityLabel;
  uint64_t v10;
  NSURL *URL;
  uint64_t v12;
  NSString *statusText;
  uint64_t v14;
  NSString *summaryText;
  uint64_t v16;
  NSString *breadcrumbText;
  uint64_t v18;
  NSDate *time;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  MSMessageLayout *layout;
  uint64_t v25;
  NSUUID *senderParticipantIdentifier;
  uint64_t v27;
  NSString *senderAddress;
  uint64_t v29;
  NSString *guid;
  uint64_t v31;
  NSData *data;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[MSMessage init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("session"));
    v6 = objc_claimAutoreleasedReturnValue();
    session = v5->_session;
    v5->_session = (MSSession *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessibilityLabel"));
    v8 = objc_claimAutoreleasedReturnValue();
    accessibilityLabel = v5->_accessibilityLabel;
    v5->_accessibilityLabel = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
    v10 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statusText"));
    v12 = objc_claimAutoreleasedReturnValue();
    statusText = v5->_statusText;
    v5->_statusText = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("summaryText"));
    v14 = objc_claimAutoreleasedReturnValue();
    summaryText = v5->_summaryText;
    v5->_summaryText = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("breadcrumbText"));
    v16 = objc_claimAutoreleasedReturnValue();
    breadcrumbText = v5->_breadcrumbText;
    v5->_breadcrumbText = (NSString *)v16;

    v5->_shouldExpire = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldExpire"));
    v5->_pending = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pending"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("time"));
    v18 = objc_claimAutoreleasedReturnValue();
    time = v5->_time;
    v5->_time = (NSDate *)v18;

    v20 = (void *)MEMORY[0x1E0C99E60];
    v34 = objc_opt_class();
    v35 = objc_opt_class();
    v36 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWithArray:", v21, v34, v35);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("balloonLayout"));
    v23 = objc_claimAutoreleasedReturnValue();
    layout = v5->_layout;
    v5->_layout = (MSMessageLayout *)v23;

    v5->_isFromMe = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFromMe"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderPID"));
    v25 = objc_claimAutoreleasedReturnValue();
    senderParticipantIdentifier = v5->_senderParticipantIdentifier;
    v5->_senderParticipantIdentifier = (NSUUID *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderAddress"));
    v27 = objc_claimAutoreleasedReturnValue();
    senderAddress = v5->_senderAddress;
    v5->_senderAddress = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("guid"));
    v29 = objc_claimAutoreleasedReturnValue();
    guid = v5->_guid;
    v5->_guid = (NSString *)v29;

    v5->_requiresValidation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresValidation"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v31 = objc_claimAutoreleasedReturnValue();
    data = v5->__data;
    v5->__data = (NSData *)v31;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  MSSession *session;
  id v5;

  session = self->_session;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", session, CFSTR("session"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessibilityLabel, CFSTR("accessibilityLabel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_URL, CFSTR("URL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_statusText, CFSTR("statusText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_summaryText, CFSTR("summaryText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_breadcrumbText, CFSTR("breadcrumbText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_layout, CFSTR("balloonLayout"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldExpire, CFSTR("shouldExpire"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_pending, CFSTR("pending"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_time, CFSTR("time"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isFromMe, CFSTR("isFromMe"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_senderParticipantIdentifier, CFSTR("senderPID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_senderAddress, CFSTR("senderAddress"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_guid, CFSTR("guid"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_requiresValidation, CFSTR("requiresValidation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->__data, CFSTR("data"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  MSMessage *v5;
  void *v6;
  MSMessage *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = +[MSMessage allocWithZone:](MSMessage, "allocWithZone:");
  -[MSMessage session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MSMessage initWithSession:](v5, "initWithSession:", v6);

  v8 = (void *)-[NSString copyWithZone:](self->_accessibilityLabel, "copyWithZone:", a3);
  -[MSMessage setAccessibilityLabel:](v7, "setAccessibilityLabel:", v8);

  v9 = (void *)-[NSURL copyWithZone:](self->_URL, "copyWithZone:", a3);
  -[MSMessage setURL:](v7, "setURL:", v9);

  v10 = -[MSMessageLayout copyWithZone:](self->_layout, "copyWithZone:", a3);
  -[MSMessage setLayout:](v7, "setLayout:", v10);

  v11 = (void *)-[NSString copyWithZone:](self->_statusText, "copyWithZone:", a3);
  -[MSMessage setStatusText:](v7, "setStatusText:", v11);

  v12 = (void *)-[NSString copyWithZone:](self->_summaryText, "copyWithZone:", a3);
  -[MSMessage setSummaryText:](v7, "setSummaryText:", v12);

  v13 = (void *)-[NSString copyWithZone:](self->_breadcrumbText, "copyWithZone:", a3);
  -[MSMessage setBreadcrumbText:](v7, "setBreadcrumbText:", v13);

  -[MSMessage setShouldExpire:](v7, "setShouldExpire:", self->_shouldExpire);
  -[MSMessage setPending:](v7, "setPending:", self->_pending);
  v14 = (void *)-[NSDate copyWithZone:](self->_time, "copyWithZone:", a3);
  -[MSMessage setTime:](v7, "setTime:", v14);

  v15 = (void *)-[NSUUID copyWithZone:](self->_senderParticipantIdentifier, "copyWithZone:", a3);
  -[MSMessage setSenderParticipantIdentifier:](v7, "setSenderParticipantIdentifier:", v15);

  v16 = (void *)-[NSString copyWithZone:](self->_senderAddress, "copyWithZone:", a3);
  -[MSMessage setSenderAddress:](v7, "setSenderAddress:", v16);

  v17 = (void *)-[NSString copyWithZone:](self->_guid, "copyWithZone:", a3);
  -[MSMessage setGuid:](v7, "setGuid:", v17);

  -[MSMessage setIsFromMe:](v7, "setIsFromMe:", self->_isFromMe);
  -[MSMessage setRequiresValidation:](v7, "setRequiresValidation:", self->_requiresValidation);
  v18 = (void *)-[NSData copyWithZone:](self->__data, "copyWithZone:", a3);
  -[MSMessage set_data:](v7, "set_data:", v18);

  return v7;
}

- (id)_shallowCopy
{
  MSMessage *v3;

  v3 = -[MSMessage initWithSession:]([MSMessage alloc], "initWithSession:", self->_session);
  -[MSMessage setAccessibilityLabel:](v3, "setAccessibilityLabel:", self->_accessibilityLabel);
  -[MSMessage setURL:](v3, "setURL:", self->_URL);
  -[MSMessage setLayout:](v3, "setLayout:", self->_layout);
  -[MSMessage setStatusText:](v3, "setStatusText:", self->_statusText);
  -[MSMessage setSummaryText:](v3, "setSummaryText:", self->_summaryText);
  -[MSMessage setBreadcrumbText:](v3, "setBreadcrumbText:", self->_breadcrumbText);
  -[MSMessage setShouldExpire:](v3, "setShouldExpire:", self->_shouldExpire);
  -[MSMessage setPending:](v3, "setPending:", self->_pending);
  -[MSMessage setTime:](v3, "setTime:", self->_time);
  -[MSMessage setSenderParticipantIdentifier:](v3, "setSenderParticipantIdentifier:", self->_senderParticipantIdentifier);
  -[MSMessage setSenderAddress:](v3, "setSenderAddress:", self->_senderAddress);
  -[MSMessage setGuid:](v3, "setGuid:", self->_guid);
  -[MSMessage setIsFromMe:](v3, "setIsFromMe:", self->_isFromMe);
  -[MSMessage setRequiresValidation:](v3, "setRequiresValidation:", self->_requiresValidation);
  -[MSMessage set_data:](v3, "set_data:", self->__data);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  MSMessage *v4;
  MSMessage *v5;
  MSSession *session;
  MSSession *v7;
  NSURL *URL;
  NSURL *v9;
  NSString *accessibilityLabel;
  NSString *v11;
  MSMessageLayout *layout;
  MSMessageLayout *v13;
  NSString *statusText;
  NSString *v15;
  NSString *summaryText;
  NSString *v17;
  _BOOL4 shouldExpire;
  _BOOL4 pending;
  NSUUID *senderParticipantIdentifier;
  NSUUID *v21;
  NSUUID *v22;
  NSUUID *v23;
  int v24;
  NSString *senderAddress;
  NSString *v26;
  NSString *v27;
  NSString *v28;
  int v29;
  NSString *guid;
  NSString *v31;
  NSString *v32;
  NSString *v33;
  int v34;
  _BOOL4 requiresValidation;
  NSData *data;
  NSData *v37;
  char v38;
  NSString *v40;
  NSString *v41;
  NSUUID *v42;

  v4 = (MSMessage *)a3;
  if (v4 == self)
  {
    v38 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      session = self->_session;
      -[MSMessage session](v5, "session");
      v7 = (MSSession *)objc_claimAutoreleasedReturnValue();
      if (session == v7 || -[MSSession isEqual:](session, "isEqual:", v7))
      {
        URL = self->_URL;
        -[MSMessage URL](v5, "URL");
        v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
        if (URL == v9 || -[NSURL isEqual:](URL, "isEqual:", v9))
        {
          accessibilityLabel = self->_accessibilityLabel;
          -[MSMessage accessibilityLabel](v5, "accessibilityLabel");
          v11 = (NSString *)objc_claimAutoreleasedReturnValue();
          if (accessibilityLabel == v11 || -[NSString isEqualToString:](accessibilityLabel, "isEqualToString:", v11))
          {
            layout = self->_layout;
            -[MSMessage layout](v5, "layout");
            v13 = (MSMessageLayout *)objc_claimAutoreleasedReturnValue();
            if (layout == v13 || -[MSMessageLayout isEqual:](layout, "isEqual:", v13))
            {
              statusText = self->_statusText;
              -[MSMessage statusText](v5, "statusText");
              v15 = (NSString *)objc_claimAutoreleasedReturnValue();
              if (statusText == v15 || -[NSString isEqualToString:](statusText, "isEqualToString:", v15))
              {
                summaryText = self->_summaryText;
                -[MSMessage summaryText](v5, "summaryText");
                v17 = (NSString *)objc_claimAutoreleasedReturnValue();
                if ((summaryText == v17 || -[NSString isEqualToString:](summaryText, "isEqualToString:", v17))
                  && (shouldExpire = self->_shouldExpire, shouldExpire == -[MSMessage shouldExpire](v5, "shouldExpire"))
                  && (pending = self->_pending, pending == -[MSMessage isPending](v5, "isPending")))
                {
                  senderParticipantIdentifier = self->_senderParticipantIdentifier;
                  -[MSMessage senderParticipantIdentifier](v5, "senderParticipantIdentifier");
                  v21 = (NSUUID *)objc_claimAutoreleasedReturnValue();
                  if (senderParticipantIdentifier == v21
                    || (v22 = senderParticipantIdentifier,
                        v23 = v21,
                        v24 = -[NSUUID isEqual:](v22, "isEqual:", v21),
                        v21 = v23,
                        v24))
                  {
                    v42 = v21;
                    senderAddress = self->_senderAddress;
                    -[MSMessage senderAddress](v5, "senderAddress");
                    v26 = (NSString *)objc_claimAutoreleasedReturnValue();
                    if (senderAddress == v26
                      || (v27 = senderAddress,
                          v28 = v26,
                          v29 = -[NSString isEqual:](v27, "isEqual:", v26),
                          v26 = v28,
                          v29))
                    {
                      v41 = v26;
                      guid = self->_guid;
                      -[MSMessage guid](v5, "guid");
                      v31 = (NSString *)objc_claimAutoreleasedReturnValue();
                      if (guid == v31
                        || (v32 = guid, v33 = v31, v34 = -[NSString isEqual:](v32, "isEqual:", v31), v31 = v33, v34))
                      {
                        v40 = v31;
                        requiresValidation = self->_requiresValidation;
                        if (requiresValidation == -[MSMessage requiresValidation](v5, "requiresValidation"))
                        {
                          data = self->__data;
                          -[MSMessage _data](v5, "_data");
                          v37 = (NSData *)objc_claimAutoreleasedReturnValue();
                          if (data == v37)
                            v38 = 1;
                          else
                            v38 = -[NSData isEqual:](data, "isEqual:", v37);

                        }
                        else
                        {
                          v38 = 0;
                        }
                        v31 = v40;
                      }
                      else
                      {
                        v38 = 0;
                      }

                      v26 = v41;
                    }
                    else
                    {
                      v38 = 0;
                    }

                    v21 = v42;
                  }
                  else
                  {
                    v38 = 0;
                  }

                }
                else
                {
                  v38 = 0;
                }

              }
              else
              {
                v38 = 0;
              }

            }
            else
            {
              v38 = 0;
            }

          }
          else
          {
            v38 = 0;
          }

        }
        else
        {
          v38 = 0;
        }

      }
      else
      {
        v38 = 0;
      }

    }
    else
    {
      v38 = 0;
    }
  }

  return v38;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  _BOOL8 isFromMe;
  uint64_t v10;
  NSUInteger v11;

  v3 = -[MSSession hash](self->_session, "hash");
  v4 = -[NSString hash](self->_accessibilityLabel, "hash") ^ v3;
  v5 = -[MSMessageLayout hash](self->_layout, "hash");
  v6 = v4 ^ v5 ^ -[NSURL hash](self->_URL, "hash");
  v7 = -[NSString hash](self->_statusText, "hash");
  v8 = v6 ^ v7 ^ -[NSString hash](self->_summaryText, "hash") ^ self->_shouldExpire;
  isFromMe = self->_isFromMe;
  v10 = isFromMe ^ -[NSUUID hash](self->_senderParticipantIdentifier, "hash");
  v11 = v10 ^ -[NSString hash](self->_senderAddress, "hash");
  return v8 ^ v11 ^ -[NSString hash](self->_guid, "hash");
}

- (MSMessage)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MSMessage;
  return -[MSMessage init](&v3, sel_init);
}

- (void)setURL:(NSURL *)URL
{
  NSURL *v5;
  NSURL **p_URL;
  NSURL *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSURL *v17;

  v5 = URL;
  v7 = self->_URL;
  p_URL = &self->_URL;
  v17 = v5;
  if ((-[NSURL isEqual:](v7, "isEqual:") & 1) == 0)
  {
    -[NSURL scheme](v17, "scheme");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[NSURL scheme](v17, "scheme");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lowercaseString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "isEqualToString:", CFSTR("http")) & 1) == 0)
      {
        -[NSURL scheme](v17, "scheme");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lowercaseString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "isEqualToString:", CFSTR("https")) & 1) == 0)
        {
          -[NSURL scheme](v17, "scheme");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "lowercaseString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("data"));

          if ((v16 & 1) == 0)
            goto LABEL_8;
          goto LABEL_7;
        }

      }
    }
LABEL_7:
    objc_storeStrong((id *)p_URL, URL);
  }
LABEL_8:

}

- (id)_sanitizedCopy
{
  void *v2;

  -[MSMessage _shallowCopy](self, "_shallowCopy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_sanitize");
  return v2;
}

- (void)_sanitize
{
  void *v3;
  void *v4;

  -[MSMessage layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sanitizedCopy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSMessage setLayout:](self, "setLayout:", v4);

  -[MSMessage setStatusText:](self, "setStatusText:", 0);
  -[MSMessage setSummaryText:](self, "setSummaryText:", 0);
  -[MSMessage setAccessibilityLabel:](self, "setAccessibilityLabel:", 0);
  -[MSMessage setSenderAddress:](self, "setSenderAddress:", 0);
  -[MSMessage setGuid:](self, "setGuid:", 0);
}

- (void)_mergeSanitizedDataFromMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSMessage setLayout:](self, "setLayout:", v5);

  objc_msgSend(v4, "statusText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSMessage setStatusText:](self, "setStatusText:", v6);

  objc_msgSend(v4, "summaryText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSMessage setSummaryText:](self, "setSummaryText:", v7);

  objc_msgSend(v4, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSMessage setAccessibilityLabel:](self, "setAccessibilityLabel:", v8);

  objc_msgSend(v4, "senderAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSMessage setSenderAddress:](self, "setSenderAddress:", v9);

  objc_msgSend(v4, "guid");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[MSMessage setGuid:](self, "setGuid:", v10);
}

- (void)_mergeSanitizedKeepingModifiedMessage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[MSMessage layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(v16, "layout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSMessage setLayout:](self, "setLayout:", v5);

  }
  -[MSMessage statusText](self, "statusText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v16, "statusText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSMessage setStatusText:](self, "setStatusText:", v7);

  }
  -[MSMessage summaryText](self, "summaryText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v16, "summaryText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSMessage setSummaryText:](self, "setSummaryText:", v9);

  }
  -[MSMessage accessibilityLabel](self, "accessibilityLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(v16, "accessibilityLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSMessage setAccessibilityLabel:](self, "setAccessibilityLabel:", v11);

  }
  -[MSMessage senderAddress](self, "senderAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(v16, "senderAddress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSMessage setSenderAddress:](self, "setSenderAddress:", v13);

  }
  -[MSMessage guid](self, "guid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(v16, "guid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSMessage setGuid:](self, "setGuid:", v15);

  }
}

- (id)_pluginPayloadWithAppIconData:(id)a3 appName:(id)a4 allowDataPayloads:(BOOL)a5
{
  return -[MSMessage _pluginPayloadWithAppIconData:appName:adamID:allowDataPayloads:](self, "_pluginPayloadWithAppIconData:appName:adamID:allowDataPayloads:", a3, a4, 0, a5);
}

- (id)_pluginPayloadWithAppIconData:(id)a3 appName:(id)a4 adamID:(id)a5 allowDataPayloads:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  objc_class *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  char isKindOfClass;
  id v20;
  void *v21;
  void *v22;
  UIImage *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v33;
  id v34;
  _QWORD v35[5];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[2];

  v6 = a6;
  v40[1] = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v10 = a4;
  v11 = a5;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2050000000;
  v12 = (void *)getCKBrowserItemPayloadClass_softClass;
  v39 = getCKBrowserItemPayloadClass_softClass;
  if (!getCKBrowserItemPayloadClass_softClass)
  {
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __getCKBrowserItemPayloadClass_block_invoke;
    v35[3] = &unk_1EA25C548;
    v35[4] = &v36;
    __getCKBrowserItemPayloadClass_block_invoke((uint64_t)v35);
    v12 = (void *)v37[3];
  }
  v33 = v6;
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v36, 8);
  IMLogHandleForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[MSMessage _pluginPayloadWithAppIconData:appName:adamID:allowDataPayloads:].cold.2(v13, v15);
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    -[MSMessage _pluginPayloadWithAppIconData:appName:adamID:allowDataPayloads:].cold.1();
  }

  v16 = objc_alloc_init(objc_retainAutorelease(v13));
  -[MSMessage layout](self, "layout");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSMessage layout](self, "layout");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v17, "alternateLayout");
    v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
    v21 = v20;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = v17;
    goto LABEL_12;
  }
  v21 = 0;
LABEL_14:
  objc_msgSend(v21, "image");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v21, "image");
    v23 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIImageJPEGRepresentation(v23, 0.5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MSTempFileManager sharedInstance](_MSTempFileManager, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "writeTemporaryFileWithData:type:", v24, *MEMORY[0x1E0CA5BA8]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
      goto LABEL_20;
LABEL_19:
    v40[0] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAttachments:", v28);

    goto LABEL_20;
  }
  objc_msgSend(v21, "mediaFileURL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v21, "mediaFileURL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      goto LABEL_19;
  }
LABEL_20:
  -[MSMessage _payloadDataFromAppIconData:appName:adamID:allowDataPayloads:](self, "_payloadDataFromAppIconData:appName:adamID:allowDataPayloads:", v34, v10, v11, v33);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
    objc_msgSend(v16, "setData:", v29);
  -[MSMessage summaryText](self, "summaryText");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBreadcrumbText:", v30);

  -[MSMessage statusText](self, "statusText");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setStatusText:", v31);

  objc_msgSend(v16, "setShouldExpire:", -[MSMessage shouldExpire](self, "shouldExpire"));
  objc_msgSend(v16, "setRequiresValidation:", -[MSMessage requiresValidation](self, "requiresValidation"));

  return v16;
}

- (id)_payloadDataFromAppIconData:(id)a3 appName:(id)a4 adamID:(id)a5 allowDataPayloads:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  MSMessageTemplateLayout *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  uint64_t v40;
  void *v41;
  const __CFString *v42;
  uint64_t v43;
  void *v44;
  const __CFString *v45;
  uint64_t v46;
  void *v47;
  const __CFString *v48;
  uint64_t v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  objc_class *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  objc_class *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  id v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  _QWORD v81[6];
  _QWORD v82[8];

  v6 = a6;
  v82[6] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSMessage layout](self, "layout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSMessage session](self, "session");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[MSMessage session](self, "session");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v18, *MEMORY[0x1E0D37E78]);

  }
  -[MSMessage URL](self, "URL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[MSMessage URL](self, "URL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v20, *MEMORY[0x1E0D37E68]);

  }
  if (v6)
  {
    -[MSMessage _data](self, "_data");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[MSMessage _data](self, "_data");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v22, *MEMORY[0x1E0D37E40]);

    }
  }
  -[MSMessage accessibilityLabel](self, "accessibilityLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[MSMessage accessibilityLabel](self, "accessibilityLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v24, *MEMORY[0x1E0D37E00]);

  }
  if (v10)
  {
    v25 = (void *)objc_msgSend(v10, "_FTCopyGzippedData");
    objc_msgSend(v13, "setObject:forKey:", v25, *MEMORY[0x1E0D37E18]);

  }
  if (v11)
    objc_msgSend(v13, "setObject:forKey:", v11, *MEMORY[0x1E0D37E20]);
  if (v12)
    objc_msgSend(v13, "setObject:forKey:", v12, *MEMORY[0x1E0D37E08]);
  -[MSMessage statusText](self, "statusText");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[MSMessage statusText](self, "statusText");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v27, *MEMORY[0x1E0D37E60]);

  }
  -[MSMessage summaryText](self, "summaryText");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[MSMessage summaryText](self, "summaryText");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v29, *MEMORY[0x1E0D37E50]);

  }
  objc_opt_class();
  v30 = v14;
  v75 = v11;
  v76 = v10;
  v74 = v12;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = v14;
    v77 = 0;
    v73 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "alternateLayout");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "requiredCapabilities");
      v33 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v32, "linkMetadata");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_alloc_init(MSMessageTemplateLayout);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v31 = v32;
          v77 = 0;
        }
        else
        {
          v77 = 0;
          v31 = 0;
        }
      }
      v73 = (void *)v33;

    }
    else
    {
      v77 = 0;
      v73 = 0;
      v31 = 0;
    }
  }
  v81[0] = *MEMORY[0x1E0D37520];
  -[MSMessageTemplateLayout caption](v31, "caption");
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v34;
  if (v34)
    v36 = (const __CFString *)v34;
  else
    v36 = &stru_1EA25D770;
  v82[0] = v36;
  v81[1] = *MEMORY[0x1E0D37540];
  -[MSMessageTemplateLayout subcaption](v31, "subcaption");
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)v37;
  if (v37)
    v39 = (const __CFString *)v37;
  else
    v39 = &stru_1EA25D770;
  v82[1] = v39;
  v81[2] = *MEMORY[0x1E0D37538];
  -[MSMessageTemplateLayout trailingCaption](v31, "trailingCaption");
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = (void *)v40;
  if (v40)
    v42 = (const __CFString *)v40;
  else
    v42 = &stru_1EA25D770;
  v82[2] = v42;
  v81[3] = *MEMORY[0x1E0D37548];
  -[MSMessageTemplateLayout trailingSubcaption](v31, "trailingSubcaption");
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = (void *)v43;
  if (v43)
    v45 = (const __CFString *)v43;
  else
    v45 = &stru_1EA25D770;
  v82[3] = v45;
  v81[4] = *MEMORY[0x1E0D37530];
  -[MSMessageTemplateLayout imageTitle](v31, "imageTitle");
  v46 = objc_claimAutoreleasedReturnValue();
  v47 = (void *)v46;
  if (v46)
    v48 = (const __CFString *)v46;
  else
    v48 = &stru_1EA25D770;
  v82[4] = v48;
  v81[5] = *MEMORY[0x1E0D37528];
  -[MSMessageTemplateLayout imageSubtitle](v31, "imageSubtitle");
  v49 = objc_claimAutoreleasedReturnValue();
  v50 = (void *)v49;
  if (v49)
    v51 = (const __CFString *)v49;
  else
    v51 = &stru_1EA25D770;
  v82[5] = v51;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 6);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = (objc_class *)objc_opt_class();
  NSStringFromClass(v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = *MEMORY[0x1E0D37E28];
  objc_msgSend(v13, "setObject:forKey:", v54, *MEMORY[0x1E0D37E28]);
  v56 = *MEMORY[0x1E0D37E30];
  objc_msgSend(v13, "setObject:forKey:", v52, *MEMORY[0x1E0D37E30]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setObject:forKey:", MEMORY[0x1E0C9AA70], v56);
    v58 = (objc_class *)objc_opt_class();
    NSStringFromClass(v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setObject:forKey:", v59, v55);

    v80 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v57, 1, &v80);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v80;
    v62 = v61;
    if (v60)
    {
      objc_msgSend(v13, "setObject:forKey:", v60, *MEMORY[0x1E0D37E38]);
    }
    else
    {
      v71 = v61;
      _IMWarn();
    }

  }
  if (v77)
  {
    v79 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v77, 1, &v79);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v79;
    v65 = v64;
    if (v63)
    {
      if (objc_msgSend(v63, "length"))
      {
        objc_msgSend(v13, "setObject:forKey:", v63, *MEMORY[0x1E0D37E48]);
LABEL_59:

        goto LABEL_60;
      }
    }
    else
    {
      v71 = v64;
    }
    _IMWarn();
    goto LABEL_59;
  }
LABEL_60:
  if (objc_msgSend(v73, "count", v71))
  {
    v78 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v73, 1, &v78);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v78;
    v68 = v67;
    if (v66)
    {
      if (objc_msgSend(v66, "length"))
      {
        objc_msgSend(v13, "setObject:forKey:", v66, *MEMORY[0x1E0D37E58]);
LABEL_66:

        goto LABEL_67;
      }
    }
    else
    {
      v72 = v67;
    }
    _IMWarn();
    goto LABEL_66;
  }
LABEL_67:
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, 0, v72);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  return v69;
}

- (MSSession)session
{
  return self->_session;
}

- (BOOL)isPending
{
  return self->_pending;
}

- (void)setPending:(BOOL)a3
{
  self->_pending = a3;
}

- (NSUUID)senderParticipantIdentifier
{
  return self->_senderParticipantIdentifier;
}

- (void)setSenderParticipantIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_senderParticipantIdentifier, a3);
}

- (MSMessageLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(MSMessageLayout *)layout
{
  objc_setProperty_nonatomic_copy(self, a2, layout, 32);
}

- (NSURL)URL
{
  return self->_URL;
}

- (BOOL)shouldExpire
{
  return self->_shouldExpire;
}

- (void)setShouldExpire:(BOOL)shouldExpire
{
  self->_shouldExpire = shouldExpire;
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (void)setAccessibilityLabel:(NSString *)accessibilityLabel
{
  objc_setProperty_nonatomic_copy(self, a2, accessibilityLabel, 48);
}

- (NSString)summaryText
{
  return self->_summaryText;
}

- (void)setSummaryText:(NSString *)summaryText
{
  objc_setProperty_nonatomic_copy(self, a2, summaryText, 56);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(NSError *)error
{
  objc_setProperty_nonatomic_copy(self, a2, error, 64);
}

- (NSDate)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
  objc_storeStrong((id *)&self->_time, a3);
}

- (NSData)_data
{
  return self->__data;
}

- (void)set_data:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (void)setIsFromMe:(BOOL)a3
{
  self->_isFromMe = a3;
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (void)setSenderAddress:(id)a3
{
  objc_storeStrong((id *)&self->_senderAddress, a3);
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_storeStrong((id *)&self->_guid, a3);
}

- (BOOL)requiresValidation
{
  return self->_requiresValidation;
}

- (void)setRequiresValidation:(BOOL)a3
{
  self->_requiresValidation = a3;
}

- (NSString)statusText
{
  return self->_statusText;
}

- (void)setStatusText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)breadcrumbText
{
  return self->_breadcrumbText;
}

- (void)setBreadcrumbText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_breadcrumbText, 0);
  objc_storeStrong((id *)&self->_statusText, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->__data, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_summaryText, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_senderParticipantIdentifier, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)_pluginPayloadWithAppIconData:appName:adamID:allowDataPayloads:.cold.1()
{
  os_log_t v0;
  int v1;
  const __CFString *v2;
  __int16 v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 138413058;
  v2 = CFSTR("CKBrowserItemPayload");
  v3 = 2080;
  OUTLINED_FUNCTION_0_2();
  v4 = "/Library/Caches/com.apple.xbs/Sources/Messages/ChatKit/Messages/Messages/Source/Extension/MSMessage.m";
  _os_log_error_impl(&dword_1DB1A9000, v0, OS_LOG_TYPE_ERROR, "Failed to load weak link class: '%@': %s:%i (%s)", (uint8_t *)&v1, 0x26u);
}

- (void)_pluginPayloadWithAppIconData:(objc_class *)a1 appName:(NSObject *)a2 adamID:allowDataPayloads:.cold.2(objc_class *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  NSStringFromClass(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138413058;
  v5 = v3;
  v6 = 2080;
  OUTLINED_FUNCTION_0_2();
  v7 = "/Library/Caches/com.apple.xbs/Sources/Messages/ChatKit/Messages/Messages/Source/Extension/MSMessage.m";
  _os_log_debug_impl(&dword_1DB1A9000, a2, OS_LOG_TYPE_DEBUG, "Loaded weak linked class: '%@': %s:%i (%s)", (uint8_t *)&v4, 0x26u);

}

@end
