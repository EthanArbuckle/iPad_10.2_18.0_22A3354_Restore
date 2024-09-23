@implementation NSError

- (id)dy_errorSignature
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%llu)"), -[NSError domain](self, "domain"), -[NSError code](self, "code"));
}

@end
