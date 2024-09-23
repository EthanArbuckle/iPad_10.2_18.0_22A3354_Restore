@implementation CAMCinematicFocusCommand

- (CAMCinematicFocusCommand)initWithMetadataObjectID:(int64_t)a3 atPointOfInterest:(CGPoint)a4 useFixedOpticalFocus:(BOOL)a5 useHardFocus:(BOOL)a6
{
  CGFloat y;
  CGFloat x;
  CAMCinematicFocusCommand *v11;
  CAMCinematicFocusCommand *v12;
  CAMCinematicFocusCommand *v13;
  objc_super v15;

  y = a4.y;
  x = a4.x;
  v15.receiver = self;
  v15.super_class = (Class)CAMCinematicFocusCommand;
  v11 = -[CAMCaptureCommand initWithSubcommands:](&v15, sel_initWithSubcommands_, 0);
  v12 = v11;
  if (v11)
  {
    v11->__metadataObjectID = a3;
    v11->__pointOfInterest.x = x;
    v11->__pointOfInterest.y = y;
    v11->__useFixedOpticalFocus = a5;
    v11->__useHardFocus = a6;
    v13 = v11;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMCinematicFocusCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v8, sel_copyWithZone_, a3);
  v4[4] = -[CAMCinematicFocusCommand _metadataObjectID](self, "_metadataObjectID");
  -[CAMCinematicFocusCommand _pointOfInterest](self, "_pointOfInterest");
  v4[5] = v5;
  v4[6] = v6;
  *((_BYTE *)v4 + 24) = -[CAMCinematicFocusCommand _useFixedOpticalFocus](self, "_useFixedOpticalFocus");
  *((_BYTE *)v4 + 25) = -[CAMCinematicFocusCommand _useHardFocus](self, "_useHardFocus");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  int64_t v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  double v14;
  double v15;
  int v16;
  void *v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  __CFString *v21;
  __int16 v22;
  __CFString *v23;
  uint64_t v24;
  CGPoint v25;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "currentVideoDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "isCinematicVideoFocusAtPointSupported");
    v6 = os_log_create("com.apple.camera", "Camera");
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        -[CAMCinematicFocusCommand _pointOfInterest](self, "_pointOfInterest");
        NSStringFromCGPoint(v25);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[CAMCinematicFocusCommand _metadataObjectID](self, "_metadataObjectID");
        if (-[CAMCinematicFocusCommand _useHardFocus](self, "_useHardFocus"))
          v10 = CFSTR("YES");
        else
          v10 = CFSTR("NO");
        v11 = v10;
        if (-[CAMCinematicFocusCommand _useFixedOpticalFocus](self, "_useFixedOpticalFocus"))
          v12 = CFSTR("YES");
        else
          v12 = CFSTR("NO");
        v13 = v12;
        v16 = 138544130;
        v17 = v8;
        v18 = 2048;
        v19 = v9;
        v20 = 2114;
        v21 = v11;
        v22 = 2114;
        v23 = v13;
        _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "Requested to set CinematicVideoFocus at point:%{public}@ objectID:%ld isHardFocus:%{public}@ isFixedPlaneFocus:%{public}@", (uint8_t *)&v16, 0x2Au);

      }
      -[CAMCinematicFocusCommand _pointOfInterest](self, "_pointOfInterest");
      objc_msgSend(v4, "setCinematicVideoFocusAtPoint:objectID:isHardFocus:isFixedPlaneFocus:", -[CAMCinematicFocusCommand _metadataObjectID](self, "_metadataObjectID"), -[CAMCinematicFocusCommand _useHardFocus](self, "_useHardFocus"), -[CAMCinematicFocusCommand _useFixedOpticalFocus](self, "_useFixedOpticalFocus"), v14, v15);
    }
    else
    {
      if (v7)
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to set cinematic focus on a video device that does not support it", (uint8_t *)&v16, 2u);
      }

    }
  }

}

- (int64_t)_metadataObjectID
{
  return self->__metadataObjectID;
}

- (CGPoint)_pointOfInterest
{
  double x;
  double y;
  CGPoint result;

  x = self->__pointOfInterest.x;
  y = self->__pointOfInterest.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)_useFixedOpticalFocus
{
  return self->__useFixedOpticalFocus;
}

- (BOOL)_useHardFocus
{
  return self->__useHardFocus;
}

@end
