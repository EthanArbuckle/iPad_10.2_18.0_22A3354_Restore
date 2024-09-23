@implementation NTKWorldClockGraphicCircularExtraLargeView

+ (id)_createHandsViewForDevice:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[NTKWorldClockRichComplicationHandsBaseView initForDevice:]([NTKWorldClockRichComplicationHandsExtraLargeView alloc], "initForDevice:", v3);

  return v4;
}

+ ($513C300AF4A6862D8B434F9A964F3546)_layoutConstantsForDevice:(SEL)a3
{
  id WeakRetained;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  CGSize v12;
  __int128 v13;
  $513C300AF4A6862D8B434F9A964F3546 *result;
  id obj;

  obj = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstantsExtraLarge___lock_2);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstantsExtraLarge___cachedDevice_2);
  if (!WeakRetained)
    goto LABEL_5;
  v6 = WeakRetained;
  v7 = objc_loadWeakRetained(&_LayoutConstantsExtraLarge___cachedDevice_2);
  if (v7 != obj)
  {

LABEL_5:
    v10 = objc_storeWeak(&_LayoutConstantsExtraLarge___cachedDevice_2, obj);
    _LayoutConstantsExtraLarge___previousCLKDeviceVersion_2 = objc_msgSend(obj, "version");

    ___LayoutConstantsExtraLarge_block_invoke_3(v11, obj);
    goto LABEL_6;
  }
  v8 = objc_msgSend(obj, "version");
  v9 = _LayoutConstantsExtraLarge___previousCLKDeviceVersion_2;

  if (v8 != v9)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstantsExtraLarge___lock_2);
  v12 = (CGSize)xmmword_1EF174460;
  *(_OWORD *)&retstr->var4 = xmmword_1EF174450;
  retstr->var6 = v12;
  retstr->var7 = (CGSize)xmmword_1EF174470;
  v13 = unk_1EF174440;
  *(_OWORD *)&retstr->var0 = _LayoutConstantsExtraLarge___constantsGraphicExtraLarge;
  *(_OWORD *)&retstr->var2 = v13;

  return result;
}

@end
