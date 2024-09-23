@implementation MLUpdateProgressHandlersUtils

+ (id)progressEventsToString:(int64_t)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(&unk_1E3DA2990, "count"))
  {
    v5 = 0;
    do
    {
      if (((1 << v5) & (unint64_t)a3) != 0)
      {
        objc_msgSend(&unk_1E3DA2990, "objectAtIndex:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v6);

      }
      ++v5;
    }
    while (v5 < objc_msgSend(&unk_1E3DA2990, "count"));
  }
  if (!a3)
    objc_msgSend(v4, "addObject:", CFSTR("Training End"));
  objc_msgSend(v4, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
