@implementation CADisplayFlipBook

- (CADisplayFlipBook)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CADisplayFlipBook"), CFSTR("Invalid initializer."));

  return 0;
}

- (void)dealloc
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = self;
  v2.super_class = (Class)CADisplayFlipBook;
  -[CADisplayFlipBook dealloc](&v2, sel_dealloc);
}

- (BOOL)renderForTime:(double)a3 options:(id)a4 error:(id *)a5
{
  return 0;
}

- (double)cancelAtTime:(double)a3
{
  return 0.0;
}

- (CAContext)context
{
  return 0;
}

- (unint64_t)capacity
{
  return 0;
}

- (id)description
{
  return 0;
}

+ (id)new
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CADisplayFlipBook"), CFSTR("Invalid initializer."));
  return 0;
}

@end
