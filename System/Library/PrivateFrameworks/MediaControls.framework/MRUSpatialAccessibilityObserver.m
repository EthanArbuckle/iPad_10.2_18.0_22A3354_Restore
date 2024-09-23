@implementation MRUSpatialAccessibilityObserver

- (BOOL)isMonoAudioEnabled
{
  return self->_isMonoAudioEnabled;
}

- (BOOL)isHeadTrackingEnabled
{
  return self->_isHeadTrackingEnabled;
}

- (MRUSpatialAccessibilityObserver)init
{
  MRUSpatialAccessibilityObserver *v2;
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRUSpatialAccessibilityObserver;
  v2 = -[MRUSpatialAccessibilityObserver init](&v6, sel_init);
  if (v2)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)lockToDeviceChanged, (CFStringRef)*MEMORY[0x1E0DDDF60], 0, (CFNotificationSuspensionBehavior)0);
    v4 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(v4, v2, (CFNotificationCallback)monoAudioEnabledChanged, (CFStringRef)*MEMORY[0x1E0DDE190], 0, (CFNotificationSuspensionBehavior)0);
    -[MRUSpatialAccessibilityObserver updateHeadTrackingSupported](v2, "updateHeadTrackingSupported");
    -[MRUSpatialAccessibilityObserver updateMonoAudioEnabled](v2, "updateMonoAudioEnabled");
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *v4;
  objc_super v5;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, self, (CFNotificationName)*MEMORY[0x1E0DDDF60], 0);
  v4 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(v4, self, (CFNotificationName)*MEMORY[0x1E0DDE190], 0);
  v5.receiver = self;
  v5.super_class = (Class)MRUSpatialAccessibilityObserver;
  -[MRUSpatialAccessibilityObserver dealloc](&v5, sel_dealloc);
}

- (void)updateHeadTrackingSupported
{
  uint64_t v3;
  _BOOL4 v4;
  _BOOL8 v5;
  id WeakRetained;

  v3 = _AXSSpatialAudioHeadTracking() & 3;
  v4 = v3 != 0;
  if (self->_isHeadTrackingEnabled != v4)
  {
    v5 = v3 != 0;
    self->_isHeadTrackingEnabled = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "spatialAccessilityObserver:didChangeHeadTrackingEnabled:", self, v5);

  }
}

- (void)updateMonoAudioEnabled
{
  self->_isMonoAudioEnabled = _AXSMonoAudioEnabled() != 0;
}

- (MRUSpatialAccessibilityObserverDelegate)delegate
{
  return (MRUSpatialAccessibilityObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setIsHeadTrackingEnabled:(BOOL)a3
{
  self->_isHeadTrackingEnabled = a3;
}

- (void)setIsMonoAudioEnabled:(BOOL)a3
{
  self->_isMonoAudioEnabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
