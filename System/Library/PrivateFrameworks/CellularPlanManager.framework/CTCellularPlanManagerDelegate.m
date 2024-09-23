@implementation CTCellularPlanManagerDelegate

- (void)planInfoDidUpdate
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CTCellularPlanManagerDelegate planInfoDidUpdate]";
    _os_log_impl(&dword_1D33B0000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CTCellularPlanManagerDelegate_planInfoDidUpdate__block_invoke;
  block[3] = &unk_1E95219B0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __50__CTCellularPlanManagerDelegate_planInfoDidUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("CTCellularPlanInfoDidChangeNotification"), *(_QWORD *)(a1 + 32), 0);
}

- (void)localPlanInfoDidUpdate:(id)a3
{
  NSObject *v5;
  _QWORD v6[6];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = CellularPlanLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[CTCellularPlanManagerDelegate localPlanInfoDidUpdate:]";
    v9 = 2112;
    v10 = a3;
    _os_log_impl(&dword_1D33B0000, v5, OS_LOG_TYPE_INFO, "%s: %@", buf, 0x16u);
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__CTCellularPlanManagerDelegate_localPlanInfoDidUpdate___block_invoke;
  v6[3] = &unk_1E95219D8;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async(MEMORY[0x1E0C80D38], v6);
}

uint64_t __56__CTCellularPlanManagerDelegate_localPlanInfoDidUpdate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v5 = CFSTR("CTCellularPlanLocalInfoError");
    v6[0] = v2;
    v3 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("CTCellularPlanInfoDidChangeNotification"), *(_QWORD *)(a1 + 40), 0);
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("CTCellularPlanLocalInfoDidChangeNotification"), *(_QWORD *)(a1 + 40), v3);
}

- (void)pendingTransferPlanInfoDidUpdate
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CTCellularPlanManagerDelegate pendingTransferPlanInfoDidUpdate]";
    _os_log_impl(&dword_1D33B0000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CTCellularPlanManagerDelegate_pendingTransferPlanInfoDidUpdate__block_invoke;
  block[3] = &unk_1E95219B0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __65__CTCellularPlanManagerDelegate_pendingTransferPlanInfoDidUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("CTCellularPlanPendingTransferDidChangeNotification"), *(_QWORD *)(a1 + 32), 0);
}

- (void)carrierInfoDidUpdate
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CTCellularPlanManagerDelegate carrierInfoDidUpdate]";
    _os_log_impl(&dword_1D33B0000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CTCellularPlanManagerDelegate_carrierInfoDidUpdate__block_invoke;
  block[3] = &unk_1E95219B0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __53__CTCellularPlanManagerDelegate_carrierInfoDidUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("CTCarrierInfoDidChangeNotification"), *(_QWORD *)(a1 + 32), 0);
}

- (void)remoteProvisioningDidBecomeAvailable
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CTCellularPlanManagerDelegate remoteProvisioningDidBecomeAvailable]";
    _os_log_impl(&dword_1D33B0000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__CTCellularPlanManagerDelegate_remoteProvisioningDidBecomeAvailable__block_invoke;
  block[3] = &unk_1E95219B0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __69__CTCellularPlanManagerDelegate_remoteProvisioningDidBecomeAvailable__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("CTCellularPlanRemoteProvisioningDidBecomeAvailable"), *(_QWORD *)(a1 + 32), 0);
}

@end
