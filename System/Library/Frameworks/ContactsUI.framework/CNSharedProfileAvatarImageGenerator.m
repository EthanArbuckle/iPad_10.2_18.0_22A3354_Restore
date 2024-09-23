@implementation CNSharedProfileAvatarImageGenerator

+ (id)sharedAvatarImageForNickname:(id)a3 contact:(id)a4 size:(CGSize)a5 isRTL:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;

  v6 = a6;
  height = a5.height;
  width = a5.width;
  v11 = a3;
  v12 = a4;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "nicknameProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "avatarImageFileURLForNickname:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fileManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dataWithContentsOfURL:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "value");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      v22 = v20;
    }
    else
    {
      objc_msgSend(a1, "fallbackImageForNickname:contact:size:isRTL:", v11, v12, v6, width, height);
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    v23 = v22;

  }
  else
  {
    objc_msgSend(a1, "fallbackImageForNickname:contact:size:isRTL:", v11, v12, v6, width, height);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

+ (id)fallbackImageForNickname:(id)a3 contact:(id)a4 size:(CGSize)a5 isRTL:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  id v9;
  CNAvatarImageRenderer *v10;
  void *v11;
  CNAvatarImageRenderer *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;

  v6 = a6;
  height = a5.height;
  width = a5.width;
  v9 = a4;
  if (objc_msgSend(v9, "isUsingSharedPhoto"))
  {
    v10 = [CNAvatarImageRenderer alloc];
    +[CNAvatarImageRendererSettings defaultSettings](CNAvatarImageRendererSettings, "defaultSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CNAvatarImageRenderer initWithSettings:](v10, "initWithSettings:", v11);

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");
    +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", v6, 0, width, height, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNAvatarImageRenderer renderMonogramForContact:color:scope:prohibitedSources:](v12, "renderMonogramForContact:color:scope:prohibitedSources:", v9, 0, v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end
