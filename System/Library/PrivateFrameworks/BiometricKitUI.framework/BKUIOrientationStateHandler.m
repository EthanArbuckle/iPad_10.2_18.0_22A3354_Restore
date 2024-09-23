@implementation BKUIOrientationStateHandler

- (BKUIOrientationStateHandler)init
{
  BKUIOrientationStateHandler *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKUIOrientationStateHandler;
  result = -[BKUIOrientationStateHandler init](&v3, sel_init);
  if (result)
  {
    *(_QWORD *)&result->_rawOrientationToken = -1;
    *(_QWORD *)&result->_rotationLockNotificationToken = -1;
  }
  return result;
}

- (int64_t)rawDeviceOrientationIgnoringOrientationLocks
{
  int rawOrientationToken;
  int v4;
  int64_t result;
  int64_t v7;
  int check;
  int out_token;

  out_token = 0;
  rawOrientationToken = self->_rawOrientationToken;
  if (rawOrientationToken == -1)
  {
    notify_register_check((const char *)RAW_ORIENTATION_TOKEN_NAME, &out_token);
    rawOrientationToken = out_token;
    self->_rawOrientationToken = out_token;
  }
  check = 0;
  notify_check(rawOrientationToken, &check);
  v4 = self->_rawOrientationToken;
  if (v4 == -1 || check == 0)
    return self->_lastKownOrientation;
  v7 = 0;
  notify_get_state(v4, (uint64_t *)&v7);
  result = v7;
  self->_lastKownOrientation = v7;
  return result;
}

- (BOOL)rotationLockStatusIsLocked
{
  int orientationLockToken;
  uint64_t v5;
  int out_token;

  out_token = 0;
  orientationLockToken = self->_orientationLockToken;
  if (orientationLockToken == -1)
  {
    notify_register_check((const char *)RAW_ORIENTATION_LOCK_TOKEN_NAME, &out_token);
    orientationLockToken = out_token;
    self->_orientationLockToken = out_token;
    if (orientationLockToken == -1)
      return 0;
  }
  v5 = 0;
  notify_get_state(orientationLockToken, &v5);
  return v5 != 0;
}

- (void)registerRotationObserver:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id buf;
  int out_token;

  v4 = a3;
  _BKUILoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1DB281000, v5, OS_LOG_TYPE_DEFAULT, "ForcedRotation:registerRotationObserver:", (uint8_t *)&buf, 2u);
  }

  if (self->_orientationNotificationToken == -1)
  {
    out_token = 0;
    objc_initWeak(&buf, self);
    v6 = (const char *)RAW_ORIENTATION_TOKEN_NAME;
    v7 = MEMORY[0x1E0C80D38];
    v8 = MEMORY[0x1E0C80D38];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__BKUIOrientationStateHandler_registerRotationObserver___block_invoke;
    v9[3] = &unk_1EA27FAF8;
    objc_copyWeak(&v11, &buf);
    v10 = v4;
    notify_register_dispatch(v6, &out_token, v7, v9);

    self->_orientationNotificationToken = out_token;
    objc_destroyWeak(&v11);
    objc_destroyWeak(&buf);
  }

}

void __56__BKUIOrientationStateHandler_registerRotationObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  uint64_t v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
    *((_DWORD *)WeakRetained + 2) = a2;
  v6 = +[BKUIOrientationStateHandler bkui_getState:](BKUIOrientationStateHandler, "bkui_getState:", a2);
  _BKUILoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v6;
    _os_log_impl(&dword_1DB281000, v7, OS_LOG_TYPE_DEFAULT, "ForcedRotation:[Rotation Callback] device orientation: %i", (uint8_t *)v9, 8u);
  }

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, unint64_t))(v8 + 16))(v8, v6);

}

- (void)registerRotationLockObserver:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  _QWORD v7[4];
  id v8;
  int out_token;

  v4 = a3;
  v5 = v4;
  if (self->_rotationLockNotificationToken == -1)
  {
    out_token = 0;
    v6 = (const char *)RAW_ORIENTATION_LOCK_TOKEN_NAME;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__BKUIOrientationStateHandler_registerRotationLockObserver___block_invoke;
    v7[3] = &unk_1EA27FB20;
    v8 = v4;
    notify_register_dispatch(v6, &out_token, MEMORY[0x1E0C80D38], v7);
    self->_rotationLockNotificationToken = out_token;

  }
}

uint64_t __60__BKUIOrientationStateHandler_registerRotationLockObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t result;

  v3 = +[BKUIOrientationStateHandler bkui_getState:](BKUIOrientationStateHandler, "bkui_getState:", a2);
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v3 != 0);
  return result;
}

+ (unint64_t)bkui_getState:(int)a3
{
  uint64_t state64;

  state64 = 0;
  notify_get_state(a3, &state64);
  return state64;
}

- (void)dealloc
{
  objc_super v3;

  -[BKUIOrientationStateHandler _invalidateTokenIfNeeded:](self, "_invalidateTokenIfNeeded:", self->_orientationNotificationToken);
  -[BKUIOrientationStateHandler _invalidateTokenIfNeeded:](self, "_invalidateTokenIfNeeded:", self->_rotationLockNotificationToken);
  -[BKUIOrientationStateHandler _invalidateTokenIfNeeded:](self, "_invalidateTokenIfNeeded:", self->_orientationLockToken);
  -[BKUIOrientationStateHandler _invalidateTokenIfNeeded:](self, "_invalidateTokenIfNeeded:", self->_rawOrientationToken);
  v3.receiver = self;
  v3.super_class = (Class)BKUIOrientationStateHandler;
  -[BKUIOrientationStateHandler dealloc](&v3, sel_dealloc);
}

- (void)_invalidateTokenIfNeeded:(int)a3
{
  if (notify_is_valid_token(a3))
    notify_cancel(a3);
}

- (int)rawOrientationToken
{
  return self->_rawOrientationToken;
}

- (void)setRawOrientationToken:(int)a3
{
  self->_rawOrientationToken = a3;
}

- (int)orientationLockToken
{
  return self->_orientationLockToken;
}

- (void)setOrientationLockToken:(int)a3
{
  self->_orientationLockToken = a3;
}

- (int)rotationLockNotificationToken
{
  return self->_rotationLockNotificationToken;
}

- (void)setRotationLockNotificationToken:(int)a3
{
  self->_rotationLockNotificationToken = a3;
}

- (int)orientationNotificationToken
{
  return self->_orientationNotificationToken;
}

- (void)setOrientationNotificationToken:(int)a3
{
  self->_orientationNotificationToken = a3;
}

- (int64_t)lastKownOrientation
{
  return self->_lastKownOrientation;
}

- (void)setLastKownOrientation:(int64_t)a3
{
  self->_lastKownOrientation = a3;
}

@end
