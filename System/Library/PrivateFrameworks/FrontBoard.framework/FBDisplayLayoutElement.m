@implementation FBDisplayLayoutElement

- (FBDisplayLayoutElement)init
{
  return -[FBDisplayLayoutElement initWithDisplayType:identifier:elementClass:](self, "initWithDisplayType:identifier:elementClass:", 7, 0, 0);
}

- (FBDisplayLayoutElement)initWithDisplayType:(int64_t)a3 identifier:(id)a4 elementClass:(Class)a5
{
  id v9;
  void *v10;
  FBDisplayLayoutElement *v11;
  FBDisplayLayoutElement *v12;
  FBMainDisplayLayoutPublisher *publisher;
  uint64_t v14;
  uint64_t v15;
  NSString *identifier;
  uint64_t v17;
  NSString *key;
  uint64_t v19;
  FBSDisplayLayoutElement *element;
  FBDisplayLayoutElement *result;
  void *v22;
  objc_super v23;

  v9 = a4;
  if (v9)
  {
    v10 = v9;
    v23.receiver = self;
    v23.super_class = (Class)FBDisplayLayoutElement;
    v11 = -[FBDisplayLayoutElement init](&v23, sel_init);
    v12 = v11;
    if (v11)
    {
      if (a3)
      {
        publisher = v11->_publisher;
        v11->_publisher = 0;
      }
      else
      {
        +[FBMainDisplayLayoutPublisher sharedInstance](FBMainDisplayLayoutPublisher, "sharedInstance");
        v14 = objc_claimAutoreleasedReturnValue();
        publisher = v12->_publisher;
        v12->_publisher = (FBMainDisplayLayoutPublisher *)v14;
      }

      v12->_displayType = a3;
      v15 = objc_msgSend(v10, "copy");
      identifier = v12->_identifier;
      v12->_identifier = (NSString *)v15;

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FBDisplayLayoutElement:%p %@"), v12, v12->_identifier);
      v17 = objc_claimAutoreleasedReturnValue();
      key = v12->_key;
      v12->_key = (NSString *)v17;

      v12->_elementClass = a5;
      v19 = objc_msgSend([a5 alloc], "initWithIdentifier:", v12->_identifier);
      element = v12->_element;
      v12->_element = (FBSDisplayLayoutElement *)v19;

    }
    return v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("identifier != nil"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBDisplayLayoutElement initWithDisplayType:identifier:elementClass:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    result = (FBDisplayLayoutElement *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)dealloc
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)activate
{
  -[FBDisplayLayoutElement activateWithBuilder:](self, "activateWithBuilder:", 0);
}

- (void)activateWithBuilder:(id)a3
{
  id v4;
  BSInvalidatable *v5;
  BSInvalidatable *activeAssertion;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    (*((void (**)(id, FBSDisplayLayoutElement *))v4 + 2))(v4, self->_element);
    v4 = v7;
  }
  if (!self->_activeAssertion)
  {
    -[FBMainDisplayLayoutPublisher _addElement:forKey:](self->_publisher, "_addElement:forKey:", self->_element, self->_key);
    v5 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    activeAssertion = self->_activeAssertion;
    self->_activeAssertion = v5;

    v4 = v7;
  }

}

- (void)updateWithBuilder:(id)a3
{
  id v4;
  void *v5;
  BSInvalidatable *v6;
  BSInvalidatable *activeAssertion;
  id v8;

  v4 = a3;
  v8 = v4;
  if (v4)
  {
    (*((void (**)(id, FBSDisplayLayoutElement *))v4 + 2))(v4, self->_element);
    v4 = v8;
  }
  if (self->_activeAssertion)
  {
    -[FBMainDisplayLayoutPublisher transitionAssertionWithReason:](self->_publisher, "transitionAssertionWithReason:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSInvalidatable invalidate](self->_activeAssertion, "invalidate");
    -[FBMainDisplayLayoutPublisher _addElement:forKey:](self->_publisher, "_addElement:forKey:", self->_element, self->_key);
    v6 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    activeAssertion = self->_activeAssertion;
    self->_activeAssertion = v6;

    objc_msgSend(v5, "invalidate");
    v4 = v8;
  }

}

- (void)deactivate
{
  BSInvalidatable *activeAssertion;
  BSInvalidatable *v4;

  activeAssertion = self->_activeAssertion;
  if (activeAssertion)
  {
    -[BSInvalidatable invalidate](activeAssertion, "invalidate");
    v4 = self->_activeAssertion;
    self->_activeAssertion = 0;

  }
}

- (NSString)description
{
  return (NSString *)-[FBDisplayLayoutElement descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBDisplayLayoutElement succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FBSDisplayTypeDescription();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("displayType"));

  v6 = (id)objc_msgSend(v3, "appendObject:withName:", self->_identifier, CFSTR("identifier"));
  NSStringFromClass(self->_elementClass);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("class"));

  v9 = (id)objc_msgSend(v3, "appendBool:withName:", self->_activeAssertion != 0, CFSTR("activated"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBDisplayLayoutElement descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  FBDisplayLayoutElement *v11;

  v4 = a3;
  -[FBDisplayLayoutElement succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__FBDisplayLayoutElement_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E4A11FD0;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __64__FBDisplayLayoutElement_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("element"));
}

- (FBSDisplayLayoutElement)element
{
  return self->_element;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)displayType
{
  return self->_displayType;
}

- (Class)elementClass
{
  return self->_elementClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAssertion, 0);
  objc_storeStrong((id *)&self->_element, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
}

- (void)initWithDisplayType:(const char *)a1 identifier:elementClass:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1A359A000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

@end
