@implementation FLTelemetryAnalyticsController

- (void)captureActionForItem:(id)a3 withEvent:(unint64_t)a4 source:(unint64_t)a5
{
  void *v8;
  char v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "clientIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.followup.tests"));

  if ((v9 & 1) == 0)
  {
    v10 = CFSTR("other");
    v11 = CFSTR("other");
    if (a5 - 1 <= 3)
      v11 = off_1E6F1E588[a5 - 1];
    if (a4 == 2)
      v10 = CFSTR("userActivate");
    if (a4 == 1)
      v12 = CFSTR("userClear");
    else
      v12 = v10;
    -[FLTelemetryAnalyticsController _captureItem:event:source:](self, "_captureItem:event:source:", v13, v12, v11);
  }

}

- (void)captureCurrentState:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  const __CFString *v27;
  _QWORD v28[3];

  v28[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0CB3550]);
  objc_msgSend(v3, "fl_map:", &__block_literal_global_5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);

  v27 = CFSTR("all");
  v19 = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("_"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "countForObject:", v15));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __54__FLTelemetryAnalyticsController_captureCurrentState___block_invoke_2;
  v20[3] = &unk_1E6F1E540;
  v21 = v9;
  v18 = v9;
  +[FLTelemetryAnalyticsSender sendAnalyticsForEvent:builder:](FLTelemetryAnalyticsSender, "sendAnalyticsForEvent:builder:", CFSTR("com.apple.followup.groupCounts"), v20);

}

uint64_t __54__FLTelemetryAnalyticsController_captureCurrentState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "groupIdentifier");
}

id __54__FLTelemetryAnalyticsController_captureCurrentState___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)captureItemAddition:(id)a3
{
  -[FLTelemetryAnalyticsController _captureItem:event:source:](self, "_captureItem:event:source:", a3, CFSTR("clientPosted"), CFSTR("client"));
}

- (void)captureItemView:(id)a3
{
  -[FLTelemetryAnalyticsController _captureItem:event:source:](self, "_captureItem:event:source:", a3, CFSTR("viewed"), CFSTR("settings"));
}

- (void)captureItemRemoval:(id)a3
{
  -[FLTelemetryAnalyticsController _captureItem:event:source:](self, "_captureItem:event:source:", a3, CFSTR("clientCleared"), CFSTR("client"));
}

- (void)_captureItem:(id)a3 event:(id)a4 source:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__FLTelemetryAnalyticsController__captureItem_event_source___block_invoke;
  v13[3] = &unk_1E6F1E568;
  v14 = v7;
  v15 = v8;
  v16 = v9;
  v10 = v9;
  v11 = v8;
  v12 = v7;
  +[FLTelemetryAnalyticsSender sendAnalyticsForEvent:builder:](FLTelemetryAnalyticsSender, "sendAnalyticsForEvent:builder:", CFSTR("com.apple.followup.items"), v13);

}

id __60__FLTelemetryAnalyticsController__captureItem_event_source___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("identifier");
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v2;
  v13[1] = CFSTR("client");
  objc_msgSend(*(id *)(a1 + 32), "clientIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = CFSTR("none");
  v14[1] = v5;
  v13[2] = CFSTR("group");
  objc_msgSend(*(id *)(a1 + 32), "groupIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = CFSTR("none");
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v14[2] = v8;
  v14[3] = v9;
  v13[3] = CFSTR("type");
  v13[4] = CFSTR("source");
  v14[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
