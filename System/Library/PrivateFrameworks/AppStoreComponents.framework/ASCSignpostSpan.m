@implementation ASCSignpostSpan

- (ASCSignpostSpan)init
{
  ASCSignpostSpan *v3;
  NSMutableSet *v4;
  NSMutableSet *mutableSupplementaryTags;
  objc_super v7;

  +[ASCEligibility assertCurrentProcessEligibility]();
  v7.receiver = self;
  v7.super_class = (Class)ASCSignpostSpan;
  v3 = -[ASCSignpostSpan init](&v7, sel_init);
  if (v3)
  {
    v3->_primaryTag = ASCSignpostTagUnique();
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    mutableSupplementaryTags = v3->_mutableSupplementaryTags;
    v3->_mutableSupplementaryTags = v4;

  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCSignpostSpan)initWithCoder:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  ASCSignpostSpan *v9;
  uint64_t v10;
  NSMutableSet *mutableSupplementaryTags;
  uint64_t v12;
  NSDate *startDate;
  uint64_t v14;
  NSDate *endDate;
  ASCSignpostSpan *v16;
  objc_super v18;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99E60]);
  v6 = objc_opt_class();
  v7 = (void *)objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("supplementaryTags"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v18.receiver = self;
    v18.super_class = (Class)ASCSignpostSpan;
    v9 = -[ASCSignpostSpan init](&v18, sel_init);
    if (v9)
    {
      v9->_primaryTag = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("primaryTag"));
      v10 = objc_msgSend(v8, "mutableCopy");
      mutableSupplementaryTags = v9->_mutableSupplementaryTags;
      v9->_mutableSupplementaryTags = (NSMutableSet *)v10;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
      v12 = objc_claimAutoreleasedReturnValue();
      startDate = v9->_startDate;
      v9->_startDate = (NSDate *)v12;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
      v14 = objc_claimAutoreleasedReturnValue();
      endDate = v9->_endDate;
      v9->_endDate = (NSDate *)v14;

    }
    self = v9;
    v16 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ASCSignpostSpan initWithCoder:].cold.1();
    v16 = 0;
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[ASCSignpostSpan primaryTag](self, "primaryTag"), CFSTR("primaryTag"));
  -[ASCSignpostSpan supplementaryTags](self, "supplementaryTags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("supplementaryTags"));

  -[ASCSignpostSpan startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("startDate"));

  -[ASCSignpostSpan endDate](self, "endDate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("endDate"));

}

- (NSSet)supplementaryTags
{
  void *v2;
  void *v3;

  -[ASCSignpostSpan mutableSupplementaryTags](self, "mutableSupplementaryTags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSSet *)v3;
}

- (NSDateInterval)dateRange
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;

  -[ASCSignpostSpan startDate](self, "startDate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[ASCSignpostSpan endDate](self, "endDate");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v12 = 0;
      goto LABEL_7;
    }
    v6 = (void *)v5;
    -[ASCSignpostSpan endDate](self, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCSignpostSpan startDate](self, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "compare:", v8);

    if (v9 != -1)
    {
      v10 = objc_alloc(MEMORY[0x1E0CB3588]);
      -[ASCSignpostSpan startDate](self, "startDate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCSignpostSpan endDate](self, "endDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithStartDate:endDate:", v4, v11);

LABEL_7:
      return (NSDateInterval *)v12;
    }
  }
  v12 = 0;
  return (NSDateInterval *)v12;
}

- (void)addSupplementaryTag:(unint64_t)a3
{
  void *v4;
  id v5;

  -[ASCSignpostSpan mutableSupplementaryTags](self, "mutableSupplementaryTags");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)beginEmitting
{
  void *v3;
  id v4;
  id v5;

  -[ASCSignpostSpan startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99DA0]);
    objc_exception_throw((id)objc_msgSend(v4, "initWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Signpost span has already begun"), 0));
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -1.0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCSignpostSpan setStartDate:](self, "setStartDate:", v5);

}

- (void)endEmitting
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  const __CFString *v7;
  id v8;

  -[ASCSignpostSpan startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99DA0]);
    v6 = *MEMORY[0x1E0C99768];
    v7 = CFSTR("Cannot end signpost span which has not begun");
    goto LABEL_6;
  }
  -[ASCSignpostSpan endDate](self, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99DA0]);
    v6 = *MEMORY[0x1E0C99768];
    v7 = CFSTR("Signpost span has already ended");
LABEL_6:
    objc_exception_throw((id)objc_msgSend(v5, "initWithName:reason:userInfo:", v6, v7, 0));
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1.0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCSignpostSpan setEndDate:](self, "setEndDate:", v8);

}

- (id)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCDescriber addUInt64:withName:](v3, "addUInt64:withName:", -[ASCSignpostSpan primaryTag](self, "primaryTag"), CFSTR("primaryTag"));
  -[ASCSignpostSpan mutableSupplementaryTags](self, "mutableSupplementaryTags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("supplementaryTags"));

  -[ASCSignpostSpan startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("startDate"));

  -[ASCSignpostSpan endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, CFSTR("endDate"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)primaryTag
{
  return self->_primaryTag;
}

- (NSMutableSet)mutableSupplementaryTags
{
  return self->_mutableSupplementaryTags;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_mutableSupplementaryTags, 0);
}

- (void)initWithCoder:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not decode ASCSignpostSpan because supplementaryTags was missing", v0, 2u);
}

@end
