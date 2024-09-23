@implementation CPMemoryOwner

- (CPMemoryOwner)initWithAllocatedMemory:(void *)a3
{
  CPMemoryOwner *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPMemoryOwner;
  result = -[CPMemoryOwner init](&v5, sel_init);
  if (result)
    result->memory = a3;
  return result;
}

- (void)dispose
{
  free(self->memory);
  self->memory = 0;
}

- (void)finalize
{
  objc_super v3;

  -[CPMemoryOwner dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)CPMemoryOwner;
  -[CPMemoryOwner finalize](&v3, sel_finalize);
}

- (void)dealloc
{
  objc_super v3;

  -[CPMemoryOwner dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)CPMemoryOwner;
  -[CPMemoryOwner dealloc](&v3, sel_dealloc);
}

@end
