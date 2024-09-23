@implementation HPSSpatialProfileAnalytics

- (HPSSpatialProfileAnalytics)init
{
  HPSSpatialProfileAnalytics *v2;
  NSString *parentBundleID;
  NSString *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSString *v10;
  NSObject *v11;
  NSString *v12;
  id v14;
  objc_super v15;
  uint8_t buf[4];
  NSString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)HPSSpatialProfileAnalytics;
  v2 = -[HPSSpatialProfileAnalytics init](&v15, sel_init);
  if (v2)
  {
    v2->_enrollmentStartTime = CACurrentMediaTime();
    v2->_status = 0;
    *(_OWORD *)&v2->_faceEnrollmentTime = 0u;
    *(_OWORD *)&v2->_rightEarEnrollmentStartTime = 0u;
    *(_OWORD *)&v2->_rightEarFrontAngleTime = 0u;
    *(_OWORD *)&v2->_rightEarBackAngleTime = 0u;
    *(_OWORD *)&v2->_leftEarEnrollmentTime = 0u;
    *(_OWORD *)&v2->_leftEarMidAngleTime = 0u;
    *(_OWORD *)&v2->_soundProfileCreationStartTime = 0u;
    *(_WORD *)&v2->_leftEarOcclusionDetectCount = 0;
    v2->_frameDetectionStartTime = 0.0;
    v2->_frameCount = 0;
    parentBundleID = v2->_parentBundleID;
    v2->_parentBundleID = 0;

    v2->_submitted = 0;
    v4 = v2->_result;
    v2->_result = (NSString *)CFSTR("Cancel");

    if (+[HPSSpatialProfileAnalytics isRBSProcessHandleAvailable](HPSSpatialProfileAnalytics, "isRBSProcessHandleAvailable"))
    {
      objc_msgSend(MEMORY[0x1E0D87D78], "identifierWithPid:", getpid());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v14 = 0;
        objc_msgSend(MEMORY[0x1E0D87D60], "handleForIdentifier:error:", v5, &v14);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v14;
        if (v6)
        {
          objc_msgSend(v6, "bundle");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "identifier");
          v9 = objc_claimAutoreleasedReturnValue();
          v10 = v2->_parentBundleID;
          v2->_parentBundleID = (NSString *)v9;

        }
      }
      else
      {
        v7 = 0;
      }
      sharedBluetoothSettingsLogComponent();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v2->_parentBundleID;
        *(_DWORD *)buf = 138412290;
        v17 = v12;
        _os_log_impl(&dword_1DB30C000, v11, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Initialized Analytics From Client %@", buf, 0xCu);
      }

    }
  }
  return v2;
}

- (void)updateFaceEnrollStart
{
  NSObject *v2;
  uint8_t v3[16];

  self->_faceEnrollmentStartTime = CACurrentMediaTime();
  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Face Enroll Start Time", v3, 2u);
  }

}

- (void)updateSoundProfileCreationDurationStart
{
  NSObject *v2;
  uint8_t v3[16];

  if (self->_soundProfileCreationStartTime == 0.0)
  {
    self->_soundProfileCreationStartTime = CACurrentMediaTime();
    sharedBluetoothSettingsLogComponent();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Profile Creation Time", v3, 2u);
    }

  }
}

- (void)updateSoundProfileCreationDuration
{
  NSObject *v3;
  double faceEnrollmentTime;
  int v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_soundProfileCreationStartTime != 0.0)
    self->_soundProfileCreationTime = CACurrentMediaTime() - self->_soundProfileCreationStartTime;
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    faceEnrollmentTime = self->_faceEnrollmentTime;
    v5 = 134217984;
    v6 = faceEnrollmentTime;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Face Enroll Time: %f", (uint8_t *)&v5, 0xCu);
  }

}

- (void)updateFaceEnrollDuration
{
  NSObject *v3;
  double faceEnrollmentTime;
  int v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_faceEnrollmentStartTime != 0.0)
    self->_faceEnrollmentTime = CACurrentMediaTime() - self->_faceEnrollmentStartTime;
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    faceEnrollmentTime = self->_faceEnrollmentTime;
    v5 = 134217984;
    v6 = faceEnrollmentTime;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Face Enroll Time: %f", (uint8_t *)&v5, 0xCu);
  }

}

- (void)updateRightEarEnrollStart
{
  NSObject *v2;
  uint8_t v3[16];

  self->_rightEarEnrollmentStartTime = CACurrentMediaTime();
  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Right Enroll Time", v3, 2u);
  }

}

- (void)updateRightEarFrontAnglelDuration
{
  NSObject *v3;
  double rightEarFrontAngleTime;
  int v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_rightEarEnrollmentStartTime != 0.0)
    self->_rightEarFrontAngleTime = CACurrentMediaTime() - self->_rightEarEnrollmentStartTime;
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    rightEarFrontAngleTime = self->_rightEarFrontAngleTime;
    v5 = 134217984;
    v6 = rightEarFrontAngleTime;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Right Front Enroll Time: %f", (uint8_t *)&v5, 0xCu);
  }

}

- (void)updateRightEarMidAnglelDuration
{
  NSObject *v3;
  double rightEarMidAngleTime;
  int v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_rightEarEnrollmentStartTime != 0.0)
    self->_rightEarMidAngleTime = CACurrentMediaTime() - self->_rightEarEnrollmentStartTime;
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    rightEarMidAngleTime = self->_rightEarMidAngleTime;
    v5 = 134217984;
    v6 = rightEarMidAngleTime;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Right Mid Enroll Time: %f", (uint8_t *)&v5, 0xCu);
  }

}

- (void)updateRightEarBackAnglelDuration
{
  NSObject *v3;
  double rightEarBackAngleTime;
  int v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_rightEarEnrollmentStartTime != 0.0)
    self->_rightEarBackAngleTime = CACurrentMediaTime() - self->_rightEarEnrollmentStartTime;
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    rightEarBackAngleTime = self->_rightEarBackAngleTime;
    v5 = 134217984;
    v6 = rightEarBackAngleTime;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Right Back Enroll Time: %f", (uint8_t *)&v5, 0xCu);
  }

}

- (void)updateLeftEarFrontAnglelDuration
{
  NSObject *v3;
  double leftEarFrontAngleTime;
  int v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_leftEarEnrollmentStartTime != 0.0)
    self->_leftEarFrontAngleTime = CACurrentMediaTime() - self->_leftEarEnrollmentStartTime;
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    leftEarFrontAngleTime = self->_leftEarFrontAngleTime;
    v5 = 134217984;
    v6 = leftEarFrontAngleTime;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Left Front Enroll Time: %f", (uint8_t *)&v5, 0xCu);
  }

}

- (void)updateLeftEarMidAnglelDuration
{
  NSObject *v3;
  double leftEarMidAngleTime;
  int v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_leftEarEnrollmentStartTime != 0.0)
    self->_leftEarMidAngleTime = CACurrentMediaTime() - self->_leftEarEnrollmentStartTime;
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    leftEarMidAngleTime = self->_leftEarMidAngleTime;
    v5 = 134217984;
    v6 = leftEarMidAngleTime;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Left Mid Enroll Time: %f", (uint8_t *)&v5, 0xCu);
  }

}

- (void)updateLeftEarBackAnglelDuration
{
  NSObject *v3;
  double leftEarBackAngleTime;
  int v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_leftEarEnrollmentStartTime != 0.0)
    self->_leftEarBackAngleTime = CACurrentMediaTime() - self->_leftEarEnrollmentStartTime;
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    leftEarBackAngleTime = self->_leftEarBackAngleTime;
    v5 = 134217984;
    v6 = leftEarBackAngleTime;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Left Back Enroll Time: %f", (uint8_t *)&v5, 0xCu);
  }

}

- (void)updateRightEarEnrollDuration
{
  NSObject *v3;
  double rightEarEnrollmentTime;
  int v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_rightEarEnrollmentStartTime != 0.0)
    self->_rightEarEnrollmentTime = CACurrentMediaTime() - self->_rightEarEnrollmentStartTime;
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    rightEarEnrollmentTime = self->_rightEarEnrollmentTime;
    v5 = 134217984;
    v6 = rightEarEnrollmentTime;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Right Enroll Time: %f", (uint8_t *)&v5, 0xCu);
  }

}

- (void)updateLeftEarEnrollStart
{
  NSObject *v2;
  uint8_t v3[16];

  self->_leftEarEnrollmentStartTime = CACurrentMediaTime();
  sharedBluetoothSettingsLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DB30C000, v2, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Left Enroll Time", v3, 2u);
  }

}

- (void)updateLeftEarEnrollDuration
{
  NSObject *v3;
  double leftEarEnrollmentTime;
  int v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_leftEarEnrollmentStartTime != 0.0)
    self->_leftEarEnrollmentTime = CACurrentMediaTime() - self->_leftEarEnrollmentStartTime;
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    leftEarEnrollmentTime = self->_leftEarEnrollmentTime;
    v5 = 134217984;
    v6 = leftEarEnrollmentTime;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Left Enroll Time: %f ", (uint8_t *)&v5, 0xCu);
  }

}

- (void)updateStatus:(BOOL)a3 EnrollmentResult:(id)a4
{
  id v7;
  NSObject *v8;
  _BOOL4 status;
  NSString *result;
  _DWORD v11[2];
  __int16 v12;
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_storeStrong((id *)&self->_result, a4);
  self->_status = a3;
  sharedBluetoothSettingsLogComponent();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    status = self->_status;
    result = self->_result;
    v11[0] = 67109378;
    v11[1] = status;
    v12 = 2112;
    v13 = result;
    _os_log_impl(&dword_1DB30C000, v8, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Update Status : %d Result %@", (uint8_t *)v11, 0x12u);
  }

}

- (void)incrementLeftEarOcclusionCount
{
  ++self->_leftEarOcclusionDetectCount;
}

- (void)incrementRightEarOcclusionCount
{
  ++self->_rightEarOcclusionDetectCount;
}

- (void)initFrameRateDetection
{
  self->_frameDetectionStartTime = CACurrentMediaTime();
  self->_frameCount = 0;
}

- (void)incrementFrameCount
{
  double v3;
  NSObject *v4;
  unint64_t frameCount;
  int v6;
  double v7;
  __int16 v8;
  unint64_t v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_frameDetectionStartTime == 0.0)
  {
    -[HPSSpatialProfileAnalytics initFrameRateDetection](self, "initFrameRateDetection");
  }
  else
  {
    ++self->_frameCount;
    v3 = CACurrentMediaTime() - self->_frameDetectionStartTime;
    if (v3 > 2.0)
    {
      sharedBluetoothSettingsLogComponent();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        frameCount = self->_frameCount;
        v6 = 134218496;
        v7 = (double)frameCount / v3;
        v8 = 2048;
        v9 = frameCount;
        v10 = 2048;
        v11 = v3;
        _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Frame Rate : Frame Per sec %f   [ Num : %llu Time :%f]", (uint8_t *)&v6, 0x20u);
      }

      -[HPSSpatialProfileAnalytics initFrameRateDetection](self, "initFrameRateDetection");
    }
  }
}

- (void)submitHPSSpatialProfileEnrollAnalytics
{
  NSObject *v3;
  uint64_t v4;
  NSString *result;
  void *v6;
  double faceEnrollmentStartTime;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[16];
  _QWORD v26[16];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!self->_submitted)
  {
    if (self->_faceEnrollmentTime == 0.0)
      -[HPSSpatialProfileAnalytics updateFaceEnrollDuration](self, "updateFaceEnrollDuration");
    if (self->_rightEarEnrollmentTime == 0.0)
      -[HPSSpatialProfileAnalytics updateRightEarEnrollDuration](self, "updateRightEarEnrollDuration");
    if (self->_leftEarEnrollmentTime == 0.0)
      -[HPSSpatialProfileAnalytics updateLeftEarEnrollDuration](self, "updateLeftEarEnrollDuration");
    sharedBluetoothSettingsLogComponent();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v25[0] = CFSTR("EnrollmentStatus");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_status);
      v4 = objc_claimAutoreleasedReturnValue();
      result = self->_result;
      v24 = (void *)v4;
      v26[0] = v4;
      v26[1] = result;
      v25[1] = CFSTR("EnrollmentResult");
      v25[2] = CFSTR("EnrollmentDuration");
      v6 = (void *)MEMORY[0x1E0CB37E8];
      faceEnrollmentStartTime = self->_faceEnrollmentStartTime;
      if (faceEnrollmentStartTime != 0.0)
        faceEnrollmentStartTime = CACurrentMediaTime() - self->_faceEnrollmentStartTime;
      objc_msgSend(v6, "numberWithDouble:", faceEnrollmentStartTime);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26[2] = v23;
      v25[3] = CFSTR("EnrollmentScanDuration");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_faceEnrollmentTime + self->_rightEarEnrollmentTime + self->_leftEarEnrollmentTime);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26[3] = v22;
      v25[4] = CFSTR("FaceEnrollmentDuration");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_faceEnrollmentTime);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26[4] = v21;
      v25[5] = CFSTR("RightEarEnrollmentDuration");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rightEarEnrollmentTime);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26[5] = v20;
      v25[6] = CFSTR("LeftEarEnrollmentDuration");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_leftEarEnrollmentTime);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26[6] = v19;
      v25[7] = CFSTR("LeftEarOcclusionCount");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_leftEarOcclusionDetectCount);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26[7] = v18;
      v25[8] = CFSTR("RightEarOcclusionCount");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_rightEarOcclusionDetectCount);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26[8] = v17;
      v25[9] = CFSTR("SoundProfileCreationDuration");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_soundProfileCreationTime);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v26[9] = v8;
      v25[10] = CFSTR("RightEarFrontAngleDuration");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rightEarFrontAngleTime);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v26[10] = v9;
      v25[11] = CFSTR("RightEarMidAngleDuration");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rightEarMidAngleTime);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v26[11] = v10;
      v25[12] = CFSTR("RightEarBackAngleDuration");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rightEarBackAngleTime);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26[12] = v11;
      v25[13] = CFSTR("LeftEarFrontAngleDuration");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_leftEarFrontAngleTime);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v26[13] = v12;
      v25[14] = CFSTR("LeftEarMidAngleDuration");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_leftEarMidAngleTime);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26[14] = v13;
      v25[15] = CFSTR("LeftEarBackAngleDuration");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_leftEarBackAngleTime);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26[15] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v15;
      _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Analytics Submit analysis : %@", buf, 0xCu);

    }
    AnalyticsSendEventLazy();
    if (!self->_status)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "postNotificationName:object:", CFSTR("SpatialProfileEnrollmentNotCompleted"), 0);

    }
    self->_submitted = 1;
  }
}

id __68__HPSSpatialProfileAnalytics_submitHPSSpatialProfileEnrollAnalytics__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  double v6;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[17];
  _QWORD v25[19];

  v25[17] = *MEMORY[0x1E0C80C00];
  v24[0] = CFSTR("EnrollmentStatus");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 160));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 152);
  v23 = (void *)v2;
  v25[0] = v2;
  v25[1] = v4;
  v24[1] = CFSTR("EnrollmentResult");
  v24[2] = CFSTR("EnrollmentEntry");
  v25[2] = *(_QWORD *)(v3 + 168);
  v24[3] = CFSTR("EnrollmentDuration");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = *(double *)(v3 + 24);
  if (v6 != 0.0)
    v6 = CACurrentMediaTime() - *(double *)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(v5, "numberWithDouble:", v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v22;
  v24[4] = CFSTR("EnrollmentScanDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 16)+ *(double *)(*(_QWORD *)(a1 + 32) + 40)+ *(double *)(*(_QWORD *)(a1 + 32) + 80));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v21;
  v24[5] = CFSTR("FaceEnrollmentDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 16));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v20;
  v24[6] = CFSTR("RightEarEnrollmentDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 40));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v19;
  v24[7] = CFSTR("LeftEarEnrollmentDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 80));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v18;
  v24[8] = CFSTR("LeftEarOcclusionCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 128));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v7;
  v24[9] = CFSTR("RightEarOcclusionCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 129));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[9] = v8;
  v24[10] = CFSTR("SoundProfileCreationDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 120));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[10] = v9;
  v24[11] = CFSTR("RightEarFrontAngleDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[11] = v10;
  v24[12] = CFSTR("RightEarMidAngleDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 56));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[12] = v11;
  v24[13] = CFSTR("RightEarBackAngleDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 64));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[13] = v12;
  v24[14] = CFSTR("LeftEarFrontAngleDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 88));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[14] = v13;
  v24[15] = CFSTR("LeftEarMidAngleDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 96));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[15] = v14;
  v24[16] = CFSTR("LeftEarBackAngleDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 104));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[16] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)submitHPSSpatialProfileResetAnalytics
{
  NSObject *v3;
  uint8_t v4[16];

  if (!self->_submitted)
  {
    sharedBluetoothSettingsLogComponent();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Reset Submit analysis", v4, 2u);
    }

    AnalyticsSendEventLazy();
    self->_submitted = 1;
  }
}

void *__67__HPSSpatialProfileAnalytics_submitHPSSpatialProfileResetAnalytics__block_invoke()
{
  return &unk_1EA2B5030;
}

+ (BOOL)isRBSProcessHandleAvailable
{
  if (isRBSProcessHandleAvailable_onceToken != -1)
    dispatch_once(&isRBSProcessHandleAvailable_onceToken, &__block_literal_global_52);
  return isRBSProcessHandleAvailable_available;
}

Class __57__HPSSpatialProfileAnalytics_isRBSProcessHandleAvailable__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("RBSProcessHandle"));
  isRBSProcessHandleAvailable_available = result != 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentBundleID, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

@end
