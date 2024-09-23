@implementation _CDAutoSuConfig

- (int)readConfig
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
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
  void *v28;
  BOOL v29;
  void *v30;
  BOOL v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  NSObject *v39;
  int restrictionStartInSlot;
  int restrictionEndInSlot;
  int suStartDefaultTime;
  int suEndDefaultTimeOffsetFromSuStart;
  _BOOL4 alwaysFallBackToDefault;
  _BOOL4 alwaysReturnUnlockNow;
  _BOOL4 allowUnlockBeforeNow;
  double unlockThreshold;
  double startThreshold;
  double endThreshold;
  int unlockMarginInSlot;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  _DWORD v123[2];
  __int16 v124;
  int v125;
  __int16 v126;
  int v127;
  __int16 v128;
  int v129;
  __int16 v130;
  _BOOL4 v131;
  __int16 v132;
  _BOOL4 v133;
  __int16 v134;
  _BOOL4 v135;
  __int16 v136;
  double v137;
  __int16 v138;
  double v139;
  __int16 v140;
  double v141;
  __int16 v142;
  int v143;
  uint64_t v144;

  v144 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB34D0];
  +[_CDPaths otaSleepPath](_CDPaths, "otaSleepPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleWithPath:", v4);
  v5 = objc_claimAutoreleasedReturnValue();

  +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      LOWORD(v123[0]) = 0;
      _os_log_impl(&dword_18DDBE000, v6, OS_LOG_TYPE_INFO, "Successfully retrieved the bundle from the OTA path", (uint8_t *)v123, 2u);
    }
    goto LABEL_10;
  }
  if (v7)
  {
    LOWORD(v123[0]) = 0;
    _os_log_impl(&dword_18DDBE000, v6, OS_LOG_TYPE_INFO, "Failed to retrieve the bundle from OTA path", (uint8_t *)v123, 2u);
  }

  v8 = (void *)MEMORY[0x1E0CB34D0];
  +[_CDPaths defaultSleepPath](_CDPaths, "defaultSleepPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleWithPath:", v9);
  v10 = objc_claimAutoreleasedReturnValue();

  +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
  v11 = objc_claimAutoreleasedReturnValue();
  v5 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v123[0]) = 0;
      _os_log_impl(&dword_18DDBE000, v5, OS_LOG_TYPE_INFO, "Successfully retrieved the bundle from the default path", (uint8_t *)v123, 2u);
    }
    v6 = v5;
    v5 = v10;
LABEL_10:

    -[NSObject objectForInfoDictionaryKey:](v5, "objectForInfoDictionaryKey:", CFSTR("SleepForAutoSu"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("RestrictionStartInSlot"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("RestrictionEndInSlot"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("SuStartDefaultTime"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("SuEndDefaultTimeFromSuStart"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AlwaysFallBackToDefault"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (v18)
              {
                objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AlwaysReturnUnlockNow"));
                v19 = (void *)objc_claimAutoreleasedReturnValue();

                if (v19)
                {
                  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("LastUnlockThreshold"));
                  v20 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v20)
                  {
                    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("SuStartThreshold"));
                    v21 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v21)
                    {
                      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("SuEndThreshold"));
                      v22 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v22)
                      {
                        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("UnlockMarginInSlot"));
                        v23 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v23)
                        {
                          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("RestrictionStartInSlot"));
                          v24 = (void *)objc_claimAutoreleasedReturnValue();
                          self->_restrictionStartInSlot = objc_msgSend(v24, "intValue");

                          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("RestrictionEndInSlot"));
                          v25 = (void *)objc_claimAutoreleasedReturnValue();
                          self->_restrictionEndInSlot = objc_msgSend(v25, "intValue");

                          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("SuStartDefaultTime"));
                          v26 = (void *)objc_claimAutoreleasedReturnValue();
                          self->_suStartDefaultTime = objc_msgSend(v26, "intValue");

                          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("SuEndDefaultTimeFromSuStart"));
                          v27 = (void *)objc_claimAutoreleasedReturnValue();
                          self->_suEndDefaultTimeOffsetFromSuStart = objc_msgSend(v27, "intValue");

                          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AlwaysFallBackToDefault"));
                          v28 = (void *)objc_claimAutoreleasedReturnValue();
                          v29 = objc_msgSend(v28, "intValue") == 1;

                          self->_alwaysFallBackToDefault = v29;
                          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AlwaysReturnUnlockNow"));
                          v30 = (void *)objc_claimAutoreleasedReturnValue();
                          v31 = objc_msgSend(v30, "intValue") == 1;

                          self->_alwaysReturnUnlockNow = v31;
                          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("LastUnlockThreshold"));
                          v32 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v32, "doubleValue");
                          self->_unlockThreshold = v33;

                          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("SuStartThreshold"));
                          v34 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v34, "doubleValue");
                          self->_startThreshold = v35;

                          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("SuEndThreshold"));
                          v36 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v36, "doubleValue");
                          self->_endThreshold = v37;

                          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("UnlockMarginInSlot"));
                          v38 = (void *)objc_claimAutoreleasedReturnValue();
                          self->_unlockMarginInSlot = objc_msgSend(v38, "intValue");

                          self->_allowUnlockBeforeNow = 0;
                          +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
                          v39 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                          {
                            restrictionStartInSlot = self->_restrictionStartInSlot;
                            restrictionEndInSlot = self->_restrictionEndInSlot;
                            suStartDefaultTime = self->_suStartDefaultTime;
                            suEndDefaultTimeOffsetFromSuStart = self->_suEndDefaultTimeOffsetFromSuStart;
                            alwaysFallBackToDefault = self->_alwaysFallBackToDefault;
                            alwaysReturnUnlockNow = self->_alwaysReturnUnlockNow;
                            allowUnlockBeforeNow = self->_allowUnlockBeforeNow;
                            unlockThreshold = self->_unlockThreshold;
                            startThreshold = self->_startThreshold;
                            endThreshold = self->_endThreshold;
                            unlockMarginInSlot = self->_unlockMarginInSlot;
                            v123[0] = 67111680;
                            v123[1] = restrictionStartInSlot;
                            v124 = 1024;
                            v125 = restrictionEndInSlot;
                            v126 = 1024;
                            v127 = suStartDefaultTime;
                            v128 = 1024;
                            v129 = suEndDefaultTimeOffsetFromSuStart;
                            v130 = 1024;
                            v131 = alwaysFallBackToDefault;
                            v132 = 1024;
                            v133 = alwaysReturnUnlockNow;
                            v134 = 1024;
                            v135 = allowUnlockBeforeNow;
                            v136 = 2048;
                            v137 = unlockThreshold;
                            v138 = 2048;
                            v139 = startThreshold;
                            v140 = 2048;
                            v141 = endThreshold;
                            v142 = 1024;
                            v143 = unlockMarginInSlot;
                            _os_log_impl(&dword_18DDBE000, v39, OS_LOG_TYPE_INFO, "Config parameters: %d, %d, %d, %d, %d, %d, %d, %f, %f, %f, %d", (uint8_t *)v123, 0x50u);
                          }
                          v51 = 0;
                          goto LABEL_50;
                        }
                        +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
                        v39 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                          -[_CDAutoSuConfig readConfig].cold.11(v39, v115, v116, v117, v118, v119, v120, v121);
                      }
                      else
                      {
                        +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
                        v39 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                          -[_CDAutoSuConfig readConfig].cold.10(v39, v108, v109, v110, v111, v112, v113, v114);
                      }
                    }
                    else
                    {
                      +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
                      v39 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                        -[_CDAutoSuConfig readConfig].cold.9(v39, v101, v102, v103, v104, v105, v106, v107);
                    }
                  }
                  else
                  {
                    +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
                    v39 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                      -[_CDAutoSuConfig readConfig].cold.8(v39, v94, v95, v96, v97, v98, v99, v100);
                  }
                }
                else
                {
                  +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
                  v39 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                    -[_CDAutoSuConfig readConfig].cold.7(v39, v87, v88, v89, v90, v91, v92, v93);
                }
              }
              else
              {
                +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
                v39 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                  -[_CDAutoSuConfig readConfig].cold.6(v39, v80, v81, v82, v83, v84, v85, v86);
              }
            }
            else
            {
              +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                -[_CDAutoSuConfig readConfig].cold.5(v39, v73, v74, v75, v76, v77, v78, v79);
            }
          }
          else
          {
            +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              -[_CDAutoSuConfig readConfig].cold.4(v39, v66, v67, v68, v69, v70, v71, v72);
          }
        }
        else
        {
          +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            -[_CDAutoSuConfig readConfig].cold.3(v39, v59, v60, v61, v62, v63, v64, v65);
        }
      }
      else
      {
        +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          -[_CDAutoSuConfig readConfig].cold.2(v39, v52, v53, v54, v55, v56, v57, v58);
      }
    }
    else
    {
      +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        LOWORD(v123[0]) = 0;
        _os_log_impl(&dword_18DDBE000, v39, OS_LOG_TYPE_INFO, "Failed to get config info from device", (uint8_t *)v123, 2u);
      }
    }
    v51 = -1;
LABEL_50:

    goto LABEL_51;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[_CDAutoSuConfig readConfig].cold.1();
  v51 = -1;
LABEL_51:

  return v51;
}

- (BOOL)validParam
{
  BOOL v2;
  int restrictionEndInSlot;
  int restrictionStartInSlot;
  double unlockThreshold;
  BOOL v6;
  double startThreshold;
  BOOL v8;
  double endThreshold;

  v2 = 0;
  restrictionEndInSlot = self->_restrictionEndInSlot;
  if (restrictionEndInSlot <= 95)
  {
    restrictionStartInSlot = self->_restrictionStartInSlot;
    if ((restrictionStartInSlot & 0x80000000) == 0 && restrictionStartInSlot < restrictionEndInSlot)
    {
      if (self->_suStartDefaultTime >> 7 <= 0x2A2
        && self->_suEndDefaultTimeOffsetFromSuStart <= 0x1517Fu
        && ((unlockThreshold = self->_unlockThreshold, unlockThreshold >= 0.0)
          ? (v6 = unlockThreshold <= 1.0)
          : (v6 = 0),
            v6
         && ((startThreshold = self->_startThreshold, startThreshold >= 0.0) ? (v8 = startThreshold <= 1.0) : (v8 = 0),
             v8)))
      {
        v2 = 0;
        endThreshold = self->_endThreshold;
        if (endThreshold >= 0.0 && endThreshold <= 1.0)
          return self->_unlockMarginInSlot < 0x60u;
      }
      else
      {
        return 0;
      }
    }
  }
  return v2;
}

- (void)setParam
{
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  int restrictionStartInSlot;
  int restrictionEndInSlot;
  int suStartDefaultTime;
  int suEndDefaultTimeOffsetFromSuStart;
  _BOOL4 alwaysFallBackToDefault;
  _BOOL4 alwaysReturnUnlockNow;
  double unlockThreshold;
  double startThreshold;
  double endThreshold;
  int unlockMarginInSlot;
  uint64_t v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (-[_CDAutoSuConfig readConfig](self, "readConfig"))
  {
    +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      v4 = "failed to read configuration file; fall back to hard-coded params";
LABEL_7:
      _os_log_impl(&dword_18DDBE000, v3, OS_LOG_TYPE_INFO, v4, (uint8_t *)&v16, 2u);
    }
  }
  else
  {
    if (-[_CDAutoSuConfig validParam](self, "validParam"))
      goto LABEL_9;
    +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      v4 = "invalid params from configuration file; fall back to hard-coded params";
      goto LABEL_7;
    }
  }

  *(_OWORD *)&self->_restrictionStartInSlot = xmmword_18DF4C4E0;
  *(_WORD *)&self->_alwaysFallBackToDefault = 0;
  self->_allowUnlockBeforeNow = 0;
  *(int64x2_t *)&self->_unlockThreshold = vdupq_n_s64(0x3FECCCCCCCCCCCCDuLL);
  self->_endThreshold = 0.9;
  self->_unlockMarginInSlot = 4;
LABEL_9:
  +[_CDLogging autoSUChannel](_CDLogging, "autoSUChannel", v16);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    restrictionStartInSlot = self->_restrictionStartInSlot;
    restrictionEndInSlot = self->_restrictionEndInSlot;
    suStartDefaultTime = self->_suStartDefaultTime;
    suEndDefaultTimeOffsetFromSuStart = self->_suEndDefaultTimeOffsetFromSuStart;
    alwaysFallBackToDefault = self->_alwaysFallBackToDefault;
    alwaysReturnUnlockNow = self->_alwaysReturnUnlockNow;
    unlockThreshold = self->_unlockThreshold;
    startThreshold = self->_startThreshold;
    endThreshold = self->_endThreshold;
    unlockMarginInSlot = self->_unlockMarginInSlot;
    LODWORD(v16) = 67111424;
    HIDWORD(v16) = restrictionStartInSlot;
    v17 = 1024;
    v18 = restrictionEndInSlot;
    v19 = 1024;
    v20 = suStartDefaultTime;
    v21 = 1024;
    v22 = suEndDefaultTimeOffsetFromSuStart;
    v23 = 1024;
    v24 = alwaysFallBackToDefault;
    v25 = 1024;
    v26 = alwaysReturnUnlockNow;
    v27 = 2048;
    v28 = unlockThreshold;
    v29 = 2048;
    v30 = startThreshold;
    v31 = 2048;
    v32 = endThreshold;
    v33 = 1024;
    v34 = unlockMarginInSlot;
    _os_log_impl(&dword_18DDBE000, v5, OS_LOG_TYPE_INFO, "Config params: %d, %d, %d, %d, %d, %d, %f, %f, %f, %d", (uint8_t *)&v16, 0x4Au);
  }

}

- (int)restrictionStartInSlot
{
  return self->_restrictionStartInSlot;
}

- (void)setRestrictionStartInSlot:(int)a3
{
  self->_restrictionStartInSlot = a3;
}

- (int)restrictionEndInSlot
{
  return self->_restrictionEndInSlot;
}

- (void)setRestrictionEndInSlot:(int)a3
{
  self->_restrictionEndInSlot = a3;
}

- (int)suStartDefaultTime
{
  return self->_suStartDefaultTime;
}

- (void)setSuStartDefaultTime:(int)a3
{
  self->_suStartDefaultTime = a3;
}

- (int)suEndDefaultTimeOffsetFromSuStart
{
  return self->_suEndDefaultTimeOffsetFromSuStart;
}

- (void)setSuEndDefaultTimeOffsetFromSuStart:(int)a3
{
  self->_suEndDefaultTimeOffsetFromSuStart = a3;
}

- (BOOL)alwaysFallBackToDefault
{
  return self->_alwaysFallBackToDefault;
}

- (void)setAlwaysFallBackToDefault:(BOOL)a3
{
  self->_alwaysFallBackToDefault = a3;
}

- (BOOL)alwaysReturnUnlockNow
{
  return self->_alwaysReturnUnlockNow;
}

- (void)setAlwaysReturnUnlockNow:(BOOL)a3
{
  self->_alwaysReturnUnlockNow = a3;
}

- (BOOL)allowUnlockBeforeNow
{
  return self->_allowUnlockBeforeNow;
}

- (void)setAllowUnlockBeforeNow:(BOOL)a3
{
  self->_allowUnlockBeforeNow = a3;
}

- (double)unlockThreshold
{
  return self->_unlockThreshold;
}

- (void)setUnlockThreshold:(double)a3
{
  self->_unlockThreshold = a3;
}

- (double)startThreshold
{
  return self->_startThreshold;
}

- (void)setStartThreshold:(double)a3
{
  self->_startThreshold = a3;
}

- (double)endThreshold
{
  return self->_endThreshold;
}

- (void)setEndThreshold:(double)a3
{
  self->_endThreshold = a3;
}

- (int)unlockMarginInSlot
{
  return self->_unlockMarginInSlot;
}

- (void)setUnlockMarginInSlot:(int)a3
{
  self->_unlockMarginInSlot = a3;
}

- (void)readConfig
{
  OUTLINED_FUNCTION_0(&dword_18DDBE000, a1, a3, "key %@ does not exist", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

@end
