@implementation BRCClientRanksPersistedState

- (unint64_t)nextItemRowID
{
  -[BRCPersistedState assertQueue](self, "assertQueue");
  return self->_nextItemRowID;
}

- (unint64_t)allocateItemRowID
{
  unint64_t result;

  -[BRCPersistedState assertQueue](self, "assertQueue");
  result = self->_nextItemRowID;
  self->_nextItemRowID = result + 1;
  return result;
}

- (unint64_t)nextNotifRank
{
  -[BRCPersistedState assertQueue](self, "assertQueue");
  return self->_nextNotifRank;
}

- (unint64_t)allocateNotifRank
{
  unint64_t result;

  -[BRCPersistedState assertQueue](self, "assertQueue");
  result = self->_nextNotifRank;
  self->_nextNotifRank = result + 1;
  return result;
}

- (void)setNextNotifRank:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  -[BRCPersistedState assertQueue](self, "assertQueue");
  if (self->_nextNotifRank > a3)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCClientRanksPersistedState setNextNotifRank:].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
  self->_nextNotifRank = a3;
}

- (unint64_t)nextPackageItemRank
{
  -[BRCPersistedState assertQueue](self, "assertQueue");
  return self->_nextPackageItemRank;
}

- (unint64_t)allocatePackageItemRank
{
  unint64_t result;

  -[BRCPersistedState assertQueue](self, "assertQueue");
  result = self->_nextPackageItemRank;
  self->_nextPackageItemRank = result + 1;
  return result;
}

- (void)setNextPackageItemRank:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  -[BRCPersistedState assertQueue](self, "assertQueue");
  if (self->_nextPackageItemRank > a3)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BRCClientRanksPersistedState setNextPackageItemRank:].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
  self->_nextPackageItemRank = a3;
}

- (unint64_t)telemetryMinRowID
{
  -[BRCPersistedState assertQueue](self, "assertQueue");
  return self->_telemetryMinRowID;
}

- (void)setTelemetryMinRowID:(unint64_t)a3
{
  -[BRCPersistedState assertQueue](self, "assertQueue");
  self->_telemetryMinRowID = a3;
}

- (int64_t)telemetryToken
{
  -[BRCPersistedState assertQueue](self, "assertQueue");
  return self->_telemetryToken;
}

- (void)setTelemetryToken:(int64_t)a3
{
  -[BRCPersistedState assertQueue](self, "assertQueue");
  self->_telemetryToken = a3;
}

+ (id)loadFromClientStateInSession:(id)a3 options:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "clientState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clientRanks"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = objc_opt_new();

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("clientRanks"));
    v6 = (void *)v9;
  }
  objc_msgSend(v4, "clientTruthWorkloop");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAssertionQueue:", v7);

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("nextNotifRank:%llu nextPackageItemRank:%llu nextItemRowID:%llu"), self->_nextNotifRank, self->_nextPackageItemRank, self->_nextItemRowID);
}

- (BRCClientRanksPersistedState)init
{
  BRCClientRanksPersistedState *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BRCClientRanksPersistedState;
  result = -[BRCClientRanksPersistedState init](&v3, sel_init);
  if (result)
  {
    result->_nextItemRowID = 1;
    result->_nextNotifRank = 1;
    result->_nextPackageItemRank = 1;
  }
  return result;
}

- (BRCClientRanksPersistedState)initWithCoder:(id)a3
{
  id v4;
  BRCClientRanksPersistedState *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BRCClientRanksPersistedState;
  v5 = -[BRCPersistedState initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_nextItemRowID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("nextItemRowID"));
    v5->_nextNotifRank = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("nextNotifRank"));
    v5->_nextPackageItemRank = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("nextPackageItemRank"));
    v5->_telemetryMinRowID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("telemetryRowID"));
    v5->_telemetryToken = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("telemetryToken"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRCClientRanksPersistedState;
  v4 = a3;
  -[BRCPersistedState encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_nextItemRowID, CFSTR("nextItemRowID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_nextNotifRank, CFSTR("nextNotifRank"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_nextPackageItemRank, CFSTR("nextPackageItemRank"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_telemetryMinRowID, CFSTR("telemetryRowID"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_telemetryToken, CFSTR("telemetryToken"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setNextNotifRank:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] Assertion failed: nextNotifRank >= _nextNotifRank%@", a5, a6, a7, a8, 2u);
}

- (void)setNextPackageItemRank:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] Assertion failed: nextPackageItemRank >= _nextPackageItemRank%@", a5, a6, a7, a8, 2u);
}

@end
