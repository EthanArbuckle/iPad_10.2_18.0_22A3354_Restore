@implementation CDSpotlightContactResolver

uint64_t __35___CDSpotlightContactResolver_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purge");
}

void __45___CDSpotlightContactResolver_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x193FEE914]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_0;
  sharedInstance__pasExprOnceResult_0 = v1;

  objc_autoreleasePoolPop(v0);
}

uint64_t __45___CDSpotlightContactResolver__validateCache__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purge");
}

void __53___CDSpotlightContactResolver__setContact_forHandle___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  _CDSpotlightCachedContact *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0C99D68];
  v4 = a2;
  v6 = (id)objc_msgSend([v3 alloc], "initWithTimeIntervalSinceNow:", 120.0);
  v5 = -[_CDSpotlightCachedContact initWithExpirationDate:contact:]([_CDSpotlightCachedContact alloc], "initWithExpirationDate:contact:", v6, *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setObject:forKey:", v5, *(_QWORD *)(a1 + 40));

}

void __58___CDSpotlightContactResolver__getCachedContactForHandle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v6)
  {
    objc_msgSend(v6, "expirationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceNow");
    v9 = v8;

    if (v9 <= 0.0)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = 0;

      objc_msgSend(v13, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", 120.0);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setExpirationDate:", v10);

    }
  }

}

void __37___CDSpotlightContactResolver__purge__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;

  objc_msgSend(a2, "removeAllObjects");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = 0;

}

@end
