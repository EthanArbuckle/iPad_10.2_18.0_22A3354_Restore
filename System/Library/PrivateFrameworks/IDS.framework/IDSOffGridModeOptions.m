@implementation IDSOffGridModeOptions

- (IDSOffGridModeOptions)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IDSOffGridModeOptions;
  return -[IDSOffGridModeOptions init](&v3, sel_init);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_entryPointSource, CFSTR("entry-point-source"));
}

- (IDSOffGridModeOptions)initWithCoder:(id)a3
{
  id v4;
  IDSOffGridModeOptions *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(IDSOffGridModeOptions);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entry-point-source"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[IDSOffGridModeOptions setEntryPointSource:](v5, "setEntryPointSource:", v6);
  return v5;
}

- (NSString)entryPointSource
{
  return self->_entryPointSource;
}

- (void)setEntryPointSource:(id)a3
{
  objc_storeStrong((id *)&self->_entryPointSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryPointSource, 0);
}

@end
