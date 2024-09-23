@implementation GKTurnBasedMatch(TurnBased)

- (uint64_t)isAllAutomatchedPlayer
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  uint64_t v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a1, "participants");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v17 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v5, "internal");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "playerID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D25330], "local");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "playerID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v7, "isEqualToString:", v9);

        if ((v10 & 1) == 0)
        {
          objc_msgSend(v5, "internal");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isAutomatchParticipant");

          if (!v12)
          {
            v13 = 0;
            goto LABEL_12;
          }
        }
      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v2)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_12:

  return v13;
}

- (id)matchTitle
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  if (objc_msgSend(a1, "isAllAutomatchedPlayer"))
    goto LABEL_2;
  objc_msgSend(a1, "playingWithParticipantOrFirstKnownPlayer");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_7;
  v5 = (void *)v4;
  objc_msgSend(a1, "playingWithParticipantOrFirstKnownPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invitedBy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_7:
    v13 = (void *)MEMORY[0x1E0CB3940];
    GKGameCenterUIFrameworkBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "playingWithParticipantOrFirstKnownPlayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "player");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "displayNameWithOptions:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v14, v17);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(a1, "playingWithParticipantOrFirstKnownPlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "internal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invitedBy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isLocalPlayer");

  if (!v12)
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    GKGameCenterUIFrameworkBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "playingWithParticipantOrFirstKnownPlayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "internal");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "invitedBy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "displayNameWithOptions:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v14, v19);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
LABEL_2:
  GKGameCenterUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v3;
}

- (id)showcasePlayer
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (objc_msgSend(a1, "isAllAutomatchedPlayer"))
    goto LABEL_5;
  objc_msgSend(a1, "playingWithParticipantOrFirstKnownPlayer");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_5;
  v3 = (void *)v2;
  objc_msgSend(a1, "playingWithParticipantOrFirstKnownPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invitedBy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0D25358]);
    objc_msgSend(a1, "playingWithParticipantOrFirstKnownPlayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "internal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invitedBy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v7, "initWithInternalRepresentation:", v10);

  }
  else
  {
LABEL_5:
    objc_msgSend(a1, "localPlayerParticipant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "player");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

@end
