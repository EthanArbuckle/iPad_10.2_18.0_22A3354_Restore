@implementation NSDateFormatter(FULocaleAndTimeZoneObserving)

- (void)fu_observeTimeZoneAndLocaleChanges
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  objc_initWeak(&location, val);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __83__NSDateFormatter_FULocaleAndTimeZoneObserving__fu_observeTimeZoneAndLocaleChanges__block_invoke;
  v11[3] = &unk_24CF30F40;
  objc_copyWeak(&v12, &location);
  v4 = (id)objc_msgSend(v1, "addObserverForName:object:queue:usingBlock:", CFSTR("FitnessUnitPreferencesDidChangeNotification"), 0, v2, v11);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDBCBC0];
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __83__NSDateFormatter_FULocaleAndTimeZoneObserving__fu_observeTimeZoneAndLocaleChanges__block_invoke_2;
  v9[3] = &unk_24CF30F40;
  objc_copyWeak(&v10, &location);
  v8 = (id)objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v7, 0, v6, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

@end
