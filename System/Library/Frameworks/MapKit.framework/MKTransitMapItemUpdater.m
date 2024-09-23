@implementation MKTransitMapItemUpdater

- (MKTransitMapItemUpdater)initWithMapItem:(id)a3 delegate:(id)a4
{
  id v7;
  MKTransitMapItemUpdater *v8;
  MKTransitMapItemUpdater *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MKTransitMapItemUpdater;
  v8 = -[MKTransitItemReferenceDateUpdater initWithDelegate:](&v11, sel_initWithDelegate_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_mapItem, a3);

  return v9;
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)MKTransitMapItemUpdater;
  -[MKTransitItemReferenceDateUpdater setActive:](&v21, sel_setActive_);
  MKGetTransitItemUpdaterLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v6)
    {
      -[MKTransitMapItemUpdater mapItem](self, "mapItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTransitMapItemUpdater mapItem](self, "mapItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "muid");
      *(_DWORD *)buf = 138412546;
      v23 = v8;
      v24 = 2048;
      v25 = v11;
      _os_log_impl(&dword_18B0B0000, v5, OS_LOG_TYPE_DEBUG, "Activating updater for %@ <muid: %llu>", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTransitMapItemUpdater mapItem](self, "mapItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__transitInfoUpdated, CFSTR("kMapItemTransitInfoDidUpdateNotification"), v13);

    -[MKTransitMapItemUpdater _resumeDataRefreshTimer](self, "_resumeDataRefreshTimer");
  }
  else
  {
    if (v6)
    {
      -[MKTransitMapItemUpdater mapItem](self, "mapItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTransitMapItemUpdater mapItem](self, "mapItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "muid");
      *(_DWORD *)buf = 138412546;
      v23 = v15;
      v24 = 2048;
      v25 = v18;
      _os_log_impl(&dword_18B0B0000, v5, OS_LOG_TYPE_DEBUG, "Deactivating updater for %@ <muid: %llu>", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTransitMapItemUpdater mapItem](self, "mapItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObserver:name:object:", self, CFSTR("kMapItemTransitInfoDidUpdateNotification"), v20);

    -[MKTransitMapItemUpdater _suspendDataRefreshTimer](self, "_suspendDataRefreshTimer");
  }
}

- (void)_resumeDataRefreshTimer
{
  void *v3;
  id v4;

  -[MKTransitMapItemUpdater suggestedDataRefreshDate](self, "suggestedDataRefreshDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MKTransitMapItemUpdater suggestedDataRefreshDate](self, "suggestedDataRefreshDate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[MKTransitMapItemUpdater _scheduleDataUpdateForTransitItemAtDate:](self, "_scheduleDataUpdateForTransitItemAtDate:", v4);

  }
  else
  {
    -[MKTransitMapItemUpdater _refreshTransitInfoIfNeeded](self, "_refreshTransitInfoIfNeeded");
  }
}

- (void)_suspendDataRefreshTimer
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[MKTransitMapItemUpdater dataRefreshTimer](self, "dataRefreshTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    MKGetTransitItemUpdaterLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      -[MKTransitMapItemUpdater mapItem](self, "mapItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTransitMapItemUpdater mapItem](self, "mapItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "muid");
      -[MKTransitMapItemUpdater dataRefreshTimer](self, "dataRefreshTimer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fireDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v6;
      v15 = 2048;
      v16 = v9;
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_18B0B0000, v4, OS_LOG_TYPE_DEBUG, "Cancelling scheduled mapItem update for %@ <muid: %llu> at %@", (uint8_t *)&v13, 0x20u);

    }
    -[MKTransitMapItemUpdater dataRefreshTimer](self, "dataRefreshTimer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidate");

    -[MKTransitMapItemUpdater setDataRefreshTimer:](self, "setDataRefreshTimer:", 0);
  }
}

- (void)_scheduleDataUpdateForTransitItemAtDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _BOOL4 v25;
  const char *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MKTransitMapItemUpdater setSuggestedDataRefreshDate:](self, "setSuggestedDataRefreshDate:", v4);
  if (-[MKTransitItemReferenceDateUpdater isActive](self, "isActive")
    && (-[MKTransitMapItemUpdater suggestedDataRefreshDate](self, "suggestedDataRefreshDate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[MKTransitMapItemUpdater dataRefreshTimer](self, "dataRefreshTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    objc_msgSend(v4, "timeIntervalSinceNow");
    v8 = v7;
    MKGetTransitItemUpdaterLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v8 <= 0.0)
    {
      if (v10)
      {
        -[MKTransitMapItemUpdater mapItem](self, "mapItem");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "name");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKTransitMapItemUpdater mapItem](self, "mapItem");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "_identifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v34 = v28;
        v35 = 2048;
        v36 = objc_msgSend(v30, "muid");
        v37 = 2112;
        v38 = (const char *)v4;
        _os_log_impl(&dword_18B0B0000, v9, OS_LOG_TYPE_DEBUG, "Performing immediate mapItem update for %@ <muid: %llu>, was scheduled for %@", buf, 0x20u);

      }
      -[MKTransitMapItemUpdater _refreshTransitInfoIfNeeded](self, "_refreshTransitInfoIfNeeded");
    }
    else
    {
      if (v10)
      {
        -[MKTransitMapItemUpdater mapItem](self, "mapItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKTransitMapItemUpdater mapItem](self, "mapItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v34 = v12;
        v35 = 2048;
        v36 = objc_msgSend(v14, "muid");
        v37 = 2112;
        v38 = (const char *)v4;
        _os_log_impl(&dword_18B0B0000, v9, OS_LOG_TYPE_DEBUG, "Scheduling mapItem update for %@ <muid: %llu> at %@", buf, 0x20u);

      }
      objc_initWeak((id *)buf, self);
      v15 = (void *)MEMORY[0x1E0C99E88];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __67__MKTransitMapItemUpdater__scheduleDataUpdateForTransitItemAtDate___block_invoke;
      v31[3] = &unk_1E20D9138;
      objc_copyWeak(&v32, (id *)buf);
      objc_msgSend(v15, "scheduledTimerWithTimeInterval:repeats:block:", 0, v31, v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTransitMapItemUpdater setDataRefreshTimer:](self, "setDataRefreshTimer:", v16);

      -[MKTransitMapItemUpdater suggestedDataRefreshDate](self, "suggestedDataRefreshDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTransitMapItemUpdater dataRefreshTimer](self, "dataRefreshTimer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFireDate:", v17);

      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    MKGetTransitItemUpdaterLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      -[MKTransitMapItemUpdater mapItem](self, "mapItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTransitMapItemUpdater mapItem](self, "mapItem");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "muid");
      v25 = -[MKTransitItemReferenceDateUpdater isActive](self, "isActive");
      v26 = "NO";
      *(_DWORD *)buf = 138413058;
      v35 = 2048;
      v34 = v21;
      if (v25)
        v26 = "YES";
      v36 = v24;
      v37 = 2080;
      v38 = v26;
      v39 = 2112;
      v40 = v4;
      _os_log_impl(&dword_18B0B0000, v19, OS_LOG_TYPE_DEBUG, "Will not schedule mapItem update for %@ <muid: %llu> (isActive:%s, date:%@)", buf, 0x2Au);

    }
    -[MKTransitMapItemUpdater _suspendDataRefreshTimer](self, "_suspendDataRefreshTimer");
  }

}

void __67__MKTransitMapItemUpdater__scheduleDataUpdateForTransitItemAtDate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_refreshTransitInfoIfNeeded");

}

- (void)_refreshTransitInfoIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  BOOL v17;
  void *v18;
  double v19;
  BOOL v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  const char *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  char *v30;
  uint64_t v31;
  int v32;
  int v33;
  void *v34;
  char *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  char *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  char *v50;
  uint64_t v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  id v55[2];
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  _BYTE v61[10];
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  -[MKTransitMapItemUpdater mapItem](self, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MKTransitItemReferenceDateUpdater delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      if (!-[MKTransitMapItemUpdater isRefreshing](self, "isRefreshing")
        && -[MKTransitItemReferenceDateUpdater isActive](self, "isActive"))
      {
        -[MKTransitMapItemUpdater dataRefreshTimer](self, "dataRefreshTimer");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "invalidate");

        -[MKTransitMapItemUpdater setDataRefreshTimer:](self, "setDataRefreshTimer:", 0);
        -[MKTransitMapItemUpdater mapItem](self, "mapItem");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_transitInfo");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v7)
        {
          MKGetTransitItemUpdaterLog();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18B0B0000, v27, OS_LOG_TYPE_ERROR, "Will not refresh item (transitInfo:NO)", buf, 2u);
          }

          -[MKTransitMapItemUpdater setRefreshing:](self, "setRefreshing:", 0);
          goto LABEL_50;
        }
        -[MKTransitMapItemUpdater mapItem](self, "mapItem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
        {
          MKGetTransitItemUpdaterLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18B0B0000, v10, OS_LOG_TYPE_DEBUG, "MapItem is missing an identifier. This is expected for Nearby Transit mapItems, but could indicate an error for other types.", buf, 2u);
          }

        }
        objc_msgSend(v7, "timeToLive");
        v12 = v11;
        -[MKTransitMapItemUpdater mapItem](self, "mapItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_transitInfoUpdatedDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (*(double *)&v12 <= 0.0
          || v14
          && (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v15, "timeIntervalSinceDate:", v14),
              v17 = v16 < *(double *)&v12,
              v15,
              v17))
        {
          if ((objc_msgSend(v7, "isTransitIncidentsTTLExpired") & 1) != 0
            || (objc_msgSend(v7, "hasTransitIncidentComponent") & 1) == 0)
          {
            MKGetTransitItemUpdaterLog();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              -[MKTransitMapItemUpdater mapItem](self, "mapItem");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "name");
              v30 = (char *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v9, "muid");
              v32 = objc_msgSend(v7, "isTransitIncidentsTTLExpired");
              v33 = objc_msgSend(v7, "hasTransitIncidentComponent");
              *(_DWORD *)buf = 138413058;
              v57 = v30;
              v58 = 2048;
              v59 = v31;
              v60 = 1024;
              *(_DWORD *)v61 = v32;
              *(_WORD *)&v61[4] = 1024;
              *(_DWORD *)&v61[6] = v33;
              _os_log_impl(&dword_18B0B0000, v28, OS_LOG_TYPE_DEBUG, "MapItem %@ <muid: %llu> needs update: expired: %d, hasComponent: %d", buf, 0x22u);

            }
          }
          else
          {
            objc_msgSend(v7, "lastFullScheduleValidDate");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "timeIntervalSinceNow");
            v20 = v19 > 300.0;

            if (v20)
            {
              v21 = 0;
LABEL_40:
              -[MKTransitItemReferenceDateUpdater delegate](self, "delegate");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "ticketForTransitMapItemUpdater:", self);
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              if (v21)
              {
                if (v38)
                {
                  -[MKTransitMapItemUpdater setRefreshing:](self, "setRefreshing:", 1);
                  -[MKTransitItemReferenceDateUpdater delegate](self, "delegate");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MKTransitMapItemUpdater mapItem](self, "mapItem");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "transitMapItemUpdater:willUpdateMapItem:", self, v40);

                  objc_initWeak((id *)buf, self);
                  v53[0] = MEMORY[0x1E0C809B0];
                  v53[1] = 3221225472;
                  v53[2] = __54__MKTransitMapItemUpdater__refreshTransitInfoIfNeeded__block_invoke;
                  v53[3] = &unk_1E20DF808;
                  objc_copyWeak(v55, (id *)buf);
                  v54 = v9;
                  v55[1] = v12;
                  objc_msgSend(v38, "submitWithHandler:networkActivity:", v53, 0);

                  objc_destroyWeak(v55);
                  objc_destroyWeak((id *)buf);
                }
                else
                {
                  MKGetTransitItemUpdaterLog();
                  v42 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                  {
                    -[MKTransitMapItemUpdater mapItem](self, "mapItem");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "name");
                    v44 = (char *)objc_claimAutoreleasedReturnValue();
                    v45 = objc_msgSend(v9, "muid");
                    -[MKTransitItemReferenceDateUpdater delegate](self, "delegate");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    v47 = objc_opt_class();
                    *(_DWORD *)buf = 138412802;
                    v57 = v44;
                    v58 = 2048;
                    v59 = v45;
                    v60 = 2112;
                    *(_QWORD *)v61 = v47;
                    _os_log_impl(&dword_18B0B0000, v42, OS_LOG_TYPE_ERROR, "MapItem %@ <muid: %llu> needs update but delegate %@ failed to provide a ticket", buf, 0x20u);

                  }
                  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", *(double *)&v12);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MKTransitMapItemUpdater _scheduleDataUpdateForTransitItemAtDate:](self, "_scheduleDataUpdateForTransitItemAtDate:", v48);
                  -[MKTransitMapItemUpdater setRefreshing:](self, "setRefreshing:", 0);

                }
              }
              else
              {
                if (*(double *)&v12 > 0.0)
                {
                  objc_msgSend(v14, "dateByAddingTimeInterval:", *(double *)&v12);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MKTransitMapItemUpdater _scheduleDataUpdateForTransitItemAtDate:](self, "_scheduleDataUpdateForTransitItemAtDate:", v41);

                }
                -[MKTransitMapItemUpdater setRefreshing:](self, "setRefreshing:", 0);
              }

LABEL_50:
              return;
            }
            MKGetTransitItemUpdaterLog();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              -[MKTransitMapItemUpdater mapItem](self, "mapItem");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "name");
              v50 = (char *)objc_claimAutoreleasedReturnValue();
              v51 = objc_msgSend(v9, "muid");
              objc_msgSend(v7, "lastFullScheduleValidDate");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v57 = v50;
              v58 = 2048;
              v59 = v51;
              v60 = 2112;
              *(_QWORD *)v61 = v52;
              _os_log_impl(&dword_18B0B0000, v28, OS_LOG_TYPE_DEBUG, "MapItem %@ <muid: %llu> needs update: schedule ends %@", buf, 0x20u);

            }
          }
        }
        else
        {
          MKGetTransitItemUpdaterLog();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            -[MKTransitMapItemUpdater mapItem](self, "mapItem");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "name");
            v35 = (char *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v9, "muid");
            *(_DWORD *)buf = 138413058;
            v57 = v35;
            v58 = 2048;
            v59 = v36;
            v60 = 2048;
            *(_QWORD *)v61 = v12;
            *(_WORD *)&v61[8] = 2112;
            v62 = v14;
            _os_log_impl(&dword_18B0B0000, v28, OS_LOG_TYPE_DEBUG, "MapItem %@ <muid: %llu> needs update: Schedule TTL = %#.1lfs, last updated: %@", buf, 0x2Au);

          }
        }

        v21 = 1;
        goto LABEL_40;
      }
      MKGetTransitItemUpdaterLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        if (-[MKTransitMapItemUpdater isRefreshing](self, "isRefreshing"))
          v24 = "YES";
        else
          v24 = "NO";
        if (-[MKTransitItemReferenceDateUpdater isActive](self, "isActive"))
          v25 = "YES";
        else
          v25 = "NO";
        *(_DWORD *)buf = 136315394;
        v57 = v24;
        v58 = 2080;
        v59 = (uint64_t)v25;
        _os_log_impl(&dword_18B0B0000, v23, OS_LOG_TYPE_DEBUG, "Will not refresh item (refreshing:%s, isActive:%s)", buf, 0x16u);
      }

    }
    else
    {
      MKGetTransitItemUpdaterLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18B0B0000, v26, OS_LOG_TYPE_ERROR, "Will not refresh item, no delegate", buf, 2u);
      }

      -[MKTransitMapItemUpdater _suspendDataRefreshTimer](self, "_suspendDataRefreshTimer");
      -[MKTransitMapItemUpdater setRefreshing:](self, "setRefreshing:", 0);
    }
  }
  else
  {
    MKGetTransitItemUpdaterLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B0B0000, v22, OS_LOG_TYPE_ERROR, "Will not refresh item, no map item", buf, 2u);
    }

    -[MKTransitMapItemUpdater setRefreshing:](self, "setRefreshing:", 0);
  }
}

void __54__MKTransitMapItemUpdater__refreshTransitInfoIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_processUpdatedMapItems:identifier:ttl:error:", v8, *(_QWORD *)(a1 + 32), v5, *(double *)(a1 + 48));

}

- (void)_processUpdatedMapItems:(id)a3 identifier:(id)a4 ttl:(double)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  const char *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  double v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  _BOOL4 v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  id v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v46;
LABEL_3:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v46 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v17);
      objc_msgSend(v18, "_identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqual:", v11);

      if ((v20 & 1) != 0)
        break;
      if (v15 == ++v17)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
        if (v15)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v21 = v18;
    objc_msgSend(v21, "_markTransitInfoUpdated");

    if (v21)
      goto LABEL_14;
  }
  else
  {
LABEL_9:

  }
  if (objc_msgSend(v13, "count") == 1)
  {
    objc_msgSend(v13, "firstObject");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_markTransitInfoUpdated");
  }
  else
  {
    v21 = 0;
  }
LABEL_14:
  MKGetTransitItemUpdaterLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    -[MKTransitMapItemUpdater mapItem](self, "mapItem");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTransitMapItemUpdater mapItem](self, "mapItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v12;
    v26 = objc_msgSend(v24, "_muid");
    objc_msgSend(v21, "_transitInfoUpdatedDate");
    v27 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v50 = *(double *)&v23;
    v51 = 2048;
    v52 = v26;
    v12 = v25;
    v53 = 1024;
    v54 = v21 != 0;
    v55 = 2112;
    v56 = v27;
    v28 = (void *)v27;
    v57 = 2112;
    v58 = v25;
    _os_log_impl(&dword_18B0B0000, v22, OS_LOG_TYPE_DEBUG, "MapItem %@ <muid: %llu> update (success:%d, lastRefresh:%@, error:%@)", buf, 0x30u);

  }
  objc_msgSend(v21, "_transitInfo");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    objc_msgSend(v21, "_transitInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "timeToLive");
    a5 = v31;

  }
  if (a5 > 0.0)
  {
    objc_msgSend(v21, "_transitInfoUpdatedDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v21, "_transitInfoUpdatedDate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "dateByAddingTimeInterval:", a5);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      MKGetTransitItemUpdaterLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218242;
        v50 = a5;
        v51 = 2112;
        v52 = (uint64_t)v34;
        v36 = "- Schedule TTL expires in %#.1lfs at %@";
LABEL_25:
        _os_log_impl(&dword_18B0B0000, v35, OS_LOG_TYPE_DEBUG, v36, buf, 0x16u);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a5);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      MKGetTransitItemUpdaterLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218242;
        v50 = a5;
        v51 = 2112;
        v52 = (uint64_t)v34;
        v36 = "- Suggesting next attempt based on previous TTL of %#.1lfs at %@";
        goto LABEL_25;
      }
    }

    goto LABEL_27;
  }
  v34 = 0;
LABEL_27:
  objc_msgSend(v21, "_transitInfo");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "lastFullScheduleValidDate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38 && (!v34 || objc_msgSend(v38, "compare:", v34) == -1))
  {
    MKGetTransitItemUpdaterLog();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v50 = *(double *)&v38;
      _os_log_impl(&dword_18B0B0000, v39, OS_LOG_TYPE_DEBUG, "- Schedule valid to %@", buf, 0xCu);
    }

    v40 = v38;
    v34 = v40;
  }
  -[MKTransitMapItemUpdater setLastInfoRefreshFailed:](self, "setLastInfoRefreshFailed:", v21 == 0);
  if (v21)
  {
    -[MKTransitMapItemUpdater mapItem](self, "mapItem");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "_updateTransitInfoWithMapItem:", v21);

  }
  -[MKTransitMapItemUpdater setRefreshing:](self, "setRefreshing:", 0);
  if (-[MKTransitItemReferenceDateUpdater isActive](self, "isActive"))
  {
    -[MKTransitItemReferenceDateUpdater delegate](self, "delegate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTransitMapItemUpdater mapItem](self, "mapItem");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "transitMapItemUpdater:updatedMapItem:error:", self, v43, v12);

  }
  -[MKTransitMapItemUpdater _scheduleDataUpdateForTransitItemAtDate:](self, "_scheduleDataUpdateForTransitItemAtDate:", v34);

}

- (BOOL)isStuckWithExpiredInfoRelativeToDate:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[MKTransitMapItemUpdater lastInfoRefreshFailed](self, "lastInfoRefreshFailed"))
    v5 = -[MKTransitMapItemUpdater _isInfoExpiredRelativeToDate:](self, "_isInfoExpiredRelativeToDate:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)_isInfoExpiredRelativeToDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v4 = a3;
  -[MKTransitMapItemUpdater mapItem](self, "mapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_transitInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "lastFullScheduleValidDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v4);
  v9 = v8;

  return v9 <= 30.0;
}

- (void)_transitInfoUpdated
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[MKTransitItemReferenceDateUpdater delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    MKGetTransitItemUpdaterLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_18B0B0000, v4, OS_LOG_TYPE_ERROR, "Received a notification that the mapItem was updated, but there is no delegate", (uint8_t *)&v13, 2u);
    }

    -[MKTransitMapItemUpdater _suspendDataRefreshTimer](self, "_suspendDataRefreshTimer");
  }
  if (!self->_refreshing)
  {
    MKGetTransitItemUpdaterLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[MKTransitMapItemUpdater mapItem](self, "mapItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTransitMapItemUpdater mapItem](self, "mapItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "muid");
      v13 = 138412546;
      v14 = v7;
      v15 = 2048;
      v16 = v10;
      _os_log_impl(&dword_18B0B0000, v5, OS_LOG_TYPE_DEBUG, "MapItem %@ <muid: %llu> updated outside of the network refresh", (uint8_t *)&v13, 0x16u);

    }
    -[MKTransitMapItemUpdater setLastInfoRefreshFailed:](self, "setLastInfoRefreshFailed:", 0);
    -[MKTransitItemReferenceDateUpdater delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTransitMapItemUpdater mapItem](self, "mapItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "transitMapItemUpdater:updatedMapItem:error:", self, v12, 0);

  }
}

- (BOOL)lastInfoRefreshFailed
{
  return self->_lastInfoRefreshFailed;
}

- (void)setLastInfoRefreshFailed:(BOOL)a3
{
  self->_lastInfoRefreshFailed = a3;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (BOOL)isRefreshing
{
  return self->_refreshing;
}

- (void)setRefreshing:(BOOL)a3
{
  self->_refreshing = a3;
}

- (NSTimer)dataRefreshTimer
{
  return self->_dataRefreshTimer;
}

- (void)setDataRefreshTimer:(id)a3
{
  objc_storeStrong((id *)&self->_dataRefreshTimer, a3);
}

- (NSDate)suggestedDataRefreshDate
{
  return self->_suggestedDataRefreshDate;
}

- (void)setSuggestedDataRefreshDate:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedDataRefreshDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedDataRefreshDate, 0);
  objc_storeStrong((id *)&self->_dataRefreshTimer, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
