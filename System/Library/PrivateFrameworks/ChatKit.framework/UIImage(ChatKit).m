@implementation UIImage(ChatKit)

+ (id)ck_imageWithEmoji:()ChatKit
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v3 = (objc_class *)MEMORY[0x1E0CEA700];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setText:", v4);

  objc_msgSend(v5, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 75.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  objc_msgSend(v5, "sizeToFit");
  v7 = objc_alloc(MEMORY[0x1E0CEA610]);
  objc_msgSend(v5, "bounds");
  v10 = (void *)objc_msgSend(v7, "initWithSize:", v8, v9);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __38__UIImage_ChatKit__ck_imageWithEmoji___block_invoke;
  v14[3] = &unk_1E274A3D0;
  v15 = v5;
  v11 = v5;
  objc_msgSend(v10, "imageWithActions:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
