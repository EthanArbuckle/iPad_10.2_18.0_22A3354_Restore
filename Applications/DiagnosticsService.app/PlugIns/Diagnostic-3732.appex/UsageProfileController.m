@implementation UsageProfileController

- (void)start
{
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)DSGeneralLogCollector), "initWithLogIDs:", &off_1000042F8);
  if ((-[UsageProfileController isCancelled](self, "isCancelled") & 1) == 0)
    -[UsageProfileController parseLogsWithCollector:](self, "parseLogsWithCollector:", v3);
  -[UsageProfileController setFinished:](self, "setFinished:", 1);

}

- (void)parseLogsWithCollector:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  _QWORD v35[10];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  _QWORD v66[10];
  _QWORD v67[10];

  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = sub_1000035B0;
  v64 = sub_1000035C0;
  v65 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = sub_1000035B0;
  v58 = sub_1000035C0;
  v59 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = sub_1000035B0;
  v52 = sub_1000035C0;
  v53 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = sub_1000035B0;
  v46 = sub_1000035C0;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = sub_1000035B0;
  v40 = sub_1000035C0;
  v41 = 0;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000035C8;
  v35[3] = &unk_100004110;
  v35[4] = self;
  v35[5] = &v60;
  v35[6] = &v54;
  v35[7] = &v48;
  v35[8] = &v42;
  v35[9] = &v36;
  v32 = a3;
  objc_msgSend(v32, "enumerateLogLinesWithBlock:", v35);
  if ((-[UsageProfileController isCancelled](self, "isCancelled") & 1) != 0)
  {
    v33 = 0;
    v34 = 0;
  }
  else
  {
    v4 = (void *)v61[5];
    if (v4)
    {
      v5 = objc_msgSend(v4, "usageTime");
      v6 = objc_msgSend((id)v61[5], "standbyTime");
      v7 = objc_msgSend((id)v61[5], "batteryLevel");
    }
    else
    {
      v7 = 0;
      v6 = 0;
      v5 = 0;
    }
    v8 = (void *)v55[5];
    if (v8)
    {
      v9 = objc_msgSend(v8, "usageTime");
      v28 = objc_msgSend((id)v55[5], "batteryLevel");
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v55[5], "date"));
    }
    else
    {
      v9 = 0;
      v28 = 0;
      v34 = 0;
    }
    v10 = (void *)v49[5];
    if (v10)
    {
      v27 = objc_msgSend(v10, "standbyTime");
      v26 = objc_msgSend((id)v49[5], "batteryLevel");
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v49[5], "date"));
    }
    else
    {
      v26 = 0;
      v27 = 0;
      v33 = 0;
    }
    if (v43[5] && (v11 = (void *)v37[5]) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "date"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v43[5], "date"));
      objc_msgSend(v12, "timeIntervalSinceDate:", v13);
      v15 = v14 > 0.0;

    }
    else
    {
      v15 = 0;
    }
    v66[0] = CFSTR("lastUsageLength");
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5));
    v67[0] = v31;
    v66[1] = CFSTR("lastStandbyLength");
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6));
    v67[1] = v30;
    v66[2] = CFSTR("batteryLevelAfterLastUsage");
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7));
    v67[2] = v29;
    v66[3] = CFSTR("pluggedInAfterLastUsage");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v15));
    v67[3] = v16;
    v66[4] = CFSTR("longestUsageLength");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9));
    v67[4] = v17;
    v66[5] = CFSTR("longestUsageDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UsageProfileController stringFromDate:](self, "stringFromDate:", v34));
    v67[5] = v18;
    v66[6] = CFSTR("batteryLevelAfterLongestUsage");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v28));
    v67[6] = v19;
    v66[7] = CFSTR("longestStandbyDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UsageProfileController stringFromDate:](self, "stringFromDate:", v33));
    v67[7] = v20;
    v66[8] = CFSTR("longestStandbyLength");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v27));
    v67[8] = v21;
    v66[9] = CFSTR("batteryLevelAfterLongestStandby");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v26));
    v67[9] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v67, v66, 10));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UsageProfileController result](self, "result"));
    objc_msgSend(v24, "setData:", v23);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UsageProfileController result](self, "result"));
    objc_msgSend(v25, "setStatusCode:", &off_100004310);

  }
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);

}

- (id)stringFromDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[DSDateFormatter sharedFormatter](DSDateFormatter, "sharedFormatter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "formatterWithType:", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromDate:", v3));
    v7 = stringOrNull(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  }

  return v8;
}

@end
