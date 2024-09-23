@implementation MRMediaSuggestionRequestOptions

- (MRMediaSuggestionRequestOptions)initWithBlock:(id)a3
{
  void (**v4)(id, MRMediaSuggestionRequestOptions *);
  MRMediaSuggestionRequestOptions *v5;
  objc_super v7;

  v4 = (void (**)(id, MRMediaSuggestionRequestOptions *))a3;
  v7.receiver = self;
  v7.super_class = (Class)MRMediaSuggestionRequestOptions;
  v5 = -[MRMediaSuggestionRequestOptions init](&v7, sel_init);
  if (v5)
    v4[2](v4, v5);

  return v5;
}

+ (id)defaultOptions
{
  return objc_alloc_init(MRMediaSuggestionRequestOptions);
}

- (NSString)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[MRMediaSuggestionRequestOptions bundleIdentifiers](self, "bundleIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRMediaSuggestionRequestOptions contexts](self, "contexts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: bundles=%@, contexts=%@>"), v4, v5, v6);

  return (NSString *)v7;
}

- (NSArray)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (void)setBundleIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)contexts
{
  return self->_contexts;
}

- (void)setContexts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contexts, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
}

@end
