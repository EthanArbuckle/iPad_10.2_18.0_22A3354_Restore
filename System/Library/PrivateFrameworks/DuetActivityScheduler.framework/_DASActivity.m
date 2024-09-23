@implementation _DASActivity

- (BOOL)triggersRestart
{
  return self->_triggersRestart;
}

- (_DASFileProtection)fileProtection
{
  void *v3;
  void *v4;
  uint64_t v5;
  _DASFileProtection *fileProtection;
  _DASFileProtection *v7;
  _DASFileProtection *v8;

  -[_DASActivity dependencies](self, "dependencies");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {

  }
  else
  {
    -[_DASActivity producedResultIdentifiers](self, "producedResultIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (!v5)
      goto LABEL_5;
  }
  fileProtection = self->_fileProtection;
  +[_DASFileProtection none](_DASFileProtection, "none");
  v7 = (_DASFileProtection *)objc_claimAutoreleasedReturnValue();

  if (fileProtection == v7)
  {
    +[_DASFileProtection completeUntilFirstUserAuthentication](_DASFileProtection, "completeUntilFirstUserAuthentication");
    v8 = (_DASFileProtection *)objc_claimAutoreleasedReturnValue();
    return v8;
  }
LABEL_5:
  v8 = self->_fileProtection;
  return v8;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_uuid, "hash");
}

- (NSArray)relatedApplications
{
  return self->_relatedApplications;
}

- (BOOL)deferred
{
  return self->_deferred;
}

- (BOOL)bypassesPredictions
{
  return self->_bypassesPredictions;
}

- (BOOL)cancelAfterDeadline
{
  return self->_cancelAfterDeadline;
}

- (BOOL)requiresInexpensiveNetworking
{
  return self->_requiresInexpensiveNetworking;
}

- (double)interval
{
  return self->_interval;
}

- (int64_t)targetDevice
{
  return self->_targetDevice;
}

- (void)setIsContactTracingBackgroundActivity:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unint64_t schedulingPriority;
  unint64_t v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DASActivity setObject:forUserInfoKey:](self, "setObject:forUserInfoKey:", v5, CFSTR("isCTActivity"));

  schedulingPriority = self->_schedulingPriority;
  v7 = _DASSchedulingPriorityUtility;
  if (!v3)
  {
    if (schedulingPriority != _DASSchedulingPriorityUtility)
      return;
    v7 = _DASSchedulingPriorityBackground;
    goto LABEL_6;
  }
  if (schedulingPriority < _DASSchedulingPriorityUtility)
LABEL_6:
    self->_schedulingPriority = v7;
}

- (void)setRemoteDevice:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDevice, a3);
  if (a3)
  {
    if (!self->_targetDevice)
      -[_DASActivity setTargetDevice:](self, "setTargetDevice:", 3);
  }
}

- (BOOL)isBackgroundTaskActivity
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[_DASActivity launchReason](self, "launchReason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.das.bgrefresh")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[_DASActivity launchReason](self, "launchReason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.das.bgprocessing")) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      -[_DASActivity launchReason](self, "launchReason");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.das.bghealthresearch")) & 1) != 0)
      {
        v4 = 1;
      }
      else
      {
        -[_DASActivity launchReason](self, "launchReason");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.das.bgongoingprocessing")) & 1) != 0)
        {
          v4 = 1;
        }
        else
        {
          -[_DASActivity launchReason](self, "launchReason");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.das.bgongoingprocessing.internal"));

        }
      }

    }
  }

  return v4;
}

- (BOOL)hasMagneticSensitivity
{
  void *v2;
  void *v3;
  char v4;

  -[_DASActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("MagneticInterferenceSensitivity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setTriggersRestart:(BOOL)a3
{
  if (a3)
    -[_DASActivity setRequiresSignificantUserInactivity:](self, "setRequiresSignificantUserInactivity:", 1);
  self->_triggersRestart = a3;
}

- (void)setObject:(id)a3 forUserInfoKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[_DASActivity userInfo](self, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[_DASActivity userInfo](self, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v9, "mutableCopy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, v6);
  v10 = (void *)objc_msgSend(v11, "copy");
  -[_DASActivity setUserInfo:](self, "setUserInfo:", v10);

}

- (void)setRequiresSignificantUserInactivity:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  if (a3 || self->_triggersRestart)
  {
    self->_requiresDeviceInactivity = 1;
    -[_DASActivity userInfo](self, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[_DASActivity userInfo](self, "userInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v6, "mutableCopy");

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, CFSTR("com.apple.das.significantInactivity"));

LABEL_7:
    v8 = (void *)objc_msgSend(v11, "copy");
    -[_DASActivity setUserInfo:](self, "setUserInfo:", v8);

    return;
  }
  if (-[_DASActivity requiresSignificantUserInactivity](self, "requiresSignificantUserInactivity"))
  {
    -[_DASActivity userInfo](self, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[_DASActivity userInfo](self, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v10, "mutableCopy");

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v11, "removeObjectForKey:", CFSTR("com.apple.das.significantInactivity"));
    goto LABEL_7;
  }
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (BOOL)requestsNewsstandLaunch
{
  void *v2;
  void *v3;
  char v4;

  -[_DASActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("newsstand"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)shouldReplaceActivity:(id)a3 andKeepsSubmitted:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  BOOL v17;
  BOOL v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  int v34;

  v6 = a3;
  -[_DASActivity clientProvidedIdentifier](self, "clientProvidedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientProvidedIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    -[_DASActivity launchReason](self, "launchReason");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "launchReason");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if (v12)
    {
      -[_DASActivity launchReason](self, "launchReason");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.das.bgprocessing")))
      {
        v14 = -[_DASActivity requiresPlugin](self, "requiresPlugin");
        if (v14 != objc_msgSend(v6, "requiresPlugin"))
        {
LABEL_12:

          goto LABEL_22;
        }
        v15 = -[_DASActivity requiresNetwork](self, "requiresNetwork");
        v16 = objc_msgSend(v6, "requiresNetwork");

        if (v15 != v16)
          goto LABEL_22;
      }
      else
      {

      }
      -[_DASActivity launchReason](self, "launchReason");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.das.bghealthresearch")))
      {
        v19 = -[_DASActivity requiresPlugin](self, "requiresPlugin");
        if (v19 != objc_msgSend(v6, "requiresPlugin"))
          goto LABEL_12;
        v20 = -[_DASActivity requiresNetwork](self, "requiresNetwork");
        if (v20 != objc_msgSend(v6, "requiresNetwork"))
          goto LABEL_12;
        -[_DASActivity fileProtection](self, "fileProtection");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "fileProtection");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v32, "isEqual:", v33);

        if (!v34)
          goto LABEL_22;
      }
      else
      {

      }
      -[_DASActivity clientProvidedStartDate](self, "clientProvidedStartDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "clientProvidedStartDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22 == 0;

      if ((v21 != 0) != v23)
      {
        -[_DASActivity clientProvidedStartDate](self, "clientProvidedStartDate");
        v24 = objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v25 = (void *)v24;
          objc_msgSend(v6, "clientProvidedStartDate");
          v26 = objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            v27 = (void *)v26;
            -[_DASActivity clientProvidedStartDate](self, "clientProvidedStartDate");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "clientProvidedStartDate");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "timeIntervalSinceDate:", v29);
            v31 = v30;

            if (v31 < 0.0)
              v31 = -v31;

            if (v31 > 1.0)
              goto LABEL_22;
          }
          else
          {

          }
        }
        v18 = 0;
        v17 = 0;
        goto LABEL_23;
      }
    }
LABEL_22:
    v18 = 1;
    v17 = 1;
    goto LABEL_23;
  }
  v17 = 0;
  v18 = 1;
LABEL_23:
  *a4 = v18;

  return v17;
}

+ (id)validateBGTaskRequestWithActivity:(id)a3
{
  id v3;
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  int v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  const __CFString *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;

  v3 = a3;
  objc_msgSend(v3, "clientProvidedIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    v7 = 0;
LABEL_30:

    goto LABEL_31;
  }
  objc_msgSend(v3, "clientProvidedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6 <= 0x80)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 450.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "launchReason");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.das.bgrefresh"));

    if (v10)
    {
      objc_msgSend(v3, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = _DASSchedulingPriorityBackground;
      v13 = _DASActivityDurationVeryShort;
      objc_msgSend(v3, "startAfter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "startBefore");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DASActivity activityWithName:priority:duration:startingAfter:startingBefore:](_DASActivity, "activityWithName:priority:duration:startingAfter:startingBefore:", v11, v12, v13, v14, v15);
      v4 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setLaunchReason:", CFSTR("com.apple.das.bgrefresh"));
      objc_msgSend(v4, "setRequestsApplicationLaunch:", 1);
      objc_msgSend(v4, "setRequiresNetwork:", 1);
      objc_msgSend(v3, "clientProvidedStartDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        objc_msgSend(v3, "clientProvidedStartDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "laterDate:", v8);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setStartAfter:", v18);

      }
      else
      {
        objc_msgSend(v4, "setStartAfter:", v8);
      }

      objc_msgSend(v4, "startAfter");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v40;
      v42 = 86400.0;
LABEL_26:
      objc_msgSend(v40, "dateByAddingTimeInterval:", v42);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setStartBefore:", v61);
LABEL_27:

LABEL_28:
      objc_msgSend(v3, "clientProvidedIdentifier");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setClientProvidedIdentifier:", v62);

      objc_msgSend(v3, "clientProvidedStartDate");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setClientProvidedStartDate:", v63);

      objc_msgSend(v3, "uuid");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setUuid:", v64);

      v4 = v4;
      v7 = v4;
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend(v3, "launchReason");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("com.apple.das.bgprocessing"));

    if (v20)
    {
      objc_msgSend(v3, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = _DASSchedulingPriorityBackground;
      v23 = _DASActivityDurationShort;
      objc_msgSend(v3, "startAfter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "startBefore");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DASActivity activityWithName:priority:duration:startingAfter:startingBefore:](_DASActivity, "activityWithName:priority:duration:startingAfter:startingBefore:", v21, v22, v23, v24, v25);
      v4 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setRequiresNetwork:", objc_msgSend(v3, "requiresNetwork"));
      objc_msgSend(v4, "setRequiresPlugin:", objc_msgSend(v3, "requiresPlugin"));
      objc_msgSend(v4, "setLaunchReason:", CFSTR("com.apple.das.bgprocessing"));
      objc_msgSend(v4, "setRequestsApplicationLaunch:", 1);
      objc_msgSend(v3, "clientProvidedStartDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        objc_msgSend(v3, "clientProvidedStartDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "laterDate:", v8);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setStartAfter:", v28);

      }
      else
      {
        objc_msgSend(v4, "setStartAfter:", v8);
      }

      objc_msgSend(v4, "startAfter");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v40;
      v42 = 604800.0;
      goto LABEL_26;
    }
    objc_msgSend(v3, "launchReason");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.das.bghealthresearch"));

    if (v30)
    {
      objc_msgSend(v3, "name");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = _DASSchedulingPriorityUtility;
      v33 = _DASActivityDurationShort;
      objc_msgSend(v3, "startAfter");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "startBefore");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DASActivity activityWithName:priority:duration:startingAfter:startingBefore:](_DASActivity, "activityWithName:priority:duration:startingAfter:startingBefore:", v31, v32, v33, v34, v35);
      v4 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setRequiresNetwork:", objc_msgSend(v3, "requiresNetwork"));
      objc_msgSend(v4, "setRequiresPlugin:", objc_msgSend(v3, "requiresPlugin"));
      objc_msgSend(v4, "setLaunchReason:", CFSTR("com.apple.das.bghealthresearch"));
      objc_msgSend(v4, "setRequestsApplicationLaunch:", 1);
      objc_msgSend(v3, "fileProtection");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setFileProtection:", v36);

      objc_msgSend(v3, "clientProvidedStartDate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v37)
      {
        objc_msgSend(v3, "clientProvidedStartDate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "laterDate:", v8);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setStartAfter:", v39);

      }
      else
      {
        objc_msgSend(v4, "setStartAfter:", v8);
      }

      objc_msgSend(v4, "startAfter");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v40;
      v42 = 600.0;
      goto LABEL_26;
    }
    objc_msgSend(v3, "launchReason");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "isEqual:", CFSTR("com.apple.das.bgongoingprocessing"));

    if (v44)
    {
      objc_msgSend(v3, "name");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = _DASSchedulingPriorityUserInitiated;
      v47 = _DASActivityDurationModerate;
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DASActivity activityWithName:priority:duration:startingAfter:startingBefore:](_DASActivity, "activityWithName:priority:duration:startingAfter:startingBefore:", v45, v46, v47, v48, v49);
      v4 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setRequiresNetwork:", objc_msgSend(v3, "requiresNetwork"));
      objc_msgSend(v4, "setLaunchReason:", CFSTR("com.apple.das.bgongoingprocessing"));
      objc_msgSend(v4, "userInfo");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (v50)
      {
        objc_msgSend(v4, "userInfo");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)objc_msgSend(v51, "mutableCopy");

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(v3, "userInfo");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("clientProvidedTitle"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "userInfo");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("clientProvidedReason"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      if (v61 && v68)
      {
        objc_msgSend(v3, "userInfo");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("clientProvidedTitle"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setObject:forKeyedSubscript:", v70, CFSTR("clientProvidedTitle"));

        objc_msgSend(v3, "userInfo");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = v71;
        v73 = CFSTR("clientProvidedReason");
        goto LABEL_42;
      }
    }
    else
    {
      objc_msgSend(v3, "launchReason");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "isEqual:", CFSTR("com.apple.das.bgongoingprocessing.internal"));

      if (!v53)
      {
        v4 = 0;
        goto LABEL_28;
      }
      objc_msgSend(v3, "name");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = _DASSchedulingPriorityUserInitiated;
      v56 = _DASActivityDurationModerate;
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DASActivity activityWithName:priority:duration:startingAfter:startingBefore:](_DASActivity, "activityWithName:priority:duration:startingAfter:startingBefore:", v54, v55, v56, v57, v58);
      v4 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setRequiresNetwork:", objc_msgSend(v3, "requiresNetwork"));
      objc_msgSend(v4, "setLaunchReason:", CFSTR("com.apple.das.bgongoingprocessing.internal"));
      objc_msgSend(v4, "userInfo");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (v59)
      {
        objc_msgSend(v4, "userInfo");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)objc_msgSend(v60, "mutableCopy");

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(v3, "userInfo");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("clientProvidedTitle"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "userInfo");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("clientProvidedReason"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      if (v61 && v68)
      {
        objc_msgSend(v3, "userInfo");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("clientProvidedTitle"));
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setObject:forKeyedSubscript:", v77, CFSTR("clientProvidedTitle"));

        objc_msgSend(v3, "userInfo");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("clientProvidedReason"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setObject:forKeyedSubscript:", v79, CFSTR("clientProvidedReason"));

        objc_msgSend(v3, "userInfo");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("clientProvidedIconBundleIdentifier"));
        v81 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v81)
        {
LABEL_43:
          objc_msgSend(v4, "setUserInfo:", v41);

          goto LABEL_27;
        }
        objc_msgSend(v3, "userInfo");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = v71;
        v73 = CFSTR("clientProvidedIconBundleIdentifier");
LABEL_42:
        objc_msgSend(v71, "objectForKeyedSubscript:", v73);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setObject:forKeyedSubscript:", v82, v73);

        goto LABEL_43;
      }
    }

    v7 = 0;
    goto LABEL_29;
  }
  v7 = 0;
LABEL_31:

  return v7;
}

- (BOOL)requiresNetwork
{
  return self->_requiresNetwork;
}

+ (_DASActivity)activityWithName:(id)a3 priority:(unint64_t)a4 duration:(unint64_t)a5 startingAfter:(id)a6 startingBefore:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;

  v12 = a7;
  v13 = a6;
  v14 = a3;
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:priority:duration:startingAfter:startingBefore:userInfo:", v14, a4, a5, v13, v12, 0);

  return (_DASActivity *)v15;
}

+ (unint64_t)cleanSchedulingPriority:(unint64_t)a3
{
  unint64_t result;

  result = _DASSchedulingPriorityMaintenance;
  if (_DASSchedulingPriorityMaintenance < a3)
  {
    result = _DASSchedulingPriorityBackground;
    if (_DASSchedulingPriorityBackground < a3)
    {
      result = _DASSchedulingPriorityUtility;
      if (_DASSchedulingPriorityUtility < a3)
      {
        result = _DASSchedulingPriorityDefault;
        if (_DASSchedulingPriorityDefault < a3)
        {
          if (_DASSchedulingPriorityUserInitiated >= a3)
            return _DASSchedulingPriorityUserInitiated;
          else
            return _DASSchedulingPriorityUserInitiatedOvercommit;
        }
      }
    }
  }
  return result;
}

+ (unint64_t)cleanDuration:(unint64_t)a3
{
  uint64_t v3;

  if (_DASActivityDurationVeryLong >= a3)
    v3 = a3;
  else
    v3 = _DASActivityDurationInterminable;
  if (_DASActivityDurationVeryShort >= a3)
    return _DASActivityDurationVeryShort;
  else
    return v3;
}

- (void)setRequiresNetwork:(BOOL)a3
{
  self->_requiresNetwork = a3;
  -[_DASActivity updateGroupIfNecessary](self, "updateGroupIfNecessary");
}

- (void)setRequiresPlugin:(BOOL)a3
{
  self->_requiresPlugin = a3;
}

- (NSString)clientProvidedIdentifier
{
  void *v2;
  void *v3;

  -[_DASActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("clientID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDate)clientProvidedStartDate
{
  void *v2;
  void *v3;

  -[_DASActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("clientStartDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setRequestsApplicationLaunch:(BOOL)a3
{
  if (a3)
  {
    self->_shouldBePersisted = 1;
    self->_suspendable = 1;
  }
  self->_requestsApplicationLaunch = a3;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _DASFastPass *fastPass;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  double interval;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _DASFileProtection *v35;
  _DASFileProtection *fileProtection;
  void *v37;
  NSDictionary *userInfo;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;

  +[_DASActivity sharedDateFormatter](_DASActivity, "sharedDateFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37A0];
  -[_DASActivity nameString](self, "nameString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DASActivity prettySchedulingPriorityDescription:](_DASActivity, "prettySchedulingPriorityDescription:", self->_schedulingPriority);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_duration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DASActivity startAfter](self, "startAfter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DASActivity startBefore](self, "startBefore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<_DASActivity: \"%@\", %@, %@s, [%@ - %@]"), v5, v6, v7, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_DASActivity startDate](self, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[_DASActivity startDate](self, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringFromDate:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR(", Started at %@"), v15);

  }
  -[_DASActivity limitationResponse](self, "limitationResponse");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[_DASActivity limitationResponse](self, "limitationResponse");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR(", ACTIVITY LIMITED %@"), v17);

  }
  if (!self->_suspendable)
    objc_msgSend(v12, "appendString:", CFSTR(", NOT Suspendable"));
  if (self->_groupName)
    objc_msgSend(v12, "appendFormat:", CFSTR(", Group: \"%@\"), self->_groupName);
  fastPass = self->_fastPass;
  if (fastPass)
  {
    -[_DASFastPass processingTaskIdentifiers](fastPass, "processingTaskIdentifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[_DASFastPass processingTaskIdentifiers](self->_fastPass, "processingTaskIdentifiers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appendFormat:", CFSTR(", TaskID: %@"), v20);

    }
  }
  if (self->_featureCodes)
    objc_msgSend(v12, "appendFormat:", CFSTR(", Feature Codes: %@"), self->_featureCodes);
  if (self->_staticPriority)
    objc_msgSend(v12, "appendFormat:", CFSTR(", Static Pri: %ld"), self->_staticPriority);
  if (self->_cancelAfterDeadline)
    objc_msgSend(v12, "appendString:", CFSTR(", Cancel After Deadline"));
  if (self->_shouldWakeDevice)
    objc_msgSend(v12, "appendString:", CFSTR(", Should Wake Device"));
  if (self->_lastComputedScore != 0.0)
    objc_msgSend(v12, "appendFormat:", CFSTR(", Last Computed Score: %3.2f"), *(_QWORD *)&self->_lastComputedScore);
  if (self->_requiresNetwork)
  {
    objc_msgSend(v12, "appendFormat:", CFSTR(", Networking: Upload=%u, UploadSize=%llu, DownloadSize=%llu, WiFi-Only=%u"), self->_isUpload, self->_uploadSize, self->_downloadSize, self->_requiresInexpensiveNetworking);
    if (self->_requiresUnconstrainedNetworking)
      objc_msgSend(v12, "appendFormat:", CFSTR(", Unconstrained-Only=%u"), 1);
  }
  if (self->_cpuIntensive)
    objc_msgSend(v12, "appendString:", CFSTR(", CPU Intensive"));
  if (self->_memoryIntensive)
    objc_msgSend(v12, "appendString:", CFSTR(", Memory Intensive"));
  if (self->_diskIntensive)
    objc_msgSend(v12, "appendString:", CFSTR(", Disk Intensive"));
  if (self->_aneIntensive)
    objc_msgSend(v12, "appendString:", CFSTR(", ANE Intensive"));
  if (self->_gpuIntensive)
    objc_msgSend(v12, "appendString:", CFSTR(", GPU Intensive"));
  if (self->_requiresDeviceInactivity)
    objc_msgSend(v12, "appendString:", CFSTR(", Require Device Inactivity"));
  v21 = self->_targetDevice - 1;
  if (v21 <= 2)
    objc_msgSend(v12, "appendString:", off_1E624B940[v21]);
  if (self->_remoteDevice)
    objc_msgSend(v12, "appendFormat:", CFSTR(", Remote Device ID: %@"), self->_remoteDevice);
  if (self->_requiresRemoteDeviceWake)
    objc_msgSend(v12, "appendString:", CFSTR(", Requires Remote Wake"));
  if (self->_supportsAnyApplication)
    objc_msgSend(v12, "appendString:", CFSTR(", Supports Any Application"));
  if (self->_requestsApplicationLaunch)
  {
    -[NSArray firstObject](self->_relatedApplications, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR(", Requests Launch (%@)"), v22);

  }
  if (self->_requestsExtensionLaunch)
  {
    -[NSArray firstObject](self->_relatedApplications, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR(", Requests Extension Launch (%@)"), v23);

  }
  if (self->_requiresPlugin)
    objc_msgSend(v12, "appendString:", CFSTR(", Plugin Required"));
  if (self->_dataBudgeted)
    objc_msgSend(v12, "appendString:", CFSTR(", Data Budgeted"));
  if (self->_triggersRestart)
    objc_msgSend(v12, "appendString:", CFSTR(", Triggers Restart"));
  if (self->_beforeDaysFirstActivity)
  {
    v24 = CFSTR(", App Refresh");
  }
  else
  {
    if (!self->_darkWakeEligible)
      goto LABEL_60;
    v24 = CFSTR(", Dark-Wake Eligible");
  }
  objc_msgSend(v12, "appendString:", v24);
LABEL_60:
  interval = self->_interval;
  if (interval != 0.0)
    objc_msgSend(v12, "appendFormat:", CFSTR(", Interval=%.0f"), interval / 60.0);
  if (-[NSArray count](self->_relatedApplications, "count")
    && !self->_requestsApplicationLaunch
    && !self->_requestsExtensionLaunch)
  {
    -[NSArray description](self->_relatedApplications, "description");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR(", Related Apps: %@"), v27);

  }
  if (-[NSArray count](self->_involvedProcesses, "count"))
  {
    -[NSArray description](self->_involvedProcesses, "description");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR(", Involved Processes: %@"), v29);

  }
  if (self->_widgetBudgetID)
    objc_msgSend(v12, "appendFormat:", CFSTR(", Widget budget ID: %@"), self->_widgetBudgetID);
  if (self->_widgetID)
    objc_msgSend(v12, "appendFormat:", CFSTR(", Widget ID: %@"), self->_widgetID);
  if (self->_rateLimitConfigurationName)
    objc_msgSend(v12, "appendFormat:", CFSTR(", Rate Limit Config Name: %@"), self->_rateLimitConfigurationName);
  if (self->_serviceName)
    objc_msgSend(v12, "appendFormat:", CFSTR(", Service Name: %@"), self->_serviceName);
  if (-[_DASActivity budgeted](self, "budgeted"))
    objc_msgSend(v12, "appendString:", CFSTR(", Budgeted"));
  -[_DASActivity clientDataBudgetName](self, "clientDataBudgetName");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[_DASActivity clientDataBudgetName](self, "clientDataBudgetName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR(", Budget=%@"), v31);

  }
  if (self->_backlogged)
    objc_msgSend(v12, "appendString:", CFSTR(", Backlogged"));
  -[_DASActivity activityType](self, "activityType");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[_DASActivity activityType](self, "activityType");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR(", activityType=%@"), v33);

  }
  if (self->_budgetingToken)
    objc_msgSend(v12, "appendFormat:", CFSTR(", Bundle ID: %@"), self->_bundleId);
  if (self->_deferred)
    objc_msgSend(v12, "appendString:", CFSTR(", deferred"));
  if (-[_DASFileProtection indicatesProtection](self->_fileProtection, "indicatesProtection"))
    objc_msgSend(v12, "appendFormat:", CFSTR(", %@"), self->_fileProtection);
  -[_DASActivity fileProtection](self, "fileProtection");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[_DASActivity fileProtection](self, "fileProtection");
    v35 = (_DASFileProtection *)objc_claimAutoreleasedReturnValue();
    fileProtection = self->_fileProtection;

    -[_DASActivity fileProtection](self, "fileProtection");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR(", %@"), v37);

    if (v35 != fileProtection)
      objc_msgSend(v12, "appendFormat:", CFSTR(" (overridden value: %@)"), self->_fileProtection);
  }
  if (self->_delayedStart)
    objc_msgSend(v12, "appendFormat:", CFSTR(", Delayed Start"));
  userInfo = self->_userInfo;
  if (userInfo)
  {
    -[NSDictionary description](userInfo, "description");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR(", User Specified: %@"), v40);

  }
  if (self->_producedResultIdentifiers)
    objc_msgSend(v12, "appendFormat:", CFSTR(", Produced Result Identifiers: %@"), self->_producedResultIdentifiers);
  if (self->_dependencies)
    objc_msgSend(v12, "appendFormat:", CFSTR(", Dependencies: %@"), self->_dependencies);
  -[_DASActivity fastPass](self, "fastPass");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    -[_DASActivity fastPass](self, "fastPass");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR(", FastPass v%d"), objc_msgSend(v42, "semanticVersion"));

  }
  if (self->_diskVolume)
  {
    -[_DASActivity diskVolume](self, "diskVolume");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR(", DiskVolume=%@"), v43);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@>"), v12);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

- (BOOL)budgeted
{
  unint64_t v4;
  unint64_t v5;

  if (self->_budgeted)
    return 1;
  if (-[_DASActivity isContactTracingBackgroundActivity](self, "isContactTracingBackgroundActivity"))
    return 0;
  v4 = -[_DASActivity schedulingPriority](self, "schedulingPriority");
  if (v4 < _DASSchedulingPriorityUtility)
    return 1;
  v5 = -[_DASActivity schedulingPriority](self, "schedulingPriority");
  return v5 == _DASSchedulingPriorityUtility
      && -[_DASActivity requestsApplicationLaunch](self, "requestsApplicationLaunch");
}

- (unint64_t)schedulingPriority
{
  return self->_schedulingPriority;
}

- (NSString)clientDataBudgetName
{
  return self->_clientDataBudgetName;
}

- (_DASActivity)initWithCoder:(id)a3
{
  id v4;
  _DASActivity *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _DASActivity *v12;
  void *v13;
  uint64_t v14;
  _DASFileProtection *fileProtection;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  uint64_t v21;
  NSString *extensionIdentifier;
  uint64_t v23;
  NSString *launchReason;
  uint64_t v25;
  NSString *remoteDevice;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSArray *relatedApplications;
  void *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSArray *involvedProcesses;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  NSDictionary *userInfo;
  uint64_t v49;
  NSString *bundleId;
  __CFString *v51;
  __CFString *v52;
  int v53;
  __CFString *v54;
  NSString *groupName;
  void *v56;
  uint64_t v57;
  NSDate *submitDate;
  void *v59;
  double v60;
  uint64_t v61;
  NSDate *predictedOptimalStartDate;
  double v63;
  uint64_t v64;
  NSString *clientDataBudgetName;
  void *v66;
  uint64_t v67;
  NSString *clientName;
  uint64_t v69;
  NSString *activityType;
  double v71;
  uint64_t v72;
  NSString *widgetBudgetID;
  uint64_t v74;
  NSString *widgetID;
  uint64_t v76;
  NSString *rateLimitConfigurationName;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  NSMutableArray *limitationResponse;
  uint64_t v85;
  NSString *serviceName;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  NSArray *featureCodes;
  uint64_t v94;
  _DASFastPass *fastPass;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t v101;
  NSSet *producedResultIdentifiers;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  uint64_t v108;
  NSSet *dependencies;
  uint64_t v110;
  NSString *diskVolume;
  void *v112;
  __CFString *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  id v123;
  void *v124;
  _QWORD v125[4];
  id v126;
  objc_super v127;

  v4 = a3;
  v127.receiver = self;
  v127.super_class = (Class)_DASActivity;
  v5 = -[_DASActivity init](&v127, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("schedPriority"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("duration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("before"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("after"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    if (!v6 || !v7 || !v8 || !v9 || !v10 || !v11)
      goto LABEL_65;
    v13 = v11;
    objc_storeStrong((id *)&v5->_name, v6);
    v5->_schedulingPriority = objc_msgSend(v7, "unsignedIntegerValue");
    v5->_duration = objc_msgSend(v8, "unsignedIntegerValue");
    -[_DASActivity setStartBefore:](v5, "setStartBefore:", v9);
    -[_DASActivity setStartAfter:](v5, "setStartAfter:", v10);
    v123 = v13;
    objc_storeStrong((id *)&v5->_uuid, v13);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("fileProtection")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileProtection"));
      v14 = objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        v12 = 0;
LABEL_64:
        v11 = v123;
LABEL_65:

        goto LABEL_66;
      }
    }
    else
    {
      +[_DASFileProtection none](_DASFileProtection, "none");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    fileProtection = v5->_fileProtection;
    v5->_fileProtection = (_DASFileProtection *)v14;

    v5->_suspendable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("suspendable"));
    v5->_cancelAfterDeadline = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("deadlineCancel"));
    v5->_shouldWakeDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldWakeDevice"));
    v5->_requiresNetwork = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("reqNW"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nwDownloadSize"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      v5->_downloadSize = objc_msgSend(v16, "unsignedIntegerValue");
    v118 = v17;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nwUploadSize"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
      v5->_uploadSize = objc_msgSend(v18, "unsignedIntegerValue");
    v117 = v19;
    v119 = v10;
    v120 = v8;
    v121 = v7;
    v122 = v6;
    v5->_isUpload = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isUpload"));
    v5->_requiresInexpensiveNetworking = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cheapNW"));
    v5->_requiresUnconstrainedNetworking = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("unconstrainedNW"));
    v5->_cpuIntensive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cpu"));
    v5->_memoryIntensive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("mem"));
    v5->_diskIntensive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disk"));
    v5->_aneIntensive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ane"));
    v5->_gpuIntensive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("gpu"));
    v5->_afterUserIsInactive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("afterInactive"));
    v5->_beforeUserIsActive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("beforeActive"));
    v5->_beforeUserIsActive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("beforeActive"));
    v5->_requiresDeviceInactivity = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("inactive"));
    v5->_darkWakeEligible = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("darkWake"));
    v5->_beforeDaysFirstActivity = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("apprefresh"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("interval"));
    v5->_interval = v20;
    v5->_requiresPlugin = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("plugin"));
    v5->_dataBudgeted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dataBudgeted"));
    v5->_triggersRestart = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("restart"));
    v5->_preventDeviceSleep = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("preventSleep"));
    v5->_supportsAnyApplication = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("anyApp"));
    v5->_requestsApplicationLaunch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("appLaunch"));
    v5->_requestsExtensionLaunch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("extLaunch"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extId"));
    v21 = objc_claimAutoreleasedReturnValue();
    extensionIdentifier = v5->_extensionIdentifier;
    v5->_extensionIdentifier = (NSString *)v21;

    v5->_shouldBePersisted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("persist"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("launchReason"));
    v23 = objc_claimAutoreleasedReturnValue();
    launchReason = v5->_launchReason;
    v5->_launchReason = (NSString *)v23;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("target")))
      v5->_targetDevice = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("target"));
    v5->_requiresRemoteDeviceWake = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("remoteDeviceWake"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remote"));
    v25 = objc_claimAutoreleasedReturnValue();
    remoteDevice = v5->_remoteDevice;
    v5->_remoteDevice = (NSString *)v25;

    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "mutableCopy");

    if (objc_msgSend(v30, "count"))
    {
      v31 = 0;
      do
      {
        objc_msgSend(v30, "objectAtIndexedSubscript:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "dk_dedup");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setObject:atIndexedSubscript:", v33, v31);

        ++v31;
      }
      while (v31 < objc_msgSend(v30, "count"));
    }
    v34 = objc_msgSend(v30, "copy");
    relatedApplications = v5->_relatedApplications;
    v5->_relatedApplications = (NSArray *)v34;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v124, CFSTR("involvedProcesses"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v36, "mutableCopy");

    if (objc_msgSend(v37, "count"))
    {
      v38 = 0;
      do
      {
        objc_msgSend(v37, "objectAtIndexedSubscript:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "dk_dedup");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setObject:atIndexedSubscript:", v40, v38);

        ++v38;
      }
      while (v38 < objc_msgSend(v37, "count"));
    }
    v41 = objc_msgSend(v37, "copy");
    involvedProcesses = v5->_involvedProcesses;
    v5->_involvedProcesses = (NSArray *)v41;

    v5->_relevancy = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("relevancy"));
    +[_DASActivity validClassesForUserInfoSerialization](_DASActivity, "validClassesForUserInfoSerialization");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v43, CFSTR("userInfo"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v125[0] = MEMORY[0x1E0C809B0];
    v125[1] = 3221225472;
    v125[2] = __30___DASActivity_initWithCoder___block_invoke;
    v125[3] = &unk_1E624B860;
    v46 = v45;
    v126 = v46;
    v116 = v44;
    objc_msgSend(v44, "enumerateKeysAndObjectsUsingBlock:", v125);
    v115 = v46;
    v47 = objc_msgSend(v46, "copy");
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v47;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v49 = objc_claimAutoreleasedReturnValue();
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v49;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupName"));
    v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v114 = v51;
    if ((-[__CFString isEqualToString:](v51, "isEqualToString:", _DASDefaultGroupName) & 1) != 0)
    {
      v52 = _DASDefaultGroupName;
    }
    else if (-[__CFString isEqualToString:](v51, "isEqualToString:", _DASDefaultNetworkGroupName))
    {
      v52 = _DASDefaultNetworkGroupName;
    }
    else
    {
      v53 = -[__CFString isEqualToString:](v51, "isEqualToString:", _DASDefaultRemoteGroupName);
      v52 = _DASDefaultRemoteGroupName;
      if (!v53)
        v52 = v51;
    }
    v54 = v52;
    groupName = v5->_groupName;
    v5->_groupName = &v54->isa;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DASActivity setStartDate:](v5, "setStartDate:", v56);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("submitDate"));
    v57 = objc_claimAutoreleasedReturnValue();
    submitDate = v5->_submitDate;
    v5->_submitDate = (NSDate *)v57;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastScored"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DASActivity setLastScored:](v5, "setLastScored:", v59);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("lastScore"));
    v5->_lastComputedScore = v60;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predStart"));
    v61 = objc_claimAutoreleasedReturnValue();
    predictedOptimalStartDate = v5->_predictedOptimalStartDate;
    v5->_predictedOptimalStartDate = (NSDate *)v61;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("predOpt"));
    v5->_predictedOptimalScore = v63;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("motionState")))
      v5->_motionState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("motionState"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("deferred")))
      v5->_deferred = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("deferred"));
    v5->_delayedStart = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("delayedStart"));
    v5->_pid = objc_msgSend(v4, "decodeIntForKey:", CFSTR("pid"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientCellBudget"));
    v64 = objc_claimAutoreleasedReturnValue();
    clientDataBudgetName = v5->_clientDataBudgetName;
    v5->_clientDataBudgetName = (NSString *)v64;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientName"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "dk_dedup");
    v67 = objc_claimAutoreleasedReturnValue();
    clientName = v5->_clientName;
    v5->_clientName = (NSString *)v67;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityType"));
    v69 = objc_claimAutoreleasedReturnValue();
    activityType = v5->_activityType;
    v5->_activityType = (NSString *)v69;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("percentCompleted"));
    v5->_percentCompleted = v71;
    v5->_completionStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("completionStatus"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("preCleared")))
      v5->_preClearedMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preCleared"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("buddyComplete")))
      v5->_requiresBuddyComplete = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("buddyComplete"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("userIdentifier")))
      v5->_userIdentifier = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("userIdentifier"));
    v5->_runOnAppForeground = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("runOnAppFG"));
    v5->_backlogged = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("backlogged"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("widgetBudgetID")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("widgetBudgetID"));
      v72 = objc_claimAutoreleasedReturnValue();
      widgetBudgetID = v5->_widgetBudgetID;
      v5->_widgetBudgetID = (NSString *)v72;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("widgetID")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("widgetID"));
      v74 = objc_claimAutoreleasedReturnValue();
      widgetID = v5->_widgetID;
      v5->_widgetID = (NSString *)v74;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("rateLimitConfigName")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rateLimitConfigName"));
      v76 = objc_claimAutoreleasedReturnValue();
      rateLimitConfigurationName = v5->_rateLimitConfigurationName;
      v5->_rateLimitConfigurationName = (NSString *)v76;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("limitationResponses")))
    {
      v78 = (void *)MEMORY[0x1E0C99E60];
      v79 = objc_opt_class();
      objc_msgSend(v78, "setWithObjects:", v79, objc_opt_class(), 0);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v80, CFSTR("limitationResponses"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = (void *)objc_msgSend(v81, "mutableCopy");

      v83 = objc_msgSend(v82, "copy");
      limitationResponse = v5->_limitationResponse;
      v5->_limitationResponse = (NSMutableArray *)v83;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("serviceNameKey")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceNameKey"));
      v85 = objc_claimAutoreleasedReturnValue();
      serviceName = v5->_serviceName;
      v5->_serviceName = (NSString *)v85;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("featureCodes")))
    {
      v87 = (void *)MEMORY[0x1E0C99E60];
      v88 = objc_opt_class();
      objc_msgSend(v87, "setWithObjects:", v88, objc_opt_class(), 0);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v89, CFSTR("featureCodes"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = (void *)objc_msgSend(v90, "mutableCopy");

      v92 = objc_msgSend(v91, "copy");
      featureCodes = v5->_featureCodes;
      v5->_featureCodes = (NSArray *)v92;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("fastPass")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fastPass"));
      v94 = objc_claimAutoreleasedReturnValue();
      fastPass = v5->_fastPass;
      v5->_fastPass = (_DASFastPass *)v94;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("producedResultIdentifiers")))
    {
      v96 = (void *)MEMORY[0x1E0C99E60];
      v97 = objc_opt_class();
      v98 = objc_opt_class();
      objc_msgSend(v96, "setWithObjects:", v97, v98, objc_opt_class(), 0);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v99, CFSTR("producedResultIdentifiers"));
      v100 = (void *)objc_claimAutoreleasedReturnValue();

      v101 = objc_msgSend(v100, "copy");
      producedResultIdentifiers = v5->_producedResultIdentifiers;
      v5->_producedResultIdentifiers = (NSSet *)v101;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("dependencies")))
    {
      v103 = (void *)MEMORY[0x1E0C99E60];
      v104 = objc_opt_class();
      v105 = objc_opt_class();
      objc_msgSend(v103, "setWithObjects:", v104, v105, objc_opt_class(), 0);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v106, CFSTR("dependencies"));
      v107 = (void *)objc_claimAutoreleasedReturnValue();

      v108 = objc_msgSend(v107, "copy");
      dependencies = v5->_dependencies;
      v5->_dependencies = (NSSet *)v108;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("diskVolume")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("diskVolume"));
      v110 = objc_claimAutoreleasedReturnValue();
      diskVolume = v5->_diskVolume;
      v5->_diskVolume = (NSString *)v110;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("lastDenialValue")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastDenialValue"));
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_lastDenialValue = objc_msgSend(v112, "unsignedIntegerValue");

    }
    v12 = v5;

    v7 = v121;
    v6 = v122;
    v10 = v119;
    v8 = v120;
    goto LABEL_64;
  }
  v12 = 0;
LABEL_66:

  return v12;
}

- (void)setStartBefore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void)setStartAfter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (void)setLastScored:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

+ (id)validClassesForUserInfoSerialization
{
  if (validClassesForUserInfoSerialization_onceToken != -1)
    dispatch_once(&validClassesForUserInfoSerialization_onceToken, &__block_literal_global_0);
  return (id)validClassesForUserInfoSerialization_validClasses;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSDictionary *userInfo;
  void *v19;
  void *v20;
  _DASFastPass *fastPass;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;

  +[_DASActivity sharedDateFormatter](_DASActivity, "sharedDateFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37A0];
  -[_DASActivity nameString](self, "nameString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DASActivity prettySchedulingPriorityDescription:](_DASActivity, "prettySchedulingPriorityDescription:", self->_schedulingPriority);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_duration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DASActivity startAfter](self, "startAfter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DASActivity startBefore](self, "startBefore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<_DASActivity: \"%@\", %@, %@s, [%@ - %@]"), v5, v6, v7, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_DASActivity limitationResponse](self, "limitationResponse");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[_DASActivity limitationResponse](self, "limitationResponse");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR(", ACTIVITY LIMITED %@"), v14);

  }
  -[_DASActivity startDate](self, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[_DASActivity startDate](self, "startDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringFromDate:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR(", Started at %@"), v17);

  }
  if (self->_requiresNetwork)
  {
    userInfo = self->_userInfo;
    if (userInfo)
    {
      -[NSDictionary objectForKeyedSubscript:](userInfo, "objectForKeyedSubscript:", CFSTR("NWEndpoint"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "description");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appendFormat:", CFSTR(", Endpoint: %@"), v20);

    }
    objc_msgSend(v12, "appendFormat:", CFSTR(", Upload=%u, UploadSize=%llu, DownloadSize=%llu, WiFi-Only=%u"), self->_isUpload, self->_uploadSize, self->_downloadSize, self->_requiresInexpensiveNetworking);
    if (self->_requiresUnconstrainedNetworking)
      objc_msgSend(v12, "appendFormat:", CFSTR(", Unconstrained-Only=%u"), 1);
  }
  if (self->_groupName)
    objc_msgSend(v12, "appendFormat:", CFSTR(", Group: %@"), self->_groupName);
  fastPass = self->_fastPass;
  if (fastPass)
  {
    -[_DASFastPass processingTaskIdentifiers](fastPass, "processingTaskIdentifiers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[_DASFastPass processingTaskIdentifiers](self->_fastPass, "processingTaskIdentifiers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appendFormat:", CFSTR(", TaskID: %@"), v23);

    }
  }
  if (self->_featureCodes)
    objc_msgSend(v12, "appendFormat:", CFSTR(", Feature Codes: %@"), self->_featureCodes);
  if (self->_staticPriority)
    objc_msgSend(v12, "appendFormat:", CFSTR(", Priority: %ld"), self->_staticPriority);
  if (-[_DASActivity isIntensive](self, "isIntensive"))
  {
    objc_msgSend(v12, "appendFormat:", CFSTR(", Intensive:"));
    if (-[_DASActivity isCPUIntensive](self, "isCPUIntensive"))
      objc_msgSend(v12, "appendFormat:", CFSTR(" CPU"));
    if (-[_DASActivity isMemoryIntensive](self, "isMemoryIntensive"))
      objc_msgSend(v12, "appendFormat:", CFSTR(" Memory"));
    if (-[_DASActivity isDiskIntensive](self, "isDiskIntensive"))
      objc_msgSend(v12, "appendFormat:", CFSTR(" Disk"));
    if (-[_DASActivity isANEIntensive](self, "isANEIntensive"))
      objc_msgSend(v12, "appendFormat:", CFSTR(" ANE"));
    if (-[_DASActivity isGPUIntensive](self, "isGPUIntensive"))
      objc_msgSend(v12, "appendFormat:", CFSTR(" GPU"));
  }
  if (self->_pid >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR(", PID: %@"), v24);

  }
  v25 = self->_targetDevice - 1;
  if (v25 <= 2)
    objc_msgSend(v12, "appendString:", off_1E624B940[v25]);
  if (self->_remoteDevice)
    objc_msgSend(v12, "appendFormat:", CFSTR(", Remote Device ID: %@"), self->_remoteDevice);
  if (self->_requiresRemoteDeviceWake)
    objc_msgSend(v12, "appendString:", CFSTR(", Requires Remote Wake"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@>"), v12);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (NSDate)startBefore
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (BOOL)hasManyConstraints
{
  void *v2;
  BOOL v4;
  void *v5;
  _BOOL4 requiresNetwork;

  if (!-[_DASActivity isIntensive](self, "isIntensive"))
  {
    -[_DASActivity fastPass](self, "fastPass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
LABEL_4:
      v4 = 1;
LABEL_5:

      return v4;
    }
    requiresNetwork = self->_requiresNetwork;
    if (!self->_requiresNetwork)
      goto LABEL_24;
    if (!-[_DASActivity requestsApplicationLaunch](self, "requestsApplicationLaunch"))
      goto LABEL_4;
    -[_DASActivity launchReason](self, "launchReason");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.das.launchreason.fetch")))
    {
LABEL_24:
      if (self->_backlogged
        || self->_requiresPlugin
        || self->_schedulingPriority < _DASSchedulingPriorityUserInitiated
        && -[_DASActivity transferSizeType](self, "transferSizeType") == 30
        || self->_triggersRestart
        || self->_requiresDeviceInactivity
        || self->_rateLimitConfigurationName)
      {
        v4 = 1;
        if (!requiresNetwork)
          goto LABEL_5;
      }
      else
      {
        v4 = self->_targetDevice == 3;
        if (!requiresNetwork)
          goto LABEL_5;
      }
    }
    else
    {
      v4 = 1;
    }

    goto LABEL_5;
  }
  return 1;
}

- (BOOL)isIntensive
{
  void *v3;

  -[_DASActivity fastPass](self, "fastPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 0;
  if (self->_cpuIntensive || self->_memoryIntensive || self->_diskIntensive || self->_aneIntensive)
    return 1;
  return self->_gpuIntensive;
}

- (BOOL)requestsApplicationLaunch
{
  return self->_requestsApplicationLaunch;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 344, 1);
}

- (id)nameString
{
  void *v2;
  NSString *name;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  name = self->_name;
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "substringToIndex:", 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@:%@"), name, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)prettySchedulingPriorityDescription:(unint64_t)a3
{
  if (_DASSchedulingPriorityUserInitiatedOvercommit == a3)
    return CFSTR("UserInitiatedOvercommit");
  if (_DASSchedulingPriorityUserInitiated == a3)
    return CFSTR("UserInitiated");
  if (_DASSchedulingPriorityDefault == a3)
    return CFSTR("Default");
  if (_DASSchedulingPriorityUtility == a3)
    return CFSTR("Utility");
  if (_DASSchedulingPriorityBackground == a3)
    return CFSTR("Background");
  if (_DASSchedulingPriorityMaintenance == a3)
    return CFSTR("Maintenance");
  return &stru_1E624C4F8;
}

+ (id)sharedDateFormatter
{
  if (sharedDateFormatter_onceToken != -1)
    dispatch_once(&sharedDateFormatter_onceToken, &__block_literal_global_274);
  return (id)sharedDateFormatter_formatter;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t targetDevice;
  NSString *remoteDevice;
  NSString *extensionIdentifier;
  NSString *launchReason;
  NSArray *relatedApplications;
  NSArray *involvedProcesses;
  NSString *groupName;
  NSDictionary *userInfo;
  void *v18;
  void *v19;
  _DASActivityProgressWrapper *v20;
  void *v21;
  _DASActivityProgressWrapper *v22;
  void *v23;
  NSString *bundleId;
  void *v25;
  void *v26;
  NSDate *submitDate;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int64_t motionState;
  NSString *clientDataBudgetName;
  NSString *clientName;
  int64_t completionStatus;
  int64_t preClearedMode;
  uint64_t userIdentifier;
  NSString *widgetBudgetID;
  NSString *widgetID;
  NSString *rateLimitConfigurationName;
  NSMutableArray *limitationResponse;
  NSString *serviceName;
  NSString *activityType;
  NSArray *featureCodes;
  _DASFastPass *fastPass;
  NSSet *producedResultIdentifiers;
  NSSet *dependencies;
  NSString *diskVolume;
  void *v49;
  void *v50;
  id v51;

  v51 = a3;
  objc_msgSend(v51, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_schedulingPriority);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "encodeObject:forKey:", v4, CFSTR("schedPriority"));

  -[_DASActivity startBefore](self, "startBefore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "encodeObject:forKey:", v5, CFSTR("before"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_duration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "encodeObject:forKey:", v6, CFSTR("duration"));

  -[_DASActivity startAfter](self, "startAfter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "encodeObject:forKey:", v7, CFSTR("after"));

  objc_msgSend(v51, "encodeObject:forKey:", self->_uuid, CFSTR("uuid"));
  if (-[_DASFileProtection indicatesProtection](self->_fileProtection, "indicatesProtection"))
    objc_msgSend(v51, "encodeObject:forKey:", self->_fileProtection, CFSTR("fileProtection"));
  if (self->_suspendable)
    objc_msgSend(v51, "encodeBool:forKey:", 1, CFSTR("suspendable"));
  if (self->_cancelAfterDeadline)
    objc_msgSend(v51, "encodeBool:forKey:", 1, CFSTR("deadlineCancel"));
  if (self->_requiresNetwork)
  {
    objc_msgSend(v51, "encodeBool:forKey:", 1, CFSTR("reqNW"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_downloadSize);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "encodeObject:forKey:", v8, CFSTR("nwDownloadSize"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_uploadSize);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "encodeObject:forKey:", v9, CFSTR("nwUploadSize"));

    objc_msgSend(v51, "encodeBool:forKey:", self->_isUpload, CFSTR("isUpload"));
    objc_msgSend(v51, "encodeBool:forKey:", self->_requiresInexpensiveNetworking, CFSTR("cheapNW"));
    objc_msgSend(v51, "encodeBool:forKey:", self->_requiresUnconstrainedNetworking, CFSTR("unconstrainedNW"));
  }
  if (self->_shouldWakeDevice)
    objc_msgSend(v51, "encodeBool:forKey:", 1, CFSTR("shouldWakeDevice"));
  if (self->_cpuIntensive)
    objc_msgSend(v51, "encodeBool:forKey:", 1, CFSTR("cpu"));
  if (self->_memoryIntensive)
    objc_msgSend(v51, "encodeBool:forKey:", 1, CFSTR("mem"));
  if (self->_diskIntensive)
    objc_msgSend(v51, "encodeBool:forKey:", 1, CFSTR("disk"));
  if (self->_aneIntensive)
    objc_msgSend(v51, "encodeBool:forKey:", 1, CFSTR("ane"));
  if (self->_gpuIntensive)
    objc_msgSend(v51, "encodeBool:forKey:", 1, CFSTR("gpu"));
  if (self->_afterUserIsInactive)
    objc_msgSend(v51, "encodeBool:forKey:", 1, CFSTR("afterInactive"));
  if (self->_beforeUserIsActive)
    objc_msgSend(v51, "encodeBool:forKey:", 1, CFSTR("beforeActive"));
  if (self->_requiresDeviceInactivity)
    objc_msgSend(v51, "encodeBool:forKey:", 1, CFSTR("inactive"));
  if (self->_darkWakeEligible)
    objc_msgSend(v51, "encodeBool:forKey:", 1, CFSTR("darkWake"));
  if (self->_beforeDaysFirstActivity)
    objc_msgSend(v51, "encodeBool:forKey:", 1, CFSTR("apprefresh"));
  if (self->_interval != 0.0)
    objc_msgSend(v51, "encodeDouble:forKey:", CFSTR("interval"));
  if (self->_requiresPlugin)
    objc_msgSend(v51, "encodeBool:forKey:", 1, CFSTR("plugin"));
  if (self->_dataBudgeted)
    objc_msgSend(v51, "encodeBool:forKey:", 1, CFSTR("dataBudgeted"));
  if (self->_triggersRestart)
    objc_msgSend(v51, "encodeBool:forKey:", 1, CFSTR("restart"));
  if (self->_preventDeviceSleep)
    objc_msgSend(v51, "encodeBool:forKey:", 1, CFSTR("preventSleep"));
  targetDevice = self->_targetDevice;
  if (targetDevice)
    objc_msgSend(v51, "encodeInteger:forKey:", targetDevice, CFSTR("target"));
  remoteDevice = self->_remoteDevice;
  if (remoteDevice)
    objc_msgSend(v51, "encodeObject:forKey:", remoteDevice, CFSTR("remote"));
  if (self->_requiresRemoteDeviceWake)
    objc_msgSend(v51, "encodeBool:forKey:", 1, CFSTR("remoteDeviceWake"));
  if (self->_supportsAnyApplication)
    objc_msgSend(v51, "encodeBool:forKey:", 1, CFSTR("anyApp"));
  if (self->_requestsApplicationLaunch)
    objc_msgSend(v51, "encodeBool:forKey:", 1, CFSTR("appLaunch"));
  if (self->_requestsExtensionLaunch)
    objc_msgSend(v51, "encodeBool:forKey:", 1, CFSTR("extLaunch"));
  extensionIdentifier = self->_extensionIdentifier;
  if (extensionIdentifier)
    objc_msgSend(v51, "encodeObject:forKey:", extensionIdentifier, CFSTR("extId"));
  if (self->_shouldBePersisted)
    objc_msgSend(v51, "encodeBool:forKey:", 1, CFSTR("persist"));
  launchReason = self->_launchReason;
  if (launchReason)
    objc_msgSend(v51, "encodeObject:forKey:", launchReason, CFSTR("launchReason"));
  relatedApplications = self->_relatedApplications;
  if (relatedApplications)
  {
    objc_msgSend(v51, "encodeObject:forKey:", relatedApplications, CFSTR("related"));
    objc_msgSend(v51, "encodeInteger:forKey:", self->_relevancy, CFSTR("relevancy"));
  }
  involvedProcesses = self->_involvedProcesses;
  if (involvedProcesses)
    objc_msgSend(v51, "encodeObject:forKey:", involvedProcesses, CFSTR("involvedProcesses"));
  groupName = self->_groupName;
  if (groupName)
    objc_msgSend(v51, "encodeObject:forKey:", groupName, CFSTR("groupName"));
  userInfo = self->_userInfo;
  if (userInfo)
  {
    -[NSDictionary objectForKeyedSubscript:](userInfo, "objectForKeyedSubscript:", CFSTR("progress"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = (void *)-[NSDictionary mutableCopy](self->_userInfo, "mutableCopy");
      v20 = [_DASActivityProgressWrapper alloc];
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("progress"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[_DASActivityProgressWrapper initWithProgress:](v20, "initWithProgress:", v21);
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v22, CFSTR("progress"));

      v23 = (void *)objc_msgSend(v19, "copy");
      objc_msgSend(v51, "encodeObject:forKey:", v23, CFSTR("userInfo"));

    }
    else
    {
      objc_msgSend(v51, "encodeObject:forKey:", self->_userInfo, CFSTR("userInfo"));
    }
  }
  bundleId = self->_bundleId;
  if (bundleId)
    objc_msgSend(v51, "encodeObject:forKey:", bundleId, CFSTR("bundleID"));
  -[_DASActivity startDate](self, "startDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[_DASActivity startDate](self, "startDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "encodeObject:forKey:", v26, CFSTR("startDate"));

  }
  submitDate = self->_submitDate;
  if (submitDate)
    objc_msgSend(v51, "encodeObject:forKey:", submitDate, CFSTR("submitDate"));
  -[_DASActivity lastScored](self, "lastScored");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v51, "encodeDouble:forKey:", CFSTR("lastScore"), self->_lastComputedScore);
    -[_DASActivity lastScored](self, "lastScored");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "encodeObject:forKey:", v29, CFSTR("lastScored"));

  }
  -[_DASActivity predictedOptimalStartDate](self, "predictedOptimalStartDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[_DASActivity predictedOptimalStartDate](self, "predictedOptimalStartDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "encodeObject:forKey:", v31, CFSTR("predStart"));

    objc_msgSend(v51, "encodeDouble:forKey:", CFSTR("predOpt"), self->_predictedOptimalScore);
  }
  motionState = self->_motionState;
  if (motionState)
    objc_msgSend(v51, "encodeInteger:forKey:", motionState, CFSTR("motionState"));
  if (self->_delayedStart)
    objc_msgSend(v51, "encodeBool:forKey:", 1, CFSTR("delayedStart"));
  if (self->_pid >= 1)
    objc_msgSend(v51, "encodeInt:forKey:");
  clientDataBudgetName = self->_clientDataBudgetName;
  if (clientDataBudgetName)
    objc_msgSend(v51, "encodeObject:forKey:", clientDataBudgetName, CFSTR("clientCellBudget"));
  clientName = self->_clientName;
  if (clientName)
    objc_msgSend(v51, "encodeObject:forKey:", clientName, CFSTR("clientName"));
  if (self->_deferred)
    objc_msgSend(v51, "encodeBool:forKey:", 1, CFSTR("deferred"));
  if (self->_percentCompleted > 0.0)
    objc_msgSend(v51, "encodeDouble:forKey:", CFSTR("percentCompleted"));
  completionStatus = self->_completionStatus;
  if (completionStatus)
    objc_msgSend(v51, "encodeInteger:forKey:", completionStatus, CFSTR("completionStatus"));
  preClearedMode = self->_preClearedMode;
  if (preClearedMode)
    objc_msgSend(v51, "encodeInteger:forKey:", preClearedMode, CFSTR("preCleared"));
  if (self->_requiresBuddyComplete)
    objc_msgSend(v51, "encodeBool:forKey:", 1, CFSTR("buddyComplete"));
  userIdentifier = self->_userIdentifier;
  if ((_DWORD)userIdentifier)
    objc_msgSend(v51, "encodeInt64:forKey:", userIdentifier, CFSTR("userIdentifier"));
  if (self->_runOnAppForeground)
    objc_msgSend(v51, "encodeBool:forKey:", 1, CFSTR("runOnAppFG"));
  widgetBudgetID = self->_widgetBudgetID;
  if (widgetBudgetID)
    objc_msgSend(v51, "encodeObject:forKey:", widgetBudgetID, CFSTR("widgetBudgetID"));
  widgetID = self->_widgetID;
  if (widgetID)
    objc_msgSend(v51, "encodeObject:forKey:", widgetID, CFSTR("widgetID"));
  rateLimitConfigurationName = self->_rateLimitConfigurationName;
  if (rateLimitConfigurationName)
    objc_msgSend(v51, "encodeObject:forKey:", rateLimitConfigurationName, CFSTR("rateLimitConfigName"));
  limitationResponse = self->_limitationResponse;
  if (limitationResponse)
    objc_msgSend(v51, "encodeObject:forKey:", limitationResponse, CFSTR("limitationResponses"));
  serviceName = self->_serviceName;
  if (serviceName)
    objc_msgSend(v51, "encodeObject:forKey:", serviceName, CFSTR("serviceNameKey"));
  if (self->_backlogged)
    objc_msgSend(v51, "encodeBool:forKey:", 1, CFSTR("backlogged"));
  activityType = self->_activityType;
  if (activityType)
    objc_msgSend(v51, "encodeObject:forKey:", activityType, CFSTR("activityType"));
  featureCodes = self->_featureCodes;
  if (featureCodes)
    objc_msgSend(v51, "encodeObject:forKey:", featureCodes, CFSTR("featureCodes"));
  fastPass = self->_fastPass;
  if (fastPass)
    objc_msgSend(v51, "encodeObject:forKey:", fastPass, CFSTR("fastPass"));
  producedResultIdentifiers = self->_producedResultIdentifiers;
  if (producedResultIdentifiers)
    objc_msgSend(v51, "encodeObject:forKey:", producedResultIdentifiers, CFSTR("producedResultIdentifiers"));
  dependencies = self->_dependencies;
  if (dependencies)
    objc_msgSend(v51, "encodeObject:forKey:", dependencies, CFSTR("dependencies"));
  diskVolume = self->_diskVolume;
  if (diskVolume)
    objc_msgSend(v51, "encodeObject:forKey:", diskVolume, CFSTR("diskVolume"));
  v49 = v51;
  if (self->_lastDenialValue)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "encodeObject:forKey:", v50, CFSTR("lastDenialValue"));

    v49 = v51;
  }

}

- (NSDate)predictedOptimalStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 312, 1);
}

- (NSString)remoteDevice
{
  return self->_remoteDevice;
}

- (NSDate)lastScored
{
  return (NSDate *)objc_getProperty(self, a2, 328, 1);
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setLaunchReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void)setClientProvidedStartDate:(id)a3
{
  -[_DASActivity setObject:forUserInfoKey:](self, "setObject:forUserInfoKey:", a3, CFSTR("clientStartDate"));
}

- (void)setClientProvidedIdentifier:(id)a3
{
  -[_DASActivity setObject:forUserInfoKey:](self, "setObject:forUserInfoKey:", a3, CFSTR("clientID"));
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (BOOL)isEqual:(id)a3
{
  _DASActivity *v4;
  NSUUID *uuid;
  void *v6;
  char v7;

  v4 = (_DASActivity *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (-[_DASActivity isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    uuid = self->_uuid;
    -[_DASActivity uuid](v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSUUID isEqual:](uuid, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)beforeApplicationLaunch
{
  void *v2;
  void *v3;
  char v4;

  -[_DASActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("BeforeApplicationLaunch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)updateGroupIfNecessary
{
  NSString *groupName;
  NSString **p_groupName;
  __CFString *v5;
  __CFString **v6;

  p_groupName = &self->_groupName;
  groupName = self->_groupName;
  if (!groupName
    || -[NSString isEqualToString:](groupName, "isEqualToString:", _DASDefaultNetworkGroupName)
    || -[NSString isEqualToString:](*p_groupName, "isEqualToString:", _DASDefaultGroupName)
    || -[NSString isEqualToString:](*p_groupName, "isEqualToString:", _DASDefaultRemoteGroupName))
  {
    if (self->_targetDevice)
    {
      v5 = _DASDefaultRemoteGroupName;
    }
    else
    {
      v6 = &_DASDefaultNetworkGroupName;
      if (!self->_requiresNetwork)
        v6 = &_DASDefaultGroupName;
      v5 = *v6;
    }
    objc_storeStrong((id *)p_groupName, v5);
  }
}

- (BOOL)allowsUnrestrictedBackgroundLaunches
{
  void *v4;
  char v5;

  if (-[_DASActivity isContactTracingBackgroundActivity](self, "isContactTracingBackgroundActivity"))
    return 1;
  -[_DASActivity launchReason](self, "launchReason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.das.bghealthresearch"));

  return v5;
}

- (BOOL)timewiseEligibleAtDate:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  double v7;

  v4 = a3;
  if (-[_DASActivity isSoftwareUpdateActivity](self, "isSoftwareUpdateActivity")
    && !-[_DASActivity useStatisticalModelForTriggersRestart](self, "useStatisticalModelForTriggersRestart")
    || self->_beforeDaysFirstActivity)
  {
    v5 = 1;
  }
  else
  {
    -[_DASActivity startAfter](self, "startAfter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v6);
    v5 = v7 > 0.0 || -[_DASActivity userRequestedBackupTask](self, "userRequestedBackupTask");

  }
  return v5;
}

- (NSDate)startAfter
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (BOOL)isSoftwareUpdateActivity
{
  void *v3;
  BOOL v4;
  void *v5;

  -[_DASActivity name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.softwareupdate.autoinstall.startInstall")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[_DASActivity name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (objc_msgSend(v5, "hasSuffix:", CFSTR("com.apple.SUOSUScheduler.tonight.install")) & 1) != 0
      || -[_DASActivity blockRebootActivitiesForSU](self, "blockRebootActivitiesForSU");

  }
  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)launchReason
{
  return self->_launchReason;
}

- (BOOL)useStatisticalModelForTriggersRestart
{
  void *v2;
  void *v3;
  char v4;

  -[_DASActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("UseStatisticalModelForTriggersRestart"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isContactTracingBackgroundActivity
{
  void *v2;
  void *v3;
  char v4;

  -[_DASActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("isCTActivity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)blockRebootActivitiesForSU
{
  void *v2;
  void *v3;
  char v4;

  -[_DASActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("BlockRebootActivitiesForSU"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)userRequestedBackupTask
{
  void *v2;
  void *v3;
  char v4;

  -[_DASActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("UserRequestedBackupActivity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)requiresSignificantUserInactivity
{
  void *v2;
  void *v3;
  char v4;

  -[_DASActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.das.significantInactivity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_clientDataBudgetName, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_widgetID, 0);
  objc_storeStrong((id *)&self->_widgetBudgetID, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_policyResponseMetadata, 0);
  objc_storeStrong((id *)&self->_startConditions, 0);
  objc_storeStrong((id *)&self->_limitationResponse, 0);
  objc_storeStrong((id *)&self->_suspendRequestDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_submitDate, 0);
  objc_storeStrong((id *)&self->_lastScored, 0);
  objc_storeStrong((id *)&self->_predictedOptimalStartDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dependencies, 0);
  objc_storeStrong((id *)&self->_producedResultIdentifiers, 0);
  objc_storeStrong((id *)&self->_fastPass, 0);
  objc_storeStrong((id *)&self->_featureCodes, 0);
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_launchReason, 0);
  objc_storeStrong((id *)&self->_rateLimitConfigurationName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_diskVolume, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_schedulerRecommendedApplications, 0);
  objc_storeStrong((id *)&self->_involvedProcesses, 0);
  objc_storeStrong((id *)&self->_relatedApplications, 0);
  objc_storeStrong((id *)&self->_startBefore, 0);
  objc_storeStrong((id *)&self->_startAfter, 0);
  objc_storeStrong((id *)&self->_fileProtection, 0);
  objc_storeStrong(&self->_suspendHandler, 0);
  objc_storeStrong(&self->_startHandler, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (BOOL)requiresDeviceInactivity
{
  return self->_requiresDeviceInactivity;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (BOOL)supportsAnyApplication
{
  return self->_supportsAnyApplication;
}

- (void)setFileProtection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)widgetID
{
  return self->_widgetID;
}

- (void)setRequiresInexpensiveNetworking:(BOOL)a3
{
  self->_requiresInexpensiveNetworking = a3;
}

- (void)setDataBudgeted:(BOOL)a3
{
  self->_dataBudgeted = a3;
}

- (void)setBudgeted:(BOOL)a3
{
  self->_budgeted = a3;
}

- (NSDate)submitDate
{
  return self->_submitDate;
}

- (int64_t)motionState
{
  return self->_motionState;
}

- (void)setWidgetID:(id)a3
{
  objc_storeStrong((id *)&self->_widgetID, a3);
}

- (NSString)widgetBudgetID
{
  return self->_widgetBudgetID;
}

- (BOOL)beforeDaysFirstActivity
{
  return self->_beforeDaysFirstActivity;
}

- (BOOL)backlogged
{
  return self->_backlogged;
}

- (BOOL)requiresBuddyComplete
{
  return self->_requiresBuddyComplete;
}

- (void)setMemoryIntensive:(BOOL)a3
{
  if (a3)
    self->_requiresDeviceInactivity = 1;
  self->_memoryIntensive = a3;
}

- (void)setDiskIntensive:(BOOL)a3
{
  if (a3)
    self->_requiresDeviceInactivity = 1;
  self->_diskIntensive = a3;
}

- (void)setCpuIntensive:(BOOL)a3
{
  if (a3)
    self->_requiresDeviceInactivity = 1;
  self->_cpuIntensive = a3;
}

- (void)setRequiresDeviceInactivity:(BOOL)a3
{
  if (a3 || !self->_cpuIntensive && !self->_diskIntensive && !self->_aneIntensive && !self->_gpuIntensive)
    self->_requiresDeviceInactivity = a3;
}

- (BOOL)requestsExtensionLaunch
{
  return self->_requestsExtensionLaunch;
}

- (void)setSubmitDate:(id)a3
{
  objc_storeStrong((id *)&self->_submitDate, a3);
}

- (BOOL)requiresPlugin
{
  return self->_requiresPlugin;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (NSString)rateLimitConfigurationName
{
  return self->_rateLimitConfigurationName;
}

- (int64_t)preClearedMode
{
  return self->_preClearedMode;
}

- (void)setGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_groupName, a3);
  -[_DASActivity updateGroupIfNecessary](self, "updateGroupIfNecessary");
}

- (void)setClientName:(id)a3
{
  objc_storeStrong((id *)&self->_clientName, a3);
}

- (BOOL)shouldBePersisted
{
  return self->_shouldBePersisted;
}

- (void)setUserIdentifier:(unsigned int)a3
{
  self->_userIdentifier = a3;
}

- (void)setPredictedOptimalStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (void)setPredictedOptimalScore:(double)a3
{
  self->_predictedOptimalScore = a3;
}

- (void)setBypassesPredictions:(BOOL)a3
{
  self->_bypassesPredictions = a3;
}

- (BOOL)isUpload
{
  return self->_isUpload;
}

- (unint64_t)uploadSize
{
  return self->_uploadSize;
}

- (unint64_t)downloadSize
{
  return self->_downloadSize;
}

- (_DASAssertion)assertion
{
  return self->_assertion;
}

- (void)setRelatedApplications:(id)a3
{
  objc_storeStrong((id *)&self->_relatedApplications, a3);
}

- (BOOL)suspendable
{
  return self->_suspendable;
}

- (NSArray)schedulerRecommendedApplications
{
  return self->_schedulerRecommendedApplications;
}

- (int64_t)relevancy
{
  return self->_relevancy;
}

- (double)predictedOptimalScore
{
  return self->_predictedOptimalScore;
}

- (BOOL)memoryIntensive
{
  return self->_memoryIntensive;
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (BOOL)diskIntensive
{
  return self->_diskIntensive;
}

- (BOOL)cpuIntensive
{
  return self->_cpuIntensive;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (BOOL)beforeUserIsActive
{
  return self->_beforeUserIsActive;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void)setStartHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setHandlerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_handlerQueue, a3);
}

- (BOOL)dataBudgeted
{
  return self->_dataBudgeted;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (unint64_t)transferSize
{
  if (self->_requiresNetwork && -[_DASActivity noTransferSizeSpecified](self, "noTransferSizeSpecified"))
    return _DASActivityTransferSizeSmall;
  else
    return self->_downloadSize + self->_uploadSize;
}

- (BOOL)noTransferSizeSpecified
{
  return !self->_uploadSize && self->_downloadSize == 0;
}

- (void)setUploadSize:(unint64_t)a3
{
  self->_uploadSize = a3;
}

- (void)setPreClearedMode:(int64_t)a3
{
  self->_preClearedMode = a3;
}

- (void)setDownloadSize:(unint64_t)a3
{
  self->_downloadSize = a3;
}

- (void)setRunOnAppForeground:(BOOL)a3
{
  self->_runOnAppForeground = a3;
}

- (void)setRequiresBuddyComplete:(BOOL)a3
{
  self->_requiresBuddyComplete = a3;
}

- (void)setPreventDeviceSleep:(BOOL)a3
{
  self->_preventDeviceSleep = a3;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (void)setDelayedStart:(BOOL)a3
{
  self->_delayedStart = a3;
}

- (void)setInvolvedProcesses:(id)a3
{
  objc_storeStrong((id *)&self->_involvedProcesses, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setDarkWakeEligible:(BOOL)a3
{
  if (!a3)
    self->_beforeDaysFirstActivity = 0;
  self->_darkWakeEligible = a3;
}

- (void)setBeforeDaysFirstActivity:(BOOL)a3
{
  if (a3)
    self->_darkWakeEligible = 1;
  self->_beforeDaysFirstActivity = a3;
}

- (void)setSuspendHandler:(id)a3
{
  void *v4;
  id suspendHandler;
  id v6;

  self->_suspendable = a3 != 0;
  v6 = a3;
  v4 = (void *)MEMORY[0x1B5E11660]();
  suspendHandler = self->_suspendHandler;
  self->_suspendHandler = v4;

}

- (BOOL)dataBudgetingEnabled
{
  int64_t preClearedMode;

  preClearedMode = self->_preClearedMode;
  if (self->_budgeted)
    return preClearedMode != 2;
  else
    return preClearedMode == 1;
}

- (void)setSchedulingPriority:(unint64_t)a3
{
  self->_schedulingPriority = +[_DASActivity cleanSchedulingPriority:](_DASActivity, "cleanSchedulingPriority:", a3);
}

- (void)setAllowsCompanionExpensiveNetworking:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  if (a3)
  {
    -[_DASActivity userInfo](self, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[_DASActivity userInfo](self, "userInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v5, "mutableCopy");

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("allowsCompanionExpensive"));

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v11);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v10 = (void *)v9;
    -[_DASActivity setUserInfo:](self, "setUserInfo:", v9);

    return;
  }
  if (-[_DASActivity allowsCompanionExpensiveNetworking](self, "allowsCompanionExpensiveNetworking"))
  {
    -[_DASActivity userInfo](self, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[_DASActivity userInfo](self, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v7, "mutableCopy");

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v11, "removeObjectForKey:", CFSTR("allowsCompanionExpensive"));
    v9 = objc_msgSend(v11, "copy");
    goto LABEL_12;
  }
}

- (void)setUserRequestedBackupTask:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  -[_DASActivity userInfo](self, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_DASActivity userInfo](self, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v6, "mutableCopy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("UserRequestedBackupActivity"));

  }
  else
  {
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("UserRequestedBackupActivity"));
  }
  v8 = (void *)objc_msgSend(v9, "copy");
  -[_DASActivity setUserInfo:](self, "setUserInfo:", v8);

}

- (void)setCancelAfterDeadline:(BOOL)a3
{
  self->_cancelAfterDeadline = a3;
}

- (_DASActivity)initWithName:(id)a3 priority:(unint64_t)a4 duration:(unint64_t)a5 startingAfter:(id)a6 startingBefore:(id)a7 userInfo:(id)a8
{
  id v15;
  id v16;
  id v17;
  _DASActivity *v18;
  _DASActivity *v19;
  uint64_t v20;
  uint64_t v21;
  NSDictionary *userInfo;
  uint64_t v23;
  NSUUID *uuid;
  id v26;
  objc_super v27;

  v26 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v27.receiver = self;
  v27.super_class = (Class)_DASActivity;
  v18 = -[_DASActivity init](&v27, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_name, a3);
    v19->_schedulingPriority = +[_DASActivity cleanSchedulingPriority:](_DASActivity, "cleanSchedulingPriority:", a4);
    v19->_duration = +[_DASActivity cleanDuration:](_DASActivity, "cleanDuration:", a5);
    objc_storeStrong((id *)&v19->_startAfter, a6);
    objc_storeStrong((id *)&v19->_startBefore, a7);
    v20 = _DASActivityTransferSizeZero;
    v19->_uploadSize = _DASActivityTransferSizeZero;
    v19->_downloadSize = v20;
    v19->_motionState = _DASMotionStateAny;
    v19->_delayedStart = 0;
    v21 = objc_msgSend(v17, "copy");
    userInfo = v19->_userInfo;
    v19->_userInfo = (NSDictionary *)v21;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v23 = objc_claimAutoreleasedReturnValue();
    uuid = v19->_uuid;
    v19->_uuid = (NSUUID *)v23;

    -[_DASActivity updateGroupIfNecessary](v19, "updateGroupIfNecessary");
  }

  return v19;
}

+ (_DASActivity)activityWithName:(id)a3 priority:(unint64_t)a4 duration:(unint64_t)a5 startingAfter:(id)a6 startingBefore:(id)a7 userInfo:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a3;
  v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:priority:duration:startingAfter:startingBefore:userInfo:", v17, a4, a5, v16, v15, v14);

  return (_DASActivity *)v18;
}

+ (id)networkingActivityWithName:(id)a3 priority:(unint64_t)a4 transferSize:(unint64_t)a5 isUpload:(BOOL)a6 expensiveNetworkingAllowed:(BOOL)a7 startingAfter:(id)a8 startingBefore:(id)a9
{
  _BOOL4 v10;
  _BOOL8 v11;
  id v15;
  id v16;
  id v17;
  void *v18;

  v10 = a7;
  v11 = a6;
  v15 = a9;
  v16 = a8;
  v17 = a3;
  v18 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:priority:duration:startingAfter:startingBefore:userInfo:", v17, a4, _DASActivityDurationLong, v16, v15, 0);

  objc_msgSend(v18, "setRequiresNetwork:", 1);
  objc_msgSend(v18, "setDownloadSize:", a5);
  objc_msgSend(v18, "setIsUpload:", v11);
  objc_msgSend(v18, "setRequiresInexpensiveNetworking:", !v10);
  return v18;
}

+ (id)networkingActivityWithName:(id)a3 priority:(unint64_t)a4 downloadSize:(unint64_t)a5 uploadSize:(unint64_t)a6 expensiveNetworkingAllowed:(BOOL)a7 startingAfter:(id)a8 startingBefore:(id)a9
{
  _BOOL4 v10;
  id v15;
  id v16;
  id v17;
  void *v18;

  v10 = a7;
  v15 = a9;
  v16 = a8;
  v17 = a3;
  v18 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:priority:duration:startingAfter:startingBefore:userInfo:", v17, a4, _DASActivityDurationLong, v16, v15, 0);

  objc_msgSend(v18, "setRequiresNetwork:", 1);
  objc_msgSend(v18, "setDownloadSize:", a5);
  objc_msgSend(v18, "setUploadSize:", a6);
  objc_msgSend(v18, "setRequiresInexpensiveNetworking:", !v10);
  return v18;
}

+ (id)anyApplicationActivityWithName:(id)a3 priority:(unint64_t)a4 duration:(unint64_t)a5 startingAfter:(id)a6 startingBefore:(id)a7 limitedToApplications:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a3;
  v17 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:priority:duration:startingAfter:startingBefore:userInfo:", v16, a4, a5, v15, v14, 0);

  objc_msgSend(v17, "setSupportsAnyApplication:", 1);
  objc_msgSend(v17, "setRelatedApplications:", v13);

  return v17;
}

+ (id)applicationLaunchActivityWithName:(id)a3 priority:(unint64_t)a4 forApplication:(id)a5 withReason:(id)a6 duration:(unint64_t)a7 startingAfter:(id)a8 startingBefore:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v15 = a9;
  v16 = a8;
  v17 = a6;
  v18 = a5;
  v19 = a3;
  v20 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:priority:duration:startingAfter:startingBefore:userInfo:", v19, a4, a7, v16, v15, 0);

  objc_msgSend(v20, "setRequestsApplicationLaunch:", 1);
  objc_msgSend(v20, "setLaunchReason:", v17);

  v23[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setRelatedApplications:", v21);

  objc_msgSend(v20, "setBundleId:", v18);
  return v20;
}

+ (id)extensionLaunchActivityWithName:(id)a3 priority:(unint64_t)a4 forApplication:(id)a5 forExtensionIdentifier:(id)a6 withReason:(id)a7 duration:(unint64_t)a8 startingAfter:(id)a9 startingBefore:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v15 = a5;
  v16 = a6;
  v17 = a10;
  v18 = a9;
  v19 = a7;
  v20 = a3;
  v21 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:priority:duration:startingAfter:startingBefore:userInfo:", v20, a4, a8, v18, v17, 0);

  objc_msgSend(v21, "setRequestsExtensionLaunch:", 1);
  objc_msgSend(v21, "setLaunchReason:", v19);

  v22 = v16;
  if (v15)
  {
    v25[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setRelatedApplications:", v23);

    v22 = v15;
  }
  objc_msgSend(v21, "setExtensionIdentifier:", v22);

  return v21;
}

+ (id)extensionLaunchActivityWithName:(id)a3 priority:(unint64_t)a4 forApplication:(id)a5 withReason:(id)a6 duration:(unint64_t)a7 startingAfter:(id)a8 startingBefore:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  v15 = a9;
  v16 = a8;
  v17 = a6;
  v18 = a5;
  v19 = a3;
  objc_msgSend((id)objc_opt_class(), "extensionLaunchActivityWithName:priority:forApplication:forExtensionIdentifier:withReason:duration:startingAfter:startingBefore:", v19, a4, v18, 0, v17, a7, v16, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)extensionLaunchActivityWithName:(id)a3 priority:(unint64_t)a4 forExtensionIdentifier:(id)a5 withReason:(id)a6 duration:(unint64_t)a7 startingAfter:(id)a8 startingBefore:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  v15 = a9;
  v16 = a8;
  v17 = a6;
  v18 = a5;
  v19 = a3;
  objc_msgSend((id)objc_opt_class(), "extensionLaunchActivityWithName:priority:forApplication:forExtensionIdentifier:withReason:duration:startingAfter:startingBefore:", v19, a4, 0, v18, v17, a7, v16, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)launchWithTopic:(id)a3 forReason:(id)a4 withPayload:(id)a5 highPriority:(BOOL)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = v8;
  if (objc_msgSend(v8, "hasPrefix:", CFSTR("com.apple.icloud-container.")))
  {
    objc_msgSend(v8, "substringFromIndex:", objc_msgSend(CFSTR("com.apple.icloud-container."), "length"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.pushLaunch"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_class();
  v14 = _DASSchedulingPriorityBackground;
  v15 = _DASActivityDurationVeryShort;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 86400.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "applicationLaunchActivityWithName:priority:forApplication:withReason:duration:startingAfter:startingBefore:", v12, v14, v11, v10, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setRequiresNetwork:", 1);
  +[_DASFileProtection completeUntilFirstUserAuthentication](_DASFileProtection, "completeUntilFirstUserAuthentication");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFileProtection:", v19);

  v23 = CFSTR("notificationpayload");
  v24[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setUserInfo:", v20);
  if (!a6)
    objc_msgSend(v18, "setSchedulingPriority:", _DASSchedulingPriorityMaintenance);

  return v18;
}

+ (id)launchForRemoteNotificationWithTopic:(id)a3 withPayload:(id)a4 highPriority:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "launchWithTopic:forReason:withPayload:highPriority:", v8, CFSTR("com.apple.das.launchreason.push"), v7, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSMutableDictionary)policyResponseMetadata
{
  NSMutableDictionary *policyResponseMetadata;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  policyResponseMetadata = self->_policyResponseMetadata;
  if (!policyResponseMetadata)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_policyResponseMetadata;
    self->_policyResponseMetadata = v4;

    policyResponseMetadata = self->_policyResponseMetadata;
  }
  return policyResponseMetadata;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = +[_DASActivity cleanDuration:](_DASActivity, "cleanDuration:", a3);
}

+ (unint64_t)cleanTransferSize:(unint64_t)a3
{
  unint64_t result;

  result = _DASActivityTransferSizeZero;
  if (_DASActivityTransferSizeZero < a3)
  {
    result = _DASActivityTransferSizeVerySmall;
    if (_DASActivityTransferSizeVerySmall < a3)
    {
      result = _DASActivityTransferSizeSmall;
      if (_DASActivityTransferSizeSmall < a3)
      {
        result = _DASActivityTransferSizeModerate;
        if (_DASActivityTransferSizeModerate < a3)
        {
          result = _DASActivityTransferSizeLarge;
          if (_DASActivityTransferSizeLarge < a3)
          {
            if (_DASActivityTransferSizeVeryLarge >= a3)
              return _DASActivityTransferSizeVeryLarge;
            else
              return _DASActivityTransferSizeGigantic;
          }
        }
      }
    }
  }
  return result;
}

- (void)setTransferSize:(unint64_t)a3
{
  if (self->_isUpload)
  {
    self->_uploadSize = a3;
    a3 = _DASActivityTransferSizeZero;
  }
  self->_downloadSize = a3;
}

- (unint64_t)transferSizeType
{
  unint64_t v4;
  unint64_t v5;

  if (!self->_requiresNetwork || -[_DASActivity noTransferSizeSpecified](self, "noTransferSizeSpecified"))
    return 0;
  v4 = -[_DASActivity transferSize](self, "transferSize");
  v5 = 30;
  if (v4 < _DASActivityTransferSizeVeryLarge)
    v5 = 20;
  if (v4 >= _DASActivityTransferSizeLarge)
    return v5;
  else
    return 10;
}

- (void)setANEIntensive:(BOOL)a3
{
  if (a3)
    self->_requiresDeviceInactivity = 1;
  self->_aneIntensive = a3;
}

- (void)setGPUIntensive:(BOOL)a3
{
  if (a3)
    self->_requiresDeviceInactivity = 1;
  self->_aneIntensive = a3;
}

- (void)setAfterUserIsInactive:(BOOL)a3
{
  if (a3)
  {
    self->_beforeUserIsActive = 0;
    self->_requiresDeviceInactivity = 1;
  }
  self->_afterUserIsInactive = a3;
}

- (void)setIsMLBackgroundActivity:(BOOL)a3
{
  if (a3)
  {
    -[_DASActivity setCpuIntensive:](self, "setCpuIntensive:", 1);
    -[_DASActivity setMemoryIntensive:](self, "setMemoryIntensive:", 1);
    -[_DASActivity setAneIntensive:](self, "setAneIntensive:", 1);
    -[_DASActivity setGpuIntensive:](self, "setGpuIntensive:", 1);
    -[_DASActivity setRequiresPlugin:](self, "setRequiresPlugin:", 1);
    -[_DASActivity setRequiresDeviceInactivity:](self, "setRequiresDeviceInactivity:", 1);
    -[_DASActivity setDuration:](self, "setDuration:", 900);
  }
}

- (void)setIsUpload:(BOOL)a3
{
  unint64_t v3;

  if (a3)
  {
    v3 = _DASActivityTransferSizeZero;
    self->_uploadSize = self->_downloadSize;
    self->_downloadSize = v3;
  }
  self->_isUpload = a3;
}

- (void)setRequestsExtensionLaunch:(BOOL)a3
{
  if (a3)
  {
    self->_shouldBePersisted = 1;
    self->_suspendable = 1;
  }
  self->_requestsExtensionLaunch = a3;
}

- (void)setHasMagneticSensitivity:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  if (a3)
  {
    self->_requiresPlugin = 0;
    -[_DASActivity userInfo](self, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[_DASActivity userInfo](self, "userInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v5, "mutableCopy");

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("MagneticInterferenceSensitivity"));

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v11);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v10 = (void *)v9;
    -[_DASActivity setUserInfo:](self, "setUserInfo:", v9);

    return;
  }
  if (-[_DASActivity hasMagneticSensitivity](self, "hasMagneticSensitivity"))
  {
    -[_DASActivity userInfo](self, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[_DASActivity userInfo](self, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v7, "mutableCopy");

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v11, "removeObjectForKey:", CFSTR("MagneticInterferenceSensitivity"));
    v9 = objc_msgSend(v11, "copy");
    goto LABEL_12;
  }
}

- (BOOL)allowsCompanionExpensiveNetworking
{
  void *v2;
  void *v3;
  char v4;

  -[_DASActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("allowsCompanionExpensive"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setBlockRebootActivitiesForSU:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  -[_DASActivity userInfo](self, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_DASActivity userInfo](self, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v6, "mutableCopy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("BlockRebootActivitiesForSU"));

  }
  else
  {
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("BlockRebootActivitiesForSU"));
  }
  v8 = (void *)objc_msgSend(v9, "copy");
  -[_DASActivity setUserInfo:](self, "setUserInfo:", v8);

}

- (void)setUseStatisticalModelForTriggersRestart:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  -[_DASActivity userInfo](self, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_DASActivity userInfo](self, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v6, "mutableCopy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("UseStatisticalModelForTriggersRestart"));

  }
  else
  {
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("UseStatisticalModelForTriggersRestart"));
  }
  v8 = (void *)objc_msgSend(v9, "copy");
  -[_DASActivity setUserInfo:](self, "setUserInfo:", v8);

}

- (void)setPercentCompleted:(double)a3
{
  double v3;

  v3 = 0.0;
  if (a3 < 0.0 || (v3 = 0.999, self->_percentCompleted > 0.999))
    self->_percentCompleted = v3;
}

- (BOOL)isSilentPush
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;

  -[_DASActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("notificationpayload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("aps"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("badge"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = 0;
      }
      else
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sound"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v7 = 0;
        }
        else
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("alert"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v9 == 0;

        }
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)skipEvaluationIfUnplugged
{
  return self->_requiresPlugin && !self->_triggersRestart;
}

- (void)setRequestsNewsstandLaunch:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a3)
  {
    -[_DASActivity userInfo](self, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[_DASActivity userInfo](self, "userInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v5, "mutableCopy");

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E6259658, CFSTR("newsstand"));
LABEL_12:
    v8 = (void *)objc_msgSend(v9, "copy");
    -[_DASActivity setUserInfo:](self, "setUserInfo:", v8);

    return;
  }
  if (-[_DASActivity requestsNewsstandLaunch](self, "requestsNewsstandLaunch"))
  {
    -[_DASActivity userInfo](self, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[_DASActivity userInfo](self, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v7, "mutableCopy");

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v9, "removeObjectForKey:", CFSTR("newsstand"));
    goto LABEL_12;
  }
}

- (void)setTargetDevice:(int64_t)a3
{
  self->_targetDevice = a3;
  -[_DASActivity updateGroupIfNecessary](self, "updateGroupIfNecessary");
}

- (NSString)clientProvidedTitle
{
  void *v2;
  void *v3;

  -[_DASActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("clientProvidedTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setClientProvidedTitle:(id)a3
{
  -[_DASActivity setObject:forUserInfoKey:](self, "setObject:forUserInfoKey:", a3, CFSTR("clientProvidedTitle"));
}

- (NSString)clientProvidedReason
{
  void *v2;
  void *v3;

  -[_DASActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("clientProvidedReason"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setClientProvidedReason:(id)a3
{
  -[_DASActivity setObject:forUserInfoKey:](self, "setObject:forUserInfoKey:", a3, CFSTR("clientProvidedReason"));
}

- (NSString)clientProvidedIconBundleIdentifier
{
  void *v2;
  void *v3;

  -[_DASActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("clientProvidedIconBundleIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSProgress)progress
{
  void *v2;
  void *v3;

  -[_DASActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("progress"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSProgress *)v3;
}

- (void)setProgress:(id)a3
{
  -[_DASActivity setObject:forUserInfoKey:](self, "setObject:forUserInfoKey:", a3, CFSTR("progress"));
}

- (void)setBeforeApplicationLaunch:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (a3)
  {
    -[_DASActivity userInfo](self, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[_DASActivity userInfo](self, "userInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v5, "mutableCopy");

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("BeforeApplicationLaunch"));

LABEL_12:
    v9 = (void *)objc_msgSend(v10, "copy");
    -[_DASActivity setUserInfo:](self, "setUserInfo:", v9);

    return;
  }
  if (-[_DASActivity beforeApplicationLaunch](self, "beforeApplicationLaunch"))
  {
    -[_DASActivity userInfo](self, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[_DASActivity userInfo](self, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v7, "mutableCopy");

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v10, "removeObjectForKey:", CFSTR("BeforeApplicationLaunch"));
    goto LABEL_12;
  }
}

- (void)setConstraintsWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD applier[5];
  id v11;

  v4 = a3;
  -[_DASActivity userInfo](self, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_DASActivity userInfo](self, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  applier[0] = MEMORY[0x1E0C809B0];
  applier[1] = 3221225472;
  applier[2] = __48___DASActivity_setConstraintsWithXPCDictionary___block_invoke;
  applier[3] = &unk_1E624B888;
  applier[4] = self;
  v9 = v7;
  v11 = v9;
  xpc_dictionary_apply(v4, applier);

  if (objc_msgSend(v9, "count"))
  {
    v8 = (void *)objc_msgSend(v9, "copy");
    -[_DASActivity setUserInfo:](self, "setUserInfo:", v8);

  }
}

- (BOOL)isCPUIntensive
{
  void *v3;

  -[_DASActivity fastPass](self, "fastPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return !v3 && self->_cpuIntensive;
}

- (BOOL)isMemoryIntensive
{
  void *v3;

  -[_DASActivity fastPass](self, "fastPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return !v3 && self->_memoryIntensive;
}

- (BOOL)isDiskIntensive
{
  void *v3;

  -[_DASActivity fastPass](self, "fastPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return !v3 && self->_diskIntensive;
}

- (BOOL)isANEIntensive
{
  void *v3;

  -[_DASActivity fastPass](self, "fastPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return !v3 && self->_aneIntensive;
}

- (BOOL)isGPUIntensive
{
  void *v3;

  -[_DASActivity fastPass](self, "fastPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return !v3 && self->_gpuIntensive;
}

- (id)submittedFileProtection
{
  return self->_fileProtection;
}

- (double)compatibilityWith:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  uint64_t v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  NSString *bundleId;
  void *v39;
  int v40;
  int64_t relevancy;
  void *v42;
  void *v43;
  NSArray *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  uint64_t v49;
  uint64_t v50;
  _BOOL4 v51;
  unint64_t *p_downloadSize;
  unint64_t v53;
  double v54;
  double v55;
  char v57;
  int v58;
  _BOOL4 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = 1.0;
  if (-[_DASActivity isEqual:](self, "isEqual:", v7))
    goto LABEL_79;
  -[_DASActivity widgetID](self, "widgetID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_msgSend(v7, "widgetID"), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[_DASActivity widgetBudgetID](self, "widgetBudgetID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {

      if (v9)
      goto LABEL_13;
    }
    objc_msgSend(v7, "widgetBudgetID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    if (!v12)
      goto LABEL_13;
  }
  -[_DASActivity relatedApplications](self, "relatedApplications");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "relatedApplications");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v14, "isEqual:", v3);

  if ((v4 & 1) != 0)
    goto LABEL_79;
LABEL_13:
  v16 = -[_DASActivity isIntensive](self, "isIntensive");
  v17 = objc_msgSend(v7, "isIntensive");
  -[_DASActivity fastPass](self, "fastPass");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[_DASActivity fastPass](self, "fastPass");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "processingTaskIdentifiers");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend((id)v4, "containsObject:", v5) & 1) != 0)
    {

LABEL_16:
      v8 = -1.0;
      goto LABEL_79;
    }
  }
  objc_msgSend(v7, "fastPass");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v58 = v17;
    v59 = v16;
    objc_msgSend(v7, "fastPass");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "processingTaskIdentifiers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DASActivity name](self, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v21, "containsObject:", v22);

    if (v18)
    {

    }
    v8 = -1.0;
    v17 = v58;
    v16 = v59;
    if ((v57 & 1) != 0)
      goto LABEL_79;
  }
  else
  {

    if (v18)
    {

    }
  }
  v23 = 0.0;
  if ((v16 & v17) != 1)
  {
LABEL_47:
    if (!objc_msgSend(v7, "triggersRestart"))
      goto LABEL_52;
    objc_msgSend(v7, "startDate");
    v33 = objc_claimAutoreleasedReturnValue();
    v8 = -1.0;
    if (v33)
    {
      v34 = (void *)v33;
      objc_msgSend(v7, "startDate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "timeIntervalSinceNow");
      v37 = v36;

      if (v37 < 0.0)
        v37 = -v37;

      if (v37 >= 900.0)
      {
LABEL_52:
        bundleId = self->_bundleId;
        if (bundleId)
        {
          objc_msgSend(v7, "bundleId");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = -[NSString isEqual:](bundleId, "isEqual:", v39);

          if (v40)
            v23 = v23 + 0.5;
        }
        relevancy = self->_relevancy;
        if (relevancy == objc_msgSend(v7, "relevancy"))
        {
          if (self->_relatedApplications)
          {
            objc_msgSend(v7, "relatedApplications");
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            if (v42)
            {
              objc_msgSend(v7, "relatedApplications");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = 0u;
              v61 = 0u;
              v62 = 0u;
              v63 = 0u;
              v44 = self->_relatedApplications;
              v45 = -[NSArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
              if (v45)
              {
                v46 = v45;
                v47 = *(_QWORD *)v61;
                do
                {
                  for (i = 0; i != v46; ++i)
                  {
                    if (*(_QWORD *)v61 != v47)
                      objc_enumerationMutation(v44);
                    if (objc_msgSend(v43, "containsObject:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i)))
                      v23 = v23 + 0.1;
                  }
                  v46 = -[NSArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
                }
                while (v46);
              }

            }
          }
        }
        if (self->_requiresNetwork && objc_msgSend(v7, "requiresNetwork"))
        {
          if (objc_msgSend(v7, "noTransferSizeSpecified"))
            v49 = _DASActivityTransferSizeSmall;
          else
            v49 = objc_msgSend(v7, "downloadSize");
          v50 = v49 + 2 * objc_msgSend(v7, "uploadSize");
          v51 = -[_DASActivity noTransferSizeSpecified](self, "noTransferSizeSpecified");
          p_downloadSize = &self->_downloadSize;
          if (v51)
            p_downloadSize = (unint64_t *)&_DASActivityTransferSizeSmall;
          v53 = *p_downloadSize + 2 * self->_uploadSize;
          v54 = log((double)(unint64_t)(_DASActivityTransferSizeSmall * _DASActivityTransferSizeSmall));
          v23 = v23 + fmax((v54 - log((double)(v53 * v50))) / v54, 0.0);
        }
        v55 = 1.0;
        if (v23 <= 1.0)
          v55 = v23;
        v8 = fmax(v55, -1.0);
      }
    }
    goto LABEL_79;
  }
  v24 = -[_DASActivity isCPUIntensive](self, "isCPUIntensive");
  if (-[_DASActivity isMemoryIntensive](self, "isMemoryIntensive"))
    v24 |= 2uLL;
  if (-[_DASActivity isDiskIntensive](self, "isDiskIntensive"))
    v24 |= 4uLL;
  if (-[_DASActivity isANEIntensive](self, "isANEIntensive"))
    v24 |= 8uLL;
  if (-[_DASActivity isGPUIntensive](self, "isGPUIntensive"))
    v24 |= 0x10uLL;
  v25 = objc_msgSend(v7, "isCPUIntensive");
  if (objc_msgSend(v7, "isMemoryIntensive"))
    v25 |= 2uLL;
  if (objc_msgSend(v7, "isDiskIntensive"))
    v25 |= 4uLL;
  if (objc_msgSend(v7, "isANEIntensive"))
    v25 |= 8uLL;
  v26 = objc_msgSend(v7, "isGPUIntensive");
  v27 = v25 | 0x10;
  if (!v26)
    v27 = v25;
  if ((v27 & v24) == 0)
  {
    v23 = 0.1;
    goto LABEL_47;
  }
  objc_msgSend(v7, "suspendRequestDate");
  v28 = objc_claimAutoreleasedReturnValue();
  if (!v28)
    goto LABEL_16;
  v29 = (void *)v28;
  objc_msgSend(v7, "suspendRequestDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "timeIntervalSinceNow");
  v32 = v31;

  if (v32 >= -10.0)
    v8 = -1.0;
  else
    v8 = 0.0;
LABEL_79:

  return v8;
}

- (BOOL)overdueAtDate:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  -[_DASActivity startBefore](self, "startBefore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  return v7 > 0.0;
}

- (BOOL)significantlyOverdueAtDate:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  -[_DASActivity startBefore](self, "startBefore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  return v7 > 86400.0;
}

- (BOOL)ckPushContentMatches:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_userInfo, "objectForKeyedSubscript:", CFSTR("notificationpayload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ck"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("notificationpayload"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ck"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __37___DASActivity_ckPushContentMatches___block_invoke;
    v12[3] = &unk_1E624B8D8;
    v13 = v9;
    v14 = &v15;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);
    v10 = *((unsigned __int8 *)v16 + 24);

  }
  else
  {
    v10 = *((unsigned __int8 *)v16 + 24);
  }
  _Block_object_dispose(&v15, 8);

  return v10 != 0;
}

- (BOOL)isIdenticalLaunchTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v15;

  v4 = a3;
  -[_DASActivity name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[_DASActivity relatedApplications](self, "relatedApplications");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "relatedApplications");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", v10))
    {
      -[_DASActivity launchReason](self, "launchReason");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "launchReason");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", v12))
      {
        -[_DASActivity launchReason](self, "launchReason");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.das.launchreason.push")))
          v13 = -[_DASActivity ckPushContentMatches:](self, "ckPushContentMatches:", v4);
        else
          v13 = 1;

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)keepsPrevious
{
  void *v3;
  char v4;
  void *v5;

  -[_DASActivity launchReason](self, "launchReason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.duetactivity.launchreason.nsurlsessioncomplete")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[_DASActivity launchReason](self, "launchReason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.duetactivity.launchreason.wkpendingdata"));

  }
  return v4;
}

- (BOOL)overwritesPrevious
{
  void *v3;
  char v4;
  void *v5;

  -[_DASActivity launchReason](self, "launchReason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.das.launchreason.push")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[_DASActivity launchReason](self, "launchReason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("_DASExtLaunchMLCompute"));

  }
  return v4;
}

- (BOOL)isContinuedProcessingTask
{
  void *v2;
  char v3;

  -[_DASActivity launchReason](self, "launchReason");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("com.apple.das.bgongoingprocessing"));

  return v3;
}

- (id)dependencyForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[_DASActivity dependencies](self, "dependencies", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)policyScores
{
  void *v3;
  _DASActivity *v4;
  NSMutableDictionary *policyResponseMetadata;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  objc_sync_enter(v4);
  policyResponseMetadata = v4->_policyResponseMetadata;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __28___DASActivity_policyScores__block_invoke;
  v8[3] = &unk_1E624B900;
  v6 = v3;
  v9 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](policyResponseMetadata, "enumerateKeysAndObjectsUsingBlock:", v8);

  objc_sync_exit(v4);
  return v6;
}

- (NSString)identifier
{
  NSString *identifier;
  NSString *v3;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;
  void *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t i;
  void *v18;
  NSString *v19;

  identifier = self->_identifier;
  if (identifier)
    goto LABEL_2;
  -[_DASActivity name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(":"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  if (v8 <= 1)
  {
    -[_DASActivity name](self, "name");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

    return v3;
  }
  v9 = v8;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v11, "numberFromString:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (v9 == 2)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CB37A0];
      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithString:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      for (i = 2; i != v9; ++i)
      {
        objc_msgSend(v16, "appendString:", CFSTR(":"));
        objc_msgSend(v7, "objectAtIndexedSubscript:", i);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "appendString:", v18);

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v16);
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();

    }
    v19 = self->_identifier;
    self->_identifier = v13;
    v3 = v13;

  }
  else
  {
    -[_DASActivity name](self, "name");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  if (v12)
  {
    identifier = self->_identifier;
LABEL_2:
    v3 = identifier;
  }
  return v3;
}

- (void)reconcileWithActivity:(id)a3
{
  id v4;
  _DASActivity *v5;
  void *v6;
  void *v7;
  char v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  void *v26;
  void *v27;
  id obj;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  obj = v4;
  objc_sync_enter(obj);
  -[_DASActivity uuid](v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) != 0)
  {
    -[_DASActivity percentCompleted](v5, "percentCompleted");
    v10 = v9;
    objc_msgSend(obj, "percentCompleted");
    if (v10 >= v11)
      v11 = v10;
    -[_DASActivity setPercentCompleted:](v5, "setPercentCompleted:", v11);
    objc_msgSend(obj, "lastComputedScore");
    -[_DASActivity setLastComputedScore:](v5, "setLastComputedScore:");
    objc_msgSend(obj, "predictedOptimalScore");
    -[_DASActivity setPredictedOptimalScore:](v5, "setPredictedOptimalScore:");
    -[_DASActivity setLastDenialValue:](v5, "setLastDenialValue:", objc_msgSend(obj, "lastDenialValue"));
    -[_DASActivity setWasForceRun:](v5, "setWasForceRun:", objc_msgSend(obj, "wasForceRun"));
    -[_DASActivity setBypassesPredictions:](v5, "setBypassesPredictions:", objc_msgSend(obj, "bypassesPredictions"));
    -[_DASActivity setStaticPriority:](v5, "setStaticPriority:", objc_msgSend(obj, "staticPriority"));
    objc_msgSend(obj, "assertion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DASActivity setAssertion:](v5, "setAssertion:", v12);

    objc_msgSend(obj, "submitDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    -[_DASActivity setSubmitDate:](v5, "setSubmitDate:", v14);

    objc_msgSend(obj, "predictedOptimalStartDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    -[_DASActivity setPredictedOptimalStartDate:](v5, "setPredictedOptimalStartDate:", v16);

    objc_msgSend(obj, "lastScored");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    -[_DASActivity setLastScored:](v5, "setLastScored:", v18);

    objc_msgSend(obj, "suspendRequestDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");
    -[_DASActivity setSuspendRequestDate:](v5, "setSuspendRequestDate:", v20);

    objc_msgSend(obj, "policyResponseMetadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");
    -[_DASActivity setPolicyResponseMetadata:](v5, "setPolicyResponseMetadata:", v22);

    objc_msgSend(obj, "startConditions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "mutableCopy");
    -[_DASActivity setStartConditions:](v5, "setStartConditions:", v24);

    objc_msgSend(obj, "limitationResponse");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "mutableCopy");
    -[_DASActivity setLimitationResponse:](v5, "setLimitationResponse:", v26);

    objc_msgSend(obj, "progress");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DASActivity setProgress:](v5, "setProgress:", v27);

  }
  objc_sync_exit(obj);

  objc_sync_exit(v5);
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (id)startHandler
{
  return self->_startHandler;
}

- (id)suspendHandler
{
  return self->_suspendHandler;
}

- (BOOL)requiresUnconstrainedNetworking
{
  return self->_requiresUnconstrainedNetworking;
}

- (void)setRequiresUnconstrainedNetworking:(BOOL)a3
{
  self->_requiresUnconstrainedNetworking = a3;
}

- (BOOL)aneIntensive
{
  return self->_aneIntensive;
}

- (void)setAneIntensive:(BOOL)a3
{
  self->_aneIntensive = a3;
}

- (BOOL)gpuIntensive
{
  return self->_gpuIntensive;
}

- (void)setGpuIntensive:(BOOL)a3
{
  self->_gpuIntensive = a3;
}

- (BOOL)afterUserIsInactive
{
  return self->_afterUserIsInactive;
}

- (void)setBeforeUserIsActive:(BOOL)a3
{
  self->_beforeUserIsActive = a3;
}

- (BOOL)preventDeviceSleep
{
  return self->_preventDeviceSleep;
}

- (void)setSupportsAnyApplication:(BOOL)a3
{
  self->_supportsAnyApplication = a3;
}

- (NSArray)involvedProcesses
{
  return self->_involvedProcesses;
}

- (void)setRelevancy:(int64_t)a3
{
  self->_relevancy = a3;
}

- (void)setSchedulerRecommendedApplications:(id)a3
{
  objc_storeStrong((id *)&self->_schedulerRecommendedApplications, a3);
}

- (void)setMotionState:(int64_t)a3
{
  self->_motionState = a3;
}

- (BOOL)delayedStart
{
  return self->_delayedStart;
}

- (NSString)diskVolume
{
  return self->_diskVolume;
}

- (void)setDiskVolume:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (BOOL)darkWakeEligible
{
  return self->_darkWakeEligible;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (void)setRateLimitConfigurationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void)setExtensionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void)setShouldBePersisted:(BOOL)a3
{
  self->_shouldBePersisted = a3;
}

- (BOOL)isMLBackgroundActivity
{
  return self->_isMLBackgroundActivity;
}

- (BOOL)shouldWakeDevice
{
  return self->_shouldWakeDevice;
}

- (void)setShouldWakeDevice:(BOOL)a3
{
  self->_shouldWakeDevice = a3;
}

- (void)setBacklogged:(BOOL)a3
{
  self->_backlogged = a3;
}

- (BOOL)runOnAppForeground
{
  return self->_runOnAppForeground;
}

- (void)setDeferred:(BOOL)a3
{
  self->_deferred = a3;
}

- (NSArray)featureCodes
{
  return self->_featureCodes;
}

- (void)setFeatureCodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (_DASFastPass)fastPass
{
  return self->_fastPass;
}

- (void)setFastPass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSSet)producedResultIdentifiers
{
  return self->_producedResultIdentifiers;
}

- (void)setProducedResultIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSSet)dependencies
{
  return self->_dependencies;
}

- (void)setDependencies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (double)lastComputedScore
{
  return self->_lastComputedScore;
}

- (void)setLastComputedScore:(double)a3
{
  self->_lastComputedScore = a3;
}

- (void)setSuspendable:(BOOL)a3
{
  self->_suspendable = a3;
}

- (NSDate)suspendRequestDate
{
  return (NSDate *)objc_getProperty(self, a2, 352, 1);
}

- (void)setSuspendRequestDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (NSMutableArray)limitationResponse
{
  return self->_limitationResponse;
}

- (void)setLimitationResponse:(id)a3
{
  objc_storeStrong((id *)&self->_limitationResponse, a3);
}

- (double)percentCompleted
{
  return self->_percentCompleted;
}

- (NSDictionary)startConditions
{
  return (NSDictionary *)objc_getProperty(self, a2, 376, 1);
}

- (void)setStartConditions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (void)setPolicyResponseMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_policyResponseMetadata, a3);
}

- (unint64_t)lastDenialValue
{
  return self->_lastDenialValue;
}

- (void)setLastDenialValue:(unint64_t)a3
{
  self->_lastDenialValue = a3;
}

- (BOOL)wasForceRun
{
  return self->_wasForceRun;
}

- (void)setWasForceRun:(BOOL)a3
{
  self->_wasForceRun = a3;
}

- (int)pid
{
  return self->_pid;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (int64_t)completionStatus
{
  return self->_completionStatus;
}

- (void)setCompletionStatus:(int64_t)a3
{
  self->_completionStatus = a3;
}

- (int64_t)urgencyLevel
{
  return self->_urgencyLevel;
}

- (void)setUrgencyLevel:(int64_t)a3
{
  self->_urgencyLevel = a3;
}

- (void)setWidgetBudgetID:(id)a3
{
  objc_storeStrong((id *)&self->_widgetBudgetID, a3);
}

- (BOOL)requiresRemoteDeviceWake
{
  return self->_requiresRemoteDeviceWake;
}

- (void)setRequiresRemoteDeviceWake:(BOOL)a3
{
  self->_requiresRemoteDeviceWake = a3;
}

- (void)setActivityType:(id)a3
{
  objc_storeStrong((id *)&self->_activityType, a3);
}

- (int64_t)staticPriority
{
  return self->_staticPriority;
}

- (void)setStaticPriority:(int64_t)a3
{
  self->_staticPriority = a3;
}

- (int64_t)maximumRuntime
{
  return self->_maximumRuntime;
}

- (void)setMaximumRuntime:(int64_t)a3
{
  self->_maximumRuntime = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (void)setClientDataBudgetName:(id)a3
{
  objc_storeStrong((id *)&self->_clientDataBudgetName, a3);
}

- (unint64_t)budgetingToken
{
  return self->_budgetingToken;
}

- (void)setBudgetingToken:(unint64_t)a3
{
  self->_budgetingToken = a3;
}

- (void)setAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_assertion, a3);
}

- (BOOL)dependenciesPreCleared
{
  return self->_dependenciesPreCleared;
}

- (void)setDependenciesPreCleared:(BOOL)a3
{
  self->_dependenciesPreCleared = a3;
}

- (unsigned)userIdentifier
{
  return self->_userIdentifier;
}

- (NSDate)endTime
{
  return (NSDate *)objc_getProperty(self, a2, 512, 1);
}

- (void)setEndTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 512);
}

@end
