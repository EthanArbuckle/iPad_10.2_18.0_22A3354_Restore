@implementation INImage(IntentsUI)

- (void)fetchUIImageWithCompletion:()IntentsUI
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  void (**v43)(id, void *);

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "_imageData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(a1, "_imageData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "imageWithData:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v8);

LABEL_4:
      goto LABEL_20;
    }
    objc_msgSend(a1, "_name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(a1, "_uri");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
        goto LABEL_20;
      objc_msgSend(a1, "_uri");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isFileURL");

      if (!v29)
      {
        objc_msgSend(MEMORY[0x1E0CB39F0], "sharedSession");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_uri");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __49__INImage_IntentsUI__fetchUIImageWithCompletion___block_invoke;
        v42[3] = &unk_1EA43A8F0;
        v43 = v4;
        objc_msgSend(v39, "dataTaskWithURL:completionHandler:", v40, v42);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v41, "resume");
        goto LABEL_20;
      }
      v30 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(a1, "_uri");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "absoluteString");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "imageWithContentsOfFile:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v32);

      goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_bundleIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(a1, "_bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqualToString:", v14);

      if ((v15 & 1) == 0)
      {
        v16 = (void *)MEMORY[0x1E0CA5890];
        objc_msgSend(a1, "_bundleIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "bundleProxyForIdentifier:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = (void *)MEMORY[0x1E0CB34D0];
        objc_msgSend(v18, "bundleURL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "path");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "bundleWithPath:", v21);
        v22 = objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          v23 = (void *)MEMORY[0x1E0CB34D0];
          objc_msgSend(a1, "_bundleIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "bundleWithIdentifier:", v24);
          v22 = objc_claimAutoreleasedReturnValue();

        }
        v10 = (void *)v22;
      }
    }
    objc_msgSend(a1, "_bundleIdentifier");
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = (void *)v25;
    }
    else
    {
      objc_msgSend(a1, "_bundlePath");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v33)
      {
LABEL_19:
        v36 = (void *)MEMORY[0x1E0CEA638];
        objc_msgSend(a1, "_name");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "imageNamed:inBundle:compatibleWithTraitCollection:", v37, v10, 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v38);

        goto LABEL_20;
      }
      v34 = (void *)MEMORY[0x1E0CB34D0];
      objc_msgSend(a1, "_bundlePath");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "bundleWithPath:", v26);
      v35 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v35;
    }

    goto LABEL_19;
  }
LABEL_20:

}

+ (id)imageWithCGImage:()IntentsUI
{
  void *v4;
  CGDataProvider *DataProvider;
  CFDataRef v6;
  void *v7;
  double Width;

  v4 = (void *)MEMORY[0x1E0CBD958];
  DataProvider = CGImageGetDataProvider(image);
  v6 = CGDataProviderCopyData(DataProvider);
  objc_msgSend(v4, "imageWithImageData:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  Width = (double)CGImageGetWidth(image);
  objc_msgSend(v7, "_setImageSize:", Width, (double)CGImageGetHeight(image));
  return v7;
}

+ (id)imageWithUIImage:()IntentsUI
{
  UIImage *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  unint64_t v8;

  v3 = a3;
  UIImagePNGRepresentation(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBD958], "imageWithImageData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImage size](v3, "size");
  v7 = v6;
  -[UIImage size](v3, "size");
  objc_msgSend(v5, "_setImageSize:", v7);
  v8 = -[UIImage renderingMode](v3, "renderingMode");

  if (v8 <= 2)
    objc_msgSend(v5, "_setRenderingMode:", v8);

  return v5;
}

+ (double)imageSizeForIntentResponse:()IntentsUI
{
  return 60.0;
}

@end
