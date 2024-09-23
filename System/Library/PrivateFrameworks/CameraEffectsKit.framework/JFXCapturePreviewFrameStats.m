@implementation JFXCapturePreviewFrameStats

- (double)times
{
  return self->_frameTimes;
}

- (void)printLabels
{
  NSObject *v2;
  uint8_t v3[16];

  JFXLog_automation();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2269A9000, v2, OS_LOG_TYPE_DEFAULT, " GetBGBuffers | GenMatte (Total) | Render | WaitToDisplay | Total  | Dropped ", v3, 2u);
  }

}

- (void)printStats
{
  NSObject *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 dropped;
  int v11;
  double v12;
  __int16 v13;
  double v14;
  __int16 v15;
  double v16;
  __int16 v17;
  double v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  JFXLog_automation();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = self->_frameTimes[0];
    v5 = self->_frameTimes[1];
    v6 = self->_frameTimes[2];
    v7 = self->_frameTimes[3];
    v8 = self->_frameTimes[4];
    v9 = self->_frameTimes[5];
    dropped = self->_dropped;
    v11 = 134219520;
    v12 = v4;
    v13 = 2048;
    v14 = v6;
    v15 = 2048;
    v16 = v5;
    v17 = 2048;
    v18 = v7;
    v19 = 2048;
    v20 = v8;
    v21 = 2048;
    v22 = v9;
    v23 = 1024;
    v24 = dropped;
    _os_log_impl(&dword_2269A9000, v3, OS_LOG_TYPE_DEFAULT, " %12.3f | %8.3f (%5.3f) | %6.3f | %13.3f | %7.3f | %d ", (uint8_t *)&v11, 0x44u);
  }

}

- (BOOL)dropped
{
  return self->_dropped;
}

- (void)setDropped:(BOOL)a3
{
  self->_dropped = a3;
}

@end
