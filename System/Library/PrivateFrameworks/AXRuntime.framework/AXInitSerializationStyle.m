@implementation AXInitSerializationStyle

void __AXInitSerializationStyle_block_invoke()
{
  void *v0;
  unint64_t v1;
  id v2;

  atomic_store(1uLL, &AXCurrentSerializationStyle);
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.Accessibility"));
  objc_msgSend(v0, "objectForKey:", CFSTR("SerializationStyle"));
  v2 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v1 = objc_msgSend(v2, "integerValue");
    if (v1 <= 1)
      atomic_store(v1, &AXCurrentSerializationStyle);
  }

}

@end
