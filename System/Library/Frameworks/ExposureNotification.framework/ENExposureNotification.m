@implementation ENExposureNotification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ENExposureNotification)initWithCoder:(id)a3
{
  id v4;
  ENExposureNotification *v5;
  uint64_t v6;
  ENExposureClassification *classification;
  uint64_t v8;
  NSDate *legacyDate;
  void *v10;
  void *v11;
  uint64_t v12;
  NSUUID *identifier;
  uint64_t v14;
  NSURL *learnMoreURL;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *localizedBodyText;
  uint64_t v20;
  NSString *localizedDetailBodyText;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *localizedSubjectText;
  NSDate *v26;
  uint64_t v27;
  NSDate *notificationDate;
  void *v29;
  ENExposureNotification *v30;

  v4 = a3;
  v5 = -[ENExposureNotification init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("classification"));
    v6 = objc_claimAutoreleasedReturnValue();
    classification = v5->_classification;
    v5->_classification = (ENExposureClassification *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v8 = objc_claimAutoreleasedReturnValue();
    legacyDate = v5->_legacyDate;
    v5->_legacyDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = objc_msgSend(v10, "copy");
      identifier = v5->_identifier;
      v5->_identifier = (NSUUID *)v12;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("learnMoreURL"));
      v14 = objc_claimAutoreleasedReturnValue();
      learnMoreURL = v5->_learnMoreURL;
      v5->_learnMoreURL = (NSURL *)v14;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textBody"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v18 = objc_msgSend(v16, "copy");
        localizedBodyText = v5->_localizedBodyText;
        v5->_localizedBodyText = (NSString *)v18;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("detailsTextBody"));
        v20 = objc_claimAutoreleasedReturnValue();
        localizedDetailBodyText = v5->_localizedDetailBodyText;
        v5->_localizedDetailBodyText = (NSString *)v20;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textSubject"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22
          && ((v24 = objc_msgSend(v22, "copy"),
               localizedSubjectText = v5->_localizedSubjectText,
               v5->_localizedSubjectText = (NSString *)v24,
               localizedSubjectText,
               objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notificationDate")),
               (v26 = (NSDate *)objc_claimAutoreleasedReturnValue()) != 0)
           || (v26 = v5->_legacyDate) != 0))
        {
          v27 = -[NSDate copy](v26, "copy");
          notificationDate = v5->_notificationDate;
          v5->_notificationDate = (NSDate *)v27;

          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reg"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            objc_storeStrong((id *)&v5->_region, v29);
            v5->_revoked = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("revoked"));
            v30 = v5;
          }
          else
          {
            v30 = 0;
          }

        }
        else
        {
          v30 = 0;
        }

      }
      else
      {
        v30 = 0;
      }

    }
    else
    {
      v30 = 0;
    }

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (NSDate)date
{
  NSDate *v3;

  v3 = self->_legacyDate;
  if (!v3)
  {
    -[ENExposureClassification date](self->_classification, "date");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      v3 = self->_notificationDate;
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  ENExposureClassification *classification;
  id v5;

  classification = self->_classification;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", classification, CFSTR("classification"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("id"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_learnMoreURL, CFSTR("learnMoreURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedBodyText, CFSTR("textBody"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedDetailBodyText, CFSTR("detailsTextBody"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedSubjectText, CFSTR("textSubject"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_notificationDate, CFSTR("notificationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_region, CFSTR("reg"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_revoked, CFSTR("revoked"));

}

- (ENExposureClassification)classification
{
  return self->_classification;
}

- (void)setClassification:(id)a3
{
  objc_storeStrong((id *)&self->_classification, a3);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)learnMoreURL
{
  return self->_learnMoreURL;
}

- (void)setLearnMoreURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)localizedBodyText
{
  return self->_localizedBodyText;
}

- (void)setLocalizedBodyText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)localizedDetailBodyText
{
  return self->_localizedDetailBodyText;
}

- (void)setLocalizedDetailBodyText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)localizedSubjectText
{
  return self->_localizedSubjectText;
}

- (void)setLocalizedSubjectText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDate)notificationDate
{
  return self->_notificationDate;
}

- (void)setNotificationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (ENRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)revoked
{
  return self->_revoked;
}

- (void)setRevoked:(BOOL)a3
{
  self->_revoked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_notificationDate, 0);
  objc_storeStrong((id *)&self->_localizedSubjectText, 0);
  objc_storeStrong((id *)&self->_localizedDetailBodyText, 0);
  objc_storeStrong((id *)&self->_localizedBodyText, 0);
  objc_storeStrong((id *)&self->_learnMoreURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_classification, 0);
  objc_storeStrong((id *)&self->_legacyDate, 0);
}

@end
