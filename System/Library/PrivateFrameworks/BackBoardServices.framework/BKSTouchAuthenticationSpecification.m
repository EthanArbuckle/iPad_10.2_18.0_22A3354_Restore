@implementation BKSTouchAuthenticationSpecification

- (BKSTouchAuthenticationSpecification)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSTouchAuthenticationSpecification *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSTouchAuthenticationSpecification *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot directly allocate BKSTouchAuthenticationSpecification"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("BKSTouchAuthenticationSpecification.m");
    v17 = 1024;
    v18 = 62;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSTouchAuthenticationSpecification *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- ($BEA516A46C1BA1F84587E5D243A711F7)backgroundStatisticsRegion
{
  return *($BEA516A46C1BA1F84587E5D243A711F7 *)&self->_backgroundStatisticsTopEdgeInset;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  double v18;
  void *v19;
  uint64_t v20;
  double v21;
  void *v22;
  uint64_t v23;
  double v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;

  v3 = -[NSSet hash](self->_displays, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_slotID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_authenticationMessageContext);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_secureName);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_backgroundStatisticsTopEdgeInset);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_backgroundStatisticsLeftEdgeInset);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_backgroundStatisticsBottomEdgeInset);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9 ^ v13 ^ objc_msgSend(v14, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_backgroundStatisticsRightEdgeInset);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hash");

  *(float *)&v18 = self->_backgroundStatisticsForeground;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v17 ^ objc_msgSend(v19, "hash");

  *(float *)&v21 = self->_backgroundStatisticsPassingContrast;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v20 ^ objc_msgSend(v22, "hash");

  *(float *)&v24 = self->_backgroundStatisticsFailingContrast;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v15 ^ v23 ^ objc_msgSend(v25, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_hitTestInformationMask);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_initialSampleEvent);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v26 ^ v28 ^ objc_msgSend(v29, "hash");

  v31 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * (v30 ^ (v30 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v30 ^ (v30 >> 30))) >> 27));
  return v31 ^ (v31 >> 31);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _DWORD *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = BSEqualObjects()
      && v5[4] == self->_slotID
      && *((_QWORD *)v5 + 3) == self->_authenticationMessageContext
      && v5[5] == self->_secureName
      && *((unsigned __int16 *)v5 + 16) == self->_backgroundStatisticsTopEdgeInset
      && *((unsigned __int16 *)v5 + 17) == self->_backgroundStatisticsLeftEdgeInset
      && *((unsigned __int16 *)v5 + 18) == self->_backgroundStatisticsBottomEdgeInset
      && *((unsigned __int16 *)v5 + 19) == self->_backgroundStatisticsRightEdgeInset
      && *((_QWORD *)v5 + 7) == self->_hitTestInformationMask
      && *((_QWORD *)v5 + 8) == self->_initialSampleEvent;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[BKSTouchAuthenticationSpecification _initWithCopyOf:]([BKSTouchAuthenticationSpecification alloc], self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[BKSTouchAuthenticationSpecification _initWithCopyOf:]([BKSMutableTouchAuthenticationSpecification alloc], self);
}

- (BKSTouchAuthenticationSpecification)initWithCoder:(id)a3
{
  id v4;
  BKSTouchAuthenticationSpecification *v5;
  NSSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSSet *displays;
  float v12;
  float v13;
  float v14;
  BKSTouchAuthenticationSpecification *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  uint64_t v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BKSTouchAuthenticationSpecification;
  v5 = -[BKSTouchAuthenticationSpecification init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displays"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v6 = (NSSet *)(id)objc_claimAutoreleasedReturnValue();
    v7 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v16 = (void *)MEMORY[0x1E0CB35C8];
            v17 = *MEMORY[0x1E0CB28A8];
            v27 = *MEMORY[0x1E0CB2D68];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unexpected class decoded from display set: %@"), objc_opt_class());
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v18;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 4866, v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "failWithError:", v20);

            v15 = 0;
            goto LABEL_13;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
        if (v8)
          continue;
        break;
      }
    }

    displays = v5->_displays;
    v5->_displays = v6;

    v5->_slotID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("slotID"));
    v5->_authenticationMessageContext = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("authenticationMessageContext"));
    v5->_secureName = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("secureName"));
    v5->_backgroundStatisticsTopEdgeInset = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("backgroundStatisticsTopEdgeInset"));
    v5->_backgroundStatisticsLeftEdgeInset = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("backgroundStatisticsLeftEdgeInset"));
    v5->_backgroundStatisticsBottomEdgeInset = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("backgroundStatisticsBottomEdgeInset"));
    v5->_backgroundStatisticsRightEdgeInset = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("backgroundStatisticsRightEdgeInset"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("backgroundStatisticsForeground"));
    v5->_backgroundStatisticsForeground = v12;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("backgroundStatisticsPassingContrast"));
    v5->_backgroundStatisticsPassingContrast = v13;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("backgroundStatisticsFailingContrast"));
    v5->_backgroundStatisticsFailingContrast = v14;
    v5->_hitTestInformationMask = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("hitTestInformationMask"));
    v5->_initialSampleEvent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("initialSampleEvent"));
  }
  v15 = v5;
LABEL_13:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSSet *displays;
  double v6;
  double v7;
  double v8;
  id v9;

  v4 = a3;
  displays = self->_displays;
  v9 = v4;
  if (displays)
  {
    objc_msgSend(v4, "encodeObject:forKey:", displays, CFSTR("displays"));
    v4 = v9;
  }
  objc_msgSend(v4, "encodeInt32:forKey:", self->_slotID, CFSTR("slotID"));
  objc_msgSend(v9, "encodeInt64:forKey:", self->_authenticationMessageContext, CFSTR("authenticationMessageContext"));
  objc_msgSend(v9, "encodeInt32:forKey:", self->_secureName, CFSTR("secureName"));
  objc_msgSend(v9, "encodeInt32:forKey:", self->_backgroundStatisticsTopEdgeInset, CFSTR("backgroundStatisticsTopEdgeInset"));
  objc_msgSend(v9, "encodeInt32:forKey:", self->_backgroundStatisticsLeftEdgeInset, CFSTR("backgroundStatisticsLeftEdgeInset"));
  objc_msgSend(v9, "encodeInt32:forKey:", self->_backgroundStatisticsBottomEdgeInset, CFSTR("backgroundStatisticsBottomEdgeInset"));
  objc_msgSend(v9, "encodeInt32:forKey:", self->_backgroundStatisticsRightEdgeInset, CFSTR("backgroundStatisticsRightEdgeInset"));
  *(float *)&v6 = self->_backgroundStatisticsForeground;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("backgroundStatisticsForeground"), v6);
  *(float *)&v7 = self->_backgroundStatisticsPassingContrast;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("backgroundStatisticsPassingContrast"), v7);
  *(float *)&v8 = self->_backgroundStatisticsFailingContrast;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("backgroundStatisticsFailingContrast"), v8);
  objc_msgSend(v9, "encodeInteger:forKey:", self->_hitTestInformationMask, CFSTR("hitTestInformationMask"));
  objc_msgSend(v9, "encodeInteger:forKey:", self->_initialSampleEvent, CFSTR("initialSampleEvent"));

}

- (void)appendDescriptionToFormatter:(id)a3
{
  NSSet *displays;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;

  displays = self->_displays;
  v5 = a3;
  v6 = (id)objc_msgSend(v5, "appendObject:withName:", displays, CFSTR("displays"));
  v7 = (id)objc_msgSend(v5, "appendUInt64:withName:format:", self->_slotID, CFSTR("slotID"), 1);
  v8 = (id)objc_msgSend(v5, "appendUInt64:withName:format:", self->_secureName, CFSTR("secureName"), 1);
  v9 = (id)objc_msgSend(v5, "appendUInt64:withName:format:", self->_backgroundStatisticsTopEdgeInset, CFSTR("backgroundStatisticsTopEdgeInset"), 1);
  v10 = (id)objc_msgSend(v5, "appendUInt64:withName:format:", self->_backgroundStatisticsLeftEdgeInset, CFSTR("backgroundStatisticsLeftEdgeInset"), 1);
  v11 = (id)objc_msgSend(v5, "appendUInt64:withName:format:", self->_backgroundStatisticsBottomEdgeInset, CFSTR("backgroundStatisticsBottomEdgeInset"), 1);
  v12 = (id)objc_msgSend(v5, "appendUInt64:withName:format:", self->_backgroundStatisticsRightEdgeInset, CFSTR("backgroundStatisticsRightEdgeInset"), 1);
  v13 = (id)objc_msgSend(v5, "appendFloat:withName:", CFSTR("backgroundStatisticsForeground"), self->_backgroundStatisticsForeground);
  v14 = (id)objc_msgSend(v5, "appendFloat:withName:", CFSTR("backgroundStatisticsPassingContrast"), self->_backgroundStatisticsPassingContrast);
  v15 = (id)objc_msgSend(v5, "appendFloat:withName:", CFSTR("backgroundStatisticsFailingContrast"), self->_backgroundStatisticsFailingContrast);
  v16 = (id)objc_msgSend(v5, "appendUInt64:withName:format:", self->_authenticationMessageContext, CFSTR("authenticationMessageContext"), 1);
  NSStringFromBKSHIDEventHitTestLayerInformationMask(self->_hitTestInformationMask);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v17, CFSTR("hitTestInformationMask"));

  NSStringFromBKSTouchAuthenticationInitialSampleEvent(self->_initialSampleEvent);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v18, CFSTR("initialSampleEvent"));

}

- (NSSet)displays
{
  return self->_displays;
}

- (unsigned)slotID
{
  return self->_slotID;
}

- (unint64_t)authenticationMessageContext
{
  return self->_authenticationMessageContext;
}

- (unsigned)secureName
{
  return self->_secureName;
}

- (float)backgroundStatisticsForeground
{
  return self->_backgroundStatisticsForeground;
}

- (float)backgroundStatisticsPassingContrast
{
  return self->_backgroundStatisticsPassingContrast;
}

- (float)backgroundStatisticsFailingContrast
{
  return self->_backgroundStatisticsFailingContrast;
}

- (unint64_t)hitTestInformationMask
{
  return self->_hitTestInformationMask;
}

- (int64_t)initialSampleEvent
{
  return self->_initialSampleEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displays, 0);
}

- (id)_init
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = objc_opt_class();
    if (v2 != objc_opt_class())
    {
      v3 = objc_opt_class();
      if (v3 != objc_opt_class())
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKSTouchAuthenticationSpecification cannot be subclassed"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__init);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = (objc_class *)objc_opt_class();
          NSStringFromClass(v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v10 = v5;
          v11 = 2114;
          v12 = v7;
          v13 = 2048;
          v14 = v1;
          v15 = 2114;
          v16 = CFSTR("BKSTouchAuthenticationSpecification.m");
          v17 = 1024;
          v18 = 73;
          v19 = 2114;
          v20 = v4;
          _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18A125728);
      }
    }
    v8.receiver = v1;
    v8.super_class = (Class)BKSTouchAuthenticationSpecification;
    result = objc_msgSendSuper2(&v8, sel_init);
    if (result)
      *((_QWORD *)result + 8) = 1;
  }
  return result;
}

- (id)_initWithCopyOf:(id)a1
{
  id *v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (a1)
  {
    a1 = -[BKSTouchAuthenticationSpecification _init](a1);
    if (a1)
    {
      v4 = objc_msgSend(v3[1], "copy");
      v5 = (void *)*((_QWORD *)a1 + 1);
      *((_QWORD *)a1 + 1) = v4;

      *((_DWORD *)a1 + 4) = *((_DWORD *)v3 + 4);
      *((_QWORD *)a1 + 3) = v3[3];
      *((_DWORD *)a1 + 5) = *((_DWORD *)v3 + 5);
      *((_WORD *)a1 + 16) = *((_WORD *)v3 + 16);
      *((_WORD *)a1 + 17) = *((_WORD *)v3 + 17);
      *((_WORD *)a1 + 18) = *((_WORD *)v3 + 18);
      *((_WORD *)a1 + 19) = *((_WORD *)v3 + 19);
      *((_DWORD *)a1 + 10) = *((_DWORD *)v3 + 10);
      *((_DWORD *)a1 + 11) = *((_DWORD *)v3 + 11);
      *((_DWORD *)a1 + 12) = *((_DWORD *)v3 + 12);
      *((_QWORD *)a1 + 7) = v3[7];
      *((_QWORD *)a1 + 8) = v3[8];
    }
  }

  return a1;
}

+ (id)buildSpecification:(id)a3
{
  void (**v3)(id, id);
  id v4;
  void *v5;

  v3 = (void (**)(id, id))a3;
  v4 = -[BKSTouchAuthenticationSpecification _init]([BKSMutableTouchAuthenticationSpecification alloc]);
  v3[2](v3, v4);

  v5 = (void *)objc_msgSend(v4, "copy");
  return v5;
}

+ (id)new
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot directly allocate BKSTouchAuthenticationSpecification"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = a1;
    v15 = 2114;
    v16 = CFSTR("BKSTouchAuthenticationSpecification.m");
    v17 = 1024;
    v18 = 67;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)protobufSchema
{
  return (id)objc_msgSend(MEMORY[0x1E0D01838], "buildSchemaForClass:builder:", a1, &__block_literal_global_3920);
}

void __53__BKSTouchAuthenticationSpecification_protobufSchema__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "addRepeatingField:containsClass:", "_displays", objc_opt_class());
  objc_msgSend(v2, "addField:", "_slotID");
  objc_msgSend(v2, "addField:", "_authenticationMessageContext");
  objc_msgSend(v2, "addField:", "_secureName");
  objc_msgSend(v2, "addField:", "_backgroundStatisticsTopEdgeInset");
  objc_msgSend(v2, "addField:", "_backgroundStatisticsLeftEdgeInset");
  objc_msgSend(v2, "addField:", "_backgroundStatisticsBottomEdgeInset");
  objc_msgSend(v2, "addField:", "_backgroundStatisticsRightEdgeInset");
  objc_msgSend(v2, "addField:", "_backgroundStatisticsForeground");
  objc_msgSend(v2, "addField:", "_backgroundStatisticsPassingContrast");
  objc_msgSend(v2, "addField:", "_backgroundStatisticsFailingContrast");
  objc_msgSend(v2, "addField:", "_hitTestInformationMask");
  objc_msgSend(v2, "addField:", "_initialSampleEvent");

}

@end
