@implementation _NSURLComponentsBridge

- (void)setScheme:(id)a3
{
  void *v5;

  if (!-[_NSURLComponentsBridge _setScheme:](self, "_setScheme:", a3))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: invalid characters in scheme"), _NSMethodExceptionProem((objc_class *)-[_NSURLComponentsBridge superclass](self, "superclass"), a2)), 0);
    objc_exception_throw(v5);
  }
}

- (BOOL)_setScheme:(id)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setPercentEncodedUser:(id)a3
{
  void *v5;

  if (!-[_NSURLComponentsBridge _setPercentEncodedUser:](self, "_setPercentEncodedUser:", a3))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: invalid characters in percentEncodedUser"), _NSMethodExceptionProem((objc_class *)-[_NSURLComponentsBridge superclass](self, "superclass"), a2)), 0);
    objc_exception_throw(v5);
  }
}

- (BOOL)_setPercentEncodedUser:(id)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setPercentEncodedPassword:(id)a3
{
  void *v5;

  if (!-[_NSURLComponentsBridge _setPercentEncodedPassword:](self, "_setPercentEncodedPassword:", a3))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: invalid characters in percentEncodedPassword"), _NSMethodExceptionProem((objc_class *)-[_NSURLComponentsBridge superclass](self, "superclass"), a2)), 0);
    objc_exception_throw(v5);
  }
}

- (BOOL)_setPercentEncodedPassword:(id)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setPercentEncodedHost:(id)a3
{
  void *v5;

  if (!-[_NSURLComponentsBridge _setPercentEncodedHost:](self, "_setPercentEncodedHost:", a3))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: invalid characters in percentEncodedHost"), _NSMethodExceptionProem((objc_class *)-[_NSURLComponentsBridge superclass](self, "superclass"), a2)), 0);
    objc_exception_throw(v5);
  }
}

- (BOOL)_setPercentEncodedHost:(id)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setEncodedHost:(id)a3
{
  void *v5;

  if (!-[_NSURLComponentsBridge _setEncodedHost:](self, "_setEncodedHost:", a3))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: invalid characters in encodedHost"), _NSMethodExceptionProem((objc_class *)-[_NSURLComponentsBridge superclass](self, "superclass"), a2)), 0);
    objc_exception_throw(v5);
  }
}

- (BOOL)_setEncodedHost:(id)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setPort:(id)a3
{
  void *v5;

  if (!-[_NSURLComponentsBridge _setPort:](self, "_setPort:", a3))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: negative port number"), _NSMethodExceptionProem((objc_class *)-[_NSURLComponentsBridge superclass](self, "superclass"), a2)), 0);
    objc_exception_throw(v5);
  }
}

- (BOOL)_setPort:(id)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setPercentEncodedPath:(id)a3
{
  void *v5;

  if (!-[_NSURLComponentsBridge _setPercentEncodedPath:](self, "_setPercentEncodedPath:", a3))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: invalid characters in percentEncodedPath"), _NSMethodExceptionProem((objc_class *)-[_NSURLComponentsBridge superclass](self, "superclass"), a2)), 0);
    objc_exception_throw(v5);
  }
}

- (BOOL)_setPercentEncodedPath:(id)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setPercentEncodedQuery:(id)a3
{
  void *v5;

  if (!-[_NSURLComponentsBridge _setPercentEncodedQuery:](self, "_setPercentEncodedQuery:", a3))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: invalid characters in percentEncodedQuery"), _NSMethodExceptionProem((objc_class *)-[_NSURLComponentsBridge superclass](self, "superclass"), a2)), 0);
    objc_exception_throw(v5);
  }
}

- (BOOL)_setPercentEncodedQuery:(id)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setPercentEncodedQueryItems:(id)a3
{
  void *v5;

  if (!-[_NSURLComponentsBridge _setPercentEncodedQueryItems:](self, "_setPercentEncodedQueryItems:", a3))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: invalid characters in percentEncodedQueryItems"), _NSMethodExceptionProem((objc_class *)-[_NSURLComponentsBridge superclass](self, "superclass"), a2)), 0);
    objc_exception_throw(v5);
  }
}

- (BOOL)_setPercentEncodedQueryItems:(id)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setPercentEncodedFragment:(id)a3
{
  void *v5;

  if (!-[_NSURLComponentsBridge _setPercentEncodedFragment:](self, "_setPercentEncodedFragment:", a3))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: invalid characters in percentEncodedFragment"), _NSMethodExceptionProem((objc_class *)-[_NSURLComponentsBridge superclass](self, "superclass"), a2)), 0);
    objc_exception_throw(v5);
  }
}

- (BOOL)_setPercentEncodedFragment:(id)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)_scheme
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSString)_percentEncodedUser
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSString)_percentEncodedPassword
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSString)_percentEncodedHost
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSString)_encodedHost
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSNumber)_port
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSString)_percentEncodedPath
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSString)_percentEncodedQuery
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSArray)_percentEncodedQueryItems
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSString)_percentEncodedFragment
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

@end
