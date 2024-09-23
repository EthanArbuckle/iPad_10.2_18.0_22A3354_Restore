@implementation GKTurnBasedParticipant

- (GKTurnBasedParticipant)initWithInternalRepresentation:(id)a3
{
  id v4;
  GKTurnBasedParticipant *v5;
  GKTurnBasedParticipant *v6;
  objc_super v8;

  v4 = a3;
  if (!v4)
  {
    +[GKInternalRepresentation internalRepresentation](GKTurnBasedParticipantInternal, "internalRepresentation");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8.receiver = self;
  v8.super_class = (Class)GKTurnBasedParticipant;
  v5 = -[GKTurnBasedParticipant init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeStrong((id *)&v5->_internal, v4);

  return v6;
}

- (GKTurnBasedParticipant)init
{
  return -[GKTurnBasedParticipant initWithInternalRepresentation:](self, "initWithInternalRepresentation:", 0);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[GKTurnBasedParticipant internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[GKTurnBasedParticipant internal](self, "internal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "internal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  __CFString *v13;
  objc_class *v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  __CFString *v23;

  if (description_onceToken != -1)
    dispatch_once(&description_onceToken, &__block_literal_global_29);
  v3 = (void *)description_playerStatusEnumLookupDict;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[GKTurnBasedParticipant status](self, "status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = (void *)description_matchOutcomeEnumLookupDict;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[GKTurnBasedParticipant matchOutcome](self, "matchOutcome"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (const __CFString *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if ((-[GKTurnBasedParticipant matchOutcome](self, "matchOutcome") & 0xFF0000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Custom-%x"), -[GKTurnBasedParticipant matchOutcome](self, "matchOutcome"));
      v8 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = CFSTR("INVALID");
    }
  }
  -[GKTurnBasedParticipant internal](self, "internal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "player");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "playerID");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v23 = (__CFString *)v8;
  if (v10 && objc_msgSend(v10, "isLocalPlayer"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (local player)"), v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (__CFString *)v12;
  }
  if (v5)
    v13 = (__CFString *)v5;
  else
    v13 = CFSTR("INVALID");
  v22 = (void *)MEMORY[0x1E0CB3940];
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB34D0], "_gkMainBundleIsGameCenterSystemProcess"))
    v16 = CFSTR(" playerID:");
  else
    v16 = &stru_1E75BB5A8;
  if (objc_msgSend(MEMORY[0x1E0CB34D0], "_gkMainBundleIsGameCenterSystemProcess"))
    v17 = v11;
  else
    v17 = &stru_1E75BB5A8;
  -[GKTurnBasedParticipant lastTurnDate](self, "lastTurnDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTurnBasedParticipant timeoutDate](self, "timeoutDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("<%@ %p -%@%@ status:%@ matchOutcome:%@ lastTurnDate:%@ timeoutDate:%@>"), v15, self, v16, v17, v13, v23, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __37__GKTurnBasedParticipant_description__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v0 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dictionaryWithObjectsAndKeys:", CFSTR("Unknown"), v1, CFSTR("Invited"), v2, CFSTR("Declined"), v3, CFSTR("Matching"), v4, CFSTR("Active"), v5, CFSTR("Done"), v6, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)description_playerStatusEnumLookupDict;
  description_playerStatusEnumLookupDict = v7;

  v21 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 16711680);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dictionaryWithObjectsAndKeys:", CFSTR("None"), v22, CFSTR("Quit"), v20, CFSTR("Won"), v9, CFSTR("Lost"), v10, CFSTR("Tied"), v11, CFSTR("TimeExpired"), v12, CFSTR("First"), v13, CFSTR("Second"), v14, CFSTR("Third"),
    v15,
    CFSTR("Fourth"),
    v16,
    CFSTR("CustomRange"),
    v17,
    0);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)description_matchOutcomeEnumLookupDict;
  description_matchOutcomeEnumLookupDict = v18;

}

+ (id)keyPathsForValuesAffectingStatus
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("internal.status"));
}

- (GKTurnBasedParticipantStatus)status
{
  void *v2;
  void *v3;
  GKTurnBasedParticipantStatus v4;

  -[GKTurnBasedParticipant internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "status");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Invited")) & 1) != 0)
  {
    v4 = GKTurnBasedParticipantStatusInvited;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Active")) & 1) != 0)
  {
    v4 = GKTurnBasedParticipantStatusActive;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Declined")) & 1) != 0)
  {
    v4 = GKTurnBasedParticipantStatusDeclined;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Inactive")) & 1) != 0)
  {
    v4 = GKTurnBasedParticipantStatusDone;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Matching")))
  {
    v4 = GKTurnBasedParticipantStatusMatching;
  }
  else
  {
    v4 = GKTurnBasedParticipantStatusUnknown;
  }

  return v4;
}

- (void)setStatus:(int64_t)a3
{
  void *v3;
  const __CFString *v4;
  id v5;

  switch(a3)
  {
    case 0:
      -[GKTurnBasedParticipant internal](self, "internal");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = CFSTR("Unknown");
      break;
    case 1:
      -[GKTurnBasedParticipant internal](self, "internal");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = CFSTR("Invited");
      break;
    case 2:
      -[GKTurnBasedParticipant internal](self, "internal");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = CFSTR("Declined");
      break;
    case 3:
      -[GKTurnBasedParticipant internal](self, "internal");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = CFSTR("Matching");
      break;
    case 4:
      -[GKTurnBasedParticipant internal](self, "internal");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = CFSTR("Active");
      break;
    default:
      -[GKTurnBasedParticipant internal](self, "internal");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = CFSTR("Inactive");
      break;
  }
  v5 = v3;
  objc_msgSend(v3, "setStatus:", v4);

}

+ (id)keyPathsForValuesAffectingBasicMatchOutcomeString
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("matchOutcome"));
}

+ (id)stringForMatchOutcome:(int64_t)a3 totalParticipant:(int64_t)a4
{
  int v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = a3;
  +[GCFLocalizedStrings TURN_BASED_OUTCOME_NONE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "TURN_BASED_OUTCOME_NONE");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  switch(v5 & 0xFF00FFFF)
  {
    case 0u:
      +[GCFLocalizedStrings TURN_BASED_OUTCOME_NONE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "TURN_BASED_OUTCOME_NONE");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 1u:
      +[GCFLocalizedStrings TURN_BASED_OUTCOME_QUIT](_TtC20GameCenterFoundation19GCFLocalizedStrings, "TURN_BASED_OUTCOME_QUIT");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 2u:
      +[GCFLocalizedStrings TURN_BASED_OUTCOME_WON](_TtC20GameCenterFoundation19GCFLocalizedStrings, "TURN_BASED_OUTCOME_WON");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 3u:
      +[GCFLocalizedStrings TURN_BASED_OUTCOME_LOST](_TtC20GameCenterFoundation19GCFLocalizedStrings, "TURN_BASED_OUTCOME_LOST");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 4u:
      +[GCFLocalizedStrings TURN_BASED_OUTCOME_TIED](_TtC20GameCenterFoundation19GCFLocalizedStrings, "TURN_BASED_OUTCOME_TIED");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 5u:
      +[GCFLocalizedStrings TURN_BASED_OUTCOME_TIME_EXP](_TtC20GameCenterFoundation19GCFLocalizedStrings, "TURN_BASED_OUTCOME_TIME_EXP");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v10 = v7;

      goto LABEL_18;
    case 6u:
      v11 = (void *)MEMORY[0x1E0CB3940];
      +[GCFLocalizedStringsDict TURN_BASED_OUTCOME_FIRST](_TtC20GameCenterFoundation23GCFLocalizedStringsDict, "TURN_BASED_OUTCOME_FIRST");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 7u:
      v11 = (void *)MEMORY[0x1E0CB3940];
      +[GCFLocalizedStringsDict TURN_BASED_OUTCOME_SECOND](_TtC20GameCenterFoundation23GCFLocalizedStringsDict, "TURN_BASED_OUTCOME_SECOND");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 8u:
      v11 = (void *)MEMORY[0x1E0CB3940];
      +[GCFLocalizedStringsDict TURN_BASED_OUTCOME_THIRD](_TtC20GameCenterFoundation23GCFLocalizedStringsDict, "TURN_BASED_OUTCOME_THIRD");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 9u:
      v11 = (void *)MEMORY[0x1E0CB3940];
      +[GCFLocalizedStringsDict TURN_BASED_OUTCOME_FOURTH](_TtC20GameCenterFoundation23GCFLocalizedStringsDict, "TURN_BASED_OUTCOME_FOURTH");
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_17:
      v13 = (void *)v12;
      objc_msgSend(v11, "stringWithFormat:", v12, a4);
      v10 = objc_claimAutoreleasedReturnValue();

LABEL_18:
      v6 = (void *)v10;
      break;
    default:
      v8 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        v9 = GKOSLoggers();
        v8 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        +[GKTurnBasedParticipant stringForMatchOutcome:totalParticipant:].cold.1();
      break;
  }
  return v6;
}

+ (id)keyPathsForValuesAffectingMatchOutcomeString
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("status"), CFSTR("matchOutcome"), 0);
}

- (NSString)matchStatusString
{
  void *v2;
  NSString *result;

  switch(-[GKTurnBasedParticipant status](self, "status"))
  {
    case GKTurnBasedParticipantStatusUnknown:
      +[GCFLocalizedStrings TURN_BASED_PARTICIPANT_STATUS_UNKNOWN](_TtC20GameCenterFoundation19GCFLocalizedStrings, "TURN_BASED_PARTICIPANT_STATUS_UNKNOWN");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case GKTurnBasedParticipantStatusInvited:
      +[GCFLocalizedStrings TURN_BASED_PARTICIPANT_STATUS_INVITED](_TtC20GameCenterFoundation19GCFLocalizedStrings, "TURN_BASED_PARTICIPANT_STATUS_INVITED");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case GKTurnBasedParticipantStatusDeclined:
      +[GCFLocalizedStrings TURN_BASED_PARTICIPANT_STATUS_DECLINED](_TtC20GameCenterFoundation19GCFLocalizedStrings, "TURN_BASED_PARTICIPANT_STATUS_DECLINED");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case GKTurnBasedParticipantStatusMatching:
      +[GCFLocalizedStrings TURN_BASED_PARTICIPANT_STATUS_MATCHING](_TtC20GameCenterFoundation19GCFLocalizedStrings, "TURN_BASED_PARTICIPANT_STATUS_MATCHING");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case GKTurnBasedParticipantStatusActive:
      +[GCFLocalizedStrings TURN_BASED_PARTICIPANT_STATUS_ACTIVE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "TURN_BASED_PARTICIPANT_STATUS_ACTIVE");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case GKTurnBasedParticipantStatusDone:
      +[GCFLocalizedStrings TURN_BASED_PARTICIPANT_STATUS_DONE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "TURN_BASED_PARTICIPANT_STATUS_DONE");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      result = v2;
      break;
    default:
      result = CFSTR("invalid status");
      break;
  }
  return result;
}

- (id)basicMatchOutcomeString:(int64_t)a3
{
  return +[GKTurnBasedParticipant stringForMatchOutcome:totalParticipant:](GKTurnBasedParticipant, "stringForMatchOutcome:totalParticipant:", -[GKTurnBasedParticipant matchOutcome](self, "matchOutcome"), a3);
}

- (id)matchOutcomeStringForLocalPlayer:(int64_t)a3
{
  void *v5;

  switch(-[GKTurnBasedParticipant matchOutcome](self, "matchOutcome") & 0xFF00FFFF)
  {
    case 1:
      +[GCFLocalizedStrings TURN_BASED_OUTCOME_YOU_QUIT](_TtC20GameCenterFoundation19GCFLocalizedStrings, "TURN_BASED_OUTCOME_YOU_QUIT");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      +[GCFLocalizedStrings TURN_BASED_OUTCOME_YOU_WON](_TtC20GameCenterFoundation19GCFLocalizedStrings, "TURN_BASED_OUTCOME_YOU_WON");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      +[GCFLocalizedStrings TURN_BASED_OUTCOME_YOU_LOST](_TtC20GameCenterFoundation19GCFLocalizedStrings, "TURN_BASED_OUTCOME_YOU_LOST");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      +[GCFLocalizedStrings TURN_BASED_OUTCOME_YOU_TIED](_TtC20GameCenterFoundation19GCFLocalizedStrings, "TURN_BASED_OUTCOME_YOU_TIED");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      -[GKTurnBasedParticipant matchOutcomeString:](self, "matchOutcomeString:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v5;
}

- (id)matchOutcomeString:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  +[GCFLocalizedStrings TURN_BASED_OUTCOME_NONE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "TURN_BASED_OUTCOME_NONE");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[GKTurnBasedParticipant status](self, "status") == GKTurnBasedParticipantStatusDone)
  {
    -[GKTurnBasedParticipant basicMatchOutcomeString:](self, "basicMatchOutcomeString:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = (void *)v6;

    v5 = v7;
    return v5;
  }
  if (-[GKTurnBasedParticipant status](self, "status") == GKTurnBasedParticipantStatusDeclined)
  {
    +[GCFLocalizedStrings TURN_BASED_PARTICIPANT_STATUS_DECLINED](_TtC20GameCenterFoundation19GCFLocalizedStrings, "TURN_BASED_PARTICIPANT_STATUS_DECLINED");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (-[GKTurnBasedParticipant matchOutcome](self, "matchOutcome"))
  {
    v9 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v10 = GKOSLoggers();
      v9 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[GKTurnBasedParticipant matchOutcomeString:].cold.1(v9, self, a3);
    v11 = (void *)MEMORY[0x1E0CB3940];
    +[GCFLocalizedStrings TURN_BASED_PARTICIPANT_STATUS_OUTCOME_FORMAT](_TtC20GameCenterFoundation19GCFLocalizedStrings, "TURN_BASED_PARTICIPANT_STATUS_OUTCOME_FORMAT");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnBasedParticipant matchStatusString](self, "matchStatusString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnBasedParticipant basicMatchOutcomeString:](self, "basicMatchOutcomeString:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v12, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v15;
  }
  return v5;
}

- (BOOL)isWinner
{
  return ((-[GKTurnBasedParticipant matchOutcome](self, "matchOutcome") - 2) & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (NSDate)lastTurnDate
{
  void *v2;
  void *v3;
  double v4;
  id v5;

  -[GKTurnBasedParticipant internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastTurnDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "timeIntervalSince1970");
  if (v4 == 0.0)
    v5 = 0;
  else
    v5 = v3;

  return (NSDate *)v5;
}

+ (BOOL)matchOutcomeIsValidForDoneState:(int64_t)a3
{
  unsigned int v4;
  NSObject *v5;
  id v6;

  v4 = (a3 & 0xFF00FFFF) - 1;
  if (v4 >= 9)
  {
    v5 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v6 = GKOSLoggers();
      v5 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      +[GKTurnBasedParticipant matchOutcomeIsValidForDoneState:].cold.1(v5, a3);
  }
  return v4 < 9;
}

- (GKPlayer)invitedBy
{
  void *v2;
  void *v3;
  void *v4;

  -[GKTurnBasedParticipant internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invitedBy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[GKPlayer canonicalizedPlayerForInternal:](GKPlayer, "canonicalizedPlayerForInternal:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (GKPlayer *)v4;
}

- (GKPlayer)player
{
  void *v2;
  void *v3;
  void *v4;

  -[GKTurnBasedParticipant internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[GKPlayer canonicalizedPlayerForInternal:](GKPlayer, "canonicalizedPlayerForInternal:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (GKPlayer *)v4;
}

- (NSString)playerID
{
  void *v2;
  void *v3;
  void *v4;

  -[GKTurnBasedParticipant player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "internal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)isLocalPlayer
{
  void *v2;
  void *v3;
  char v4;

  -[GKTurnBasedParticipant internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLocalPlayer");

  return v4;
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKTurnBasedParticipant;
  objc_msgSendSuper2(&v9, sel_instanceMethodSignatureForSelector_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GKTurnBasedParticipant;
  -[GKTurnBasedParticipant methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[GKTurnBasedParticipant forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "methodSignatureForSelector:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKTurnBasedParticipant;
  if (-[GKTurnBasedParticipant respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    v5 = 1;
  }
  else
  {
    -[GKTurnBasedParticipant forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

  }
  return v5 & 1;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  BOOL result;
  int v5;

  if (!a3)
    return 0;
  if (class_respondsToSelector((Class)a1, a3))
    return 1;
  v5 = GKApplicationLinkedOnOrAfter();
  result = 0;
  if (v5)
    return +[GKTurnBasedParticipantInternal instancesRespondToSelector:](GKTurnBasedParticipantInternal, "instancesRespondToSelector:", a3);
  return result;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[GKTurnBasedParticipant internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[GKTurnBasedParticipant internal](self, "internal");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (GKTurnBasedParticipantInternal)internal
{
  return (GKTurnBasedParticipantInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

+ (void)stringForMatchOutcome:totalParticipant:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1BCDE3000, v0, v1, "GKTurnBasedMatch stringForMatchOutcome: a TURN_BASED_OUTCOME_NONE will be returned because an invalid outcome was encountered: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)matchOutcomeString:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint8_t v7[12];
  __int16 v8;
  void *v9;

  v5 = OUTLINED_FUNCTION_16_0(a1);
  objc_msgSend(a2, "basicMatchOutcomeString:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_DEBUG, "encountered matchOutcome %@ in a non done match: %@", v7, 0x16u);

  OUTLINED_FUNCTION_1_2();
}

+ (void)matchOutcomeIsValidForDoneState:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a1;
  objc_msgSend(v3, "numberWithInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1BCDE3000, v4, v6, "GKTurnBasedMatch matchOutcomeIsValidForDoneState: match outcome will be marked not valid as invalid outcome was encountered: %@", v7);

  OUTLINED_FUNCTION_1_2();
}

@end
