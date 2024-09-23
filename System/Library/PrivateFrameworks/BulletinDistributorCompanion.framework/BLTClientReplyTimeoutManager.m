@implementation BLTClientReplyTimeoutManager

- (BLTClientReplyTimeoutManager)initWithQueue:(id)a3
{
  id v5;
  BLTClientReplyTimeoutManager *v6;
  uint64_t v7;
  NSMutableArray *clientReplyTimeouts;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BLTClientReplyTimeoutManager;
  v6 = -[BLTClientReplyTimeoutManager init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    clientReplyTimeouts = v6->_clientReplyTimeouts;
    v6->_clientReplyTimeouts = (NSMutableArray *)v7;

    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v6;
}

- (void)_startNextClientReplyTimer
{
  void *v3;
  id v4;

  -[BLTClientReplyTimeoutManager _invalidateClientReplyTimer](self, "_invalidateClientReplyTimer");
  if (-[NSMutableArray count](self->_clientReplyTimeouts, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_clientReplyTimeouts, "objectAtIndexedSubscript:", 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTClientReplyTimeoutManager _startClientReplyTimerWithFireDate:](self, "_startClientReplyTimerWithFireDate:", v3);

  }
}

- (void)_startClientReplyTimerWithFireDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  OS_dispatch_queue *queue;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  -[BLTClientReplyTimeoutManager _invalidateClientReplyTimer](self, "_invalidateClientReplyTimer");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3748]), "initWithIdentifier:", CFSTR("com.apple.bulletindistributor.clientReplyTimeout"));
  -[BLTClientReplyTimeoutManager setTimer:](self, "setTimer:", v5);

  objc_initWeak(&location, self);
  -[BLTClientReplyTimeoutManager timer](self, "timer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __67__BLTClientReplyTimeoutManager__startClientReplyTimerWithFireDate___block_invoke;
  v8[3] = &unk_24D762C48;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v6, "scheduleForDate:leewayInterval:queue:handler:", v4, queue, v8, 1.0);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __67__BLTClientReplyTimeoutManager__startClientReplyTimerWithFireDate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleClientReplyTimeout");

}

- (void)_invalidateClientReplyTimer
{
  void *v3;

  -[BLTClientReplyTimeoutManager timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[BLTClientReplyTimeoutManager setTimer:](self, "setTimer:", 0);
}

- (BOOL)invalidateClientReplyTimeout:(id)a3
{
  uint64_t v4;

  v4 = -[NSMutableArray indexOfObject:](self->_clientReplyTimeouts, "indexOfObject:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_clientReplyTimeouts, "removeObjectAtIndex:", v4);
    if (!v4)
      -[BLTClientReplyTimeoutManager _startNextClientReplyTimer](self, "_startNextClientReplyTimer");
  }
  return v4 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)extendClientReplyTimeout:(id)a3 additionalTime:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v6 = a3;
  if (v6)
  {
    if (a4)
    {
      v12 = v6;
      v7 = -[NSMutableArray indexOfObject:](self->_clientReplyTimeouts, "indexOfObject:", v6);
      v6 = v12;
      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = v12;
        objc_msgSend(v8, "timeout");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "dateByAddingTimeInterval:", (double)a4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "setTimeout:", v10);
        -[BLTClientReplyTimeoutManager _sortTimeouts](self, "_sortTimeouts");
        -[NSMutableArray objectAtIndexedSubscript:](self->_clientReplyTimeouts, "objectAtIndexedSubscript:", 0);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v8)
          -[BLTClientReplyTimeoutManager _startNextClientReplyTimer](self, "_startNextClientReplyTimer");

        v6 = v12;
      }
    }
  }

}

- (void)_handleClientReplyTimeout
{
  void (**v3)(void);
  id v4;

  if (-[NSMutableArray count](self->_clientReplyTimeouts, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_clientReplyTimeouts, "objectAtIndexedSubscript:", 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeoutHandler");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

    -[NSMutableArray removeObjectAtIndex:](self->_clientReplyTimeouts, "removeObjectAtIndex:", 0);
    -[BLTClientReplyTimeoutManager _startNextClientReplyTimer](self, "_startNextClientReplyTimer");

  }
}

- (void)_sortTimeouts
{
  id v3;
  id v4;

  -[NSMutableArray firstObject](self->_clientReplyTimeouts, "firstObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray sortUsingComparator:](self->_clientReplyTimeouts, "sortUsingComparator:", &__block_literal_global_13);
  -[NSMutableArray firstObject](self->_clientReplyTimeouts, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v3)
    -[BLTClientReplyTimeoutManager _startNextClientReplyTimer](self, "_startNextClientReplyTimer");

}

uint64_t __45__BLTClientReplyTimeoutManager__sortTimeouts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "timeout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)addClientReplyTimeoutForBulletin:(id)a3 sectionID:(id)a4 timeout:(double)a5 handler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  BLTClientReplyTimeout *v16;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (void *)MEMORY[0x24BDBCE60];
  v13 = a6;
  objc_msgSend(v12, "dateWithTimeIntervalSinceNow:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  blt_general_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v18 = 138412802;
    v19 = v14;
    v20 = 2112;
    v21 = v10;
    v22 = 2112;
    v23 = v11;
    _os_log_impl(&dword_2173D9000, v15, OS_LOG_TYPE_INFO, "Add client reply timer (%@) for bulletin %@ in section %@", (uint8_t *)&v18, 0x20u);
  }

  v16 = objc_alloc_init(BLTClientReplyTimeout);
  -[BLTClientReplyTimeout setTimeout:](v16, "setTimeout:", v14);
  -[BLTClientReplyTimeout setTimeoutHandler:](v16, "setTimeoutHandler:", v13);

  -[NSMutableArray addObject:](self->_clientReplyTimeouts, "addObject:", v16);
  if (-[NSMutableArray count](self->_clientReplyTimeouts, "count") == 1)
    -[BLTClientReplyTimeoutManager _startNextClientReplyTimer](self, "_startNextClientReplyTimer");
  else
    -[BLTClientReplyTimeoutManager _sortTimeouts](self, "_sortTimeouts");

  return v16;
}

- (SWWakingTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientReplyTimeouts, 0);
}

@end
