@implementation HMReportContext

- (HMReportContext)initWithReportDomain:(id)a3 requestInfo:(id)a4 timeout:(double)a5
{
  id v8;
  id v9;
  void *v10;
  HMReportContext *v11;
  uint64_t v12;
  NSString *reportDomain;
  uint64_t v14;
  NSData *requestInfo;
  HMReportContext *v17;
  SEL v18;
  _NSZone *v19;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v10 = v9;
  if (!v9)
  {
LABEL_7:
    v17 = (HMReportContext *)_HMFPreconditionFailure();
    return (HMReportContext *)-[HMReportContext copyWithZone:](v17, v18, v19);
  }
  v20.receiver = self;
  v20.super_class = (Class)HMReportContext;
  v11 = -[HMReportContext init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    reportDomain = v11->_reportDomain;
    v11->_reportDomain = (NSString *)v12;

    v14 = objc_msgSend(v10, "copy");
    requestInfo = v11->_requestInfo;
    v11->_requestInfo = (NSData *)v14;

    v11->_reportTimeout = a5;
  }

  return v11;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableReportContext *v4;
  void *v5;
  void *v6;
  HMMutableReportContext *v7;

  v4 = +[HMMutableReportContext allocWithZone:](HMMutableReportContext, "allocWithZone:", a3);
  -[HMReportContext reportDomain](self, "reportDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMReportContext requestInfo](self, "requestInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMReportContext reportTimeout](self, "reportTimeout");
  v7 = -[HMReportContext initWithReportDomain:requestInfo:timeout:](v4, "initWithReportDomain:requestInfo:timeout:", v5, v6);

  return v7;
}

- (NSString)reportDomain
{
  return self->_reportDomain;
}

- (NSData)requestInfo
{
  return self->_requestInfo;
}

- (double)reportTimeout
{
  return self->_reportTimeout;
}

- (void)setReportTimeout:(double)a3
{
  self->_reportTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestInfo, 0);
  objc_storeStrong((id *)&self->_reportDomain, 0);
}

+ (id)reportContextWithDomain:(id)a3 requestInfo:(id)a4 timeout:(double)a5
{
  id v7;
  id v8;
  HMReportContext *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[HMReportContext initWithReportDomain:requestInfo:timeout:]([HMReportContext alloc], "initWithReportDomain:requestInfo:timeout:", v8, v7, a5);

  return v9;
}

@end
