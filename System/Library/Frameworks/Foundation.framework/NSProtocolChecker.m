@implementation NSProtocolChecker

- (id)methodSignatureForSelector:(SEL)a3
{
  id result;

  result = -[NSProtocolChecker methodDescriptionForSelector:](self, "methodDescriptionForSelector:", a3);
  if (result)
    return (id)objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", *((_QWORD *)result + 1));
  return result;
}

- (objc_method_description)methodDescriptionForSelector:(SEL)a3
{
  SEL name;
  char *types;
  objc_method_description MethodDescription;
  const char *v8;
  char *v9;
  objc_method_description *result;
  objc_method_description v11;

  MethodDescription = protocol_getMethodDescription(-[NSProtocolChecker protocol](self, "protocol"), a3, 1, 1);
  types = MethodDescription.types;
  name = MethodDescription.name;
  if (MethodDescription.name
    || (-[NSProtocolChecker target](self, "target"), (objc_opt_respondsToSelector() & 1) != 0)
    && (v11 = protocol_getMethodDescription(-[NSProtocolChecker protocol](self, "protocol"), a3, 0, 1),
        types = v11.types,
        (name = v11.name) != 0))
  {
    v8 = name;
    v9 = types;
    result = (objc_method_description *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 16), "mutableBytes");
    result->name = v8;
    result->types = v9;
  }
  else if (sel_respondsToSelector_ == a3 || sel__conformsToProtocolNamed_ == a3 || sel_conformsToProtocol_ == a3)
  {
    return (objc_method_description *)objc_msgSend(MEMORY[0x1E0DE7910], "instanceMethodDescriptionForSelector:", a3);
  }
  else
  {
    return 0;
  }
  return result;
}

+ (NSProtocolChecker)allocWithZone:(_NSZone *)a3
{
  objc_class *v4;

  v4 = (objc_class *)a1;
  if ((id)objc_opt_self() == a1)
    v4 = (objc_class *)objc_opt_self();
  return (NSProtocolChecker *)NSAllocateObject(v4, 0, a3);
}

- (Protocol)protocol
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSProtocolChecker"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSObject)target
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSProtocolChecker"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)doesNotRecognizeSelector:(SEL)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** NSProtocolChecker: target protocol does not recognize selector: %s"), sel_getName(a3)), 0);
  objc_exception_throw(v3);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  BOOL v5;

  v5 = 1;
  if (!(unint64_t)protocol_getMethodDescription(-[NSProtocolChecker protocol](self, "protocol"), a3, 1, 1).name)
  {
    if (!(unint64_t)protocol_getMethodDescription(-[NSProtocolChecker protocol](self, "protocol"), a3, 0, 1).name)
      return 0;
    -[NSProtocolChecker target](self, "target");
    if ((objc_opt_respondsToSelector() & 1) == 0)
      return 0;
  }
  return v5;
}

- (BOOL)conformsToProtocol:(id)a3
{
  return protocol_conformsToProtocol(-[NSProtocolChecker protocol](self, "protocol"), (Protocol *)a3);
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if ((unint64_t)protocol_getMethodDescription(-[NSProtocolChecker protocol](self, "protocol"), a3, 1, 1).name)
    return -[NSProtocolChecker target](self, "target");
  if ((unint64_t)protocol_getMethodDescription(-[NSProtocolChecker protocol](self, "protocol"), a3, 0, 1).name
    && (-[NSProtocolChecker target](self, "target"), (objc_opt_respondsToSelector() & 1) != 0))
  {
    return -[NSProtocolChecker target](self, "target");
  }
  else
  {
    return 0;
  }
}

- (const)_localClassNameForClass
{
  return (const char *)-[NSObject _localClassNameForClass](-[NSProtocolChecker target](self, "target"), "_localClassNameForClass");
}

- (void)forwardInvocation:(id)a3
{
  char *v5;
  char *v8;

  v5 = (char *)objc_msgSend(a3, "selector");
  if (v5 != sel_respondsToSelector_ && v5 != sel__conformsToProtocolNamed_ && v5 != sel_conformsToProtocol_)
  {
    v8 = v5;
    if (!-[NSProtocolChecker methodDescriptionForSelector:](self, "methodDescriptionForSelector:", v5))
      -[NSProtocolChecker doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", v8);
    self = -[NSProtocolChecker target](self, "target");
  }
  objc_msgSend(a3, "invokeWithTarget:", self);
}

+ (NSProtocolChecker)protocolCheckerWithTarget:(NSObject *)anObject protocol:(Protocol *)aProtocol
{
  return (NSProtocolChecker *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithTarget:protocol:", anObject, aProtocol);
}

- (NSProtocolChecker)initWithTarget:(NSObject *)anObject protocol:(Protocol *)aProtocol
{
  _NSRequestConcreteObject((int)self, a2);
}

@end
