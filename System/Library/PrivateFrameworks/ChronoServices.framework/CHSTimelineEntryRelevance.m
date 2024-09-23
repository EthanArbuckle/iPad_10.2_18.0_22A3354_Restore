@implementation CHSTimelineEntryRelevance

- (CHSTimelineEntryRelevance)initWithDate:(id)a3
{
  id v5;
  CHSTimelineEntryRelevance *v6;
  CHSTimelineEntryRelevance *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSTimelineEntryRelevance;
  v6 = -[CHSTimelineEntryRelevance init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_date, a3);
    v7->_hasRelevance = 0;
    v7->_score = 0.0;
    v7->_duration = 0.0;
  }

  return v7;
}

- (CHSTimelineEntryRelevance)initWithDate:(id)a3 score:(double)a4 duration:(double)a5
{
  id v9;
  CHSTimelineEntryRelevance *v10;
  CHSTimelineEntryRelevance *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CHSTimelineEntryRelevance;
  v10 = -[CHSTimelineEntryRelevance init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_date, a3);
    v11->_hasRelevance = 1;
    v11->_score = a4;
    v11->_duration = a5;
  }

  return v11;
}

- (CHSTimelineEntryRelevance)initWithTimelineEntryRelevance:(id)a3
{
  id *v4;
  CHSTimelineEntryRelevance *v5;
  CHSTimelineEntryRelevance *v6;
  objc_super v8;

  v4 = (id *)a3;
  v8.receiver = self;
  v8.super_class = (Class)CHSTimelineEntryRelevance;
  v5 = -[CHSTimelineEntryRelevance init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_date, v4[2]);
    v6->_hasRelevance = *((_BYTE *)v4 + 8);
    *(_QWORD *)&v6->_score = v4[3];
    *(_QWORD *)&v6->_duration = v4[4];
  }

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_date);
  v5 = (id)objc_msgSend(v3, "appendBool:", self->_hasRelevance);
  v6 = (id)objc_msgSend(v3, "appendDouble:", self->_score);
  v7 = (id)objc_msgSend(v3, "appendDouble:", self->_duration);
  v8 = objc_msgSend(v3, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSDate *date;
  uint64_t v7;
  id v8;
  id v9;
  _BOOL8 hasRelevance;
  id v11;
  id v12;
  double score;
  id v14;
  id v15;
  double duration;
  id v17;
  char v18;
  uint64_t v20;
  uint64_t v21;
  double (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  date = self->_date;
  v7 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __37__CHSTimelineEntryRelevance_isEqual___block_invoke;
  v29[3] = &unk_1E2A5A268;
  v8 = v4;
  v30 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", date, v29);
  hasRelevance = self->_hasRelevance;
  v27[0] = v7;
  v27[1] = 3221225472;
  v27[2] = __37__CHSTimelineEntryRelevance_isEqual___block_invoke_2;
  v27[3] = &unk_1E2A5A508;
  v11 = v8;
  v28 = v11;
  v12 = (id)objc_msgSend(v5, "appendBool:counterpart:", hasRelevance, v27);
  if (self->_hasRelevance)
  {
    score = self->_score;
    v25[0] = v7;
    v25[1] = 3221225472;
    v25[2] = __37__CHSTimelineEntryRelevance_isEqual___block_invoke_3;
    v25[3] = &unk_1E2A5A4E0;
    v14 = v11;
    v26 = v14;
    v15 = (id)objc_msgSend(v5, "appendDouble:counterpart:", v25, score);
    duration = self->_duration;
    v20 = v7;
    v21 = 3221225472;
    v22 = __37__CHSTimelineEntryRelevance_isEqual___block_invoke_4;
    v23 = &unk_1E2A5A4E0;
    v24 = v14;
    v17 = (id)objc_msgSend(v5, "appendDouble:counterpart:", &v20, duration);

  }
  v18 = objc_msgSend(v5, "isEqual", v20, v21, v22, v23);

  return v18;
}

id __37__CHSTimelineEntryRelevance_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

uint64_t __37__CHSTimelineEntryRelevance_isEqual___block_invoke_2(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);
}

double __37__CHSTimelineEntryRelevance_isEqual___block_invoke_3(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 24);
}

double __37__CHSTimelineEntryRelevance_isEqual___block_invoke_4(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 32);
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_date, CFSTR("date"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", self->_hasRelevance, CFSTR("hasRelevance"));
  if (self->_hasRelevance)
  {
    v6 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("score"), self->_score);
    v7 = (id)objc_msgSend(v3, "appendTimeInterval:withName:decomposeUnits:", CFSTR("duration"), 0, self->_duration);
  }
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CHSTimelineEntryRelevance)initWithCoder:(id)a3
{
  id v4;
  CHSTimelineEntryRelevance *v5;
  uint64_t v6;
  NSDate *date;
  double v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CHSTimelineEntryRelevance;
  v5 = -[CHSTimelineEntryRelevance init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v6 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    v5->_hasRelevance = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasRelevance"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("score"));
    v5->_score = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("duration"));
    v5->_duration = v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_date, CFSTR("date"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_hasRelevance, CFSTR("hasRelevance"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("score"), self->_score);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("duration"), self->_duration);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)hasRelevance
{
  return self->_hasRelevance;
}

- (double)score
{
  return self->_score;
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
