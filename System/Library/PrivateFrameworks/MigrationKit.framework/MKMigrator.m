@implementation MKMigrator

+ (void)initialize
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[13];
  _QWORD v7[14];

  v7[13] = *MEMORY[0x24BDAC8D0];
  objc_opt_self();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    v6[0] = &unk_24E36B5B0;
    v6[1] = &unk_24E36B5E0;
    v7[0] = &unk_24E36B5C8;
    v7[1] = &unk_24E36B5B0;
    v6[2] = &unk_24E36B5F8;
    v6[3] = &unk_24E36B610;
    v7[2] = &unk_24E36B5E0;
    v7[3] = &unk_24E36B5F8;
    v6[4] = &unk_24E36B628;
    v6[5] = &unk_24E36B640;
    v7[4] = &unk_24E36B610;
    v7[5] = &unk_24E36B628;
    v6[6] = &unk_24E36B658;
    v6[7] = &unk_24E36B688;
    v7[6] = &unk_24E36B670;
    v7[7] = &unk_24E36B640;
    v6[8] = &unk_24E36B6A0;
    v6[9] = &unk_24E36B5C8;
    v7[8] = &unk_24E36B6B8;
    v7[9] = &unk_24E36B6D0;
    v6[10] = &unk_24E36B6B8;
    v6[11] = &unk_24E36B700;
    v7[10] = &unk_24E36B6E8;
    v7[11] = &unk_24E36B700;
    v6[12] = &unk_24E36B718;
    v7[12] = &unk_24E36B730;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 13);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)importContentTypes;
    importContentTypes = v4;

  }
}

- (MKMigrator)init
{
  MKMigrator *v2;
  NSMutableSet *v3;
  NSMutableSet *importErrors;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKMigrator;
  v2 = -[MKMigrator init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    importErrors = v2->_importErrors;
    v2->_importErrors = v3;

  }
  return v2;
}

- (void)setType:(int64_t)a3
{
  void *v4;
  void *v5;
  MKImportAnalytics *v6;
  MKImportAnalytics *analytics;
  id v8;

  self->_type = a3;
  v4 = (void *)importContentTypes;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v6 = -[MKImportAnalytics initWithContentType:]([MKImportAnalytics alloc], "initWithContentType:", objc_msgSend(v8, "integerValue"));
    analytics = self->_analytics;
    self->_analytics = v6;

  }
}

- (void)import
{
  id WeakRetained;

  -[MKMigrator sendAnalytics](self, "sendAnalytics");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "migratorDidComplete:", self);

}

- (void)migratorDidImport
{
  ++self->_importCount;
}

- (void)migratorDidImportWithCount:(unint64_t)a3
{
  self->_importCount += a3;
}

- (void)migratorDidFailWithImportError:(id)a3
{
  ++self->_importErrorCount;
  -[MKMigrator addError:](self, "addError:", a3);
}

- (void)migratorDidFailWithImportError:(id)a3 count:(unint64_t)a4
{
  self->_importErrorCount += a4;
  -[MKMigrator addError:](self, "addError:", a3);
}

- (void)migratorDidAppendDataSize:(unint64_t)a3
{
  self->_size += a3;
}

- (void)migratorDidResetImport
{
  self->_importCount = 0;
  self->_importErrorCount = 0;
  self->_size = 0;
  -[NSMutableSet removeAllObjects](self->_importErrors, "removeAllObjects");
}

- (void)migratorWillMeasureImport
{
  MKTime *v3;
  MKTime *importTime;

  v3 = objc_alloc_init(MKTime);
  importTime = self->_importTime;
  self->_importTime = v3;

}

- (void)migratorDidMeasureImport
{
  double v3;
  MKTime *importTime;

  -[MKTime elapsedTimeInSeconds](self->_importTime, "elapsedTimeInSeconds");
  self->_totalImportTime = v3 + self->_totalImportTime;
  importTime = self->_importTime;
  self->_importTime = 0;

}

- (BOOL)importAndWait
{
  return 1;
}

- (unint64_t)importCount
{
  return self->_importCount;
}

- (unint64_t)importErrorCount
{
  return self->_importErrorCount;
}

- (unint64_t)size
{
  return self->_size;
}

- (double)importTime
{
  return self->_totalImportTime;
}

- (void)addError:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    v5 = a3;
    objc_msgSend(v5, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "code");

    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%ld"), v6, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[NSMutableSet addObject:](self->_importErrors, "addObject:", v8);
  }
}

- (void)sendAnalytics
{
  uint64_t v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_importCount || -[NSMutableSet count](self->_importErrors, "count"))
  {
    v3 = -[NSMutableSet count](self->_importErrors, "count");
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_importErrors;
    v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          -[MKImportAnalytics send:](self->_analytics, "send:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

    -[MKImportAnalytics complete:](self->_analytics, "complete:", v3 == 0);
  }
}

- (MKMigratorDelegate)delegate
{
  return (MKMigratorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_importTime, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_importErrors, 0);
}

@end
