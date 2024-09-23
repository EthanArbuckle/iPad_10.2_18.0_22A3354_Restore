@implementation IMBagUtilities

+ (unsigned)getUnsignedIntForKey:(id)a3 withDefault:(unsigned int)a4
{
  uint64_t v5;
  void *v6;

  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1), "objectForKey:", a3);
  if (v5)
  {
    v6 = (void *)v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      return objc_msgSend(v6, "unsignedIntegerValue");
  }
  return a4;
}

@end
