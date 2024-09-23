@implementation SNAAssertion(HDExtensions)

- (id)hd_description
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  objc_msgSend(a1, "_stateString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_invalidationReasonString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@:%p state: %@, invalidation reason: %@>"), v3, a1, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (const)_stateString
{
  uint64_t v1;
  const __CFString *v2;

  v1 = objc_msgSend(a1, "state");
  v2 = CFSTR("unacquired");
  if (v1 == 1)
    v2 = CFSTR("acquired");
  if (v1 == 2)
    return CFSTR("invalidated");
  else
    return v2;
}

- (const)_invalidationReasonString
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "invalidationReason");
  if ((unint64_t)(v1 - 1) > 7)
    return CFSTR("none");
  else
    return off_1E6CFC010[v1 - 1];
}

@end
