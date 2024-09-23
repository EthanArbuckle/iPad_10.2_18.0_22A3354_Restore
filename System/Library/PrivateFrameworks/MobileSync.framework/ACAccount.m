@implementation ACAccount

id __46__ACAccount_SyncPrivate__applySyncProperties___block_invoke()
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("__Password__"), CFSTR("AccountType"), 0);
  applySyncProperties__accountKeysToIgnore = (uint64_t)result;
  return result;
}

uint64_t __46__ACAccount_SyncPrivate__applySyncProperties___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  int v7;
  void *v8;

  result = objc_msgSend((id)applySyncProperties__accountKeysToIgnore, "containsObject:", a2);
  if ((result & 1) == 0)
  {
    if (objc_msgSend(a2, "isEqualToString:", CFSTR("Username")))
    {
      return objc_msgSend(*(id *)(a1 + 32), "setUsername:", objc_msgSend(*(id *)(a1 + 32), "_usernameFromProperties:", *(_QWORD *)(a1 + 40)));
    }
    else
    {
      v7 = objc_msgSend(a2, "isEqualToString:", CFSTR("AccountName"));
      v8 = *(void **)(a1 + 32);
      if (v7)
        return objc_msgSend(v8, "setAccountDescription:", a3);
      else
        return objc_msgSend(v8, "setAccountProperty:forKey:", a3, a2);
    }
  }
  return result;
}

@end
