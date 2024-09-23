@implementation HKOverlayPillValueProvidingFactory

+ (id)overlayPillValueProviderForDisplayType:(id)a3 selectedRangeFormatter:(id)a4 interfaceLayout:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  __objc2_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HKOverlayRoomPillValueProviderCurrentValue *v18;
  HKOverlayRoomPillValueProviderCurrentValue *v19;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "behavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "chartsRelativeData");

  if (v10)
  {
    v11 = HKOverlayRoomPillValueProviderRelativeData;
LABEL_10:
    v18 = (HKOverlayRoomPillValueProviderCurrentValue *)objc_alloc_init(v11);
    goto LABEL_11;
  }
  objc_msgSend(v7, "objectType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)*MEMORY[0x1E0CB4980];

  if (v13 == v14)
  {
    v11 = HKOverlayRoomPillValueProviderSleep;
    goto LABEL_10;
  }
  objc_msgSend(v7, "objectType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)*MEMORY[0x1E0CB7148];

  if (v16 == v17)
  {
    v11 = HKOverlayRoomPillValueProviderBalance;
    goto LABEL_10;
  }
  if (!v8)
  {
    v11 = HKOverlayPillValueProvider;
    goto LABEL_10;
  }
  v18 = -[HKOverlayRoomPillValueProviderCurrentValue initWithSelectedRangeFormatter:interfaceLayout:]([HKOverlayRoomPillValueProviderCurrentValue alloc], "initWithSelectedRangeFormatter:interfaceLayout:", v8, a5);
LABEL_11:
  v19 = v18;

  return v19;
}

+ (int64_t)interfaceLayoutForController:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a3, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "effectiveUserInterfaceLayoutDirection");

  return v4;
}

@end
