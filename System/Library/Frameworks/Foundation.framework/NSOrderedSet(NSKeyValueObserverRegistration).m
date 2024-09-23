@implementation NSOrderedSet(NSKeyValueObserverRegistration)

- (void)addObserver:()NSKeyValueObserverRegistration forKeyPath:options:context:
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[<%@ %p> addObserver:forKeyPath:options:context:] is not supported. Key path: %@"), objc_opt_class(), a1, a4), 0);
  objc_exception_throw(v4);
}

- (void)removeObserver:()NSKeyValueObserverRegistration forKeyPath:context:
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[<%@ %p> removeObserver:forKeyPath:context:] is not supported. Key path: %@"), objc_opt_class(), a1, a4), 0);
  objc_exception_throw(v4);
}

- (void)removeObserver:()NSKeyValueObserverRegistration forKeyPath:
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[<%@ %p> removeObserver:forKeyPath:] is not supported. Key path: %@"), objc_opt_class(), a1, a4), 0);
  objc_exception_throw(v4);
}

@end
