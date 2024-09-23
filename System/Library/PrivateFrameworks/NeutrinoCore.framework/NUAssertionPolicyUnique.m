@implementation NUAssertionPolicyUnique

- (NUAssertionPolicyUnique)init
{
  NUAssertionPolicyUnique *v2;
  NSMutableSet *v3;
  NSMutableSet *signatures;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NUAssertionPolicyUnique;
  v2 = -[NUAssertionPolicyComposite init](&v6, sel_init);
  v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  signatures = v2->_signatures;
  v2->_signatures = v3;

  return v2;
}

- (void)notifyAssertion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NUAssertionPolicyUnique *v8;
  objc_super v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "fileName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@:%ld"), v6, objc_msgSend(v4, "lineNumber"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = self;
  objc_sync_enter(v8);
  if ((-[NSMutableSet containsObject:](v8->_signatures, "containsObject:", v7) & 1) == 0)
  {
    -[NSMutableSet addObject:](v8->_signatures, "addObject:", v7);
    v9.receiver = v8;
    v9.super_class = (Class)NUAssertionPolicyUnique;
    -[NUAssertionPolicyComposite notifyAssertion:](&v9, sel_notifyAssertion_, v4);
  }
  objc_sync_exit(v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatures, 0);
}

@end
