@implementation DAAction

- (DAAction)initWithItemChangeType:(unint64_t)a3 changedItem:(id)a4 serverId:(id)a5
{
  id v9;
  id v10;
  DAAction *v11;
  DAAction *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)DAAction;
  v11 = -[DAAction init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_itemChangeType = a3;
    objc_storeStrong(&v11->_changedItem, a4);
    objc_storeStrong(&v12->_serverId, a5);
    v12->_changeId = -1;
  }

  return v12;
}

- (DAAction)initWithItemChangeType:(unint64_t)a3 changedItem:(id)a4 serverId:(id)a5 instanceId:(id)a6
{
  id v11;
  id v12;
  id v13;
  DAAction *v14;
  DAAction *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)DAAction;
  v14 = -[DAAction init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_itemChangeType = a3;
    objc_storeStrong(&v14->_changedItem, a4);
    objc_storeStrong(&v15->_serverId, a5);
    objc_storeStrong(&v15->_instanceId, a6);
    v15->_changeId = -1;
  }

  return v15;
}

- (id)stringForItemChangeType:(unint64_t)a3
{
  if (a3 < 0xB)
    return off_1E68CB6C8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown (%lu)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DAAction stringForItemChangeType:](self, "stringForItemChangeType:", -[DAAction itemChangeType](self, "itemChangeType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAAction changedItem](self, "changedItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAAction serverId](self, "serverId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[DAAction changeId](self, "changeId") == -1)
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> { Change type: %@, ChangedItem: %@ serverId: %@%@}"), v4, self, v5, v6, v7, &stru_1E68CCDC0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", Change id: %d"), -[DAAction changeId](self, "changeId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> { Change type: %@, ChangedItem: %@ serverId: %@%@}"), v4, self, v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DAAction)initWithCoder:(id)a3
{
  id v5;
  DAAction *v6;
  Class v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  objc_super v14;

  v5 = a3;
  if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAAction.m"), 76, CFSTR("Who does non-keyed coding nowadays?"));

  }
  v14.receiver = self;
  v14.super_class = (Class)DAAction;
  v6 = -[DAAction init](&v14, sel_init);
  if (v6)
  {
    -[DAAction setItemChangeType:](v6, "setItemChangeType:", (int)objc_msgSend(v5, "decodeIntForKey:", CFSTR("DAAItemChangeType")));
    v7 = NSClassFromString(CFSTR("ASChangedCollectionLeaf"));
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("DAAChangedItem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAAction _setChangedItem:](v6, "_setChangedItem:", v9);

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DAAServerId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAAction setServerId:](v6, "setServerId:", v10);

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DAAInstanceId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAAction setInstanceId:](v6, "setInstanceId:", v11);

    -[DAAction setChangeId:](v6, "setChangeId:", objc_msgSend(v5, "decodeIntForKey:", CFSTR("DAAChangeId")));
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(v9, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAAction.m"), 90, CFSTR("Who does non-keyed coding nowadays?"));

  }
  objc_msgSend(v9, "encodeInt:forKey:", -[DAAction itemChangeType](self, "itemChangeType"), CFSTR("DAAItemChangeType"));
  -[DAAction changedItem](self, "changedItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("DAAChangedItem"));

  -[DAAction serverId](self, "serverId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("DAAServerId"));

  -[DAAction instanceId](self, "instanceId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("DAAInstanceId"));

  objc_msgSend(v9, "encodeInt:forKey:", -[DAAction changeId](self, "changeId"), CFSTR("DAAChangeId"));
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[DAAction changedItem](self, "changedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DAAction serverId](self, "serverId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  DAAction *v8;
  DAAction *v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  char v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;

  v8 = (DAAction *)a3;
  if (self == v8)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      v10 = -[DAAction itemChangeType](v9, "itemChangeType");
      if (v10 != -[DAAction itemChangeType](self, "itemChangeType"))
      {
        LOBYTE(v14) = 1;
LABEL_28:
        v15 = v14 ^ 1;

        goto LABEL_29;
      }
      -[DAAction changedItem](v9, "changedItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11
        || (-[DAAction changedItem](self, "changedItem"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[DAAction changedItem](v9, "changedItem");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[DAAction changedItem](self, "changedItem");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v5, "isEqual:", v3);
        v13 = 1;
        LOBYTE(v14) = 1;
        if (!v12)
          goto LABEL_24;
      }
      else
      {
        v13 = 0;
      }
      v24 = v13;
      v23 = v3;
      -[DAAction serverId](v9, "serverId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 || (-[DAAction serverId](self, "serverId"), (v20 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[DAAction serverId](v9, "serverId", v20);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[DAAction serverId](self, "serverId");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 1;
        if (!objc_msgSend(v6, "isEqual:", v3))
          goto LABEL_19;
      }
      else
      {
        v21 = 0;
        v14 = 0;
      }
      v22 = v5;
      v17 = v4;
      v18 = v14;
      v14 = -[DAAction changeId](v9, "changeId", v21);
      LOBYTE(v14) = v14 != -[DAAction changeId](self, "changeId");
      if (!v18)
      {
        v4 = v17;
        v5 = v22;
        if (v16)
        {
LABEL_20:

          if (v24)
          {
            v3 = v23;
LABEL_24:

          }
LABEL_25:
          if (!v11)

          goto LABEL_28;
        }
LABEL_23:

        v3 = v23;
        if ((v24 & 1) != 0)
          goto LABEL_24;
        goto LABEL_25;
      }
      v4 = v17;
      v5 = v22;
LABEL_19:

      if (v16)
        goto LABEL_20;
      goto LABEL_23;
    }
    v15 = 0;
  }
LABEL_29:

  return v15;
}

- (unint64_t)itemChangeType
{
  return self->_itemChangeType;
}

- (void)setItemChangeType:(unint64_t)a3
{
  self->_itemChangeType = a3;
}

- (id)serverId
{
  return self->_serverId;
}

- (void)setServerId:(id)a3
{
  objc_storeStrong(&self->_serverId, a3);
}

- (id)instanceId
{
  return self->_instanceId;
}

- (void)setInstanceId:(id)a3
{
  objc_storeStrong(&self->_instanceId, a3);
}

- (id)changedItem
{
  return self->_changedItem;
}

- (void)_setChangedItem:(id)a3
{
  objc_storeStrong(&self->_changedItem, a3);
}

- (int)changeId
{
  return self->_changeId;
}

- (void)setChangeId:(int)a3
{
  self->_changeId = a3;
}

- (id)forwardedAttendees
{
  return self->_forwardedAttendees;
}

- (void)setForwardedAttendees:(id)a3
{
  objc_storeStrong(&self->_forwardedAttendees, a3);
}

- (id)forwardedAttendeeUUIDs
{
  return self->_forwardedAttendeeUUIDs;
}

- (void)setForwardedAttendeeUUIDs:(id)a3
{
  objc_storeStrong(&self->_forwardedAttendeeUUIDs, a3);
}

- (BOOL)ignoresGuardianRestrictions
{
  return self->_ignoresGuardianRestrictions;
}

- (void)setIgnoresGuardianRestrictions:(BOOL)a3
{
  self->_ignoresGuardianRestrictions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_forwardedAttendeeUUIDs, 0);
  objc_storeStrong(&self->_forwardedAttendees, 0);
  objc_storeStrong(&self->_changedItem, 0);
  objc_storeStrong(&self->_instanceId, 0);
  objc_storeStrong(&self->_serverId, 0);
}

@end
