@implementation CSTestingSupportNotificationGenerator

- (void)postNewNotificationToDestination:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSTestingSupportNotificationGenerator _nextNotificationRequest](self, "_nextNotificationRequest");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationRequest:", v5);

}

- (id)_nextNotificationRequest
{
  void *v3;
  int64_t sequenceNumber;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sequenceNumber = self->_sequenceNumber;
  v5 = sequenceNumber + 1;
  self->_sequenceNumber = sequenceNumber + 1;
  if (sequenceNumber >= -1)
    v6 = sequenceNumber + 1;
  else
    v6 = sequenceNumber + 2;
  v7 = v6 >> 1;
  v8 = objc_alloc_init(MEMORY[0x1E0DC5FC8]);
  objc_msgSend(v8, "setCustomHeader:", CFSTR("Test Notification"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Test Notification %ld"), v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v9);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("This is test notification #%ld"), v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMessage:", v10);

  objc_msgSend(v8, "setDate:", v3);
  v11 = objc_alloc_init(MEMORY[0x1E0DC5FD8]);
  objc_msgSend(v11, "setSectionIdentifier:", CFSTR("com.apple.springboard.coversheet.testing"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("notification-%ld"), v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNotificationIdentifier:", v12);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("thread-%ld"), v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setThreadIdentifier:", v13);

  objc_msgSend(v11, "setCategoryIdentifier:", CFSTR("com.apple.springboard.coversheet.testing.testcategory"));
  objc_msgSend(v11, "setTimestamp:", v3);
  v14 = (void *)MEMORY[0x1E0C99E60];
  v15 = *MEMORY[0x1E0DC60C8];
  v19[0] = *MEMORY[0x1E0DC60D0];
  v19[1] = v15;
  v19[2] = *MEMORY[0x1E0DC60D8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRequestDestinations:", v17);

  objc_msgSend(v11, "setContent:", v8);
  return v11;
}

@end
