@implementation CFXAnalyticsManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8 != -1)
    dispatch_once(&sharedInstance_onceToken_8, &__block_literal_global_42);
  return (id)sharedInstance_analyticsManager;
}

void __37__CFXAnalyticsManager_sharedInstance__block_invoke()
{
  CFXAnalyticsManager *v0;
  void *v1;

  v0 = objc_alloc_init(CFXAnalyticsManager);
  v1 = (void *)sharedInstance_analyticsManager;
  sharedInstance_analyticsManager = (uint64_t)v0;

}

- (CFXAnalyticsManager)init
{
  CFXAnalyticsManager *v2;
  NSMutableArray *v3;
  NSMutableArray *analyticsDurationData_queryDataQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *queryDataQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CFXAnalyticsManager;
  v2 = -[JFXAnalyticsManager init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    analyticsDurationData_queryDataQueue = v2->_analyticsDurationData_queryDataQueue;
    v2->_analyticsDurationData_queryDataQueue = v3;

    v5 = dispatch_queue_create("com.apple.clips.CFXAnalyticsManager.queryDataQueue", MEMORY[0x24BDAC9C0]);
    queryDataQueue = v2->_queryDataQueue;
    v2->_queryDataQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (BOOL)checkIfEventExistsWithName:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  +[CFXAnalyticsKeys allEventNames](CFXAnalyticsKeys, "allEventNames", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i)) & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)addAnalyticsDurationData:(id)a3
{
  id v4;
  NSObject *queryDataQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queryDataQueue = self->_queryDataQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__CFXAnalyticsManager_addAnalyticsDurationData___block_invoke;
  v7[3] = &unk_24EE57AA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(queryDataQueue, v7);

}

void __48__CFXAnalyticsManager_addAnalyticsDurationData___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "analyticsDurationData_queryDataQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (void)removeAnalyticsDurationDataItems:(id)a3
{
  id v4;
  NSObject *queryDataQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queryDataQueue = self->_queryDataQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__CFXAnalyticsManager_removeAnalyticsDurationDataItems___block_invoke;
  v7[3] = &unk_24EE57AA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(queryDataQueue, v7);

}

void __56__CFXAnalyticsManager_removeAnalyticsDurationDataItems___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "analyticsDurationData_queryDataQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectsInArray:", *(_QWORD *)(a1 + 40));

}

- (id)analyticsDurationData
{
  NSObject *queryDataQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__17;
  v10 = __Block_byref_object_dispose__17;
  v11 = 0;
  queryDataQueue = self->_queryDataQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__CFXAnalyticsManager_analyticsDurationData__block_invoke;
  v5[3] = &unk_24EE57A80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queryDataQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__CFXAnalyticsManager_analyticsDurationData__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "analyticsDurationData_queryDataQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)dictionaryWithEventName:(id)a3 value:(double)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v12[0] = a3;
  v11[0] = CFSTR("AnalyticsEventNameKey");
  v11[1] = CFSTR("AnalyticsEventCountOrDurationValueKey");
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a3;
  objc_msgSend(v5, "numberWithDouble:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  v11[2] = CFSTR("AnalyticsEventTimeStampKey");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)trackEventWithName:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[CFXAnalyticsManager checkIfEventExistsWithName:](self, "checkIfEventExistsWithName:"))
  {
    -[JFXAnalyticsManager fullKeyFromEvent:](self, "fullKeyFromEvent:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXAnalyticsManager trackKey:withCount:](self, "trackKey:withCount:", v4, 1);

  }
}

- (void)trackEventWithName:(id)a3 count:(unint64_t)a4
{
  _BOOL4 v6;
  id v7;

  v7 = a3;
  v6 = -[CFXAnalyticsManager checkIfEventExistsWithName:](self, "checkIfEventExistsWithName:");
  if (a4 && v6)
    -[CFXAnalyticsManager persistAnalyticsDataWithEventName:value:](self, "persistAnalyticsDataWithEventName:value:", v7, (double)-[CFXAnalyticsManager roundWithNumber:](self, "roundWithNumber:", a4));

}

- (void)trackEventWithName:(id)a3 duration:(double)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if (-[CFXAnalyticsManager checkIfEventExistsWithName:](self, "checkIfEventExistsWithName:"))
  {
    -[JFXAnalyticsManager fullKeyFromEvent:](self, "fullKeyFromEvent:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXAnalyticsManager trackKey:withDuration:](self, "trackKey:withDuration:", v6, a4);

  }
}

- (void)trackEventWithName:(id)a3 supportsHDR:(BOOL)a4 isHDR:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  id v9;

  v5 = a5;
  v6 = a4;
  v9 = a3;
  if (-[CFXAnalyticsManager checkIfEventExistsWithName:](self, "checkIfEventExistsWithName:"))
  {
    -[JFXAnalyticsManager fullKeyFromEvent:](self, "fullKeyFromEvent:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXAnalyticsManager trackKey:supportsHDR:isHDR:](self, "trackKey:supportsHDR:isHDR:", v8, v6, v5);

  }
}

- (unint64_t)roundWithNumber:(unint64_t)a3
{
  unint64_t result;

  result = a3;
  if (a3 >= 6)
    return 5 * (a3 / 5);
  return result;
}

- (void)trackKey:(id)a3 withEffectId:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v10 = CFSTR("effectID");
  v11[0] = a4;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[JFXAnalyticsManager trackKey:withPayload:](self, "trackKey:withPayload:", v8, v9);
}

- (void)trackKey:(id)a3 withDuration:(double)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v10 = CFSTR("duration");
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a3;
  objc_msgSend(v6, "numberWithDouble:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[JFXAnalyticsManager trackKey:withPayload:](self, "trackKey:withPayload:", v7, v9);
}

- (void)trackKey:(id)a3 supportsHDR:(BOOL)a4 isHDR:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v5 = a5;
  v6 = a4;
  v15[3] = *MEMORY[0x24BDAC8D0];
  v14[0] = CFSTR("itemCount");
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = a3;
  objc_msgSend(v8, "numberWithInteger:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v14[1] = CFSTR("deviceSupportsHDR");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v11;
  v14[2] = CFSTR("exportedMediaIsHDR");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[JFXAnalyticsManager trackKey:withPayload:](self, "trackKey:withPayload:", v9, v13);
}

- (void)trackShapeWithEffectId:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[JFXAnalyticsManager fullKeyFromEvent:](self, "fullKeyFromEvent:", CFSTR("shapeusedwithid"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CFXAnalyticsManager trackKey:withEffectId:](self, "trackKey:withEffectId:", v5, v4);

}

- (void)trackEmojiStickerWithEffectId:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[JFXAnalyticsManager fullKeyFromEvent:](self, "fullKeyFromEvent:", CFSTR("emojistickerusedwithid"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CFXAnalyticsManager trackKey:withEffectId:](self, "trackKey:withEffectId:", v5, v4);

}

- (void)trackFilterWithEffectId:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[JFXAnalyticsManager fullKeyFromEvent:](self, "fullKeyFromEvent:", CFSTR("filterusedwithid"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CFXAnalyticsManager trackKey:withEffectId:](self, "trackKey:withEffectId:", v5, v4);

}

- (void)trackLabelWithEffectId:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[JFXAnalyticsManager fullKeyFromEvent:](self, "fullKeyFromEvent:", CFSTR("labelusedwithid"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CFXAnalyticsManager trackKey:withEffectId:](self, "trackKey:withEffectId:", v5, v4);

}

- (void)trackMessagesStickerWithEffectId:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[JFXAnalyticsManager fullKeyFromEvent:](self, "fullKeyFromEvent:", CFSTR("messagesstickerusedwithid"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CFXAnalyticsManager trackKey:withEffectId:](self, "trackKey:withEffectId:", v5, v4);

}

- (void)trackAnimojiWithEffectId:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[JFXAnalyticsManager fullKeyFromEvent:](self, "fullKeyFromEvent:", CFSTR("animojiusedwithid"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CFXAnalyticsManager trackKey:withEffectId:](self, "trackKey:withEffectId:", v5, v4);

}

- (void)trackEffect:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "jtEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  switch(v4)
  {
    case 7:
      +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "jtEffect");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "effectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trackAnimojiWithEffectId:", v7);
      goto LABEL_6;
    case 2:
      objc_msgSend(v18, "jtEffect");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "effectID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      +[CFXEffectType effectTypeWithIdentifier:](CFXEffectType, "effectTypeWithIdentifier:", CFSTR("Shapes"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[CFXEffect effectIdentifiersForEffectType:](CFXEffect, "effectIdentifiersForEffectType:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v8) = objc_msgSend(v10, "containsObject:", v5);

      +[CFXEffectType effectTypeWithIdentifier:](CFXEffectType, "effectTypeWithIdentifier:", CFSTR("Text"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[CFXEffect effectIdentifiersForEffectType:](CFXEffect, "effectIdentifiersForEffectType:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsObject:", v5);

      v14 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE79468]);
      +[CFXEffectType effectTypeWithIdentifier:](CFXEffectType, "effectTypeWithIdentifier:", CFSTR("EmojiStickers"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[CFXEffect effectIdentifiersForEffectType:](CFXEffect, "effectIdentifiersForEffectType:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "containsObject:", v5);

      if ((_DWORD)v8)
      {
        +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "trackShapeWithEffectId:", v5);
      }
      else if (v13)
      {
        +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "trackLabelWithEffectId:", v5);
      }
      else if (v14)
      {
        +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "trackMessagesStickerWithEffectId:", v5);
      }
      else
      {
        if (!v17)
        {
LABEL_16:

          break;
        }
        +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "trackEmojiStickerWithEffectId:", v5);
      }
LABEL_15:

      goto LABEL_16;
    case 1:
      +[CFXAnalyticsManager sharedInstance](CFXAnalyticsManager, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "jtEffect");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "effectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trackFilterWithEffectId:", v7);
LABEL_6:

      goto LABEL_15;
  }

}

- (id)CFX_composedAnalyticsKeyWithAnimoji:(BOOL)a3 video:(BOOL)a4 frontCamera:(BOOL)a5 effectType:(id)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  __CFString **v13;
  void *v14;
  void *v15;
  __CFString **v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v6 = a5;
  v7 = a4;
  v8 = a3;
  v9 = a6;
  v10 = CFSTR("funcam");
  v11 = v10;
  if (v8)
  {
    -[__CFString stringByAppendingString:](v10, "stringByAppendingString:", CFSTR("animoji"));
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  v13 = kAnalyticsEventAssembleKeyVideo;
  if (!v7)
    v13 = kAnalyticsEventAssembleKeyPhoto;
  objc_msgSend(v11, "stringByAppendingString:", *v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "stringByAppendingString:", CFSTR("sent"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v16 = kAnalyticsEventAssembleKeyFrontCamera;
    if (!v6)
      v16 = kAnalyticsEventAssembleKeyBackCamera;
    objc_msgSend(v15, "stringByAppendingString:", *v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v17;
  }
  objc_msgSend(v15, "stringByAppendingString:", CFSTR("with"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "stringByAppendingString:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)trackMediaSentWithAnimoji:(BOOL)a3 video:(BOOL)a4 frontCamera:(BOOL)a5 filterCount:(unint64_t)a6 labelCount:(unint64_t)a7 messagesStickerCount:(unint64_t)a8 shapeCount:(unint64_t)a9 emojiStickerCount:(unint64_t)a10 supportsHDR:(BOOL)a11 isHDR:(BOOL)a12
{
  _BOOL8 v13;
  _BOOL8 v14;
  _BOOL8 v15;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v13 = a5;
  v14 = a4;
  v15 = a3;
  v17 = a11;
  v19 = a9;
  v18 = a10;
  if (a6)
  {
    -[CFXAnalyticsManager CFX_composedAnalyticsKeyWithAnimoji:video:frontCamera:effectType:](self, "CFX_composedAnalyticsKeyWithAnimoji:video:frontCamera:effectType:", a3, a4, a5, CFSTR("filter"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXAnalyticsManager fullKeyFromEvent:](self, "fullKeyFromEvent:", v21);
    v22 = a7;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXAnalyticsManager trackKey:withCount:](self, "trackKey:withCount:", v23, a6);

    a7 = v22;
    v17 = a11;
    v18 = a10;
    v19 = a9;

  }
  if (a7)
  {
    -[CFXAnalyticsManager CFX_composedAnalyticsKeyWithAnimoji:video:frontCamera:effectType:](self, "CFX_composedAnalyticsKeyWithAnimoji:video:frontCamera:effectType:", v15, v14, v13, CFSTR("label"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXAnalyticsManager fullKeyFromEvent:](self, "fullKeyFromEvent:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXAnalyticsManager trackKey:withCount:](self, "trackKey:withCount:", v25, a7);

  }
  if (a8)
  {
    -[CFXAnalyticsManager CFX_composedAnalyticsKeyWithAnimoji:video:frontCamera:effectType:](self, "CFX_composedAnalyticsKeyWithAnimoji:video:frontCamera:effectType:", v15, v14, v13, CFSTR("messagessticker"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXAnalyticsManager fullKeyFromEvent:](self, "fullKeyFromEvent:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXAnalyticsManager trackKey:withCount:](self, "trackKey:withCount:", v27, a8);

  }
  if (v19)
  {
    -[CFXAnalyticsManager CFX_composedAnalyticsKeyWithAnimoji:video:frontCamera:effectType:](self, "CFX_composedAnalyticsKeyWithAnimoji:video:frontCamera:effectType:", v15, v14, v13, CFSTR("shape"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXAnalyticsManager fullKeyFromEvent:](self, "fullKeyFromEvent:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXAnalyticsManager trackKey:withCount:](self, "trackKey:withCount:", v29, v19);

  }
  if (v18)
  {
    -[CFXAnalyticsManager CFX_composedAnalyticsKeyWithAnimoji:video:frontCamera:effectType:](self, "CFX_composedAnalyticsKeyWithAnimoji:video:frontCamera:effectType:", v15, v14, v13, CFSTR("emojiSticker"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXAnalyticsManager fullKeyFromEvent:](self, "fullKeyFromEvent:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXAnalyticsManager trackKey:withCount:](self, "trackKey:withCount:", v31, v18);

  }
  if (v14)
    -[CFXAnalyticsManager trackEventWithName:supportsHDR:isHDR:](self, "trackEventWithName:supportsHDR:isHDR:", CFSTR("sentpostcapturewithfuncamvideo"), v17, a12);
  else
    -[CFXAnalyticsManager trackEventWithName:](self, "trackEventWithName:", CFSTR("sentpostcapturewithfuncamphoto"));
}

- (void)startTrackingTimeIntervalEventWithName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  CFXAnalyticsManager *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[CFXAnalyticsManager checkIfEventExistsWithName:](self, "checkIfEventExistsWithName:", v4))
  {
    v15 = mach_absolute_time();
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v17 = self;
    -[CFXAnalyticsManager analyticsDurationData](self, "analyticsDurationData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AnalyticsEventNameKey"), v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v4);

          if (v13)
            objc_msgSend(v5, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }
    -[CFXAnalyticsManager removeAnalyticsDurationDataItems:](v17, "removeAnalyticsDurationDataItems:", v5, v15);
    -[CFXAnalyticsManager dictionaryWithEventName:value:](v17, "dictionaryWithEventName:value:", v4, (double)v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXAnalyticsManager addAnalyticsDurationData:](v17, "addAnalyticsDurationData:", v14);

  }
}

- (void)stopTrackingTimeIntervalEventWithName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  void *v18;
  uint64_t v19;
  CFXAnalyticsManager *v20;
  mach_timebase_info info;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[CFXAnalyticsManager checkIfEventExistsWithName:](self, "checkIfEventExistsWithName:", v4))
  {
    v19 = mach_absolute_time();
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v20 = self;
    -[CFXAnalyticsManager analyticsDurationData](self, "analyticsDurationData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AnalyticsEventNameKey"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v4);

          if (v13)
            objc_msgSend(v5, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v8);
    }
    if (objc_msgSend(v5, "count"))
    {
      if ((unint64_t)objc_msgSend(v5, "count") < 2)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("AnalyticsEventCountOrDurationValueKey"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "unsignedLongLongValue");

        info = 0;
        mach_timebase_info(&info);
        v17 = (double)((v19 - v16) * info.numer / info.denom) / 1000000000.0;
        -[JFXAnalyticsManager fullKeyFromEvent:](v20, "fullKeyFromEvent:", v4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[CFXAnalyticsManager trackKey:withDuration:](v20, "trackKey:withDuration:", v18, v17);

      }
      -[CFXAnalyticsManager removeAnalyticsDurationDataItems:](v20, "removeAnalyticsDurationDataItems:", v5);
    }

  }
}

- (void)startTrackingPickerWithIdentifier:(id)a3
{
  id v4;
  CFXPickerSession *v5;
  void *v6;
  CFXPickerSession *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [CFXPickerSession alloc];
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CFXPickerSession initWithIdentifier:isCompact:](v5, "initWithIdentifier:isCompact:", v4, objc_msgSend(v6, "userInterfaceIdiom") == 0);
  -[CFXAnalyticsManager setCurrentPickerSession:](self, "setCurrentPickerSession:", v7);

  -[JFXAnalyticsManager fullKeyFromEvent:](self, "fullKeyFromEvent:", CFSTR("pickerselected"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("identifier");
  -[CFXAnalyticsManager CFX_allowedPickerIdentifier:](self, "CFX_allowedPickerIdentifier:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXAnalyticsManager trackKey:withPayload:](self, "trackKey:withPayload:", v8, v10);

}

- (void)pickerDidChangePresentationMode
{
  id v2;

  -[CFXAnalyticsManager currentPickerSession](self, "currentPickerSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didChangePresentationMode");

}

- (void)pickerDidScroll
{
  id v2;

  -[CFXAnalyticsManager currentPickerSession](self, "currentPickerSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDidScroll:", 1);

}

- (void)didSelectEffectOfType:(id)a3 effectIsNone:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[CFXAnalyticsManager currentPickerSession](self, "currentPickerSession");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didModifyEffectOfType:wasRemoval:", v6, v4);

}

- (void)stopTrackingPickerWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  const __CFString *v42;
  void *v43;
  _QWORD v44[4];
  _QWORD v45[4];
  _QWORD v46[3];
  _QWORD v47[5];

  v47[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CFXAnalyticsManager currentPickerSession](self, "currentPickerSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pickerBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  if ((v7 & 1) != 0)
  {
    -[CFXAnalyticsManager currentPickerSession](self, "currentPickerSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "didDismiss");

    -[CFXAnalyticsManager currentPickerSession](self, "currentPickerSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sessionDuration");
    v11 = v10;

    -[CFXAnalyticsManager currentPickerSession](self, "currentPickerSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isCompactPresentation");

    -[CFXAnalyticsManager currentPickerSession](self, "currentPickerSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "compactPresentationDuration");
    v16 = v15;

    -[CFXAnalyticsManager currentPickerSession](self, "currentPickerSession");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "expandedPresentationDuration");
    v19 = v18;

    -[CFXAnalyticsManager currentPickerSession](self, "currentPickerSession");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v20, "didScroll");

    -[CFXAnalyticsManager currentPickerSession](self, "currentPickerSession");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "effectChangesDict");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "objectForKey:", CFSTR("DidChangeEffectsKey"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "BOOLValue");

    objc_msgSend(v22, "objectForKey:", CFSTR("DidRemoveEffectsKey"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "BOOLValue");

    v46[0] = CFSTR("identifier");
    -[CFXAnalyticsManager CFX_allowedPickerIdentifier:](self, "CFX_allowedPickerIdentifier:", v4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v27;
    v46[1] = CFSTR("sessionDuration");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v28;
    v46[2] = CFSTR("didModifyEffectsStack");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v24);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v29;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[JFXAnalyticsManager fullKeyFromEvent:](self, "fullKeyFromEvent:", CFSTR("pickerdismissed"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXAnalyticsManager trackKey:withPayload:](self, "trackKey:withPayload:", v31, v30);

    if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.FunCamera.Filters")))
    {
      v44[0] = CFSTR("wasCompactWhenDismissed");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v13);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v32;
      v44[1] = CFSTR("compactDuration");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v45[1] = v33;
      v44[2] = CFSTR("expandedDuration");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v19);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v45[2] = v34;
      v44[3] = CFSTR("didScroll");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v41);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v45[3] = v35;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 4);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      -[JFXAnalyticsManager fullKeyFromEvent:](self, "fullKeyFromEvent:", CFSTR("internalpickerdismissed"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXAnalyticsManager trackKey:withPayload:](self, "trackKey:withPayload:", v37, v36);

    }
    if (v26)
    {
      objc_msgSend(v22, "objectForKey:", CFSTR("RemovedEffectTypeKey"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXAnalyticsManager fullKeyFromEvent:](self, "fullKeyFromEvent:", CFSTR("usedpickertoremoveeffect"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = CFSTR("effectTypeIdentifier");
      v43 = v38;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXAnalyticsManager trackKey:withPayload:](self, "trackKey:withPayload:", v39, v40);

    }
    -[CFXAnalyticsManager setCurrentPickerSession:](self, "setCurrentPickerSession:", 0);

  }
  else
  {
    -[CFXAnalyticsManager setCurrentPickerSession:](self, "setCurrentPickerSession:", 0);
  }

}

- (void)persistAnalyticsDataWithEventName:(id)a3 value:(double)a4
{
  id v6;

  -[JFXAnalyticsManager fullKeyFromEvent:](self, "fullKeyFromEvent:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXAnalyticsManager trackKey:withCount:](self, "trackKey:withCount:", v6, (unint64_t)a4);

}

- (BOOL)isIncrementScalar:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  char v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  +[CFXAnalyticsKeys allIncrementScalarEffectEvents](CFXAnalyticsKeys, "allIncrementScalarEffectEvents", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }

  +[CFXAnalyticsKeys allIncrementScalarEvents](CFXAnalyticsKeys, "allIncrementScalarEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "containsObject:", v3);
LABEL_11:

  return v9;
}

- (BOOL)isDistribution:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[CFXAnalyticsKeys allDistributionEvents](CFXAnalyticsKeys, "allDistributionEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (id)CFX_allowedPickerIdentifier:(id)a3
{
  __CFString *v3;

  v3 = (__CFString *)a3;
  if ((-[__CFString hasPrefix:](v3, "hasPrefix:", CFSTR("com.apple.")) & 1) == 0)
  {

    v3 = CFSTR("unknown");
  }
  return v3;
}

- (NSMutableArray)analyticsDurationData_queryDataQueue
{
  return self->_analyticsDurationData_queryDataQueue;
}

- (void)setAnalyticsDurationData_queryDataQueue:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsDurationData_queryDataQueue, a3);
}

- (CFXPickerSession)currentPickerSession
{
  return self->_currentPickerSession;
}

- (void)setCurrentPickerSession:(id)a3
{
  objc_storeStrong((id *)&self->_currentPickerSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPickerSession, 0);
  objc_storeStrong((id *)&self->_analyticsDurationData_queryDataQueue, 0);
  objc_storeStrong((id *)&self->_queryDataQueue, 0);
}

@end
