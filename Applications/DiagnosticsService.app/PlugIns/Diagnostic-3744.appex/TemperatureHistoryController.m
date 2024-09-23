@implementation TemperatureHistoryController

- (void)start
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];

  v3 = objc_alloc((Class)DSGeneralLogCollector);
  v6[0] = CFSTR("101");
  v6[1] = CFSTR("ThermalUIAlertEnter");
  v6[2] = CFSTR("ThermalUIAlertExit");
  v6[3] = CFSTR("ThermalLevel");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 4));
  v5 = objc_msgSend(v3, "initWithLogIDs:", v4);

  if ((-[TemperatureHistoryController isCancelled](self, "isCancelled") & 1) == 0)
    -[TemperatureHistoryController parseLogsWithCollector:](self, "parseLogsWithCollector:", v5);
  -[TemperatureHistoryController setFinished:](self, "setFinished:", 1);

}

- (void)parseLogsWithCollector:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  int *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _QWORD v49[6];
  _QWORD v50[6];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TemperatureHistoryController result](self, "result"));
  objc_msgSend(v5, "setStatusCode:", &off_100004350);

  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = sub_100003138;
  v47 = sub_100003148;
  v48 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v31 = 0;
  v32 = (int *)&v31;
  v33 = 0x2020000000;
  v34 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 100));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100003150;
  v19[3] = &unk_100004120;
  v19[4] = self;
  v8 = v6;
  v20 = v8;
  v22 = &v39;
  v9 = v7;
  v21 = v9;
  v23 = &v35;
  v24 = &v43;
  v25 = &v27;
  v26 = &v31;
  objc_msgSend(v4, "enumerateLogLinesWithBlock:", v19);
  if ((-[TemperatureHistoryController isCancelled](self, "isCancelled") & 1) == 0)
  {
    if (v32[6] >= 1 && !*((_DWORD *)v28 + 6))
    {
      *((_DWORD *)v28 + 6) = 1;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TemperatureHistoryController result](self, "result"));
      objc_msgSend(v11, "setStatusCode:", &off_100004380);

    }
    if (v44[5])
    {
      *((_DWORD *)v28 + 6) = 2;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TemperatureHistoryController result](self, "result"));
      objc_msgSend(v12, "setStatusCode:", &off_100004368);

    }
    v49[0] = CFSTR("maxTemperature");
    LODWORD(v10) = *((_DWORD *)v40 + 6);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v10));
    v50[0] = v13;
    v50[1] = v9;
    v49[1] = CFSTR("temperatureWarnings");
    v49[2] = CFSTR("temperatureWarningCount");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)v36 + 6)));
    v50[2] = v14;
    v49[3] = CFSTR("totalTimeInTemperatureWarning");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v32[6]));
    v50[3] = v15;
    v49[4] = CFSTR("responseCode");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)v28 + 6)));
    v49[5] = CFSTR("thermalMitigationEvents");
    v50[4] = v16;
    v50[5] = v8;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v50, v49, 6));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TemperatureHistoryController result](self, "result"));
    objc_msgSend(v18, "setData:", v17);

  }
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);

}

- (void)addTemperatureWarningWithReason:(id)a3 toDictionary:(id)a4
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;

  v11 = (__CFString *)a3;
  v5 = a4;
  v6 = CFSTR("Unspecified");
  if (v11)
    v6 = v11;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v7));
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v8, "intValue") + 1));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, v7);

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &off_100004398, v7);
  }

}

@end
