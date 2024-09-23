@implementation CAMAnalyticsVisionSession

- (CAMAnalyticsVisionSession)initWithTextDetectionEnabled:(BOOL)a3 MRCDetectionEnabled:(BOOL)a4
{
  CAMAnalyticsVisionSession *v6;
  CAMAnalyticsVisionSession *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CAMAnalyticsVisionSession;
  v6 = -[CAMAnalyticsEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->__textDetectionEnabled = a3;
    v6->__MRCDetectionEnabled = a4;
    v6->__startTime = CFAbsoluteTimeGetCurrent();
  }
  return v7;
}

- (id)eventName
{
  return CFSTR("vision.session");
}

- (void)countTextButtonPress
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB760000, v2, v3, "%{public}@ called when text detection is disabled", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)countButtonPressForMRC:(id)a3 action:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;

  v7 = a3;
  v8 = a4;
  if (-[CAMAnalyticsVisionSession _isMRCDetectionEnabled](self, "_isMRCDetectionEnabled"))
  {
    v9 = objc_msgSend(v7, "mrcType");
    if (v9 == 1)
    {
      -[CAMAnalyticsVisionSession _setAppClipButtonPressCount:](self, "_setAppClipButtonPressCount:", -[CAMAnalyticsVisionSession _appClipButtonPressCount](self, "_appClipButtonPressCount") + 1);
    }
    else if (!v9)
    {
      -[CAMAnalyticsVisionSession _setQRButtonPressCount:](self, "_setQRButtonPressCount:", -[CAMAnalyticsVisionSession _qrButtonPressCount](self, "_qrButtonPressCount") + 1);
      -[CAMAnalyticsVisionSession _countMRCTypeForAction:](self, "_countMRCTypeForAction:", v8);
    }
  }
  else
  {
    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CAMAnalyticsVisionSession countButtonPressForMRC:action:].cold.1(a2);

  }
}

- (void)countPillPressForMRC:(id)a3 action:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;

  v7 = a3;
  v8 = a4;
  if (-[CAMAnalyticsVisionSession _isMRCDetectionEnabled](self, "_isMRCDetectionEnabled"))
  {
    v9 = objc_msgSend(v7, "mrcType");
    if (v9 == 1)
    {
      -[CAMAnalyticsVisionSession _setAppClipPillPressCount:](self, "_setAppClipPillPressCount:", -[CAMAnalyticsVisionSession _appClipPillPressCount](self, "_appClipPillPressCount") + 1);
    }
    else if (!v9)
    {
      -[CAMAnalyticsVisionSession _setQRPillPressCount:](self, "_setQRPillPressCount:", -[CAMAnalyticsVisionSession _qrPillPressCount](self, "_qrPillPressCount") + 1);
      -[CAMAnalyticsVisionSession _countMRCTypeForAction:](self, "_countMRCTypeForAction:", v8);
    }
  }
  else
  {
    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CAMAnalyticsVisionSession countButtonPressForMRC:action:].cold.1(a2);

  }
}

- (void)countObservedSignficantTextRegionCount:(unint64_t)a3
{
  BOOL v6;
  NSObject *v7;
  unint64_t v8;
  unint64_t v9;

  v6 = -[CAMAnalyticsVisionSession _isTextDetectionEnabled](self, "_isTextDetectionEnabled");
  if (!a3 || v6)
  {
    v8 = -[CAMAnalyticsVisionSession _maxTextRegionCount](self, "_maxTextRegionCount");
    if (v8 <= a3)
      v9 = a3;
    else
      v9 = v8;
    -[CAMAnalyticsVisionSession _setMaxTextRegionCount:](self, "_setMaxTextRegionCount:", v9);
  }
  else
  {
    v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CAMAnalyticsVisionSession countTextButtonPress].cold.1(a2);

  }
}

- (void)countObservedSignficantMRCs:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[CAMAnalyticsVisionSession _isMRCDetectionEnabled](self, "_isMRCDetectionEnabled") || !objc_msgSend(v5, "count"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = 0;
      v12 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v7);
          v14 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "mrcType", (_QWORD)v19);
          if (v14 == 1)
          {
            ++v10;
          }
          else if (!v14)
          {
            ++v11;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }

    v15 = -[CAMAnalyticsVisionSession _maxQRCodeCount](self, "_maxQRCodeCount");
    if (v11 <= v15)
      v16 = v15;
    else
      v16 = v11;
    -[CAMAnalyticsVisionSession _setMaxQRCodeCount:](self, "_setMaxQRCodeCount:", v16, (_QWORD)v19);
    v17 = -[CAMAnalyticsVisionSession _maxAppClipCodeCount](self, "_maxAppClipCodeCount");
    if (v10 <= v17)
      v18 = v17;
    else
      v18 = v10;
    -[CAMAnalyticsVisionSession _setMaxAppClipCodeCount:](self, "_setMaxAppClipCodeCount:", v18);
  }
  else
  {
    v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CAMAnalyticsVisionSession countButtonPressForMRC:action:].cold.1(a2);

  }
}

- (void)publish
{
  void *v3;
  double Current;
  double v5;
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
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  Current = CFAbsoluteTimeGetCurrent();
  -[CAMAnalyticsVisionSession _startTime](self, "_startTime");
  v6 = Current - v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("duration"));

  objc_msgSend((id)objc_opt_class(), "durationRangeStringForDuration:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("durationRange"));

  if (-[CAMAnalyticsVisionSession _isTextDetectionEnabled](self, "_isTextDetectionEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CAMAnalyticsVisionSession _bucketedCount:](self, "_bucketedCount:", -[CAMAnalyticsVisionSession _textButtonPressCount](self, "_textButtonPressCount")));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("textButtonPressCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CAMAnalyticsVisionSession _bucketedCount:](self, "_bucketedCount:", -[CAMAnalyticsVisionSession _maxTextRegionCount](self, "_maxTextRegionCount")));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("maxTextRegionCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CAMAnalyticsVisionSession _textButtonPressCount](self, "_textButtonPressCount") != 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("didInteractWithText"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CAMAnalyticsVisionSession _maxTextRegionCount](self, "_maxTextRegionCount") != 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("didObserveText"));

  }
  if (-[CAMAnalyticsVisionSession _isMRCDetectionEnabled](self, "_isMRCDetectionEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CAMAnalyticsVisionSession _bucketedCount:](self, "_bucketedCount:", -[CAMAnalyticsVisionSession _qrButtonPressCount](self, "_qrButtonPressCount")));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("qrButtonPressCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CAMAnalyticsVisionSession _bucketedCount:](self, "_bucketedCount:", -[CAMAnalyticsVisionSession _appClipButtonPressCount](self, "_appClipButtonPressCount")));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("appClipButtonPressCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CAMAnalyticsVisionSession _bucketedCount:](self, "_bucketedCount:", -[CAMAnalyticsVisionSession _qrPillPressCount](self, "_qrPillPressCount")));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("qrPillPressCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CAMAnalyticsVisionSession _bucketedCount:](self, "_bucketedCount:", -[CAMAnalyticsVisionSession _appClipPillPressCount](self, "_appClipPillPressCount")));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("appClipPillPressCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CAMAnalyticsVisionSession _bucketedCount:](self, "_bucketedCount:", -[CAMAnalyticsVisionSession _maxQRCodeCount](self, "_maxQRCodeCount")));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("maxQRCodeCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CAMAnalyticsVisionSession _bucketedCount:](self, "_bucketedCount:", -[CAMAnalyticsVisionSession _maxAppClipCodeCount](self, "_maxAppClipCodeCount")));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("maxAppClipCodeCount"));

    v19 = (void *)MEMORY[0x1E0CB37E8];
    if (-[CAMAnalyticsVisionSession _qrButtonPressCount](self, "_qrButtonPressCount"))
      v20 = 1;
    else
      v20 = -[CAMAnalyticsVisionSession _qrPillPressCount](self, "_qrPillPressCount") != 0;
    objc_msgSend(v19, "numberWithInt:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("didInteractWithQR"));

    v22 = (void *)MEMORY[0x1E0CB37E8];
    if (-[CAMAnalyticsVisionSession _appClipButtonPressCount](self, "_appClipButtonPressCount"))
      v23 = 1;
    else
      v23 = -[CAMAnalyticsVisionSession _appClipPillPressCount](self, "_appClipPillPressCount") != 0;
    objc_msgSend(v22, "numberWithInt:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("didInteractWithAppClip"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CAMAnalyticsVisionSession _maxQRCodeCount](self, "_maxQRCodeCount") != 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("didObserveQR"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CAMAnalyticsVisionSession _maxAppClipCodeCount](self, "_maxAppClipCodeCount") != 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("didObserveAppClip"));

    -[CAMAnalyticsVisionSession _pressedQRTypes](self, "_pressedQRTypes");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMAnalyticsVisionSession _analyticsValueForQRTypes:](self, "_analyticsValueForQRTypes:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("pressedQRTypes"));

  }
  v29.receiver = self;
  v29.super_class = (Class)CAMAnalyticsVisionSession;
  -[CAMAnalyticsEvent publish](&v29, sel_publish);

}

- (int64_t)_bucketedCount:(int64_t)a3
{
  double v3;

  objc_msgSend((id)objc_opt_class(), "bucketedPowerOf2ForValue:allowZero:minPositiveValue:maxValue:", 1, (double)a3, 1.0, 64.0);
  return (uint64_t)v3;
}

- (void)_countMRCTypeForAction:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CAMAnalyticsVisionSession _pressedQRTypes](self, "_pressedQRTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMAnalyticsVisionSession _setPressedMRCTypes:](self, "_setPressedMRCTypes:", v4);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "payloadDataType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

- (id)_analyticsValueForQRTypes:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = (void *)MEMORY[0x1E0CB3928];
  v5 = a3;
  objc_msgSend(v4, "sortDescriptorWithKey:ascending:", CFSTR("integerValue"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__CAMAnalyticsVisionSession__analyticsValueForQRTypes___block_invoke;
  v15[3] = &unk_1EA329030;
  v15[4] = self;
  v10 = v9;
  v16 = v10;
  v17 = v8;
  v11 = v8;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v15);
  v12 = v17;
  v13 = v10;

  return v13;
}

void __55__CAMAnalyticsVisionSession__analyticsValueForQRTypes___block_invoke(id *a1, void *a2, unint64_t a3)
{
  id v5;

  objc_msgSend(a1[4], "_analyticsValueForQRType:", objc_msgSend(a2, "integerValue"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "appendString:");
  if (objc_msgSend(a1[6], "count") - 1 > a3)
    objc_msgSend(a1[5], "appendString:", CFSTR(","));

}

- (id)_analyticsValueForQRType:(int64_t)a3
{
  if ((unint64_t)a3 < 0xF)
    return off_1EA329050[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)totalMRCInteractions
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[CAMAnalyticsVisionSession _qrPillPressCount](self, "_qrPillPressCount");
  v4 = -[CAMAnalyticsVisionSession _appClipPillPressCount](self, "_appClipPillPressCount") + v3;
  v5 = -[CAMAnalyticsVisionSession _qrButtonPressCount](self, "_qrButtonPressCount");
  return v4 + v5 + -[CAMAnalyticsVisionSession _appClipPillPressCount](self, "_appClipPillPressCount");
}

- (BOOL)_isTextDetectionEnabled
{
  return self->__textDetectionEnabled;
}

- (BOOL)_isMRCDetectionEnabled
{
  return self->__MRCDetectionEnabled;
}

- (double)_startTime
{
  return self->__startTime;
}

- (void)_setStartTime:(double)a3
{
  self->__startTime = a3;
}

- (unint64_t)_textButtonPressCount
{
  return self->__textButtonPressCount;
}

- (void)_setTextButtonPressCount:(unint64_t)a3
{
  self->__textButtonPressCount = a3;
}

- (unint64_t)_qrButtonPressCount
{
  return self->__qrButtonPressCount;
}

- (void)_setQRButtonPressCount:(unint64_t)a3
{
  self->__qrButtonPressCount = a3;
}

- (unint64_t)_appClipButtonPressCount
{
  return self->__appClipButtonPressCount;
}

- (void)_setAppClipButtonPressCount:(unint64_t)a3
{
  self->__appClipButtonPressCount = a3;
}

- (unint64_t)_qrPillPressCount
{
  return self->__qrPillPressCount;
}

- (void)_setQRPillPressCount:(unint64_t)a3
{
  self->__qrPillPressCount = a3;
}

- (unint64_t)_appClipPillPressCount
{
  return self->__appClipPillPressCount;
}

- (void)_setAppClipPillPressCount:(unint64_t)a3
{
  self->__appClipPillPressCount = a3;
}

- (unint64_t)_maxTextRegionCount
{
  return self->__maxTextRegionCount;
}

- (void)_setMaxTextRegionCount:(unint64_t)a3
{
  self->__maxTextRegionCount = a3;
}

- (unint64_t)_maxQRCodeCount
{
  return self->__maxQRCodeCount;
}

- (void)_setMaxQRCodeCount:(unint64_t)a3
{
  self->__maxQRCodeCount = a3;
}

- (unint64_t)_maxAppClipCodeCount
{
  return self->__maxAppClipCodeCount;
}

- (void)_setMaxAppClipCodeCount:(unint64_t)a3
{
  self->__maxAppClipCodeCount = a3;
}

- (NSMutableSet)_pressedQRTypes
{
  return self->__pressedQRTypes;
}

- (void)_setPressedMRCTypes:(id)a3
{
  objc_storeStrong((id *)&self->__pressedQRTypes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__pressedQRTypes, 0);
}

- (void)countButtonPressForMRC:(const char *)a1 action:.cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB760000, v2, v3, "%{public}@ called when MRC detection is disabled", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end
