@implementation BKHIDGenericGestureEventProcessor

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v8;
  id v9;
  __IOHIDEvent *v10;
  NSObject *v11;
  void *v12;
  int Phase;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  id v30;
  void *v31;
  NSMutableDictionary *pendingDestinationsPerSenderID;
  NSMutableDictionary *v33;
  NSMutableDictionary *v34;
  NSMutableDictionary *v35;
  NSMutableDictionary *genericGestureTypePerSenderID;
  void *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v45;
  int v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = *a3;
  objc_storeStrong((id *)&self->_eventDispatcher, a5);
  if (IOHIDEventGetType() == 39)
  {
    BKLogGenericGesture();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      BKSHIDEventGetConciseDescription();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = (uint64_t)v12;
      _os_log_impl(&dword_21B642000, v11, OS_LOG_TYPE_DEFAULT, "generic %{public}@", buf, 0xCu);

    }
    Phase = IOHIDEventGetPhase();
    if (!Phase)
    {
      BKLogGenericGesture();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v53 = (uint64_t)v10;
        _os_log_error_impl(&dword_21B642000, v19, OS_LOG_TYPE_ERROR, "filtering out generic event with zero phase (%{public}@)", buf, 0xCu);
      }
      goto LABEL_43;
    }
    v14 = Phase;
    os_unfair_lock_lock(&self->_lock);
    v45 = objc_msgSend(v8, "senderID");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:");
    v46 = v14 & 0xC;
    v47 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingDestinationsPerSenderID, "objectForKeyedSubscript:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count"))
    {
      v16 = 0;
      v17 = v15;
    }
    else
    {
      v17 = v15;
      objc_msgSend(v9, "destinationsForEvent:fromSender:", v10, v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
    }
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v20 = v15;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v49 != v23)
            objc_enumerationMutation(v20);
          -[BKHIDGenericGestureEventProcessor _postEvent:toDestination:usingDispatcher:](self, "_postEvent:toDestination:usingDispatcher:", v10, *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i), v9);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      }
      while (v22);
    }

    if (v46)
    {
      v25 = v17;
      v26 = objc_msgSend(v17, "count");
      v19 = v47;
      v27 = v16;
      if (v26)
      {
        BKLogGenericGesture();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v53 = v45;
          _os_log_impl(&dword_21B642000, v28, OS_LOG_TYPE_DEFAULT, "  sender:%llX remove all destinations", buf, 0xCu);
        }

        -[NSMutableDictionary removeObjectForKey:](self->_pendingDestinationsPerSenderID, "removeObjectForKey:", v47);
        -[NSMutableDictionary removeObjectForKey:](self->_genericGestureTypePerSenderID, "removeObjectForKey:", v47);
        v29 = objc_opt_class();
        v30 = v8;
        if (v29)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v31 = v30;
          else
            v31 = 0;
        }
        else
        {
          v31 = 0;
        }
        v43 = v31;

        if (v43)
          objc_msgSend(v43, "removeDisappearanceObserver:", self);
LABEL_41:

      }
    }
    else
    {
      v27 = v16;
      v25 = v17;
      v19 = v47;
      if (objc_msgSend(v16, "count"))
      {
        pendingDestinationsPerSenderID = self->_pendingDestinationsPerSenderID;
        if (!pendingDestinationsPerSenderID)
        {
          v33 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
          v34 = self->_pendingDestinationsPerSenderID;
          self->_pendingDestinationsPerSenderID = v33;

          v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
          genericGestureTypePerSenderID = self->_genericGestureTypePerSenderID;
          self->_genericGestureTypePerSenderID = v35;

          pendingDestinationsPerSenderID = self->_pendingDestinationsPerSenderID;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](pendingDestinationsPerSenderID, "setObject:forKeyedSubscript:", v16, v47);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", IOHIDEventGetIntegerValue());
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_genericGestureTypePerSenderID, "setObject:forKeyedSubscript:", v37, v47);

        BKLogGenericGesture();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v16, "bs_map:", &__block_literal_global);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v53 = v45;
          v54 = 2114;
          v55 = v39;
          _os_log_impl(&dword_21B642000, v38, OS_LOG_TYPE_DEFAULT, "  sender:%llX acquire destinations:%{public}@", buf, 0x16u);

        }
        v40 = objc_opt_class();
        v41 = v8;
        if (v40)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v42 = v41;
          else
            v42 = 0;
        }
        else
        {
          v42 = 0;
        }
        v43 = v42;

        if (v43)
          objc_msgSend(v43, "addDisappearanceObserver:queue:", self, MEMORY[0x24BDAC9B8]);
        goto LABEL_41;
      }
    }
    os_unfair_lock_unlock(&self->_lock);

LABEL_43:
    v18 = 1;
    goto LABEL_44;
  }
  v18 = 0;
LABEL_44:

  return v18;
}

- (void)serviceDidDisappear:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const void *GenericGestureEvent;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = objc_msgSend(v4, "senderID");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_pendingDestinationsPerSenderID, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    -[NSMutableDictionary objectForKey:](self->_genericGestureTypePerSenderID, "objectForKey:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "unsignedIntValue");
    mach_absolute_time();
    GenericGestureEvent = (const void *)IOHIDEventCreateGenericGestureEvent();
    IOHIDEventSetSenderID();
    IOHIDEventSetPhase();
    BKLogGenericGesture();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BKSHIDEventGetConciseDescription();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v10;
      _os_log_impl(&dword_21B642000, v9, OS_LOG_TYPE_DEFAULT, "generic cancel %{public}@", buf, 0xCu);

    }
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          -[BKHIDGenericGestureEventProcessor _postEvent:toDestination:usingDispatcher:](self, "_postEvent:toDestination:usingDispatcher:", GenericGestureEvent, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15++), self->_eventDispatcher);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v13);
    }

    -[NSMutableDictionary removeObjectForKey:](self->_pendingDestinationsPerSenderID, "removeObjectForKey:", v6);
    -[NSMutableDictionary removeObjectForKey:](self->_genericGestureTypePerSenderID, "removeObjectForKey:", v6);
    CFRelease(GenericGestureEvent);

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_postEvent:(__IOHIDEvent *)a3 toDestination:(id)a4 usingDispatcher:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  const void *Copy;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a5;
  BKLogGenericGesture();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = v6;
    _os_log_impl(&dword_21B642000, v8, OS_LOG_TYPE_DEFAULT, "  send to %{public}@", (uint8_t *)&v11, 0xCu);
  }

  Copy = (const void *)IOHIDEventCreateCopy();
  objc_msgSend(MEMORY[0x24BE0B688], "baseAttributesFromProvider:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  BKSHIDEventSetAttributes();
  objc_msgSend(v7, "postEvent:toDestination:", Copy, v6);

  CFRelease(Copy);
}

- (NSMutableDictionary)pendingDestinationsPerSenderID
{
  return self->_pendingDestinationsPerSenderID;
}

- (void)setPendingDestinationsPerSenderID:(id)a3
{
  objc_storeStrong((id *)&self->_pendingDestinationsPerSenderID, a3);
}

- (NSMutableDictionary)genericGestureTypePerSenderID
{
  return self->_genericGestureTypePerSenderID;
}

- (void)setGenericGestureTypePerSenderID:(id)a3
{
  objc_storeStrong((id *)&self->_genericGestureTypePerSenderID, a3);
}

- (BKHIDEventDispatcher)eventDispatcher
{
  return self->_eventDispatcher;
}

- (void)setEventDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_eventDispatcher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDispatcher, 0);
  objc_storeStrong((id *)&self->_genericGestureTypePerSenderID, 0);
  objc_storeStrong((id *)&self->_pendingDestinationsPerSenderID, 0);
}

uint64_t __68__BKHIDGenericGestureEventProcessor_processEvent_sender_dispatcher___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(a2, "pid"));
}

@end
