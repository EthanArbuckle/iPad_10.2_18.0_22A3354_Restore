@implementation NSDate(EFSQLExpressable)

- (void)ef_renderSQLExpressionInto:()EFSQLExpressable
{
  double v4;
  id v5;

  v5 = a3;
  objc_msgSend(a1, "timeIntervalSince1970");
  objc_msgSend(v5, "appendFormat:", CFSTR("%lld"), vcvtmd_s64_f64(v4));

}

- (id)ef_SQLExpression
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(a1, "ef_renderSQLExpressionInto:", v2);
  return v2;
}

@end
