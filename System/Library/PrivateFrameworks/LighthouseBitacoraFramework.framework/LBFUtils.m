@implementation LBFUtils

+ (BOOL)switchToMobile
{
  passwd *v3;
  uid_t pw_uid;
  const char *v5;

  if (getuid())
    return 1;
  puts("Dropping root privileges to mobile");
  v3 = getpwnam("mobile");
  if (v3)
  {
    pw_uid = v3->pw_uid;
    if (pw_uid)
    {
      if (setuid(pw_uid))
      {
        v5 = "Error: could not set uid";
      }
      else
      {
        if (getuid())
          return 1;
        v5 = "Error: failed to setuid to drop privileges. Exiting.";
      }
    }
    else
    {
      v5 = "Error: got pwInfo for uid=0. Exiting.";
    }
  }
  else
  {
    v5 = "Error: failed to get pwInfo Exiting.";
  }
  puts(v5);
  return 0;
}

+ (id)dateToGMTDate:(id)a3
{
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = (void *)MEMORY[0x24BDBCF38];
  v4 = a3;
  objc_msgSend_defaultTimeZone(v3, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_secondsFromGMT(v9, v10, v11, v12, v13);

  objc_msgSend_timeIntervalSinceReferenceDate(v4, v14, v15, v16, v17);
  return (id)MEMORY[0x24BEDD108](MEMORY[0x24BDBCE60], sel_dateWithTimeIntervalSinceReferenceDate_, v18, v19, v20);
}

+ (id)dateToTimestampStringInMSec:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  double v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;

  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_timeIntervalSince1970(a3, a2, (uint64_t)a3, v3, v4);
  return (id)objc_msgSend_stringWithFormat_(v5, v7, (uint64_t)CFSTR("%llu"), v8, v9, (unint64_t)(v6 * 1000.0));
}

+ (BOOL)IsEmptyTrialIdentifiers:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v55;

  v3 = a3;
  objc_msgSend_bmltIdentifiers(v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trialDeploymentID(v8, v9, v10, v11, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = 0;
  }
  else
  {
    objc_msgSend_bmltIdentifiers(v3, v13, v14, v15, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialTaskID(v19, v20, v21, v22, v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v18 = 0;
    }
    else
    {
      objc_msgSend_experimentIdentifiers(v3, v24, v25, v26, v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_trialExperimentID(v29, v30, v31, v32, v33);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (v38)
      {
        v18 = 0;
      }
      else
      {
        objc_msgSend_experimentIdentifiers(v3, v34, v35, v36, v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_trialDeploymentID(v39, v40, v41, v42, v43);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (v48)
        {
          v18 = 0;
        }
        else
        {
          objc_msgSend_experimentIdentifiers(v3, v44, v45, v46, v47);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_trialTreatmentID(v55, v49, v50, v51, v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v53 == 0;

        }
      }

    }
  }

  return v18;
}

+ (BOOL)IsEqualStringOrNil:(id)a3 s2:(id)a4
{
  unint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;

  v5 = (unint64_t)a3;
  v6 = (uint64_t)a4;
  v10 = (void *)v6;
  if (!v5 || !v6)
  {
    if (v5 | v6)
      goto LABEL_4;
LABEL_6:
    v11 = 1;
    goto LABEL_7;
  }
  if ((objc_msgSend_isEqualToString_((void *)v5, v7, v6, v8, v9) & 1) != 0)
    goto LABEL_6;
LABEL_4:
  v11 = 0;
LABEL_7:

  return v11;
}

+ (BOOL)IsEqualNumberOrNil:(id)a3 n2:(id)a4
{
  unint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;

  v5 = (unint64_t)a3;
  v6 = (uint64_t)a4;
  v10 = (void *)v6;
  if (!v5 || !v6)
  {
    if (v5 | v6)
      goto LABEL_4;
LABEL_6:
    v11 = 1;
    goto LABEL_7;
  }
  if ((objc_msgSend_isEqualToNumber_((void *)v5, v7, v6, v8, v9) & 1) != 0)
    goto LABEL_6;
LABEL_4:
  v11 = 0;
LABEL_7:

  return v11;
}

@end
