@implementation NSNull(EFSQLExpressable)

- (uint64_t)ef_renderSQLExpressionInto:()EFSQLExpressable
{
  return objc_msgSend(a3, "appendString:", CFSTR("NULL"));
}

- (const)ef_SQLExpression
{
  return CFSTR("NULL");
}

@end
