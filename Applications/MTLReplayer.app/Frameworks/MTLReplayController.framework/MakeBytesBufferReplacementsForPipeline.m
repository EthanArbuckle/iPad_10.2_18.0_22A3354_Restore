@implementation MakeBytesBufferReplacementsForPipeline

id ___MakeBytesBufferReplacementsForPipeline_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type")));
  if (objc_msgSend(v4, "unsignedIntValue"))
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("index")));
    v5 = objc_msgSend(v6, "isEqualToNumber:", *(_QWORD *)(a1 + 32));

  }
  return v5;
}

@end
