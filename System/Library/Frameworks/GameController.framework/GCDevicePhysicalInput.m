@implementation GCDevicePhysicalInput

uint64_t __45___GCDevicePhysicalInput_updateWithElements___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "update:forUsages:with:", a2, 2, *(_QWORD *)(a1 + 40));
}

double __60___GCDevicePhysicalInput_EventHandling__handleGamepadEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[7];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)-[_GCDevicePhysicalInputBase elements](a2);
  v5 = NSTimeIntervalFromMachAbsoluteTime(objc_msgSend(*(id *)(a1 + 32), "timestamp"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v17;
    v10 = MEMORY[0x24BDAC760];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v4);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
        v15[0] = v10;
        v15[1] = 3221225472;
        v15[2] = __60___GCDevicePhysicalInput_EventHandling__handleGamepadEvent___block_invoke_2;
        v15[3] = &unk_24D2B5680;
        v13 = *(_QWORD *)(a1 + 32);
        v15[4] = v12;
        v15[5] = v13;
        *(double *)&v15[6] = v5;
        -[_GCDevicePhysicalInputTransaction mutableUpdateContextForElementAtIndex:withHandler:](a2, v8 + v11++, (uint64_t)v15);
      }
      while (v7 != v11);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v8 += v11;
    }
    while (v7);
  }
  return v5;
}

uint64_t __60___GCDevicePhysicalInput_EventHandling__handleGamepadEvent___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6;
  NSObject *GCLogger;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend(*(id *)(a1 + 32), "update:forGamepadEvent:withTimestamp:", a2, *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
  if ((_DWORD)v6)
  {
    if (gc_isInternalBuild())
    {
      GCLogger = getGCLogger();
      if (os_log_type_enabled(GCLogger, OS_LOG_TYPE_DEBUG))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v10 = 138412802;
        v11 = v9;
        v12 = 1040;
        v13 = a3;
        v14 = 2098;
        v15 = a2;
        _os_log_debug_impl(&dword_215181000, GCLogger, OS_LOG_TYPE_DEBUG, "[%@ handleGamepadEvent:] -> %{public}.*P", (uint8_t *)&v10, 0x1Cu);
      }
    }
  }
  return v6;
}

double __58___GCDevicePhysicalInput_EventHandling__handleMouseEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  __int128 *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id obj;
  _QWORD v17[5];
  __int128 v18;
  uint64_t v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)-[_GCDevicePhysicalInputBase elements](a2);
  v6 = *(_QWORD *)(a1 + 32);
  v5 = (__int128 *)(a1 + 32);
  v7 = NSTimeIntervalFromMachAbsoluteTime(v6);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v4;
  v8 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v22;
    v12 = MEMORY[0x24BDAC760];
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v13);
        v17[0] = v12;
        v17[1] = 3221225472;
        v17[2] = __58___GCDevicePhysicalInput_EventHandling__handleMouseEvent___block_invoke_2;
        v17[3] = &unk_24D2B56D0;
        v17[4] = v14;
        v18 = *v5;
        v19 = *((_QWORD *)v5 + 2);
        v20 = v7;
        -[_GCDevicePhysicalInputTransaction mutableUpdateContextForElementAtIndex:withHandler:](a2, v10 + v13++, (uint64_t)v17);
      }
      while (v9 != v13);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v10 += v13;
    }
    while (v9);
  }
  return v7;
}

uint64_t __58___GCDevicePhysicalInput_EventHandling__handleMouseEvent___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  void *v6;
  double v7;
  uint64_t v8;
  NSObject *GCLogger;
  uint64_t v11;
  _BYTE v12[28];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = *(void **)(a1 + 32);
  v7 = *(double *)(a1 + 64);
  *(_OWORD *)v12 = *(_OWORD *)(a1 + 40);
  *(_QWORD *)&v12[16] = *(_QWORD *)(a1 + 56);
  v8 = objc_msgSend(v6, "update:forMouseEvent:withTimestamp:", a2, v12, v7);
  if ((_DWORD)v8)
  {
    if (gc_isInternalBuild())
    {
      GCLogger = getGCLogger();
      if (os_log_type_enabled(GCLogger, OS_LOG_TYPE_DEBUG))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v12 = 138412802;
        *(_QWORD *)&v12[4] = v11;
        *(_WORD *)&v12[12] = 1040;
        *(_DWORD *)&v12[14] = a3;
        *(_WORD *)&v12[18] = 2098;
        *(_QWORD *)&v12[20] = a2;
        _os_log_debug_impl(&dword_215181000, GCLogger, OS_LOG_TYPE_DEBUG, "[%@ handleMouseEvent:] -> %{public}.*P", v12, 0x1Cu);
      }
    }
  }
  return v8;
}

@end
