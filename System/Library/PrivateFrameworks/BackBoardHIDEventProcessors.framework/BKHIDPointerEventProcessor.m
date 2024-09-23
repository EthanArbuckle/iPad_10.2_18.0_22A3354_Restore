@implementation BKHIDPointerEventProcessor

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v8;
  id v9;
  __IOHIDEvent *v10;
  uint64_t SenderID;
  uint64_t Event;
  double v13;
  double v14;
  double v15;
  _BOOL8 v16;
  int64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  NSMutableDictionary *eventRecords;
  uint64_t v21;
  void *v22;
  BKHIDPointerEventRecord *v23;
  void *v24;
  NSMutableDictionary *v25;
  void *v26;
  NSObject *v27;
  __IOHIDEvent *v28;
  void *v29;
  const char *v30;
  NSMutableDictionary *v31;
  NSMutableDictionary *v32;
  NSMutableDictionary *v33;
  void *v34;
  BKHIDPointerEventProcessor *v35;
  uint64_t v36;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  int Type;
  BKHIDPointerEventProcessor *v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  __IOHIDEvent *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = *a3;
  if (IOHIDEventGetType() == 17)
  {
    SenderID = IOHIDEventGetSenderID();
    Event = IOHIDEventGetEvent();
    if (Event)
    {
      IOHIDEventGetFloatValue();
      v14 = v13;
      IOHIDEventGetFloatValue();
      v16 = v15 != 0.0 || v14 != 0.0;
    }
    else
    {
      v16 = 0;
    }
    v18 = IOHIDEventGetEvent();
    if (v18)
      v19 = IOHIDEventGetIntegerValue() != 0;
    else
      v19 = 0;
    v42 = self;
    eventRecords = self->_eventRecords;
    v21 = SenderID;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", SenderID);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](eventRecords, "objectForKey:", v22);
    v23 = (BKHIDPointerEventRecord *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[BKHIDPointerEventRecord destinations](v23, "destinations");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (Event)
        -[BKHIDPointerEventRecord setTrackingPointerMovement:](v23, "setTrackingPointerMovement:", v16);
      if (v18)
        -[BKHIDPointerEventRecord setTrackingButtonDown:](v23, "setTrackingButtonDown:", v19);
      if (!-[BKHIDPointerEventRecord trackingPointerMovement](v23, "trackingPointerMovement")
        && !-[BKHIDPointerEventRecord trackingButtonDown](v23, "trackingButtonDown"))
      {
        v25 = v42->_eventRecords;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v21);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](v25, "removeObjectForKey:", v26);

        BKLogHID();
        v27 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
LABEL_26:
          v35 = v42;

          goto LABEL_29;
        }
        objc_msgSend(v8, "displayUUID");
        v28 = (__IOHIDEvent *)objc_claimAutoreleasedReturnValue();
        -[BKHIDPointerEventRecord succinctDescription](v23, "succinctDescription");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v44 = v21;
        v45 = 2114;
        v46 = v28;
        v47 = 2114;
        v48 = v29;
        v30 = " %llX <displayID:%{public}@> pointer processing finished: %{public}@";
LABEL_25:
        _os_log_impl(&dword_21B642000, v27, OS_LOG_TYPE_DEFAULT, v30, buf, 0x20u);

        goto LABEL_26;
      }
    }
    else
    {
      objc_msgSend(v9, "destinationsForEvent:fromSender:", v10, v8);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19 || v16)
      {
        v23 = objc_alloc_init(BKHIDPointerEventRecord);
        -[BKHIDPointerEventRecord setSenderInfo:](v23, "setSenderInfo:", v8);
        objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
        -[BKHIDPointerEventRecord setDestinationCaptureTime:](v23, "setDestinationCaptureTime:");
        -[BKHIDPointerEventRecord setDestinations:](v23, "setDestinations:", v24);
        -[BKHIDPointerEventRecord setTrackingButtonDown:](v23, "setTrackingButtonDown:", v19);
        -[BKHIDPointerEventRecord setTrackingPointerMovement:](v23, "setTrackingPointerMovement:", v16);
        v31 = v42->_eventRecords;
        if (!v31)
        {
          v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
          v33 = v42->_eventRecords;
          v42->_eventRecords = v32;

          v31 = v42->_eventRecords;
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v21);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v31, "setObject:forKey:", v23, v34);

        BKLogHID();
        v27 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          goto LABEL_26;
        objc_msgSend(v8, "displayUUID");
        v28 = (__IOHIDEvent *)objc_claimAutoreleasedReturnValue();
        -[BKHIDPointerEventRecord succinctDescription](v23, "succinctDescription");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v44 = v21;
        v45 = 2114;
        v46 = v28;
        v47 = 2114;
        v48 = v29;
        v30 = " %llX <displayID:%{public}@> pointer processing began: %{public}@";
        goto LABEL_25;
      }
      v23 = 0;
    }
    v35 = v42;
LABEL_29:
    v36 = objc_msgSend(v24, "count");
    BKLogHID();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = os_log_type_enabled(v37, OS_LOG_TYPE_INFO);
    if (v36)
    {
      if (v38)
      {
        objc_msgSend(v8, "displayUUID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = (uint64_t)v39;
        v45 = 2114;
        v46 = v10;
        _os_log_impl(&dword_21B642000, v37, OS_LOG_TYPE_INFO, "Got an external interaction event meant for display: %{public}@, %{public}@", buf, 0x16u);

      }
      if (objc_msgSend(v8, "eventSource"))
        goto LABEL_37;
      objc_msgSend(v8, "displayUUID");
      v37 = objc_claimAutoreleasedReturnValue();
      _BKHIDNoteUserEventOccurredOnDisplay();
    }
    else if (v38)
    {
      Type = IOHIDEventGetType();
      *(_DWORD *)buf = 67109120;
      LODWORD(v44) = Type;
      _os_log_impl(&dword_21B642000, v37, OS_LOG_TYPE_INFO, "Got an external interaction event of type %d, but there is no destination set for it", buf, 8u);
    }

LABEL_37:
    -[BKHIDPointerEventProcessor _dispatchEvent:sender:dispatcher:destinations:](v35, "_dispatchEvent:sender:dispatcher:destinations:", v10, v8, v9, v24);

    v17 = 1;
    goto LABEL_38;
  }
  v17 = 0;
LABEL_38:

  return v17;
}

- (void)_dispatchEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5 destinations:(id)a6
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const void *Copy;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = a6;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14);
        Copy = (const void *)IOHIDEventCreateCopy();
        objc_msgSend(v8, "eventSource");
        BKSHIDEventSetSimpleDeliveryInfo();
        objc_msgSend(v9, "postEvent:toDestination:", Copy, v15);
        CFRelease(Copy);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventRecords, 0);
}

@end
