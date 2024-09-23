@implementation IDSStallDetector

+ (id)newDetectorWithName:(id)a3 stallDetectedBlock:(id)a4 stallWarningBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  IDSStallDetector *v17;
  IDSStallDetector *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  id stallDetectedBlock;
  const char *v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  id stallWarningBlock;
  const char *v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  NSMutableArray *bytesHistory;
  const char *v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  NSMutableArray *bytesTimestamps;
  const char *v39;
  double v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  double v44;
  const char *v45;
  uint64_t v46;
  double v47;
  const char *v48;
  uint64_t v49;
  double v50;
  IDSStallDetector *v51;
  uint64_t v53;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EE40B518);
  v13 = (void *)qword_1EE40B520;
  if (!qword_1EE40B520)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v10, v11, v12);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)qword_1EE40B520;
    qword_1EE40B520 = v14;

    v13 = (void *)qword_1EE40B520;
    if (!qword_1EE40B520)
      goto LABEL_4;
  }
  objc_msgSend_objectForKey_(v13, v10, (uint64_t)v7, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v18 = objc_alloc_init(IDSStallDetector);
    v17 = v18;
    if (v18)
    {
      v18->_lock._os_unfair_lock_opaque = 0;
      v22 = objc_msgSend_copy(v8, v19, v20, v21);
      stallDetectedBlock = v17->_stallDetectedBlock;
      v17->_stallDetectedBlock = (id)v22;

      v27 = objc_msgSend_copy(v9, v24, v25, v26);
      stallWarningBlock = v17->_stallWarningBlock;
      v17->_stallWarningBlock = (id)v27;

      objc_msgSend_array(MEMORY[0x1E0C99DE8], v29, v30, v31);
      v32 = objc_claimAutoreleasedReturnValue();
      bytesHistory = v17->_bytesHistory;
      v17->_bytesHistory = (NSMutableArray *)v32;

      objc_msgSend_array(MEMORY[0x1E0C99DE8], v34, v35, v36);
      v37 = objc_claimAutoreleasedReturnValue();
      bytesTimestamps = v17->_bytesTimestamps;
      v17->_bytesTimestamps = (NSMutableArray *)v37;

      objc_msgSend_setObject_forKey_((void *)qword_1EE40B520, v39, (uint64_t)v17, v40, v7);
      OSLogHandleForTransportCategory();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v55 = v7;
        v56 = 2048;
        v57 = objc_msgSend_count((void *)qword_1EE40B520, v42, v43, v44);
        _os_log_impl(&dword_19B949000, v41, OS_LOG_TYPE_DEFAULT, "Created new detector %@ (total %lu)", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v53 = objc_msgSend_count((void *)qword_1EE40B520, v45, v46, v47);
          _IDSLogTransport(CFSTR("StallDetection"), CFSTR("IDS"), CFSTR("Created new detector %@ (total %lu)"));
          if (_IDSShouldLog())
          {
            objc_msgSend_count((void *)qword_1EE40B520, v48, v49, v50, v7, v53);
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("StallDetection"), CFSTR("Created new detector %@ (total %lu)"));
          }
        }
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EE40B518);
      v51 = v17;
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EE40B518);
    }

  }
  else
  {
LABEL_4:
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EE40B518);
    v17 = 0;
  }

  return v17;
}

+ (id)detectorWithName:(id)a3
{
  id v3;
  const char *v4;
  double v5;
  void *v6;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EE40B518);
  objc_msgSend_objectForKey_((void *)qword_1EE40B520, v4, (uint64_t)v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EE40B518);
  return v6;
}

+ (void)removeDetectorWithName:(id)a3
{
  id v3;
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  const char *v8;
  uint64_t v9;
  double v10;
  id v11;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EE40B518);
  objc_msgSend_objectForKey_((void *)qword_1EE40B520, v4, (uint64_t)v3, v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_((void *)qword_1EE40B520, v6, (uint64_t)v3, v7);

  objc_msgSend_reset(v11, v8, v9, v10);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EE40B518);

}

- (unint64_t)consumeDelayThreshold
{
  os_unfair_lock_s *p_lock;
  unint64_t consumeDelayThreshold;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  consumeDelayThreshold = self->_consumeDelayThreshold;
  os_unfair_lock_unlock(p_lock);
  return consumeDelayThreshold;
}

- (void)setConsumeDelayThreshold:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_consumeDelayThreshold = a3;
  os_unfair_lock_unlock(p_lock);
}

- (double)byteMovementDelayThreshold
{
  os_unfair_lock_s *p_lock;
  double byteMovementDelayThreshold;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  byteMovementDelayThreshold = self->_byteMovementDelayThreshold;
  os_unfair_lock_unlock(p_lock);
  return byteMovementDelayThreshold;
}

- (void)setByteMovementDelayThreshold:(double)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_byteMovementDelayThreshold = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)consumeTimeCheckForEvent:(id)a3 produceTime:(unint64_t)a4 consumeTime:(unint64_t)a5
{
  id v8;
  BOOL v9;
  NSObject *v10;
  unint64_t v11;
  os_unfair_lock_s *p_lock;
  unint64_t consumeDelayThreshold;
  uint64_t v14;
  void (**v15)(void *, id);
  uint8_t buf[4];
  id v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!self->_consumeDelayThreshold)
    goto LABEL_18;
  v9 = 0;
  if (a4 && a5)
  {
    if (self->_verboseLogging)
    {
      OSLogHandleForIDSCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        v18 = v8;
        v19 = 2048;
        v20 = a4;
        v21 = 2048;
        v22 = a5;
        v23 = 2048;
        v24 = a4 - a5;
        _os_log_impl(&dword_19B949000, v10, OS_LOG_TYPE_DEFAULT, "Checking time for %@: %llu ~ %llu = %llu", buf, 0x2Au);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("StallDetection"), CFSTR("Checking time for %@: %llu ~ %llu = %llu"));
    }
    v11 = a4 - a5;
    if (v11 > 0x3FFFFFFFFFFFFFFELL)
      goto LABEL_18;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    consumeDelayThreshold = self->_consumeDelayThreshold;
    if (v11 <= consumeDelayThreshold)
    {
      if (v11 <= consumeDelayThreshold >> 1)
      {
        os_unfair_lock_unlock(&self->_lock);
        goto LABEL_18;
      }
      v14 = 24;
    }
    else
    {
      v14 = 16;
    }
    v15 = (void (**)(void *, id))_Block_copy(*(const void **)((char *)&self->super.isa + v14));
    os_unfair_lock_unlock(p_lock);
    if (v15)
    {
      v15[2](v15, v8);

      v9 = 1;
      goto LABEL_19;
    }
LABEL_18:
    v9 = 0;
  }
LABEL_19:

  return v9;
}

- (BOOL)byteMovementCheckForEvent:(id)a3
{
  id v4;
  double v5;
  os_unfair_lock_s *p_lock;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double byteMovementDelayThreshold;
  uint64_t v19;
  void (**v20)(void *, id);

  v4 = a3;
  if (self->_byteMovementDelayThreshold == 0.0)
    goto LABEL_10;
  v5 = ids_monotonic_time();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!objc_msgSend_count(self->_bytesTimestamps, v7, v8, v9))
    goto LABEL_9;
  objc_msgSend_objectAtIndexedSubscript_(self->_bytesTimestamps, v10, 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v12, v13, v14, v15);
  v17 = v16;

  byteMovementDelayThreshold = self->_byteMovementDelayThreshold;
  if (v5 - v17 > byteMovementDelayThreshold)
  {
    v19 = 16;
    goto LABEL_7;
  }
  if (v5 - v17 <= byteMovementDelayThreshold * 0.5)
  {
LABEL_9:
    os_unfair_lock_unlock(&self->_lock);
LABEL_10:
    LOBYTE(v20) = 0;
    goto LABEL_11;
  }
  v19 = 24;
LABEL_7:
  v20 = (void (**)(void *, id))_Block_copy(*(const void **)((char *)&self->super.isa + v19));
  os_unfair_lock_unlock(p_lock);
  if (v20)
  {
    v20[2](v20, v4);

    LOBYTE(v20) = 1;
  }
LABEL_11:

  return (char)v20;
}

- (void)produceBytes:(int)a3
{
  uint64_t v3;
  double v5;
  NSMutableArray *bytesHistory;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  NSMutableArray *bytesTimestamps;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  double v17;
  NSObject *v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v3 = *(_QWORD *)&a3;
  v23 = *MEMORY[0x1E0C80C00];
  v5 = ids_monotonic_time();
  os_unfair_lock_lock(&self->_lock);
  bytesHistory = self->_bytesHistory;
  objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v7, v3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(bytesHistory, v10, (uint64_t)v9, v11);

  bytesTimestamps = self->_bytesTimestamps;
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v13, v14, v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(bytesTimestamps, v16, (uint64_t)v15, v17);

  os_unfair_lock_unlock(&self->_lock);
  if (self->_verboseLogging)
  {
    OSLogHandleForIDSCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v20 = v3;
      v21 = 2048;
      v22 = v5;
      _os_log_impl(&dword_19B949000, v18, OS_LOG_TYPE_DEFAULT, "Producing bytes %d at time %f", buf, 0x12u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("StallDetection"), CFSTR("Producing bytes %d at time %f"));
    }
  }
}

- (void)consumeBytes:(int)a3
{
  os_unfair_lock_s *p_lock;
  const char *v6;
  uint64_t v7;
  double v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  int v15;
  const char *v16;
  double v17;
  const char *v18;
  double v19;
  BOOL v20;
  void *v21;
  const char *v22;
  double v23;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (a3 >= 1)
  {
    while (objc_msgSend_count(self->_bytesHistory, v6, v7, v8))
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_bytesHistory, v9, 0, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend_intValue(v11, v12, v13, v14);

      if (v15 > a3)
      {
        objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v16, (v15 - a3), v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_atIndexedSubscript_(self->_bytesHistory, v22, (uint64_t)v21, v23, 0);

        break;
      }
      objc_msgSend_removeObjectAtIndex_(self->_bytesHistory, v16, 0, v17);
      objc_msgSend_removeObjectAtIndex_(self->_bytesTimestamps, v18, 0, v19);
      v20 = __OFSUB__(a3, v15);
      a3 -= v15;
      if ((a3 < 0) ^ v20 | (a3 == 0))
        break;
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)reset
{
  os_unfair_lock_s *p_lock;
  const char *v4;
  uint64_t v5;
  double v6;
  const char *v7;
  uint64_t v8;
  double v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_removeAllObjects(self->_bytesHistory, v4, v5, v6);
  objc_msgSend_removeAllObjects(self->_bytesTimestamps, v7, v8, v9);
  os_unfair_lock_unlock(p_lock);
}

- (void)forceTriggerStallDetectedBlockWithEventName:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = _Block_copy(self->_stallDetectedBlock);
  v5 = v4;
  if (v4)
    (*((void (**)(void *, id))v4 + 2))(v4, v6);

}

- (BOOL)verboseLogging
{
  return self->_verboseLogging;
}

- (void)setVerboseLogging:(BOOL)a3
{
  self->_verboseLogging = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bytesTimestamps, 0);
  objc_storeStrong((id *)&self->_bytesHistory, 0);
  objc_storeStrong(&self->_stallWarningBlock, 0);
  objc_storeStrong(&self->_stallDetectedBlock, 0);
}

@end
