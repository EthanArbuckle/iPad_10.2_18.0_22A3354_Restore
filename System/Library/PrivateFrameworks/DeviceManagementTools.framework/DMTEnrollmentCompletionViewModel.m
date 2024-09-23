@implementation DMTEnrollmentCompletionViewModel

- (id)initSuccessfulEnrollmentInOrganizationName:(id)a3 organizationType:(int64_t)a4 mdmServerName:(id)a5 localizedDeviceClass:(id)a6
{
  id v10;
  id v11;
  id v12;
  DMTEnrollmentCompletionViewModel *v13;
  uint64_t v14;
  NSString *symbolName;
  uint64_t v16;
  NSString *title;
  uint64_t v18;
  NSString *detailText;
  uint64_t v20;
  NSString *buttonTitle;
  objc_super v23;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)DMTEnrollmentCompletionViewModel;
  v13 = -[DMTEnrollmentCompletionViewModel init](&v23, sel_init);
  if (v13)
  {
    +[DMTEnrollmentCompletionViewModel symbolNameForSuccessfulEnrollment](DMTEnrollmentCompletionViewModel, "symbolNameForSuccessfulEnrollment");
    v14 = objc_claimAutoreleasedReturnValue();
    symbolName = v13->_symbolName;
    v13->_symbolName = (NSString *)v14;

    DMTSuccessfulEnrollmentTitleTextForDeviceClass(v12);
    v16 = objc_claimAutoreleasedReturnValue();
    title = v13->_title;
    v13->_title = (NSString *)v16;

    +[DMTEnrollmentCompletionViewModel detailTextForSuccessfulEnrollmentWithLocalizedDeviceClass:organizationName:organizationType:mdmServerName:](DMTEnrollmentCompletionViewModel, "detailTextForSuccessfulEnrollmentWithLocalizedDeviceClass:organizationName:organizationType:mdmServerName:", v12, v10, a4, v11);
    v18 = objc_claimAutoreleasedReturnValue();
    detailText = v13->_detailText;
    v13->_detailText = (NSString *)v18;

    DMTCompletionButtonTitleForDeviceClass(v12);
    v20 = objc_claimAutoreleasedReturnValue();
    buttonTitle = v13->_buttonTitle;
    v13->_buttonTitle = (NSString *)v20;

  }
  return v13;
}

- (id)initForEnrollmentFailureWithError:(id)a3 localizedDeviceClass:(id)a4
{
  id v6;
  id v7;
  DMTEnrollmentCompletionViewModel *v8;
  uint64_t v9;
  NSString *symbolName;
  uint64_t v11;
  NSString *title;
  uint64_t v13;
  NSString *detailText;
  uint64_t v15;
  NSString *verboseDescriptionText;
  uint64_t v17;
  NSString *linkButtonTitle;
  uint64_t v19;
  NSString *buttonTitle;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)DMTEnrollmentCompletionViewModel;
  v8 = -[DMTEnrollmentCompletionViewModel init](&v22, sel_init);
  if (v8)
  {
    +[DMTEnrollmentCompletionViewModel symbolNameForEnrollmentFailure](DMTEnrollmentCompletionViewModel, "symbolNameForEnrollmentFailure");
    v9 = objc_claimAutoreleasedReturnValue();
    symbolName = v8->_symbolName;
    v8->_symbolName = (NSString *)v9;

    +[DMTEnrollmentCompletionViewModel titleForEnrollmentFailureWithLocalizedDeviceClass:](DMTEnrollmentCompletionViewModel, "titleForEnrollmentFailureWithLocalizedDeviceClass:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    title = v8->_title;
    v8->_title = (NSString *)v11;

    +[DMTEnrollmentCompletionViewModel detailTextForEnrollmentFailureWithLocalizedDeviceClass:](DMTEnrollmentCompletionViewModel, "detailTextForEnrollmentFailureWithLocalizedDeviceClass:", v7);
    v13 = objc_claimAutoreleasedReturnValue();
    detailText = v8->_detailText;
    v8->_detailText = (NSString *)v13;

    +[DMTEnrollmentCompletionViewModel verboseDescriptionTextForError:](DMTEnrollmentCompletionViewModel, "verboseDescriptionTextForError:", v6);
    v15 = objc_claimAutoreleasedReturnValue();
    verboseDescriptionText = v8->_verboseDescriptionText;
    v8->_verboseDescriptionText = (NSString *)v15;

    +[DMTEnrollmentCompletionViewModel linkButtonTitle](DMTEnrollmentCompletionViewModel, "linkButtonTitle");
    v17 = objc_claimAutoreleasedReturnValue();
    linkButtonTitle = v8->_linkButtonTitle;
    v8->_linkButtonTitle = (NSString *)v17;

    DMTCompletionButtonTitleForDeviceClass(v7);
    v19 = objc_claimAutoreleasedReturnValue();
    buttonTitle = v8->_buttonTitle;
    v8->_buttonTitle = (NSString *)v19;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMTEnrollmentCompletionViewModel)initWithCoder:(id)a3
{
  id v4;
  DMTEnrollmentCompletionViewModel *v5;
  void *v6;
  NSString *v7;
  NSString *symbolName;
  void *v9;
  NSString *v10;
  NSString *title;
  void *v12;
  NSString *v13;
  NSString *detailText;
  void *v15;
  NSString *v16;
  NSString *verboseDescriptionText;
  void *v18;
  NSString *v19;
  NSString *linkButtonTitle;
  void *v21;
  NSString *v22;
  NSString *buttonTitle;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)DMTEnrollmentCompletionViewModel;
  v5 = -[DMTEnrollmentCompletionViewModel init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("symbolName"));
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    symbolName = v5->_symbolName;
    v5->_symbolName = v7;

    objc_storeStrong((id *)&v5->_symbolName, v7);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("title"));
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = v10;

    objc_storeStrong((id *)&v5->_title, v10);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("detailText"));
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    detailText = v5->_detailText;
    v5->_detailText = v13;

    objc_storeStrong((id *)&v5->_detailText, v13);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("verboseDescriptionText"));
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    verboseDescriptionText = v5->_verboseDescriptionText;
    v5->_verboseDescriptionText = v16;

    objc_storeStrong((id *)&v5->_verboseDescriptionText, v16);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("linkButtonTitle"));
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    linkButtonTitle = v5->_linkButtonTitle;
    v5->_linkButtonTitle = v19;

    objc_storeStrong((id *)&v5->_linkButtonTitle, v19);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("buttonTitle"));
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    buttonTitle = v5->_buttonTitle;
    v5->_buttonTitle = v22;

    objc_storeStrong((id *)&v5->_buttonTitle, v22);
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
  id v10;

  v4 = a3;
  -[DMTEnrollmentCompletionViewModel symbolName](self, "symbolName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("symbolName"));

  -[DMTEnrollmentCompletionViewModel title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("title"));

  -[DMTEnrollmentCompletionViewModel detailText](self, "detailText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("detailText"));

  -[DMTEnrollmentCompletionViewModel verboseDescriptionText](self, "verboseDescriptionText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("verboseDescriptionText"));

  -[DMTEnrollmentCompletionViewModel linkButtonTitle](self, "linkButtonTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("linkButtonTitle"));

  -[DMTEnrollmentCompletionViewModel buttonTitle](self, "buttonTitle");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("buttonTitle"));

}

- (BOOL)hasVerboseDescription
{
  void *v3;
  void *v4;
  BOOL v5;

  -[DMTEnrollmentCompletionViewModel verboseDescriptionText](self, "verboseDescriptionText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[DMTEnrollmentCompletionViewModel linkButtonTitle](self, "linkButtonTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)linkButtonTitle
{
  void *v2;
  void *v3;

  DMTBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("View Details…"), &stru_24E5A0848, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)symbolNameForSuccessfulEnrollment
{
  return CFSTR("checkmark.circle");
}

+ (id)detailTextForSuccessfulEnrollmentWithLocalizedDeviceClass:(id)a3 organizationName:(id)a4 organizationType:(int64_t)a5 mdmServerName:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v9 = a6;
  v10 = a3;
  DMTFormattedEnrollmentOrganizationNameFrom((uint64_t)a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  DMTLocalizedOrganizationMarketingNameForOrganizationType(a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    DMTDetailTextSuccessfulEnrollmentWithMDMServerFor(v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v13, CFSTR("%@%@%@"), 0, v11, v9, v12);
  }
  else
  {
    DMTDetailTextSuccessfulEnrollmentFor(v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v13, CFSTR("%@%@"), 0, v11, v12, v16);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)symbolNameForEnrollmentFailure
{
  return CFSTR("exclamationmark.triangle");
}

+ (id)titleForEnrollmentFailureWithLocalizedDeviceClass:(id)a3
{
  return DMTTitleTextFailureEnrollmentFor(a3);
}

+ (id)detailTextForEnrollmentFailureWithLocalizedDeviceClass:(id)a3
{
  return DMTDetailTextFailureEnrollmentFor(a3);
}

+ (id)verboseDescriptionTextForError:(id)a3
{
  return (id)objc_msgSend(a3, "verboseDescription");
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (NSString)verboseDescriptionText
{
  return self->_verboseDescriptionText;
}

- (NSString)linkButtonTitle
{
  return self->_linkButtonTitle;
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_linkButtonTitle, 0);
  objc_storeStrong((id *)&self->_verboseDescriptionText, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end
