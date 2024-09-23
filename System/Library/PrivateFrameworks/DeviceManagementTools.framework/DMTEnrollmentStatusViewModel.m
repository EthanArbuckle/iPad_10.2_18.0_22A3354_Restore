@implementation DMTEnrollmentStatusViewModel

- (DMTEnrollmentStatusViewModel)initWithOrganizationName:(id)a3 organizationType:(int64_t)a4 localizedDeviceClass:(id)a5 enrollmentState:(int64_t)a6 networkName:(id)a7
{
  id v12;
  id v13;
  id v14;
  DMTEnrollmentStatusViewModel *v15;
  uint64_t v16;
  NSString *title;
  uint64_t v18;
  NSString *detailText;
  uint64_t v20;
  NSString *statusMessage;
  objc_super v23;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)DMTEnrollmentStatusViewModel;
  v15 = -[DMTEnrollmentStatusViewModel init](&v23, sel_init);
  if (v15)
  {
    objc_msgSend((id)objc_opt_class(), "titleWithLocalizedDeviceClass:", v13);
    v16 = objc_claimAutoreleasedReturnValue();
    title = v15->_title;
    v15->_title = (NSString *)v16;

    objc_msgSend((id)objc_opt_class(), "detailTextWithOrganizationName:organizationType:localizedDeviceClass:", v12, a4, v13);
    v18 = objc_claimAutoreleasedReturnValue();
    detailText = v15->_detailText;
    v15->_detailText = (NSString *)v18;

    objc_msgSend((id)objc_opt_class(), "statusMessageForEnrollmentState:networkName:", a6, v14);
    v20 = objc_claimAutoreleasedReturnValue();
    statusMessage = v15->_statusMessage;
    v15->_statusMessage = (NSString *)v20;

  }
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMTEnrollmentStatusViewModel)initWithCoder:(id)a3
{
  id v4;
  DMTEnrollmentStatusViewModel *v5;
  void *v6;
  NSString *v7;
  NSString *title;
  void *v9;
  NSString *v10;
  NSString *detailText;
  void *v12;
  NSString *v13;
  NSString *statusMessage;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DMTEnrollmentStatusViewModel;
  v5 = -[DMTEnrollmentStatusViewModel init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("title"));
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = v7;

    objc_storeStrong((id *)&v5->_title, v7);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("detailText"));
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    detailText = v5->_detailText;
    v5->_detailText = v10;

    objc_storeStrong((id *)&v5->_detailText, v10);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("statusMessage"));
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    statusMessage = v5->_statusMessage;
    v5->_statusMessage = v13;

    objc_storeStrong((id *)&v5->_statusMessage, v13);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[DMTEnrollmentStatusViewModel title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[DMTEnrollmentStatusViewModel detailText](self, "detailText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("detailText"));

  -[DMTEnrollmentStatusViewModel statusMessage](self, "statusMessage");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("statusMessage"));

}

+ (id)titleWithLocalizedDeviceClass:(id)a3
{
  return DMTTitleTextAddingDeviceFor(a3);
}

+ (id)detailTextWithOrganizationName:(id)a3 organizationType:(int64_t)a4 localizedDeviceClass:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a3;
  DMTDetailTextAddingDeviceBodyFor(a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  DMTFormattedEnrollmentOrganizationNameFrom((uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  DMTLocalizedOrganizationMarketingNameForOrganizationType(a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%@%@"), 0, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)statusMessageForEnrollmentState:(int64_t)a3 networkName:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a4;
  v6 = v5;
  switch(a3)
  {
    case 4:
      DMTBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Pairing…");
      goto LABEL_10;
    case 5:
      DMTBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Receiving organization details…");
      goto LABEL_10;
    case 6:
      DMTBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Starting enrollment…");
      goto LABEL_10;
    case 7:
      v11 = objc_msgSend(v5, "length");
      DMTBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v11)
      {
        objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Connecting to network “%@”…"), &stru_24E5A0848, 0);
        v12 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v12, v6);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)v12;
      }
      else
      {
        v9 = CFSTR("Connecting to network…");
LABEL_10:
        objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_24E5A0848, 0);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

LABEL_12:
      return v10;
    case 8:
      DMTBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Activating…");
      goto LABEL_10;
    case 9:
      DMTBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Adding…");
      goto LABEL_10;
    default:
      v10 = &stru_24E5A0848;
      goto LABEL_12;
  }
}

- (NSString)title
{
  return self->_title;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (NSString)statusMessage
{
  return self->_statusMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusMessage, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
