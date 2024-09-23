@implementation NSStackObservedValue

- (unint64_t)retainCount
{
  return -1;
}

- (void)setFinished:(BOOL)a3
{
  self->super._tag = 3;
  self->super._contents = (id)*MEMORY[0x1E0C9AE50];
}

- (void)setValue:(id)a3
{
  self->super._tag = 1;
  self->super._contents = a3;
}

- (void)setError:(id)a3
{
  self->super._tag = 2;
  self->super._contents = a3;
}

@end
