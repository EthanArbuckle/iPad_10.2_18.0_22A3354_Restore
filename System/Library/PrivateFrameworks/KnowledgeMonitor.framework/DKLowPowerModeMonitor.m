@implementation DKLowPowerModeMonitor

void __44___DKLowPowerModeMonitor_updateLowPowerMode__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLowPowerModeEnabled");

  objc_msgSend(*(id *)(a1 + 32), "lowPowerModeStatus");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = (void *)v4,
        objc_msgSend(*(id *)(a1 + 32), "lowPowerModeStatus"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "BOOLValue"),
        v6,
        v5,
        (_DWORD)v3 != v7))
  {
    +[_DKLowPowerModeMonitor _eventWithLowPowerModeState:](_DKLowPowerModeMonitor, "_eventWithLowPowerModeState:", v3);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setCurrentEvent:inferHistoricalState:", v11, 1);
    +[_DKLowPowerModeMonitor setLowPowerMode:](_DKLowPowerModeMonitor, "setLowPowerMode:", v3);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLowPowerModeStatus:", v8);

    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
    objc_msgSend((id)objc_opt_class(), "_BMEventWithLowPowerModeState:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendEvent:", v10);

  }
}

@end
