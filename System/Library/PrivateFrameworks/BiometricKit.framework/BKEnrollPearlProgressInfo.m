@implementation BKEnrollPearlProgressInfo

- (BKEnrollPearlProgressInfo)initWithPercents:(int64_t)a3
{
  BKEnrollPearlProgressInfo *v4;
  BKEnrollPearlProgressInfo *v5;
  uint64_t v6;
  NSArray *enrolledPoses;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKEnrollPearlProgressInfo;
  v4 = -[BKEnrollPearlProgressInfo init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_percentageCompleted = a3;
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    enrolledPoses = v5->_enrolledPoses;
    v5->_enrolledPoses = (NSArray *)v6;

  }
  return v5;
}

- (id)initFromEnrollInfo:(id *)a3
{
  BKEnrollPearlProgressInfo *v3;
  id v5;
  uint64_t v6;
  id v7;
  unsigned int var13_low;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSArray *enrolledPoses;
  NSObject *v15;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v3 = self;
  v27 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v16.receiver = self;
    v16.super_class = (Class)BKEnrollPearlProgressInfo;
    v3 = -[BKEnrollPearlProgressInfo init](&v16, sel_init);
    if (v3)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (*((_WORD *)&a3->var2.var12 + 1))
      {
        v6 = 0;
        do
        {
          v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          var13_low = LOWORD(a3->var2.var13);
          if (LOWORD(a3->var2.var13))
          {
            v9 = 0;
            do
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *((unsigned __int8 *)&a3->var2.var13 + v6 * var13_low + v9 + 2));
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v10);

              var13_low = LOWORD(a3->var2.var13);
              ++v9;
            }
            while (v9 < var13_low);
          }
          v11 = (void *)objc_msgSend(v7, "copy");
          objc_msgSend(v5, "addObject:", v11);

          ++v6;
        }
        while (v6 < *((unsigned __int16 *)&a3->var2.var12 + 1));
      }
      v3->_percentageCompleted = a3->var1;
      v12 = objc_msgSend(v5, "copy");
      enrolledPoses = v3->_enrolledPoses;
      v3->_enrolledPoses = (NSArray *)v12;

    }
  }
  else
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v18 = "info";
      v19 = 2048;
      v20 = 0;
      v21 = 2080;
      v22 = &unk_1AF575226;
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      v25 = 1024;
      v26 = 606;
      _os_log_impl(&dword_1AF533000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  return v3;
}

- (id)initFromDictionary:(id)a3
{
  id v4;
  BKEnrollPearlProgressInfo *v5;
  void *v6;
  uint64_t v7;
  NSArray *enrolledPoses;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BKEnrollPearlProgressInfo;
  v5 = -[BKEnrollPearlProgressInfo init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("percentageCompleted"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_percentageCompleted = objc_msgSend(v6, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enrollPoses"));
    v7 = objc_claimAutoreleasedReturnValue();
    enrolledPoses = v5->_enrolledPoses;
    v5->_enrolledPoses = (NSArray *)v7;

  }
  return v5;
}

- (id)dictionary
{
  void *v3;
  NSArray *enrolledPoses;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("BKEnrollPearlProgressInfo");
  v7[0] = CFSTR("class");
  v7[1] = CFSTR("percentageCompleted");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_percentageCompleted);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = CFSTR("enrollPoses");
  enrolledPoses = self->_enrolledPoses;
  v8[1] = v3;
  v8[2] = enrolledPoses;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)percentageCompleted
{
  return self->_percentageCompleted;
}

- (void)setPercentageCompleted:(int64_t)a3
{
  self->_percentageCompleted = a3;
}

- (NSArray)enrolledPoses
{
  return self->_enrolledPoses;
}

- (void)setEnrolledPoses:(id)a3
{
  objc_storeStrong((id *)&self->_enrolledPoses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrolledPoses, 0);
}

@end
