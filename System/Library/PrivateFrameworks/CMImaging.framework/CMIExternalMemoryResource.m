@implementation CMIExternalMemoryResource

- (FigMetalAllocatorBackend)allocatorBackend
{
  return self->_allocatorBackend;
}

- (void)setAllocatorBackend:(id)a3
{
  objc_storeStrong((id *)&self->_allocatorBackend, a3);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p>: AllocatorBackend:%@"), objc_opt_class(), self, self->_allocatorBackend);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allocatorBackend, 0);
}

@end
