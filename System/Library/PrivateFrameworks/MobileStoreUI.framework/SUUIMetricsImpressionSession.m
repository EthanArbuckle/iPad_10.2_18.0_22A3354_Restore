@implementation SUUIMetricsImpressionSession

- (SUUIMetricsImpressionSession)init
{
  SUUIMetricsImpressionSession *v2;
  NSMutableArray *v3;
  NSMutableArray *impressionIdentifiers;
  NSMutableString *v5;
  NSMutableString *impressionsString;
  NSMutableOrderedSet *v7;
  NSMutableOrderedSet *impressionableViewElements;
  uint64_t v9;
  NSMapTable *impressionableViewElementsTimerMap;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SUUIMetricsImpressionSession;
  v2 = -[SUUIMetricsImpressionSession init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    impressionIdentifiers = v2->_impressionIdentifiers;
    v2->_impressionIdentifiers = v3;

    v5 = (NSMutableString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
    impressionsString = v2->_impressionsString;
    v2->_impressionsString = v5;

    v7 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x24BDBCEE0]);
    impressionableViewElements = v2->_impressionableViewElements;
    v2->_impressionableViewElements = v7;

    objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    impressionableViewElementsTimerMap = v2->_impressionableViewElementsTimerMap;
    v2->_impressionableViewElementsTimerMap = (NSMapTable *)v9;

  }
  return v2;
}

- (void)addItemIdentifier:(int64_t)a3
{
  const __CFString *v5;
  id v6;

  if (a3)
  {
    if (-[NSMutableString length](self->_impressionsString, "length"))
      v5 = CFSTR(",%lld");
    else
      v5 = CFSTR("%lld");
    -[NSMutableString appendFormat:](self->_impressionsString, "appendFormat:", v5, a3);
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", a3);
    -[NSMutableArray addObject:](self->_impressionIdentifiers, "addObject:", v6);

  }
}

- (void)addItemViewElement:(id)a3
{
  if (a3)
    -[NSMutableOrderedSet addObject:](self->_impressionableViewElements, "addObject:");
}

- (NSArray)impressionableViewElements
{
  return (NSArray *)-[NSMutableOrderedSet array](self->_impressionableViewElements, "array");
}

- (void)beginActiveImpressionForViewElement:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  NSObject *v8;
  double v9;
  dispatch_time_t v10;
  id v11;
  _QWORD handler[4];
  id v13;
  id v14;
  SUUIMetricsImpressionSession *v15;

  v4 = a3;
  objc_msgSend(v4, "appDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "impressionThreshold");
  if (v6 != 0.0 && objc_msgSend(v4, "isImpressionable"))
  {
    -[SUUIMetricsImpressionSession _getTimerForViewElement:](self, "_getTimerForViewElement:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {

    }
    else
    {
      v8 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
      objc_msgSend(v5, "impressionThreshold");
      v10 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
      dispatch_source_set_timer(v8, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __68__SUUIMetricsImpressionSession_beginActiveImpressionForViewElement___block_invoke;
      handler[3] = &unk_2511F4798;
      v13 = v5;
      v11 = v4;
      v14 = v11;
      v15 = self;
      dispatch_source_set_event_handler(v8, handler);
      -[SUUIMetricsImpressionSession _setTimer:forViewElement:](self, "_setTimer:forViewElement:", v8, v11);
      dispatch_resume(v8);

    }
  }

}

uint64_t __68__SUUIMetricsImpressionSession_beginActiveImpressionForViewElement___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v6[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordImpressionsForViewElements:", v3);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("SUUIMetricsImpressionNotification"), *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 48), "_clearTimerForViewElement:", *(_QWORD *)(a1 + 40));
}

- (void)endActiveImpressionForViewElement:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *source;

  v4 = a3;
  -[SUUIMetricsImpressionSession _getTimerForViewElement:](self, "_getTimerForViewElement:", v4);
  source = objc_claimAutoreleasedReturnValue();
  -[SUUIMetricsImpressionSession _clearTimerForViewElement:](self, "_clearTimerForViewElement:", v4);

  v5 = source;
  if (source)
  {
    dispatch_source_cancel(source);
    v5 = source;
  }

}

- (void)endAllPendingActiveImpression
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[SUUIMetricsImpressionSession _allViewElementsInTimerMap](self, "_allViewElementsInTimerMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[SUUIMetricsImpressionSession endActiveImpressionForViewElement:](self, "endActiveImpressionForViewElement:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (id)_allViewElementsInTimerMap
{
  return NSAllMapTableKeys(self->_impressionableViewElementsTimerMap);
}

- (id)_getTimerForViewElement:(id)a3
{
  return NSMapGet(self->_impressionableViewElementsTimerMap, a3);
}

- (void)_setTimer:(id)a3 forViewElement:(id)a4
{
  NSMapInsert(self->_impressionableViewElementsTimerMap, a4, a3);
}

- (void)_clearTimerForViewElement:(id)a3
{
  NSMapRemove(self->_impressionableViewElementsTimerMap, a3);
}

- (NSArray)impressionIdentifiers
{
  return &self->_impressionIdentifiers->super;
}

- (NSString)impressionsString
{
  return &self->_impressionsString->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impressionableViewElementsTimerMap, 0);
  objc_storeStrong((id *)&self->_impressionableViewElements, 0);
  objc_storeStrong((id *)&self->_impressionsString, 0);
  objc_storeStrong((id *)&self->_impressionIdentifiers, 0);
}

@end
