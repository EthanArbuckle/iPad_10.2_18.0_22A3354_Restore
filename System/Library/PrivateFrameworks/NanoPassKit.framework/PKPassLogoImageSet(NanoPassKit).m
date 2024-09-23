@implementation PKPassLogoImageSet(NanoPassKit)

- (void)resizeWithScreenSize:()NanoPassKit pass:
{
  void *v8;
  _BOOL4 v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v34 = a5;
  v8 = (void *)MEMORY[0x2199B65AC]();
  v9 = NPKNewEventTicketDesignTreatment(v34);
  v10 = 21.0;
  if (v9)
    v10 = 30.0;
  objc_msgSend(MEMORY[0x24BE6EB68], "constraintsWithMaxSize:", a2 + -15.0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "logoImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resizedImage:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setLogoImage:", v13);

  objc_autoreleasePoolPop(v8);
  objc_msgSend(a1, "logoImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resizedImageToFit:", a2, a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setLogoImage:", v15);

  objc_msgSend(a1, "backgroundImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resizedImageToCover:", a2, a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setBackgroundImage:", v17);

  objc_msgSend(a1, "thumbnailImage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "resizedImageToFit:", a2, a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setThumbnailImage:", v19);

  objc_msgSend(a1, "stripImage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "resizedImageToFit:", a2, a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setStripImage:", v21);

  objc_msgSend(a1, "footerImage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "resizedImageToFit:", a2, a3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setFooterImage:", v23);

  objc_msgSend(a1, "bankLogoImage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "resizedImageToFit:", a2, a3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setBankLogoImage:", v25);

  objc_msgSend(a1, "networkLogoImage");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "resizedImageToFit:", a2, a3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setNetworkLogoImage:", v27);

  objc_msgSend(a1, "cobrandLogoImage");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "resizedImageToFit:", a2, a3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setCobrandLogoImage:", v29);

  objc_msgSend(a1, "cardBackgroundImage");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "resizedImageToFit:", a2, a3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setCardBackgroundImage:", v31);

  objc_msgSend(a1, "cardBackgroundCombinedImage");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "resizedImageToFit:", a2, a3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setCardBackgroundCombinedImage:", v33);

}

- (void)memoryMapImageData
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v2 = (void *)MEMORY[0x2199B65AC]();
  objc_msgSend(a1, "logoImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "npkImageByMemoryMappingDataWithTemporaryFilePrefix:", CFSTR("npkLogoImage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setLogoImage:", v4);

  objc_msgSend(a1, "backgroundImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "npkImageByMemoryMappingDataWithTemporaryFilePrefix:", CFSTR("npkLogoImage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setBackgroundImage:", v6);

  objc_msgSend(a1, "thumbnailImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "npkImageByMemoryMappingDataWithTemporaryFilePrefix:", CFSTR("npkLogoImage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setThumbnailImage:", v8);

  objc_msgSend(a1, "stripImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "npkImageByMemoryMappingDataWithTemporaryFilePrefix:", CFSTR("npkLogoImage"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setStripImage:", v10);

  objc_msgSend(a1, "footerImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "npkImageByMemoryMappingDataWithTemporaryFilePrefix:", CFSTR("npkLogoImage"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setFooterImage:", v12);

  objc_msgSend(a1, "bankLogoImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "npkImageByMemoryMappingDataWithTemporaryFilePrefix:", CFSTR("npkLogoImage"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setBankLogoImage:", v14);

  objc_msgSend(a1, "networkLogoImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "npkImageByMemoryMappingDataWithTemporaryFilePrefix:", CFSTR("npkLogoImage"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setNetworkLogoImage:", v16);

  objc_msgSend(a1, "cobrandLogoImage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "npkImageByMemoryMappingDataWithTemporaryFilePrefix:", CFSTR("npkLogoImage"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setCobrandLogoImage:", v18);

  objc_msgSend(a1, "cardBackgroundImage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "npkImageByMemoryMappingDataWithTemporaryFilePrefix:", CFSTR("npkLogoImage"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setCardBackgroundImage:", v20);

  objc_msgSend(a1, "cardBackgroundCombinedImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "npkImageByMemoryMappingDataWithTemporaryFilePrefix:", CFSTR("npkLogoImage"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setCardBackgroundCombinedImage:", v22);

  objc_autoreleasePoolPop(v2);
}

- (uint64_t)loadPDFArtFromBundle:()NanoPassKit
{
  return objc_msgSend(a1, "loadPDFArtFromBundle:targetSize:scale:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8), 1.0);
}

- (void)loadPDFArtFromBundle:()NanoPassKit targetSize:scale:
{
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  pk_General_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_General_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412290;
      v22 = v10;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Load PDF art from bundle: %@", (uint8_t *)&v21, 0xCu);
    }

  }
  v14 = *MEMORY[0x24BDBF148];
  v15 = *(double *)(MEMORY[0x24BDBF148] + 8);
  NPKGetPDFImageFromBundle(v10, (void *)*MEMORY[0x24BE6F4E0], *MEMORY[0x24BDBF148], v15, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(a1, "setBankLogoImage:", v16);

  NPKGetPDFImageFromBundle(v10, (void *)*MEMORY[0x24BE6F508], v14, v15, a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(a1, "setNetworkLogoImage:", v17);

  NPKGetPDFImageFromBundle(v10, (void *)*MEMORY[0x24BE6F4F8], v14, v15, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(a1, "setCobrandLogoImage:", v18);

  NPKGetPDFImageFromBundle(v10, (void *)*MEMORY[0x24BE6F4F0], a2, a3, a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    objc_msgSend(a1, "setCardBackgroundImage:", v19);

  NPKGetPDFImageFromBundle(v10, (void *)*MEMORY[0x24BE6F4E8], a2, a3, a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    objc_msgSend(a1, "setCardBackgroundCombinedImage:", v20);

}

- (BOOL)npkHasValidPaymentCardAssets
{
  void *v2;
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "cardBackgroundCombinedImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "cardBackgroundImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v3 = 1;
    }
    else
    {
      objc_msgSend(a1, "backgroundImage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v3 = 1;
      }
      else
      {
        objc_msgSend(a1, "cobrandLogoImage");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          v3 = 1;
        }
        else
        {
          objc_msgSend(a1, "bankLogoImage");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (v7)
          {
            v3 = 1;
          }
          else
          {
            objc_msgSend(a1, "logoImage");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            if (v8)
            {
              v3 = 1;
            }
            else
            {
              objc_msgSend(a1, "networkLogoImage");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              v3 = v9 != 0;

            }
          }

        }
      }

    }
  }

  return v3;
}

@end
