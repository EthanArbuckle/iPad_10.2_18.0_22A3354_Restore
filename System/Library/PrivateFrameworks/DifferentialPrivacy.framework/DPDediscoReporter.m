@implementation DPDediscoReporter

void __43___DPDediscoReporter_keysWithDefaultValues__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("com.apple.messages.CommunicationSafety.PrivatizedUIInteraction");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)keysWithDefaultValues_keysWithDefaultValues;
  keysWithDefaultValues_keysWithDefaultValues = v2;

}

void __74___DPDediscoReporter_reportToDediscoRecords_forKey_keyProperties_storage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  uint64_t v9;

  v3 = a2;
  +[_DPLog daemon](_DPLog, "daemon");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __74___DPDediscoReporter_reportToDediscoRecords_forKey_keyProperties_storage___block_invoke_cold_1();

  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v5 = 0;
    do
    {
      v6 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v3, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_msgSend(*(id *)(a1 + 56), "telemetryAllowed") & 1) != 0
        || +[_DPDeviceInfo isInternalBuild](_DPDeviceInfo, "isInternalBuild");
      LOBYTE(v9) = v8;
      +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:telemetryAllowed:", v6, 4, 0, 0, 410, v7, v9);

      ++v5;
    }
    while (v5 < objc_msgSend(*(id *)(a1 + 40), "count"));
  }

}

void __74___DPDediscoReporter_reportToDediscoRecords_forKey_keyProperties_storage___block_invoke_48(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[_DPLog daemon](_DPLog, "daemon");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_1D3FAA000, v7, OS_LOG_TYPE_INFO, "Donation was successfully submitted to Dedisco for key: %@", (uint8_t *)&v11, 0xCu);
    }
LABEL_9:

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 40), "toDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

    goto LABEL_10;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __74___DPDediscoReporter_reportToDediscoRecords_forKey_keyProperties_storage___block_invoke_48_cold_2();

  if (objc_msgSend(v5, "code") == 205)
  {
    +[_DPLog daemon](_DPLog, "daemon");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __74___DPDediscoReporter_reportToDediscoRecords_forKey_keyProperties_storage___block_invoke_48_cold_1(v7);
    goto LABEL_9;
  }
LABEL_10:

}

uint64_t __60___DPDediscoReporter_filterNonConformingDediscoRecordsFrom___block_invoke()
{
  return objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1EFE3C7B8) ^ 1;
}

void __59___DPDediscoReporter_scheduleMaintenanceWithName_database___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (void *)os_transaction_create();
  v4 = (void *)MEMORY[0x1D8256B78]();
  objc_msgSend(*(id *)(a1 + 32), "reportDediscoRecords:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v4);

}

void __41___DPDediscoReporter__commSafetyAgeGroup__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(a2, "members", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v11, "isMe"))
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (unint64_t)objc_msgSend(v11, "age") < 0xD;
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
          }
        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
  }
  else
  {
    +[_DPLog daemon](_DPLog, "daemon");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __41___DPDediscoReporter__commSafetyAgeGroup__block_invoke_cold_1(a1, (uint64_t)v5, v6);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __74___DPDediscoReporter_reportToDediscoRecords_forKey_keyProperties_storage___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, v0, (uint64_t)v0, "Could not create connection to %@ : error=%@", v1);
  OUTLINED_FUNCTION_1();
}

void __74___DPDediscoReporter_reportToDediscoRecords_forKey_keyProperties_storage___block_invoke_48_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D3FAA000, log, OS_LOG_TYPE_DEBUG, "Treating HTTP non-2xx as final failure", v1, 2u);
}

void __74___DPDediscoReporter_reportToDediscoRecords_forKey_keyProperties_storage___block_invoke_48_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, v0, (uint64_t)v0, "Failed to submit donation to Dedisco for key %@ with error: %@", v1);
  OUTLINED_FUNCTION_1();
}

void __41___DPDediscoReporter__commSafetyAgeGroup__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(*(SEL *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, a3, v5, "%@: Failed to fetch CommSafety FamilyCircle, error: %@", v6);

  OUTLINED_FUNCTION_1_0();
}

@end
