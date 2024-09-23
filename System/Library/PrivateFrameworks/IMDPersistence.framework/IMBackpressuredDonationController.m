@implementation IMBackpressuredDonationController

- (IMBackpressuredDonationController)initWithDonationCount:(int64_t)a3 maxBackpressureSize:(int64_t)a4 donationBlock:(id)a5
{
  id v8;
  IMBackpressuredDonationController *v9;
  IMBackpressuredDonationController *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  void *v14;
  id donationBlock;
  NSMutableArray *v16;
  NSMutableArray *pendingDonations;
  objc_super v19;

  v8 = a5;
  v19.receiver = self;
  v19.super_class = (Class)IMBackpressuredDonationController;
  v9 = -[IMBackpressuredDonationController init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_donationCount = a3;
    v9->_maxBackpressureSize = a4;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.IMDPersistence.BackpressuredDonation", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    v14 = _Block_copy(v8);
    donationBlock = v10->_donationBlock;
    v10->_donationBlock = v14;

    v10->_donationInProgress = 0;
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingDonations = v10->_pendingDonations;
    v10->_pendingDonations = v16;

  }
  return v10;
}

- (void)_beganDonatingItems
{
  -[IMBackpressuredDonationController setDonationInProgress:](self, "setDonationInProgress:", 1);
}

- (id)_popDonationsUpToCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[IMBackpressuredDonationController pendingDonations](self, "pendingDonations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") <= (unint64_t)a3)
  {
    -[IMBackpressuredDonationController pendingDonations](self, "pendingDonations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v6, "count");

  }
  -[IMBackpressuredDonationController pendingDonations](self, "pendingDonations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subarrayWithRange:", 0, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMBackpressuredDonationController pendingDonations](self, "pendingDonations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectsInRange:", 0, a3);

  return v8;
}

- (void)_finishedDonatingItems:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v13 = 134217984;
      v14 = objc_msgSend(v4, "count");
      _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "Finished donating %llu interactions", (uint8_t *)&v13, 0xCu);
    }

  }
  -[IMBackpressuredDonationController setDonationInProgress:](self, "setDonationInProgress:", 0);
  -[IMBackpressuredDonationController pendingDonations](self, "pendingDonations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") == 0;

  if (!v7)
  {
    -[IMBackpressuredDonationController pendingDonations](self, "pendingDonations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    -[IMBackpressuredDonationController _popDonationsUpToCount:](self, "_popDonationsUpToCount:", -[IMBackpressuredDonationController donationCount](self, "donationCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = objc_msgSend(v10, "count");
        v13 = 134218240;
        v14 = v9;
        v15 = 2048;
        v16 = v12;
        _os_log_impl(&dword_1ABB60000, v11, OS_LOG_TYPE_INFO, "There are %llu interactions waiting to be donated, going to donate %llu more", (uint8_t *)&v13, 0x16u);
      }

    }
    -[IMBackpressuredDonationController _donateItems:](self, "_donateItems:", v10);

  }
}

- (void)_deferItems:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[IMBackpressuredDonationController pendingDonations](self, "pendingDonations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = objc_msgSend(v4, "count") + v6;

  v8 = v7 - -[IMBackpressuredDonationController maxBackpressureSize](self, "maxBackpressureSize");
  if (v8 >= 1)
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1ABC58908(v8, v9);

    -[IMBackpressuredDonationController pendingDonations](self, "pendingDonations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectsInRange:", 0, v8);

  }
  -[IMBackpressuredDonationController pendingDonations](self, "pendingDonations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObjectsFromArray:", v4);

}

- (void)_donateItems:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  _QWORD v13[4];
  id v14;
  IMBackpressuredDonationController *v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[IMBackpressuredDonationController donationInProgress](self, "donationInProgress"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v17 = objc_msgSend(v4, "count");
        _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "Donation is in progress, deferring donation of %llu interactions", buf, 0xCu);
      }

    }
    -[IMBackpressuredDonationController _deferItems:](self, "_deferItems:", v4);
  }
  else
  {
    v6 = objc_msgSend(v4, "count");
    if (v6 > -[IMBackpressuredDonationController donationCount](self, "donationCount"))
    {
      objc_msgSend(v4, "subarrayWithRange:", -[IMBackpressuredDonationController donationCount](self, "donationCount"), objc_msgSend(v4, "count") - -[IMBackpressuredDonationController donationCount](self, "donationCount"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218496;
          v17 = objc_msgSend(v4, "count");
          v18 = 2048;
          v19 = -[IMBackpressuredDonationController donationCount](self, "donationCount");
          v20 = 2048;
          v21 = objc_msgSend(v7, "count");
          _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "Received a request to index too many items (%llu > %llu), deferring %llu", buf, 0x20u);
        }

      }
      -[IMBackpressuredDonationController _deferItems:](self, "_deferItems:", v7);
      objc_msgSend(v4, "subarrayWithRange:", 0, -[IMBackpressuredDonationController donationCount](self, "donationCount"));
      v9 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v9;
    }
    -[IMBackpressuredDonationController _beganDonatingItems](self, "_beganDonatingItems");
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = objc_msgSend(v4, "count");
        *(_DWORD *)buf = 134217984;
        v17 = v11;
        _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "Going to donate %llu interactions", buf, 0xCu);
      }

    }
    -[IMBackpressuredDonationController donationBlock](self, "donationBlock");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1ABB96AD0;
    v13[3] = &unk_1E5AB28B8;
    v4 = v4;
    v14 = v4;
    v15 = self;
    ((void (**)(_QWORD, id, _QWORD *))v12)[2](v12, v4, v13);

  }
}

- (void)donateItems:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[IMBackpressuredDonationController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1ABB96D14;
  v7[3] = &unk_1E5AAF5B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (int64_t)donationCount
{
  return self->_donationCount;
}

- (int64_t)maxBackpressureSize
{
  return self->_maxBackpressureSize;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)donationBlock
{
  return self->_donationBlock;
}

- (void)setDonationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)donationInProgress
{
  return self->_donationInProgress;
}

- (void)setDonationInProgress:(BOOL)a3
{
  self->_donationInProgress = a3;
}

- (NSMutableArray)pendingDonations
{
  return self->_pendingDonations;
}

- (void)setPendingDonations:(id)a3
{
  objc_storeStrong((id *)&self->_pendingDonations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingDonations, 0);
  objc_storeStrong(&self->_donationBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
