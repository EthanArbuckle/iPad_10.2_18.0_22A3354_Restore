@implementation NPKPassSyncServiceSyncStatus

- (BOOL)shouldSyncWithCurrentIncomingChange:(id)a3 currentOutgoingChange:(id)a4 currentDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  NPKPassSyncChange *lastKnownIncomingChange;
  NSDate *incomingChangeDate;
  NPKPassSyncChange *lastKnownOutgoingChange;
  NSDate *outgoingChangeDate;
  NPKPassSyncChange *v19;
  NSDate *v20;
  double v21;
  NSDate *v22;
  int v23;
  NPKPassSyncChange *v24;
  NSDate *v25;
  double v26;
  NSDate *v27;
  int v28;
  NSObject *v29;
  _BOOL4 v30;
  NSObject *v31;
  int v33;
  _BYTE v34[10];
  NPKPassSyncChange *v35;
  __int16 v36;
  NSDate *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  NPKPassSyncChange *v41;
  __int16 v42;
  NSDate *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  pk_Sync_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    pk_Sync_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      lastKnownIncomingChange = self->_lastKnownIncomingChange;
      incomingChangeDate = self->_incomingChangeDate;
      lastKnownOutgoingChange = self->_lastKnownOutgoingChange;
      outgoingChangeDate = self->_outgoingChangeDate;
      v33 = 138413570;
      *(_QWORD *)v34 = v9;
      *(_WORD *)&v34[8] = 2112;
      v35 = lastKnownIncomingChange;
      v36 = 2112;
      v37 = incomingChangeDate;
      v38 = 2112;
      v39 = v10;
      v40 = 2112;
      v41 = lastKnownOutgoingChange;
      v42 = 2112;
      v43 = outgoingChangeDate;
      _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: Evaluating whether to sync now\n\tCurrent incoming change: %@\n\tPrevious incoming change: %@\n\tPrevious incoming change date: %@\n\tCurrent outgoing change: %@\n\tPrevious outgoing change: %@\n\tPrevious outgoing change date: %@", (uint8_t *)&v33, 0x3Eu);
    }

  }
  v19 = self->_lastKnownIncomingChange;
  if (!v9)
  {
    self->_lastKnownIncomingChange = 0;

    v22 = self->_incomingChangeDate;
    self->_incomingChangeDate = 0;

    goto LABEL_11;
  }
  if (PKEqualObjects())
  {
    v20 = self->_incomingChangeDate;
    if (v20)
    {
      -[NSDate timeIntervalSinceDate:](v20, "timeIntervalSinceDate:", v11);
      if (fabs(v21) < 60.0)
        goto LABEL_13;
    }
LABEL_11:
    v23 = 1;
    goto LABEL_14;
  }
  objc_storeStrong((id *)&self->_lastKnownIncomingChange, a3);
  objc_storeStrong((id *)&self->_incomingChangeDate, a5);
LABEL_13:
  v23 = 0;
LABEL_14:
  v24 = self->_lastKnownOutgoingChange;
  if (!v10)
  {
    self->_lastKnownOutgoingChange = 0;

    v27 = self->_outgoingChangeDate;
    self->_outgoingChangeDate = 0;

    goto LABEL_20;
  }
  if (PKEqualObjects())
  {
    v25 = self->_outgoingChangeDate;
    if (v25)
    {
      -[NSDate timeIntervalSinceDate:](v25, "timeIntervalSinceDate:", v11);
      if (fabs(v26) < 60.0)
        goto LABEL_22;
    }
LABEL_20:
    v28 = 1;
    goto LABEL_23;
  }
  objc_storeStrong((id *)&self->_lastKnownOutgoingChange, a4);
  objc_storeStrong((id *)&self->_outgoingChangeDate, a5);
LABEL_22:
  v28 = 0;
LABEL_23:
  pk_Sync_log();
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

  if (v30)
  {
    pk_Sync_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v33 = 67109376;
      *(_DWORD *)v34 = v23;
      *(_WORD *)&v34[4] = 1024;
      *(_DWORD *)&v34[6] = v28;
      _os_log_impl(&dword_213518000, v31, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: Evaluated whether to sync now\n\tIncoming change allows sync: %d\n\tOutgoing change allows sync: %d", (uint8_t *)&v33, 0xEu);
    }

  }
  return v23 & v28;
}

- (void)reset
{
  NPKPassSyncChange *lastKnownIncomingChange;
  NSDate *incomingChangeDate;
  NPKPassSyncChange *lastKnownOutgoingChange;
  NSDate *outgoingChangeDate;

  lastKnownIncomingChange = self->_lastKnownIncomingChange;
  self->_lastKnownIncomingChange = 0;

  incomingChangeDate = self->_incomingChangeDate;
  self->_incomingChangeDate = 0;

  lastKnownOutgoingChange = self->_lastKnownOutgoingChange;
  self->_lastKnownOutgoingChange = 0;

  outgoingChangeDate = self->_outgoingChangeDate;
  self->_outgoingChangeDate = 0;

}

- (NPKPassSyncChange)lastKnownOutgoingChange
{
  return self->_lastKnownOutgoingChange;
}

- (void)setLastKnownOutgoingChange:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownOutgoingChange, a3);
}

- (NSDate)outgoingChangeDate
{
  return self->_outgoingChangeDate;
}

- (void)setOutgoingChangeDate:(id)a3
{
  objc_storeStrong((id *)&self->_outgoingChangeDate, a3);
}

- (NPKPassSyncChange)lastKnownIncomingChange
{
  return self->_lastKnownIncomingChange;
}

- (void)setLastKnownIncomingChange:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownIncomingChange, a3);
}

- (NSDate)incomingChangeDate
{
  return self->_incomingChangeDate;
}

- (void)setIncomingChangeDate:(id)a3
{
  objc_storeStrong((id *)&self->_incomingChangeDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomingChangeDate, 0);
  objc_storeStrong((id *)&self->_lastKnownIncomingChange, 0);
  objc_storeStrong((id *)&self->_outgoingChangeDate, 0);
  objc_storeStrong((id *)&self->_lastKnownOutgoingChange, 0);
}

@end
