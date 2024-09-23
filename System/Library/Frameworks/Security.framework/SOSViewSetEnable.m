@implementation SOSViewSetEnable

void __SOSViewSetEnable_block_invoke(uint64_t a1, void *value)
{
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (SOSViewsIsKnownView((uint64_t)value) && SOSPeerInfoViewIsValid(value))
  {
    if (!CFSetContainsValue(*(CFSetRef *)(a1 + 48), value))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      CFSetAddValue(*(CFMutableSetRef *)(a1 + 48), value);
    }
  }
  else
  {
    secLogObjForScope("views");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = value;
      _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "couldn't add view %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

@end
