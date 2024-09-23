@implementation NLNumberGenerator

- (NLNumberGenerator)init
{
  NLNumberGenerator *v2;
  NLNumberGenerator *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NLNumberGenerator;
  v2 = -[NLNumberGenerator init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[NLNumberGenerator reset](v2, "reset");
  return v3;
}

- (void)reset
{
  -[NLNumberGenerator resetWithSeed:](self, "resetWithSeed:", 2654435769);
}

- (void)resetWithSeed:(unint64_t)a3
{
  self->state[0] = a3;
  self->state[1] = a3;
}

- (unint64_t)numberInRange:(_NSRange)a3
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  NSUInteger v6;

  v3 = self->state[1];
  v4 = self->state[0] ^ (self->state[0] << 23);
  v5 = (v3 >> 26) ^ (v4 >> 17) ^ v3 ^ v4;
  self->state[0] = v3;
  self->state[1] = v5;
  if (a3.length < 2)
    v6 = 0;
  else
    v6 = (v5 + v3) % a3.length;
  return v6 + a3.location;
}

@end
