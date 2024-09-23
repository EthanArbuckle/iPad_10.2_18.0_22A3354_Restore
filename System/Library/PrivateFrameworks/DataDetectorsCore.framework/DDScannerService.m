@implementation DDScannerService

void __44__DDScannerService_scanQuery_configuration___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  if (a2)
  {
    -[DDScannerObject scanString:range:query:configuration:completionBlock:](a2, 0, 0, 0, *(_QWORD **)(a1 + 40), a3, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;
  }
  else
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = MEMORY[0x1E0C9AA60];
  }

}

+ (id)scanQuery:(__DDScanQuery *)a3 configuration:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v5 = a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  _getSharedDispatcher();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__DDScannerService_scanQuery_configuration___block_invoke;
  v9[3] = &unk_1E3C94C48;
  v9[4] = &v10;
  v9[5] = a3;
  -[DDScanServerDispatcher scannerConf:sync:string:runTask:]((uint64_t)v6, v5, 1, 0, v9);
  v7 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v7;
}

+ (void)appendWatchOSLinksToString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a3;
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    _getSharedDispatcher();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__DDScannerService_appendWatchOSLinksToString___block_invoke;
    v7[3] = &unk_1E3C94BF8;
    v8 = v4;
    v9 = v3;
    -[DDScanServerDispatcher scannerConf:sync:string:runTask:]((uint64_t)v5, 0, 1, v6, v7);

  }
}

+ (id)scanString:(id)a3 range:(_NSRange)a4 configuration:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  NSUInteger v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  NSRange v28;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(v8, "length");
  if (v10)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy_;
    v26 = __Block_byref_object_dispose_;
    v27 = 0;
    v28.location = location;
    v28.length = length;
    v11 = validateRangeOfString(v10, v28);
    v13 = v12;
    _getSharedDispatcher();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __51__DDScannerService_scanString_range_configuration___block_invoke;
    v17[3] = &unk_1E3C94C20;
    v19 = &v22;
    v18 = v8;
    v20 = v11;
    v21 = v13;
    -[DDScanServerDispatcher scannerConf:sync:string:runTask:]((uint64_t)v14, v9, 1, v18, v17);
    v15 = (id)v23[5];

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    v15 = (id)MEMORY[0x1E0C9AA60];
  }

  return v15;
}

+ (id)scanString:(id)a3
{
  return (id)objc_msgSend(a1, "scanString:range:configuration:", a3, 0x7FFFFFFFFFFFFFFFLL, 0, 0);
}

+ (int64_t)scanString:(id)a3 range:(_NSRange)a4 configuration:(id)a5 completionBlock:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  NSUInteger v19;
  void *v20;
  NSUInteger v21;
  uint64_t v22;
  uint64_t v23;
  id *v24;
  id v25;
  int64_t v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  _QWORD v31[4];
  id v32;
  NSObject *v33;
  id v34;
  NSUInteger v35;
  uint64_t v36;
  _QWORD block[4];
  id v38;
  _QWORD v39[6];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  NSRange v44;

  length = a4.length;
  location = a4.location;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  _getSharedDispatcher();
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "completionQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    -[DDScanServerDispatcher reportQueue]((id *)v13);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  v18 = objc_msgSend(v10, "length");
  if (v18)
  {
    v19 = v18;
    v20 = (void *)objc_msgSend(v10, "copy");

    v44.location = location;
    v44.length = length;
    v21 = validateRangeOfString(v19, v44);
    v23 = v22;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __67__DDScannerService_scanString_range_configuration_completionBlock___block_invoke_2;
    v31[3] = &unk_1E3C94CC0;
    v24 = &v32;
    v10 = v20;
    v32 = v10;
    v35 = v21;
    v36 = v23;
    v33 = v17;
    v34 = v12;
    v25 = v12;
    v26 = -[DDScanServerDispatcher scannerConf:sync:string:runTask:](v13, v11, 0, v10, v31);

  }
  else
  {
    v27 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__DDScannerService_scanString_range_configuration_completionBlock___block_invoke;
    block[3] = &unk_1E3C95668;
    v24 = &v38;
    v38 = v12;
    v28 = v12;
    dispatch_async(v17, block);
    if (v13)
    {
      v40 = 0;
      v41 = &v40;
      v42 = 0x2020000000;
      v43 = 0;
      v29 = *(NSObject **)(v13 + 8);
      v39[0] = v27;
      v39[1] = 3221225472;
      v39[2] = __41__DDScanServerDispatcher_emptyIdentifier__block_invoke;
      v39[3] = &unk_1E3C95578;
      v39[4] = v13;
      v39[5] = &v40;
      dispatch_sync(v29, v39);
      v26 = v41[3];
      _Block_object_dispose(&v40, 8);
    }
    else
    {
      v26 = 0;
    }
  }

  return v26;
}

+ (int64_t)scanQuery:(__DDScanQuery *)a3 configuration:(id)a4 completionBlock:(id)a5
{
  id v7;
  id v8;
  id *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  int64_t v16;
  _QWORD v18[4];
  id v19;
  id v20;
  __DDScanQuery *v21;

  v7 = a4;
  v8 = a5;
  _getSharedDispatcher();
  v9 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "completionQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    -[DDScanServerDispatcher reportQueue](v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __60__DDScannerService_scanQuery_configuration_completionBlock___block_invoke;
  v18[3] = &unk_1E3C94CE8;
  v20 = v8;
  v21 = a3;
  v19 = v13;
  v14 = v8;
  v15 = v13;
  v16 = -[DDScanServerDispatcher scannerConf:sync:string:runTask:]((uint64_t)v9, v7, 0, 0, v18);

  return v16;
}

+ (int64_t)scanString:(id)a3 completionBlock:(id)a4
{
  return objc_msgSend(a1, "scanString:range:configuration:completionBlock:", a3, 0x7FFFFFFFFFFFFFFFLL, 0, 0, a4);
}

+ (void)cancelJob:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD block[10];

  if (a3 >= 1)
  {
    block[8] = v3;
    block[9] = v4;
    _getSharedDispatcher();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
    {
      v8 = *(NSObject **)(v6 + 8);
      block[1] = 3221225472;
      block[2] = __36__DDScanServerDispatcher_cancelJob___block_invoke;
      block[3] = &unk_1E3C94B80;
      block[4] = v7;
      block[5] = a3;
      v9 = v7;
      block[0] = MEMORY[0x1E0C809B0];
      dispatch_async(v8, block);
      v7 = v9;
    }

  }
}

void __60__DDScannerService_scanQuery_configuration_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *v6;
  id *v7;
  id v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  if (a2)
  {
    v6 = *(_QWORD **)(a1 + 48);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__DDScannerService_scanQuery_configuration_completionBlock___block_invoke_2;
    v12[3] = &unk_1E3C94C98;
    v7 = &v13;
    v13 = *(id *)(a1 + 32);
    v14 = *(id *)(a1 + 40);
    v8 = -[DDScannerObject scanString:range:query:configuration:completionBlock:](a2, 0, 0, 0, v6, a3, v12);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__DDScannerService_scanQuery_configuration_completionBlock___block_invoke_4;
    block[3] = &unk_1E3C95668;
    v7 = &v11;
    v9 = *(NSObject **)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    dispatch_async(v9, block);
  }

}

void __60__DDScannerService_scanQuery_configuration_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__DDScannerService_scanQuery_configuration_completionBlock___block_invoke_3;
  v7[3] = &unk_1E3C94C70;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __60__DDScannerService_scanQuery_configuration_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__DDScannerService_scanQuery_configuration_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __67__DDScannerService_scanString_range_configuration_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__DDScannerService_scanString_range_configuration_completionBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id *v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  if (a2)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__DDScannerService_scanString_range_configuration_completionBlock___block_invoke_3;
    v12[3] = &unk_1E3C94C98;
    v6 = &v13;
    v7 = *(void **)(a1 + 32);
    v13 = *(id *)(a1 + 40);
    v14 = *(id *)(a1 + 48);
    v8 = -[DDScannerObject scanString:range:query:configuration:completionBlock:](a2, v7, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 0, a3, v12);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__DDScannerService_scanString_range_configuration_completionBlock___block_invoke_5;
    block[3] = &unk_1E3C95668;
    v6 = &v11;
    v9 = *(NSObject **)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    dispatch_async(v9, block);
  }

}

void __67__DDScannerService_scanString_range_configuration_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__DDScannerService_scanString_range_configuration_completionBlock___block_invoke_4;
  v7[3] = &unk_1E3C94C70;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __67__DDScannerService_scanString_range_configuration_completionBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__DDScannerService_scanString_range_configuration_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __51__DDScannerService_scanString_range_configuration___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  if (a2)
  {
    -[DDScannerObject scanString:range:query:configuration:completionBlock:](a2, *(void **)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, a3, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;
  }
  else
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = MEMORY[0x1E0C9AA60];
  }

}

void __47__DDScannerService_appendWatchOSLinksToString___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  CFStringRef v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t RangeForURLification;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "setNoObjC:", 1);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v21 = v5;
  v22 = v6;
  -[DDScannerObject scanString:range:query:configuration:completionBlock:]((uint64_t)v5, *(void **)(a1 + 32), 0, objc_msgSend(*(id *)(a1 + 32), "length"), 0, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (DDResultGetCategory(v11) - 1 <= 2)
        {
          v12 = DDResultCopyExtractedURLWithOptions(v11, 2);
          if (v12)
          {
            v13 = (__CFString *)v12;
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
            {
              objc_msgSend(v14, "scheme");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "lowercaseString");
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend(v16, "isEqualToString:", CFSTR("maps")) & 1) != 0
                || (objc_msgSend(v16, "isEqualToString:", CFSTR("tel")) & 1) != 0)
              {

                RangeForURLification = DDResultGetRangeForURLification(v11);
                v19 = v18;
                v24 = 0;
                v25 = &v24;
                v26 = 0x2020000000;
                v27 = 0;
                v20 = *(void **)(a1 + 40);
                v23[0] = MEMORY[0x1E0C809B0];
                v23[1] = 3221225472;
                v23[2] = __47__DDScannerService_appendWatchOSLinksToString___block_invoke_2;
                v23[3] = &unk_1E3C94BD0;
                v23[4] = &v24;
                objc_msgSend(v20, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NSLink"), RangeForURLification, v18, 0x100000, v23);
                if (!*((_BYTE *)v25 + 24))
                  objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", CFSTR("NSLink"), v14, RangeForURLification, v19);
                _Block_object_dispose(&v24, 8);
              }
              else
              {

                v14 = v16;
              }

            }
          }
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v8);
  }

}

uint64_t __47__DDScannerService_appendWatchOSLinksToString___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (a2)
  {
    if (a4)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
      *a5 = 1;
    }
  }
  return result;
}

@end
