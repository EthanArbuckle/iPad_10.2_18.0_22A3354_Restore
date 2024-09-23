@implementation GCGamepadEventFusionConfig

__CFString *__47___GCGamepadEventFusionConfig_debugDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  unint64_t v5;
  __CFString *v6;
  uint64_t v7;

  v3 = *(_QWORD **)(a1 + 32);
  if (v3[1])
  {
    v5 = 0;
    v6 = &stru_24D2B85A8;
    do
    {
      if (objc_msgSend(v3, "passRuleForElement:forSourceAtIndex:", a2, v5))
      {
        -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", CFSTR("[%i]"), v5);
        v7 = objc_claimAutoreleasedReturnValue();

        v6 = (__CFString *)v7;
      }
      ++v5;
      v3 = *(_QWORD **)(a1 + 32);
    }
    while (v5 < v3[1]);
  }
  else
  {
    v6 = &stru_24D2B85A8;
  }
  if (!-[__CFString length](v6, "length"))
  {

    v6 = CFSTR("No Sources");
  }
  return v6;
}

@end
