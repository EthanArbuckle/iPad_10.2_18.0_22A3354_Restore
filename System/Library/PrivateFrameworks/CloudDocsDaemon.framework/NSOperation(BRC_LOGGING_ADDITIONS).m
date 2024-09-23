@implementation NSOperation(BRC_LOGGING_ADDITIONS)

- (id)lightweightDescription
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = a1;
    objc_msgSend(v3, "operationID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendFormat:", CFSTR(" %@"), v4);

    objc_msgSend(v3, "lastErrorDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = a1;
    objc_msgSend(v6, "operationID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendFormat:", CFSTR(" %@"), v7);

    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@:%ld"), v9, objc_msgSend(v10, "code"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  v5 = 0;
LABEL_7:
  if ((objc_msgSend(a1, "isFinished") & 1) != 0)
  {
    v11 = "finished";
    if (!v5)
      goto LABEL_21;
    goto LABEL_20;
  }
  if ((objc_msgSend(a1, "isCancelled") & 1) != 0)
  {
    v11 = "cancelled";
    if (!v5)
      goto LABEL_21;
    goto LABEL_20;
  }
  if ((objc_msgSend(a1, "isExecuting") & 1) != 0)
  {
    v11 = "executing";
    if (!v5)
      goto LABEL_21;
    goto LABEL_20;
  }
  if (objc_msgSend(a1, "isReady"))
    v11 = "ready";
  else
    v11 = "waiting";
  if (v5)
LABEL_20:
    objc_msgSend(v2, "appendFormat:", CFSTR(" last-error: %@"), v5);
LABEL_21:
  objc_msgSend(v2, "appendFormat:", CFSTR(" %s>"), v11);

  return v2;
}

@end
