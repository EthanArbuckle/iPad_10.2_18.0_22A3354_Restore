@implementation MADVIUserFeedbackRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVIUserFeedbackRequest)initWithPayload:(id)a3 andReportIdentifier:(id)a4
{
  return -[MADVIUserFeedbackRequest initWithUserFeedbackPayload:sfReportData:reportIdentifier:](self, "initWithUserFeedbackPayload:sfReportData:reportIdentifier:", a3, 0, a4);
}

- (MADVIUserFeedbackRequest)initWithUserFeedbackPayload:(id)a3 sfReportData:(id)a4 reportIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  MADVIUserFeedbackRequest *v12;
  MADVIUserFeedbackRequest *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MADVIUserFeedbackRequest;
  v12 = -[MADVIUserFeedbackRequest init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userFeedbackPayload, a3);
    objc_storeStrong((id *)&v13->_sfReportData, a4);
    objc_storeStrong((id *)&v13->_reportIdentifier, a5);
  }

  return v13;
}

- (MADVIUserFeedbackRequest)initWithCoder:(id)a3
{
  id v4;
  MADVIUserFeedbackRequest *v5;
  uint64_t v6;
  NSData *userFeedbackPayload;
  uint64_t v8;
  NSData *sfReportData;
  uint64_t v10;
  NSString *reportIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MADVIUserFeedbackRequest;
  v5 = -[MADRequest initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UserFeedbackPayload"));
    v6 = objc_claimAutoreleasedReturnValue();
    userFeedbackPayload = v5->_userFeedbackPayload;
    v5->_userFeedbackPayload = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SFReportData"));
    v8 = objc_claimAutoreleasedReturnValue();
    sfReportData = v5->_sfReportData;
    v5->_sfReportData = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ReportIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    reportIdentifier = v5->_reportIdentifier;
    v5->_reportIdentifier = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADVIUserFeedbackRequest;
  v4 = a3;
  -[MADRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_userFeedbackPayload, CFSTR("UserFeedbackPayload"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sfReportData, CFSTR("SFReportData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_reportIdentifier, CFSTR("ReportIdentifier"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("userFeedbackPayload: %@, "), self->_userFeedbackPayload);
  objc_msgSend(v3, "appendFormat:", CFSTR("sfReportData: %@, "), self->_sfReportData);
  objc_msgSend(v3, "appendFormat:", CFSTR("reportIdentifier: %@, "), self->_reportIdentifier);
  -[MADRequest results](self, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("results: %@, "), v6);

  -[MADRequest error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("error: %@>"), v7);

  return v3;
}

- (NSData)userFeedbackPayload
{
  return self->_userFeedbackPayload;
}

- (NSData)sfReportData
{
  return self->_sfReportData;
}

- (NSString)reportIdentifier
{
  return self->_reportIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportIdentifier, 0);
  objc_storeStrong((id *)&self->_sfReportData, 0);
  objc_storeStrong((id *)&self->_userFeedbackPayload, 0);
}

@end
