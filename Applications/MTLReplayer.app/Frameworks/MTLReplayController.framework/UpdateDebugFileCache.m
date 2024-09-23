@implementation UpdateDebugFileCache

void __UpdateDebugFileCache_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = objc_alloc((Class)NSURL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.metallib"), v5));
  v9 = objc_msgSend(v7, "initFileURLWithPath:relativeToURL:", v8, *(_QWORD *)(a1 + 32));

  v12 = 0;
  objc_msgSend(v6, "writeToURL:options:error:", v9, 0, &v12);

  v10 = v12;
  if (v10)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5));
    if (v11)
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v9, v11);

  }
}

@end
