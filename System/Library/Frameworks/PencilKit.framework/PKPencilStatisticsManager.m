@implementation PKPencilStatisticsManager

+ (id)allowedBundleIDFromBundleID:(id)a3
{
  id v4;
  __CFString *v5;

  v4 = a3;
  if (objc_msgSend(a1, "isAllowedBundleID:", v4))
  {
    v5 = (__CFString *)v4;
  }
  else if (objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple")))
  {
    v5 = CFSTR("<unspecified Apple bundleID>");
  }
  else
  {
    v5 = CFSTR("<unspecified bundle ID>");
  }

  return v5;
}

- (void)startAnalyticsSessionIfNecessary
{
  uint64_t v2;
  uint64_t v3;
  SEL v4;
  SEL v5;
  void *v6;
  void *v7;
  SEL v8;
  id v9;

  if (a1 && !*(_BYTE *)(a1 + 16))
  {
    v2 = operator new();
    *(_BYTE *)v2 = 0;
    *(_QWORD *)(v2 + 72) = 0;
    *(_DWORD *)(v2 + 80) = 0;
    *(_QWORD *)(v2 + 8) = 0;
    *(_QWORD *)(v2 + 16) = 0;
    v3 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v2;
    if (v3)
      MEMORY[0x1C3B7F770](v3, 0x1000C405BA05615);
    *(_QWORD *)(a1 + 24) = 0;
    *(_QWORD *)(a1 + 32) = 0;
    *(_QWORD *)(a1 + 64) = 0;
    *(_QWORD *)(a1 + 72) = 0;
    *(_QWORD *)(a1 + 56) = 0;
    *(_QWORD *)(a1 + 96) = 0;
    *(_QWORD *)(a1 + 104) = 0;
    *(CFTimeInterval *)(a1 + 48) = CACurrentMediaTime();
    *(_QWORD *)(a1 + 80) = 0;
    *(_QWORD *)(a1 + 88) = 0;
    objc_setProperty_nonatomic_copy((id)a1, v4, 0, 40);
    objc_setProperty_nonatomic_copy((id)a1, v5, 0, 112);
    *(_QWORD *)(a1 + 120) = 0;
    *(_BYTE *)(a1 + 16) = 1;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "allowedBundleIDFromBundleID:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_nonatomic_copy((id)a1, v8, v7, 112);

  }
}

- (void)endAnalyticsSessionIfNecessary
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  PKRunningStat *v5;
  uint64_t numValues;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __CFString *v13;

  if (a1)
  {
    if (*(_BYTE *)(a1 + 16))
    {
      *(_BYTE *)(a1 + 16) = 0;
      if (CACurrentMediaTime() - *(double *)(a1 + 48) > 0.0)
      {
        v2 = *(__CFString **)(a1 + 40);
        if (!v2)
          v2 = CFSTR("<unspecified tool>");
        v13 = v2;
        v3 = *(__CFString **)(a1 + 112);
        if (!v3)
          v3 = CFSTR("<unspecified bundle ID>");
        v4 = v3;
        v5 = *(PKRunningStat **)(a1 + 8);
        if (v5)
        {
          os_unfair_lock_lock(&v5->lock);
          numValues = v5->numValues;
          os_unfair_lock_unlock(&v5->lock);
          PKRunningStat::max(v5);
          PKRunningStat::min(v5);
          PKRunningStat::mean(v5);
        }
        else
        {
          numValues = 0;
        }
        v7 = +[PKHoverSettings isHoverEnabled](PKHoverSettings, "isHoverEnabled");
        v8 = +[PKHoverSettings allowDoubleTapOnlyWithPencilHover](PKHoverSettings, "allowDoubleTapOnlyWithPencilHover");
        +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isScribbleActive");

        IOPSDrawingUnlimitedPower();
        +[PKStatisticsManager sharedStatisticsManager]();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKStatisticsManager recordHoverDuration:onScreenDuration:hoverEdgeDuration:hoverExteriorDuration:sessionDuration:showEffectsEnabled:shadowEnabled:scribbleEnabled:doubleTapOnlyInHoverRangeEnabled:doubleTapsInRange:doubleTapsOutsideRange:deviceIsConnectedToCharger:intentionalHoverDuration:intentionalToolPreviewHoverDuration:countIntentionalHoverActions:maxIntentionalHoverDuration:meanIntentionalHoverDuration:minIntentionalHoverDuration:]((uint64_t)v11);

        +[PKStatisticsManager sharedStatisticsManager]();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKStatisticsManager recordHoverToolType:hoverDuration:intentionalToolPreviewHoverDuration:intentionalHoverDuration:maxIntentionalHoverDuration:meanIntentionalHoverDuration:minIntentionalHoverDuration:countIntentionalHoverActions:activepencilminutes:onScreenDuration:settingShowEffectsEnabled:settingSystemShadowEnabled:settingScribbleEnabled:settingDoubleTapInRangeEnabled:bundleID:]((uint64_t)v12, v13, numValues, v7, 0, v10, v8, v4);

      }
    }
  }
}

+ (BOOL)isAllowedBundleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;
  void *__p;
  char v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilenotes"));

  if ((v6 & 1) != 0 || (objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.quicklook")) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
    if (v10 < 0)
      operator delete(__p);
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  PKRunningStat *value;

  objc_storeStrong((id *)&self->_allowedBundleID, 0);
  objc_storeStrong((id *)&self->_toolName, 0);
  value = self->_intentionalHoverStats.__ptr_.__value_;
  self->_intentionalHoverStats.__ptr_.__value_ = 0;
  if (value)
    JUMPOUT(0x1C3B7F770);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
