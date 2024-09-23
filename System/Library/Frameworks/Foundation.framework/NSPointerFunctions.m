@implementation NSPointerFunctions

+ (NSPointerFunctions)pointerFunctionsWithOptions:(NSPointerFunctionsOptions)options
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_self();
  return (NSPointerFunctions *)(id)objc_msgSend(NSAllocateObject(v4, 0, 0), "initWithOptions:", options);
}

+ (NSPointerFunctions)allocWithZone:(_NSZone *)a3
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_self();
  return (NSPointerFunctions *)NSAllocateObject(v3, 0, 0);
}

- (NSPointerFunctions)initWithOptions:(NSPointerFunctionsOptions)options
{
  raiseError_1((uint64_t)self, a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  raiseError_1((uint64_t)self, a2);
}

- (void)setSizeFunction:(NSUInteger (__cdecl *)sizeFunction
{
  raiseError_1((uint64_t)self, a2);
}

- (void)setHashFunction:(NSUInteger (__cdecl *)hashFunction
{
  raiseError_1((uint64_t)self, a2);
}

- (void)setIsEqualFunction:(BOOL (__cdecl *)isEqualFunction
{
  raiseError_1((uint64_t)self, a2);
}

- (void)setDescriptionFunction:(NSString *(__cdecl *)descriptionFunction
{
  raiseError_1((uint64_t)self, a2);
}

- (void)setAcquireFunction:(void *(__cdecl *)acquireFunction
{
  raiseError_1((uint64_t)self, a2);
}

- (void)setRelinquishFunction:(void (__cdecl *)relinquishFunction
{
  raiseError_1((uint64_t)self, a2);
}

- (void)setUsesStrongWriteBarrier:(BOOL)usesStrongWriteBarrier
{
  raiseError_1((uint64_t)self, a2);
}

- (void)setUsesWeakReadAndWriteBarriers:(BOOL)usesWeakReadAndWriteBarriers
{
  raiseError_1((uint64_t)self, a2);
}

- (NSUInteger)sizeFunction
{
  raiseError_1((uint64_t)self, a2);
}

- (NSUInteger)hashFunction
{
  raiseError_1((uint64_t)self, a2);
}

- (BOOL)isEqualFunction
{
  raiseError_1((uint64_t)self, a2);
}

- (NSString)descriptionFunction
{
  raiseError_1((uint64_t)self, a2);
}

- (void)acquireFunction
{
  raiseError_1((uint64_t)self, a2);
}

- (void)relinquishFunction
{
  raiseError_1((uint64_t)self, a2);
}

- (BOOL)usesStrongWriteBarrier
{
  raiseError_1((uint64_t)self, a2);
}

- (BOOL)usesWeakReadAndWriteBarriers
{
  raiseError_1((uint64_t)self, a2);
}

@end
