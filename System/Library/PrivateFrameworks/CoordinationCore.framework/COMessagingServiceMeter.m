@implementation COMessagingServiceMeter

void __32___COMessagingServiceMeter_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;
  _QWORD v3[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3[1] = 3221225472;
    v3[2] = __32___COMessagingServiceMeter_init__block_invoke_2;
    v3[3] = &unk_24D4B0C80;
    v2 = WeakRetained;
    v3[0] = MEMORY[0x24BDAC760];
    v4 = WeakRetained;
    objc_msgSend(v4, "_withLock:", v3);

    WeakRetained = v2;
  }

}

void __32___COMessagingServiceMeter_init__block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "peaks");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v17, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v1);
        v6 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        COCoreLogForCategory(9);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v1, "objectForKey:", v6);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v14 = v6;
          v15 = 2112;
          v16 = v8;
          _os_log_impl(&dword_215E92000, v7, OS_LOG_TYPE_INFO, "Peak usage for %@: %@ bytes", buf, 0x16u);

        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v17, 16);
    }
    while (v3);
  }

}

void __59___COMessagingServiceMeter_clientIdentifier_canSendLength___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "peaks");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  if (v3 > objc_msgSend(v2, "unsignedIntegerValue"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, *(_QWORD *)(a1 + 40));

  }
}

void __62___COMessagingServiceMeter_clientIdentifier_canReceiveLength___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "peaks");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  if (v3 > objc_msgSend(v2, "unsignedIntegerValue"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, *(_QWORD *)(a1 + 40));

  }
}

void __51___COMessagingServiceMeter_isEvaluatingIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "peaks");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2 != 0;

}

@end
