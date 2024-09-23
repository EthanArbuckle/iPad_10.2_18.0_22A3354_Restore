@implementation AEMessagesShelfRoundButton

- (void)_commonAEMessagesRoundButtonInitializationWithStyle:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  id v20;

  objc_msgSend((id)objc_opt_class(), "_imageForStyle:", a3);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[AEMessagesShelfRoundButton setImage:forState:](self, "setImage:forState:");
  objc_msgSend((id)objc_opt_class(), "preferredTapRegionSizeForStyle:", a3);
  v6 = v5;
  v8 = v7;
  objc_msgSend((id)objc_opt_class(), "intrinsicContentSizeForStyle:", a3);
  v11 = v9;
  v12 = v10;
  if ((unint64_t)(a3 - 1) >= 2)
  {
    v14 = 0.0;
    v13 = 0.0;
    v18 = 0.0;
    v19 = 0.0;
    if (!a3)
    {
      v18 = v6 + -4.0 - v11;
      v13 = v8 + -4.0 - v12;
      v14 = 4.0;
      v19 = 4.0;
    }
  }
  else
  {
    v13 = v8 + -3.0 - v10;
    v14 = v6 + -3.0 - v9;
    -[AEMessagesShelfRoundButton imageView](self, "imageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCornerRadius:", v11 * 0.5);

    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v17);

    v18 = 3.0;
    v19 = 3.0;
  }
  -[AEMessagesShelfRoundButton setImageEdgeInsets:](self, "setImageEdgeInsets:", v19, v18, v13, v14);

}

+ (id)roundButtonWithStyle:(int64_t)a3
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (a3 == 2)
  {
    +[AEMessagesShelfRoundButton buttonWithType:](AEMessagesShelfRoundButton, "buttonWithType:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = 2;
  }
  else if (a3 == 1)
  {
    +[AEMessagesShelfRoundButton buttonWithType:](AEMessagesShelfRoundButton, "buttonWithType:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = 1;
  }
  else
  {
    if (a3)
    {
      v4 = 0;
      return v4;
    }
    +[AEMessagesShelfRoundButton buttonWithType:](AEMessagesShelfRoundButton, "buttonWithType:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = 0;
  }
  objc_msgSend(v3, "_commonAEMessagesRoundButtonInitializationWithStyle:", v5);
  return v4;
}

+ (id)_imageForStyle:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  if (a3 == 2)
  {
    v6 = (void *)MEMORY[0x24BEBD640];
    AssetExplorerBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageNamed:inBundle:", CFSTR("share-iris-off"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v10 = (void *)v8;
    objc_msgSend(v7, "_flatImageWithColor:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  if (a3 == 1)
  {
    v9 = (void *)MEMORY[0x24BEBD640];
    AssetExplorerBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageNamed:inBundle:", CFSTR("share-iris-on"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (a3)
  {
    v5 = 0;
    return v5;
  }
  v3 = (void *)MEMORY[0x24BEBD640];
  AssetExplorerBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("Cancel-Button"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v5;
}

+ (CGSize)preferredTapRegionSizeForStyle:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 44.0;
  v4 = 44.0;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)intrinsicContentSizeForStyle:(int64_t)a3
{
  double v3;
  double v4;
  _QWORD v5[6];
  _QWORD block[6];
  CGSize result;

  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (a3)
    {
      v3 = *MEMORY[0x24BDBF148];
      v4 = *(double *)(MEMORY[0x24BDBF148] + 8);
    }
    else
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __59__AEMessagesShelfRoundButton_intrinsicContentSizeForStyle___block_invoke;
      block[3] = &__block_descriptor_48_e5_v8__0l;
      block[4] = a1;
      block[5] = 0;
      if (intrinsicContentSizeForStyle__onceToken != -1)
        dispatch_once(&intrinsicContentSizeForStyle__onceToken, block);
      v3 = *(double *)&intrinsicContentSizeForStyle__imageSize_0;
      v4 = *(double *)&intrinsicContentSizeForStyle__imageSize_1;
    }
  }
  else
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __59__AEMessagesShelfRoundButton_intrinsicContentSizeForStyle___block_invoke_2;
    v5[3] = &__block_descriptor_48_e5_v8__0l;
    v5[4] = a1;
    v5[5] = a3;
    if (intrinsicContentSizeForStyle__onceToken_9 != -1)
      dispatch_once(&intrinsicContentSizeForStyle__onceToken_9, v5);
    v3 = *(double *)&intrinsicContentSizeForStyle__imageSize_8_0 + -2.0;
    v4 = *(double *)&intrinsicContentSizeForStyle__imageSize_8_1 + -2.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

void __59__AEMessagesShelfRoundButton_intrinsicContentSizeForStyle___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_imageForStyle:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  intrinsicContentSizeForStyle__imageSize_0 = v1;
  intrinsicContentSizeForStyle__imageSize_1 = v2;

}

void __59__AEMessagesShelfRoundButton_intrinsicContentSizeForStyle___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_imageForStyle:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  intrinsicContentSizeForStyle__imageSize_8_0 = v1;
  intrinsicContentSizeForStyle__imageSize_8_1 = v2;

}

@end
