@implementation DNDMutableApplicationConfiguration

- (void)setMinimumBreakthroughUrgency:(unint64_t)a3
{
  self->super._minimumBreakthroughUrgency = a3;
}

- (void)setAllowedThreads:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *allowedThreads;

  v4 = (NSMutableSet *)objc_msgSend(a3, "mutableCopy");
  allowedThreads = self->super._allowedThreads;
  self->super._allowedThreads = v4;

}

- (void)setDeniedThreads:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *deniedThreads;

  v4 = (NSMutableSet *)objc_msgSend(a3, "mutableCopy");
  deniedThreads = self->super._deniedThreads;
  self->super._deniedThreads = v4;

}

@end
