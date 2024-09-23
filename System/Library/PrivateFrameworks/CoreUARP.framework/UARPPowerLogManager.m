@implementation UARPPowerLogManager

- (UARPPowerLogManager)init
{
  UARPPowerLogManager *v2;
  os_log_t v3;
  OS_os_log *log;
  uint64_t v5;
  NSMutableSet *accessories;
  uint64_t v7;
  NSMutableSet *pendingReachableEvents;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UARPPowerLogManager;
  v2 = -[UARPPowerLogManager init](&v10, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.accessoryupdater.uarp", "powerLogManager");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    accessories = v2->_accessories;
    v2->_accessories = (NSMutableSet *)v5;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    pendingReachableEvents = v2->_pendingReachableEvents;
    v2->_pendingReachableEvents = (NSMutableSet *)v7;

    v2->_stagingWindowPeriodSeconds = 900;
  }
  return v2;
}

- (BOOL)accessoryIDSupportsPowerLogging:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "modelNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[UARPSupportedAccessory findByAppleModelNumber:](UARPSupportedAccessory, "findByAppleModelNumber:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "supportsPowerLogging");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)createPowerLogAccessoryForAccessoryID:(id)a3
{
  id v4;
  UARPPowerLogAccessory *v5;
  void *v6;
  void *v7;
  UARPPowerLogAccessory *v8;

  v4 = a3;
  if (-[UARPPowerLogManager accessoryIDSupportsPowerLogging:](self, "accessoryIDSupportsPowerLogging:", v4))
  {
    v5 = [UARPPowerLogAccessory alloc];
    objc_msgSend(v4, "modelNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[UARPPowerLogAccessory initWithModelNumber:uuid:stagingWindowPeriodSeconds:](v5, "initWithModelNumber:uuid:stagingWindowPeriodSeconds:", v6, v7, self->_stagingWindowPeriodSeconds);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)addAccessoryID:(id)a3
{
  id v4;
  void *v5;
  NSObject *log;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[UARPPowerLogManager createPowerLogAccessoryForAccessoryID:](self, "createPowerLogAccessoryForAccessoryID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (-[NSMutableSet containsObject:](self->_accessories, "containsObject:", v5))
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        -[UARPPowerLogManager addAccessoryID:].cold.1();
    }
    else
    {
      -[NSMutableSet addObject:](self->_accessories, "addObject:", v5);
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        v7 = 138412290;
        v8 = v4;
        _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "Added: %@", (uint8_t *)&v7, 0xCu);
      }
    }
  }

}

- (id)powerLogAccessoryForUUID:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_accessories;
  v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "uuid", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)powerLogAccessoryForAccessoryID:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPPowerLogManager powerLogAccessoryForUUID:](self, "powerLogAccessoryForUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pendingReachabilityEventForAccessoryID:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_pendingReachableEvents;
  v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "uuid", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if ((v12 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)postPendingReachabilityEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[NSMutableSet removeObject:](self->_pendingReachableEvents, "removeObject:", v4);
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPPowerLogManager powerLogAccessoryForUUID:](self, "powerLogAccessoryForUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "activeFirmwareVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stagedFirmwareVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setReachableWithActiveFirmwareVersion:stagedFirmwareVersion:", v7, v8);

  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[UARPPowerLogManager postPendingReachabilityEvent:].cold.1();
  }

}

- (void)removeAccessoryID:(id)a3
{
  id v4;
  void *v5;
  NSObject *log;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[UARPPowerLogManager powerLogAccessoryForAccessoryID:](self, "powerLogAccessoryForAccessoryID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "Removed: %@", (uint8_t *)&v7, 0xCu);
    }
    -[NSMutableSet removeObject:](self->_accessories, "removeObject:", v5);
  }
  else if (-[UARPPowerLogManager accessoryIDSupportsPowerLogging:](self, "accessoryIDSupportsPowerLogging:", v4)
         && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[UARPPowerLogManager removeAccessoryID:].cold.1();
  }

}

- (void)setAccessoryIDReachable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UARPPowerLogPendingReachabilityEvent *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[UARPPowerLogManager powerLogAccessoryForAccessoryID:](self, "powerLogAccessoryForAccessoryID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "reachable"))
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        -[UARPPowerLogManager setAccessoryIDReachable:].cold.2();
    }
    else
    {
      v7 = [UARPPowerLogPendingReachabilityEvent alloc];
      objc_msgSend(v4, "modelNumber");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[UARPPowerLogPendingReachabilityEvent initModelNumber:uuid:](v7, "initModelNumber:uuid:", v8, v9);

      -[NSMutableSet addObject:](self->_pendingReachableEvents, "addObject:", v10);
    }
  }
  else if (-[UARPPowerLogManager accessoryIDSupportsPowerLogging:](self, "accessoryIDSupportsPowerLogging:", v4)
         && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[UARPPowerLogManager setAccessoryIDReachable:].cold.1();
  }

}

- (void)setStagedFirmwareVersionForAccessoryID:(id)a3 stagedFirmwareVersion:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[UARPPowerLogManager pendingReachabilityEventForAccessoryID:](self, "pendingReachabilityEventForAccessoryID:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setStagedFirmwareVersion:", v8);
    if (objc_msgSend(v7, "allDataPresent"))
      -[UARPPowerLogManager postPendingReachabilityEvent:](self, "postPendingReachabilityEvent:", v7);
  }

}

- (void)setActiveFirmwareVersionForAccessoryID:(id)a3 activeFirmwareVersion:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[UARPPowerLogManager pendingReachabilityEventForAccessoryID:](self, "pendingReachabilityEventForAccessoryID:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setActiveFirmwareVersion:", v8);
    if (objc_msgSend(v7, "allDataPresent"))
      -[UARPPowerLogManager postPendingReachabilityEvent:](self, "postPendingReachabilityEvent:", v7);
  }

}

- (void)setAccessoryIDUnreachable:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UARPPowerLogManager powerLogAccessoryForAccessoryID:](self, "powerLogAccessoryForAccessoryID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "reachable") & 1) != 0)
    {
      objc_msgSend(v6, "setUnreachable");
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      -[UARPPowerLogManager setAccessoryIDUnreachable:].cold.2();
    }
  }
  else if (-[UARPPowerLogManager accessoryIDSupportsPowerLogging:](self, "accessoryIDSupportsPowerLogging:", v4)
         && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[UARPPowerLogManager setAccessoryIDUnreachable:].cold.1();
  }

}

- (void)setAssetOfferedForAccessoryID:(id)a3 offeredFirmwareVersion:(id)a4 activeFirmwareVersion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a5;
  -[UARPPowerLogManager powerLogAccessoryForAccessoryID:](self, "powerLogAccessoryForAccessoryID:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if ((objc_msgSend(v10, "reachable") & 1) != 0)
    {
      if (objc_msgSend(v11, "stagingInProgress"))
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
          -[UARPPowerLogManager setAssetOfferedForAccessoryID:offeredFirmwareVersion:activeFirmwareVersion:].cold.1();
      }
      else if (v8)
      {
        if (v9)
        {
          objc_msgSend(v11, "setAssetOfferedWithVersion:activeFirmwareVersion:", v8, v9);
        }
        else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        {
          -[UARPPowerLogManager setAssetOfferedForAccessoryID:offeredFirmwareVersion:activeFirmwareVersion:].cold.3();
        }
      }
      else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      {
        -[UARPPowerLogManager setAssetOfferedForAccessoryID:offeredFirmwareVersion:activeFirmwareVersion:].cold.2();
      }
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      -[UARPPowerLogManager setAssetOfferedForAccessoryID:offeredFirmwareVersion:activeFirmwareVersion:].cold.4();
    }
  }

}

- (void)setStagingCompleteForAccessoryID:(id)a3 stagedFirmwareVersion:(id)a4 activeFirmareVersion:(id)a5 status:(unint64_t)a6
{
  id v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;

  v10 = a3;
  v11 = (__CFString *)a4;
  v12 = (__CFString *)a5;
  -[UARPPowerLogManager powerLogAccessoryForAccessoryID:](self, "powerLogAccessoryForAccessoryID:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((objc_msgSend(v13, "stagingInProgress") & 1) != 0)
    {
      if (v11)
      {
        if (v12)
        {
LABEL_14:
          objc_msgSend(v14, "setStagingCompleteForStagedFirmareVersion:activeFirmareVersion:status:", v11, v12, a6);
          goto LABEL_15;
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
          -[UARPPowerLogManager setStagingCompleteForAccessoryID:stagedFirmwareVersion:activeFirmareVersion:status:].cold.2();
        v11 = &stru_24CEA45E8;
        if (v12)
          goto LABEL_14;
      }
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        -[UARPPowerLogManager setStagingCompleteForAccessoryID:stagedFirmwareVersion:activeFirmareVersion:status:].cold.1();
      v12 = &stru_24CEA45E8;
      goto LABEL_14;
    }
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[UARPPowerLogManager setStagingCompleteForAccessoryID:stagedFirmwareVersion:activeFirmareVersion:status:].cold.3();
  }
LABEL_15:

}

- (void)updateStagingProgressForAccessoryID:(id)a3 requestedOffset:(unsigned int)a4 requestedLength:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v8;
  void *v9;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  -[UARPPowerLogManager powerLogAccessoryForAccessoryID:](self, "powerLogAccessoryForAccessoryID:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((objc_msgSend(v8, "stagingInProgress") & 1) != 0)
    {
      objc_msgSend(v9, "updateStagingProgressWithRequestedOffset:requestedLength:", v6, v5);
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      -[UARPPowerLogManager updateStagingProgressForAccessoryID:requestedOffset:requestedLength:].cold.1();
    }
  }

}

- (unsigned)stagingWindowPeriodSeconds
{
  return self->_stagingWindowPeriodSeconds;
}

- (void)setStagingWindowPeriodSeconds:(unsigned int)a3
{
  self->_stagingWindowPeriodSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_pendingReachableEvents, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
}

- (void)addAccessoryID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Attempting to add %@ twice", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)postPendingReachabilityEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Attemping to post reachability event, but backing accessory is missing: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)removeAccessoryID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Attempting to remove accessory that is not present: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setAccessoryIDReachable:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Attempting to mark accessory reachable that is not present: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setAccessoryIDReachable:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Attemping to mark accessory reachable that is already reachable: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setAccessoryIDUnreachable:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Attempting to make accessory unreachable that is not present: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setAccessoryIDUnreachable:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Attempting to mark accessory unreachable that is already unreachable: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setAssetOfferedForAccessoryID:offeredFirmwareVersion:activeFirmwareVersion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Attempting to offer asset to accessory already staging: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setAssetOfferedForAccessoryID:offeredFirmwareVersion:activeFirmwareVersion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Attempting to stage nil firmware version: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setAssetOfferedForAccessoryID:offeredFirmwareVersion:activeFirmwareVersion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Attempting to stage with nil active firmware version: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setAssetOfferedForAccessoryID:offeredFirmwareVersion:activeFirmwareVersion:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Attempting to offer asset to unreachable accessory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setStagingCompleteForAccessoryID:stagedFirmwareVersion:activeFirmareVersion:status:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Attempting to complete staging with nil active firmware version: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setStagingCompleteForAccessoryID:stagedFirmwareVersion:activeFirmareVersion:status:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Attempting to complete staging for a nil firmware version: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setStagingCompleteForAccessoryID:stagedFirmwareVersion:activeFirmareVersion:status:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Attempting to complete staging for accessory where staging is not in progress: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateStagingProgressForAccessoryID:requestedOffset:requestedLength:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Attempting to update staging progress for an accessory where staging is not in progress: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
