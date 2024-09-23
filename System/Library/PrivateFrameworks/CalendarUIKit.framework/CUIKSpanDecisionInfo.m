@implementation CUIKSpanDecisionInfo

+ (id)spanDecisionInfoForEvents:(id)a3
{
  id v3;
  CUIKSpanDecisionInfo *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  int v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  int v33;
  uint64_t v35;
  CUIKSpanDecisionInfo *v36;
  uint64_t v38;
  id obj;
  uint64_t v40;
  char v41;
  void *v42;
  void *v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(CUIKSpanDecisionInfo);
  v43 = (void *)objc_opt_new();
  v42 = (void *)objc_opt_new();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (!v5)
  {
    LOBYTE(v7) = 0;
    v44 = 0;
    v8 = 0;
    goto LABEL_33;
  }
  v6 = v5;
  LOBYTE(v7) = 0;
  v44 = 0;
  v8 = 0;
  v9 = *(_QWORD *)v50;
  v35 = *(_QWORD *)v50;
  v36 = v4;
  do
  {
    v10 = 0;
    v38 = v6;
    do
    {
      if (*(_QWORD *)v50 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v10);
      if ((objc_msgSend(v11, "isOnlyOccurrence", v35, v36) & 1) != 0)
      {
        v40 = v10;
        v41 = v7;
        objc_msgSend(v11, "eventStore");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "eventsWithSameRecurrenceSetAsEvent:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v46 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
              objc_msgSend(v19, "eventOccurrenceID");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "eventOccurrenceID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v20, "isEqualToString:", v21);

              if ((v22 & 1) == 0)
              {
                ++v8;
                v23 = objc_msgSend(v19, "isFirstOccurrenceIncludingSlices");
                objc_msgSend(v19, "localUID");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (v23)
                {
                  objc_msgSend(v43, "addObject:", v24);

                }
                else
                {
                  objc_msgSend(v42, "addObject:", v24);

                  v25 = objc_msgSend(v19, "currentUserGeneralizedParticipantRole");
                  v26 = v44;
                  if (v25 == 1)
                    v26 = v44 + 1;
                  v44 = v26;
                }
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
          }
          while (v16);
        }

        v9 = v35;
        v4 = v36;
        v6 = v38;
        v10 = v40;
        if ((v41 & 1) == 0)
          goto LABEL_24;
      }
      else
      {
        ++v8;
        v27 = objc_msgSend(v11, "isFirstOccurrenceIncludingSlices");
        objc_msgSend(v11, "localUID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          objc_msgSend(v43, "addObject:", v28);

          if ((v7 & 1) == 0)
            goto LABEL_24;
        }
        else
        {
          objc_msgSend(v42, "addObject:", v28);

          v29 = objc_msgSend(v11, "currentUserGeneralizedParticipantRole");
          v30 = v44;
          if (v29 == 1)
            v30 = v44 + 1;
          v44 = v30;
          if ((v7 & 1) == 0)
          {
LABEL_24:
            v7 = objc_msgSend(a1, "_allowSlicingEvent:", v11) ^ 1;
            goto LABEL_29;
          }
        }
      }
      LOBYTE(v7) = 1;
LABEL_29:
      ++v10;
    }
    while (v10 != v6);
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  }
  while (v6);
LABEL_33:

  -[CUIKSpanDecisionInfo setShouldRequestSpan:](v4, "setShouldRequestSpan:", v8 > 0);
  v31 = objc_msgSend(v42, "isSubsetOfSet:", v43);
  if ((v7 & 1) != 0)
  {
    v32 = 0;
  }
  else
  {
    v33 = v31;
    if (-[CUIKSpanDecisionInfo shouldRequestSpan](v4, "shouldRequestSpan"))
      v32 = (v44 == 0) & ~v33;
    else
      v32 = 0;
  }
  -[CUIKSpanDecisionInfo setProposeFuture:](v4, "setProposeFuture:", v32);
  -[CUIKSpanDecisionInfo setRecurringEventCount:](v4, "setRecurringEventCount:", v8);

  return v4;
}

+ (BOOL)_allowSlicingEvent:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (v5 == 4)
    goto LABEL_2;
  objc_msgSend(v3, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "sourceType");

  if (v9 != 1)
  {
    LOBYTE(v6) = 1;
    goto LABEL_7;
  }
  if ((objc_msgSend(v3, "hasAttendees") & 1) != 0)
  {
LABEL_2:
    LOBYTE(v6) = 0;
  }
  else
  {
    objc_msgSend(v3, "masterEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v10, "hasAttendees") ^ 1;

  }
LABEL_7:

  return v6;
}

- (BOOL)shouldRequestSpan
{
  return self->_shouldRequestSpan;
}

- (void)setShouldRequestSpan:(BOOL)a3
{
  self->_shouldRequestSpan = a3;
}

- (BOOL)proposeFuture
{
  return self->_proposeFuture;
}

- (void)setProposeFuture:(BOOL)a3
{
  self->_proposeFuture = a3;
}

- (int64_t)recurringEventCount
{
  return self->_recurringEventCount;
}

- (void)setRecurringEventCount:(int64_t)a3
{
  self->_recurringEventCount = a3;
}

@end
