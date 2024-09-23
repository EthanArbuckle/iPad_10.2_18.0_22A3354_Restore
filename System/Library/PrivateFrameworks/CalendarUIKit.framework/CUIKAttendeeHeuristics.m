@implementation CUIKAttendeeHeuristics

+ (id)sortedHumanAttendeesToDisplayForEvent:(id)a3 options:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[CUIKAttendeeHeuristics sortedHumanAttendeesForEvent:includeResources:](CUIKAttendeeHeuristics, "sortedHumanAttendeesForEvent:includeResources:", v5, (a4 >> 1) & 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "organizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v11 = v10;

  if ((a4 & 1) == 0)
  {
    objc_msgSend(v5, "selfAttendee");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v13 = v6;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v21;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v21 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            if (objc_msgSend(v18, "isEqualToParticipant:", v12, (_QWORD)v20))
            {
              objc_msgSend(v11, "removeObject:", v18);
              goto LABEL_16;
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v15)
            continue;
          break;
        }
      }
LABEL_16:

    }
  }
  if (v7 && (objc_msgSend(v7, "isCurrentUser") & 1) == 0)
    objc_msgSend(v11, "insertObject:atIndex:", v7, 0);

  return v11;
}

+ (id)sortedHumanAttendeesForEvent:(id)a3 includeResources:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v16;
  int v17;
  BOOL v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  const __CFString *v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v4 = a4;
  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "attendees");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v5;
  objc_msgSend(v5, "organizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  v32 = v9;
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v35;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v13);
        v15 = objc_msgSend(v14, "participantType");
        v16 = objc_msgSend(v14, "isEqualToParticipant:", v7);
        v17 = v15 != 3 || v4;
        if (v16)
          v18 = 1;
        else
          v18 = v15 == 2;
        if (!v18 && v17 != 0)
        {
          objc_msgSend(v14, "name");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "length"))
            goto LABEL_19;
          objc_msgSend(v14, "emailAddress");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v21, "length"))
          {

LABEL_19:
LABEL_20:
            objc_msgSend(v8, "addObject:", v14);
            goto LABEL_21;
          }
          objc_msgSend(v14, "phoneNumber");
          v22 = v7;
          v23 = v8;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v24, "length");

          v8 = v23;
          v7 = v22;
          v9 = v32;

          if (v33)
            goto LABEL_20;
        }
LABEL_21:
        ++v13;
      }
      while (v11 != v13);
      v25 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      v11 = v25;
    }
    while (v25);
  }

  v26 = (void *)MEMORY[0x1E0C99E08];
  v38 = CFSTR("DisplayNameCache");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "dictionaryWithDictionary:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v31, CFSTR("Event"));
  if (v7)
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v7, CFSTR("Organizer"));
  objc_msgSend(v8, "sortUsingFunction:context:", CUIKParticipantDisplaySort, v29);

  return v8;
}

+ (id)_participantStatusSortPriority
{
  if (_participantStatusSortPriority_onceToken != -1)
    dispatch_once(&_participantStatusSortPriority_onceToken, &__block_literal_global_26);
  return (id)_participantStatusSortPriority__sParticipantStatusSortPriority;
}

void __56__CUIKAttendeeHeuristics__participantStatusSortPriority__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6ED6D98;
  v2[1] = &unk_1E6ED6DC8;
  v3[0] = &unk_1E6ED6DB0;
  v3[1] = &unk_1E6ED6DE0;
  v2[2] = &unk_1E6ED6DF8;
  v2[3] = &unk_1E6ED6E28;
  v3[2] = &unk_1E6ED6E10;
  v3[3] = &unk_1E6ED6E40;
  v2[4] = &unk_1E6ED6E58;
  v2[5] = &unk_1E6ED6E70;
  v3[4] = &unk_1E6ED6E40;
  v3[5] = &unk_1E6ED6E88;
  v2[6] = &unk_1E6ED6EA0;
  v2[7] = &unk_1E6ED6ED0;
  v3[6] = &unk_1E6ED6EB8;
  v3[7] = &unk_1E6ED6EE8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_participantStatusSortPriority__sParticipantStatusSortPriority;
  _participantStatusSortPriority__sParticipantStatusSortPriority = v0;

}

+ (id)_participantRoleSortPriority
{
  if (_participantRoleSortPriority_onceToken != -1)
    dispatch_once(&_participantRoleSortPriority_onceToken, &__block_literal_global_31);
  return (id)_participantRoleSortPriority__sParticipantRoleSortPriority;
}

void __54__CUIKAttendeeHeuristics__participantRoleSortPriority__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6ED6DF8;
  v2[1] = &unk_1E6ED6E28;
  v3[0] = &unk_1E6ED6DB0;
  v3[1] = &unk_1E6ED6DE0;
  v2[2] = &unk_1E6ED6E58;
  v2[3] = &unk_1E6ED6D98;
  v3[2] = &unk_1E6ED6DE0;
  v3[3] = &unk_1E6ED6E10;
  v2[4] = &unk_1E6ED6DC8;
  v3[4] = &unk_1E6ED6E40;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_participantRoleSortPriority__sParticipantRoleSortPriority;
  _participantRoleSortPriority__sParticipantRoleSortPriority = v0;

}

@end
