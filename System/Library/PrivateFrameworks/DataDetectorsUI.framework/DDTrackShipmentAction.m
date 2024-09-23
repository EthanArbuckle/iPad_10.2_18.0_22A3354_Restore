@implementation DDTrackShipmentAction

- (id)localizedName
{
  return DDLocalizedString(CFSTR("Track Shipment"));
}

- (id)iconName
{
  return CFSTR("cube.box");
}

- (id)quickActionTitle
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFArray *SubResults;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSDictionary objectForKeyedSubscript:](self->super._context, "objectForKeyedSubscript:", CFSTR("AllResults"), 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v4)
    goto LABEL_15;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v17;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v17 != v7)
      objc_enumerationMutation(v3);
    if (!DDResultHasType())
      goto LABEL_9;
    if (v6)
      break;
    v6 = 1;
LABEL_9:
    if (v5 == ++v8)
    {
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v5)
        goto LABEL_3;
      goto LABEL_15;
    }
  }
  if (DDResultHasType())
  {
    SubResults = (const __CFArray *)DDResultGetSubResults();
    if (CFArrayGetCount(SubResults) == 1)
    {
      CFArrayGetValueAtIndex(SubResults, 0);
      DDResultGetMatchedString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "invertedSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsSeparatedByCharactersInSet:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", &stru_1E4259460);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      return v14;
    }
  }
LABEL_15:

  -[DDTrackShipmentAction localizedName](self, "localizedName");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)performFromView:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[DDTrackShipmentAction notificationURL](self, "notificationURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[DDAction _performFromView:byOpeningURL:](self, "_performFromView:byOpeningURL:", v5, v4);

}

- (id)notificationTitle
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  DDLocalizedString(CFSTR("Track shipment “%@” in Safari"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v3, DDResultGetMatchedString());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)notificationIconBundleIdentifier
{
  return CFSTR("com.apple.mobilesafari");
}

- (id)notificationURL
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  if (!self->super._result)
    DDUILogAssertionFailure((uint64_t)"_result != NULL", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/MobileDataDetectorsUI/Actions/DDAction.m", (uint64_t)"-[DDTrackShipmentAction notificationURL]", 1660, CFSTR("Expecting a result"), v2, v3, v4, v6);
  return DDShipmentTrackingUrlForResult();
}

- (BOOL)canBePerformedByOpeningURL
{
  return 1;
}

@end
