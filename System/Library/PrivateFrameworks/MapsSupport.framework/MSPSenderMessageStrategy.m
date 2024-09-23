@implementation MSPSenderMessageStrategy

- (MSPSenderMessageStrategy)initWithDelegate:(id)a3 capabilityType:(unint64_t)a4
{
  id v6;
  MSPSenderMessageStrategy *v7;
  MSPSenderMessageStrategy *v8;
  id *v9;
  NSString *v10;
  NSString *serviceName;
  MSPSenderMessageStrategy *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MSPSenderMessageStrategy;
  v7 = -[MSPSenderStrategy init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v8->_type = a4;
    if (a4 == 3)
    {
      v9 = (id *)MEMORY[0x1E0D35700];
    }
    else
    {
      if (a4 != 2)
      {
        v12 = 0;
        goto LABEL_9;
      }
      v9 = (id *)MEMORY[0x1E0D356B8];
    }
    v10 = (NSString *)*v9;
    serviceName = v8->_serviceName;
    v8->_serviceName = v10;

  }
  v12 = v8;
LABEL_9:

  return v12;
}

+ (BOOL)_supportsEvent:(unint64_t)a3
{
  return a3 - 7 < 0xFFFFFFFFFFFFFFFDLL;
}

- (BOOL)setState:(id)a3 forEvent:(unint64_t)a4
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MSPSenderMessageStrategy;
  v5 = -[MSPSenderStrategy setState:forEvent:](&v7, sel_setState_forEvent_, a3, a4);
  if (v5)
    -[MSPSenderMessageStrategy sendMessageIfNeeded](self, "sendMessageIfNeeded");
  return v5;
}

- (void)addParticipants:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MSPSenderMessageStrategy;
  -[MSPSenderStrategy addParticipants:](&v4, sel_addParticipants_, a3);
  -[MSPSenderMessageStrategy sendMessageIfNeeded](self, "sendMessageIfNeeded");
}

- (void)sendMessageIfNeeded
{
  MSPSenderMessageStrategy *v2;
  GEOSharedNavState *v3;
  GEOSharedNavState *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  MSPSenderMessageStrategy *v21;
  void *v22;
  unint64_t type;
  const __CFString *v24;
  id v25;
  __CFString *v26;
  uint64_t v27;
  void *v28;
  MSPSenderMessageStrategy *v29;
  void *v30;
  unint64_t v31;
  const __CFString *v32;
  NSObject *v33;
  void *v34;
  MSPSenderMessageStrategy *v35;
  void *v36;
  unint64_t v37;
  const __CFString *v38;
  void *v39;
  MSPSenderMessageStrategy *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  MSPSenderMessageStrategy *v44;
  void *v45;
  unint64_t v46;
  const __CFString *v47;
  uint64_t v48;
  void *v49;
  MSPSenderMessageStrategy *v50;
  void *v51;
  unint64_t v52;
  const __CFString *v53;
  __CFString *v54;
  __CFString *v55;
  id v56;
  void *v57;
  __CFString *v58;
  __CFString *v59;
  void *v60;
  __CFString *v61;
  __CFString *v62;
  id obj;
  os_log_t log;
  NSObject *loga;
  MSPSenderMessageStrategy *v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t v73[128];
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  const __CFString *v77;
  __int16 v78;
  __CFString *v79;
  __int16 v80;
  NSObject *v81;
  __int16 v82;
  __CFString *v83;
  uint64_t v84;

  v2 = self;
  v84 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableSet count](self->super._participants, "count"))
  {
    v3 = v2->super._state;
    v4 = v3;
    if (v3)
    {
      -[GEOSharedNavState etaInfo](v3, "etaInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "hasEtaTimestamp") & 1) != 0)
      {
        -[GEOSharedNavState destinationWaypointMapItem](v4, "destinationWaypointMapItem");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          v7 = (void *)-[GEOSharedNavState copy](v4, "copy");

          -[MSPSenderMessageStrategy delegate](v2, "delegate");
          v8 = objc_claimAutoreleasedReturnValue();
          v9 = (void *)-[NSMutableSet copy](v2->super._participants, "copy");
          v69 = 0u;
          v70 = 0u;
          v71 = 0u;
          v72 = 0u;
          obj = v9;
          v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
          if (v68)
          {
            v67 = *(_QWORD *)v70;
            log = v8;
            v66 = v2;
            do
            {
              v10 = 0;
              do
              {
                if (*(_QWORD *)v70 != v67)
                  objc_enumerationMutation(obj);
                v11 = *(NSObject **)(*((_QWORD *)&v69 + 1) + 8 * v10);
                -[NSObject rulesForParticipant:](v8, "rulesForParticipant:", v11);
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "etaInfo");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "etaTimestamp");
                v15 = v14;
                objc_msgSend(v7, "updatedTimestamp");
                objc_msgSend(v12, "didReceiveUpdateWithETA:lastUpdated:", v15, v16);

                v17 = objc_msgSend(v12, "currentlyNecessaryNotificationTypeForState:", v7);
                MSPGetSharedTripLog();
                v18 = objc_claimAutoreleasedReturnValue();
                v19 = v18;
                if (v17)
                {
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                  {
                    v20 = (void *)MEMORY[0x1E0CB3940];
                    v21 = v2;
                    objc_msgSend(v20, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v21);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();

                    type = v21->_type;
                    v24 = CFSTR("Unknown");
                    if (type <= 4)
                      v24 = off_1E6651DB8[type];
                    v25 = v22;
                    MSPSharedTripNotificationTypeAsString(v17);
                    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

                    *(_DWORD *)buf = 138544131;
                    v75 = v22;
                    v76 = 2114;
                    v77 = v24;
                    v78 = 2114;
                    v79 = v26;
                    v80 = 2113;
                    v81 = v11;
                    _os_log_impl(&dword_1B39C0000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@: sendMessageIfNeeded will send %{public}@ to participant %{private}@", buf, 0x2Au);

                    v8 = log;
                    v2 = v66;
                  }

                  switch(v17)
                  {
                    case 1uLL:
                      objc_msgSend(v7, "initialMessage");
                      v27 = objc_claimAutoreleasedReturnValue();
                      goto LABEL_26;
                    case 2uLL:
                      objc_msgSend(v7, "updateMessage");
                      v27 = objc_claimAutoreleasedReturnValue();
                      goto LABEL_26;
                    case 3uLL:
                      objc_msgSend(v7, "chargingStopMessage");
                      v27 = objc_claimAutoreleasedReturnValue();
                      goto LABEL_26;
                    case 4uLL:
                      objc_msgSend(v7, "intermediateArrivalMessage");
                      v27 = objc_claimAutoreleasedReturnValue();
                      goto LABEL_26;
                    case 5uLL:
                      objc_msgSend(v7, "waypointResumeMessage");
                      v27 = objc_claimAutoreleasedReturnValue();
                      goto LABEL_26;
                    case 6uLL:
                      objc_msgSend(v7, "arrivalMessage");
                      v27 = objc_claimAutoreleasedReturnValue();
LABEL_26:
                      v19 = v27;
                      if (!v27)
                        goto LABEL_32;
                      if (v2->super._loggingOnly)
                      {
                        MSPGetSharedTripLog();
                        v33 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                        {
                          v34 = (void *)MEMORY[0x1E0CB3940];
                          v35 = v66;
                          objc_msgSend(v34, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v35);
                          v36 = (void *)objc_claimAutoreleasedReturnValue();

                          v37 = v35->_type;
                          v38 = CFSTR("Unknown");
                          if (v37 <= 4)
                            v38 = off_1E6651DB8[v37];
                          *(_DWORD *)buf = 138544130;
                          v75 = v36;
                          v76 = 2114;
                          v77 = v38;
                          v78 = 2114;
                          v79 = (__CFString *)v11;
                          v80 = 2114;
                          v81 = v19;
                          _os_log_impl(&dword_1B39C0000, v33, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@: TO %{public}@: \"%{public}@\", buf, 0x2Au);

                          v8 = log;
                        }
LABEL_35:

                        objc_msgSend(v12, "didPostNotificationType:forState:", v17, v7);
                        -[NSObject touchedRules](v8, "touchedRules");
                        goto LABEL_36;
                      }
                      v33 = IDSCopyRawAddressForDestination();
                      if ((IMSPISendMessageWithAttachments() & 1) != 0)
                        goto LABEL_35;
                      MSPGetSharedTripLog();
                      v42 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                      {
                        v43 = (void *)MEMORY[0x1E0CB3940];
                        v44 = v66;
                        objc_msgSend(v43, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v44);
                        v45 = (void *)objc_claimAutoreleasedReturnValue();

                        v46 = v44->_type;
                        v47 = CFSTR("Unknown");
                        if (v46 <= 4)
                          v47 = off_1E6651DB8[v46];
                        *(_DWORD *)buf = 138543618;
                        v75 = v45;
                        v76 = 2114;
                        v77 = v47;
                        _os_log_impl(&dword_1B39C0000, v42, OS_LOG_TYPE_ERROR, "[%{public}@] %{public}@: IMSPISendMessageWithAttachments returned NO", buf, 0x16u);

                        v8 = log;
                      }

LABEL_36:
                      v2 = v66;
                      break;
                    default:
LABEL_32:
                      MSPGetSharedTripLog();
                      v19 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
                      {
                        v39 = (void *)MEMORY[0x1E0CB3940];
                        v40 = v2;
                        objc_msgSend(v39, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v40);
                        v41 = (void *)objc_claimAutoreleasedReturnValue();

                        *(_DWORD *)buf = 138543362;
                        v75 = v41;
                        _os_log_impl(&dword_1B39C0000, v19, OS_LOG_TYPE_FAULT, "[%{public}@] no message body generated but we expected to send something", buf, 0xCu);

                        v8 = log;
                      }
                      break;
                  }
                }
                else if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
                {
                  v28 = (void *)MEMORY[0x1E0CB3940];
                  v29 = v2;
                  objc_msgSend(v28, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v29);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();

                  v31 = v29->_type;
                  v32 = CFSTR("Unknown");
                  if (v31 <= 4)
                    v32 = off_1E6651DB8[v31];
                  *(_DWORD *)buf = 138543875;
                  v75 = v30;
                  v76 = 2114;
                  v77 = v32;
                  v78 = 2113;
                  v79 = (__CFString *)v11;
                  _os_log_impl(&dword_1B39C0000, v19, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@: no necessary notification for %{private}@", buf, 0x20u);

                }
                ++v10;
              }
              while (v68 != v10);
              v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
              v68 = v48;
            }
            while (v48);
          }

          v4 = (GEOSharedNavState *)v7;
          goto LABEL_61;
        }
      }
      else
      {

      }
    }
    MSPGetSharedTripLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      loga = v8;
      v49 = (void *)MEMORY[0x1E0CB3940];
      v50 = v2;
      objc_msgSend(v49, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      v52 = v50->_type;
      if (v52 > 4)
        v53 = CFSTR("Unknown");
      else
        v53 = off_1E6651DB8[v52];
      if (v4)
        v54 = CFSTR("YES");
      else
        v54 = CFSTR("NO");
      v55 = v54;
      v56 = v51;
      -[GEOSharedNavState etaInfo](v4, "etaInfo");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v57, "hasEtaTimestamp"))
        v58 = CFSTR("YES");
      else
        v58 = CFSTR("NO");
      v59 = v58;
      -[GEOSharedNavState destinationWaypointMapItem](v4, "destinationWaypointMapItem");
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      if (v60)
        v61 = CFSTR("YES");
      else
        v61 = CFSTR("NO");
      v62 = v61;
      *(_DWORD *)buf = 138544386;
      v75 = v51;
      v76 = 2114;
      v77 = v53;
      v78 = 2114;
      v79 = v55;
      v80 = 2114;
      v81 = v59;
      v82 = 2114;
      v83 = v62;
      v8 = loga;
      _os_log_impl(&dword_1B39C0000, loga, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@: sendMessageIfNeeded called without requisite state (state: %{public}@, etaInfo: %{public}@, destinationInfo: %{public}@)", buf, 0x34u);

    }
LABEL_61:

  }
}

- (MSPSenderMessageStrategyDelegate)delegate
{
  return (MSPSenderMessageStrategyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
