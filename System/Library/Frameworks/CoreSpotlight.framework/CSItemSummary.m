@implementation CSItemSummary

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CSItemSummary)initWithItemSummaryType:(id)a3
{
  id v5;
  CSItemSummary *v6;
  CSItemSummary *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSItemSummary;
  v6 = -[CSItemSummary init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_type, a3);

  return v7;
}

- (CSItemSummary)initWithItemSummary:(id)a3 newContactScope:(int64_t)a4
{
  id v6;
  CSItemSummary *v7;
  CSItemSummary *v8;
  NSString *type;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSString *contactIdentifier;
  void *v14;
  uint64_t v15;
  NSArray *alternateNames;
  void *v17;
  uint64_t v18;
  NSArray *phoneNumbers;
  void *v20;
  uint64_t v21;
  NSArray *emailAddresses;
  void *v23;
  uint64_t v24;
  NSArray *allEmailAddresses;
  void *v26;
  uint64_t v27;
  NSPersonNameComponents *nameComponents;
  objc_super v30;

  v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CSItemSummary;
  v7 = -[CSItemSummary init](&v30, sel_init);
  v8 = v7;
  if (v7)
  {
    type = v7->_type;
    v7->_type = (NSString *)CFSTR("contact");

    objc_msgSend(v6, "name");
    v10 = objc_claimAutoreleasedReturnValue();
    name = v8->_name;
    v8->_name = (NSString *)v10;

    objc_msgSend(v6, "contactIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    contactIdentifier = v8->_contactIdentifier;
    v8->_contactIdentifier = (NSString *)v12;

    objc_msgSend(v6, "alternateNames");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    alternateNames = v8->_alternateNames;
    v8->_alternateNames = (NSArray *)v15;

    objc_msgSend(v6, "phoneNumbers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    phoneNumbers = v8->_phoneNumbers;
    v8->_phoneNumbers = (NSArray *)v18;

    objc_msgSend(v6, "emailAddresses");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    emailAddresses = v8->_emailAddresses;
    v8->_emailAddresses = (NSArray *)v21;

    objc_msgSend(v6, "allEmailAddresses");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    allEmailAddresses = v8->_allEmailAddresses;
    v8->_allEmailAddresses = (NSArray *)v24;

    objc_msgSend(v6, "nameComponents");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "copy");
    nameComponents = v8->_nameComponents;
    v8->_nameComponents = (NSPersonNameComponents *)v27;

    v8->_contactScope = a4;
  }

  return v8;
}

- (CSItemSummary)initWithName:(id)a3 contactIdentifier:(id)a4 alternateNames:(id)a5 phoneNumbers:(id)a6 emailAddresses:(id)a7 contactScope:(int64_t)a8
{
  return -[CSItemSummary initWithName:contactIdentifier:alternateNames:phoneNumbers:emailAddresses:allEmailAddresses:contactScope:](self, "initWithName:contactIdentifier:alternateNames:phoneNumbers:emailAddresses:allEmailAddresses:contactScope:", a3, a4, a5, a6, a7, a7, a8);
}

- (CSItemSummary)initWithName:(id)a3 contactIdentifier:(id)a4 alternateNames:(id)a5 phoneNumbers:(id)a6 emailAddresses:(id)a7 allEmailAddresses:(id)a8 contactScope:(int64_t)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  CSItemSummary *v22;
  CSItemSummary *v23;
  NSString *type;
  uint64_t v25;
  NSArray *alternateNames;
  uint64_t v27;
  NSArray *phoneNumbers;
  uint64_t v29;
  NSArray *emailAddresses;
  uint64_t v31;
  NSArray *allEmailAddresses;
  NSPersonNameComponents *nameComponents;
  objc_super v35;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v35.receiver = self;
  v35.super_class = (Class)CSItemSummary;
  v22 = -[CSItemSummary init](&v35, sel_init);
  v23 = v22;
  if (v22)
  {
    type = v22->_type;
    v22->_type = (NSString *)CFSTR("contact");

    objc_storeStrong((id *)&v23->_name, a3);
    v25 = objc_msgSend(v18, "copy");
    alternateNames = v23->_alternateNames;
    v23->_alternateNames = (NSArray *)v25;

    objc_storeStrong((id *)&v23->_contactIdentifier, a4);
    v27 = objc_msgSend(v19, "copy");
    phoneNumbers = v23->_phoneNumbers;
    v23->_phoneNumbers = (NSArray *)v27;

    v29 = objc_msgSend(v20, "copy");
    emailAddresses = v23->_emailAddresses;
    v23->_emailAddresses = (NSArray *)v29;

    v31 = objc_msgSend(v21, "copy");
    allEmailAddresses = v23->_allEmailAddresses;
    v23->_allEmailAddresses = (NSArray *)v31;

    v23->_contactScope = a9;
    nameComponents = v23->_nameComponents;
    v23->_nameComponents = 0;

  }
  return v23;
}

- (CSItemSummary)initWithName:(id)a3 contactIdentifier:(id)a4 alternateNames:(id)a5 phoneNumbers:(id)a6 emailAddresses:(id)a7 allEmailAddresses:(id)a8 nameComponents:(id)a9 contactScope:(int64_t)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  CSItemSummary *v23;
  CSItemSummary *v24;
  NSString *type;
  uint64_t v26;
  NSArray *alternateNames;
  uint64_t v28;
  NSArray *phoneNumbers;
  uint64_t v30;
  NSArray *emailAddresses;
  uint64_t v32;
  NSArray *allEmailAddresses;
  uint64_t v34;
  NSPersonNameComponents *nameComponents;
  id v37;
  objc_super v38;

  v37 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v38.receiver = self;
  v38.super_class = (Class)CSItemSummary;
  v23 = -[CSItemSummary init](&v38, sel_init);
  v24 = v23;
  if (v23)
  {
    type = v23->_type;
    v23->_type = (NSString *)CFSTR("contact");

    objc_storeStrong((id *)&v24->_name, a3);
    v26 = objc_msgSend(v18, "copy");
    alternateNames = v24->_alternateNames;
    v24->_alternateNames = (NSArray *)v26;

    objc_storeStrong((id *)&v24->_contactIdentifier, a4);
    v28 = objc_msgSend(v19, "copy");
    phoneNumbers = v24->_phoneNumbers;
    v24->_phoneNumbers = (NSArray *)v28;

    v30 = objc_msgSend(v20, "copy");
    emailAddresses = v24->_emailAddresses;
    v24->_emailAddresses = (NSArray *)v30;

    v32 = objc_msgSend(v21, "copy");
    allEmailAddresses = v24->_allEmailAddresses;
    v24->_allEmailAddresses = (NSArray *)v32;

    v24->_contactScope = a10;
    v34 = objc_msgSend(v22, "copy");
    nameComponents = v24->_nameComponents;
    v24->_nameComponents = (NSPersonNameComponents *)v34;

  }
  return v24;
}

- (CSItemSummary)initWithDateFrom:(id)a3 dateTo:(id)a4
{
  id v7;
  id v8;
  CSItemSummary *v9;
  CSItemSummary *v10;
  NSString *type;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CSItemSummary;
  v9 = -[CSItemSummary init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    type = v9->_type;
    v9->_type = (NSString *)CFSTR("date");

    objc_storeStrong((id *)&v10->_dateFrom, a3);
    objc_storeStrong((id *)&v10->_dateTo, a4);
  }

  return v10;
}

- (CSItemSummary)initWithTextQuery:(id)a3 textScope:(int64_t)a4
{
  id v7;
  CSItemSummary *v8;
  CSItemSummary *v9;
  NSString *type;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSItemSummary;
  v8 = -[CSItemSummary init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    type = v8->_type;
    v8->_type = (NSString *)CFSTR("text");

    objc_storeStrong((id *)&v9->_textQuery, a3);
    v9->_textScope = a4;
  }

  return v9;
}

- (CSItemSummary)initWithStatus:(int64_t)a3
{
  CSItemSummary *v4;
  CSItemSummary *v5;
  NSString *type;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSItemSummary;
  v4 = -[CSItemSummary init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    type = v4->_type;
    v4->_type = (NSString *)CFSTR("status");

    v5->_statusValue = a3;
  }
  return v5;
}

- (CSItemSummary)initWithAttachmentQuery:(id)a3 attachmentScope:(int64_t)a4
{
  id v7;
  CSItemSummary *v8;
  CSItemSummary *v9;
  NSString *type;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSItemSummary;
  v8 = -[CSItemSummary init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    type = v8->_type;
    v8->_type = (NSString *)CFSTR("attachment");

    objc_storeStrong((id *)&v9->_attachmentQuery, a3);
    v9->_attachmentScope = a4;
  }

  return v9;
}

- (CSItemSummary)initWithSenderContainsQuery:(id)a3 senderContainsSearchString:(id)a4 senderContainsScope:(int64_t)a5
{
  id v9;
  id v10;
  CSItemSummary *v11;
  CSItemSummary *v12;
  NSString *type;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CSItemSummary;
  v11 = -[CSItemSummary init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    type = v11->_type;
    v11->_type = (NSString *)CFSTR("sender");

    objc_storeStrong((id *)&v12->_senderContainsQuery, a3);
    v12->_senderContainsScope = a5;
    objc_storeStrong((id *)&v12->_senderContainsSearchString, a4);
  }

  return v12;
}

- (CSItemSummary)initWithCoder:(id)a3
{
  id v4;
  CSItemSummary *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *contactIdentifier;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *alternateNames;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSArray *phoneNumbers;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSArray *emailAddresses;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSArray *allEmailAddresses;
  uint64_t v30;
  NSPersonNameComponents *nameComponents;
  uint64_t v32;
  NSDate *dateFrom;
  uint64_t v34;
  NSDate *dateTo;
  uint64_t v36;
  NSString *textQuery;
  uint64_t v38;
  NSString *attachmentQuery;
  uint64_t v40;
  NSString *senderContainsQuery;
  uint64_t v42;
  NSString *senderContainsSearchString;
  void *v44;
  const __CFString *v45;
  NSString *type;
  objc_super v48;
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[3];

  v52[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)CSItemSummary;
  v5 = -[CSItemSummary init](&v48, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v52[0] = objc_opt_class();
    v52[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("alternateNames"));
    v13 = objc_claimAutoreleasedReturnValue();
    alternateNames = v5->_alternateNames;
    v5->_alternateNames = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v51[0] = objc_opt_class();
    v51[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("phoneNumbers"));
    v18 = objc_claimAutoreleasedReturnValue();
    phoneNumbers = v5->_phoneNumbers;
    v5->_phoneNumbers = (NSArray *)v18;

    v20 = (void *)MEMORY[0x1E0C99E60];
    v50[0] = objc_opt_class();
    v50[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWithArray:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("emailAddresses"));
    v23 = objc_claimAutoreleasedReturnValue();
    emailAddresses = v5->_emailAddresses;
    v5->_emailAddresses = (NSArray *)v23;

    v25 = (void *)MEMORY[0x1E0C99E60];
    v49[0] = objc_opt_class();
    v49[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setWithArray:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("allEmailAddresses"));
    v28 = objc_claimAutoreleasedReturnValue();
    allEmailAddresses = v5->_allEmailAddresses;
    v5->_allEmailAddresses = (NSArray *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nameComponents"));
    v30 = objc_claimAutoreleasedReturnValue();
    nameComponents = v5->_nameComponents;
    v5->_nameComponents = (NSPersonNameComponents *)v30;

    v5->_contactScope = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("contactScope"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateFrom"));
    v32 = objc_claimAutoreleasedReturnValue();
    dateFrom = v5->_dateFrom;
    v5->_dateFrom = (NSDate *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateTo"));
    v34 = objc_claimAutoreleasedReturnValue();
    dateTo = v5->_dateTo;
    v5->_dateTo = (NSDate *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textQuery"));
    v36 = objc_claimAutoreleasedReturnValue();
    textQuery = v5->_textQuery;
    v5->_textQuery = (NSString *)v36;

    v5->_textScope = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("textScope"));
    v5->_statusValue = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("statusValue"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attachmentQuery"));
    v38 = objc_claimAutoreleasedReturnValue();
    attachmentQuery = v5->_attachmentQuery;
    v5->_attachmentQuery = (NSString *)v38;

    v5->_attachmentScope = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("attachmentScope"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderContainsQuery"));
    v40 = objc_claimAutoreleasedReturnValue();
    senderContainsQuery = v5->_senderContainsQuery;
    v5->_senderContainsQuery = (NSString *)v40;

    v5->_senderContainsScope = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("senderContainsScope"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderContainsSearchString"));
    v42 = objc_claimAutoreleasedReturnValue();
    senderContainsSearchString = v5->_senderContainsSearchString;
    v5->_senderContainsSearchString = (NSString *)v42;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = CFSTR("contact");
    if (objc_msgSend(v44, "isEqualToString:", CFSTR("contact"))
      || (v45 = CFSTR("date"), objc_msgSend(v44, "isEqualToString:", CFSTR("date")))
      || (v45 = CFSTR("text"), objc_msgSend(v44, "isEqualToString:", CFSTR("text")))
      || (v45 = CFSTR("status"), objc_msgSend(v44, "isEqualToString:", CFSTR("status")))
      || (v45 = CFSTR("attachment"), objc_msgSend(v44, "isEqualToString:", CFSTR("attachment")))
      || (v45 = CFSTR("sender"), objc_msgSend(v44, "isEqualToString:", CFSTR("sender"))))
    {
      type = v5->_type;
      v5->_type = (NSString *)v45;

    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v24;
  void *v25;
  uint64_t v26;

  -[CSItemSummary type](self, "type", a3);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v4 == CFSTR("contact"))
  {
    v12 = objc_alloc((Class)objc_opt_class());
    -[CSItemSummary name](self, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSItemSummary contactIdentifier](self, "contactIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSItemSummary alternateNames](self, "alternateNames");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSItemSummary phoneNumbers](self, "phoneNumbers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSItemSummary emailAddresses](self, "emailAddresses");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSItemSummary allEmailAddresses](self, "allEmailAddresses");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v12, "initWithName:contactIdentifier:alternateNames:phoneNumbers:emailAddresses:allEmailAddresses:contactScope:", v13, v14, v15, v16, v17, v18, -[CSItemSummary contactScope](self, "contactScope"));

  }
  else
  {
    -[CSItemSummary type](self, "type");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v5 == CFSTR("date"))
    {
      v20 = objc_alloc((Class)objc_opt_class());
      -[CSItemSummary dateFrom](self, "dateFrom");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSItemSummary dateTo](self, "dateTo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v20, "initWithDateFrom:dateTo:", v21, v22);

      return v11;
    }
    -[CSItemSummary type](self, "type");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v6 == CFSTR("text"))
    {
      v24 = objc_alloc((Class)objc_opt_class());
      -[CSItemSummary textQuery](self, "textQuery");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "initWithTextQuery:textScope:", v25, -[CSItemSummary textScope](self, "textScope"));
    }
    else
    {
      -[CSItemSummary type](self, "type");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v7 == CFSTR("status"))
        return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStatus:", -[CSItemSummary statusValue](self, "statusValue"));
      -[CSItemSummary type](self, "type");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v9 = objc_alloc((Class)objc_opt_class());
      if (v8 != CFSTR("attachment"))
      {
        -[CSItemSummary type](self, "type");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v9, "initWithItemSummaryType:", v10);

        return v11;
      }
      -[CSItemSummary attachmentQuery](self, "attachmentQuery");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v9, "initWithAttachmentQuery:attachmentScope:", v25, -[CSItemSummary attachmentScope](self, "attachmentScope"));
    }
    v19 = (void *)v26;

  }
  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;
  id v6;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contactIdentifier, CFSTR("contactIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_alternateNames, CFSTR("alternateNames"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneNumbers, CFSTR("phoneNumbers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_emailAddresses, CFSTR("emailAddresses"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_allEmailAddresses, CFSTR("allEmailAddresses"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_contactScope, CFSTR("contactScope"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nameComponents, CFSTR("nameComponents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateFrom, CFSTR("dateFrom"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateTo, CFSTR("dateTo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_textQuery, CFSTR("textQuery"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_textScope, CFSTR("textScope"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_statusValue, CFSTR("statusValue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attachmentQuery, CFSTR("attachmentQuery"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_attachmentScope, CFSTR("attachmentScope"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_senderContainsQuery, CFSTR("senderContainsQuery"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_senderContainsScope, CFSTR("senderContainsScope"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_senderContainsSearchString, CFSTR("senderContainsSearchString"));
  -[CSItemSummary type](self, "type");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("type"));

}

- (NSString)type
{
  return self->_type;
}

- (id)name
{
  return self->_name;
}

- (id)alternateNames
{
  return self->_alternateNames;
}

- (id)emailAddresses
{
  return self->_emailAddresses;
}

- (id)allEmailAddresses
{
  return self->_allEmailAddresses;
}

- (id)nameComponents
{
  return self->_nameComponents;
}

- (void)setNameComponents:(id)a3
{
  objc_storeStrong((id *)&self->_nameComponents, a3);
}

- (id)phoneNumbers
{
  return self->_phoneNumbers;
}

- (id)contactIdentifier
{
  return self->_contactIdentifier;
}

- (int64_t)contactScope
{
  return self->_contactScope;
}

- (id)dateFrom
{
  return self->_dateFrom;
}

- (id)dateTo
{
  return self->_dateTo;
}

- (id)textQuery
{
  return self->_textQuery;
}

- (int64_t)textScope
{
  return self->_textScope;
}

- (int64_t)statusValue
{
  return self->_statusValue;
}

- (id)attachmentQuery
{
  return self->_attachmentQuery;
}

- (int64_t)attachmentScope
{
  return self->_attachmentScope;
}

- (id)senderContainsQuery
{
  return self->_senderContainsQuery;
}

- (id)senderContainsSearchString
{
  return self->_senderContainsSearchString;
}

- (int64_t)senderContainsScope
{
  return self->_senderContainsScope;
}

- (CSSearchableItem)sourceItem
{
  return self->_sourceItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceItem, 0);
  objc_storeStrong((id *)&self->_senderContainsSearchString, 0);
  objc_storeStrong((id *)&self->_senderContainsQuery, 0);
  objc_storeStrong((id *)&self->_attachmentQuery, 0);
  objc_storeStrong((id *)&self->_textQuery, 0);
  objc_storeStrong((id *)&self->_dateTo, 0);
  objc_storeStrong((id *)&self->_dateFrom, 0);
  objc_storeStrong((id *)&self->_allEmailAddresses, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_alternateNames, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
