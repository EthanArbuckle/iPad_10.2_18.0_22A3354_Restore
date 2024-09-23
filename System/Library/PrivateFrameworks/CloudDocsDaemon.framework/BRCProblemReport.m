@implementation BRCProblemReport

- (BRCProblemReport)init
{
  BRCProblemReport *v2;
  uint64_t v3;
  NSMutableDictionary *problems;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BRCProblemReport;
  v2 = -[BRCProblemReport init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    problems = v2->_problems;
    v2->_problems = (NSMutableDictionary *)v3;

    v2->_state = 0;
  }
  return v2;
}

- (BRCProblemReport)initWithProblemReport:(id)a3
{
  id v4;
  BRCProblemReport *v5;
  uint64_t v6;
  NSMutableDictionary *problems;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCProblemReport;
  v5 = -[BRCProblemReport init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(*((id *)v4 + 1), "mutableCopy");
    problems = v5->_problems;
    v5->_problems = (NSMutableDictionary *)v6;

    v5->_state = *((_DWORD *)v4 + 5);
    v5->_needsSyncUp = *((_BYTE *)v4 + 16);
    objc_storeStrong((id *)&v5->_pendingRequestID, *((id *)v4 + 3));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithProblemReport:", self);
}

- (BRCProblemReport)initWithCoder:(id)a3
{
  id v4;
  BRCProblemReport *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *problems;
  uint64_t v12;
  NSNumber *pendingRequestID;
  objc_super v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BRCProblemReport;
  v5 = -[BRCProblemReport init](&v15, sel_init);
  if (v5)
  {
    v5->_state = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("state"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v16[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("problems"));
    v10 = objc_claimAutoreleasedReturnValue();
    problems = v5->_problems;
    v5->_problems = (NSMutableDictionary *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pendingRequestID"));
    v12 = objc_claimAutoreleasedReturnValue();
    pendingRequestID = v5->_pendingRequestID;
    v5->_pendingRequestID = (NSNumber *)v12;

    v5->_needsSyncUp = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("needsSync"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t state;
  id v5;

  state = self->_state;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", state, CFSTR("state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_problems, CFSTR("problems"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pendingRequestID, CFSTR("pendingRequestID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_needsSyncUp, CFSTR("needsSync"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int)_zoneStateForProblemType:(int)a3
{
  if (a3 > 0x13)
    return 0;
  else
    return dword_1CC0670A4[a3];
}

- (int)_priorityForProblemType:(int)a3
{
  if (a3 > 0x13)
    return -99;
  else
    return dword_1CC0670F4[a3];
}

- (int)_effectiveProblemType
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t i;
  void *v10;
  int v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary allKeys](self->_problems, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v15;
    v8 = -100;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v11 = -[BRCProblemReport _priorityForProblemType:](self, "_priorityForProblemType:", objc_msgSend(v10, "intValue"));
        if (v11 > v8)
        {
          v12 = v11;
          v6 = objc_msgSend(v10, "intValue");
          v8 = v12;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)effectiveProblemMessage
{
  __CFString *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v2 = CFSTR("dead parent");
  switch(-[BRCProblemReport _effectiveProblemType](self, "_effectiveProblemType"))
  {
    case 1:
      return (NSString *)v2;
    case 2:
      v2 = CFSTR("missing root");
      break;
    case 3:
      v2 = CFSTR("live children");
      break;
    case 4:
      v2 = CFSTR("missing content");
      break;
    case 5:
      v2 = CFSTR("cant save (missing structure?)");
      break;
    case 6:
      v2 = CFSTR("simulated (partial)");
      break;
    case 7:
      v2 = CFSTR("simulated (broken)");
      break;
    case 8:
      v2 = CFSTR("item parented to a document");
      break;
    case 9:
      v2 = CFSTR("package with corrupt indices");
      break;
    case 0xA:
      v2 = CFSTR("share without root record");
      break;
    case 0xB:
      v2 = CFSTR("cant save (missing parent)");
      break;
    case 0xC:
      v2 = CFSTR("pcs decryption");
      break;
    case 0xD:
      v2 = CFSTR("root record missing shareID but share exists");
      break;
    case 0xE:
      v2 = CFSTR("sync down stuck");
      break;
    case 0xF:
      v2 = CFSTR("sync up stuck");
      break;
    case 0x10:
      v2 = CFSTR("upload stuck");
      break;
    case 0x11:
      v2 = CFSTR("download stuck");
      break;
    case 0x12:
      v2 = CFSTR("apply stuck");
      break;
    case 0x13:
      v11 = (void *)MEMORY[0x1E0CB3940];
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "healthZoneMaxNumberOfResets");
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "healthZoneTimeIntervalForMaxNumberOfResets");
      objc_msgSend(v11, "stringWithFormat:", CFSTR("zone resetted more than %lu times in %f seconds"), v13, v15);
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      brc_bread_crumbs();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        -[BRCProblemReport effectiveProblemMessage].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

      v2 = CFSTR("unknown");
      break;
  }
  return (NSString *)v2;
}

- (NSSet)effectedRecordNames
{
  NSMutableDictionary *problems;
  void *v3;
  void *v4;
  void *v5;

  problems = self->_problems;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BRCProblemReport _effectiveProblemType](self, "_effectiveProblemType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](problems, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "effectedRecordNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (void)_addProblem:(id)a3
{
  int v4;
  NSMutableDictionary *problems;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = -[BRCProblemReport _zoneStateForProblemType:](self, "_zoneStateForProblemType:", objc_msgSend(v10, "type"));
  if (v4 > self->_state)
  {
    self->_state = v4;
    self->_needsSyncUp = 1;
  }
  problems = self->_problems;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](problems, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "mergeWithProblem:", v10);
  }
  else
  {
    v8 = self->_problems;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "type"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v10, v9);

  }
}

- (void)addProblemWithType:(int)a3 recordName:(id)a4
{
  uint64_t v4;
  id v6;
  BRCProblem *v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = -[BRCProblem initWithType:recordName:]([BRCProblem alloc], "initWithType:recordName:", v4, v6);

  -[BRCProblemReport _addProblem:](self, "_addProblem:", v7);
}

- (id)description
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  unsigned int v6;
  const __CFString *v7;
  const __CFString *v8;
  NSNumber *pendingRequestID;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[BRCProblemReport effectiveProblemMessage](self, "effectiveProblemMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BRCProblemReport needsSyncUp](self, "needsSyncUp");
  v6 = -[BRCProblemReport _zoneStateForProblemType:](self, "_zoneStateForProblemType:", -[BRCProblemReport _effectiveProblemType](self, "_effectiveProblemType"));
  if (v6 > 2)
    v7 = CFSTR("unknown");
  else
    v7 = off_1E8764FE0[v6];
  if (v5)
    v8 = CFSTR("Yes");
  else
    v8 = CFSTR("No");
  pendingRequestID = self->_pendingRequestID;
  -[BRCProblemReport effectedRecordNames](self, "effectedRecordNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("problem{msg:%@,needs-sync:%@,zone-state:%@,pending-request:%@, records:%@}"), v4, v8, v7, pendingRequestID, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)shouldResetAfterFixingState
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary allKeys](self->_problems, "allKeys", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "healthErrorsForReset");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v6) = objc_msgSend(v8, "containsObject:", v6);

        if ((v6 & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (int)state
{
  return self->_state;
}

- (NSNumber)pendingRequestID
{
  return self->_pendingRequestID;
}

- (void)setPendingRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRequestID, a3);
}

- (BOOL)needsSyncUp
{
  return self->_needsSyncUp;
}

- (void)setNeedsSyncUp:(BOOL)a3
{
  self->_needsSyncUp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequestID, 0);
  objc_storeStrong((id *)&self->_problems, 0);
}

- (void)effectiveProblemMessage
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] UNREACHABLE: unknown effective problem type%@", a5, a6, a7, a8, 2u);
}

@end
