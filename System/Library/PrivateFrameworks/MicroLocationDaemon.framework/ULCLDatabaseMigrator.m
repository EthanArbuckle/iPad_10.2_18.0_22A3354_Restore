@implementation ULCLDatabaseMigrator

- (ULCLDatabaseMigrator)initWithLocalDb:(ULDatabase *)a3
{
  ULCLDatabaseMigrator *v4;
  ULCLDatabaseMigrator *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ULCLDatabaseMigrator;
  v4 = -[ULCLDatabaseMigrator init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[ULCLDatabaseMigrator setLocalDb:](v4, "setLocalDb:", a3);
  return v5;
}

- (BOOL)migrateCLDatabaseFromPath:(id)a3
{
  ULMiloSqliteDatabase *v4;
  BOOL v5;
  unint64_t v6;
  uint64_t v7;
  CLSqliteDatabase *v9;

  -[ULCLDatabaseMigrator _connectToLocationdDatabase:](self, "_connectToLocationdDatabase:", a3);
  if (CLSqliteDatabase::isDatabaseValid(v9))
  {
    v4 = (ULMiloSqliteDatabase *)operator new();
    ULMiloSqliteDatabase::ULMiloSqliteDatabase(v4, v9);
    v5 = -[ULCLDatabaseMigrator _migrateData:](self, "_migrateData:", v4, v4);
    v7 = CLMacAddress::newFromUint64((CLMacAddress *)v4, v6);
    MEMORY[0x2426A04D4](v7, 0x20C4093837F09);
  }
  else
  {
    v5 = 0;
  }
  if (v9)
    (*(void (**)())(*(_QWORD *)v9 + 8))();
  return v5;
}

- (unique_ptr<CLSqliteDatabase,)_connectToLocationdDatabase:(id)a3
{
  CLSqliteDatabase **v3;
  CLSqliteDatabase **v4;
  id v5;
  id v6;
  CLSqliteDatabase *v7;
  NSObject *v8;
  _BOOL4 isDatabaseValid;
  NSObject *v10;
  id v11;
  uint64_t v12;
  unique_ptr<CLSqliteDatabase, std::default_delete<CLSqliteDatabase>> v13;
  uint64_t v14;
  uint64_t v15;
  std::string __p;
  std::string v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v4 = v3;
  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "path");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(&v17, (char *)objc_msgSend(v6, "UTF8String"));

  v14 = 0x100000002;
  LOWORD(v15) = 257;
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, v17.__r_.__value_.__l.__data_, v17.__r_.__value_.__l.__size_);
  else
    __p = v17;
  v7 = (CLSqliteDatabase *)operator new();
  CLSqliteDatabase::CLSqliteDatabase(v7, &v14);
  *v4 = v7;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_35);
  v8 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    isDatabaseValid = CLSqliteDatabase::isDatabaseValid(v7);
    *(_DWORD *)buf = 67109120;
    LODWORD(v19) = isDatabaseValid;
    _os_log_impl(&dword_2419D9000, v8, OS_LOG_TYPE_DEFAULT, "connection to locationd exported database. isValid: %d", buf, 8u);
  }

  if (!CLSqliteDatabase::isDatabaseValid(v7))
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_35);
    v10 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "path", v14, v15);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = objc_msgSend(v11, "UTF8String");
      *(_DWORD *)buf = 136380675;
      v19 = v12;
      _os_log_impl(&dword_2419D9000, v10, OS_LOG_TYPE_DEFAULT, "Failed to connect to imported database. path: %{private}s", buf, 0xCu);

    }
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__r_.__value_.__l.__data_);

  return v13;
}

- (BOOL)_migrateTableUsingPaging:(ULMiloSqliteDatabase *)a3 tableName:(const char *)a4 migrationLimit:(unsigned int)a5 pageSize:(unsigned int)a6 copyPageBlock:(id)a7
{
  uint64_t (**v12)(id, _QWORD, uint64_t *);
  int v13;
  unsigned int v14;
  _BOOL4 v15;
  int v16;
  unsigned int v17;
  uint64_t v18;
  unsigned int v19;
  signed int v20;
  int v21;
  char v23;
  BOOL v24;
  char v25;
  uint64_t v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  uint64_t v30;
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  _BYTE v36[10];
  __int16 v37;
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v12 = (uint64_t (**)(id, _QWORD, uint64_t *))a7;
  v13 = !-[ULCLDatabaseMigrator migrateAllData](self, "migrateAllData");
  if (a5)
    v13 = 0;
  if (!a6 || v13)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_35);
    v26 = logObject_MicroLocation_Default;
    v24 = 1;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_INFO))
    {
      v32 = 68289794;
      v33 = 2082;
      v34 = "";
      v35 = 1026;
      *(_DWORD *)v36 = a5;
      *(_WORD *)&v36[4] = 1026;
      *(_DWORD *)&v36[6] = a6;
      v37 = 2082;
      v38 = a4;
      v27 = "{\"msg%{public}.0s\":\"#dataMigrator, migrationLimit or pageSize is 0. skipping migration for table\", \"mig"
            "rationLimit\":%{public}u, \"pageSize\":%{public}u, \"tableName\":%{public, location:escape_only}s}";
      v28 = v26;
      v29 = 40;
LABEL_40:
      _os_log_impl(&dword_2419D9000, v28, OS_LOG_TYPE_INFO, v27, (uint8_t *)&v32, v29);
    }
  }
  else
  {
    if ((ULMiloSqliteDatabase::tableExists(a3, a4) & 1) != 0)
    {
      v14 = ULMiloSqliteDatabase::numEntries(a3, a4);
      if (v14
        && ((v15 = -[ULCLDatabaseMigrator migrateAllData](self, "migrateAllData"), v14 < a5) ? (v16 = 1) : (v16 = v15),
            !v16 ? (v17 = a5) : (v17 = v14),
            v17 >= a6 ? (LODWORD(v18) = a6) : (LODWORD(v18) = v17),
            (v19 = v17 % v18, v32 = 0, !(v17 % v18))
          ? (v20 = v17 / v18)
          : (v20 = v17 / v18 + 1),
            v20 >= 1))
      {
        v21 = 0;
        do
        {
          if (v20 - 1 != v21 || v19 == 0)
            v18 = v18;
          else
            v18 = v19;
          v23 = v12[2](v12, v18, &v32);
          v24 = v23;
          if (++v21 < v20)
            v25 = v23;
          else
            v25 = 0;
        }
        while ((v25 & 1) != 0);
      }
      else
      {
        v24 = 1;
      }
      goto LABEL_42;
    }
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_35);
    v30 = logObject_MicroLocation_Default;
    v24 = 1;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_INFO))
    {
      v32 = 68289282;
      v33 = 2082;
      v34 = "";
      v35 = 2082;
      *(_QWORD *)v36 = a4;
      v27 = "{\"msg%{public}.0s\":\"#dataMigrator, table is missing in imported db\", \"tableName\":%{public, location:escape_only}s}";
      v28 = v30;
      v29 = 28;
      goto LABEL_40;
    }
  }
LABEL_42:

  return v24;
}

- (BOOL)_migrateData:(ULMiloSqliteDatabase *)a3
{
  id v5;
  _DWORD *v6;
  ULRecordingEventTable *v7;
  uint64_t v8;
  uint64_t v9;
  ULMeasurementTable *v10;
  int v11;
  ULMeasurementTable *v12;
  ULLabelTable *v13;
  int v14;
  ULLabelTable *v15;
  ULServiceTable *v16;
  int v17;
  ULServiceTable *v18;
  ULLoiTable *v19;
  int v20;
  ULLoiTable *v21;
  ULRapportTable *v22;
  int v23;
  ULRapportTable *v24;
  ULAssociatedStateTable *v25;
  ULAssociatedStateTable *v26;
  ULBlueToothIdentityTable *v27;
  int v28;
  int v29;
  ULBlueToothIdentityTable *v30;
  ULConfigurationTable *v31;
  int v32;
  ULConfigurationTable *v33;
  ULModelTable *v34;
  ULModelTable *v35;
  ULCustomLoiTable *v36;
  ULCustomLoiTable *v37;
  ULLoggedEventTable *v38;
  unsigned int v39;
  ULLoggedEventTable *v40;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  _QWORD v47[6];
  _QWORD v48[6];
  _QWORD v49[6];
  _QWORD v50[6];
  _QWORD v51[6];
  _QWORD v52[6];
  _QWORD v53[6];
  _QWORD v54[6];
  _QWORD v55[6];
  _QWORD v56[6];
  _QWORD v57[6];
  _QWORD v58[6];
  CFAbsoluteTime v59;
  void *v60;
  void *v61;
  char *v62;
  uint64_t v63;
  int v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  if (!-[ULCLDatabaseMigrator migrateAllData](self, "migrateAllData"))
  {
    v5 = (id)-[ULCLDatabaseMigrator localDb](self, "localDb")[112];
    v59 = cl::chrono::CFAbsoluteTimeClock::now();
    CLMicroLocationMigrationTable::Entry::Entry((uint64_t)&v63, 1, &v59);
    v6 = operator new(0x10uLL);
    v61 = v6 + 4;
    v62 = (char *)(v6 + 4);
    *(_QWORD *)v6 = v63;
    v6[2] = v64;
    v60 = v6;
    objc_msgSend(v5, "insertEntries:", &v60);
    if (v60)
    {
      v61 = v60;
      operator delete(v60);
    }

  }
  -[ULCLDatabaseMigrator _logStatsForExportedDatabase:](self, "_logStatsForExportedDatabase:", a3);
  v7 = (ULRecordingEventTable *)ULRecordingEventTable::migrationLimit((ULRecordingEventTable *)-[ULCLDatabaseMigrator _logStatsForLocalDatabase](self, "_logStatsForLocalDatabase"));
  v8 = ULRecordingEventTable::pageSize(v7);
  v9 = MEMORY[0x24BDAC760];
  v58[0] = MEMORY[0x24BDAC760];
  v58[1] = 3221225472;
  v58[2] = __37__ULCLDatabaseMigrator__migrateData___block_invoke;
  v58[3] = &unk_2511D4730;
  v58[4] = self;
  v58[5] = a3;
  v10 = (ULMeasurementTable *)-[ULCLDatabaseMigrator _migrateTableUsingPaging:tableName:migrationLimit:pageSize:copyPageBlock:](self, "_migrateTableUsingPaging:tableName:migrationLimit:pageSize:copyPageBlock:", a3, "MicroLocationRecordingEvents", v7, v8, v58);
  v11 = (int)v10;
  v12 = (ULMeasurementTable *)ULMeasurementTable::migrationLimit(v10);
  v57[0] = v9;
  v57[1] = 3221225472;
  v57[2] = __37__ULCLDatabaseMigrator__migrateData___block_invoke_2;
  v57[3] = &unk_2511D4730;
  v57[4] = self;
  v57[5] = a3;
  v13 = (ULLabelTable *)-[ULCLDatabaseMigrator _migrateTableUsingPaging:tableName:migrationLimit:pageSize:copyPageBlock:](self, "_migrateTableUsingPaging:tableName:migrationLimit:pageSize:copyPageBlock:", a3, "MicroLocationMeasurements", v12, ULMeasurementTable::pageSize(v12), v57);
  v14 = (int)v13;
  v15 = (ULLabelTable *)ULLabelTable::migrationLimit(v13);
  v56[0] = v9;
  v56[1] = 3221225472;
  v56[2] = __37__ULCLDatabaseMigrator__migrateData___block_invoke_3;
  v56[3] = &unk_2511D4730;
  v56[4] = self;
  v56[5] = a3;
  v16 = (ULServiceTable *)-[ULCLDatabaseMigrator _migrateTableUsingPaging:tableName:migrationLimit:pageSize:copyPageBlock:](self, "_migrateTableUsingPaging:tableName:migrationLimit:pageSize:copyPageBlock:", a3, "MicroLocationLabels", v15, ULLabelTable::pageSize(v15), v56);
  v17 = (int)v16;
  v18 = (ULServiceTable *)ULServiceTable::migrationLimit(v16);
  v55[0] = v9;
  v55[1] = 3221225472;
  v55[2] = __37__ULCLDatabaseMigrator__migrateData___block_invoke_4;
  v55[3] = &unk_2511D4730;
  v55[4] = self;
  v55[5] = a3;
  v19 = (ULLoiTable *)-[ULCLDatabaseMigrator _migrateTableUsingPaging:tableName:migrationLimit:pageSize:copyPageBlock:](self, "_migrateTableUsingPaging:tableName:migrationLimit:pageSize:copyPageBlock:", a3, "MiLoServices", v18, ULServiceTable::pageSize(v18), v55);
  v20 = (int)v19;
  v21 = (ULLoiTable *)ULLoiTable::migrationLimit(v19);
  v54[0] = v9;
  v54[1] = 3221225472;
  v54[2] = __37__ULCLDatabaseMigrator__migrateData___block_invoke_5;
  v54[3] = &unk_2511D4730;
  v54[4] = self;
  v54[5] = a3;
  v22 = (ULRapportTable *)-[ULCLDatabaseMigrator _migrateTableUsingPaging:tableName:migrationLimit:pageSize:copyPageBlock:](self, "_migrateTableUsingPaging:tableName:migrationLimit:pageSize:copyPageBlock:", a3, "MiLoLoiTable", v21, ULLoiTable::pageSize(v21), v54);
  v23 = (int)v22;
  v24 = (ULRapportTable *)ULRapportTable::migrationLimit(v22);
  v53[0] = v9;
  v53[1] = 3221225472;
  v53[2] = __37__ULCLDatabaseMigrator__migrateData___block_invoke_6;
  v53[3] = &unk_2511D4730;
  v53[4] = self;
  v53[5] = a3;
  v25 = (ULAssociatedStateTable *)-[ULCLDatabaseMigrator _migrateTableUsingPaging:tableName:migrationLimit:pageSize:copyPageBlock:](self, "_migrateTableUsingPaging:tableName:migrationLimit:pageSize:copyPageBlock:", a3, "MicroLocationRapport", v24, ULRapportTable::pageSize(v24), v53);
  v46 = (int)v25;
  v26 = (ULAssociatedStateTable *)ULAssociatedStateTable::migrationLimit(v25);
  v52[0] = v9;
  v52[1] = 3221225472;
  v52[2] = __37__ULCLDatabaseMigrator__migrateData___block_invoke_7;
  v52[3] = &unk_2511D4730;
  v52[4] = self;
  v52[5] = a3;
  v27 = (ULBlueToothIdentityTable *)-[ULCLDatabaseMigrator _migrateTableUsingPaging:tableName:migrationLimit:pageSize:copyPageBlock:](self, "_migrateTableUsingPaging:tableName:migrationLimit:pageSize:copyPageBlock:", a3, "MicroLocationAssociatedState", v26, ULAssociatedStateTable::pageSize(v26), v52);
  v45 = (int)v27;
  v42 = v23;
  v43 = v20;
  v44 = v17;
  v28 = v14;
  v29 = v11;
  v30 = (ULBlueToothIdentityTable *)ULBlueToothIdentityTable::migrationLimit(v27);
  v51[0] = v9;
  v51[1] = 3221225472;
  v51[2] = __37__ULCLDatabaseMigrator__migrateData___block_invoke_8;
  v51[3] = &unk_2511D4730;
  v51[4] = self;
  v51[5] = a3;
  v31 = (ULConfigurationTable *)-[ULCLDatabaseMigrator _migrateTableUsingPaging:tableName:migrationLimit:pageSize:copyPageBlock:](self, "_migrateTableUsingPaging:tableName:migrationLimit:pageSize:copyPageBlock:", a3, "MicroLocationBluetoothIdentityTable", v30, ULBlueToothIdentityTable::pageSize(v30), v51);
  v32 = (int)v31;
  v33 = (ULConfigurationTable *)ULConfigurationTable::migrationLimit(v31);
  v50[0] = v9;
  v50[1] = 3221225472;
  v50[2] = __37__ULCLDatabaseMigrator__migrateData___block_invoke_9;
  v50[3] = &unk_2511D4730;
  v50[4] = self;
  v50[5] = a3;
  v34 = (ULModelTable *)-[ULCLDatabaseMigrator _migrateTableUsingPaging:tableName:migrationLimit:pageSize:copyPageBlock:](self, "_migrateTableUsingPaging:tableName:migrationLimit:pageSize:copyPageBlock:", a3, "MicroLocationConfiguration", v33, ULConfigurationTable::pageSize(v33), v50);
  LODWORD(v33) = (_DWORD)v34;
  v35 = (ULModelTable *)ULModelTable::migrationLimit(v34);
  v49[0] = v9;
  v49[1] = 3221225472;
  v49[2] = __37__ULCLDatabaseMigrator__migrateData___block_invoke_10;
  v49[3] = &unk_2511D4730;
  v49[4] = self;
  v49[5] = a3;
  v36 = (ULCustomLoiTable *)-[ULCLDatabaseMigrator _migrateTableUsingPaging:tableName:migrationLimit:pageSize:copyPageBlock:](self, "_migrateTableUsingPaging:tableName:migrationLimit:pageSize:copyPageBlock:", a3, "MicroLocationModels", v35, ULModelTable::pageSize(v35), v49);
  LODWORD(v35) = (_DWORD)v36;
  v37 = (ULCustomLoiTable *)ULCustomLoiTable::migrationLimit(v36);
  v48[0] = v9;
  v48[1] = 3221225472;
  v48[2] = __37__ULCLDatabaseMigrator__migrateData___block_invoke_11;
  v48[3] = &unk_2511D4730;
  v48[4] = self;
  v48[5] = a3;
  LODWORD(v37) = -[ULCLDatabaseMigrator _migrateTableUsingPaging:tableName:migrationLimit:pageSize:copyPageBlock:](self, "_migrateTableUsingPaging:tableName:migrationLimit:pageSize:copyPageBlock:", a3, "MiLoCustomLoiTable", v37, ULCustomLoiTable::pageSize(v37), v48);
  v38 = (ULLoggedEventTable *)-[ULCLDatabaseMigrator migrateAllData](self, "migrateAllData");
  v39 = v29 & v28 & v44 & v43 & v42 & v46 & v45 & v32 & v33 & v35 & v37;
  if ((_DWORD)v38)
  {
    v40 = (ULLoggedEventTable *)ULLoggedEventTable::migrationLimit(v38);
    v47[0] = v9;
    v47[1] = 3221225472;
    v47[2] = __37__ULCLDatabaseMigrator__migrateData___block_invoke_12;
    v47[3] = &unk_2511D4730;
    v47[4] = self;
    v47[5] = a3;
    v39 &= -[ULCLDatabaseMigrator _migrateTableUsingPaging:tableName:migrationLimit:pageSize:copyPageBlock:](self, "_migrateTableUsingPaging:tableName:migrationLimit:pageSize:copyPageBlock:", a3, "MicroLocationLoggedEvents", v40, ULLoggedEventTable::pageSize(v40), v47);
  }
  -[ULCLDatabaseMigrator _logStatsForLocalDatabase](self, "_logStatsForLocalDatabase");
  return v39;
}

uint64_t __37__ULCLDatabaseMigrator__migrateData___block_invoke(uint64_t a1, unsigned int a2, double *a3)
{
  uint64_t v4;
  std::string v6;
  std::string *v7;

  ULMiloSqliteDatabase::selectRecordingEventEntries(*(ULMiloSqliteDatabase **)(a1 + 40), a3, a2, &v6);
  if (v6.__r_.__value_.__r.__words[0] == v6.__r_.__value_.__l.__size_)
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(objc_msgSend(*(id *)(a1 + 32), "localDb") + 88), "insertEntries:", &v6);
  v7 = &v6;
  std::vector<CLMicroLocationRecordingEventsTable::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  return v4;
}

uint64_t __37__ULCLDatabaseMigrator__migrateData___block_invoke_2(uint64_t a1, unsigned int a2, double *a3)
{
  uint64_t v4;
  std::string v6;
  std::string *v7;

  ULMiloSqliteDatabase::selectMeasurementEntries(*(ULMiloSqliteDatabase **)(a1 + 40), a3, a2, &v6);
  if (v6.__r_.__value_.__r.__words[0] == v6.__r_.__value_.__l.__size_)
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(objc_msgSend(*(id *)(a1 + 32), "localDb") + 64), "insertEntries:", &v6);
  v7 = &v6;
  std::vector<CLMicroLocationMeasurementTable::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  return v4;
}

uint64_t __37__ULCLDatabaseMigrator__migrateData___block_invoke_3(uint64_t a1, unsigned int a2, double *a3)
{
  uint64_t v4;
  std::string v6;
  std::string *v7;

  ULMiloSqliteDatabase::selectLabelEntries(*(ULMiloSqliteDatabase **)(a1 + 40), a3, a2, &v6);
  if (v6.__r_.__value_.__r.__words[0] == v6.__r_.__value_.__l.__size_)
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(objc_msgSend(*(id *)(a1 + 32), "localDb") + 40), "insertEntries:", &v6);
  v7 = &v6;
  std::vector<CLMicroLocationRecordingLabelsTable::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  return v4;
}

uint64_t __37__ULCLDatabaseMigrator__migrateData___block_invoke_4(uint64_t a1, unsigned int a2, double *a3)
{
  uint64_t v4;
  std::string v6;
  std::string *v7;

  ULMiloSqliteDatabase::selectServiceEntries(*(ULMiloSqliteDatabase **)(a1 + 40), a3, a2, &v6);
  if (v6.__r_.__value_.__r.__words[0] == v6.__r_.__value_.__l.__size_)
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(objc_msgSend(*(id *)(a1 + 32), "localDb") + 96), "insertEntries:", &v6);
  v7 = &v6;
  std::vector<CLMiLoServiceTable::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  return v4;
}

uint64_t __37__ULCLDatabaseMigrator__migrateData___block_invoke_5(uint64_t a1, unsigned int a2, double *a3)
{
  uint64_t v4;
  std::string v6;
  std::string *v7;

  ULMiloSqliteDatabase::selectLoiEntries(*(ULMiloSqliteDatabase **)(a1 + 40), a3, a2, &v6);
  if (v6.__r_.__value_.__r.__words[0] == v6.__r_.__value_.__l.__size_)
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(objc_msgSend(*(id *)(a1 + 32), "localDb") + 56), "insertEntries:", &v6);
  v7 = &v6;
  std::vector<CLMiLoLoiTable::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  return v4;
}

uint64_t __37__ULCLDatabaseMigrator__migrateData___block_invoke_6(uint64_t a1, unsigned int a2, double *a3)
{
  uint64_t v4;
  std::string v6;
  std::string *v7;

  ULMiloSqliteDatabase::selectRapportEntries(*(ULMiloSqliteDatabase **)(a1 + 40), a3, a2, &v6);
  if (v6.__r_.__value_.__r.__words[0] == v6.__r_.__value_.__l.__size_)
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(objc_msgSend(*(id *)(a1 + 32), "localDb") + 80), "insertEntries:", &v6);
  v7 = &v6;
  std::vector<CLMicroLocationRapportTable::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  return v4;
}

uint64_t __37__ULCLDatabaseMigrator__migrateData___block_invoke_7(uint64_t a1, unsigned int a2, double *a3)
{
  uint64_t v4;
  std::string v6;
  std::string *v7;

  ULMiloSqliteDatabase::selectAssociatedStateEntries(*(ULMiloSqliteDatabase **)(a1 + 40), a3, a2, &v6);
  if (v6.__r_.__value_.__r.__words[0] == v6.__r_.__value_.__l.__size_)
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(objc_msgSend(*(id *)(a1 + 32), "localDb") + 16), "insertEntries:", &v6);
  v7 = &v6;
  std::vector<CLMicroLocationAssociatedStateTable::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  return v4;
}

uint64_t __37__ULCLDatabaseMigrator__migrateData___block_invoke_8(uint64_t a1, unsigned int a2, double *a3)
{
  uint64_t v4;
  std::string v6;
  std::string *v7;

  ULMiloSqliteDatabase::selectBluetoothIdentityEntries(*(ULMiloSqliteDatabase **)(a1 + 40), a3, a2, &v6);
  if (v6.__r_.__value_.__r.__words[0] == v6.__r_.__value_.__l.__size_)
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(objc_msgSend(*(id *)(a1 + 32), "localDb") + 24), "insertEntries:", &v6);
  v7 = &v6;
  std::vector<CLMicroLocationBluetoothIdentityTable::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  return v4;
}

uint64_t __37__ULCLDatabaseMigrator__migrateData___block_invoke_9(uint64_t a1, unsigned int a2, double *a3)
{
  uint64_t v4;
  std::string v6;
  std::string *v7;

  ULMiloSqliteDatabase::selectConfigurationEntries(*(ULMiloSqliteDatabase **)(a1 + 40), a3, a2, &v6);
  if (v6.__r_.__value_.__r.__words[0] == v6.__r_.__value_.__l.__size_)
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(objc_msgSend(*(id *)(a1 + 32), "localDb") + 32), "insertEntries:", &v6);
  v7 = &v6;
  std::vector<CLMicroLocationConfigurationTable::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  return v4;
}

uint64_t __37__ULCLDatabaseMigrator__migrateData___block_invoke_10(uint64_t a1, unsigned int a2, double *a3)
{
  uint64_t v4;
  std::string v6;
  std::string *v7;

  ULMiloSqliteDatabase::selectModelEntries(*(ULMiloSqliteDatabase **)(a1 + 40), a3, a2, &v6);
  if (v6.__r_.__value_.__r.__words[0] == v6.__r_.__value_.__l.__size_)
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(objc_msgSend(*(id *)(a1 + 32), "localDb") + 72), "insertEntries:", &v6);
  v7 = &v6;
  std::vector<CLMicroLocationModelTable::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  return v4;
}

uint64_t __37__ULCLDatabaseMigrator__migrateData___block_invoke_11(uint64_t a1, unsigned int a2, double *a3)
{
  void *v4;
  uint64_t v5;
  std::string __p;

  ULMiloSqliteDatabase::selectCustomLoiEntries(*(ULMiloSqliteDatabase **)(a1 + 40), a3, a2, &__p);
  v4 = (void *)__p.__r_.__value_.__r.__words[0];
  if (__p.__r_.__value_.__r.__words[0] == __p.__r_.__value_.__l.__size_)
  {
    v5 = 0;
    if (!__p.__r_.__value_.__r.__words[0])
      return v5;
    goto LABEL_3;
  }
  v5 = objc_msgSend(*(id *)(objc_msgSend(*(id *)(a1 + 32), "localDb") + 104), "insertEntries:", &__p);
  v4 = (void *)__p.__r_.__value_.__r.__words[0];
  if (__p.__r_.__value_.__r.__words[0])
  {
LABEL_3:
    __p.__r_.__value_.__l.__size_ = (std::string::size_type)v4;
    operator delete(v4);
  }
  return v5;
}

uint64_t __37__ULCLDatabaseMigrator__migrateData___block_invoke_12(uint64_t a1, unsigned int a2, double *a3)
{
  uint64_t v4;
  std::string v6;
  std::string *v7;

  ULMiloSqliteDatabase::selectLoggedEventEntries(*(ULMiloSqliteDatabase **)(a1 + 40), a3, a2, &v6);
  if (v6.__r_.__value_.__r.__words[0] == v6.__r_.__value_.__l.__size_)
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(objc_msgSend(*(id *)(a1 + 32), "localDb") + 48), "insertEntries:", &v6);
  v7 = &v6;
  std::vector<CLMicroLocationLoggedEventsTable::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  return v4;
}

- (void)_logStatsForExportedDatabase:(ULMiloSqliteDatabase *)a3
{
  NSObject *v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_35);
  v4 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68292099;
    v6 = 0;
    v7 = 2082;
    v8 = "";
    v9 = 1025;
    v10 = ULMiloSqliteDatabase::numEntries(a3, "MicroLocationRecordingEvents");
    v11 = 1025;
    v12 = ULMiloSqliteDatabase::numEntries(a3, "MicroLocationMeasurements");
    v13 = 1025;
    v14 = ULMiloSqliteDatabase::numEntries(a3, "MicroLocationLabels");
    v15 = 1025;
    v16 = ULMiloSqliteDatabase::numEntries(a3, "MiLoServices");
    v17 = 1025;
    v18 = ULMiloSqliteDatabase::numEntries(a3, "MiLoLoiTable");
    v19 = 1025;
    v20 = ULMiloSqliteDatabase::numEntries(a3, "MicroLocationRapport");
    v21 = 1025;
    v22 = ULMiloSqliteDatabase::numEntries(a3, "MicroLocationAssociatedState");
    v23 = 1025;
    v24 = ULMiloSqliteDatabase::numEntries(a3, "MicroLocationBluetoothIdentityTable");
    v25 = 1025;
    v26 = ULMiloSqliteDatabase::numEntries(a3, "MicroLocationConfiguration");
    v27 = 1025;
    v28 = ULMiloSqliteDatabase::numEntries(a3, "MicroLocationModels");
    v29 = 1025;
    v30 = ULMiloSqliteDatabase::numEntries(a3, "MiLoCustomLoiTable");
    v31 = 1025;
    v32 = ULMiloSqliteDatabase::numEntries(a3, "MicroLocationLoggedEvents");
    _os_log_impl(&dword_2419D9000, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Exported database stats\", \"RecordingEvent\":%{private}u, \"Measurement\":%{private}u, \"Label\":%{private}u, \"Service\":%{private}u, \"LOI\":%{private}u, \"Rapport\":%{private}u, \"AssociatedState\":%{private}u, \"BluetoothIdentity\":%{private}u, \"Configuration\":%{private}u, \"Model\":%{private}u, \"CustomLOI\":%{private}u, \"LoggedEvent\":%{private}u}", buf, 0x5Au);
  }

}

- (void)_logStatsForLocalDatabase
{
  NSObject *v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  id v15;
  int v16;
  id v17;
  int v18;
  id v19;
  int v20;
  int v21;
  int v22;
  int v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  NSObject *log;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;
  __int16 v50;
  int v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;
  __int16 v58;
  int v59;
  __int16 v60;
  int v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_35);
  v3 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    log = v3;
    v32 = (id)-[ULCLDatabaseMigrator localDb](self, "localDb")[88];
    v4 = objc_msgSend(v32, "count");
    v31 = (id)-[ULCLDatabaseMigrator localDb](self, "localDb")[64];
    v5 = objc_msgSend(v31, "count");
    v30 = (id)-[ULCLDatabaseMigrator localDb](self, "localDb")[40];
    v6 = objc_msgSend(v30, "count");
    v29 = (id)-[ULCLDatabaseMigrator localDb](self, "localDb")[96];
    v7 = objc_msgSend(v29, "count");
    v28 = (id)-[ULCLDatabaseMigrator localDb](self, "localDb")[56];
    v8 = objc_msgSend(v28, "count");
    v27 = (id)-[ULCLDatabaseMigrator localDb](self, "localDb")[80];
    v9 = objc_msgSend(v27, "count");
    v26 = (id)-[ULCLDatabaseMigrator localDb](self, "localDb")[16];
    v10 = objc_msgSend(v26, "count");
    v25 = (id)-[ULCLDatabaseMigrator localDb](self, "localDb")[24];
    v20 = objc_msgSend(v25, "count");
    v21 = v10;
    v22 = v9;
    v23 = v8;
    v11 = v6;
    v24 = (id)-[ULCLDatabaseMigrator localDb](self, "localDb")[32];
    v12 = objc_msgSend(v24, "count");
    v13 = v5;
    v14 = v4;
    v15 = (id)-[ULCLDatabaseMigrator localDb](self, "localDb")[72];
    v16 = objc_msgSend(v15, "count");
    v17 = (id)-[ULCLDatabaseMigrator localDb](self, "localDb")[104];
    v18 = objc_msgSend(v17, "count");
    v19 = (id)-[ULCLDatabaseMigrator localDb](self, "localDb")[48];
    *(_DWORD *)buf = 68292099;
    v35 = 0;
    v36 = 2082;
    v37 = "";
    v38 = 1025;
    v39 = v14;
    v40 = 1025;
    v41 = v13;
    v42 = 1025;
    v43 = v11;
    v44 = 1025;
    v45 = v7;
    v46 = 1025;
    v47 = v23;
    v48 = 1025;
    v49 = v22;
    v50 = 1025;
    v51 = v21;
    v52 = 1025;
    v53 = v20;
    v54 = 1025;
    v55 = v12;
    v56 = 1025;
    v57 = v16;
    v58 = 1025;
    v59 = v18;
    v60 = 1025;
    v61 = objc_msgSend(v19, "count");
    v3 = log;
    _os_log_impl(&dword_2419D9000, log, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Local database stats\", \"RecordingEvent\":%{private}u, \"Measurement\":%{private}u, \"Label\":%{private}u, \"Service\":%{private}u, \"LOI\":%{private}u, \"Rapport\":%{private}u, \"AssociatedState\":%{private}u, \"BluetoothIdentity\":%{private}u, \"Configuration\":%{private}u, \"Model\":%{private}u, \"CustomLOI\":%{private}u, \"LoggedEvent\":%{private}u}", buf, 0x5Au);

  }
}

- (ULDatabase)localDb
{
  return self->_localDb;
}

- (void)setLocalDb:(ULDatabase *)a3
{
  self->_localDb = a3;
}

- (BOOL)migrateAllData
{
  return self->_migrateAllData;
}

- (void)setMigrateAllData:(BOOL)a3
{
  self->_migrateAllData = a3;
}

@end
