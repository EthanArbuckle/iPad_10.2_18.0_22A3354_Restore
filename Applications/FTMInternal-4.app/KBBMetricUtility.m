@implementation KBBMetricUtility

+ (BOOL)isValidMetricIdTag:(id)a3 forClass:(Class)a4
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = qword_1002B8258[0];
  v5 = a3;
  if (v4 != -1)
    dispatch_once(qword_1002B8258, &stru_10025FE88);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1002B8250, "objectForKey:", v5));

  return v6 != 0;
}

@end
