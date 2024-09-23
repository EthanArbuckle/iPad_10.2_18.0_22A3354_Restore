@implementation AXCenterTapReplayableGesture

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXCenterTapReplayableGesture)init
{
  AXCenterTapReplayableGesture *v2;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *allEvents;
  _QWORD v18[2];
  objc_super v19;
  _QWORD v20[3];
  _QWORD v21[3];
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[4];
  CGRect v29;
  CGRect v30;

  v28[2] = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)AXCenterTapReplayableGesture;
  v2 = -[AXCenterTapReplayableGesture init](&v19, sel_init);
  if (v2)
  {
    v29.origin.x = AXDeviceGetMainScreenBounds();
    x = v29.origin.x;
    y = v29.origin.y;
    width = v29.size.width;
    height = v29.size.height;
    MidX = CGRectGetMidX(v29);
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    *(CGFloat *)v18 = MidX;
    v18[1] = CGRectGetMidY(v30);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v18, "{CGPoint=dd}");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = &unk_1E24F9150;
    v26[0] = CFSTR("Time");
    v26[1] = CFSTR("Fingers");
    v24 = &unk_1E24F8120;
    v25 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v11;
    v26[2] = CFSTR("Forces");
    v22 = &unk_1E24F8120;
    v23 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v13;
    v20[0] = CFSTR("Time");
    v20[1] = CFSTR("Fingers");
    v21[0] = &unk_1E24F9160;
    v21[1] = MEMORY[0x1E0C9AA70];
    v20[2] = CFSTR("Forces");
    v21[2] = MEMORY[0x1E0C9AA70];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v15 = objc_claimAutoreleasedReturnValue();
    allEvents = v2->super._allEvents;
    v2->super._allEvents = (NSArray *)v15;

    -[AXReplayableGesture setArePointsDeviceRelative:](v2, "setArePointsDeviceRelative:", 1);
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "isMemberOfClass:", objc_opt_class());

  return v4;
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

@end
