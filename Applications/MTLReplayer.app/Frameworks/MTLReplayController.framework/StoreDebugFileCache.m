@implementation StoreDebugFileCache

void __StoreDebugFileCache_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v5 = a3;
  v6 = a2;
  v7 = objc_alloc((Class)NSURL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.metallib"), v6));

  v9 = objc_msgSend(v7, "initFileURLWithPath:relativeToURL:", v8, *(_QWORD *)(a1 + 32));
  v11 = 0;
  objc_msgSend(v5, "writeToURL:options:error:", v9, 0, &v11);

  v10 = v11;
  if (v10)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

@end
