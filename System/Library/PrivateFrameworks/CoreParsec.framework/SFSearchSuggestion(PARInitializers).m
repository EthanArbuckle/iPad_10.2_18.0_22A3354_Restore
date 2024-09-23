@implementation SFSearchSuggestion(PARInitializers)

- (void)initWithIdentifier:()PARInitializers suggestion:query:score:fbr:
{
  id v12;
  void *v13;
  void *v14;

  v12 = a7;
  v13 = (void *)objc_msgSend(a1, "initWithIdentifier:suggestion:query:score:type:", a4, a5, a6, 1, a2);
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "setFbr:", v12);

  return v14;
}

- (uint64_t)initWithSuggestion:()PARInitializers query:score:fbr:
{
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v10 = (void *)MEMORY[0x1E0CB3A28];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  objc_msgSend(v10, "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(a1, "initWithIdentifier:suggestion:query:score:fbr:", v15, v13, v12, v11, a2);

  return v16;
}

@end
