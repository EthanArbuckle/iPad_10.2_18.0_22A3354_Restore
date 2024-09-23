@implementation CUIKAvailabilityUtils

+ (id)participantsForAvailabilityViewControllerFromEvent:(id)a3
{
  id v3;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v3, "attendees");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count") + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "organizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isSelfOrganized") && !v7)
  {
    objc_msgSend(v3, "calendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ownerIdentityOrganizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "addObject:", v7);
  }
  else
  {
    objc_msgSend(v3, "calendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "source");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ownerAddresses");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "anyObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_9;
    objc_msgSend((id)objc_opt_class(), "_selfOrganizerForNewlyScheduledEventWithAddress:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v14);

  }
LABEL_9:
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v3, "attendees", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v20, "URL");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "absoluteString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22 && (objc_msgSend(v20, "isEqualToParticipant:", v7) & 1) == 0)
          objc_msgSend(v6, "addObject:", v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v17);
  }

  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

uint64_t __76__CUIKAvailabilityUtils_participantsForAvailabilityViewControllerFromEvent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a2;
  v5 = a3;
  if ((objc_msgSend(v4, "isCurrentUser") & 1) != 0)
    goto LABEL_2;
  if ((objc_msgSend(v5, "isCurrentUser") & 1) != 0)
  {
LABEL_4:
    v6 = 1;
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || objc_msgSend(v4, "isLocationRoom") && !objc_msgSend(v5, "isLocationRoom"))
  {
    goto LABEL_4;
  }
  if ((objc_msgSend(v4, "isLocationRoom") & 1) == 0 && (objc_msgSend(v5, "isLocationRoom") & 1) != 0)
  {
LABEL_2:
    v6 = -1;
    goto LABEL_5;
  }
  objc_msgSend(&unk_1E6ED70D0, "objectAtIndexedSubscript:", objc_msgSend(v4, "participantRole"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E6ED70D0, "objectAtIndexedSubscript:", objc_msgSend(v5, "participantRole"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v9, "compare:", v8);
  if (!v6)
  {
    objc_msgSend(v4, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v10, "compare:", v11);

  }
LABEL_5:

  return v6;
}

+ (id)_selfOrganizerForNewlyScheduledEventWithAddress:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0D0C298];
  v4 = a3;
  objc_msgSend(v3, "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "myFullName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6 || !objc_msgSend(v6, "length"))
  {
    CUIKBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("You"), &stru_1E6EBAE30, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v4);

  objc_msgSend(MEMORY[0x1E0CAA0D0], "organizerWithName:emailAddress:phoneNumber:address:isCurrentUser:", v7, 0, 0, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
