@implementation NSTimeZone

id __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a1;
  v4 = objc_msgSend(v3, "rangeOfString:", a2);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "substringToIndex:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v5;
  }
  return v3;
}

id __75__NSTimeZone_SGCalendarAttachmentDissector__systemTimeZoneWithWindowsName___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(&unk_1E7E114C8, "objectForKeyedSubscript:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end
