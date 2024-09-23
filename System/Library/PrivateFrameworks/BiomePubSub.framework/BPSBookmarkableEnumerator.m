@implementation BPSBookmarkableEnumerator

- (id)nextObject
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("Must override method %@ in a subclass"), v4);

  return 0;
}

- (id)bookmark
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("Must override method %@ in a subclass"), v4);

  return 0;
}

- (id)validateBookmark:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Must override method %@ in a subclass"), v5);

  return 0;
}

- (void)applyBookmark:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Must override method %@ in a subclass"), v5);

}

- (void)reset
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("Must override method %@ in a subclass"), v4);

}

- (id)bpsPublisher
{
  return -[BPSSequence initWithBookmarkableEnumerator:]([BPSSequence alloc], "initWithBookmarkableEnumerator:", self);
}

@end
