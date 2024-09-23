@implementation BDSReadingHistoryStreakInfo

- (BDSReadingHistoryStreakInfo)initWithEndDate:(id)a3 length:(int64_t)a4
{
  id v7;
  BDSReadingHistoryStreakInfo *v8;
  BDSReadingHistoryStreakInfo *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BDSReadingHistoryStreakInfo;
  v8 = -[BDSReadingHistoryStreakInfo init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_endDate, a3);
    v9->_length = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  int isEqual;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  if (self != a3)
  {
    v4 = a3;
    objc_opt_class();
    BUDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 0;
    if (!self || !v5)
      goto LABEL_10;
    objc_msgSend_endDate(self, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_endDate(v5, v12, v13, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    if (v11 == (void *)v16)
    {

    }
    else
    {
      v21 = (void *)v16;
      objc_msgSend_endDate(self, v17, v18, v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_endDate(v5, v23, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v22, v28, (uint64_t)v27, v29, v30);

      if (!isEqual)
      {
        v10 = 0;
LABEL_10:

        return v10;
      }
    }
    v36 = objc_msgSend_length(self, v32, v33, v34, v35);
    v10 = v36 == objc_msgSend_length(v5, v37, v38, v39, v40);
    goto LABEL_10;
  }
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSReadingHistoryStreakInfo)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BDSReadingHistoryStreakInfo *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSDate *endDate;
  const char *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v9 = (BDSReadingHistoryStreakInfo *)objc_msgSend_init(self, v5, v6, v7, v8);
  if (v9)
  {
    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, (uint64_t)CFSTR("endDate"), v12);
    v13 = objc_claimAutoreleasedReturnValue();
    endDate = v9->_endDate;
    v9->_endDate = (NSDate *)v13;

    v9->_length = objc_msgSend_decodeIntegerForKey_(v4, v15, (uint64_t)CFSTR("length"), v16, v17);
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  objc_msgSend_endDate(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v18, v9, (uint64_t)v8, (uint64_t)CFSTR("endDate"), v10);

  v15 = objc_msgSend_length(self, v11, v12, v13, v14);
  objc_msgSend_encodeInteger_forKey_(v18, v16, v15, (uint64_t)CFSTR("length"), v17);

}

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BDSReadingHistoryStreakInfo *v8;
  void *v9;
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

  v8 = objc_alloc_init(BDSReadingHistoryStreakInfo);
  if (v8)
  {
    objc_msgSend_endDate(self, v4, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEndDate_(v8, v10, (uint64_t)v9, v11, v12);

    v17 = objc_msgSend_length(self, v13, v14, v15, v16);
    objc_msgSend_setLength_(v8, v18, v17, v19, v20);
  }
  return v8;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_endDate(self, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_length(self, v8, v9, v10, v11);
  objc_msgSend_stringWithFormat_(v6, v13, (uint64_t)CFSTR("{endDate:%@, length:%ld}"), v14, v15, v7, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (int64_t)length
{
  return self->_length;
}

- (void)setLength:(int64_t)a3
{
  self->_length = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
}

@end
