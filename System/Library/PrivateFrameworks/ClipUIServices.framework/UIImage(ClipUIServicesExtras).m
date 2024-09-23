@implementation UIImage(ClipUIServicesExtras)

+ (id)cps_imageNamed:()ClipUIServicesExtras
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CEA638];
  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "cps_clipUIServicesBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:withConfiguration:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)cps_resizedImageWithSize:()ClipUIServicesExtras
{
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[7];

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:", a2, a3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__UIImage_ClipUIServicesExtras__cps_resizedImageWithSize___block_invoke;
  v10[3] = &unk_1E8E8B568;
  v10[4] = a1;
  *(double *)&v10[5] = a2;
  *(double *)&v10[6] = a3;
  objc_msgSend(v6, "imageWithActions:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithRenderingMode:", objc_msgSend(a1, "renderingMode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)cps_averageColorImage
{
  void *v2;
  id v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  id v14;
  double MinX;
  double MinY;
  double Width;
  void *v18;
  void *v19;
  id v20;
  id *v21;
  void *v22;
  id v23;
  id *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  _QWORD v45[3];
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v45[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v39 = 0;
    v40 = &v39;
    v41 = 0x2050000000;
    v2 = (void *)getCIImageClass_softClass;
    v42 = getCIImageClass_softClass;
    if (!getCIImageClass_softClass)
    {
      v34 = MEMORY[0x1E0C809B0];
      v35 = 3221225472;
      v36 = (uint64_t)__getCIImageClass_block_invoke;
      v37 = &unk_1E8E8B540;
      v38 = &v39;
      __getCIImageClass_block_invoke((uint64_t)&v34);
      v2 = (void *)v40[3];
    }
    v3 = objc_retainAutorelease(v2);
    _Block_object_dispose(&v39, 8);
    objc_msgSend(v3, "imageWithCGImage:", objc_msgSend(objc_retainAutorelease(a1), "CGImage"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extent");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v39 = 0;
    v40 = &v39;
    v41 = 0x2050000000;
    v13 = (void *)getCIVectorClass_softClass;
    v42 = getCIVectorClass_softClass;
    if (!getCIVectorClass_softClass)
    {
      v34 = MEMORY[0x1E0C809B0];
      v35 = 3221225472;
      v36 = (uint64_t)__getCIVectorClass_block_invoke;
      v37 = &unk_1E8E8B540;
      v38 = &v39;
      __getCIVectorClass_block_invoke((uint64_t)&v34);
      v13 = (void *)v40[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v39, 8);
    v46.origin.x = v6;
    v46.origin.y = v8;
    v46.size.width = v10;
    v46.size.height = v12;
    MinX = CGRectGetMinX(v46);
    v47.origin.x = v6;
    v47.origin.y = v8;
    v47.size.width = v10;
    v47.size.height = v12;
    MinY = CGRectGetMinY(v47);
    v48.origin.x = v6;
    v48.origin.y = v8;
    v48.size.width = v10;
    v48.size.height = v12;
    Width = CGRectGetWidth(v48);
    v49.origin.x = v6;
    v49.origin.y = v8;
    v49.size.width = v10;
    v49.size.height = v12;
    objc_msgSend(v14, "vectorWithX:Y:Z:W:", MinX, MinY, Width, CGRectGetHeight(v49));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    v40 = &v39;
    v41 = 0x2050000000;
    v19 = (void *)getCIFilterClass_softClass;
    v42 = getCIFilterClass_softClass;
    if (!getCIFilterClass_softClass)
    {
      v34 = MEMORY[0x1E0C809B0];
      v35 = 3221225472;
      v36 = (uint64_t)__getCIFilterClass_block_invoke;
      v37 = &unk_1E8E8B540;
      v38 = &v39;
      __getCIFilterClass_block_invoke((uint64_t)&v34);
      v19 = (void *)v40[3];
    }
    v20 = objc_retainAutorelease(v19);
    _Block_object_dispose(&v39, 8);
    v34 = 0;
    v35 = (uint64_t)&v34;
    v36 = 0x2020000000;
    v21 = (id *)getkCIInputImageKeySymbolLoc_ptr;
    v37 = (void *)getkCIInputImageKeySymbolLoc_ptr;
    if (!getkCIInputImageKeySymbolLoc_ptr)
    {
      v22 = (void *)CoreImageLibrary();
      v21 = (id *)dlsym(v22, "kCIInputImageKey");
      *(_QWORD *)(v35 + 24) = v21;
      getkCIInputImageKeySymbolLoc_ptr = (uint64_t)v21;
    }
    _Block_object_dispose(&v34, 8);
    if (!v21)
      -[UIImage(ClipUIServicesExtras) cps_averageColorImage].cold.1();
    v23 = *v21;
    v43 = v23;
    v45[0] = v4;
    v34 = 0;
    v35 = (uint64_t)&v34;
    v36 = 0x2020000000;
    v24 = (id *)getkCIInputExtentKeySymbolLoc_ptr;
    v37 = (void *)getkCIInputExtentKeySymbolLoc_ptr;
    if (!getkCIInputExtentKeySymbolLoc_ptr)
    {
      v25 = (void *)CoreImageLibrary();
      v24 = (id *)dlsym(v25, "kCIInputExtentKey");
      *(_QWORD *)(v35 + 24) = v24;
      getkCIInputExtentKeySymbolLoc_ptr = (uint64_t)v24;
    }
    _Block_object_dispose(&v34, 8);
    if (!v24)
      -[UIImage(ClipUIServicesExtras) cps_averageColorImage].cold.2();
    v44 = *v24;
    v45[1] = v18;
    v26 = (void *)MEMORY[0x1E0C99D80];
    v27 = v44;
    objc_msgSend(v26, "dictionaryWithObjects:forKeys:count:", v45, &v43, 2, v34);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "filterWithName:withInputParameters:", CFSTR("CIAreaAverage"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(v29, "outputImage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "imageWithCIImage:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v32 = 0;
  }
  return v32;
}

- (id)cps_imageWithNormalizedOrientation
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  if (!objc_msgSend(a1, "imageOrientation"))
    return a1;
  v2 = objc_alloc_init(MEMORY[0x1E0CEA618]);
  objc_msgSend(v2, "setScale:", 1.0);
  v3 = objc_alloc(MEMORY[0x1E0CEA610]);
  objc_msgSend(a1, "size");
  v4 = (void *)objc_msgSend(v3, "initWithSize:format:", v2);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__UIImage_ClipUIServicesExtras__cps_imageWithNormalizedOrientation__block_invoke;
  v7[3] = &unk_1E8E8B590;
  v7[4] = a1;
  objc_msgSend(v4, "imageWithActions:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)cps_averageColorImage
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkCIInputExtentKey(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CPSUIImageExtras.m"), 13, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
