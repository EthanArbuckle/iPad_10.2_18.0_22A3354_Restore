@implementation IMDSpotlightDataProvider

+ (id)_createDataProviders
{
  IMDSpotlightLinkDataProvider *v2;
  IMDSpotlightTextDataProvider *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(IMDSpotlightLinkDataProvider);
  v6[0] = v2;
  v3 = objc_alloc_init(IMDSpotlightTextDataProvider);
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_dataProviders
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1ABC242C0;
  block[3] = &unk_1E5AB07F8;
  block[4] = a1;
  if (qword_1EEC405F8 != -1)
    dispatch_once(&qword_1EEC405F8, block);
  return (id)qword_1EEC405F0;
}

+ (id)dataProviderForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_dataProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)typeIdentifier
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Not yet implemented"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)dataForGUID:(id)a3 error:(id *)a4
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Not yet implemented"), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v5);
}

@end
