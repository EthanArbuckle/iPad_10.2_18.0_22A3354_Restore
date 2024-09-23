@implementation FBMutableProcessExecutionContext

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FBProcessExecutionContext _initWithExecutionContext:](+[FBProcessExecutionContext allocWithZone:](FBProcessExecutionContext, "allocWithZone:", a3), "_initWithExecutionContext:", self);
}

@end
