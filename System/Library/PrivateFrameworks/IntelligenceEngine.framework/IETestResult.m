@implementation IETestResult

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[IETestResult status](self, "status");
      if (v6 != objc_msgSend(v5, "status"))
      {
        v8 = 0;
LABEL_20:

        goto LABEL_21;
      }
      -[IETestResult flowId](self, "flowId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "flowId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20 != v7)
      {
        -[IETestResult flowId](self, "flowId");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "flowId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v19, "isEqualToString:"))
        {
          v8 = 0;
          goto LABEL_18;
        }
      }
      -[IETestResult testName](self, "testName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "testName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 == v10
        || (-[IETestResult testName](self, "testName"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v5, "testName"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v18, "isEqualToString:")))
      {
        -[IETestResult summary](self, "summary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "summary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 == v12)
        {

          v8 = 1;
        }
        else
        {
          -[IETestResult summary](self, "summary");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "summary");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v13, "isEqualToString:", v14);

        }
        if (v9 == v10)
        {
LABEL_17:

          if (v20 == v7)
          {
LABEL_19:

            goto LABEL_20;
          }
LABEL_18:

          goto LABEL_19;
        }
      }
      else
      {
        v8 = 0;
      }

      goto LABEL_17;
    }
  }
  v8 = 0;
LABEL_21:

  return v8;
}

- (unint64_t)hash
{
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3 = -[IETestResult status](self, "status");
  -[IETestResult flowId](self, "flowId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[IETestResult testName](self, "testName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");

  -[IETestResult summary](self, "summary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  v10 = v5 - v3 + 32 * v3;
  v11 = v9 - (v7 - v10 + 32 * v10) + 32 * (v7 - v10 + 32 * v10) + 923521;

  return v11;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (NSString)flowId
{
  return self->_flowId;
}

- (void)setFlowId:(id)a3
{
  objc_storeStrong((id *)&self->_flowId, a3);
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
  objc_storeStrong((id *)&self->_testName, a3);
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_storeStrong((id *)&self->_summary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_testName, 0);
  objc_storeStrong((id *)&self->_flowId, 0);
}

@end
