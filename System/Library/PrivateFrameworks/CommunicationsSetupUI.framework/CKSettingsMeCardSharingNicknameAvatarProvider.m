@implementation CKSettingsMeCardSharingNicknameAvatarProvider

- (CKSettingsMeCardSharingNicknameAvatarProvider)initWithImageData:(id)a3
{
  id v5;
  CKSettingsMeCardSharingNicknameAvatarProvider *v6;
  CKSettingsMeCardSharingNicknameAvatarProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKSettingsMeCardSharingNicknameAvatarProvider;
  v6 = -[CKSettingsMeCardSharingNicknameAvatarProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_imageData, a3);

  return v7;
}

- (void)generateAvatarImageOfSize:(CGSize)a3 imageHandler:(id)a4
{
  double height;
  double width;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(id, void *, _QWORD);
  CGSize v15;

  height = a3.height;
  width = a3.width;
  v14 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;

  v10 = (void *)MEMORY[0x24BEBD640];
  -[CKSettingsMeCardSharingNicknameAvatarProvider imageData](self, "imageData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageWithData:scale:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (width == *MEMORY[0x24BDBF148] && height == *(double *)(MEMORY[0x24BDBF148] + 8))
    {
      height = 100.0;
      width = 100.0;
    }
    v15.width = width;
    v15.height = height;
    UIGraphicsBeginImageContextWithOptions(v15, 0, v9);
    objc_msgSend(v12, "drawInRect:", 0.0, 0.0, width, height);
    UIGraphicsGetImageFromCurrentImageContext();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }
  else
  {
    v13 = 0;
  }
  v14[2](v14, v13, 0);

}

- (NSData)imageData
{
  return self->_imageData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end
