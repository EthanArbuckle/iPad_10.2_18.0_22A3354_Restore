@implementation __NSPlaceholderURLComponents

- (__NSPlaceholderURLComponents)init
{
  return (__NSPlaceholderURLComponents *)+[NSURLComponents _components](NSURLComponents, "_components");
}

- (__NSPlaceholderURLComponents)initWithURL:(id)a3 resolvingAgainstBaseURL:(BOOL)a4
{
  void *v5;

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil URL parameter"), _NSMethodExceptionProem((objc_class *)-[__NSPlaceholderURLComponents superclass](self, "superclass", 0, a4), a2)), 0);
    objc_exception_throw(v5);
  }
  return (__NSPlaceholderURLComponents *)+[NSURLComponents _componentsWithUrl:resolvingAgainstBaseURL:](NSURLComponents, "_componentsWithUrl:resolvingAgainstBaseURL:", a3, a4);
}

- (__NSPlaceholderURLComponents)initWithString:(id)a3
{
  void *v4;

  if (!a3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil URLString parameter"), _NSMethodExceptionProem((objc_class *)-[__NSPlaceholderURLComponents superclass](self, "superclass"), a2)), 0);
    objc_exception_throw(v4);
  }
  return -[__NSPlaceholderURLComponents initWithString:encodingInvalidCharacters:](self, "initWithString:encodingInvalidCharacters:", a3, 1);
}

- (__NSPlaceholderURLComponents)initWithString:(id)a3 encodingInvalidCharacters:(BOOL)a4
{
  void *v5;

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil URLString parameter"), _NSMethodExceptionProem((objc_class *)-[__NSPlaceholderURLComponents superclass](self, "superclass", 0, a4), a2)), 0);
    objc_exception_throw(v5);
  }
  return (__NSPlaceholderURLComponents *)+[NSURLComponents _componentsWithString:encodingInvalidCharacters:](NSURLComponents, "_componentsWithString:encodingInvalidCharacters:", a3, a4);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end
