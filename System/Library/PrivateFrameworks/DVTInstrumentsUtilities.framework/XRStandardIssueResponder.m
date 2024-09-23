@implementation XRStandardIssueResponder

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_opt_new();
    v3 = (void *)qword_25583C6A8;
    qword_25583C6A8 = v2;

  }
}

+ (id)defaultResponder
{
  return (id)qword_25583C6A8;
}

+ (void)setDefaultResponder:(id)a3
{
  objc_storeStrong((id *)&qword_25583C6A8, a3);
}

- (void)handleIssue:(id)a3 type:(signed __int16)a4 from:(id)a5
{
  unsigned int v6;
  id v8;
  XRStandardIssueResponder *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  v8 = a5;
  v9 = self;
  objc_sync_enter(v9);
  if (v6 >= 4)
    __assert_rtn("-[XRStandardIssueResponder handleIssue:type:from:]", "XRStandardIssueResponder.m", 45, "0");
  NSLog(&off_24EDC2EA0[v6]->isa, v10, v8);
  objc_sync_exit(v9);

}

@end
