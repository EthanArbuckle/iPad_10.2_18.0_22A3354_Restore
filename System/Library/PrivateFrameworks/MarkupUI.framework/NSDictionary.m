@implementation NSDictionary

void __56__NSDictionary_Foundation_Extensions__muDeepMutableCopy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_12;
    }
    v6 = (id)objc_msgSend(v5, "muDeepMutableCopy");
  }
  else if (objc_msgSend(v5, "conformsToProtocol:", &unk_2555C5600))
  {
    v6 = (id)objc_msgSend(v5, "mutableCopy");
  }
  else if (objc_msgSend(v5, "conformsToProtocol:", &unk_2555C4F70))
  {
    v6 = (id)objc_msgSend(v5, "copy");
  }
  else
  {
    v6 = v5;
  }
  v7 = v6;
  if (!v6)
  {
LABEL_12:
    NSLog(CFSTR("Unable to copy object for [NSDictionary muDeepMutableCopy]: %@"), v5);
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v6, v8);

LABEL_13:
}

@end
