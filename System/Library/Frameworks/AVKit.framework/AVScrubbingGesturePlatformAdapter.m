@implementation AVScrubbingGesturePlatformAdapter

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)_abstractInit
{
  uint64_t v3;
  objc_super v5;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("AVScrubbingGesturePlatformAdapter cannot be instantiated directly. You must subclass it."));
  v5.receiver = self;
  v5.super_class = (Class)AVScrubbingGesturePlatformAdapter;
  return -[AVScrubbingGesturePlatformAdapter init](&v5, sel_init);
}

- (CGPoint)translation
{
  void *v2;
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  CGPoint result;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("You must override %@ in a subclass."), v4);

  v5 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v6;
  result.x = v5;
  return result;
}

- (float)timelineVelocity
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("You must override %@ in a subclass."), v4);

  return 0.0;
}

- (BOOL)gestureActive
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("You must override %@ in a subclass."), v4);

  return 0;
}

- (AVScrubbingGesturePlatformAdapterDelegate)delegate
{
  return (AVScrubbingGesturePlatformAdapterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)gestureEnabled
{
  return self->_gestureEnabled;
}

- (void)setGestureEnabled:(BOOL)a3
{
  self->_gestureEnabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
