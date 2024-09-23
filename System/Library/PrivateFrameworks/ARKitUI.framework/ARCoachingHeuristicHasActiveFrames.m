@implementation ARCoachingHeuristicHasActiveFrames

- (void)updateWithFrame:(id)a3 cache:(id)a4
{
  double v5;
  double v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  _BOOL4 v10;
  int frameCount;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  int v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  objc_class *v19;
  _BYTE v20[24];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "timestamp");
  v6 = v5;
  if (self->_frameCount && v5 - self->_lastFrameTimestamp > 1.0)
  {
    _ARLogCoaching_3();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v20 = 138543618;
      *(_QWORD *)&v20[4] = v9;
      *(_WORD *)&v20[12] = 2048;
      *(_QWORD *)&v20[14] = self;
      _os_log_impl(&dword_1DCC73000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Active frame updates are too old, resetting frame count", v20, 0x16u);

    }
    self->_frameCount = 0;
  }
  self->_lastFrameTimestamp = v6;
  v10 = -[ARCoachingHeuristic satisfied](self, "satisfied");
  frameCount = self->_frameCount;
  self->_frameCount = frameCount + 1;
  if (!v10 && frameCount >= 4)
  {
    _ARLogCoaching_3();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = self->_frameCount;
      *(_DWORD *)v20 = 138543874;
      *(_QWORD *)&v20[4] = v14;
      *(_WORD *)&v20[12] = 2048;
      *(_QWORD *)&v20[14] = self;
      *(_WORD *)&v20[22] = 1024;
      LODWORD(v21) = v15;
      v16 = "%{public}@ <%p>: Frames are considered active after seeing %d recent frames";
      v17 = v12;
      v18 = 28;
LABEL_14:
      _os_log_impl(&dword_1DCC73000, v17, OS_LOG_TYPE_INFO, v16, v20, v18);

      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (v10 && frameCount <= 3)
  {
    _ARLogCoaching_3();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v20 = 138543618;
      *(_QWORD *)&v20[4] = v14;
      *(_WORD *)&v20[12] = 2048;
      *(_QWORD *)&v20[14] = self;
      v16 = "%{public}@ <%p>: Frames are no longer considered active";
      v17 = v12;
      v18 = 22;
      goto LABEL_14;
    }
LABEL_15:

  }
  -[ARCoachingHeuristic setSatisfied:](self, "setSatisfied:", frameCount > 3, *(_OWORD *)v20, *(_QWORD *)&v20[16], v21);
}

@end
