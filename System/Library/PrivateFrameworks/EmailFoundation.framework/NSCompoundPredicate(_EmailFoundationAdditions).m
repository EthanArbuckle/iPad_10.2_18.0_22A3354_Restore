@implementation NSCompoundPredicate(_EmailFoundationAdditions)

- (id)_ef_parenthesizedPublicDescription
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(a1, "ef_publicDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("(%@)"), v3);

  return v4;
}

@end
