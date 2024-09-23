@implementation CPLShare

- (CPLShare)init
{
  CPLShare *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPLShare;
  result = -[CPLShare init](&v3, sel_init);
  if (result)
    result->_publicPermission = 1;
  return result;
}

- (CPLShare)initWithCoder:(id)a3
{
  id v4;
  CPLShare *v5;
  uint64_t v6;
  NSURL *URL;
  uint64_t v8;
  NSArray *participants;
  uint64_t v10;
  NSDate *creationDate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPLShare;
  v5 = -[CPLShare init](&v13, sel_init);
  if (v5)
  {
    v5->_publicPermission = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pubPerm"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v6 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", _participantsClasses, CFSTR("participants"));
    v8 = objc_claimAutoreleasedReturnValue();
    participants = v5->_participants;
    v5->_participants = (NSArray *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", self->_publicPermission, CFSTR("pubPerm"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_URL, CFSTR("url"));
  if (-[NSArray count](self->_participants, "count"))
    objc_msgSend(v4, "encodeObject:forKey:", self->_participants, CFSTR("participants"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));

}

- (NSArray)participants
{
  if (self->_participants)
    return self->_participants;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (CPLShareParticipant)owner
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[CPLShare participants](self, "participants", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "role") == 1)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (CPLShareParticipant *)v3;
}

- (CPLShareParticipant)currentUserParticipant
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[CPLShare participants](self, "participants", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v6, "isCurrentUser") & 1) != 0)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (CPLShareParticipant *)v3;
}

- (BOOL)ownerIsCurrentUser
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[CPLShare participants](self, "participants", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if ((objc_msgSend(v6, "isCurrentUser") & 1) != 0)
        {
          LOBYTE(v3) = objc_msgSend(v6, "role") == 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)description
{
  int64_t publicPermission;
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  NSUInteger v8;
  _BOOL4 v9;
  const char *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  const char *v14;

  publicPermission = self->_publicPermission;
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSURL cpl_redactedShareURL](self->_URL, "cpl_redactedShareURL");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("<no URL yet>");
  if (publicPermission == 1)
  {
    v8 = -[NSArray count](self->_participants, "count");
    v9 = -[CPLShare ownerIsCurrentUser](self, "ownerIsCurrentUser");
    v10 = "";
    if (v9)
      v10 = "owner";
    v11 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("[%@ (%lu participants) %s]"), v7, v8, v10);
  }
  else
  {
    +[CPLShareParticipant descriptionForPermission:](CPLShareParticipant, "descriptionForPermission:", self->_publicPermission);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[CPLShare ownerIsCurrentUser](self, "ownerIsCurrentUser");
    v14 = "";
    if (v13)
      v14 = "owner";
    v11 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("[%@ (public: %@) %s]"), v7, v12, v14);

  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  id v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setPublicPermission:", self->_publicPermission);
  objc_msgSend(v4, "setURL:", self->_URL);
  v5 = -[NSArray cplDeepCopy](self->_participants, "cplDeepCopy");
  objc_msgSend(v4, "setParticipants:", v5);

  objc_msgSend(v4, "setCreationDate:", self->_creationDate);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CPLShare *v4;
  unint64_t v5;
  void *v6;
  NSURL *URL;
  char v8;
  BOOL v9;
  unint64_t v11;
  unint64_t v12;
  NSArray *v13;
  unint64_t v14;

  v4 = (CPLShare *)a3;
  if (v4 == self)
  {
    v9 = 1;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_publicPermission != v4->_publicPermission)
    goto LABEL_7;
  v5 = self->_URL;
  v6 = (void *)v5;
  URL = v4->_URL;
  if (v5 && URL)
  {
    v8 = objc_msgSend((id)v5, "isEqual:");

    if ((v8 & 1) == 0)
    {
LABEL_7:
      v9 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    v11 = v5 | (unint64_t)URL;

    if (v11)
      goto LABEL_7;
  }
  v12 = self->_participants;
  v13 = v4->_participants;
  v14 = (unint64_t)v13;
  v9 = v12 && v13 && (objc_msgSend((id)v12, "isEqual:", v13) & 1) != 0 || (v12 | v14) == 0;

LABEL_9:
  return v9;
}

- (unint64_t)hash
{
  int64_t publicPermission;
  uint64_t v4;

  publicPermission = self->_publicPermission;
  v4 = -[NSURL hash](self->_URL, "hash") ^ publicPermission;
  return v4 ^ -[NSArray hash](self->_participants, "hash");
}

- (int64_t)publicPermission
{
  return self->_publicPermission;
}

- (void)setPublicPermission:(int64_t)a3
{
  self->_publicPermission = a3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setParticipants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

+ (void)initialize
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_alloc(MEMORY[0x1E0C99E60]);
    v3 = objc_opt_class();
    v4 = objc_msgSend(v2, "initWithObjects:", v3, objc_opt_class(), 0);
    v5 = (void *)_participantsClasses;
    _participantsClasses = v4;

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
