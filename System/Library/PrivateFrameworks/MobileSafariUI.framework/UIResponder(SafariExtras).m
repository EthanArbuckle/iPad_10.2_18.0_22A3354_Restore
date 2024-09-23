@implementation UIResponder(SafariExtras)

- (id)safari_responderChainDescription
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(a1, "firstResponder");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = 1;
    do
    {
      v6 = v5 + 1;
      objc_msgSend(v2, "appendFormat:", CFSTR("%lu: %@\n"), v5, v4);
      objc_msgSend(v4, "nextResponder");
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
      v5 = v6;
    }
    while (v7);
  }
  return v2;
}

@end
