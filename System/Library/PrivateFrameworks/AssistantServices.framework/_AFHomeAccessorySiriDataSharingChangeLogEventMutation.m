@implementation _AFHomeAccessorySiriDataSharingChangeLogEventMutation

- (_AFHomeAccessorySiriDataSharingChangeLogEventMutation)initWithBase:(id)a3
{
  id v5;
  _AFHomeAccessorySiriDataSharingChangeLogEventMutation *v6;
  _AFHomeAccessorySiriDataSharingChangeLogEventMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFHomeAccessorySiriDataSharingChangeLogEventMutation;
  v6 = -[_AFHomeAccessorySiriDataSharingChangeLogEventMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (id)getDate
{
  NSDate *v2;

  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_date;
  }
  else
  {
    -[AFHomeAccessorySiriDataSharingChangeLogEvent date](self->_base, "date");
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (int64_t)getPreviousOptInStatus
{
  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
    return self->_previousOptInStatus;
  else
    return -[AFHomeAccessorySiriDataSharingChangeLogEvent previousOptInStatus](self->_base, "previousOptInStatus");
}

- (void)setPreviousOptInStatus:(int64_t)a3
{
  self->_previousOptInStatus = a3;
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (int64_t)getNewOptInStatus
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
    return self->_newOptInStatus;
  else
    return -[AFHomeAccessorySiriDataSharingChangeLogEvent newOptInStatus](self->_base, "newOptInStatus");
}

- (void)setNewOptInStatus:(int64_t)a3
{
  self->_newOptInStatus = a3;
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (int64_t)getChangeSource
{
  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
    return self->_changeSource;
  else
    return -[AFHomeAccessorySiriDataSharingChangeLogEvent changeSource](self->_base, "changeSource");
}

- (void)setChangeSource:(int64_t)a3
{
  self->_changeSource = a3;
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getChangeReason
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_changeReason;
  }
  else
  {
    -[AFHomeAccessorySiriDataSharingChangeLogEvent changeReason](self->_base, "changeReason");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setChangeReason:(id)a3
{
  objc_storeStrong((id *)&self->_changeReason, a3);
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getBuildVersion
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_buildVersion;
  }
  else
  {
    -[AFHomeAccessorySiriDataSharingChangeLogEvent buildVersion](self->_base, "buildVersion");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_buildVersion, a3);
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getProductVersion
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
  {
    v2 = self->_productVersion;
  }
  else
  {
    -[AFHomeAccessorySiriDataSharingChangeLogEvent productVersion](self->_base, "productVersion");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_productVersion, a3);
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (id)getSchemaVersion
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
  {
    v2 = self->_schemaVersion;
  }
  else
  {
    -[AFHomeAccessorySiriDataSharingChangeLogEvent schemaVersion](self->_base, "schemaVersion");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setSchemaVersion:(id)a3
{
  objc_storeStrong((id *)&self->_schemaVersion, a3);
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (id)getLogEventIdentifier
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
  {
    v2 = self->_logEventIdentifier;
  }
  else
  {
    -[AFHomeAccessorySiriDataSharingChangeLogEvent logEventIdentifier](self->_base, "logEventIdentifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setLogEventIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_logEventIdentifier, a3);
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventIdentifier, 0);
  objc_storeStrong((id *)&self->_schemaVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_changeReason, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
