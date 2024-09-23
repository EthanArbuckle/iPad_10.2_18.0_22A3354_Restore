@implementation AVTView(AvatarUI)

+ (id)snapshotAVTView:()AvatarUI matchingViewSize:highQuality:logger:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v10, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x1DF0D05A4]();
    objc_msgSend(v10, "bounds");
    v15 = v14;
    v17 = v16;
    objc_msgSend(v10, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "screen");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "scale");
    v21 = v20;

    if ((a5 & 1) != 0)
    {
      *(float *)&v22 = v21;
      objc_msgSend(v9, "snapshotWithSize:scaleFactor:", v15, v17, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = *MEMORY[0x1E0D00640];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      *(float *)&v26 = v21;
      objc_msgSend(v9, "snapshotWithSize:scaleFactor:options:", v25, v15, v17, v26);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_autoreleasePoolPop(v13);
  }
  else
  {
    objc_msgSend(v11, "logErrorSnapshottingAVTView:", CFSTR("Can't determine snapshot pixel size without a window"));
    v23 = 0;
  }

  return v23;
}

@end
