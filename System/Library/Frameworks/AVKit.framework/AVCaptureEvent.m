@implementation AVCaptureEvent

- (unint64_t)source
{
  return self->_source;
}

- (id)description
{
  unint64_t source;
  __CFString *v4;
  __CFString *v5;
  unint64_t phase;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  NSObject *v11;
  NSObject *v12;
  uint8_t buf[4];
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  source = self->_source;
  if (source)
  {
    if (source != 1)
    {
      _AVLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v14 = source;
        _os_log_impl(&dword_1AC4B1000, v12, OS_LOG_TYPE_DEFAULT, "Invalid AVCaptureEventSource %ld.", buf, 0xCu);
      }

      __assert_rtn("NSStringFromAVCaptureEventSource", "AVCaptureEvent.m", 127, "NO");
    }
    v4 = CFSTR("secondary");
  }
  else
  {
    v4 = CFSTR("primary");
  }
  v5 = v4;
  phase = self->_phase;
  if (phase >= 3)
  {
    _AVLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v14 = phase;
      _os_log_impl(&dword_1AC4B1000, v11, OS_LOG_TYPE_DEFAULT, "Invalid AVCaptureEventPhase %ld.", buf, 0xCu);
    }

    __assert_rtn("NSStringFromAVCaptureEventPhase", "AVCaptureEvent.m", 110, "NO");
  }
  v7 = v5;
  v8 = off_1E5BB12C0[phase];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{\n\tsource: %@\n\tphase: %@\n}"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)phase
{
  return self->_phase;
}

+ (id)eventWithSource:(unint64_t)a3 phase:(unint64_t)a4
{
  AVCaptureEvent *v6;

  v6 = objc_alloc_init(AVCaptureEvent);
  v6->_source = a3;
  v6->_phase = a4;
  return v6;
}

@end
