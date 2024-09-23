@implementation NSBlockInvocation

- (void)invoke
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = self;
  v2.super_class = (Class)NSBlockInvocation;
  -[NSInvocation invoke](&v2, sel_invoke);
}

- (SEL)selector
{
  SEL result;

  result = (SEL)-[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __break(1u);
  return result;
}

- (void)setSelector:(SEL)a3
{
  -[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)invokeUsingIMP:(void *)a3
{
  -[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)invokeSuper
{
  -[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

@end
