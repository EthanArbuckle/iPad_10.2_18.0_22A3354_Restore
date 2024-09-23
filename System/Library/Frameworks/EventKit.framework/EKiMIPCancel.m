@implementation EKiMIPCancel

+ (BOOL)shouldSendEmailForEvent:(id)a3 removedAttendees:(id *)a4
{
  id v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = a3;
  if (objc_msgSend(v5, "isSelfOrganized"))
  {
    if ((objc_msgSend(v5, "isDeleted") & 1) != 0)
    {
      v6 = 1;
    }
    else if (a4)
    {
      objc_msgSend(v5, "diffFromCommitted");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "relationshipMultiValueRemoves");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D0B278]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v9, "count");
      v6 = v10 != 0;
      if (v10)
        *a4 = objc_retainAutorelease(v9);

    }
    else
    {
      v6 = objc_msgSend(v5, "hasAttendees");
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (EKiMIPCancel)initWithEvent:(id)a3 andAttendees:(id)a4
{
  id v7;
  EKiMIPCancel *v8;
  EKiMIPCancel *v9;
  void *v10;
  uint64_t v11;
  NSData *attachmentData;
  objc_super v14;

  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EKiMIPCancel;
  v8 = -[EKiMIPHandler initWithEvent:](&v14, sel_initWithEvent_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_attendees, a4);
    -[EKiMIPHandler iCalendarDocumentWithMethod:](v9, "iCalendarDocumentWithMethod:", -[EKiMIPCancel icsMethod](v9, "icsMethod"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ICSDataWithOptions:", 0);
    v11 = objc_claimAutoreleasedReturnValue();
    attachmentData = v9->_attachmentData;
    v9->_attachmentData = (NSData *)v11;

  }
  return v9;
}

- (id)attachmentData
{
  return self->_attachmentData;
}

- (id)attendees
{
  return self->_attendees;
}

- (id)emailSubject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  EKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Event canceled: %@"), &stru_1E4789A58, CFSTR("iTIP"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKiMIPHandler event](self, "event");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)emailBody
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  EKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("%@ has canceled the event: %@. To handle this cancellation, click the link below.\n"), &stru_1E4789A58, CFSTR("iTIP"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0C298], "defaultProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "myShortDisplayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKiMIPHandler event](self, "event");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v5, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)emailAttachmentName
{
  return CFSTR("iCal-Cancel.ics");
}

- (int)icsMethod
{
  return 5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentData, 0);
  objc_storeStrong((id *)&self->_attendees, 0);
}

@end
