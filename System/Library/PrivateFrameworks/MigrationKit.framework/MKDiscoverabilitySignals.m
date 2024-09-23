@implementation MKDiscoverabilitySignals

- (MKDiscoverabilitySignals)init
{
  MKDiscoverabilitySignals *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKDiscoverabilitySignals;
  v2 = -[MKDiscoverabilitySignals init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[MKDiscoverabilitySignals setSignals:](v2, "setSignals:", v3);

  }
  return v2;
}

- (void)addSignalsForClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCEA0];
  objc_msgSend(v4, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeWithLocaleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKDiscoverabilitySignals signals](self, "signals");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "languageCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v9, CFSTR("device_language"));

  -[MKDiscoverabilitySignals signals](self, "signals");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "regionCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v11, CFSTR("device_region"));

  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v4, "inputMethodLanguages", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(MEMORY[0x24BDBCEA0], "canonicalLanguageIdentifierFromString:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v17));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

  -[MKDiscoverabilitySignals signals](self, "signals");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setValue:forKey:", v12, CFSTR("input_method_languages"));

}

- (void)addSignalsForMigrator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  switch(objc_msgSend(v4, "type"))
  {
    case 5:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "importCount") != 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKDiscoverabilitySignals signals](self, "signals");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = CFSTR("contacts_imported");
      goto LABEL_6;
    case 10:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "importCount") != 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKDiscoverabilitySignals signals](self, "signals");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = CFSTR("messages_imported");
LABEL_6:
      objc_msgSend(v10, "setValue:forKey:", v9, v12);

      break;
    case 11:
    case 12:
      -[MKDiscoverabilitySignals signals](self, "signals");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", CFSTR("photo_library_imported"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = (void *)MEMORY[0x24BDD16E0];
      v8 = (objc_msgSend(v6, "BOOLValue") & 1) != 0 || objc_msgSend(v4, "importCount") != 0;
      objc_msgSend(v7, "numberWithInt:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[MKDiscoverabilitySignals signals](self, "signals");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setValue:forKey:", v17, CFSTR("photo_library_imported"));

      break;
    case 16:
      v13 = objc_msgSend(v4, "aggregatedActivatedCellularPlansCount");
      -[MKDiscoverabilitySignals signals](self, "signals");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setValue:forKey:", v15, CFSTR("cellular_plans"));

      +[MKLog log](MKLog, "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v19 = 134217984;
        v20 = v13;
        _os_log_impl(&dword_21EC08000, v16, OS_LOG_TYPE_INFO, "did set a signal. aggregated_activated_sims_count=%ld", (uint8_t *)&v19, 0xCu);
      }

      break;
    default:
      break;
  }

}

- (void)donateSignals
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21EC08000, a2, OS_LOG_TYPE_ERROR, "%@ could not serialise signals", (uint8_t *)&v2, 0xCu);
}

- (NSMutableDictionary)signals
{
  return self->_signals;
}

- (void)setSignals:(id)a3
{
  objc_storeStrong((id *)&self->_signals, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signals, 0);
}

@end
