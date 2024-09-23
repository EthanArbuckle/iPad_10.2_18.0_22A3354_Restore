@implementation FSChangeSubscription

- (FSChangeSubscription)initWithPath:(id)a3 fd:(int)a4 reader:(id)a5 sinceEventID:(unint64_t)a6 streamUUID:(id)a7 ignoreOwnEvents:(BOOL)a8 delegate:(id)a9 purpose:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  FSChangeSubscription *v20;
  uint64_t v21;
  NSString *root;
  objc_super v25;

  v15 = a3;
  v16 = a5;
  v17 = a7;
  v18 = a9;
  v19 = a10;
  v25.receiver = self;
  v25.super_class = (Class)FSChangeSubscription;
  v20 = -[FSChangeSubscription init](&v25, sel_init);
  if (v20)
  {
    objc_msgSend(v15, "fp_realpath");
    v21 = objc_claimAutoreleasedReturnValue();
    root = v20->_root;
    v20->_root = (NSString *)v21;

    v20->_rootfd = a4;
    objc_storeWeak((id *)&v20->_delegate, v18);
    v20->_lastDeliveredEventID = a6;
    objc_storeStrong((id *)&v20->_eventStreamUUID, a7);
    v20->_state = 1;
    objc_storeWeak((id *)&v20->_weakReader, v16);
    v20->_ignoreOwnEvents = a8;
    objc_storeStrong((id *)&v20->_purpose, a10);
  }

  return v20;
}

- (BOOL)activateWithError:(id *)a3
{
  id WeakRetained;
  int rootfd;
  FSChangeSubscription *v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  void *v11;
  stat v13;

  if (self->_state == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_weakReader);
    if (WeakRetained)
    {
      rootfd = self->_rootfd;
      if ((rootfd & 0x80000000) == 0
        || (self->_ownRootFD = 1,
            rootfd = open(-[NSString fileSystemRepresentation](self->_root, "fileSystemRepresentation"), 1048836),
            self->_rootfd = rootfd,
            (rootfd & 0x80000000) == 0))
      {
        memset(&v13, 0, sizeof(v13));
        if ((fstat(rootfd, &v13) & 0x80000000) == 0 && (v13.st_mode & 0xF000) == 0x4000)
        {
          self->_rootFileID = v13.st_ino;
          if (objc_msgSend(WeakRetained, "activateSubscription:error:", self, a3))
          {
            v7 = self;
            objc_sync_enter(v7);
            self->_state = 2;
            objc_sync_exit(v7);

            v8 = 1;
LABEL_17:

            return v8;
          }
LABEL_16:
          v8 = 0;
          goto LABEL_17;
        }
      }
      if (!a3)
        goto LABEL_16;
      v9 = (void *)MEMORY[0x24BDD1540];
      v10 = *__error();
      v11 = v9;
    }
    else
    {
      if (!a3)
        goto LABEL_16;
      v11 = (void *)MEMORY[0x24BDD1540];
      v10 = 22;
    }
    objc_msgSend(v11, "fp_errorWithPOSIXCode:", v10);
    v8 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x24BDD1540], "fp_errorWithPOSIXCode:", 35);
  v8 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return v8;
}

- (id)description
{
  const __CFString *v2;

  if (self->_state == 2)
    v2 = CFSTR("<subscription %@: observing>");
  else
    v2 = CFSTR("<subscription %@: (inactive)>");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v2, self->_purpose);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)rootParent
{
  return -[NSString stringByDeletingLastPathComponent](self->_root, "stringByDeletingLastPathComponent");
}

- (id)waitableBarrier
{
  id WeakRetained;
  void *v4;
  void *v5;
  NSObject *v6;
  FSChangeSubscription *v7;
  OS_dispatch_group *barrierGroup;
  dispatch_group_t v9;
  OS_dispatch_group *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  _BOOL4 v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  _QWORD block[4];
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  void *v33;
  uint64_t v34;

  WeakRetained = objc_loadWeakRetained((id *)&self->_weakReader);
  v4 = WeakRetained;
  if (WeakRetained
    && (objc_msgSend(WeakRetained, "barrierFolderURL"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = self;
    objc_sync_enter(v7);
    barrierGroup = v7->_barrierGroup;
    if (!barrierGroup)
    {
      v9 = dispatch_group_create();
      v10 = v7->_barrierGroup;
      v7->_barrierGroup = (OS_dispatch_group *)v9;

      dispatch_group_enter((dispatch_group_t)v7->_barrierGroup);
    }
    objc_storeStrong((id *)&v7->_notifyStreamUUID, v6);
    v11 = v7->_barrierGroup;
    objc_sync_exit(v7);

    v12 = (void *)MEMORY[0x24BDD17C8];
    -[NSObject UUIDString](v6, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR(".rendez-vous.%@.nosync"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "barrierFolderURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLByAppendingPathComponent:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_retainAutorelease(v16);
    v18 = objc_msgSend(v17, "fileSystemRepresentation");
    v19 = MEMORY[0x24BDAC760];
    v30 = MEMORY[0x24BDAC760];
    v31 = 3221225472;
    v32 = __39__FSChangeSubscription_waitableBarrier__block_invoke;
    v33 = &__block_descriptor_40_e8_i12__0i8l;
    v34 = v18;
    fpfs_openat();
    objc_msgSend(v4, "delegationQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = v19;
    block[1] = 3221225472;
    block[2] = __39__FSChangeSubscription_waitableBarrier__block_invoke_2;
    block[3] = &unk_250BDBB48;
    v21 = v17;
    v29 = v21;
    dispatch_group_notify(v11, v20, block);

    fp_current_or_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
    if (barrierGroup)
    {
      if (v23)
        -[FSChangeSubscription waitableBarrier].cold.3(v21, v22);
    }
    else if (v23)
    {
      -[FSChangeSubscription waitableBarrier].cold.2(v21, v22);
    }

    v26 = v29;
    v25 = v11;

  }
  else
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[FSChangeSubscription waitableBarrier].cold.1((uint64_t)v4, v6, v24);
    v25 = 0;
  }

  return v25;
}

uint64_t __39__FSChangeSubscription_waitableBarrier__block_invoke(uint64_t a1)
{
  return unlinkat(-2, *(const char **)(a1 + 32), 0);
}

uint64_t __39__FSChangeSubscription_waitableBarrier__block_invoke_2(uint64_t a1)
{
  return unlink((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "fileSystemRepresentation"));
}

- (void)didProcessEventID:(unint64_t)a3
{
  if (a3)
    self->_lastDeliveredEventID = a3;
}

- (BOOL)didProcessBarrierEventUUID:(id)a3
{
  id v4;
  FSChangeSubscription *v5;
  NSUUID *notifyStreamUUID;
  NSUUID *v7;
  OS_dispatch_group *barrierGroup;
  NSUUID *v9;
  NSObject *v10;
  uint64_t v11;
  BOOL v12;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  notifyStreamUUID = v5->_notifyStreamUUID;
  if (!notifyStreamUUID)
    goto LABEL_8;
  if (v4)
  {
    if (-[NSUUID isEqual:](notifyStreamUUID, "isEqual:", v4))
    {
      notifyStreamUUID = v5->_notifyStreamUUID;
      goto LABEL_5;
    }
LABEL_8:
    objc_sync_exit(v5);

    v12 = 0;
    goto LABEL_9;
  }
LABEL_5:
  v7 = notifyStreamUUID;
  dispatch_group_leave((dispatch_group_t)v5->_barrierGroup);
  barrierGroup = v5->_barrierGroup;
  v5->_barrierGroup = 0;

  v9 = v5->_notifyStreamUUID;
  v5->_notifyStreamUUID = 0;

  objc_sync_exit(v5);
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[FSChangeSubscription didProcessBarrierEventUUID:].cold.1((uint64_t)v7, v10, v11);

  v12 = 1;
LABEL_9:

  return v12;
}

- (void)dispose
{
  FSChangeSubscription *v2;
  id WeakRetained;
  id v4;
  FSChangeSubscription *obj;

  v2 = self;
  objc_sync_enter(v2);
  v2->_state = 4;
  objc_sync_exit(v2);

  WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
  objc_msgSend(WeakRetained, "subscriptionHandleTermination:", v2);

  v4 = objc_loadWeakRetained((id *)&v2->_weakReader);
  objc_msgSend(v4, "disableSubscription:", v2);

  obj = v2;
  objc_sync_enter(obj);
  if (obj->_ownRootFD)
  {
    close(obj->_rootfd);
    obj->_rootfd = -1;
  }
  objc_storeWeak((id *)&v2->_delegate, 0);
  objc_storeWeak((id *)&v2->_weakReader, 0);
  objc_sync_exit(obj);

}

- (NSString)root
{
  return self->_root;
}

- (int)rootfd
{
  return self->_rootfd;
}

- (unint64_t)rootFileID
{
  return self->_rootFileID;
}

- (FSChangeSubscriptionDelegate)delegate
{
  return (FSChangeSubscriptionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)lastDeliveredEventID
{
  return self->_lastDeliveredEventID;
}

- (void)setLastDeliveredEventID:(unint64_t)a3
{
  self->_lastDeliveredEventID = a3;
}

- (NSUUID)eventStreamUUID
{
  return self->_eventStreamUUID;
}

- (void)setEventStreamUUID:(id)a3
{
  objc_storeStrong((id *)&self->_eventStreamUUID, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (BOOL)isActivated
{
  return self->_isActivated;
}

- (void)setIsActivated:(BOOL)a3
{
  self->_isActivated = a3;
}

- (BOOL)ignoreOwnEvents
{
  return self->_ignoreOwnEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStreamUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_root, 0);
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_destroyWeak((id *)&self->_weakReader);
  objc_storeStrong((id *)&self->_notifyStreamUUID, 0);
  objc_storeStrong((id *)&self->_barrierGroup, 0);
}

- (void)waitableBarrier
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0(&dword_23AA66000, a2, v4, "[DEBUG] 🚧  updating existing barrier to new rendez-vous %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_1();
}

- (void)didProcessBarrierEventUUID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_23AA66000, a2, a3, "[DEBUG] 🚧  handle event on barrier %@", (uint8_t *)&v3);
}

@end
