@implementation HMMutableReportContext

- (id)copyWithZone:(_NSZone *)a3
{
  HMReportContext *v4;
  void *v5;
  void *v6;
  HMReportContext *v7;

  v4 = +[HMReportContext allocWithZone:](HMReportContext, "allocWithZone:", a3);
  -[HMReportContext reportDomain](self, "reportDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMReportContext requestInfo](self, "requestInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMReportContext reportTimeout](self, "reportTimeout");
  v7 = -[HMReportContext initWithReportDomain:requestInfo:timeout:](v4, "initWithReportDomain:requestInfo:timeout:", v5, v6);

  return v7;
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

+ (id)reportContextWithDomain:(id)a3 requestInfo:(id)a4 timeout:(double)a5
{
  id v7;
  id v8;
  HMMutableReportContext *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[HMReportContext initWithReportDomain:requestInfo:timeout:]([HMMutableReportContext alloc], "initWithReportDomain:requestInfo:timeout:", v8, v7, a5);

  return v9;
}

+ (id)reportContextWithDomain:(id)a3 requestInfo:(id)a4
{
  return +[HMMutableReportContext reportContextWithDomain:requestInfo:timeout:](HMMutableReportContext, "reportContextWithDomain:requestInfo:timeout:", a3, a4, 0.0);
}

@end
