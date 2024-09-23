@implementation HPSSpatialProfileCrossHairs

- (HPSSpatialProfileCrossHairs)initWithView:(CGRect)a3 view:(id)a4
{
  id v6;
  HPSSpatialProfileCrossHairs *v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)HPSSpatialProfileCrossHairs;
  v7 = -[BKUIPearlCrossHairsView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v7)
    objc_storeStrong((id *)&_parentView, a4);

  return v7;
}

- (void)nudgeCustomDirection:(unint64_t)a3 completion:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HPSSpatialProfileCrossHairs;
  -[BKUIPearlCrossHairsView nudgeInDirection:smallNudgePeak:largeNudgePeak:completion:](&v4, sel_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion_, a3, 0, 0, a4);
}

- (void)nudgeInDirection:(unint64_t)a3 smallNudgePeak:(id)a4 largeNudgePeak:(id)a5 completion:(id)a6
{
  void (**v10)(_QWORD);
  void (**v11)(_QWORD);
  void (**v12)(_QWORD);
  NSObject *v13;
  objc_super v14;
  uint8_t buf[4];
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10 = (void (**)(_QWORD))a4;
  v11 = (void (**)(_QWORD))a5;
  v12 = (void (**)(_QWORD))a6;
  sharedBluetoothSettingsLogComponent();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v16 = a3;
    _os_log_impl(&dword_1DB30C000, v13, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Nudging Requesr in direction  %d", buf, 8u);
  }

  if ((objc_msgSend((id)_parentView, "faceCaptured") & 1) != 0)
  {
    if (v10)
      v10[2](v10);
    if (v11)
      v11[2](v11);
    if (v12)
      v12[2](v12);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HPSSpatialProfileCrossHairs;
    -[BKUIPearlCrossHairsView nudgeInDirection:smallNudgePeak:largeNudgePeak:completion:](&v14, sel_nudgeInDirection_smallNudgePeak_largeNudgePeak_completion_, a3, v10, v11, v12);
  }

}

@end
