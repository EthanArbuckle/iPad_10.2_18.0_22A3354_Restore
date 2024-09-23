@implementation MNNanoFormattedStringFormatter

+ (id)sharedFormatter
{
  if (qword_1ED0C4170 != -1)
    dispatch_once(&qword_1ED0C4170, &__block_literal_global_54);
  return (id)_MergedGlobals_53;
}

void __49__MNNanoFormattedStringFormatter_sharedFormatter__block_invoke()
{
  MNNanoFormattedStringFormatter *v0;
  void *v1;

  v0 = objc_alloc_init(MNNanoFormattedStringFormatter);
  v1 = (void *)_MergedGlobals_53;
  _MergedGlobals_53 = (uint64_t)v0;

}

- (id)listInstructionForStep:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "transportType") == 6 || objc_msgSend(v3, "transportType") == 1)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "geoStep");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasInstructions");

    if (v6)
    {
      objc_msgSend(v3, "geoStep");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "instructions");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "contentsForContext:", 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSuppressNames:", 1);
      objc_msgSend(v7, "instructionWithShorterAlternatives");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v4;
}

- (id)signInstructionsForStep:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "transportType") == 6 || objc_msgSend(v3, "transportType") == 1)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "contentsForContext:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "instructionWithShorterAlternatives");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

@end
