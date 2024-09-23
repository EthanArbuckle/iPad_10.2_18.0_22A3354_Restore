@implementation ENDifferentialPrivacyManager

- (ENDifferentialPrivacyManager)initWithServerConfiguration:(id)a3 serverExposureConfiguration:(id)a4
{
  id v6;
  id v7;
  ENDifferentialPrivacyManager *v8;
  uint64_t v9;
  _DPBitValueRecorder *userRiskRecorder;
  uint64_t v11;
  _DPBitValueRecorder *userRiskParametersRecorder;
  uint64_t v13;
  _DPBitValueRecorder *userBeaconCountRecorder;
  uint64_t v15;
  _DPBitValueRecorder *userNotificationRecorder;
  uint64_t v17;
  _DPBitValueRecorder *userNotificationInteractionRecorder;
  uint64_t v19;
  _DPBitValueRecorder *userCodeVerifiedRecorder;
  uint64_t v21;
  _DPBitValueRecorder *userDiagnosedVaccineStatusRecorder;
  uint64_t v23;
  _DPBitValueRecorder *userKeysUploadedRecorder;
  uint64_t v25;
  _DPBitValueRecorder *userDateExposureRecorder;
  uint64_t v27;
  _DPBitValueRecorder *userCodeVerifiedV2Recorder;
  uint64_t v29;
  _DPBitValueRecorder *userKeysUploadedV2Recorder;
  uint64_t v31;
  _DPBitValueRecorder *userSecondaryAttackV2Recorder;
  uint64_t v33;
  _DPBitValueRecorder *userNotificationV2Recorder;
  uint64_t v35;
  _DPBitValueRecorder *userDiagnosedVaccineStatusV2Recorder;
  uint64_t v37;
  _DPBitValueRecorder *userDateExposureV2Recorder;
  objc_super v40;

  v6 = a3;
  v7 = a4;
  v40.receiver = self;
  v40.super_class = (Class)ENDifferentialPrivacyManager;
  v8 = -[ENDifferentialPrivacyManager init](&v40, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1D308]), "initWithKey:", CFSTR("com.apple.EN.UserRisk"));
    userRiskRecorder = v8->_userRiskRecorder;
    v8->_userRiskRecorder = (_DPBitValueRecorder *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1D308]), "initWithKey:", CFSTR("com.apple.EN.UserRiskParameters"));
    userRiskParametersRecorder = v8->_userRiskParametersRecorder;
    v8->_userRiskParametersRecorder = (_DPBitValueRecorder *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1D308]), "initWithKey:", CFSTR("com.apple.EN.BeaconCount"));
    userBeaconCountRecorder = v8->_userBeaconCountRecorder;
    v8->_userBeaconCountRecorder = (_DPBitValueRecorder *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1D308]), "initWithKey:", CFSTR("com.apple.EN.UserNotification"));
    userNotificationRecorder = v8->_userNotificationRecorder;
    v8->_userNotificationRecorder = (_DPBitValueRecorder *)v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1D308]), "initWithKey:", CFSTR("com.apple.EN.UserNotificationInteraction"));
    userNotificationInteractionRecorder = v8->_userNotificationInteractionRecorder;
    v8->_userNotificationInteractionRecorder = (_DPBitValueRecorder *)v17;

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1D308]), "initWithKey:", CFSTR("com.apple.EN.CodeVerified"));
    userCodeVerifiedRecorder = v8->_userCodeVerifiedRecorder;
    v8->_userCodeVerifiedRecorder = (_DPBitValueRecorder *)v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1D308]), "initWithKey:", CFSTR("com.apple.EN.DiagnosedVaccineStatus"));
    userDiagnosedVaccineStatusRecorder = v8->_userDiagnosedVaccineStatusRecorder;
    v8->_userDiagnosedVaccineStatusRecorder = (_DPBitValueRecorder *)v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1D308]), "initWithKey:", CFSTR("com.apple.EN.KeysUploaded"));
    userKeysUploadedRecorder = v8->_userKeysUploadedRecorder;
    v8->_userKeysUploadedRecorder = (_DPBitValueRecorder *)v23;

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1D308]), "initWithKey:", CFSTR("com.apple.EN.DateExposure"));
    userDateExposureRecorder = v8->_userDateExposureRecorder;
    v8->_userDateExposureRecorder = (_DPBitValueRecorder *)v25;

    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1D308]), "initWithKey:", CFSTR("com.apple.EN.CodeVerifiedWithReportTypeV2D14"));
    userCodeVerifiedV2Recorder = v8->_userCodeVerifiedV2Recorder;
    v8->_userCodeVerifiedV2Recorder = (_DPBitValueRecorder *)v27;

    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1D308]), "initWithKey:", CFSTR("com.apple.EN.KeysUploadedWithReportTypeV2D14"));
    userKeysUploadedV2Recorder = v8->_userKeysUploadedV2Recorder;
    v8->_userKeysUploadedV2Recorder = (_DPBitValueRecorder *)v29;

    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1D308]), "initWithKey:", CFSTR("com.apple.EN.SecondaryAttackV2D14"));
    userSecondaryAttackV2Recorder = v8->_userSecondaryAttackV2Recorder;
    v8->_userSecondaryAttackV2Recorder = (_DPBitValueRecorder *)v31;

    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1D308]), "initWithKey:", CFSTR("com.apple.EN.PeriodicExposureNotificationV2D14"));
    userNotificationV2Recorder = v8->_userNotificationV2Recorder;
    v8->_userNotificationV2Recorder = (_DPBitValueRecorder *)v33;

    v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1D308]), "initWithKey:", CFSTR("com.apple.EN.DiagnosedVaccineStatusV2D14"));
    userDiagnosedVaccineStatusV2Recorder = v8->_userDiagnosedVaccineStatusV2Recorder;
    v8->_userDiagnosedVaccineStatusV2Recorder = (_DPBitValueRecorder *)v35;

    v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1D308]), "initWithKey:", CFSTR("com.apple.EN.DateExposureV2D14"));
    userDateExposureV2Recorder = v8->_userDateExposureV2Recorder;
    v8->_userDateExposureV2Recorder = (_DPBitValueRecorder *)v37;

    -[ENDifferentialPrivacyManager updatedServerConfiguration:serverExposureConfiguration:](v8, "updatedServerConfiguration:serverExposureConfiguration:", v6, v7);
  }

  return v8;
}

- (void)updatedServerConfiguration:(id)a3 serverExposureConfiguration:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSDictionary *v13;
  NSDictionary *metadata;
  id v15;

  v15 = a3;
  v6 = a4;
  if (gLogCategory_ENDifferentialPrivacyManager <= 30
    && (gLogCategory_ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  objc_msgSend(v15, "region");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "countryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "region");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subdivisionCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[ENDifferentialPrivacyManager hashForServerExposureConfiguration:](ENDifferentialPrivacyManager, "hashForServerExposureConfiguration:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0C99E00]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D1D340]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D1D348]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D1D350]);
  v13 = (NSDictionary *)objc_msgSend(v12, "copy");
  metadata = self->_metadata;
  self->_metadata = v13;

  if (gLogCategory_ENDifferentialPrivacyManager <= 50
    && (gLogCategory_ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (void)reportUserRiskScoreWithSummary:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = +[ENDifferentialPrivacyManager userRiskScoreForExposureDetectionSummary:](ENDifferentialPrivacyManager, "userRiskScoreForExposureDetectionSummary:", a3);
  objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedShort:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ENDifferentialPrivacyManager _submitValue:toRecorder:description:](self, "_submitValue:toRecorder:description:", v5, self->_userRiskRecorder, "user risk score");

}

- (void)reportUserRiskParameters:(id)a3
{
  -[ENDifferentialPrivacyManager _submitVectorValue:toRecorder:description:](self, "_submitVectorValue:toRecorder:description:", a3, self->_userRiskParametersRecorder, "user risk parameters");
}

- (void)reportUserBeaconCount:(id)a3
{
  -[ENDifferentialPrivacyManager _submitVectorValue:toRecorder:description:](self, "_submitVectorValue:toRecorder:description:", a3, self->_userBeaconCountRecorder, "user beacon count");
}

- (void)reportUserExposureNotificationWithClassificationIndex:(unsigned __int8)a3 daysDelay:(unsigned __int8)a4
{
  unsigned int v4;
  uint64_t v5;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  void *v24;
  int v25;
  uint64_t v26;
  ENDifferentialPrivacyManager *v27;
  void *v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  ENDifferentialPrivacyManager *v33;
  id v34;

  v4 = a4;
  v5 = a3;
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSensitiveLoggingAllowed");

  if (v8
    && gLogCategory_ENDifferentialPrivacyManager <= 50
    && (gLogCategory_ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
  {
    v30 = v5;
    v32 = v4;
    LogPrintF_safe();
  }
  if ((v5 - 1) >= 4u)
  {
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isSensitiveLoggingAllowed");

    if (v18
      && gLogCategory_ENDifferentialPrivacyManager <= 90
      && (gLogCategory_ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedChar:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENDifferentialPrivacyManager _submitValue:toRecorder:description:](self, "_submitValue:toRecorder:description:", v9, self->_userNotificationRecorder, "user exposure notification");

    objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedChar:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENDifferentialPrivacyManager _submitValue:toRecorder:description:](self, "_submitValue:toRecorder:description:", v10, self->_userNotificationV2Recorder, "user exposure notification v2");

    if (v4 < 0xB)
      v11 = 2;
    else
      v11 = 3;
    if (v4 >= 7)
      v12 = v11;
    else
      v12 = 1;
    if (v4 < 4)
      v12 = 0;
    v13 = v12 | (4 * v5 - 4);
    objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithInt:", v13, v30, v32);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = self;
    -[ENDifferentialPrivacyManager _submitValue:toRecorder:description:](self, "_submitValue:toRecorder:description:", v14, self->_userDateExposureRecorder, "delay between exposure and notification");

    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isSensitiveLoggingAllowed");

    if (v16
      && gLogCategory_ENDifferentialPrivacyManager <= 50
      && (gLogCategory_ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
    {
      v31 = v13;
      LogPrintF_safe();
    }
    v19 = (char *)malloc_type_calloc(0x30uLL, 1uLL, 0x100004077774924uLL);
    if (v19)
    {
      v20 = v19;
      if (v4 >= 0xB)
        v21 = 11;
      else
        v21 = v4;
      v22 = 12 * v5;
      v23 = &v19[v22];
      do
      {
        v23[v21 - 12] = 1;
        +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs", v31);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isSensitiveLoggingAllowed");

        if (v25
          && gLogCategory_ENDifferentialPrivacyManager <= 50
          && (gLogCategory_ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
        {
          v31 = v22 + v21 - 12;
          LogPrintF_safe();
        }
        ++v21;
      }
      while (v21 != 12);
      objc_msgSend(MEMORY[0x1E0C99D58], "dataWithBytesNoCopy:length:", v20, 48);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v33;
      v34 = (id)v26;
      -[ENDifferentialPrivacyManager _submitVectorValue:toRecorder:description:](v27, "_submitVectorValue:toRecorder:description:");
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isSensitiveLoggingAllowed");

      if ((v29 & 1) != 0
        && gLogCategory_ENDifferentialPrivacyManager <= 50
        && (gLogCategory_ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }

    }
  }
}

- (void)reportUserExposureNotificationTapped:(BOOL)a3 classificationIndex:(unsigned __int8)a4
{
  uint64_t v5;
  void *v6;
  int v7;
  id v8;

  if ((a4 - 1) >= 4)
  {
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isSensitiveLoggingAllowed");

    if (v7
      && gLogCategory_ENDifferentialPrivacyManager <= 90
      && (gLogCategory_ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else
  {
    if (a3)
      v5 = a4;
    else
      v5 = (a4 + 4);
    objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithInt:", v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[ENDifferentialPrivacyManager _submitValue:toRecorder:description:](self, "_submitValue:toRecorder:description:", v8, self->_userNotificationInteractionRecorder, "user exposure notification interaction");

  }
}

- (void)reportUserCodeVerified:(unsigned __int8)a3 reportType:(unsigned int)a4
{
  uint64_t v4;
  unsigned int v5;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedChar:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENDifferentialPrivacyManager _submitValue:toRecorder:description:](self, "_submitValue:toRecorder:description:", v7, self->_userCodeVerifiedRecorder, "code verified");

  objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENDifferentialPrivacyManager _submitValue:toRecorder:description:](self, "_submitValue:toRecorder:description:", v8, self->_userCodeVerifiedV2Recorder, "code verified v2");

  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isSensitiveLoggingAllowed");

  if (v10
    && gLogCategory_ENDifferentialPrivacyManager <= 50
    && (gLogCategory_ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  if (v5 >= 2)
  {
    if ((_DWORD)v4)
    {
      objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedInt:", v5 + 4 * (_DWORD)v4 - 6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ENDifferentialPrivacyManager _submitValue:toRecorder:description:](self, "_submitValue:toRecorder:description:", v11, self->_userSecondaryAttackV2Recorder, "secondary attack");

      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = objc_msgSend(v12, "isSensitiveLoggingAllowed");

      if ((_DWORD)v11)
      {
        if (gLogCategory_ENDifferentialPrivacyManager <= 50
          && (gLogCategory_ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
      }
    }
  }
}

- (void)reportUserKeysUploaded:(unsigned __int8)a3 reportType:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;

  v4 = *(_QWORD *)&a4;
  objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedChar:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENDifferentialPrivacyManager _submitValue:toRecorder:description:](self, "_submitValue:toRecorder:description:", v6, self->_userKeysUploadedRecorder, "keys uploaded");

  objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedInt:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENDifferentialPrivacyManager _submitValue:toRecorder:description:](self, "_submitValue:toRecorder:description:", v7, self->_userKeysUploadedV2Recorder, "keys uploaded v2");

  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v8, "isSensitiveLoggingAllowed");

  if ((_DWORD)v7
    && gLogCategory_ENDifferentialPrivacyManager <= 50
    && (gLogCategory_ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (void)reportUserDiagnosedVaccineStatus:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  int v8;
  unint64_t v9;
  id v10;

  v10 = a3;
  if (-[ENDifferentialPrivacyManager _submitVectorValue:toRecorder:description:](self, "_submitVectorValue:toRecorder:description:"))
  {
    if (-[ENDifferentialPrivacyManager _submitVectorValue:toRecorder:description:](self, "_submitVectorValue:toRecorder:description:", v10, self->_userDiagnosedVaccineStatusV2Recorder, "user diagnosed vaccine status v2"))
    {
      v4 = objc_retainAutorelease(v10);
      v5 = objc_msgSend(v4, "bytes");
      if (objc_msgSend(v4, "length"))
      {
        v6 = 0;
        do
        {
          if (*(_BYTE *)(v5 + v6))
          {
            +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = objc_msgSend(v7, "isSensitiveLoggingAllowed");

            if (v8)
            {
              if (gLogCategory_ENDifferentialPrivacyManager <= 50
                && (gLogCategory_ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
              {
                v9 = v6;
                LogPrintF_safe();
              }
            }
          }
          ++v6;
        }
        while (v6 < objc_msgSend(v4, "length", v9));
      }
    }
  }

}

- (BOOL)_submitVectorValue:(id)a3 toRecorder:(id)a4 description:(const char *)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v13[0] = a3;
  v7 = (void *)MEMORY[0x1E0C99D18];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "recordBitVectors:metadata:", v10, self->_metadata);

  if ((v11 & 1) != 0)
  {
    if (gLogCategory_ENDifferentialPrivacyManager > 50
      || gLogCategory_ENDifferentialPrivacyManager == -1 && !_LogCategory_Initialize())
    {
      return v11;
    }
LABEL_4:
    LogPrintF_safe();
    return v11;
  }
  if (gLogCategory__ENDifferentialPrivacyManager <= 90
    && (gLogCategory__ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_4;
  }
  return v11;
}

- (void)_submitValue:(id)a3 toRecorder:(id)a4 description:(const char *)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v11[0] = a3;
  v7 = (void *)MEMORY[0x1E0C99D18];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v8, "record:metadata:", v10, self->_metadata);

  if ((self & 1) != 0)
  {
    if (gLogCategory_ENDifferentialPrivacyManager > 50
      || gLogCategory_ENDifferentialPrivacyManager == -1 && !_LogCategory_Initialize())
    {
      return;
    }
LABEL_4:
    LogPrintF_safe();
    return;
  }
  if (gLogCategory__ENDifferentialPrivacyManager <= 90
    && (gLogCategory__ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_4;
  }
}

+ (unsigned)userRiskScoreForExposureDetectionSummary:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  uint64_t i;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(a3, "daySummaries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    v7 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v11, "daySummary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "maximumScore");
        v14 = v13;

        objc_msgSend(v11, "daySummary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "scoreSum");
        v17 = v16;

        objc_msgSend(v11, "daySummary");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "weightedDurationSum");
        v20 = v19;

        if (v14 > v9)
          v9 = v14;
        if (v17 > v7)
          v7 = v17;
        if (v20 > v8)
          v8 = v20;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
  }

  for (j = 0; j != 7; ++j)
  {
    if (v9 <= dbl_1CC251248[j])
      break;
  }
  for (k = 0; k != 7; ++k)
  {
    if (v7 <= dbl_1CC251280[k])
      break;
  }
  for (m = 0; m != 7; ++m)
  {
    if (v8 <= dbl_1CC2512B8[m])
      break;
  }
  if (gLogCategory_ENDifferentialPrivacyManager <= 30
    && (gLogCategory_ENDifferentialPrivacyManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  return k + 8 * j + ((_WORD)m << 6);
}

+ (id)hashForServerExposureConfiguration:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _DWORD *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _WORD v31[76];

  v3 = a3;
  v4 = v3;
  memset(&v31[4], 0, 135);
  if (!v3)
  {
    v25 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v3, "exposureConfigurationValues");
  v5 = objc_claimAutoreleasedReturnValue();
  v31[0] = CFDictionaryGetInt64Ranged();
  v31[1] = CFDictionaryGetInt64Ranged();
  v31[2] = CFDictionaryGetInt64Ranged();
  v31[3] = CFDictionaryGetInt64Ranged();
  CFArrayGetTypeID();
  CFDictionaryGetTypedValue();
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    NSArrayGetNSNumberAtIndex();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSArrayGetNSNumberAtIndex();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSArrayGetNSNumberAtIndex();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v31[4]) = objc_msgSend(v7, "unsignedCharValue");
    HIBYTE(v31[4]) = objc_msgSend(v8, "unsignedCharValue");
    LOBYTE(v31[5]) = objc_msgSend(v9, "unsignedCharValue");

  }
  v28 = (void *)v6;
  CFDictionaryGetTypeID();
  CFDictionaryGetTypedValue();
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = 0;
    v12 = 0;
    for (i = -14; i != 15; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithInteger:", i);
      v12 |= (CFDictionaryGetInt64Ranged() & 3) << v11;
      v11 += 2;
    }
    *(_QWORD *)((char *)&v31[5] + 1) = v12;
  }
  *(_WORD *)((char *)&v31[9] + 1) = CFDictionaryGetInt64Ranged();
  *(_WORD *)((char *)&v31[10] + 1) = CFDictionaryGetInt64Ranged();
  *(_WORD *)((char *)&v31[11] + 1) = CFDictionaryGetInt64Ranged();
  *(_WORD *)((char *)&v31[12] + 1) = CFDictionaryGetInt64Ranged();
  *(_WORD *)((char *)&v31[13] + 1) = CFDictionaryGetInt64Ranged();
  HIBYTE(v31[14]) = CFDictionaryGetInt64Ranged();
  v29 = (void *)v5;
  LOBYTE(v31[15]) = CFDictionaryGetInt64Ranged();
  v30 = v4;
  objc_msgSend(v4, "classificationCriteria");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)v10;
  if ((unint64_t)objc_msgSend(v14, "count") > 3)
  {
    v15 = 4;
LABEL_12:
    v16 = 0;
    v17 = (_DWORD *)((char *)&v31[27] + 1);
    do
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "perDaySumERVThresholdsByDiagnosisReportType");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      *(v17 - 6) = CFDictionaryGetInt64Ranged();
      *(v17 - 5) = CFDictionaryGetInt64Ranged();
      *(v17 - 4) = CFDictionaryGetInt64Ranged();
      *(v17 - 3) = CFDictionaryGetInt64Ranged();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(v17 - 2) = objc_msgSend(v20, "perDaySumERVThreshold");

      objc_msgSend(v14, "objectAtIndexedSubscript:", v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(v17 - 1) = objc_msgSend(v21, "perDayMaxERVThreshold");

      objc_msgSend(v14, "objectAtIndexedSubscript:", v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *v17 = objc_msgSend(v22, "weightedDurationAtAttenuationThreshold");
      v17 += 7;

      ++v16;
    }
    while (v15 != v16);
    goto LABEL_14;
  }
  v15 = objc_msgSend(v14, "count");
  if (v15)
    goto LABEL_12;
LABEL_14:
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D58]), "initWithBytes:length:", v31, 143);
  objc_msgSend(v23, "sha256");
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v24, "bytes");
  objc_msgSend(v24, "length");
  objc_msgSend(v24, "length");
  NSPrintF();
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v30;
LABEL_15:

  return v25;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_userDateExposureV2Recorder, 0);
  objc_storeStrong((id *)&self->_userDiagnosedVaccineStatusV2Recorder, 0);
  objc_storeStrong((id *)&self->_userNotificationV2Recorder, 0);
  objc_storeStrong((id *)&self->_userSecondaryAttackV2Recorder, 0);
  objc_storeStrong((id *)&self->_userKeysUploadedV2Recorder, 0);
  objc_storeStrong((id *)&self->_userCodeVerifiedV2Recorder, 0);
  objc_storeStrong((id *)&self->_userDateExposureRecorder, 0);
  objc_storeStrong((id *)&self->_userKeysUploadedRecorder, 0);
  objc_storeStrong((id *)&self->_userDiagnosedVaccineStatusRecorder, 0);
  objc_storeStrong((id *)&self->_userCodeVerifiedRecorder, 0);
  objc_storeStrong((id *)&self->_userNotificationInteractionRecorder, 0);
  objc_storeStrong((id *)&self->_userNotificationRecorder, 0);
  objc_storeStrong((id *)&self->_userBeaconCountRecorder, 0);
  objc_storeStrong((id *)&self->_userRiskParametersRecorder, 0);
  objc_storeStrong((id *)&self->_userRiskRecorder, 0);
}

@end
