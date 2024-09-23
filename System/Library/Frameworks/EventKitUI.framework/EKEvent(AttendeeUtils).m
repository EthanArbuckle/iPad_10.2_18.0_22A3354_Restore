@implementation EKEvent(AttendeeUtils)

- (uint64_t)sortEKParticipantsIgnoringNonHumans:()AttendeeUtils
{
  return objc_msgSend(MEMORY[0x1E0D0CD18], "sortEKParticipantsIgnoringNonHumans:event:", a3, a1);
}

- (id)sortedEKParticipantsDisplayStringsIgnoringNonHumans:()AttendeeUtils
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  os_log_t *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  EKParticipantForDisplay *v22;
  void *v23;
  os_log_t *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  _BYTE v45[128];
  uint64_t v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D0CD18], "sortedEKParticipantsForSortingIgnoringNonHumans:event:", a3, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = *MEMORY[0x1E0DC1138];
  v47[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v7 = v3;
  v37 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v37)
  {
    v8 = (os_log_t *)&kEKUILogHandle;
    v36 = *(_QWORD *)v40;
    v33 = v4;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v40 != v36)
          objc_enumerationMutation(v7);
        v10 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v10, "participant");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "displayName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = objc_alloc(MEMORY[0x1E0CB3778]);
          objc_msgSend(v10, "displayName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v13, "initWithString:attributes:", v14, v5);

          v16 = (void *)MEMORY[0x1E0D0CD90];
          objc_msgSend(v11, "comment");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithAutoCommentRemoved:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v38 = v18;
          if (objc_msgSend(v18, "length"))
          {
            v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
            objc_msgSend(v15, "appendAttributedString:", v19);

            objc_msgSend(MEMORY[0x1E0D0CDF8], "sharedInstance");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "commentIconStringForFont:", v4);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "appendAttributedString:", v21);

          }
          v22 = objc_alloc_init(EKParticipantForDisplay);
          -[EKParticipantForDisplay setOptionalParticipant:](v22, "setOptionalParticipant:", 0);
          if (v15)
          {
            if (objc_msgSend(v11, "participantRole") == 2)
            {
              v34 = (void *)MEMORY[0x1E0CB3940];
              EventKitUIBundle();
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("optional"), &stru_1E601DFA8, 0);
              v24 = v8;
              v25 = v7;
              v26 = v5;
              v27 = v6;
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "stringWithFormat:", CFSTR(" (%@)"), v28);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              v6 = v27;
              v5 = v26;
              v7 = v25;
              v8 = v24;

              v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v35, v5);
              objc_msgSend(v15, "appendAttributedString:", v29);
              -[EKParticipantForDisplay setOptionalParticipant:](v22, "setOptionalParticipant:", 1);

              v4 = v33;
            }
            -[EKParticipantForDisplay setDisplayString:](v22, "setDisplayString:", v15);
            objc_msgSend(v6, "addObject:", v22);
          }
          else
          {
            v31 = *v8;
            if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v44 = v11;
              _os_log_impl(&dword_1AF84D000, v31, OS_LOG_TYPE_ERROR, "Unable to get display name for participant %@", buf, 0xCu);
            }
          }

        }
        else
        {
          v30 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v44 = v11;
            _os_log_impl(&dword_1AF84D000, v30, OS_LOG_TYPE_ERROR, "Unable to get display name for participant %@", buf, 0xCu);
          }
        }

      }
      v37 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v37);
  }

  return v6;
}

- (uint64_t)hasHumanInviteesToDisplay
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "hasAttendees"))
    return 0;
  objc_msgSend(a1, "attendees");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v19 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v7 = objc_msgSend(v6, "participantType");
        objc_msgSend(v6, "name");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "length"))
        {
          v9 = 0;
        }
        else
        {
          objc_msgSend(v6, "URL");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "resourceSpecifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v11, "length") == 0;

        }
        objc_msgSend(a1, "organizer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v6, "isEqualToParticipant:", v12);

        if ((v13 & 1) == 0 && (v7 & 0xFFFFFFFFFFFFFFFELL) != 2 && !v9)
        {
          v15 = 1;
          goto LABEL_20;
        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v3)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_20:

  return v15;
}

@end
