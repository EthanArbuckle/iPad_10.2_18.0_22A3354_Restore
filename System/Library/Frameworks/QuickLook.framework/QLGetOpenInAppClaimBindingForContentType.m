@implementation QLGetOpenInAppClaimBindingForContentType

void ___QLGetOpenInAppClaimBindingForContentType_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject **v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!_block_invoke_cachedApps)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)_block_invoke_cachedApps;
    _block_invoke_cachedApps = v2;

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend((id)_block_invoke_cachedApps, "objectForKeyedSubscript:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDC1570], "documentProxyForName:type:MIMEType:isContentManaged:sourceAuditToken:", 0, *(_QWORD *)(a1 + 32), 0, *(unsigned __int8 *)(a1 + 48), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        _QLGetOpenInAppClaimBindingForDocumentProxy(v5);
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v9 = *(void **)(v8 + 40);
        *(_QWORD *)(v8 + 40) = v7;

        v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        if (v10)
          objc_msgSend((id)_block_invoke_cachedApps, "setObject:forKeyedSubscript:", v10, *(_QWORD *)(a1 + 32));
      }
      else
      {
        v11 = *MEMORY[0x24BE7BF48];
        if (!*MEMORY[0x24BE7BF48])
        {
          v13 = (NSObject **)MEMORY[0x24BE7BF48];
          QLSInitLogging();
          v11 = *v13;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = *(_QWORD *)(a1 + 32);
          v14 = 138412290;
          v15 = v12;
          _os_log_impl(&dword_20D4F5000, v11, OS_LOG_TYPE_INFO, "No Open In app for content type: %@ #Generic", (uint8_t *)&v14, 0xCu);
        }
      }

    }
  }
}

@end
