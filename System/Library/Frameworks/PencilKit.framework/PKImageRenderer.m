@implementation PKImageRenderer

- (PKImageRenderer)initWithSize:(CGSize)a3 scale:(double)a4
{
  return -[PKImageRenderer initWithSize:scale:renderQueue:](self, "initWithSize:scale:renderQueue:", 0, a3.width, a3.height, a4);
}

- (PKImageRenderer)initWithSize:(CGSize)a3 scale:(double)a4 useMetal:(BOOL)a5
{
  return -[PKImageRenderer initWithSize:scale:renderQueue:](self, "initWithSize:scale:renderQueue:", 0, a3.width, a3.height, a4);
}

- (PKImageRenderer)initWithSize:(CGSize)a3 scale:(double)a4 useMetal:(BOOL)a5 renderQueue:(id)a6
{
  return -[PKImageRenderer initWithSize:scale:renderQueue:](self, "initWithSize:scale:renderQueue:", a6, a3.width, a3.height, a4);
}

- (PKImageRenderer)initWithSize:(CGSize)a3 scale:(double)a4 renderQueue:(id)a5
{
  return -[PKImageRenderer initWithSize:scale:renderQueue:sixChannelBlending:](self, "initWithSize:scale:renderQueue:sixChannelBlending:", a5, 0, a3.width, a3.height, a4);
}

- (PKImageRenderer)initWithSize:(CGSize)a3 scale:(double)a4 renderQueue:(id)a5 sixChannelBlending:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  id v11;
  PKImageRenderer *v12;
  PKImageRenderer *v13;
  objc_super v15;

  v6 = a6;
  height = a3.height;
  width = a3.width;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKImageRenderer;
  v12 = -[PKImageRenderer init](&v15, sel_init);
  v13 = v12;
  if (v12)
    -[PKImageRenderer setupWithSize:scale:renderQueue:sixChannelBlending:synchronous:](v12, "setupWithSize:scale:renderQueue:sixChannelBlending:synchronous:", v11, v6, 0, width, height, a4);

  return v13;
}

- (id)initSyncWithSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  PKImageRenderer *v7;
  PKImageRenderer *v8;
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)PKImageRenderer;
  v7 = -[PKImageRenderer init](&v10, sel_init);
  v8 = v7;
  if (v7)
    -[PKImageRenderer setupWithSize:scale:renderQueue:sixChannelBlending:synchronous:](v7, "setupWithSize:scale:renderQueue:sixChannelBlending:synchronous:", 0, 0, 1, width, height, a4);
  return v8;
}

- (void)dealloc
{
  BOOL v3;
  PKMetalRendererController *rendererController;
  objc_super v5;

  v3 = -[PKImageRenderer synchronous](self, "synchronous");
  rendererController = self->_rendererController;
  if (v3)
  {
    if (rendererController)
      rendererController->_isTorndown = 1;
  }
  else
  {
    -[PKMetalRendererController teardown]((uint64_t)rendererController);
  }
  v5.receiver = self;
  v5.super_class = (Class)PKImageRenderer;
  -[PKImageRenderer dealloc](&v5, sel_dealloc);
}

- (void)setupWithSize:(CGSize)a3 scale:(double)a4 renderQueue:(id)a5 sixChannelBlending:(BOOL)a6 synchronous:(BOOL)a7
{
  _BOOL4 v7;
  double v9;
  double height;
  double width;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  PKMetalRendererController *v20;
  PKMetalRendererController *rendererController;
  PKMetalRendererController *v22;
  PKMetalConfig *v23;
  PKMetalConfig *v24;

  v7 = a7;
  v9 = a4;
  height = a3.height;
  width = a3.width;
  self->_size = a3;
  v13 = fmax(round(a3.width * a4), 1.0);
  v14 = fmax(round(a3.height * a4), 1.0);
  +[PKMetalUtility clampedPixelSize:](PKMetalUtility, "clampedPixelSize:", a5, v13, v14);
  v17 = v15;
  v18 = v16;
  if (v13 != v15 || v14 != v16)
    v9 = v15 / v13 * v9;
  self->_scale = v9;
  self->_synchronous = v7;
  if (+[PKMetalUtility isMetalAvailable](PKMetalUtility, "isMetalAvailable"))
  {
    v24 = objc_alloc_init(PKMetalConfig);
    v20 = (PKMetalRendererController *)-[PKMetalRendererController initWithPixelSize:actualSize:pixelFormat:sixChannelBlending:metalConfig:]([PKMetalRendererController alloc], (void *)0x50, a6, v24, v17, v18, width, height);
    rendererController = self->_rendererController;
    self->_rendererController = v20;

    v22 = self->_rendererController;
    if (v7)
    {
      v23 = v24;
      if (v22)
      {
        v22->_synchronous = 1;
        atomic_load((unsigned int *)&v22->_cancelAllRendering);
      }
    }
    else
    {
      -[PKMetalRendererController setup]((uint64_t)v22);
      v23 = v24;
    }

  }
}

- (void)renderDrawing:(id)a3 completion:(id)a4
{
  -[PKImageRenderer renderDrawing:clippedToStrokeSpaceRect:scale:completion:](self, "renderDrawing:clippedToStrokeSpaceRect:scale:completion:", a3, a4, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), 1.0);
}

- (void)renderDrawing:(id)a3 clippedToStrokeSpaceRect:(CGRect)a4 scale:(double)a5 completion:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  void *v13;
  void *v14;
  id v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15 = a6;
  objc_msgSend(a3, "strokes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  -[PKImageRenderer renderStrokes:clippedToStrokeSpaceRect:scale:completion:](self, "renderStrokes:clippedToStrokeSpaceRect:scale:completion:", v14, v15, x, y, width, height, a5);

}

- (void)renderCGStrokes:(id)a3 clippedToStrokeSpaceRect:(CGRect)a4 scale:(double)a5 completion:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__PKImageRenderer_renderCGStrokes_clippedToStrokeSpaceRect_scale_completion___block_invoke;
  v15[3] = &unk_1E777AD18;
  v16 = v13;
  v14 = v13;
  -[PKImageRenderer _renderCGStrokes:clippedToStrokeSpaceRect:scale:completion:](self, "_renderCGStrokes:clippedToStrokeSpaceRect:scale:completion:", a3, v15, x, y, width, height, a5);

}

uint64_t __77__PKImageRenderer_renderCGStrokes_clippedToStrokeSpaceRect_scale_completion___block_invoke(uint64_t a1, CGImageRef image)
{
  CGImageRetain(image);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_renderCGStrokes:(id)a3 clippedToStrokeSpaceRect:(CGRect)a4 scale:(double)a5 completion:(id)a6
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  __int128 v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double scale;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  double v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  CGImage *v49;
  void *v50;
  double v51;
  CGFloat v52;
  CGFloat v53;
  CGAffineTransform v54;
  CGAffineTransform v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  CGAffineTransform v60;
  CGAffineTransform v61;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v64;
  CGAffineTransform v65;
  CGAffineTransform v66;
  CGAffineTransform v67;
  CGAffineTransform v68;
  CGAffineTransform v69;
  CGAffineTransform v70;
  CGAffineTransform v71;
  CGAffineTransform v72;
  CGAffineTransform v73;
  _BYTE v74[128];
  uint64_t v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v75 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a6;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD))v14;
  if (self->_rendererController)
  {
    v16 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v73.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v73.c = v16;
    *(_OWORD *)&v73.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v17 = x;
    *(CGFloat *)&v16 = y;
    v18 = width;
    v19 = height;
    if (CGRectIsNull(*(CGRect *)((char *)&v16 - 8)))
    {
      t1 = v73;
      CGAffineTransformMakeScale(&t2, a5, a5);
      CGAffineTransformConcat(&v72, &t1, &t2);
      v73 = v72;
      v52 = height;
      v53 = width;
    }
    else
    {
      -[PKImageRenderer size](self, "size");
      v21 = v20;
      -[PKImageRenderer size](self, "size");
      v22 = v21 / width;
      v24 = v23 / height;
      if (v21 / width >= v24)
        v22 = v24;
      if (v22 > a5)
        v22 = a5;
      scale = self->_scale;
      memset(&v72, 0, sizeof(v72));
      CGAffineTransformMakeScale(&v72, v22 * scale, v22 * scale);
      v71 = v72;
      v76.origin.x = x;
      v76.origin.y = y;
      v76.size.width = width;
      v76.size.height = height;
      v77 = CGRectApplyAffineTransform(v76, &v71);
      v78 = CGRectIntegral(v77);
      v51 = v78.origin.x;
      v26 = v78.origin.y;
      v27 = v78.size.width;
      v28 = v78.size.height;
      -[PKImageRenderer size](self, "size");
      v30 = v29;
      -[PKImageRenderer scale](self, "scale");
      v32 = v30 * v31;
      if (v27 >= v32)
        v33 = v32;
      else
        v33 = v27;
      -[PKImageRenderer size](self, "size");
      v35 = v34;
      -[PKImageRenderer scale](self, "scale");
      v37 = v35 * v36;
      if (v28 < v37)
        v37 = v28;
      v52 = v37;
      v53 = v33;
      v70 = v73;
      v69 = v72;
      CGAffineTransformConcat(&v73, &v70, &v69);
      v67 = v73;
      CGAffineTransformMakeTranslation(&v66, -v51, -v26);
      CGAffineTransformConcat(&v68, &v67, &v66);
      v73 = v68;
      v65 = v68;
      CGAffineTransformMakeScale(&v64, 1.0 / self->_scale, 1.0 / self->_scale);
      CGAffineTransformConcat(&v68, &v65, &v64);
      v73 = v68;
    }
    -[PKMetalRendererController setContentZoomScale:]((uint64_t)self->_rendererController, sqrt(v73.b * v73.b + v73.a * v73.a));
    v61 = v73;
    CGAffineTransformMakeScale(&v60, self->_scale, self->_scale);
    CGAffineTransformConcat(&v72, &v61, &v60);
    v73 = v72;
    v38 = *MEMORY[0x1E0C9D628];
    v39 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v40 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v41 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v79.origin.x = x;
    v79.origin.y = y;
    v79.size.width = width;
    v79.size.height = height;
    if (CGRectIsNull(v79))
    {
      v52 = v41;
      v53 = v40;
    }
    else
    {
      v38 = *MEMORY[0x1E0C9D538];
      v39 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v43 = v13;
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v56, v74, 16);
      if (v44)
      {
        v45 = *(_QWORD *)v57;
        do
        {
          for (i = 0; i != v44; ++i)
          {
            if (*(_QWORD *)v57 != v45)
              objc_enumerationMutation(v43);
            v47 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
            objc_msgSend(v47, "_bounds");
            v81.origin.x = x;
            v81.origin.y = y;
            v81.size.width = width;
            v81.size.height = height;
            if (CGRectIntersectsRect(v80, v81))
              objc_msgSend(v42, "addObject:", v47);
          }
          v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v56, v74, 16);
        }
        while (v44);
      }

      v13 = v42;
    }
    if (-[PKImageRenderer synchronous](self, "synchronous"))
    {
      -[PKImageRenderer rendererController](self, "rendererController");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v73;
      v49 = -[PKMetalRendererController renderStrokesSync:clippedToStrokeSpaceRect:strokeTransform:imageClipRect:]((uint64_t)v48, v13, &v55, x, y, width, height, v38, v39, v53, v52);

      ((void (**)(_QWORD, CGImage *, _QWORD))v15)[2](v15, v49, 0);
      CGImageRelease(v49);
    }
    else
    {
      -[PKImageRenderer rendererController](self, "rendererController");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v73;
      -[PKMetalRendererController renderStrokes:clippedToStrokeSpaceRect:strokeTransform:imageClipRect:completion:]((uint64_t)v50, v13, (__int128 *)&v54, v15, x, y, width, height, v38, v39, v53, v52);

    }
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v14 + 2))(v14, 0, 0);
  }

}

- (void)renderStrokes:(id)a3 clippedToStrokeSpaceRect:(CGRect)a4 scale:(double)a5 completion:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, CGImage *);
  void *v20;
  PKImageRenderer *v21;
  id v22;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a6;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __75__PKImageRenderer_renderStrokes_clippedToStrokeSpaceRect_scale_completion___block_invoke;
  v20 = &unk_1E777AD40;
  v21 = self;
  v22 = v13;
  v14 = v13;
  v15 = a3;
  v16 = _Block_copy(&v17);
  -[PKImageRenderer renderCGStrokes:clippedToStrokeSpaceRect:scale:completion:](self, "renderCGStrokes:clippedToStrokeSpaceRect:scale:completion:", v15, v16, x, y, width, height, a5, v17, v18, v19, v20, v21);

}

void __75__PKImageRenderer_renderStrokes_clippedToStrokeSpaceRect_scale_completion___block_invoke(uint64_t a1, CGImage *a2)
{
  uint64_t v2;
  void *v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    v4 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(*(id *)(a1 + 32), "scale");
    objc_msgSend(v4, "imageWithCGImage:scale:orientation:", a2, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);

    CGImageRelease(a2);
  }
  else
  {
    (*(void (**)(_QWORD))(v2 + 16))(*(_QWORD *)(a1 + 40));
  }
}

- (void)sixChannelCGRenderDrawing:(id)a3 clippedToStrokeSpaceRect:(CGRect)a4 scale:(double)a5 completion:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  void *v13;
  void *v14;
  id v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15 = a6;
  objc_msgSend(a3, "strokes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  -[PKImageRenderer _renderCGStrokes:clippedToStrokeSpaceRect:scale:completion:](self, "_renderCGStrokes:clippedToStrokeSpaceRect:scale:completion:", v14, v15, x, y, width, height, a5);

}

+ (CGImage)createJPEGCopyFrom:(CGImage *)a3 compressionQuality:(double)a4
{
  CGImage *ImageAtIndex;
  CFStringRef UTType;
  CGImage *MaskFromAlpha;
  CGImage *Mask;
  __CFData *Mutable;
  CGImageDestinationRef v10;
  CGImageDestination *v11;
  const __CFDictionary *v12;
  const __CFAllocator *v13;
  CFNumberRef v14;
  CFNumberRef v15;
  void *v16;
  CGImageSource *v17;
  CGImageRef v18;
  double v20;
  void *values;
  void *keys[2];

  ImageAtIndex = a3;
  keys[1] = *(void **)MEMORY[0x1E0C80C00];
  v20 = a4;
  if (!a3)
    return ImageAtIndex;
  UTType = CGImageGetUTType(a3);
  if (UTType && CFEqual(UTType, CFSTR("public.jpeg")))
    return 0;
  if ((CGImageHasAlpha() & 1) != 0)
  {
    MaskFromAlpha = (CGImage *)CGImageCreateMaskFromAlpha();
  }
  else
  {
    Mask = (CGImage *)CGImageGetMask();
    MaskFromAlpha = Mask;
    if (Mask)
      CGImageRetain(Mask);
  }
  Mutable = CFDataCreateMutable(0, 0);
  v10 = CGImageDestinationCreateWithData(Mutable, CFSTR("public.jpeg"), 1uLL, 0);
  if (!v10)
  {
    CGImageRelease(MaskFromAlpha);
    CFRelease(Mutable);
    return 0;
  }
  v11 = v10;
  v12 = 0;
  if (a4 >= 0.0 && a4 <= 1.0)
  {
    v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v14 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberDoubleType, &v20);
    if (v14)
    {
      v15 = v14;
      v16 = (void *)*MEMORY[0x1E0CBC780];
      values = v14;
      keys[0] = v16;
      v12 = CFDictionaryCreate(v13, (const void **)keys, (const void **)&values, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      CFRelease(v15);
    }
    else
    {
      v12 = 0;
    }
  }
  CGImageDestinationAddImage(v11, ImageAtIndex, v12);
  CGImageDestinationFinalize(v11);
  CFRelease(v11);
  if (v12)
    CFRelease(v12);
  v17 = CGImageSourceCreateWithData(Mutable, 0);
  CFRelease(Mutable);
  if (v17)
  {
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v17, 0, 0);
    CFRelease(v17);
    if (ImageAtIndex && MaskFromAlpha)
    {
      v18 = CGImageCreateWithMask(ImageAtIndex, MaskFromAlpha);
      CGImageRelease(ImageAtIndex);
      ImageAtIndex = v18;
LABEL_24:
      CGImageRelease(MaskFromAlpha);
      return ImageAtIndex;
    }
  }
  else
  {
    ImageAtIndex = 0;
  }
  if (MaskFromAlpha)
    goto LABEL_24;
  return ImageAtIndex;
}

- (void)sixChannelPDFRenderDrawing:(id)a3 context:(CGContext *)a4 clippedToStrokeSpaceRect:(CGRect)a5 scale:(double)a6 completion:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  _BOOL4 v30;
  void *v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  void *v40;
  void *v41;
  _QWORD v43[13];
  BOOL v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a3;
  v15 = a7;
  v16 = v15;
  if (self->_rendererController)
  {
    v41 = v15;
    objc_msgSend(v14, "strokes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "count");
    if (v19 >= 1)
    {
      v20 = 0;
      do
      {
        objc_msgSend(v17, "objectAtIndexedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "renderBounds");
        v23 = v22;
        v25 = v24;
        v27 = v26;
        v29 = v28;
        v30 = __96__PKImageRenderer_sixChannelPDFRenderDrawing_context_clippedToStrokeSpaceRect_scale_completion___block_invoke(v21);
        objc_msgSend(v18, "addObject:", v21);
        if (++v20 < v19)
        {
          while (1)
          {
            objc_msgSend(v17, "objectAtIndexedSubscript:", v20);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30 != __96__PKImageRenderer_sixChannelPDFRenderDrawing_context_clippedToStrokeSpaceRect_scale_completion___block_invoke(v31))
              break;
            objc_msgSend(v18, "addObject:", v31);
            objc_msgSend(v31, "renderBounds");
            v49.origin.x = v32;
            v49.origin.y = v33;
            v49.size.width = v34;
            v49.size.height = v35;
            v45.origin.x = v23;
            v45.origin.y = v25;
            v45.size.width = v27;
            v45.size.height = v29;
            v46 = CGRectUnion(v45, v49);
            v23 = v46.origin.x;
            v25 = v46.origin.y;
            v27 = v46.size.width;
            v29 = v46.size.height;

            if (v19 == ++v20)
            {
              v20 = v19;
              goto LABEL_9;
            }
          }

        }
LABEL_9:
        v47.origin.x = v23;
        v47.origin.y = v25;
        v47.size.width = v27;
        v47.size.height = v29;
        v50.origin.x = x;
        v50.origin.y = y;
        v50.size.width = width;
        v50.size.height = height;
        v48 = CGRectIntersection(v47, v50);
        v36 = v48.origin.x;
        v37 = v48.origin.y;
        v38 = v48.size.width;
        v39 = v48.size.height;
        if (!CGRectIsEmpty(v48))
        {
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v43[2] = __96__PKImageRenderer_sixChannelPDFRenderDrawing_context_clippedToStrokeSpaceRect_scale_completion___block_invoke_2;
          v43[3] = &__block_descriptor_105_e18_v16__0__CGImage__8l;
          *(CGFloat *)&v43[4] = v36;
          *(CGFloat *)&v43[5] = v37;
          *(CGFloat *)&v43[6] = v38;
          *(CGFloat *)&v43[7] = v39;
          *(double *)&v43[8] = x;
          *(double *)&v43[9] = y;
          *(double *)&v43[10] = width;
          *(double *)&v43[11] = height;
          v43[12] = a4;
          v44 = v30;
          -[PKImageRenderer renderCGStrokes:clippedToStrokeSpaceRect:scale:completion:](self, "renderCGStrokes:clippedToStrokeSpaceRect:scale:completion:", v18, v43, x, y, width, height, a6);
        }
        objc_msgSend(v18, "removeAllObjects");

      }
      while (v20 < v19);
    }
    -[PKImageRenderer rendererController](self, "rendererController");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalRendererController callBlockOnRenderQueue:]((uint64_t)v40, v41);

    v16 = v41;
  }
  else
  {
    (*((void (**)(id))v15 + 2))(v15);
  }

}

BOOL __96__PKImageRenderer_sixChannelPDFRenderDrawing_context_clippedToStrokeSpaceRect_scale_completion___block_invoke(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "ink");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "behavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "renderingDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "blendMode");

  return (v4 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

void __96__PKImageRenderer_sixChannelPDFRenderDrawing_context_clippedToStrokeSpaceRect_scale_completion___block_invoke_2(uint64_t a1, const void *a2)
{
  CGImage *v4;
  double Width;
  double Height;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat x;
  CGFloat y;
  CGFloat v13;
  CGFloat v14;
  CGImageRef v15;
  CGImage *v16;
  CGContext *v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double MidY;
  CGFloat rect;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  if (a2)
  {
    v4 = +[PKImageRenderer createJPEGCopyFrom:compressionQuality:](PKImageRenderer, "createJPEGCopyFrom:compressionQuality:", a2, 0.9);
    CFRelease(a2);
    if (v4)
    {
      Width = (double)CGImageGetWidth(v4);
      Height = (double)CGImageGetHeight(v4);
      DKDNormalizedSubrectInRect(*(CGFloat *)(a1 + 32), *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56));
      DKDRectFromNormalizedSubrect(0.0, 0.0, Width, Height, v7, v8, v9, v10);
      x = v27.origin.x;
      y = v27.origin.y;
      v13 = v27.size.width;
      v14 = v27.size.height;
      if (!CGRectIsEmpty(v27))
      {
        v28.origin.x = x;
        v28.origin.y = y;
        v28.size.width = v13;
        v28.size.height = v14;
        v15 = CGImageCreateWithImageInRect(v4, v28);
        if (v15)
        {
          v16 = v15;
          CGContextSetBlendMode(*(CGContextRef *)(a1 + 96), (CGBlendMode)*(unsigned __int8 *)(a1 + 104));
          v17 = *(CGContext **)(a1 + 96);
          v18 = *(double *)(a1 + 32);
          v19 = *(double *)(a1 + 40);
          v20 = *(double *)(a1 + 48);
          v21 = *(double *)(a1 + 56);
          v22 = *(double *)(a1 + 72);
          rect = *(double *)(a1 + 64);
          v23 = *(double *)(a1 + 80);
          v24 = *(double *)(a1 + 88);
          v29.origin.x = v18;
          v29.origin.y = v19;
          v29.size.width = v20;
          v29.size.height = v21;
          MidY = CGRectGetMidY(v29);
          v30.origin.x = rect;
          v30.origin.y = v22;
          v30.size.width = v23;
          v30.size.height = v24;
          v31.origin.y = v19 + (MidY - CGRectGetMidY(v30)) * -2.0;
          v31.origin.x = v18;
          v31.size.width = v20;
          v31.size.height = v21;
          CGContextDrawImage(v17, v31, v16);
          CGImageRelease(v16);
        }
      }
      CGImageRelease(v4);
    }
  }
}

- (void)cancel
{
  id v2;

  -[PKImageRenderer rendererController](self, "rendererController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[PKMetalRendererController cancelLongRunningRenders]((uint64_t)v2);

}

- (void)resume
{
  id v2;

  -[PKImageRenderer rendererController](self, "rendererController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[PKMetalRendererController resumeLongRunningRendersAfterAllWorkIsDone]((uint64_t)v2);

}

+ (void)_fuzzTestUnzippedData:(id)a3
{
  id v3;
  PKDrawingVersionedDocument *v4;
  PKImageRenderer *v5;
  dispatch_semaphore_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  _QWORD v13[4];
  NSObject *v14;

  v3 = a3;
  v4 = -[PKVersionedDocument initWithUnzippedData:]([PKDrawingVersionedDocument alloc], "initWithUnzippedData:", v3);
  v5 = -[PKImageRenderer initWithSize:scale:]([PKImageRenderer alloc], "initWithSize:scale:", 240.0, 320.0, 1.0);
  v6 = dispatch_semaphore_create(0);
  -[PKDrawingVersionedDocument drawing](v4, "drawing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0C9D628];
  v9 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __41__PKImageRenderer__fuzzTestUnzippedData___block_invoke;
  v13[3] = &unk_1E777AD88;
  v12 = v6;
  v14 = v12;
  -[PKImageRenderer renderDrawing:clippedToStrokeSpaceRect:scale:completion:](v5, "renderDrawing:clippedToStrokeSpaceRect:scale:completion:", v7, v13, v8, v9, v10, v11, 0.3125);

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __41__PKImageRenderer__fuzzTestUnzippedData___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)buildStrokeRenderCacheForDrawing:(id)a3
{
  PKMetalRendererController *rendererController;
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    rendererController = self->_rendererController;
    objc_msgSend(v6, "strokes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalRendererController buildRenderCacheForStrokes:]((uint64_t)rendererController, v5);

  }
}

- (BOOL)invertColors
{
  PKMetalRendererController *rendererController;

  rendererController = self->_rendererController;
  return rendererController && rendererController->_invertColors;
}

- (void)setInvertColors:(BOOL)a3
{
  -[PKMetalRendererController setInvertColors:]((uint64_t)self->_rendererController, a3);
}

- (BOOL)sixChannelBlending
{
  PKMetalRendererController *rendererController;

  rendererController = self->_rendererController;
  return rendererController && rendererController->_sixChannelBlending;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (PKMetalRendererController)rendererController
{
  return self->_rendererController;
}

- (void)setRendererController:(id)a3
{
  objc_storeStrong((id *)&self->_rendererController, a3);
}

- (int64_t)cancelCount
{
  return self->_cancelCount;
}

- (void)setCancelCount:(int64_t)a3
{
  self->_cancelCount = a3;
}

- (BOOL)synchronous
{
  return self->_synchronous;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rendererController, 0);
}

@end
