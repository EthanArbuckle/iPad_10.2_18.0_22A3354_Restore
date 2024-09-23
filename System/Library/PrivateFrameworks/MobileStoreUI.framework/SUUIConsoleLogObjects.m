@implementation SUUIConsoleLogObjects

void __SUUIConsoleLogObjects_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("console"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("log"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "callWithArguments:", *(_QWORD *)(a1 + 32));

}

@end
