@implementation ASVInlinePreview(Private)

- (void)setEnableShadows:()Private
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__ASVInlinePreview_Private__setEnableShadows___block_invoke;
  v3[3] = &__block_descriptor_33_e51_v24__0___ARQLInlineService3__8__ASVInlinePreview_16l;
  v4 = a3;
  -[ASVInlinePreview getSharedInlineServiceFailable:](self, "getSharedInlineServiceFailable:", v3);
}

- (void)setIsLooping:()Private
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__ASVInlinePreview_Private__setIsLooping___block_invoke;
  v3[3] = &__block_descriptor_33_e51_v24__0___ARQLInlineService3__8__ASVInlinePreview_16l;
  v4 = a3;
  -[ASVInlinePreview getSharedInlineServiceFailable:](self, "getSharedInlineServiceFailable:", v3);
}

- (void)setIsMuted:()Private
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__ASVInlinePreview_Private__setIsMuted___block_invoke;
  v3[3] = &__block_descriptor_33_e51_v24__0___ARQLInlineService3__8__ASVInlinePreview_16l;
  v4 = a3;
  -[ASVInlinePreview getSharedInlineServiceFailable:](self, "getSharedInlineServiceFailable:", v3);
}

- (void)setAnimationObserverBlock:()Private
{
  id v4;
  NSObject *v5;
  void *v6;
  id animationObserverBlock;
  void *v8;
  NSTimer *v9;
  NSTimer *animationUpdateTimer;
  _QWORD v11[4];
  id v12;
  id buf;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v5 = _asvLogHandle;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v4 == 0;
    _os_log_impl(&dword_1D93A7000, v5, OS_LOG_TYPE_INFO, "#Inline: setAnimationObserverBlock: isnil? %d", (uint8_t *)&buf, 8u);
  }
  v6 = _Block_copy(v4);
  animationObserverBlock = self->_animationObserverBlock;
  self->_animationObserverBlock = v6;

  if (v4)
  {
    objc_initWeak(&buf, self);
    v8 = (void *)MEMORY[0x1E0C99E88];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55__ASVInlinePreview_Private__setAnimationObserverBlock___block_invoke;
    v11[3] = &unk_1E9F0C9B0;
    objc_copyWeak(&v12, &buf);
    objc_msgSend(v8, "scheduledTimerWithTimeInterval:repeats:block:", 1, v11, 0.5);
    v9 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    animationUpdateTimer = self->_animationUpdateTimer;
    self->_animationUpdateTimer = v9;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&buf);
  }
  else
  {
    -[NSTimer invalidate](self->_animationUpdateTimer, "invalidate");
  }

}

- (void)setCurrentTime:()Private
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__ASVInlinePreview_Private__setCurrentTime___block_invoke;
  v3[3] = &__block_descriptor_40_e51_v24__0___ARQLInlineService3__8__ASVInlinePreview_16l;
  *(double *)&v3[4] = a3;
  -[ASVInlinePreview getSharedInlineServiceFailable:](self, "getSharedInlineServiceFailable:", v3);
}

@end
