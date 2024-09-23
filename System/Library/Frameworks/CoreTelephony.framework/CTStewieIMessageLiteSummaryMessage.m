@implementation CTStewieIMessageLiteSummaryMessage

- (CTStewieIMessageLiteSummaryMessage)initWithPendingIMessageLiteTotalCount:(int64_t)a3 pendingCounts:(id)a4 error:(id *)p_isa
{
  id v9;
  CTStewieIMessageLiteSummaryMessage *v10;
  void *v11;
  void *v12;
  objc_super v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  if (v9)
  {
    v14.receiver = self;
    v14.super_class = (Class)CTStewieIMessageLiteSummaryMessage;
    v10 = -[CTStewieIMessageLiteSummaryMessage init](&v14, sel_init);
    p_isa = (id *)&v10->super.isa;
    if (v10)
    {
      v10->_pendingIMessageLiteTotalCount = a3;
      objc_storeStrong((id *)&v10->_pendingCounts, a4);
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
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2D50];
    v16[0] = CFSTR("Pending counts are missing");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v12);
    *p_isa = (id)objc_claimAutoreleasedReturnValue();

    p_isa = 0;
  }

  return (CTStewieIMessageLiteSummaryMessage *)p_isa;
}

- (NSString)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", pendingIMessageLiteTotalCount=%ld"), -[CTStewieIMessageLiteSummaryMessage pendingIMessageLiteTotalCount](self, "pendingIMessageLiteTotalCount"));
  -[CTStewieIMessageLiteSummaryMessage pendingCounts](self, "pendingCounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", pendingCounts=%@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (BOOL)isEqualToOther:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  v5 = -[CTStewieIMessageLiteSummaryMessage pendingIMessageLiteTotalCount](self, "pendingIMessageLiteTotalCount");
  if (v5 == objc_msgSend(v4, "pendingIMessageLiteTotalCount"))
  {
    -[CTStewieIMessageLiteSummaryMessage pendingCounts](self, "pendingCounts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pendingCounts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      -[CTStewieIMessageLiteSummaryMessage pendingCounts](self, "pendingCounts");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pendingCounts");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CTStewieIMessageLiteSummaryMessage *v4;
  BOOL v5;

  v4 = (CTStewieIMessageLiteSummaryMessage *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CTStewieIMessageLiteSummaryMessage isEqualToOther:](self, "isEqualToOther:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setPendingIMessageLiteTotalCount:", -[CTStewieIMessageLiteSummaryMessage pendingIMessageLiteTotalCount](self, "pendingIMessageLiteTotalCount"));
  -[CTStewieIMessageLiteSummaryMessage pendingCounts](self, "pendingCounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setPendingCounts:", v7);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[CTStewieIMessageLiteSummaryMessage pendingIMessageLiteTotalCount](self, "pendingIMessageLiteTotalCount"), CFSTR("pendingIMessageLiteTotalCount"));
  -[CTStewieIMessageLiteSummaryMessage pendingCounts](self, "pendingCounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("pendingCounts"));

}

- (CTStewieIMessageLiteSummaryMessage)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  CTStewieIMessageLiteSummaryMessage *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pendingIMessageLiteTotalCount"));
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("pendingCounts"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CTStewieIMessageLiteSummaryMessage initWithPendingIMessageLiteTotalCount:pendingCounts:error:](self, "initWithPendingIMessageLiteTotalCount:pendingCounts:error:", v5, v9, 0);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)pendingIMessageLiteTotalCount
{
  return self->_pendingIMessageLiteTotalCount;
}

- (void)setPendingIMessageLiteTotalCount:(int64_t)a3
{
  self->_pendingIMessageLiteTotalCount = a3;
}

- (NSArray)pendingCounts
{
  return self->_pendingCounts;
}

- (void)setPendingCounts:(id)a3
{
  objc_storeStrong((id *)&self->_pendingCounts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingCounts, 0);
}

@end
