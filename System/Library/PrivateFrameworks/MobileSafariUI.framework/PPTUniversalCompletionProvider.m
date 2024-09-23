@implementation PPTUniversalCompletionProvider

- (void)setQueryToComplete:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSString *v8;
  NSString *querySimulated;
  NSTimer *v10;
  NSTimer *networkDelaySimulatorTimer;
  _QWORD v12[5];

  v4 = a3;
  objc_msgSend(v4, "queryString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", self->querySimulated);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v4, "queryString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSString *)objc_msgSend(v7, "copy");
    querySimulated = self->querySimulated;
    self->querySimulated = v8;

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__PPTUniversalCompletionProvider_setQueryToComplete___block_invoke;
    v12[3] = &unk_1E9CF6FB8;
    v12[4] = self;
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v12, 0.1);
    v10 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    networkDelaySimulatorTimer = self->networkDelaySimulatorTimer;
    self->networkDelaySimulatorTimer = v10;

  }
}

void __53__PPTUniversalCompletionProvider_setQueryToComplete___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id v3;

  v2 = *(_QWORD **)(a1 + 32);
  objc_msgSend(v2, "_generateResultsForString:", v2[17]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCompletions:forString:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));

}

- (id)_generateResultsForString:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v6 = 0;
    do
    {
      -[PPTUniversalCompletionProvider _generateSingleResult](self, "_generateSingleResult");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v7);

      ++v6;
    }
    while (v6 < objc_msgSend(v4, "length"));
  }

  return v5;
}

- (id)_generateSingleResult
{
  id v2;
  id v3;
  id v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0D8C6A8]);
  objc_msgSend(v2, "setPlacement:", 1);
  v3 = objc_alloc_init(MEMORY[0x1E0D8C7A8]);
  objc_msgSend(v3, "setText:", CFSTR("This is a test title"));
  objc_msgSend(v3, "setMaxLines:", 2);
  objc_msgSend(v2, "setTitle:", v3);
  objc_msgSend(v2, "setSectionHeader:", CFSTR("Test Header"));
  v4 = objc_alloc_init(MEMORY[0x1E0D8C660]);
  objc_msgSend(v4, "setText:", CFSTR("This is a test"));
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDescriptions:", v5);

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->querySimulated, 0);
  objc_storeStrong((id *)&self->networkDelaySimulatorTimer, 0);
}

@end
