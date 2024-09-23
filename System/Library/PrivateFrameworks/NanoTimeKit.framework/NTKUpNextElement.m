@implementation NTKUpNextElement

+ (id)elementWithREElement:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithREElement:", v4);

  return v5;
}

- (NTKUpNextElement)initWithREElement:(id)a3
{
  id v5;
  NTKUpNextElement *v6;
  NTKUpNextElement *v7;
  void *v8;
  uint64_t v9;
  NSString *elementIdentifier;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKUpNextElement;
  v6 = -[NTKUpNextElement init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_element, a3);
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    elementIdentifier = v7->_elementIdentifier;
    v7->_elementIdentifier = (NSString *)v9;

  }
  return v7;
}

- (void)setElement:(id)a3
{
  REElement *v5;
  uint64_t *p_element;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;

  v5 = (REElement *)a3;
  p_element = (uint64_t *)&self->_element;
  if (self->_element != v5)
  {
    -[NTKUpNextElement elementIdentifier](self, "elementIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[REElement identifier](v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if ((v9 & 1) == 0)
    {
      _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[NTKUpNextElement setElement:].cold.1(p_element, (uint64_t)v5, v10);

    }
    objc_storeStrong((id *)p_element, a3);
  }

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[NTKUpNextElement elementIdentifier](self, "elementIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "elementIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKUpNextElement elementIdentifier](self, "elementIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NTKUpNextElement elementIdentifier](self, "elementIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<Wrapped %p: %@>"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (REElement)element
{
  return self->_element;
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
  objc_storeStrong((id *)&self->_element, 0);
}

- (void)setElement:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_fault_impl(&dword_1B72A3000, log, OS_LOG_TYPE_FAULT, "Assigning an incorrect element (%@) to the wrapper %@", (uint8_t *)&v4, 0x16u);
}

@end
