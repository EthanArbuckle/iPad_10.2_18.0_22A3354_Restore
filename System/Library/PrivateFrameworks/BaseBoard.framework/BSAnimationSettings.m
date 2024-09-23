@implementation BSAnimationSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_timingFunction, 0);
}

- (BOOL)isSpringAnimation
{
  return self->_isSpring;
}

- (CAFrameRateRange)preferredFrameRateRange
{
  os_unfair_lock_s *p_lock;
  float minimum;
  float maximum;
  float preferred;
  float v7;
  float v8;
  float v9;
  CAFrameRateRange result;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  minimum = self->_lock_frameRange.minimum;
  maximum = self->_lock_frameRange.maximum;
  preferred = self->_lock_frameRange.preferred;
  os_unfair_lock_unlock(p_lock);
  v7 = minimum;
  v8 = maximum;
  v9 = preferred;
  result.preferred = v9;
  result.maximum = v8;
  result.minimum = v7;
  return result;
}

- (unsigned)highFrameRateReason
{
  BSAnimationSettings *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LODWORD(v2) = v2->_lock_highFrameRateReason;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (float)speed
{
  os_unfair_lock_s *p_lock;
  float lock_speed;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_speed = self->_lock_speed;
  os_unfair_lock_unlock(p_lock);
  return lock_speed;
}

- (double)frameInterval
{
  os_unfair_lock_s *p_lock;
  double lock_frameInterval;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_frameInterval = self->_lock_frameInterval;
  os_unfair_lock_unlock(p_lock);
  return lock_frameInterval;
}

- (double)delay
{
  os_unfair_lock_s *p_lock;
  double lock_delay;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_delay = self->_lock_delay;
  os_unfair_lock_unlock(p_lock);
  return lock_delay;
}

- (CAMediaTimingFunction)timingFunction
{
  os_unfair_lock_s *p_lock;
  CAMediaTimingFunction *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_timingFunction;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  os_unfair_lock_s *p_lock;
  __objc2_class **v5;
  __objc2_class *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  if (!self->_mutable)
    return self;
  os_unfair_lock_lock(p_lock);
  v5 = off_1E1EBCB30;
  if (self->_isSpring)
    v5 = off_1E1EBCD48;
  v6 = -[__objc2_class allocWithZone:](*v5, "allocWithZone:", a3);
  v10 = (void *)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](v6, self->_lock_storedDurationIsDirty, self->_lock_highFrameRateReason, self->_lock_timingFunction, self->_isSpring, self->_lock_storedDuration, self->_lock_delay, self->_lock_frameInterval, self->_lock_frameRange.minimum, self->_lock_frameRange.maximum, self->_lock_frameRange.preferred, self->_lock_speed, self->_lock_mass, v7, v8, v9, *(_QWORD *)&self->_lock_stiffness, *(_QWORD *)&self->_lock_damping, self->_lock_epsilon,
                  *(_QWORD *)&self->_lock_initialVelocity);

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  os_unfair_lock_s *p_lock;
  __objc2_class **v6;
  __objc2_class *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = off_1E1EBCC50;
  if (self->_isSpring)
    v6 = off_1E1EBCC98;
  v7 = -[__objc2_class allocWithZone:](*v6, "allocWithZone:", a3);
  v11 = (void *)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](v7, self->_lock_storedDurationIsDirty, self->_lock_highFrameRateReason, self->_lock_timingFunction, self->_isSpring, self->_lock_storedDuration, self->_lock_delay, self->_lock_frameInterval, self->_lock_frameRange.minimum, self->_lock_frameRange.maximum, self->_lock_frameRange.preferred, self->_lock_speed, self->_lock_mass, v8, v9, v10, *(_QWORD *)&self->_lock_stiffness, *(_QWORD *)&self->_lock_damping, self->_lock_epsilon,
                  *(_QWORD *)&self->_lock_initialVelocity);

  os_unfair_lock_unlock(p_lock);
  return v11;
}

+ (id)settingsWithDuration:(double)a3 timingFunction:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v6 = a4;
  v7 = objc_alloc((Class)a1);
  v11 = (void *)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](v7, 0, 0, v6, 0, a3, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, v8, v9, v10, 0, 0, 0.0,
                  0);

  return v11;
}

- (BSAnimationSettings)initWithXPCDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  double (**v9)(_QWORD, _QWORD, _QWORD, double);
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  size_t v15;
  char v16;
  objc_class *v17;
  void *v18;
  int64_t value;
  uint64_t v20;
  NSObject *v21;
  float v22;
  float v23;
  float v24;
  void *v25;
  void *v26;
  NSObject *v27;
  int v28;
  _BOOL4 v29;
  void *v30;
  float v31;
  float v32;
  uint64_t v33;
  double v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  size_t v44;
  char v45;
  objc_class *v46;
  void *v47;
  double v48;
  BOOL v49;
  float v50;
  NSObject *v51;
  double v52;
  BSAnimationSettings *v53;
  id CAMediaTimingFunctionClass;
  double v56;
  double v57;
  double v58;
  double v59;
  float v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  _QWORD v65[4];
  id v66;
  __int16 v67;
  uint64_t v68;
  uint64_t v69;
  uint8_t buf[4];
  const char *v71;
  __int16 v72;
  const char *v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v67 = 0;
  v64 = v4;
  if (v4)
  {
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __45__BSAnimationSettings_initWithXPCDictionary___block_invoke;
    v65[3] = &unk_1E1EBF5E0;
    v8 = v4;
    v66 = v8;
    v9 = (double (**)(_QWORD, _QWORD, _QWORD, double))MEMORY[0x18D769CFC](v65);
    v10 = ((double (**)(_QWORD, const char *, char *, double))v9)[2](v9, "l", (char *)&v67 + 1, 0.0);
    v11 = ((double (**)(_QWORD, const char *, _QWORD, double))v9)[2](v9, "w", 0, 0.0);
    v12 = ((double (**)(_QWORD, const char *, _QWORD, double))v9)[2](v9, "f", 0, 0.0);
    xpc_dictionary_get_value(v8, "r");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v62 = v11;
    v63 = v10;
    v61 = v12;
    if (v13)
    {
      LODWORD(v69) = 0;
      v68 = 0;
      if (object_getClass(v13) == (Class)MEMORY[0x1E0C812C8] && xpc_array_get_count(v14) == 3)
      {
        v15 = 0;
        v16 = 1;
        v17 = (objc_class *)MEMORY[0x1E0C81328];
        do
        {
          xpc_array_get_value(v14, v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (object_getClass(v18) == v17)
          {
            value = xpc_int64_get_value(v18);
            if (value <= (uint64_t)0xFFFFFFFF80000000)
              v20 = 0xFFFFFFFF80000000;
            else
              v20 = value;
            if (v20 >= 0x7FFFFFFF)
              LODWORD(v20) = 0x7FFFFFFF;
            *((_DWORD *)&v68 + v15) = v20;
          }
          else
          {
            v16 = 0;
          }

          ++v15;
        }
        while (v15 != 3);
        if ((v16 & 1) != 0)
        {
          v24 = (float)(int)v68;
          v23 = (float)SHIDWORD(v68);
          v22 = (float)(int)v69;
LABEL_20:
          xpc_dictionary_get_value(v8, "x");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v25;
          v60 = v22;
          if (v25)
          {
            if (object_getClass(v25) == (Class)MEMORY[0x1E0C81328])
            {
              v28 = xpc_int64_get_value(v26);
LABEL_28:
              xpc_dictionary_get_value(v8, "t");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = v42;
              if (v42)
              {
                v68 = 0;
                v69 = 0;
                if (object_getClass(v42) == (Class)MEMORY[0x1E0C812C8] && xpc_array_get_count(v43) == 4)
                {
                  v44 = 0;
                  v45 = 1;
                  v46 = (objc_class *)MEMORY[0x1E0C81300];
                  do
                  {
                    xpc_array_get_value(v43, v44);
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    if (object_getClass(v47) != v46
                      || ((v48 = xpc_double_get_value(v47), v48 >= 0.0) ? (v49 = v48 > 1.0) : (v49 = 1), v49))
                    {
                      v45 = 0;
                    }
                    else
                    {
                      v50 = v48;
                      *((float *)&v68 + v44) = v50;
                    }

                    ++v44;
                  }
                  while (v44 != 4);
                  if ((v45 & 1) != 0)
                  {
                    CAMediaTimingFunctionClass = getCAMediaTimingFunctionClass();
                    LODWORD(v57) = HIDWORD(v68);
                    LODWORD(v56) = v68;
                    LODWORD(v59) = HIDWORD(v69);
                    LODWORD(v58) = v69;
                    objc_msgSend(CAMediaTimingFunctionClass, "functionWithControlPoints::::", v56, v57, v58, v59);
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    goto LABEL_45;
                  }
                }
                BSLogCommon();
                v51 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  v71 = "-[BSAnimationSettings initWithXPCDictionary:]";
                  v72 = 2114;
                  v73 = (const char *)v43;
                  _os_log_error_impl(&dword_18A184000, v51, OS_LOG_TYPE_ERROR, "%s the encoded timingFunction format is unknown -> %{public}@", buf, 0x16u);
                }

              }
              v30 = 0;
LABEL_45:
              v52 = ((double (**)(_QWORD, const char *, _QWORD, double))v9)[2](v9, "p", 0, 1.0);
              v38 = ((double (**)(_QWORD, const char *, __int16 *, double))v9)[2](v9, "m", &v67, 0.0);
              v37 = ((double (**)(_QWORD, const char *, __int16 *, double))v9)[2](v9, "s", &v67, 0.0);
              v33 = ((double (**)(_QWORD, const char *, __int16 *, double))v9)[2](v9, "d", &v67, 0.0);
              v34 = ((double (**)(_QWORD, const char *, __int16 *, double))v9)[2](v9, "e", &v67, 0.0);
              v36 = ((double (**)(_QWORD, const char *, __int16 *, double))v9)[2](v9, "v", &v67, 0.0);

              v32 = v52;
              v35 = HIBYTE(v67) == 0;
              v29 = v67 != 0;
              v40 = v62;
              v41 = v63;
              v39 = v61;
              v31 = v60;
              goto LABEL_46;
            }
            BSLogCommon();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              v71 = "-[BSAnimationSettings initWithXPCDictionary:]";
              v72 = 2080;
              v73 = "x";
              v74 = 2112;
              v75 = v26;
              _os_log_error_impl(&dword_18A184000, v27, OS_LOG_TYPE_ERROR, "%{public}s the encoded format for %s is unknown -> %@", buf, 0x20u);
            }

          }
          v28 = 0;
          goto LABEL_28;
        }
      }
      BSLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v71 = "-[BSAnimationSettings initWithXPCDictionary:]";
        v72 = 2114;
        v73 = (const char *)v14;
        _os_log_error_impl(&dword_18A184000, v21, OS_LOG_TYPE_ERROR, "%s the encoded frameRange format is unknown -> %{public}@", buf, 0x16u);
      }

    }
    v22 = 0.0;
    v23 = 0.0;
    v24 = 0.0;
    goto LABEL_20;
  }
  v29 = 0;
  v30 = 0;
  v28 = 0;
  v31 = 0.0;
  v32 = 1.0;
  v33 = 0;
  v34 = 0.0;
  v35 = 1;
  v36 = 0;
  v37 = 0;
  v38 = 0.0;
  v23 = 0.0;
  v24 = 0.0;
  v39 = 0.0;
  v40 = 0.0;
  v41 = 0.0;
LABEL_46:
  v53 = (BSAnimationSettings *)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](self, v35, v28, v30, v29, v41, v40, v39, v24, v23, v31, v32, v38, v5, v6, v7, v37, v33, v34,
                                 v36);

  return v53;
}

double __45__BSAnimationSettings_initWithXPCDictionary___block_invoke(uint64_t a1, const char *a2, _BYTE *a3, double value)
{
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (object_getClass(v7) == (Class)MEMORY[0x1E0C81300])
    {
      if (a3)
        *a3 = 1;
      value = xpc_double_get_value(v8);
    }
    else
    {
      BSLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v11 = 136446722;
        v12 = "-[BSAnimationSettings initWithXPCDictionary:]_block_invoke";
        v13 = 2080;
        v14 = a2;
        v15 = 2112;
        v16 = v8;
        _os_log_error_impl(&dword_18A184000, v9, OS_LOG_TYPE_ERROR, "%{public}s the encoded format for %s is unknown -> %@", (uint8_t *)&v11, 0x20u);
      }

    }
  }

  return value;
}

+ (id)settingsWithDuration:(double)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_alloc((Class)a1);
  return objc_autoreleaseReturnValue((id)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](v4, 0, 0, 0, 0, a3, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, v5, v6, v7, 0, 0, 0.0,
                                           0));
}

+ (id)settingsWithDuration:(double)a3 delay:(double)a4 timingFunction:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v8 = a5;
  v9 = objc_alloc((Class)a1);
  v13 = (void *)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](v9, 0, 0, v8, 0, a3, a4, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, v10, v11, v12, 0, 0, 0.0,
                  0);

  return v13;
}

- (uint64_t)_initWithStoredDuration:(int)a3 storedDurationIsDirty:(void *)a4 delay:(int)a5 frameInterval:(double)a6 frameRange:(double)a7 highFrameRateReason:(double)a8 timingFunction:(float)a9 speed:(float)a10 mass:(float)a11 stiffness:(float)a12 damping:(double)a13 epsilon:(uint64_t)a14 initialVelocity:(uint64_t)a15 isSpring:(uint64_t)a16
{
  id v33;
  uint64_t v34;
  void *v35;
  char v36;
  id v37;
  uint64_t v38;
  objc_super v40;

  v33 = a4;
  if (!a1)
  {
    v38 = 0;
    goto LABEL_13;
  }
  v34 = objc_opt_class();
  if (a5)
  {
    if (v34 != objc_opt_class())
    {
      if (v34 != objc_opt_class())
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithStoredDuration_storedDurationIsDirty_delay_frameInterval_frameRange_highFrameRateReason_timingFunction_speed_mass_stiffness_damping_epsilon_initialVelocity_isSpring_, a1, CFSTR("BSAnimationSettings.m"), 83, CFSTR("invalid class type: %@"), v34);
LABEL_15:

        goto LABEL_8;
      }
      goto LABEL_8;
    }
LABEL_9:
    v36 = 1;
    goto LABEL_10;
  }
  if (v34 == objc_opt_class())
    goto LABEL_9;
  if (v34 != objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithStoredDuration_storedDurationIsDirty_delay_frameInterval_frameRange_highFrameRateReason_timingFunction_speed_mass_stiffness_damping_epsilon_initialVelocity_isSpring_, a1, CFSTR("BSAnimationSettings.m"), 89, CFSTR("invalid class type: %@"), v34);
    goto LABEL_15;
  }
LABEL_8:
  v36 = 0;
LABEL_10:
  v40.receiver = a1;
  v40.super_class = (Class)BSAnimationSettings;
  v37 = objc_msgSendSuper2(&v40, sel_init);
  v38 = (uint64_t)v37;
  if (v37)
  {
    *((_DWORD *)v37 + 2) = 0;
    *((_BYTE *)v37 + 105) = v36;
    *((_BYTE *)v37 + 106) = a5;
    *((_BYTE *)v37 + 104) = a2;
    *((double *)v37 + 2) = a6;
    *((double *)v37 + 3) = a7;
    *((double *)v37 + 4) = a8;
    *((float *)v37 + 10) = a9;
    *((float *)v37 + 11) = a10;
    *((float *)v37 + 12) = a11;
    *((_DWORD *)v37 + 13) = a3;
    objc_storeStrong((id *)v37 + 7, a4);
    -[BSAnimationSettings _setTimingFunction:](v38, *(void **)(v38 + 56));
    *(float *)(v38 + 12) = a12;
    if (*(_BYTE *)(v38 + 106))
    {
      *(double *)(v38 + 64) = a13;
      *(_QWORD *)(v38 + 72) = a17;
      *(_QWORD *)(v38 + 80) = a18;
      *(double *)(v38 + 88) = a19;
      -[BSAnimationSettings _setEpsilon:](v38, a19);
      *(_QWORD *)(v38 + 96) = a20;
    }
  }
LABEL_13:

  return v38;
}

- (void)_setTimingFunction:(uint64_t)a1
{
  id v3;
  void *v4;
  id CAMediaTimingFunctionClass;
  id *v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3 && *(_BYTE *)(a1 + 106))
    {
      CAMediaTimingFunctionClass = getCAMediaTimingFunctionClass();
      v16 = 0;
      v17 = &v16;
      v18 = 0x2020000000;
      v6 = (id *)getkCAMediaTimingFunctionLinearSymbolLoc_ptr;
      v19 = getkCAMediaTimingFunctionLinearSymbolLoc_ptr;
      if (!getkCAMediaTimingFunctionLinearSymbolLoc_ptr)
      {
        v7 = QuartzCoreLibrary();
        v6 = (id *)dlsym(v7, "kCAMediaTimingFunctionLinear");
        v17[3] = (uint64_t)v6;
        getkCAMediaTimingFunctionLinearSymbolLoc_ptr = (uint64_t)v6;
      }
      _Block_object_dispose(&v16, 8);
      if (!v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkCAMediaTimingFunctionLinear(void)");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("BSAnimationSettings.m"), 24, CFSTR("%s"), dlerror());

        __break(1u);
      }
      v8 = *v6;
      objc_msgSend(CAMediaTimingFunctionClass, "functionWithName:", v8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v9 = *(void **)(a1 + 56);
    if (v9 != v4)
    {
      if (v9 && v4)
      {
        v10 = 0;
        v11 = 1;
        while (1)
        {
          v12 = v10;
          v15 = 0;
          v16 = 0;
          objc_msgSend(*(id *)(a1 + 56), "getControlPointAtIndex:values:", v11, &v16);
          objc_msgSend(v4, "getControlPointAtIndex:values:", v11, &v15);
          if (vabds_f32(*(float *)&v16, *(float *)&v15) >= 0.00000011921
            || vabds_f32(*((float *)&v16 + 1), *((float *)&v15 + 1)) >= 0.00000011921)
          {
            break;
          }
          v10 = 1;
          v11 = 2;
          if ((v12 & 1) != 0)
            goto LABEL_17;
        }
      }
      objc_storeStrong((id *)(a1 + 56), v4);
      *(_BYTE *)(a1 + 104) = 1;
    }
LABEL_17:
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }

}

- (void)_setEpsilon:(uint64_t)a1
{
  double v3;
  double v4;
  double v5;
  os_unfair_lock_s *v6;

  if (a1)
  {
    v3 = fabs(a2);
    v4 = fmin(fmax(a2, 0.0001), 0.5);
    if (v3 >= 2.22044605e-16)
      v5 = v4;
    else
      v5 = 0.001;
    v6 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if (vabdd_f64(*(double *)(a1 + 88), v5) >= 2.22044605e-16)
    {
      *(double *)(a1 + 88) = v5;
      *(_BYTE *)(a1 + 104) = 1;
    }
    os_unfair_lock_unlock(v6);
  }
}

- (NSString)description
{
  os_unfair_lock_s *p_lock;
  _BOOL4 isSpring;
  void *v5;
  uint64_t v6;
  double lock_mass;
  double lock_stiffness;
  double lock_damping;
  double lock_epsilon;
  double lock_initialVelocity;
  _BOOL4 lock_storedDurationIsDirty;
  __CFString *v13;
  void *v14;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  isSpring = self->_isSpring;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  if (isSpring)
  {
    lock_mass = self->_lock_mass;
    lock_stiffness = self->_lock_stiffness;
    lock_damping = self->_lock_damping;
    lock_epsilon = self->_lock_epsilon;
    lock_initialVelocity = self->_lock_initialVelocity;
    lock_storedDurationIsDirty = self->_lock_storedDurationIsDirty;
    if (self->_lock_storedDurationIsDirty)
    {
      v13 = &stru_1E1EC08D0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (duration=%f)"), -[BSAnimationSettings _lock_duration]((uint64_t)self));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@:%p mass=%f stiffness=%f damping=%f epsilon=%f initialVelocity=%f %@delay=%f interval=%f range={%f,%f,%f} reason=%i timing=%@ speed=%f>"), v6, self, *(_QWORD *)&lock_mass, *(_QWORD *)&lock_stiffness, *(_QWORD *)&lock_damping, *(_QWORD *)&lock_epsilon, *(_QWORD *)&lock_initialVelocity, v13, *(_QWORD *)&self->_lock_delay, *(_QWORD *)&self->_lock_frameInterval, self->_lock_frameRange.minimum, self->_lock_frameRange.maximum, self->_lock_frameRange.preferred, self->_lock_highFrameRateReason, self->_lock_timingFunction, self->_lock_speed);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!lock_storedDurationIsDirty)

  }
  else
  {
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@:%p duration=%f delay=%f interval=%f range={%f,%f,%f} reason=%i timing=%@ speed=%f>"), v6, self, -[BSAnimationSettings _lock_duration]((uint64_t)self), *(_QWORD *)&self->_lock_delay, *(_QWORD *)&self->_lock_frameInterval, self->_lock_frameRange.minimum, self->_lock_frameRange.maximum, self->_lock_frameRange.preferred, self->_lock_highFrameRateReason, self->_lock_timingFunction, self->_lock_speed);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v14;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;
  double v5;
  double lock_delay;
  double lock_frameInterval;
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  int64_t lock_highFrameRateReason;
  CAMediaTimingFunction *lock_timingFunction;
  xpc_object_t v14;
  uint64_t i;
  xpc_object_t v16;
  float lock_speed;
  double lock_mass;
  double lock_stiffness;
  double lock_damping;
  double lock_initialVelocity;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    if (!self->_isSpring || !self->_lock_storedDurationIsDirty)
    {
      v5 = -[BSAnimationSettings _lock_duration]((uint64_t)self);
      xpc_dictionary_set_double(v4, "l", v5);
    }
    lock_delay = self->_lock_delay;
    if (lock_delay != 0.0)
      xpc_dictionary_set_double(v4, "w", lock_delay);
    lock_frameInterval = self->_lock_frameInterval;
    if (lock_frameInterval != 0.0)
      xpc_dictionary_set_double(v4, "f", lock_frameInterval);
    if (self->_lock_frameRange.minimum != 0.0
      || self->_lock_frameRange.maximum != 0.0
      || self->_lock_frameRange.preferred != 0.0)
    {
      v8 = xpc_array_create(0, 0);
      v9 = xpc_int64_create((uint64_t)self->_lock_frameRange.minimum);
      xpc_array_append_value(v8, v9);

      v10 = xpc_int64_create((uint64_t)self->_lock_frameRange.maximum);
      xpc_array_append_value(v8, v10);

      v11 = xpc_int64_create((uint64_t)self->_lock_frameRange.preferred);
      xpc_array_append_value(v8, v11);

      xpc_dictionary_set_value(v4, "r", v8);
    }
    lock_highFrameRateReason = self->_lock_highFrameRateReason;
    if ((_DWORD)lock_highFrameRateReason)
      xpc_dictionary_set_int64(v4, "x", lock_highFrameRateReason);
    lock_timingFunction = self->_lock_timingFunction;
    if (lock_timingFunction)
    {
      v22 = 0;
      v23[0] = 0;
      -[CAMediaTimingFunction getControlPointAtIndex:values:](lock_timingFunction, "getControlPointAtIndex:values:", 1, &v22);
      -[CAMediaTimingFunction getControlPointAtIndex:values:](self->_lock_timingFunction, "getControlPointAtIndex:values:", 2, v23);
      v14 = xpc_array_create(0, 0);
      for (i = 0; i != 16; i += 4)
      {
        v16 = xpc_double_create(*(float *)((char *)&v23[-1] + i));
        xpc_array_append_value(v14, v16);

      }
      xpc_dictionary_set_value(v4, "t", v14);

    }
    lock_speed = self->_lock_speed;
    if (lock_speed != 1.0)
      xpc_dictionary_set_double(v4, "p", lock_speed);
    if (self->_isSpring)
    {
      lock_mass = self->_lock_mass;
      if (lock_mass != 0.0)
        xpc_dictionary_set_double(v4, "m", lock_mass);
      lock_stiffness = self->_lock_stiffness;
      if (lock_stiffness != 0.0)
        xpc_dictionary_set_double(v4, "s", lock_stiffness);
      lock_damping = self->_lock_damping;
      if (lock_damping != 0.0)
        xpc_dictionary_set_double(v4, "d", lock_damping);
      xpc_dictionary_set_double(v4, "e", self->_lock_epsilon);
      lock_initialVelocity = self->_lock_initialVelocity;
      if (lock_initialVelocity != 0.0)
        xpc_dictionary_set_double(v4, "v", lock_initialVelocity);
    }
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)_lock_applyToCAAnimation:(uint64_t)a1
{
  double v3;
  id v4;
  double v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    if (v7)
    {
      if (*(_QWORD *)(a1 + 56))
        objc_msgSend(v7, "setTimingFunction:");
      if (*(double *)(a1 + 32) != 0.0)
        objc_msgSend(v7, "setFrameInterval:");
      if (*(float *)(a1 + 40) != 0.0 || *(float *)(a1 + 44) != 0.0 || *(float *)(a1 + 48) != 0.0)
        objc_msgSend(v7, "setPreferredFrameRateRange:");
      if (*(_DWORD *)(a1 + 52) | objc_msgSend(v7, "highFrameRateReason"))
        objc_msgSend(v7, "setHighFrameRateReason:");
      if (*(_BYTE *)(a1 + 106) && (getCASpringAnimationClass(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v4 = v7;
        LODWORD(v5) = *(_DWORD *)(a1 + 12);
        objc_msgSend(v4, "setSpeed:", v5);
        objc_msgSend(v4, "setMass:", *(double *)(a1 + 64));
        objc_msgSend(v4, "setStiffness:", *(double *)(a1 + 72));
        objc_msgSend(v4, "setDamping:", *(double *)(a1 + 80));
        objc_msgSend(v4, "setInitialVelocity:", *(double *)(a1 + 96));
        if (*(_BYTE *)(a1 + 104))
        {
          objc_msgSend(v4, "durationForEpsilon:", *(double *)(a1 + 88));
          *(_QWORD *)(a1 + 16) = v6;
          *(_BYTE *)(a1 + 104) = 0;
        }
        -[BSAnimationSettings _lock_duration](a1);
        objc_msgSend(v4, "setDuration:");

      }
      else
      {
        LODWORD(v3) = *(_DWORD *)(a1 + 12);
        objc_msgSend(v7, "setSpeed:", v3);
        -[BSAnimationSettings _lock_duration](a1);
        objc_msgSend(v7, "setDuration:");
      }
    }
  }

}

- (double)duration
{
  os_unfair_lock_s *p_lock;
  double v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[BSAnimationSettings _lock_duration]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (double)_lock_duration
{
  void *v2;
  id CATransactionClass;
  char v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (!a1)
    return 0.0;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  if (*(_BYTE *)(a1 + 106) && *(_BYTE *)(a1 + 104))
  {
    v2 = (void *)MEMORY[0x18D769AE0]();
    CATransactionClass = getCATransactionClass();
    v4 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    if ((v4 & 1) != 0)
    {
      v5 = objc_msgSend(CATransactionClass, "activate");
    }
    else
    {
      objc_msgSend(CATransactionClass, "begin");
      v5 = objc_msgSend(CATransactionClass, "activateBackground:", 1);
    }
    v6 = (void *)MEMORY[0x18D769AE0](v5);
    objc_msgSend(getCASpringAnimationClass(), "animation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSAnimationSettings _lock_applyToCAAnimation:](a1, v7);

    objc_autoreleasePoolPop(v6);
    if ((v4 & 1) == 0)
      objc_msgSend(CATransactionClass, "commit");
    objc_autoreleasePoolPop(v2);
  }
  return *(double *)(a1 + 16);
}

- (BOOL)isEqual:(id)a3
{
  BSAnimationSettings *v4;
  os_unfair_lock_s *p_lock;
  BSAnimationSettings *v6;
  BSAnimationSettings *v7;
  os_unfair_lock_s *v8;
  BOOL v9;
  BSAnimationSettings *v10;
  double v11;
  CAMediaTimingFunction *lock_timingFunction;
  CAMediaTimingFunction *v13;
  char v14;
  uint64_t v15;
  char v16;
  _BOOL4 v17;
  os_unfair_lock_s *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = (BSAnimationSettings *)a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = v6;
      if (self->_isSpring != v6->_isSpring)
      {
        v9 = 0;
LABEL_40:

        goto LABEL_41;
      }
      if (self >= v6)
      {
        os_unfair_lock_lock(&v6->_lock);
        v8 = &self->_lock;
      }
      else
      {
        os_unfair_lock_lock(&self->_lock);
        v8 = &v7->_lock;
      }
      os_unfair_lock_lock(v8);
      v10 = v7;
      os_unfair_lock_assert_owner(&self->_lock);
      os_unfair_lock_assert_owner(&v10->_lock);
      if (!self->_isSpring)
      {
        v11 = -[BSAnimationSettings _lock_duration]((uint64_t)self);
        if (vabdd_f64(v11, -[BSAnimationSettings _lock_duration]((uint64_t)v10)) >= 2.22044605e-16)
          goto LABEL_33;
      }
      if (vabdd_f64(self->_lock_delay, v10->_lock_delay) >= 2.22044605e-16
        || vabdd_f64(self->_lock_frameInterval, v10->_lock_frameInterval) >= 2.22044605e-16)
      {
        goto LABEL_33;
      }
      v9 = 0;
      if (self->_lock_frameRange.minimum != v10->_lock_frameRange.minimum
        || self->_lock_frameRange.maximum != v10->_lock_frameRange.maximum
        || self->_lock_frameRange.preferred != v10->_lock_frameRange.preferred)
      {
        goto LABEL_34;
      }
      if (self->_lock_highFrameRateReason == v10->_lock_highFrameRateReason)
      {
        lock_timingFunction = self->_lock_timingFunction;
        v13 = v10->_lock_timingFunction;
        if (lock_timingFunction != v13)
        {
          v9 = 0;
          if (lock_timingFunction && v13)
          {
            v14 = 0;
            v15 = 1;
            while (1)
            {
              v16 = v14;
              v20 = 0;
              v21[0] = 0;
              -[CAMediaTimingFunction getControlPointAtIndex:values:](self->_lock_timingFunction, "getControlPointAtIndex:values:", v15, v21);
              -[CAMediaTimingFunction getControlPointAtIndex:values:](v10->_lock_timingFunction, "getControlPointAtIndex:values:", v15, &v20);
              if (vabds_f32(*(float *)v21, *(float *)&v20) >= 0.00000011921
                || vabds_f32(*((float *)v21 + 1), *((float *)&v20 + 1)) >= 0.00000011921)
              {
                goto LABEL_33;
              }
              v14 = 1;
              v15 = 2;
              if ((v16 & 1) != 0)
                goto LABEL_25;
            }
          }
LABEL_34:
          v17 = self < v7;

          if (v17)
            v18 = &v10->_lock;
          else
            v18 = p_lock;
          if (!v17)
            p_lock = &v10->_lock;
          os_unfair_lock_unlock(v18);
          os_unfair_lock_unlock(p_lock);
          goto LABEL_40;
        }
LABEL_25:
        if (vabds_f32(self->_lock_speed, v10->_lock_speed) < 0.00000011921
          && (!self->_isSpring
           || vabdd_f64(self->_lock_mass, v10->_lock_mass) < 2.22044605e-16
           && vabdd_f64(self->_lock_stiffness, v10->_lock_stiffness) < 2.22044605e-16
           && vabdd_f64(self->_lock_damping, v10->_lock_damping) < 2.22044605e-16
           && vabdd_f64(self->_lock_epsilon, v10->_lock_epsilon) < 2.22044605e-16
           && vabdd_f64(self->_lock_initialVelocity, v10->_lock_initialVelocity) < 2.22044605e-16))
        {
          v9 = 1;
          goto LABEL_34;
        }
      }
LABEL_33:
      v9 = 0;
      goto LABEL_34;
    }
    v9 = 0;
  }
LABEL_41:

  return v9;
}

- (BSAnimationSettings)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (BSAnimationSettings *)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](self, 0, 0, 0, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, v2, v3, v4, 0, 0, 0.0,
                                  0);
}

+ (id)settingsWithDuration:(double)a3 delay:(double)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = objc_alloc((Class)a1);
  return objc_autoreleaseReturnValue((id)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](v6, 0, 0, 0, 0, a3, a4, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, v7, v8, v9, 0, 0, 0.0,
                                           0));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  float minimum;
  uint64_t lock_highFrameRateReason;
  CAMediaTimingFunction *lock_timingFunction;
  double v8;
  uint64_t i;
  float lock_speed;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_isSpring || !self->_lock_storedDurationIsDirty)
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("l"), -[BSAnimationSettings _lock_duration]((uint64_t)self));
  if (self->_lock_delay != 0.0)
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("w"));
  if (self->_lock_frameInterval != 0.0)
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("f"));
  minimum = self->_lock_frameRange.minimum;
  if (minimum != 0.0 || self->_lock_frameRange.maximum != 0.0 || self->_lock_frameRange.preferred != 0.0)
  {
    objc_msgSend(v4, "encodeInt:forKey:", (int)minimum, CFSTR("fl"));
    objc_msgSend(v4, "encodeInt:forKey:", (int)self->_lock_frameRange.maximum, CFSTR("fh"));
    objc_msgSend(v4, "encodeInt:forKey:", (int)self->_lock_frameRange.preferred, CFSTR("fp"));
  }
  lock_highFrameRateReason = self->_lock_highFrameRateReason;
  if ((_DWORD)lock_highFrameRateReason)
    objc_msgSend(v4, "encodeInt32:forKey:", lock_highFrameRateReason, CFSTR("fr"));
  lock_timingFunction = self->_lock_timingFunction;
  if (lock_timingFunction)
  {
    v11 = 0;
    v12[0] = 0;
    -[CAMediaTimingFunction getControlPointAtIndex:values:](lock_timingFunction, "getControlPointAtIndex:values:", 1, &v11);
    -[CAMediaTimingFunction getControlPointAtIndex:values:](self->_lock_timingFunction, "getControlPointAtIndex:values:", 2, v12);
    for (i = 0; i != 4; ++i)
    {
      LODWORD(v8) = *((_DWORD *)&v12[-1] + i);
      objc_msgSend(v4, "encodeFloat:forKey:", kBSAnimationSettingsTimingPointsStrings[i], v8);
    }
  }
  lock_speed = self->_lock_speed;
  if (lock_speed != 1.0)
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("p"), lock_speed);
  if (self->_isSpring)
  {
    if (self->_lock_mass != 0.0)
      objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("m"));
    if (self->_lock_stiffness != 0.0)
      objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("s"));
    if (self->_lock_damping != 0.0)
      objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("d"));
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("e"), self->_lock_epsilon);
    if (self->_lock_initialVelocity != 0.0)
      objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("v"));
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (BSAnimationSettings)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  double (**v10)(_QWORD, _QWORD, _QWORD, double);
  double v11;
  double v12;
  double v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  float v19;
  int v20;
  uint64_t v21;
  int v22;
  id CAMediaTimingFunctionClass;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  _BOOL4 v31;
  float v32;
  float v33;
  double v34;
  double v35;
  char v36;
  double v37;
  float v38;
  float v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  uint64_t v44;
  double v45;
  BSAnimationSettings *v46;
  float v48;
  double v49;
  _QWORD v50[4];
  id v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8 = v4;
  v52 = 0;
  if (v4)
  {
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __37__BSAnimationSettings_initWithCoder___block_invoke;
    v50[3] = &unk_1E1EBF5B8;
    v9 = v4;
    v51 = v9;
    v10 = (double (**)(_QWORD, _QWORD, _QWORD, double))MEMORY[0x18D769CFC](v50);
    v11 = ((double (**)(_QWORD, const __CFString *, char *, double))v10)[2](v10, CFSTR("l"), (char *)&v52 + 1, 0.0);
    v12 = ((double (**)(_QWORD, const __CFString *, _QWORD, double))v10)[2](v10, CFSTR("w"), 0, 0.0);
    v13 = ((double (**)(_QWORD, const __CFString *, _QWORD, double))v10)[2](v10, CFSTR("f"), 0, 0.0);
    v14 = objc_msgSend(v9, "decodeIntForKey:", CFSTR("fl"));
    v15 = objc_msgSend(v9, "decodeIntForKey:", CFSTR("fh"));
    v16 = objc_msgSend(v9, "decodeIntForKey:", CFSTR("fp"));
    v17 = objc_msgSend(v9, "decodeInt32ForKey:", CFSTR("fr"));
    v18 = 0;
    v19 = (float)v15;
    v20 = 1;
    do
      v20 &= objc_msgSend(v9, "containsValueForKey:", kBSAnimationSettingsTimingPointsStrings[v18++]);
    while (v18 != 4);
    v49 = v13;
    v48 = v19;
    if ((v20 & 1) != 0)
    {
      v21 = 0;
      v53 = 0;
      v54 = 0;
      do
      {
        objc_msgSend(v9, "decodeFloatForKey:", kBSAnimationSettingsTimingPointsStrings[v21]);
        *((_DWORD *)&v53 + v21++) = v22;
      }
      while (v21 != 4);
      CAMediaTimingFunctionClass = getCAMediaTimingFunctionClass();
      LODWORD(v25) = HIDWORD(v53);
      LODWORD(v24) = v53;
      LODWORD(v27) = HIDWORD(v54);
      LODWORD(v26) = v54;
      objc_msgSend(CAMediaTimingFunctionClass, "functionWithControlPoints::::", v24, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v12;
      v30 = v11;
    }
    else
    {
      v29 = v12;
      v30 = v11;
      v28 = 0;
    }
    v45 = ((double (**)(_QWORD, const __CFString *, _QWORD, double))v10)[2](v10, CFSTR("p"), 0, 1.0);
    v40 = ((double (**)(_QWORD, const __CFString *, __int16 *, double))v10)[2](v10, CFSTR("m"), &v52, 0.0);
    v41 = ((double (**)(_QWORD, const __CFString *, __int16 *, double))v10)[2](v10, CFSTR("s"), &v52, 0.0);
    v42 = ((double (**)(_QWORD, const __CFString *, __int16 *, double))v10)[2](v10, CFSTR("d"), &v52, 0.0);
    v43 = ((double (**)(_QWORD, const __CFString *, __int16 *, double))v10)[2](v10, CFSTR("e"), &v52, 0.0);
    v44 = ((double (**)(_QWORD, const __CFString *, __int16 *, double))v10)[2](v10, CFSTR("v"), &v52, 0.0);

    v32 = v45;
    v36 = HIBYTE(v52) == 0;
    v31 = v52 != 0;
    v34 = v30;
    v35 = v29;
    v37 = v49;
    v38 = v48;
    v33 = (float)v14;
    v39 = (float)v16;
  }
  else
  {
    v31 = 0;
    v17 = 0;
    v28 = 0;
    v32 = 1.0;
    v33 = 0.0;
    v34 = 0.0;
    v35 = 0.0;
    v36 = 1;
    v37 = 0.0;
    v38 = 0.0;
    v39 = 0.0;
    v40 = 0.0;
    v41 = 0;
    v42 = 0;
    v43 = 0.0;
    v44 = 0;
  }
  v46 = (BSAnimationSettings *)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](self, v36, v17, v28, v31, v34, v35, v37, v33, v38, v39, v32, v40, v5, v6, v7, v41, v42, v43,
                                 v44);

  return v46;
}

double __37__BSAnimationSettings_initWithCoder___block_invoke(uint64_t a1, void *a2, _BYTE *a3, double a4)
{
  id v7;
  double v8;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsValueForKey:", v7))
  {
    if (a3)
      *a3 = 1;
    objc_msgSend(*(id *)(a1 + 32), "decodeDoubleForKey:", v7);
    a4 = v8;
  }

  return a4;
}

- (void)_setFrameInterval:(uint64_t)a1
{
  os_unfair_lock_s *v4;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if (vabdd_f64(*(double *)(a1 + 32), a2) >= 2.22044605e-16)
    {
      *(double *)(a1 + 32) = a2;
      *(_BYTE *)(a1 + 104) = 1;
    }
    os_unfair_lock_unlock(v4);
  }
}

- (void)_setFrameRange:(float)a3
{
  os_unfair_lock_s *v8;

  if (a1)
  {
    v8 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if (*(float *)(a1 + 40) != a2 || *(float *)(a1 + 44) != a3 || *(float *)(a1 + 48) != a4)
    {
      *(float *)(a1 + 40) = a2;
      *(float *)(a1 + 44) = a3;
      *(float *)(a1 + 48) = a4;
      *(_BYTE *)(a1 + 104) = 1;
    }
    os_unfair_lock_unlock(v8);
  }
}

- (void)_setSpeed:(uint64_t)a1
{
  os_unfair_lock_s *v4;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if (vabds_f32(*(float *)(a1 + 12), a2) >= 0.00000011921)
    {
      *(float *)(a1 + 12) = a2;
      *(_BYTE *)(a1 + 104) = 1;
    }
    os_unfair_lock_unlock(v4);
  }
}

- (double)mass
{
  double lock_mass;
  void *v6;

  if (!self->_isSpring)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSAnimationSettings.m"), 712, CFSTR("cannot call mass if not a spring animation"));

  }
  os_unfair_lock_lock(&self->_lock);
  lock_mass = self->_lock_mass;
  os_unfair_lock_unlock(&self->_lock);
  return lock_mass;
}

- (double)stiffness
{
  double lock_stiffness;
  void *v6;

  if (!self->_isSpring)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSAnimationSettings.m"), 720, CFSTR("cannot call stiffness if not a spring animation"));

  }
  os_unfair_lock_lock(&self->_lock);
  lock_stiffness = self->_lock_stiffness;
  os_unfair_lock_unlock(&self->_lock);
  return lock_stiffness;
}

- (double)damping
{
  double lock_damping;
  void *v6;

  if (!self->_isSpring)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSAnimationSettings.m"), 728, CFSTR("cannot call damping if not a spring animation"));

  }
  os_unfair_lock_lock(&self->_lock);
  lock_damping = self->_lock_damping;
  os_unfair_lock_unlock(&self->_lock);
  return lock_damping;
}

- (double)epsilon
{
  double lock_epsilon;
  void *v6;

  if (!self->_isSpring)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSAnimationSettings.m"), 736, CFSTR("cannot call epsilon if not a spring animation"));

  }
  os_unfair_lock_lock(&self->_lock);
  lock_epsilon = self->_lock_epsilon;
  os_unfair_lock_unlock(&self->_lock);
  return lock_epsilon;
}

- (double)initialVelocity
{
  double lock_initialVelocity;
  void *v6;

  if (!self->_isSpring)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSAnimationSettings.m"), 744, CFSTR("cannot call initialVelocity if not a spring animation"));

  }
  os_unfair_lock_lock(&self->_lock);
  lock_initialVelocity = self->_lock_initialVelocity;
  os_unfair_lock_unlock(&self->_lock);
  return lock_initialVelocity;
}

- (void)applyToCAAnimation:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[BSAnimationSettings _lock_applyToCAAnimation:]((uint64_t)self, v5);

  os_unfair_lock_unlock(p_lock);
}

- (double)progressAtTime:(double)a3
{
  os_unfair_lock_s *p_lock;
  double v6;
  void *v7;
  id CATransactionClass;
  void *v9;
  double v10;
  double lock_delay;
  double v12;
  CAMediaTimingFunction *lock_timingFunction;
  float v14;
  float v15;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = 0.0;
  if (self->_lock_delay <= a3)
  {
    v7 = (void *)MEMORY[0x18D769AE0]();
    if (self->_isSpring)
    {
      CATransactionClass = getCATransactionClass();
      if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
      {
        objc_msgSend(CATransactionClass, "activate");
        CATransactionClass = 0;
      }
      else
      {
        objc_msgSend(CATransactionClass, "begin");
        objc_msgSend(CATransactionClass, "activateBackground:", 1);
      }
      objc_msgSend(getCASpringAnimationClass(), "animation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BSAnimationSettings _lock_applyToCAAnimation:]((uint64_t)self, v9);
    }
    else
    {
      v9 = 0;
      CATransactionClass = 0;
    }
    v10 = -[BSAnimationSettings _lock_duration]((uint64_t)self);
    lock_delay = self->_lock_delay;
    v6 = 1.0;
    if (v10 + lock_delay > a3)
    {
      v6 = 0.0;
      if (v10 > 0.0)
      {
        v12 = fmax((a3 - lock_delay) / v10, 0.0);
        v6 = fmin(v12, 1.0);
        lock_timingFunction = self->_lock_timingFunction;
        if (lock_timingFunction)
        {
          *(float *)&v12 = v6;
          -[CAMediaTimingFunction _solveForInput:](lock_timingFunction, "_solveForInput:", v12);
          v12 = fmax(v14, 0.0);
          v6 = fmin(v12, 1.0);
        }
        if (v9)
        {
          *(float *)&v12 = v6;
          objc_msgSend(v9, "_solveForInput:", v12);
          v6 = v15;
        }
      }
    }
    if (CATransactionClass)
      objc_msgSend(CATransactionClass, "commit");

    objc_autoreleasePoolPop(v7);
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;
  uint64_t v12;
  char v13;
  double v14;
  void *v15;
  double v16;
  id v17;
  double v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  +[BSHashBuilder builder](BSHashBuilder, "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  if (!self->_isSpring)
    v4 = (id)objc_msgSend(v3, "appendDouble:", -[BSAnimationSettings _lock_duration]((uint64_t)self));
  v5 = (id)objc_msgSend(v3, "appendDouble:", self->_lock_delay);
  v6 = (id)objc_msgSend(v3, "appendDouble:", self->_lock_frameInterval);
  v7 = (id)objc_msgSend(v3, "appendInt64:", (uint64_t)self->_lock_frameRange.minimum);
  v8 = (id)objc_msgSend(v3, "appendInt64:", (uint64_t)self->_lock_frameRange.maximum);
  v9 = (id)objc_msgSend(v3, "appendInt64:", (uint64_t)self->_lock_frameRange.preferred);
  v10 = (id)objc_msgSend(v3, "appendInt64:", self->_lock_highFrameRateReason);
  v11 = 0;
  v12 = 1;
  do
  {
    v13 = v11;
    v27[0] = 0;
    -[CAMediaTimingFunction getControlPointAtIndex:values:](self->_lock_timingFunction, "getControlPointAtIndex:values:", v12, v27);
    LODWORD(v14) = v27[0];
    objc_msgSend(v3, "appendFloat:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = HIDWORD(v27[0]);
    v17 = (id)objc_msgSend(v15, "appendFloat:", v16);

    v11 = 1;
    v12 = 2;
  }
  while ((v13 & 1) == 0);
  *(float *)&v18 = self->_lock_speed;
  v19 = (id)objc_msgSend(v3, "appendFloat:", 2, v18);
  if (self->_isSpring)
  {
    v20 = (id)objc_msgSend(v3, "appendCGFloat:", self->_lock_mass);
    v21 = (id)objc_msgSend(v3, "appendCGFloat:", self->_lock_stiffness);
    v22 = (id)objc_msgSend(v3, "appendCGFloat:", self->_lock_damping);
    v23 = (id)objc_msgSend(v3, "appendCGFloat:", self->_lock_epsilon);
    v24 = (id)objc_msgSend(v3, "appendCGFloat:", self->_lock_initialVelocity);
  }
  os_unfair_lock_unlock(&self->_lock);
  v25 = objc_msgSend(v3, "hash");

  return v25;
}

@end
