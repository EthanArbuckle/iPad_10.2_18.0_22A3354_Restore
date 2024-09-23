@implementation MKMapSnapshot

- (MKMapSnapshot)snapshotWithAnnotationView:(id)a3 atCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude;
  double latitude;
  id v7;
  void *v8;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v7 = a3;
  -[MKMapSnapshot pointForCoordinate:](self, "pointForCoordinate:", latitude, longitude);
  -[MKMapSnapshot snapshotWithAnnotationView:atPoint:](self, "snapshotWithAnnotationView:atPoint:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (MKMapSnapshot *)v8;
}

- (MKMapSnapshot)snapshotWithAnnotationView:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  CGFloat v16;
  void *v17;
  CGContext *CurrentContext;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat Height;
  void *v25;
  void *v26;
  CGSize v28;
  CGRect v29;
  CGRect v30;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "addSubview:", v7);

  }
  -[MKMapSnapshot image](self, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  v11 = v10;
  v13 = v12;
  -[MKMapSnapshot image](self, "image");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scale");
  v16 = v15;
  v28.width = v11;
  v28.height = v13;
  UIGraphicsBeginImageContextWithOptions(v28, 0, v16);

  -[MKMapSnapshot image](self, "image");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

  CurrentContext = UIGraphicsGetCurrentContext();
  UIGraphicsPushContext(CurrentContext);
  objc_msgSend(v7, "centerOffset");
  v20 = v19;
  v22 = v21;
  objc_msgSend(v7, "bounds");
  v23 = v20 + x - CGRectGetWidth(v29) * 0.5;
  objc_msgSend(v7, "bounds");
  Height = CGRectGetHeight(v30);
  CGContextTranslateCTM(CurrentContext, v23, v22 + y - Height * 0.5);
  objc_msgSend(v7, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "renderInContext:", CurrentContext);

  UIGraphicsPopContext();
  UIGraphicsGetImageFromCurrentImageContext();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return (MKMapSnapshot *)v26;
}

+ (id)createSnapshotWithOptions:(id)a3 timeoutInSeconds:(int64_t)a4
{
  id v5;
  dispatch_semaphore_t v6;
  MKMapSnapshotter *v7;
  void *v8;
  NSObject *v9;
  dispatch_time_t v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t);
  void *v16;
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__18;
  v23 = __Block_byref_object_dispose__18;
  v24 = 0;
  v6 = dispatch_semaphore_create(0);
  v7 = -[MKMapSnapshotter initWithOptions:]([MKMapSnapshotter alloc], "initWithOptions:", v5);
  dispatch_get_global_queue(25, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __81__MKMapSnapshot_MKMapSnapshotExtras__createSnapshotWithOptions_timeoutInSeconds___block_invoke;
  v16 = &unk_1E20DCBA0;
  v18 = &v19;
  v9 = v6;
  v17 = v9;
  -[MKMapSnapshotter startWithQueue:completionHandler:](v7, "startWithQueue:completionHandler:", v8, &v13);

  v10 = dispatch_time(0, 1000000000 * a4);
  if (dispatch_semaphore_wait(v9, v10))
    -[MKMapSnapshotter cancel](v7, "cancel", v13, v14, v15, v16);
  v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v11;
}

void __81__MKMapSnapshot_MKMapSnapshotExtras__createSnapshotWithOptions_timeoutInSeconds___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;

  v6 = a2;
  if (!a3)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)_compositeOnImages:(id)a3 drawQueue:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  NSObject *v10;
  NSObject *v11;
  id v12;
  NSUInteger v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  dispatch_queue_t v18;
  NSUInteger v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  size_t v31;
  double v32;
  size_t v33;
  CGColorSpace *DeviceRGB;
  size_t AlignedBytesPerRow;
  CGContext *v36;
  CGFloat v37;
  CGFloat v38;
  id v39;
  CGImage *v40;
  id v41;
  void (**v42)(_QWORD);
  id v43;
  void (**v44)(_QWORD);
  id v45;
  id v46;
  NSObject *v47;
  void *v48;
  NSObject *queue;
  NSObject *v50;
  dispatch_queue_t v51;
  id v52;
  NSObject *v53;
  void *v54;
  id v55;
  _QWORD v56[5];
  id v57;
  id v58;
  id v59;
  _QWORD block[4];
  NSObject *v61;
  void (**v62)(_QWORD);
  void (**v63)(_QWORD);
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  NSObject *v68;
  CGContext *v69;
  CGColorSpace *v70;
  _QWORD v71[4];
  id v72;
  id v73;
  CGContext *v74;
  uint64_t v75;
  uint64_t v76;
  double v77;
  double v78;
  CGAffineTransform v79;
  uint8_t buf[16];
  CGRect v81;
  CGRect v82;

  v55 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!-[NSArray count](self->_allTraitCollections, "count"))
  {
LABEL_23:
    dispatch_async(v11, v12);
    goto LABEL_20;
  }
  v13 = -[NSArray count](self->_allTraitCollections, "count");
  if (v13 != -[NSArray count](self->_allImages, "count"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18B0B0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _allTraitCollections.count == _allImages.count", buf, 2u);
    }
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_allImages, "count"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_allImages, "count") < 2)
    v52 = 0;
  else
    v52 = objc_alloc_init(MEMORY[0x1E0CEA640]);
  v14 = dispatch_group_create();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_DEFAULT, 0);
  v16 = objc_claimAutoreleasedReturnValue();

  if (v10 && -[NSArray count](self->_allTraitCollections, "count") > 1)
    v17 = dispatch_queue_create_with_target_V2(0, v16, v10);
  else
    v17 = v10;
  v53 = v17;
  queue = v11;
  v50 = v10;
  v47 = v16;
  v48 = v12;
  if (-[NSArray count](self->_allTraitCollections, "count") <= 1)
    v18 = v11;
  else
    v18 = dispatch_queue_create_with_target_V2(0, v16, v11);
  v51 = v18;
  v19 = -[NSArray count](self->_allTraitCollections, "count");
  v20 = MEMORY[0x1E0C809B0];
  if (v19)
  {
    v21 = 0;
    do
    {
      dispatch_group_enter(v14);
      -[NSArray objectAtIndexedSubscript:](self->_allTraitCollections, "objectAtIndexedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_allImages, "objectAtIndexedSubscript:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "size");
      v25 = v24;
      objc_msgSend(v23, "size");
      v27 = v26;
      objc_msgSend(v22, "displayScale");
      v29 = v28;
      v30 = v25 * v28;
      v31 = (unint64_t)(v25 * v28);
      v32 = v27 * v28;
      v33 = (unint64_t)(v27 * v28);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
      v36 = CGBitmapContextCreate(0, v31, v33, 8uLL, AlignedBytesPerRow, DeviceRGB, 0x2006u);
      v37 = (double)(unint64_t)v30;
      v38 = (double)(unint64_t)v32;
      v81.origin.x = 0.0;
      v81.origin.y = 0.0;
      v81.size.width = v37;
      v81.size.height = v38;
      CGContextClearRect(v36, v81);
      v39 = objc_retainAutorelease(v23);
      v40 = (CGImage *)objc_msgSend(v39, "CGImage");
      v82.origin.x = 0.0;
      v82.origin.y = 0.0;
      v82.size.width = v37;
      v82.size.height = v38;
      CGContextDrawImage(v36, v82, v40);
      CGContextTranslateCTM(v36, 0.0, v38);
      CGContextScaleCTM(v36, v29, -v29);
      CGContextGetCTM(&v79, v36);
      CGContextSetBaseCTM();
      v71[0] = v20;
      v71[1] = 3221225472;
      v71[2] = __78__MKMapSnapshot__compositeOnImages_drawQueue_callbackQueue_completionHandler___block_invoke;
      v71[3] = &unk_1E20DF690;
      v74 = v36;
      v41 = v22;
      v72 = v41;
      v73 = v55;
      v75 = 0;
      v76 = 0;
      v77 = v25;
      v78 = v27;
      v42 = (void (**)(_QWORD))MEMORY[0x18D778DB8](v71);
      v64[0] = v20;
      v64[1] = 3221225472;
      v64[2] = __78__MKMapSnapshot__compositeOnImages_drawQueue_callbackQueue_completionHandler___block_invoke_3;
      v64[3] = &unk_1E20DF6B8;
      v69 = v36;
      v43 = v41;
      v65 = v43;
      v70 = DeviceRGB;
      v66 = v52;
      v67 = v54;
      v68 = v14;
      v44 = (void (**)(_QWORD))MEMORY[0x18D778DB8](v64);
      if (v53)
      {
        block[0] = v20;
        block[1] = 3221225472;
        block[2] = __78__MKMapSnapshot__compositeOnImages_drawQueue_callbackQueue_completionHandler___block_invoke_4;
        block[3] = &unk_1E20DF6E0;
        v62 = v42;
        v61 = v51;
        v63 = v44;
        dispatch_async(v53, block);

      }
      else
      {
        v42[2](v42);
        v44[2](v44);
      }

      ++v21;
    }
    while (v21 < -[NSArray count](self->_allTraitCollections, "count"));
  }
  v56[0] = v20;
  v56[1] = 3221225472;
  v56[2] = __78__MKMapSnapshot__compositeOnImages_drawQueue_callbackQueue_completionHandler___block_invoke_6;
  v56[3] = &unk_1E20DBCD8;
  v56[4] = self;
  v57 = v54;
  v58 = v52;
  v12 = v48;
  v59 = v48;
  v45 = v52;
  v46 = v54;
  v11 = queue;
  dispatch_group_notify(v14, queue, v56);

  v10 = v50;
LABEL_20:

}

void __78__MKMapSnapshot__compositeOnImages_drawQueue_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _QWORD v4[4];
  id v5;
  __int128 v6;
  __int128 v7;

  UIGraphicsPushContext(*(CGContextRef *)(a1 + 48));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __78__MKMapSnapshot__compositeOnImages_drawQueue_callbackQueue_completionHandler___block_invoke_2;
  v4[3] = &unk_1E20DF668;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v3 = *(_OWORD *)(a1 + 72);
  v6 = *(_OWORD *)(a1 + 56);
  v7 = v3;
  objc_msgSend(v2, "performAsCurrentTraitCollection:", v4);
  UIGraphicsPopContext();

}

uint64_t __78__MKMapSnapshot__compositeOnImages_drawQueue_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __78__MKMapSnapshot__compositeOnImages_drawQueue_callbackQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  CGImage *Image;
  void *v3;
  id v4;

  Image = CGBitmapContextCreateImage(*(CGContextRef *)(a1 + 64));
  v3 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(*(id *)(a1 + 32), "displayScale");
  objc_msgSend(v3, "imageWithCGImage:scale:orientation:", Image, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  CGImageRelease(Image);
  CGColorSpaceRelease(*(CGColorSpaceRef *)(a1 + 72));
  CGContextRelease(*(CGContextRef *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 40), "registerImage:withTraitCollection:", v4, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __78__MKMapSnapshot__compositeOnImages_drawQueue_callbackQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__MKMapSnapshot__compositeOnImages_drawQueue_callbackQueue_completionHandler___block_invoke_5;
  block[3] = &unk_1E20D7EF8;
  v4 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

}

uint64_t __78__MKMapSnapshot__compositeOnImages_drawQueue_callbackQueue_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__MKMapSnapshot__compositeOnImages_drawQueue_callbackQueue_completionHandler___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count") < 2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v8 + 16);
    *(_QWORD *)(v8 + 16) = v7;
  }
  else
  {
    v2 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "imageWithTraitCollection:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v4;

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)_prepareForRenderWithAnnotationViews:(id)a3 workQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  id v10;
  _QWORD v11[4];
  void (**v12)(_QWORD);
  MKMapSnapshot *v13;

  v10 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  if (objc_msgSend(v10, "count"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __82__MKMapSnapshot__prepareForRenderWithAnnotationViews_workQueue_completionHandler___block_invoke;
    v11[3] = &unk_1E20DF708;
    v12 = (void (**)(_QWORD))v10;
    v13 = self;
    -[MKMapSnapshot _compositeOnImages:drawQueue:callbackQueue:completionHandler:](self, "_compositeOnImages:drawQueue:callbackQueue:completionHandler:", v11, MEMORY[0x1E0C80D38], v8, v9);

    v9 = v12;
  }
  else
  {
    v9[2](v9);
  }

}

void __82__MKMapSnapshot__prepareForRenderWithAnnotationViews_workQueue_completionHandler___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", a2, a3, a4, a5);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v11);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = *(id *)(a1 + 32);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "addSubview:", v17, (_QWORD)v19);
        v18 = *(void **)(a1 + 40);
        objc_msgSend(v17, "coordinate");
        objc_msgSend(v18, "pointForCoordinate:");
        objc_msgSend(v17, "_updateAnchorPosition:alignToPixels:", 1);
        objc_msgSend(v17, "_updateFromMap");
        objc_msgSend(v17, "_didUpdatePosition");
        objc_msgSend(v17, "setNeedsLayout");
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  objc_msgSend(v10, "layoutBelowIfNeeded");
  objc_msgSend(v10, "drawViewHierarchyInRect:afterScreenUpdates:", 1, a2, a3, a4, a5);

}

- (void)_displayAppleLogoForMapType:(unint64_t)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__MKMapSnapshot__displayAppleLogoForMapType_callbackQueue_completionHandler___block_invoke;
  v5[3] = &__block_descriptor_40_e39_v40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
  v5[4] = a3;
  -[MKMapSnapshot _compositeOnImages:drawQueue:callbackQueue:completionHandler:](self, "_compositeOnImages:drawQueue:callbackQueue:completionHandler:", v5, 0, a4, a5);
}

void __77__MKMapSnapshot__displayAppleLogoForMapType_callbackQueue_completionHandler___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  void *v7;
  _BOOL8 v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0CEAB40], "currentTraitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceStyle") == 2;

  +[MKAppleLogoImageView logoForMapType:forDarkMode:](MKAppleLogoImageView, "logoForMapType:forDarkMode:", *(_QWORD *)(a1 + 32), v8);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "size");
  v10 = a5 - (v9 + 10.0);
  objc_msgSend(v14, "size");
  v12 = v11;
  objc_msgSend(v14, "size");
  objc_msgSend(v14, "drawInRect:", 14.0, v10, v12, v13);

}

- (id)_initWithSnapshot:(id)a3 traitCollection:(id)a4
{
  id v7;
  id v8;
  MKMapSnapshot *v9;
  id *p_isa;
  id *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id *v16;
  id *v17;
  uint64_t v18;
  id v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  id v40;
  id v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  uint64_t v46;
  id v47;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  objc_super v55;
  CGSize v56;

  v7 = a3;
  v8 = a4;
  v55.receiver = self;
  v55.super_class = (Class)MKMapSnapshot;
  v9 = -[MKMapSnapshot init](&v55, sel_init);
  p_isa = (id *)&v9->super.isa;
  v11 = 0;
  if (v7 && v9)
  {
    objc_storeStrong((id *)&v9->_snapshot, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __51__MKMapSnapshot__initWithSnapshot_traitCollection___block_invoke;
    v51[3] = &unk_1E20DF778;
    v52 = v7;
    v14 = v12;
    v53 = v14;
    v15 = v13;
    v54 = v15;
    objc_msgSend(v52, "enumerateImagesWithBlock:", v51);
    v16 = p_isa + 4;
    objc_storeStrong(p_isa + 4, v12);
    v17 = p_isa + 5;
    objc_storeStrong(p_isa + 5, v13);
    if ((unint64_t)objc_msgSend(p_isa[5], "count") >= 2
      && (v18 = objc_msgSend(*v17, "count"), v18 == objc_msgSend(*v16, "count")))
    {
      v49 = v15;
      v50 = v14;
      v19 = objc_alloc_init(MEMORY[0x1E0CEA640]);
      if (objc_msgSend(*v17, "count"))
      {
        v20 = 0;
        do
        {
          objc_msgSend(*v17, "objectAtIndexedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*v16, "objectAtIndexedSubscript:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "registerImage:withTraitCollection:", v21, v22);

          ++v20;
        }
        while (v20 < objc_msgSend(*v17, "count"));
      }
      objc_msgSend(v19, "imageWithTraitCollection:", v8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
      {
        v25 = v23;
        v26 = p_isa[2];
        p_isa[2] = v25;
      }
      else
      {
        objc_msgSend(p_isa[4], "firstObject");
        v26 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "imageWithTraitCollection:", v26);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = p_isa[2];
        p_isa[2] = (id)v28;

      }
      v15 = v49;
      v14 = v50;
    }
    else
    {
      objc_msgSend(p_isa[5], "firstObject");
      v27 = objc_claimAutoreleasedReturnValue();
      v19 = p_isa[2];
      p_isa[2] = (id)v27;
    }

    v30 = p_isa[2];
    if (v30)
    {
      objc_msgSend(v30, "scale");
      v32 = v31;
      objc_msgSend(v8, "displayScale");
      if (vabdd_f64(v32, v33) >= 0.000001)
      {
        objc_msgSend(p_isa[2], "size");
        v35 = v34;
        v37 = v36;
        objc_msgSend(v8, "displayScale");
        v39 = v38;
        v56.width = v35;
        v56.height = v37;
        UIGraphicsBeginImageContextWithOptions(v56, 1, v39);
        v40 = v15;
        v41 = p_isa[2];
        objc_msgSend(v41, "size");
        v43 = v42;
        objc_msgSend(p_isa[2], "size");
        v44 = v41;
        v15 = v40;
        objc_msgSend(v44, "drawInRect:", 0.0, 0.0, v43, v45);
        UIGraphicsGetImageFromCurrentImageContext();
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = p_isa[2];
        p_isa[2] = (id)v46;

        UIGraphicsEndImageContext();
      }
      objc_storeStrong(p_isa + 3, a4);
      v11 = p_isa;
    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

void __51__MKMapSnapshot__initWithSnapshot_traitCollection___block_invoke(id *a1, uint64_t a2, uint64_t a3)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  int v12;
  __int16 v13;

  v6 = objc_alloc(MEMORY[0x1E0CEA638]);
  objc_msgSend(a1[4], "scale");
  v9 = (id)objc_msgSend(v6, "initWithCGImage:scale:orientation:", a3, 0);
  if (v9)
  {
    v7 = (void *)MEMORY[0x1E0CEAB40];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__MKMapSnapshot__initWithSnapshot_traitCollection___block_invoke_2;
    v10[3] = &unk_1E20DF750;
    v11 = a1[4];
    v13 = WORD2(a2);
    v12 = a2;
    objc_msgSend(v7, "traitCollectionWithTraits:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "addObject:", v8);
    objc_msgSend(a1[6], "addObject:", v9);

  }
}

void __51__MKMapSnapshot__initWithSnapshot_traitCollection___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "scale");
  objc_msgSend(v5, "setDisplayScale:");
  if (*(_BYTE *)(a1 + 40) == 1)
    v4 = 2;
  else
    v4 = 1;
  objc_msgSend(v5, "setUserInterfaceStyle:", v4);

}

- (CGPoint)pointForCoordinate:(CLLocationCoordinate2D)coordinate
{
  double v3;
  double v4;
  CGPoint result;

  -[VKMapSnapshot pointForCoordinate:](self->_snapshot, "pointForCoordinate:", coordinate.latitude, coordinate.longitude);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CLLocationCoordinate2D)_coordinateForPoint:(CGPoint)a3
{
  double v3;
  double v4;
  CLLocationCoordinate2D result;

  -[VKMapSnapshot coordinateForPoint:](self->_snapshot, "coordinateForPoint:", a3.x, a3.y);
  result.longitude = v4;
  result.latitude = v3;
  return result;
}

- (BOOL)_hasNoDataPlaceholders
{
  return 0;
}

- (id)_statsMemoryUsage
{
  return (id)-[VKMapSnapshot memoryStats](self->_snapshot, "memoryStats");
}

- (UIImage)image
{
  return self->_image;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allImages, 0);
  objc_storeStrong((id *)&self->_allTraitCollections, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
}

@end
