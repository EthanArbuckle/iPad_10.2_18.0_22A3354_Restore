@implementation NTKNoContentTemplateProvider

+ (id)templateForDisplayName:(id)a3 image:(id)a4 family:(int64_t)a5 device:(id)a6 sdkVersion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  void *v37;
  id v38;
  id v39;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = 0;
  switch(a5)
  {
    case 0:
      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0C944E8], "imageProviderWithOnePieceImage:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0C94438];
        goto LABEL_24;
      }
      NTKClockFaceLocalizedString(CFSTR("SMALL_MODULAR_NO_CONTENT"), CFSTR("--"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v17);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94440], "templateWithTextProvider:", v25);
      v26 = objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    case 1:
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "largeModularEmptyTextProvider");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C943F8], "templateWithHeaderTextProvider:body1TextProvider:", v17, v19);
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 2:
      objc_msgSend(MEMORY[0x1E0C944E8], "imageProviderWithOnePieceImage:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0C94488];
      goto LABEL_24;
    case 3:
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0C94460];
      goto LABEL_9;
    case 4:
      objc_msgSend(MEMORY[0x1E0C944E8], "imageProviderWithOnePieceImage:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0C941C0];
      goto LABEL_24;
    case 6:
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0C94468];
LABEL_9:
      objc_msgSend(v21, "templateWithTextProvider:", v17);
      v22 = objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 7:
      objc_msgSend(MEMORY[0x1E0C944E8], "imageProviderWithOnePieceImage:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0C94218];
      goto LABEL_24;
    case 8:
      NTKClockFaceLocalizedString(CFSTR("SIGNATURE_CONER_NO_DATA"), CFSTR("----"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v12);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v17);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C94300], "templateWithInnerTextProvider:outerTextProvider:", v27, v25);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_34;
      }
      objc_msgSend(MEMORY[0x1E0C944D8], "providerWithFullColorImage:monochromeFilterType:", v13, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94308], "templateWithTextProvider:imageProvider:", v23, v19);
      v24 = objc_claimAutoreleasedReturnValue();
LABEL_30:
      v16 = (void *)v24;

      goto LABEL_31;
    case 9:
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0C944D8], "providerWithFullColorImage:monochromeFilterType:", v13, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[NTKNoContentTemplateProvider graphicCircularEmptyImageForDevice:](NTKNoContentTemplateProvider, "graphicCircularEmptyImageForDevice:", v14);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C944D8], "providerWithFullColorImage:monochromeFilterType:applyScalingAndCircularMasking:", v28, 0, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0C94260], "templateWithImageProvider:", v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94238], "templateWithCircularTemplate:textProvider:", v23, v17);
      v24 = objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 10:
      if (!v13)
      {
        +[NTKNoContentTemplateProvider graphicCircularEmptyImageForDevice:](NTKNoContentTemplateProvider, "graphicCircularEmptyImageForDevice:", v14);
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x1E0C944D8], "providerWithFullColorImage:monochromeFilterType:applyScalingAndCircularMasking:", v13, 0, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0C94260];
      goto LABEL_24;
    case 11:
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0C944D8], "providerWithFullColorImage:monochromeFilterType:", v13, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C943A8], "templateWithTextProvider:imageProvider:", v17, v19);
        v20 = objc_claimAutoreleasedReturnValue();
LABEL_20:
        v16 = (void *)v20;
LABEL_31:

      }
      else
      {
        objc_msgSend(a1, "largeRectangularEmptyTextProviderForDevice:", v14);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C943C8], "templateWithHeaderTextProvider:body1TextProvider:", v17, v25);
        v26 = objc_claimAutoreleasedReturnValue();
LABEL_33:
        v16 = (void *)v26;
LABEL_34:

        v13 = 0;
      }
LABEL_35:

LABEL_36:
      objc_msgSend(v16, "setSDKVersionFromLS:", v15);
      v34 = MEMORY[0x1E0C809B0];
      v35 = 3221225472;
      v36 = __86__NTKNoContentTemplateProvider_templateForDisplayName_image_family_device_sdkVersion___block_invoke;
      v37 = &unk_1E6BD6048;
      v29 = v16;
      v38 = v29;
      v39 = v15;
      v30 = v15;
      objc_msgSend(v29, "enumerateEmbeddedTemplateKeysWithBlock:", &v34);
      objc_msgSend(v29, "finalize", v34, v35, v36, v37);
      v31 = v39;
      v32 = v29;

      return v32;
    case 12:
      if (!v13)
      {
        +[NTKNoContentTemplateProvider graphicExtraLargeCircularEmptyImageForDevice:](NTKNoContentTemplateProvider, "graphicExtraLargeCircularEmptyImageForDevice:", v14);
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x1E0C944D8], "providerWithFullColorImage:monochromeFilterType:applyScalingAndCircularMasking:", v13, 0, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0C94330];
LABEL_24:
      objc_msgSend(v18, "templateWithImageProvider:", v17);
      v22 = objc_claimAutoreleasedReturnValue();
LABEL_25:
      v16 = (void *)v22;
      goto LABEL_35;
    default:
      goto LABEL_36;
  }
}

void __86__NTKNoContentTemplateProvider_templateForDisplayName_image_family_device_sdkVersion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSDKVersionFromLS:", *(_QWORD *)(a1 + 40));

}

+ (id)largeModularEmptyTextProvider
{
  if (largeModularEmptyTextProvider_onceToken != -1)
    dispatch_once(&largeModularEmptyTextProvider_onceToken, &__block_literal_global_114);
  return (id)largeModularEmptyTextProvider___largeModularEmptyTextProvider;
}

void __61__NTKNoContentTemplateProvider_largeModularEmptyTextProvider__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  NTKClockFaceLocalizedString(CFSTR("LARGE_MODULAR_NO_CONTENT"), CFSTR("–––––––––––\n–––––––––––"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94500], "_dashTrackingTextProviderWithDashes:tracking:", v2, 305.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)largeModularEmptyTextProvider___largeModularEmptyTextProvider;
  largeModularEmptyTextProvider___largeModularEmptyTextProvider = v0;

}

+ (id)largeRectangularEmptyTextProviderForDevice:(id)a3
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&largeRectangularEmptyTextProviderForDevice____lock);
  WeakRetained = objc_loadWeakRetained(&largeRectangularEmptyTextProviderForDevice____cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained(&largeRectangularEmptyTextProviderForDevice____cachedDevice);
  if (v6 != v3)
  {

LABEL_5:
    v9 = objc_storeWeak(&largeRectangularEmptyTextProviderForDevice____cachedDevice, v3);
    largeRectangularEmptyTextProviderForDevice____previousCLKDeviceVersion = objc_msgSend(v3, "version");

    __75__NTKNoContentTemplateProvider_largeRectangularEmptyTextProviderForDevice___block_invoke();
    goto LABEL_6;
  }
  v7 = objc_msgSend(v3, "version");
  v8 = largeRectangularEmptyTextProviderForDevice____previousCLKDeviceVersion;

  if (v7 != v8)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&largeRectangularEmptyTextProviderForDevice____lock);
  v10 = (id)largeRectangularEmptyTextProviderForDevice____largeModularEmptyTextProvider;

  return v10;
}

void __75__NTKNoContentTemplateProvider_largeRectangularEmptyTextProviderForDevice___block_invoke()
{
  double v0;
  double v1;
  uint64_t v2;
  void *v3;
  id v4;

  CLKValueForDeviceMetrics();
  v1 = v0;
  NTKClockFaceLocalizedString(CFSTR("LARGE_RECTANGULAR_NO_CONTENT"), CFSTR("––––––––––––\n––––––––––––"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94500], "_dashTrackingTextProviderWithDashes:tracking:", v4, v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)largeRectangularEmptyTextProviderForDevice____largeModularEmptyTextProvider;
  largeRectangularEmptyTextProviderForDevice____largeModularEmptyTextProvider = v2;

}

+ (id)graphicCircularEmptyImageForDevice:(id)a3
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&graphicCircularEmptyImageForDevice____lock);
  WeakRetained = objc_loadWeakRetained(&graphicCircularEmptyImageForDevice____cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained(&graphicCircularEmptyImageForDevice____cachedDevice);
  if (v6 != v3)
  {

LABEL_5:
    v9 = objc_storeWeak(&graphicCircularEmptyImageForDevice____cachedDevice, v3);
    graphicCircularEmptyImageForDevice____previousCLKDeviceVersion = objc_msgSend(v3, "version");

    __67__NTKNoContentTemplateProvider_graphicCircularEmptyImageForDevice___block_invoke(v10, v3);
    goto LABEL_6;
  }
  v7 = objc_msgSend(v3, "version");
  v8 = graphicCircularEmptyImageForDevice____previousCLKDeviceVersion;

  if (v7 != v8)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&graphicCircularEmptyImageForDevice____lock);
  v11 = (id)graphicCircularEmptyImageForDevice__emptyImage;

  return v11;
}

void __67__NTKNoContentTemplateProvider_graphicCircularEmptyImageForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  uint64_t v8;
  void *v9;

  v2 = a2;
  v3 = NTKWhistlerSubdialComplicationDiameter(v2);
  CLKValueForDeviceMetrics();
  v5 = v4;
  objc_msgSend(v2, "screenScale");
  v7 = v6;

  _richCircularEmptyImage(v3, v5, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)graphicCircularEmptyImageForDevice__emptyImage;
  graphicCircularEmptyImageForDevice__emptyImage = v8;

}

+ (id)graphicExtraLargeCircularEmptyImageForDevice:(id)a3
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&graphicExtraLargeCircularEmptyImageForDevice____lock);
  WeakRetained = objc_loadWeakRetained(&graphicExtraLargeCircularEmptyImageForDevice____cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained(&graphicExtraLargeCircularEmptyImageForDevice____cachedDevice);
  if (v6 != v3)
  {

LABEL_5:
    v9 = objc_storeWeak(&graphicExtraLargeCircularEmptyImageForDevice____cachedDevice, v3);
    graphicExtraLargeCircularEmptyImageForDevice____previousCLKDeviceVersion = objc_msgSend(v3, "version");

    __77__NTKNoContentTemplateProvider_graphicExtraLargeCircularEmptyImageForDevice___block_invoke(v10, v3);
    goto LABEL_6;
  }
  v7 = objc_msgSend(v3, "version");
  v8 = graphicExtraLargeCircularEmptyImageForDevice____previousCLKDeviceVersion;

  if (v7 != v8)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&graphicExtraLargeCircularEmptyImageForDevice____lock);
  v11 = (id)graphicExtraLargeCircularEmptyImageForDevice__emptyImage;

  return v11;
}

void __77__NTKNoContentTemplateProvider_graphicExtraLargeCircularEmptyImageForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = NTKGraphicExtraLargeComplicationContentDiameter();
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", v2, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = &unk_1E6C9F8F8;
  v12[1] = &unk_1E6C9F910;
  v13[0] = &unk_1E6CA5128;
  v13[1] = &unk_1E6CA5128;
  v12[2] = &unk_1E6C9F928;
  v13[2] = &unk_1E6CA5138;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v5, 51.5);
  v7 = v6;

  objc_msgSend(v2, "screenScale");
  v9 = v8;

  _richCircularEmptyImage(v3, v7, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)graphicExtraLargeCircularEmptyImageForDevice__emptyImage;
  graphicExtraLargeCircularEmptyImageForDevice__emptyImage = v10;

}

@end
