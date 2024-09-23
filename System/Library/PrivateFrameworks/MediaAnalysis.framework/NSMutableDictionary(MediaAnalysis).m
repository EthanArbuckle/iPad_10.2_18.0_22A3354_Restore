@implementation NSMutableDictionary(MediaAnalysis)

- (void)vcp_setVersion:()MediaAnalysis
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:");

}

- (uint64_t)vcp_setDateModified:()MediaAnalysis
{
  return objc_msgSend(a1, "setObject:forKey:", a3, CFSTR("dateModified"));
}

- (uint64_t)vcp_setDateAnalyzed:()MediaAnalysis
{
  return objc_msgSend(a1, "setObject:forKey:", a3, CFSTR("dateAnalyzed"));
}

- (void)vcp_setTypes:()MediaAnalysis
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:");

}

- (void)vcp_setFlags:()MediaAnalysis
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:");

}

- (void)vcp_setStatsFlags:()MediaAnalysis
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:");

}

- (void)vcp_setQuality:()MediaAnalysis
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:");

}

- (void)vcp_setFingerprint:()MediaAnalysis
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "master");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v8, "master");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKey:", v5, CFSTR("masterFingerprint"));

  }
  else
  {
    objc_msgSend(a1, "removeObjectForKey:", CFSTR("masterFingerprint"));
  }
  objc_msgSend(v8, "adjusted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v8, "adjusted");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKey:", v7, CFSTR("adjustedFingerprint"));

  }
  else
  {
    objc_msgSend(a1, "removeObjectForKey:", CFSTR("adjustedFingerprint"));
  }

}

- (uint64_t)vcp_addTypes:()MediaAnalysis
{
  return objc_msgSend(a1, "vcp_setTypes:", objc_msgSend(a1, "vcp_types") | a3);
}

- (uint64_t)vcp_addFlags:()MediaAnalysis
{
  return objc_msgSend(a1, "vcp_setFlags:", objc_msgSend(a1, "vcp_flags") | a3);
}

- (uint64_t)vcp_addStatsFlags:()MediaAnalysis
{
  return objc_msgSend(a1, "vcp_setStatsFlags:", objc_msgSend(a1, "vcp_statsFlags") | a3);
}

- (id)vcp_mutableResults
{
  void *v2;

  objc_msgSend(a1, "objectForKey:", CFSTR("metadataRanges"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKey:", v2, CFSTR("metadataRanges"));
  }
  return v2;
}

- (void)vcp_setResult:()MediaAnalysis forKey:
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9 && v6 && objc_msgSend(v9, "count"))
  {
    objc_msgSend(a1, "vcp_mutableResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v7, "setObject:forKey:", v8, v6);

  }
}

- (uint64_t)vcp_addEntriesFromResults:()MediaAnalysis
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__NSMutableDictionary_MediaAnalysis__vcp_addEntriesFromResults___block_invoke;
  v4[3] = &unk_1E6B1A6B0;
  v4[4] = a1;
  return objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v4);
}

- (void)vcp_setResults:()MediaAnalysis
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "removeObjectForKey:", CFSTR("metadataRanges"));
  objc_msgSend(a1, "vcp_addEntriesFromResults:", v4);

}

- (void)vcp_appendResult:()MediaAnalysis forKey:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11 && v6 && objc_msgSend(v11, "count"))
  {
    objc_msgSend(a1, "vcp_mutableResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "addObjectsFromArray:", v11);
    }
    else
    {
      v10 = (void *)objc_msgSend(v11, "mutableCopy");
      objc_msgSend(v7, "setObject:forKey:", v10, v6);

    }
  }

}

- (uint64_t)vcp_appendResults:()MediaAnalysis
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__NSMutableDictionary_MediaAnalysis__vcp_appendResults___block_invoke;
  v4[3] = &unk_1E6B1A6B0;
  v4[4] = a1;
  return objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v4);
}

- (void)vcp_removeResultForKey:()MediaAnalysis
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(a1, "vcp_mutableResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v5);

}

@end
