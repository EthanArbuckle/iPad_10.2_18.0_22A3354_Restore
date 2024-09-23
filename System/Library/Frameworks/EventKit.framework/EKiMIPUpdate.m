@implementation EKiMIPUpdate

+ (BOOL)shouldSendEmailForEvent:(id)a3 withDiff:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _QWORD v29[11];

  v29[10] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(a3, "isSelfOrganized"))
  {
    objc_msgSend(v5, "differentKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0D0B308];
    v29[0] = *MEMORY[0x1E0D0B410];
    v29[1] = v7;
    v8 = *MEMORY[0x1E0D0B3D8];
    v29[2] = *MEMORY[0x1E0D0B3D0];
    v29[3] = v8;
    v9 = *MEMORY[0x1E0D0B3E0];
    v29[4] = *MEMORY[0x1E0D0B680];
    v29[5] = v9;
    v10 = *MEMORY[0x1E0D0B2B0];
    v29[6] = *MEMORY[0x1E0D0B270];
    v29[7] = v10;
    v11 = *MEMORY[0x1E0D0B2A8];
    v29[8] = *MEMORY[0x1E0D0B350];
    v29[9] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 10);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          if ((objc_msgSend(v6, "containsObject:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), (_QWORD)v24) & 1) != 0)
          {
            v20 = 1;
            v17 = v12;
            goto LABEL_16;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v14)
          continue;
        break;
      }
    }

    objc_msgSend(v5, "relationshipMultiValueAdds");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0D0B278];
    objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D0B278]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = 1;
    }
    else
    {
      objc_msgSend(v5, "relationshipMultiValueRemoves");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v22 != 0;

    }
LABEL_16:

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)attendees
{
  void *v2;
  void *v3;

  -[EKiMIPHandler event](self, "event");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attendees");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Event update: %@"), &stru_1E4789A58, CFSTR("iTIP"));
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
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
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
  int v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;

  -[EKiMIPHandler event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedLongDate");
  v43 = objc_claimAutoreleasedReturnValue();

  -[EKiMIPHandler event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isAllDay") & 1) != 0)
  {
    v44 = 0;
  }
  else
  {
    -[EKiMIPHandler event](self, "event");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedShortTime");
    v44 = objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0D0C298], "defaultProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v8, "myEmailAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLForMail:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

  v42 = (void *)v11;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB888]), "initWithURL:", v11);
  objc_msgSend(v8, "myShortDisplayName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCn:", v13);

  v14 = (void *)MEMORY[0x1E0D0C2B0];
  -[EKiMIPHandler event](self, "event");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v14, "requiresSingularLocalizationForDate:", v16);

  -[EKiMIPHandler event](self, "event");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v18, "isAllDay");

  if ((_DWORD)v16)
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    EKBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("%@ has updated the event: %@, scheduled for %@. To acknowledge this invitation, click the link below.\n"), &stru_1E4789A58, CFSTR("iTIP"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKiMIPHandler event](self, "event");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "title");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v19;
    v26 = (void *)v43;
    objc_msgSend(v25, "localizedStringWithFormat:", v21, v22, v24, v43);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
    v32 = (void *)v44;
    goto LABEL_15;
  }
  -[EKiMIPHandler event](self, "event");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isFloating");

  EKBundle();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  v32 = (void *)v44;
  if (!v29)
  {
    if (v17)
    {
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("iTIP update timed event singular hour"), CFSTR("%@ has updated the event: %@, scheduled for %@ at %@ (%@). To acknowledge this invitation, click the link below.\n"), CFSTR("iTIP"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v12, "displayName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKiMIPHandler event](self, "event");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "title");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKiMIPHandler event](self, "event");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "timeZone");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)v43;
      objc_msgSend(v40, "localizedStringWithFormat:", v20, v21, v23, v43, v44, v35);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("iTIP update timed event plural hour"), CFSTR("%@ has updated the event: %@, scheduled for %@ at %@ (%@). To acknowledge this invitation, click the link below.\n"), CFSTR("iTIP"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v12, "displayName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKiMIPHandler event](self, "event");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "title");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKiMIPHandler event](self, "event");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "timeZone");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "localizedStringWithFormat:", v20, v21, v23, v43, v44, v38);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = (void *)v43;
    }
    goto LABEL_14;
  }
  if (v17)
    v33 = CFSTR("iTIP update floating event singular hour");
  else
    v33 = CFSTR("iTIP update floating event plural hour");
  objc_msgSend(v30, "localizedStringForKey:value:table:", v33, CFSTR("%@ has updated the event: %@, scheduled for %@ at %@. To acknowledge this invitation, click the link below.\n"), CFSTR("iTIP"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v12, "displayName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKiMIPHandler event](self, "event");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "title");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)v43;
  objc_msgSend(v36, "localizedStringWithFormat:", v20, v21, v23, v43, v44);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v27;
}

- (id)emailAttachmentName
{
  return CFSTR("iCal-Request.ics");
}

- (int)icsMethod
{
  return 2;
}

@end
