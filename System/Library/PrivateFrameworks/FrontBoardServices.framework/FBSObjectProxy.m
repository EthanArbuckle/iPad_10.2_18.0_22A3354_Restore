@implementation FBSObjectProxy

+ (FBSObjectProxy)proxyForClass:(uint64_t)a1
{
  FBSObjectProxy *v3;

  objc_opt_self();
  v3 = [FBSObjectProxy alloc];
  v3->_class = a2;
  return v3;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return 0;
}

- (void)forwardInvocation:(id)a3
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[FBSObjectProxy forwardInvocation:].cold.1(a3, (uint64_t)self);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)-[objc_class instanceMethodSignatureForSelector:](self->_class, "instanceMethodSignatureForSelector:", a3);
}

- (unint64_t)count
{
  return 1;
}

- (unint64_t)length
{
  return 1;
}

- (id)bs_secureEncoded
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return +[FBSObjectProxy proxyForClass:]((uint64_t)FBSObjectProxy, v2);
}

- (id)objectForKey:(id)a3
{
  return 0;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return -[objc_class instancesRespondToSelector:](self->_class, "instancesRespondToSelector:", a3);
}

- (BOOL)isEqual:(id)a3
{
  return objc_opt_isKindOfClass() & 1;
}

- (unint64_t)hash
{
  return -[objc_class hash](self->_class, "hash");
}

- (Class)superclass
{
  return (Class)-[objc_class superclass](self->_class, "superclass");
}

- (Class)class
{
  return self->_class;
}

- (BOOL)isKindOfClass:(Class)a3
{
  return -[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", self->_class);
}

- (BOOL)isMemberOfClass:(Class)a3
{
  return -[objc_class isMemberOfClass:](a3, "isMemberOfClass:", self->_class);
}

- (BOOL)conformsToProtocol:(id)a3
{
  return 1;
}

- (BOOL)isProxy
{
  return 1;
}

- (void)forwardInvocation:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector((SEL)objc_msgSend(a1, "selector"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(*(Class *)(a2 + 8));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_debug_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "ignoring %@ called on %@", (uint8_t *)&v5, 0x16u);

}

@end
