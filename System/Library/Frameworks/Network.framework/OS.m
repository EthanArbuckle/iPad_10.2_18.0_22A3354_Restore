@implementation OS

uint64_t __48__OS_nw_dictionary_nw_descriptions__description__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  __CFString *v6;

  v5 = a3;
  v6 = *(__CFString **)(a1 + 40);
  if (**(_BYTE **)(a1 + 32))
  {
    CFStringAppendFormat(v6, 0, CFSTR("{\"%s\": %@"), a2, v5);
    **(_BYTE **)(a1 + 32) = 0;
  }
  else
  {
    CFStringAppendFormat(v6, 0, CFSTR(", \"%s\": %@"), a2, v5);
  }

  return 1;
}

uint64_t __56__OS_nw_dictionary_nw_descriptions__redactedDescription__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  __CFString *v6;
  __CFString *v7;

  v5 = a3;
  v6 = CFSTR("<redacted>");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "redactedDescription");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v7 = *(__CFString **)(a1 + 40);
  if (**(_BYTE **)(a1 + 32))
  {
    CFStringAppendFormat(v7, 0, CFSTR("{\"%s\": %@"), a2, v6);
    **(_BYTE **)(a1 + 32) = 0;
  }
  else
  {
    CFStringAppendFormat(v7, 0, CFSTR(", \"%s\": %@"), a2, v6);
  }

  return 1;
}

@end
