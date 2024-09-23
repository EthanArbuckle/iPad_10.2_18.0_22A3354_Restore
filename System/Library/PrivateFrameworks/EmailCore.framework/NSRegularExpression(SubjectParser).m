@implementation NSRegularExpression(SubjectParser)

+ (id)ec_regularExpressionForList
{
  if (ec_regularExpressionForList_predicate != -1)
    dispatch_once(&ec_regularExpressionForList_predicate, &__block_literal_global_8);
  return (id)ec_regularExpressionForList_listRegex;
}

@end
