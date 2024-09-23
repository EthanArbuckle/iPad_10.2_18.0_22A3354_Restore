@implementation AXCameraLevelingMotionAnalyzer

- (void)reset
{
  -[AXCameraLevelingMotionAnalyzer set_lastDeviceMotion:](self, "set_lastDeviceMotion:", 0);
  -[AXCameraLevelingMotionAnalyzer set_cameraStableForLeveling:](self, "set_cameraStableForLeveling:", 0);
  -[AXCameraLevelingMotionAnalyzer set_lastUnstableMotionTimestamp:](self, "set_lastUnstableMotionTimestamp:", 0.0);
}

- (int64_t)updateWithDeviceMotion:(id)a3 previousZone:(int64_t)a4
{
  id v6;
  void *v7;
  int64_t v8;

  v6 = a3;
  -[AXCameraLevelingMotionAnalyzer _lastDeviceMotion](self, "_lastDeviceMotion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCameraLevelingMotionAnalyzer _updateCameraStableForMotion:previousMotion:](self, "_updateCameraStableForMotion:previousMotion:", v6, v7);
  if (-[AXCameraLevelingMotionAnalyzer _cameraStableForLeveling](self, "_cameraStableForLeveling"))
    v8 = objc_msgSend((id)objc_opt_class(), "_levelZoneForDeviceMotion:previousZone:", v6, a4);
  else
    v8 = 0;
  -[AXCameraLevelingMotionAnalyzer set_lastDeviceMotion:](self, "set_lastDeviceMotion:", v6);

  return v8;
}

- (void)_updateCameraStableForMotion:(id)a3 previousMotion:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  BOOL v26;
  double v27;
  BOOL v28;
  BOOL v29;
  double v30;
  double v31;
  double v32;
  int v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(v6, "timestamp");
    v9 = v8;
    objc_msgSend(v7, "timestamp");
    if (v9 == v10)
    {
      AXMediaLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "timestamp");
        v33 = 134217984;
        v34 = v12;
        _os_log_impl(&dword_230B33000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring device motion for previously handled timestamp %f", (uint8_t *)&v33, 0xCu);
      }

    }
    else
    {
      objc_msgSend(v6, "attitude");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "copy");

      objc_msgSend(v7, "attitude");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "multiplyByInverseOfAttitude:", v15);

      objc_msgSend(v6, "timestamp");
      v17 = v16;
      objc_msgSend(v7, "timestamp");
      v19 = v17 - v18;
      objc_msgSend(v14, "pitch");
      v21 = fabs(v20 * 57.2957795) / v19;
      objc_msgSend(v14, "roll");
      v23 = v22;
      objc_msgSend(v14, "yaw");
      v25 = fabs(v24 * 57.2957795) / v19;
      v26 = v21 < 30.0 || v21 < v25;
      if (!v26
        || ((v27 = fabs(v23 * 57.2957795) / v19, v27 >= v25) ? (v28 = v27 < 30.0) : (v28 = 1),
            v28 ? (v29 = v25 > 100.0) : (v29 = 1),
            v29))
      {
        objc_msgSend(v6, "timestamp");
        -[AXCameraLevelingMotionAnalyzer set_lastUnstableMotionTimestamp:](self, "set_lastUnstableMotionTimestamp:");
      }
      objc_msgSend(v6, "timestamp");
      v31 = v30;
      -[AXCameraLevelingMotionAnalyzer _lastUnstableMotionTimestamp](self, "_lastUnstableMotionTimestamp");
      -[AXCameraLevelingMotionAnalyzer set_cameraStableForLeveling:](self, "set_cameraStableForLeveling:", v31 - v32 >= 0.6);

    }
  }
  else
  {
    -[AXCameraLevelingMotionAnalyzer set_cameraStableForLeveling:](self, "set_cameraStableForLeveling:", 0);
    objc_msgSend(v6, "timestamp");
    -[AXCameraLevelingMotionAnalyzer set_lastUnstableMotionTimestamp:](self, "set_lastUnstableMotionTimestamp:");
  }

}

+ (int64_t)_levelZoneForDeviceMotion:(id)a3 previousZone:(int64_t)a4
{
  double v5;
  long double v6;
  double v7;
  long double v8;
  double v9;
  long double v10;
  uint64_t v11;
  double v12;
  double v13;
  double v16;
  int64_t v17;

  objc_msgSend(a3, "gravity");
  v6 = v5;
  v9 = atan2(v8, -v7);
  v10 = acos(v6) + -1.57079633;
  v11 = objc_msgSend((id)objc_opt_class(), "_deviceOrientationForRotation:shift:", v9 * 57.2957795, (double)(v10 * 57.2957795));
  objc_msgSend((id)objc_opt_class(), "_offsetFromLevelForOrientation:rotation:shift:", v11, v9, (double)v10);
  v13 = fabs(v12);
  if ((unint64_t)(v11 - 5) < 0xFFFFFFFFFFFFFFFCLL || v13 > 25.0)
    return 0;
  v16 = 2.0;
  if (a4 == 1)
    v16 = 4.5;
  v17 = 2;
  if (v12 > 0.0)
    v17 = 3;
  if (v13 < v16)
    return 1;
  else
    return v17;
}

+ (int64_t)_deviceOrientationForRotation:(double)a3 shift:(double)a4
{
  double v5;

  if (fabs(a4) <= 45.0)
  {
    v5 = fabs(a3);
    if (v5 >= 45.0)
    {
      if (v5 <= 135.0)
      {
        if (a3 <= 45.0 || a3 >= 135.0)
        {
          if (a3 > -135.0 && a3 < -45.0)
            return 4;
          else
            return 0;
        }
        else
        {
          return 3;
        }
      }
      else
      {
        return 2;
      }
    }
    else
    {
      return 1;
    }
  }
  else if (a4 <= 0.0)
  {
    return 6;
  }
  else
  {
    return 5;
  }
}

+ (double)_offsetFromLevelForOrientation:(int64_t)a3 rotation:(double)a4 shift:(double)a5
{
  double v5;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  switch(a3)
  {
    case 1:
      return a4 * 57.2957795;
    case 2:
      if (a4 <= 3.14159265)
      {
        if (a4 < -3.14159265)
          a4 = a4 + 6.28318531;
      }
      else
      {
        a4 = -(6.28318531 - a4);
      }
      v7 = a4 + -3.14159265;
      if (a4 + -3.14159265 <= 3.14159265)
      {
        if (v7 >= -3.14159265)
          goto LABEL_28;
        v8 = 6.28318531;
      }
      else
      {
        v8 = -6.28318531;
      }
      a4 = v7 + v8 + 3.14159265;
LABEL_28:
      v13 = a4 * 57.2957795;
      v14 = -180.0;
      return v13 + v14;
    case 3:
      if (a4 <= 3.14159265)
      {
        if (a4 < -3.14159265)
          a4 = a4 + 6.28318531;
      }
      else
      {
        a4 = -(6.28318531 - a4);
      }
      v9 = a4 + -1.57079633;
      if (a4 + -1.57079633 <= 3.14159265)
      {
        if (v9 >= -3.14159265)
          goto LABEL_32;
        v10 = 6.28318531;
      }
      else
      {
        v10 = -6.28318531;
      }
      a4 = v9 + v10 + 1.57079633;
LABEL_32:
      v13 = a4 * 57.2957795;
      v14 = -90.0;
      return v13 + v14;
    case 4:
      if (a4 <= 3.14159265)
      {
        if (a4 < -3.14159265)
          a4 = a4 + 6.28318531;
      }
      else
      {
        a4 = -(6.28318531 - a4);
      }
      v11 = a4 + 2.35619449;
      if (a4 + 2.35619449 <= 3.14159265)
      {
        if (v11 >= -3.14159265)
          goto LABEL_36;
        v12 = 6.28318531;
      }
      else
      {
        v12 = -6.28318531;
      }
      a4 = v11 + v12 + -2.35619449;
LABEL_36:
      v13 = a4 * 57.2957795;
      v14 = 90.0;
      return v13 + v14;
    case 5:
      v5 = -1.57079633;
      goto LABEL_11;
    case 6:
      v5 = 1.57079633;
LABEL_11:
      a4 = a5 + v5;
      return a4 * 57.2957795;
    default:
      return 0.0;
  }
}

- (CMDeviceMotion)_lastDeviceMotion
{
  return self->__lastDeviceMotion;
}

- (void)set_lastDeviceMotion:(id)a3
{
  objc_storeStrong((id *)&self->__lastDeviceMotion, a3);
}

- (BOOL)_cameraStableForLeveling
{
  return self->__cameraStableForLeveling;
}

- (void)set_cameraStableForLeveling:(BOOL)a3
{
  self->__cameraStableForLeveling = a3;
}

- (double)_lastUnstableMotionTimestamp
{
  return self->__lastUnstableMotionTimestamp;
}

- (void)set_lastUnstableMotionTimestamp:(double)a3
{
  self->__lastUnstableMotionTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__lastDeviceMotion, 0);
}

@end
