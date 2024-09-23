@implementation MUIManualSummaryContext

- (MUIManualSummaryContext)initWithSummary:(id)a3 error:(id)a4 summarizableMessageCount:(unint64_t)a5 isInlineSummary:(BOOL)a6 summaryControllerFuture:(id)a7
{
  id v12;
  id v13;
  id v14;
  MUIManualSummaryContext *v15;
  MUIManualSummaryContext *v16;
  uint64_t v17;
  NSAttributedString *summary;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v20.receiver = self;
  v20.super_class = (Class)MUIManualSummaryContext;
  v15 = -[MUIManualSummaryContext init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_state = 0;
    v17 = objc_msgSend(v12, "copy");
    summary = v16->_summary;
    v16->_summary = (NSAttributedString *)v17;

    objc_storeStrong((id *)&v16->_error, a4);
    v16->_summarizableMessageCount = a5;
    v16->_isInlineSummary = a6;
    objc_storeStrong((id *)&v16->_summaryControllerFuture, a7);
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  MUIManualSummaryContext *v4;
  MUIManualSummaryContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  _BOOL4 v11;
  _BOOL4 v12;

  v4 = (MUIManualSummaryContext *)a3;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MUIManualSummaryContext summary](self, "summary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUIManualSummaryContext summary](v5, "summary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (EFObjectsAreEqual())
      {
        -[MUIManualSummaryContext error](self, "error");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MUIManualSummaryContext error](v5, "error");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (EFObjectsAreEqual()
          && (v10 = -[MUIManualSummaryContext summarizableMessageCount](self, "summarizableMessageCount"),
              v10 == -[MUIManualSummaryContext summarizableMessageCount](v5, "summarizableMessageCount")))
        {
          v11 = -[MUIManualSummaryContext isInlineSummary](self, "isInlineSummary");
          v12 = v11 ^ -[MUIManualSummaryContext isInlineSummary](v5, "isInlineSummary") ^ 1;
        }
        else
        {
          LOBYTE(v12) = 0;
        }

      }
      else
      {
        LOBYTE(v12) = 0;
      }

    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;

  -[MUIManualSummaryContext summary](self, "summary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[MUIManualSummaryContext error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 33 * (33 * v4 + objc_msgSend(v5, "hash"));

  v7 = 33 * (v6 + -[MUIManualSummaryContext summarizableMessageCount](self, "summarizableMessageCount"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MUIManualSummaryContext isInlineSummary](self, "isInlineSummary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 + objc_msgSend(v8, "hash") + 1185921;

  return v9;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSAttributedString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (unint64_t)summarizableMessageCount
{
  return self->_summarizableMessageCount;
}

- (void)setSummarizableMessageCount:(unint64_t)a3
{
  self->_summarizableMessageCount = a3;
}

- (BOOL)isInlineSummary
{
  return self->_isInlineSummary;
}

- (void)setIsInlineSummary:(BOOL)a3
{
  self->_isInlineSummary = a3;
}

- (EFFuture)summaryControllerFuture
{
  return self->_summaryControllerFuture;
}

- (void)setSummaryControllerFuture:(id)a3
{
  objc_storeStrong((id *)&self->_summaryControllerFuture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryControllerFuture, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_summary, 0);
}

@end
