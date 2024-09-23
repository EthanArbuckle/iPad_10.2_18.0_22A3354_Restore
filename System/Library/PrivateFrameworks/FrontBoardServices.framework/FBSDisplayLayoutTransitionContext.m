@implementation FBSDisplayLayoutTransitionContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionReasons, 0);
}

- (FBSDisplayLayoutTransitionContext)initWithXPCDictionary:(id)a3
{
  id v4;
  FBSDisplayLayoutTransitionContext *v5;
  void *v6;
  uint64_t v7;
  NSOrderedSet *transitionReasons;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FBSDisplayLayoutTransitionContext;
  v5 = -[FBSDisplayLayoutTransitionContext init](&v10, sel_init);
  if (v5)
  {
    v6 = (void *)BSCreateDeserializedArrayFromXPCDictionaryWithKey();
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      transitionReasons = v5->_transitionReasons;
      v5->_transitionReasons = (NSOrderedSet *)v7;
    }
    else
    {
      transitionReasons = v5->_transitionReasons;
      v5->_transitionReasons = 0;
    }

  }
  return v5;
}

id __59__FBSDisplayLayoutTransitionContext_initWithXPCDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  v3 = v2;
  if (v2 && object_getClass(v2) == (Class)MEMORY[0x1E0C81390])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_string_get_string_ptr(v3));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setTransitionReasons:(id)a3
{
  NSOrderedSet *v4;
  NSOrderedSet *transitionReasons;

  v4 = (NSOrderedSet *)objc_msgSend(a3, "copy");
  transitionReasons = self->_transitionReasons;
  self->_transitionReasons = v4;

}

- (NSString)transitionReason
{
  return (NSString *)-[NSOrderedSet lastObject](self->_transitionReasons, "lastObject");
}

- (NSSet)transitionReasons
{
  return -[NSOrderedSet set](self->_transitionReasons, "set");
}

xpc_object_t __61__FBSDisplayLayoutTransitionContext_encodeWithXPCDictionary___block_invoke(int a1, id a2)
{
  return xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(a2), "UTF8String"));
}

- (void)encodeWithXPCDictionary:(id)a3
{
  NSOrderedSet *transitionReasons;
  id v4;
  id v5;

  transitionReasons = self->_transitionReasons;
  v4 = a3;
  -[NSOrderedSet array](transitionReasons, "array");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  BSSerializeArrayToXPCDictionaryWithKey();

}

- (NSString)description
{
  return (NSString *)-[FBSDisplayLayoutTransitionContext descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSDisplayLayoutTransitionContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSDisplayLayoutTransitionContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[FBSDisplayLayoutTransitionContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOrderedSet array](self->_transitionReasons, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v6, CFSTR("reasons"), 1);

  return v4;
}

@end
