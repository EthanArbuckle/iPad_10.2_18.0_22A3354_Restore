@implementation CAAccessibilityRamper

- (CAAccessibilityRamper)initWithDisplay:(id)a3
{
  CAAccessibilityRamper *v3;
  CAAccessibilityRamper *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)CAAccessibilityRamper;
  v3 = -[CAWindowServerRamper initWithDisplay:](&v6, sel_initWithDisplay_, a3);
  v4 = v3;
  if (v3)
  {
    -[CAAccessibilityRamper setAxScaleBegin:](v3, "setAxScaleBegin:", NAN);
    -[CAAccessibilityRamper setAxScaleEnd:](v4, "setAxScaleEnd:", NAN);
  }
  return v4;
}

- (void)rampCallback:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  NSObject *v34;
  CAWindowServerDisplay *v35;
  double v36;
  __CFRunLoop *Current;
  NSObject *v38;
  int v39;
  uint8_t buf[4];
  int v41;
  __int16 v42;
  double v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[CAAccessibilityRamper axScaleBegin](self, "axScaleBegin");
  v6 = v5;
  -[CAAccessibilityRamper axScaleEnd](self, "axScaleEnd");
  v8 = v7;
  -[CAWindowServerRamper beginTime](self, "beginTime");
  if (v9 <= 0.0)
  {
    objc_msgSend(a3, "targetTimestamp");
    -[CAWindowServerRamper setBeginTime:](self, "setBeginTime:");
  }
  objc_msgSend(a3, "targetTimestamp");
  v11 = v10;
  -[CAWindowServerRamper beginTime](self, "beginTime");
  v13 = v11 - v12;
  -[CAWindowServerRamper duration](self, "duration");
  if (v13 / v14 > 1.0
    || (objc_msgSend(a3, "targetTimestamp"),
        v16 = v15,
        -[CAWindowServerRamper beginTime](self, "beginTime"),
        v18 = v16 - v17,
        -[CAWindowServerRamper duration](self, "duration"),
        v20 = v18 / v19,
        v21 = 0.0,
        v20 >= 0.0))
  {
    objc_msgSend(a3, "targetTimestamp");
    v23 = v22;
    -[CAWindowServerRamper beginTime](self, "beginTime");
    v25 = v23 - v24;
    -[CAWindowServerRamper duration](self, "duration");
    v27 = v25 / v26;
    v21 = 1.0;
    if (v27 <= 1.0)
    {
      objc_msgSend(a3, "targetTimestamp");
      v29 = v28;
      -[CAWindowServerRamper beginTime](self, "beginTime");
      v31 = v29 - v30;
      -[CAWindowServerRamper duration](self, "duration");
      v21 = v31 / v32;
    }
  }
  v33 = pow(v6 / v8, 2.22044605e-16 - v21) * v6;
  if (x_log_hook_p())
  {
    -[CAWindowServerRamper id](self, "id");
    x_log_();
  }
  else
  {
    v34 = x_log_category_windowserver;
    if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v41 = -[CAWindowServerRamper id](self, "id");
      v42 = 2048;
      v43 = v33;
      _os_log_impl(&dword_184457000, v34, OS_LOG_TYPE_DEFAULT, "Ramp %d: Setting AX Scale to %g", buf, 0x12u);
    }
  }
  if ((*(_QWORD *)&v33 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    v35 = -[CAWindowServerRamper display](self, "display");
    *(float *)&v36 = v33;
    -[CAWindowServerDisplay setAccessibilityColorMatrix:scale:](v35, "setAccessibilityColorMatrix:scale:", &xmmword_18475F220, v36);
  }
  if (v21 == 1.0)
  {
    objc_msgSend(a3, "invalidate");
    Current = CFRunLoopGetCurrent();
    CFRunLoopStop(Current);
    if (x_log_hook_p())
    {
      -[CAWindowServerRamper id](self, "id");
      x_log_();
    }
    else
    {
      v38 = x_log_category_windowserver;
      if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
      {
        v39 = -[CAWindowServerRamper id](self, "id");
        *(_DWORD *)buf = 67109120;
        v41 = v39;
        _os_log_impl(&dword_184457000, v38, OS_LOG_TYPE_DEFAULT, "Ramp %d: Complete", buf, 8u);
      }
    }
  }
}

- (double)axScaleBegin
{
  return self->_axScaleBegin;
}

- (void)setAxScaleBegin:(double)a3
{
  self->_axScaleBegin = a3;
}

- (double)axScaleEnd
{
  return self->_axScaleEnd;
}

- (void)setAxScaleEnd:(double)a3
{
  self->_axScaleEnd = a3;
}

@end
