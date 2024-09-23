@implementation BDSReadingGoalsStateInfo

- (BDSReadingGoalsStateInfo)initWithBooksFinishedGoal:(id)a3 streakDayGoal:(id)a4
{
  id v7;
  id v8;
  BDSReadingGoalsStateInfo *v9;
  BDSReadingGoalsStateInfo *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BDSReadingGoalsStateInfo;
  v9 = -[BDSReadingGoalsStateInfo init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_booksFinishedGoal, a3);
    objc_storeStrong((id *)&v10->_streakDayGoal, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
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
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;

  if (self != a3)
  {
    v4 = a3;
    objc_opt_class();
    BUDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 0;
    if (!self || !v5)
      goto LABEL_13;
    objc_msgSend_booksFinishedGoal(self, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_booksFinishedGoal(v5, v12, v13, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    if (v11 == (void *)v16)
    {

    }
    else
    {
      v21 = (void *)v16;
      objc_msgSend_booksFinishedGoal(self, v17, v18, v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_booksFinishedGoal(v5, v23, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v22, v28, (uint64_t)v27, v29, v30);

      if (!isEqual)
      {
        v10 = 0;
LABEL_13:

        return v10;
      }
    }
    objc_msgSend_streakDayGoal(self, v32, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_streakDayGoal(v5, v37, v38, v39, v40);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36 == v45)
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend_streakDayGoal(self, v41, v42, v43, v44);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_streakDayGoal(v5, v47, v48, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend_isEqual_(v46, v52, (uint64_t)v51, v53, v54);

    }
    goto LABEL_13;
  }
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSReadingGoalsStateInfo)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BDSReadingGoalsStateInfo *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSNumber *booksFinishedGoal;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSNumber *streakDayGoal;

  v4 = a3;
  v9 = (BDSReadingGoalsStateInfo *)objc_msgSend_init(self, v5, v6, v7, v8);
  if (v9)
  {
    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, (uint64_t)CFSTR("booksFinishedGoal"), v12);
    v13 = objc_claimAutoreleasedReturnValue();
    booksFinishedGoal = v9->_booksFinishedGoal;
    v9->_booksFinishedGoal = (NSNumber *)v13;

    v15 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, (uint64_t)CFSTR("streakDayGoal"), v17);
    v18 = objc_claimAutoreleasedReturnValue();
    streakDayGoal = v9->_streakDayGoal;
    v9->_streakDayGoal = (NSNumber *)v18;

  }
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  id v18;

  v4 = a3;
  objc_msgSend_booksFinishedGoal(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("booksFinishedGoal"), v11);

  objc_msgSend_streakDayGoal(self, v12, v13, v14, v15);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v16, (uint64_t)v18, (uint64_t)CFSTR("streakDayGoal"), v17);

}

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BDSReadingGoalsStateInfo *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  v8 = objc_alloc_init(BDSReadingGoalsStateInfo);
  if (v8)
  {
    objc_msgSend_booksFinishedGoal(self, v4, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBooksFinishedGoal_(v8, v10, (uint64_t)v9, v11, v12);

    objc_msgSend_streakDayGoal(self, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setStreakDayGoal_(v8, v18, (uint64_t)v17, v19, v20);

  }
  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  objc_msgSend_booksFinishedGoal(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_streakDayGoal(self, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v15, (uint64_t)CFSTR("<%@: %p booksFinishedGoal:%@, streakDayGoal:%@>"), v16, v17, v4, self, v9, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSNumber)booksFinishedGoal
{
  return self->_booksFinishedGoal;
}

- (void)setBooksFinishedGoal:(id)a3
{
  objc_storeStrong((id *)&self->_booksFinishedGoal, a3);
}

- (NSNumber)streakDayGoal
{
  return self->_streakDayGoal;
}

- (void)setStreakDayGoal:(id)a3
{
  objc_storeStrong((id *)&self->_streakDayGoal, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streakDayGoal, 0);
  objc_storeStrong((id *)&self->_booksFinishedGoal, 0);
}

@end
