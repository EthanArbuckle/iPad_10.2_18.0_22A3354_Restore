@implementation NSPointerArray

- (NSArray)allObjects
{
  NSArray *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[NSPointerArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(self);
        if (*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7))
          -[NSArray addObject:](v3, "addObject:");
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v5);
  }
  return v3;
}

+ (NSPointerArray)pointerArrayWithOptions:(NSPointerFunctionsOptions)options
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_self();
  return (NSPointerArray *)(id)objc_msgSend(NSAllocateObject(v4, 0, 0), "initWithOptions:", options);
}

+ (NSPointerArray)weakObjectsPointerArray
{
  return (NSPointerArray *)-[NSConcretePointerArray initWithOptions:]([NSConcretePointerArray alloc], "initWithOptions:", 5);
}

+ (NSPointerArray)allocWithZone:(_NSZone *)a3
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_self();
  return (NSPointerArray *)NSAllocateObject(v3, 0, 0);
}

+ (NSPointerArray)strongObjectsPointerArray
{
  return (NSPointerArray *)objc_alloc_init(NSConcretePointerArray);
}

- (NSPointerArray)init
{
  raiseError_1((uint64_t)self, a2);
}

- (NSPointerArray)initWithOptions:(NSPointerFunctionsOptions)options
{
  raiseError_1((uint64_t)self, a2);
}

- (NSPointerArray)initWithPointerFunctions:(NSPointerFunctions *)functions
{
  raiseError_1((uint64_t)self, a2);
}

+ (NSPointerArray)pointerArrayWithPointerFunctions:(NSPointerFunctions *)functions
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_self();
  return (NSPointerArray *)(id)objc_msgSend(NSAllocateObject(v4, 0, 0), "initWithPointerFunctions:", functions);
}

- (NSPointerArray)initWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)NSPointerArray;
  -[NSPointerArray dealloc](&v5, sel_dealloc);
  return (NSPointerArray *)-[NSConcretePointerArray initWithCoder:]([NSConcretePointerArray alloc], "initWithCoder:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

- (NSPointerFunctions)pointerFunctions
{
  raiseError_1((uint64_t)self, a2);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  raiseError_1((uint64_t)self, a2);
}

- (void)pointerAtIndex:(NSUInteger)index
{
  raiseError_1((uint64_t)self, a2);
}

- (void)addPointer:(void *)pointer
{
  raiseError_1((uint64_t)self, a2);
}

- (void)removePointerAtIndex:(NSUInteger)index
{
  raiseError_1((uint64_t)self, a2);
}

- (void)insertPointer:(void *)item atIndex:(NSUInteger)index
{
  raiseError_1((uint64_t)self, a2);
}

- (void)replacePointerAtIndex:(NSUInteger)index withPointer:(void *)item
{
  raiseError_1((uint64_t)self, a2);
}

- (void)compact
{
  raiseError_1((uint64_t)self, a2);
}

- (NSUInteger)count
{
  raiseError_1((uint64_t)self, a2);
}

- (void)setCount:(NSUInteger)count
{
  raiseError_1((uint64_t)self, a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  raiseError_1((uint64_t)self, a2);
}

- (void)encodeWithCoder:(id)a3
{
  raiseError_1((uint64_t)self, a2);
}

+ (id)pointerArrayWithStrongObjects
{
  return objc_alloc_init(NSConcretePointerArray);
}

+ (id)pointerArrayWithWeakObjects
{
  return -[NSConcretePointerArray initWithOptions:]([NSConcretePointerArray alloc], "initWithOptions:", 1);
}

- (id)mutableArray
{
  raiseError_1((uint64_t)self, a2);
}

@end
