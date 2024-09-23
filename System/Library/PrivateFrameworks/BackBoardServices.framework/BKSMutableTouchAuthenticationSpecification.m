@implementation BKSMutableTouchAuthenticationSpecification

- (void)setDisplays:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  NSSet *v17;
  NSSet *displays;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  objc_class *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_class *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  BKSMutableTouchAuthenticationSpecification *v54;
  __int16 v55;
  const __CFString *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v35 = (void *)MEMORY[0x1E0CB3940];
      v36 = (objc_class *)objc_msgSend(v5, "classForCoder");
      if (!v36)
        v36 = (objc_class *)objc_opt_class();
      NSStringFromClass(v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("displays"), v37, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (objc_class *)objc_opt_class();
        NSStringFromClass(v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v50 = v41;
        v51 = 2114;
        v52 = v43;
        v53 = 2048;
        v54 = self;
        v55 = 2114;
        v56 = CFSTR("BKSTouchAuthenticationSpecification.m");
        v57 = 1024;
        v58 = 298;
        v59 = 2114;
        v60 = v40;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A1249C0);
    }
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v45;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v45 != v9)
          objc_enumerationMutation(v6);
        v11 = *(id *)(*((_QWORD *)&v44 + 1) + 8 * v10);
        if (!v11)
        {
          v19 = (void *)MEMORY[0x1E0CB3940];
          v20 = (objc_class *)objc_opt_class();
          NSStringFromClass(v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("display"), v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = (objc_class *)objc_opt_class();
            NSStringFromClass(v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v50 = v23;
            v51 = 2114;
            v52 = v25;
            v53 = 2048;
            v54 = self;
            v55 = 2114;
            v56 = CFSTR("BKSTouchAuthenticationSpecification.m");
            v57 = 1024;
            v58 = 301;
            v59 = 2114;
            v60 = v22;
            _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18A124748);
        }
        v12 = v11;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v26 = (void *)MEMORY[0x1E0CB3940];
          v27 = (objc_class *)objc_msgSend(v12, "classForCoder");
          if (!v27)
            v27 = (objc_class *)objc_opt_class();
          NSStringFromClass(v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (objc_class *)objc_opt_class();
          NSStringFromClass(v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("display"), v28, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = (objc_class *)objc_opt_class();
            NSStringFromClass(v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v50 = v32;
            v51 = 2114;
            v52 = v34;
            v53 = 2048;
            v54 = self;
            v55 = 2114;
            v56 = CFSTR("BKSTouchAuthenticationSpecification.m");
            v57 = 1024;
            v58 = 301;
            v59 = 2114;
            v60 = v31;
            _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18A124884);
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v8);
  }

  v13 = objc_opt_class();
  v14 = v6;
  if (v13)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
  }
  else
  {
    v15 = 0;
  }
  v16 = v15;

  v17 = (NSSet *)objc_msgSend(v16, "copy");
  displays = self->super._displays;
  self->super._displays = v17;

}

- (void)setSlotID:(unsigned int)a3
{
  self->super._slotID = a3;
}

- (void)setAuthenticationMessageContext:(unint64_t)a3
{
  self->super._authenticationMessageContext = a3;
}

- (void)setSecureName:(unsigned int)a3
{
  self->super._secureName = a3;
}

- (void)setBackgroundStatisticsRegion:(id)a3
{
  *($BEA516A46C1BA1F84587E5D243A711F7 *)&self->super._backgroundStatisticsTopEdgeInset = a3;
}

- (void)setBackgroundStatisticsForeground:(float)a3
{
  self->super._backgroundStatisticsForeground = a3;
}

- (void)setBackgroundStatisticsPassingContrast:(float)a3
{
  self->super._backgroundStatisticsPassingContrast = a3;
}

- (void)setBackgroundStatisticsFailingContrast:(float)a3
{
  self->super._backgroundStatisticsFailingContrast = a3;
}

- (void)setHitTestInformationMask:(unint64_t)a3
{
  self->super._hitTestInformationMask = a3;
}

- (void)setInitialSampleEvent:(int64_t)a3
{
  self->super._initialSampleEvent = a3;
}

@end
