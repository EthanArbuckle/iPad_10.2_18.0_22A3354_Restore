@implementation CAMVideoRecordingCameraSelectionBehaviorCommand

- (CAMVideoRecordingCameraSelectionBehaviorCommand)initWithCameraSwitchingEnabled:(BOOL)a3
{
  CAMVideoRecordingCameraSelectionBehaviorCommand *v4;
  CAMVideoRecordingCameraSelectionBehaviorCommand *v5;
  CAMVideoRecordingCameraSelectionBehaviorCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMVideoRecordingCameraSelectionBehaviorCommand;
  v4 = -[CAMCaptureCommand init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->__cameraSwitchingEnabled = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMVideoRecordingCameraSelectionBehaviorCommand)initWithCoder:(id)a3
{
  id v4;
  CAMVideoRecordingCameraSelectionBehaviorCommand *v5;
  CAMVideoRecordingCameraSelectionBehaviorCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMVideoRecordingCameraSelectionBehaviorCommand;
  v5 = -[CAMCaptureCommand init](&v8, sel_init);
  if (v5)
  {
    v5->__cameraSwitchingEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CAMVideoRecordingCameraSelectionBehaviorCommandCameraSwitchingEnabled"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMVideoRecordingCameraSelectionBehaviorCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMVideoRecordingCameraSelectionBehaviorCommand _isCameraSwitchingEnabled](self, "_isCameraSwitchingEnabled", v5.receiver, v5.super_class), CFSTR("CAMVideoRecordingCameraSelectionBehaviorCommandCameraSwitchingEnabled"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMVideoRecordingCameraSelectionBehaviorCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMVideoRecordingCameraSelectionBehaviorCommand _isCameraSwitchingEnabled](self, "_isCameraSwitchingEnabled");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  _QWORD *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "currentVideoDevice");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentMovieFileOutput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CAMVideoRecordingCameraSelectionBehaviorCommand _isCameraSwitchingEnabled](self, "_isCameraSwitchingEnabled");
  objc_msgSend(v9, "bravoCameraSelectionBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C89F28]) & 1) == 0)
  {
    v8 = (_QWORD *)MEMORY[0x1E0C89F20];
    if (!v6)
      v8 = (_QWORD *)MEMORY[0x1E0C89F18];
    objc_msgSend(v5, "setBravoCameraSelectionBehaviorForRecording:", *v8);
  }

}

- (BOOL)_isCameraSwitchingEnabled
{
  return self->__cameraSwitchingEnabled;
}

@end
