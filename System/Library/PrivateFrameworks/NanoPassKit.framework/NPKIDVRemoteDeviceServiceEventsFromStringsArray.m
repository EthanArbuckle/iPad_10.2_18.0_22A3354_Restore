@implementation NPKIDVRemoteDeviceServiceEventsFromStringsArray

void __NPKIDVRemoteDeviceServiceEventsFromStringsArray_block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("NPKIDVRemoteDeviceServiceEventDidBecomeActive")))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(_QWORD *)(v7 + 24) | 1;
LABEL_14:
      *(_QWORD *)(v7 + 24) = v8;
      goto LABEL_15;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("NPKIDVRemoteDeviceServiceEventDidBecomeInactive")))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(_QWORD *)(v7 + 24) | 2;
      goto LABEL_14;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("NPKIDVRemoteDeviceServiceEventDidUnpair")))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(_QWORD *)(v7 + 24) | 4;
      goto LABEL_14;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("NPKIDVRemoteDeviceServiceEventRequirePrearmCredential")))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(_QWORD *)(v7 + 24) | 8;
      goto LABEL_14;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("NPKIDVRemoteDeviceServiceEventShouldBeDisarmed")))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(_QWORD *)(v7 + 24) | 0x10;
      goto LABEL_14;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("NPKIDVRemoteDeviceServiceEventDidDeletePass")))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(_QWORD *)(v7 + 24) | 0x20;
      goto LABEL_14;
    }
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

    if (v10)
    {
      pk_Payment_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = 138412290;
        v13 = v6;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Unknown remote eventString:%@. Ignoring it", (uint8_t *)&v12, 0xCu);
      }

    }
  }
LABEL_15:
  *a4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 63;

}

@end
