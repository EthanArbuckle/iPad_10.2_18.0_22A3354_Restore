@implementation CTStewieIMessageLiteSummaryPendingCount

- (CTStewieIMessageLiteSummaryPendingCount)initWithOtherShortHandle:(id)a3 pendingCount:(int64_t)a4 error:(id *)p_isa
{
  _anonymous_namespace_ *v9;
  NSNumber *v10;
  CTStewieIMessageLiteSummaryPendingCount *v11;
  void *v12;
  void *v13;
  objc_super v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v9 = (_anonymous_namespace_ *)a3;
  {
    v15.receiver = self;
    v15.super_class = (Class)CTStewieIMessageLiteSummaryPendingCount;
    v11 = -[CTStewieIMessageLiteSummaryPendingCount init](&v15, sel_init);
    p_isa = (id *)&v11->super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_otherShortHandle, a3);
      p_isa[2] = (id)a4;
      self = p_isa;
      p_isa = (id *)&self->super.isa;
    }
    else
    {
      self = 0;
    }
  }
  else if (p_isa)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D50];
    v17[0] = CFSTR("Invalid otherShortHandle");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v13);
    *p_isa = (id)objc_claimAutoreleasedReturnValue();

    p_isa = 0;
  }

  return (CTStewieIMessageLiteSummaryPendingCount *)p_isa;
}

- (BOOL)isEqualToOther:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  int64_t v10;

  v6 = a3;
  -[CTStewieIMessageLiteSummaryPendingCount otherShortHandle](self, "otherShortHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "otherShortHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 != v8)
  {
    -[CTStewieIMessageLiteSummaryPendingCount otherShortHandle](self, "otherShortHandle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "otherShortHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqual:", v4))
    {
      v9 = 0;
LABEL_5:

      goto LABEL_6;
    }
  }
  v10 = -[CTStewieIMessageLiteSummaryPendingCount pendingCount](self, "pendingCount");
  v9 = v10 == objc_msgSend(v6, "pendingCount");
  if (v7 != v8)
    goto LABEL_5;
LABEL_6:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CTStewieIMessageLiteSummaryPendingCount *v4;
  BOOL v5;

  v4 = (CTStewieIMessageLiteSummaryPendingCount *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CTStewieIMessageLiteSummaryPendingCount isEqualToOther:](self, "isEqualToOther:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTStewieIMessageLiteSummaryPendingCount otherShortHandle](self, "otherShortHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setOtherShortHandle:", v7);

  objc_msgSend(v5, "setPendingCount:", -[CTStewieIMessageLiteSummaryPendingCount pendingCount](self, "pendingCount"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CTStewieIMessageLiteSummaryPendingCount otherShortHandle](self, "otherShortHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("otherShortHandle"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[CTStewieIMessageLiteSummaryPendingCount pendingCount](self, "pendingCount"), CFSTR("pendingCount"));
}

- (CTStewieIMessageLiteSummaryPendingCount)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  CTStewieIMessageLiteSummaryPendingCount *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("otherShortHandle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CTStewieIMessageLiteSummaryPendingCount initWithOtherShortHandle:pendingCount:error:](self, "initWithOtherShortHandle:pendingCount:error:", v5, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pendingCount")), 0);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)otherShortHandle
{
  return self->_otherShortHandle;
}

- (void)setOtherShortHandle:(id)a3
{
  objc_storeStrong((id *)&self->_otherShortHandle, a3);
}

- (int64_t)pendingCount
{
  return self->_pendingCount;
}

- (void)setPendingCount:(int64_t)a3
{
  self->_pendingCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherShortHandle, 0);
}

@end
