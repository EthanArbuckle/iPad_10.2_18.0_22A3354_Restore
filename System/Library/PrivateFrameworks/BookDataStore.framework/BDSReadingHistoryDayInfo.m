@implementation BDSReadingHistoryDayInfo

- (BDSReadingHistoryDayInfo)initWithReadingTime:(int64_t)a3 goal:(int64_t)a4 isStreakDay:(BOOL)a5
{
  BDSReadingHistoryDayInfo *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BDSReadingHistoryDayInfo;
  result = -[BDSReadingHistoryDayInfo init](&v9, sel_init);
  if (result)
  {
    result->_readingTime = a3;
    result->_goal = a4;
    result->_isStreakDay = a5;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int isStreakDay;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  if (self == a3)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    v9 = a3;
    objc_opt_class();
    BUDynamicCast();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v9) = 0;
    if (self && v4)
    {
      v10 = objc_msgSend_readingTime(self, v5, v6, v7, v8);
      if (v10 == objc_msgSend_readingTime(v4, v11, v12, v13, v14)
        && (v19 = objc_msgSend_goal(self, v15, v16, v17, v18), v19 == objc_msgSend_goal(v4, v20, v21, v22, v23)))
      {
        isStreakDay = objc_msgSend_isStreakDay(self, v24, v25, v26, v27);
        LODWORD(v9) = isStreakDay ^ objc_msgSend_isStreakDay(v4, v29, v30, v31, v32) ^ 1;
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }

  }
  return (char)v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSReadingHistoryDayInfo)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  BDSReadingHistoryDayInfo *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v12 = (BDSReadingHistoryDayInfo *)objc_msgSend_init(self, v5, v6, v7, v8);
  if (v12)
  {
    v12->_readingTime = objc_msgSend_decodeIntegerForKey_(v4, v9, (uint64_t)CFSTR("readingTime"), v10, v11);
    v12->_goal = objc_msgSend_decodeIntegerForKey_(v4, v13, (uint64_t)CFSTR("goal"), v14, v15);
    v12->_isStreakDay = objc_msgSend_decodeBoolForKey_(v4, v16, (uint64_t)CFSTR("isStreakDay"), v17, v18);
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t isStreakDay;
  const char *v23;
  uint64_t v24;
  id v25;

  v25 = a3;
  v8 = objc_msgSend_readingTime(self, v4, v5, v6, v7);
  objc_msgSend_encodeInteger_forKey_(v25, v9, v8, (uint64_t)CFSTR("readingTime"), v10);
  v15 = objc_msgSend_goal(self, v11, v12, v13, v14);
  objc_msgSend_encodeInteger_forKey_(v25, v16, v15, (uint64_t)CFSTR("goal"), v17);
  isStreakDay = objc_msgSend_isStreakDay(self, v18, v19, v20, v21);
  objc_msgSend_encodeBool_forKey_(v25, v23, isStreakDay, (uint64_t)CFSTR("isStreakDay"), v24);

}

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BDSReadingHistoryDayInfo *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t isStreakDay;
  const char *v26;
  uint64_t v27;
  uint64_t v28;

  v8 = objc_alloc_init(BDSReadingHistoryDayInfo);
  if (v8)
  {
    v9 = objc_msgSend_readingTime(self, v4, v5, v6, v7);
    objc_msgSend_setReadingTime_(v8, v10, v9, v11, v12);
    v17 = objc_msgSend_goal(self, v13, v14, v15, v16);
    objc_msgSend_setGoal_(v8, v18, v17, v19, v20);
    isStreakDay = objc_msgSend_isStreakDay(self, v21, v22, v23, v24);
    objc_msgSend_setIsStreakDay_(v8, v26, isStreakDay, v27, v28);
  }
  return v8;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int isStreakDay;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = objc_msgSend_readingTime(self, a2, v2, v3, v4);
  v12 = objc_msgSend_goal(self, v8, v9, v10, v11);
  isStreakDay = objc_msgSend_isStreakDay(self, v13, v14, v15, v16);
  return (id)objc_msgSend_stringWithFormat_(v6, v18, (uint64_t)CFSTR("{readingTime:%ld, goal:%ld, isStreakDay:%d}"), v19, v20, v7, v12, isStreakDay);
}

- (int64_t)readingTime
{
  return self->_readingTime;
}

- (void)setReadingTime:(int64_t)a3
{
  self->_readingTime = a3;
}

- (int64_t)goal
{
  return self->_goal;
}

- (void)setGoal:(int64_t)a3
{
  self->_goal = a3;
}

- (BOOL)isStreakDay
{
  return self->_isStreakDay;
}

- (void)setIsStreakDay:(BOOL)a3
{
  self->_isStreakDay = a3;
}

@end
