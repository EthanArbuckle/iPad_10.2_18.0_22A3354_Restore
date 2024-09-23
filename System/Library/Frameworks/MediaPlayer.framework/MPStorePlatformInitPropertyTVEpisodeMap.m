@implementation MPStorePlatformInitPropertyTVEpisodeMap

void ___MPStorePlatformInitPropertyTVEpisodeMap_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a2;
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = ___MPStorePlatformInitPropertyTVEpisodeMap_block_invoke_2;
  v15[3] = &unk_1E3163A30;
  v8 = v6;
  v16 = v8;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "setUniversalStoreIdentifiersWithBlock:", v15);
  objc_msgSend(v10, "personID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = ___MPStorePlatformInitPropertyTVEpisodeMap_block_invoke_3;
  v13[3] = &unk_1E3162BA8;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v9, "setPersonalStoreIdentifiersWithPersonID:block:", v11, v13);

}

void ___MPStorePlatformInitPropertyTVEpisodeMap_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  CFStringRef v7;
  id v8;
  uint64_t v9;
  char *v10;
  uint64_t quot;
  lldiv_t v12;
  uint64_t v13;
  const UInt8 *v14;
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("id"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "longLongValue");
  else
    v5 = 0;

  objc_msgSend(v3, "setAdamID:", v5);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("libraryTrackId"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    v7 = (CFStringRef)v6;
  }
  else
  {
    if (!_NSIsNSNumber())
    {
      v15 = 0;
      goto LABEL_22;
    }
    v8 = v6;
    if ((_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
      v9 = objc_msgSend(v8, "longLongValue");
    else
      v9 = 0;

    v10 = (char *)&v16 + 1;
    quot = v9;
    do
    {
      v12 = lldiv(quot, 10);
      quot = v12.quot;
      if (v12.rem >= 0)
        LOBYTE(v13) = v12.rem;
      else
        v13 = -v12.rem;
      *(v10 - 2) = v13 + 48;
      v14 = (const UInt8 *)(v10 - 2);
      --v10;
    }
    while (v12.quot);
    if (v9 < 0)
    {
      *(v10 - 2) = 45;
      v14 = (const UInt8 *)(v10 - 2);
    }
    v7 = CFStringCreateWithBytes(0, v14, (char *)&v16 - (char *)v14, 0x8000100u, 0);
  }
  v15 = (__CFString *)v7;
LABEL_22:

  objc_msgSend(v3, "setUniversalCloudLibraryID:", v15);
}

void ___MPStorePlatformInitPropertyTVEpisodeMap_block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sagaId"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v5, "longLongValue");
  else
    v4 = 0;

  objc_msgSend(v3, "setCloudID:", v4);
}

@end
