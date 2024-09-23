@implementation ATXSuggestedPagesLayoutOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXSuggestedPagesLayoutOptions)initWithCoder:(id)a3
{
  id v4;
  ATXSuggestedPagesLayoutOptions *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSSet *candidateApps;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ATXSuggestedPagesLayoutOptions;
  v5 = -[ATXSuggestedPagesLayoutOptions init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1A85A4F90]();
    v7 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithObjects:", v8, v9, 0);

    objc_autoreleasePoolPop(v6);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("candidateApps"));
    v11 = objc_claimAutoreleasedReturnValue();
    candidateApps = v5->_candidateApps;
    v5->_candidateApps = (NSSet *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_candidateApps, CFSTR("candidateApps"));
}

- (NSSet)candidateApps
{
  return self->_candidateApps;
}

- (void)setCandidateApps:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateApps, 0);
}

@end
