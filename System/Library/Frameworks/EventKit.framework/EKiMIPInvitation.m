@implementation EKiMIPInvitation

- (EKiMIPInvitation)initWithEvent:(id)a3 withDiff:(id)a4
{
  id v6;
  EKiMIPInvitation *v7;
  void *v8;
  uint64_t v9;
  NSSet *attendees;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EKiMIPInvitation;
  v7 = -[EKiMIPHandler initWithEvent:](&v12, sel_initWithEvent_, a3);
  if (v7)
  {
    objc_msgSend(v6, "relationshipMultiValueAdds");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D0B278]);
    v9 = objc_claimAutoreleasedReturnValue();
    attendees = v7->_attendees;
    v7->_attendees = (NSSet *)v9;

  }
  return v7;
}

+ (BOOL)shouldSendEmailForEvent:(id)a3 withDiff:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  v5 = a4;
  if (objc_msgSend(a3, "isSelfOrganized"))
  {
    objc_msgSend(v5, "relationshipMultiValueAdds");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D0B278]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v7 != 0;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)attendees
{
  return -[NSSet allObjects](self->_attendees, "allObjects");
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
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Event invitation: %@"), &stru_1E4789A58, CFSTR("iTIP"));
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
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
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
  int v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;

  -[EKiMIPHandler event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedLongDate");
  v42 = objc_claimAutoreleasedReturnValue();

  -[EKiMIPHandler event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isAllDay") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    -[EKiMIPHandler event](self, "event");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedShortTime");
    v6 = objc_claimAutoreleasedReturnValue();

  }
  v41 = (void *)v6;

  v9 = (void *)MEMORY[0x1E0D0C2B0];
  -[EKiMIPHandler event](self, "event");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "requiresSingularLocalizationForDate:", v11);

  objc_msgSend(MEMORY[0x1E0D0C298], "defaultProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v13, "myEmailAddress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URLForMail:", v15);
  v16 = objc_claimAutoreleasedReturnValue();

  v40 = (void *)v16;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB888]), "initWithURL:", v16);
  objc_msgSend(v13, "myShortDisplayName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCn:", v18);

  -[EKiMIPHandler event](self, "event");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isAllDay");

  if (v20)
  {
    v21 = (void *)MEMORY[0x1E0CB3940];
    EKBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("%@ has invited you to the event: %@, scheduled for %@. To accept or decline this invitation, click the link below.\n"), &stru_1E4789A58, CFSTR("iTIP"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "displayName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKiMIPHandler event](self, "event");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "title");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)v42;
    objc_msgSend(v21, "localizedStringWithFormat:", v23, v24, v26, v42);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v41;
  }
  else
  {
    -[EKiMIPHandler event](self, "event");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isFloating");

    v39 = (void *)MEMORY[0x1E0CB3940];
    EKBundle();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v32;
    v27 = (void *)v42;
    if (v31)
    {
      if (v12)
        v33 = CFSTR("itip invitation singular");
      else
        v33 = CFSTR("itip invitation plural");
      objc_msgSend(v32, "localizedStringForKey:value:table:", v33, CFSTR("%@ has invited you to the event: %@, scheduled for %@ at %@. To accept or decline this invitation, click the link below.\n"), CFSTR("iTIP"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "displayName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKiMIPHandler event](self, "event");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "title");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v41;
      objc_msgSend(v39, "localizedStringWithFormat:", v23, v24, v26, v42, v41);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = v32;
      if (v12)
      {
        objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("itip invitation with timezone singular"), CFSTR("%@ has invited you to the event: %@, scheduled for %@ at %@ (%@). To accept or decline this invitation, click the link below.\n"), CFSTR("iTIP"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "displayName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKiMIPHandler event](self, "event");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "title");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKiMIPHandler event](self, "event");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "timeZone");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v41;
        v27 = (void *)v42;
        objc_msgSend(v39, "localizedStringWithFormat:", v23, v24, v26, v42, v41, v34);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("itip invitation with timezone plural"), CFSTR("%@ has invited you to the event: %@, scheduled for %@ at %@ (%@). To accept or decline this invitation, click the link below.\n"), CFSTR("iTIP"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "displayName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKiMIPHandler event](self, "event");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "title");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKiMIPHandler event](self, "event");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "timeZone");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)v42;
        objc_msgSend(v39, "localizedStringWithFormat:", v23, v24, v26, v42, v41, v35);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = v41;
      }
      v22 = v38;

    }
  }

  return v28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attendees, 0);
}

@end
