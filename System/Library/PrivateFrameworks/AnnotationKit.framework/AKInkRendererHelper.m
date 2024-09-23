@implementation AKInkRendererHelper

+ (id)renderDrawing:(id)a3 clippedToStrokeSpaceRect:(CGRect)a4 scale:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  NSObject *v13;
  dispatch_group_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  dispatch_semaphore_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  CGRect v34;
  CGRect v35;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_229011AD4;
  v32 = sub_229011AE4;
  v33 = 0;
  v12 = (void *)MEMORY[0x22E2C10E4]();
  v13 = qword_255A27050;
  if (!qword_255A27050)
  {
    v14 = dispatch_group_create();
    v15 = (void *)qword_255A27050;
    qword_255A27050 = (uint64_t)v14;

    v13 = qword_255A27050;
  }
  dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_group_enter((dispatch_group_t)qword_255A27050);
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_229011AD4;
  v26 = sub_229011AE4;
  v27 = dispatch_semaphore_create(0);
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  v16 = CGRectGetWidth(v34);
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  v17 = CGRectGetHeight(v35);
  if (v16 >= v17)
    v17 = v16;
  if ((ceil(v17) + 2.0) * a5 >= 128.0)
    objc_msgSend(a1, "_createFullSizeRenderer");
  else
    +[AKInkRendererHelper _sharedOfflineInkRendererSmallSize](AKInkRendererHelper, "_sharedOfflineInkRendererSmallSize");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_229011AEC;
  v21[3] = &unk_24F1A7B08;
  v21[4] = &v28;
  v21[5] = &v22;
  objc_msgSend(v18, "renderDrawing:clippedToStrokeSpaceRect:scale:completion:", v11, v21, x, y, width, height, a5);
  dispatch_semaphore_wait((dispatch_semaphore_t)v23[5], 0xFFFFFFFFFFFFFFFFLL);

  _Block_object_dispose(&v22, 8);
  objc_autoreleasePoolPop(v12);
  v19 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v19;
}

+ (void)purgeSharedRenderer
{
  if (qword_255A27050)
    dispatch_group_notify((dispatch_group_t)qword_255A27050, MEMORY[0x24BDAC9B8], &unk_24F1A7178);
}

+ (double)maxRenderingSize
{
  double result;

  result = *(double *)&qword_255A27058;
  if (*(double *)&qword_255A27058 == 0.0)
  {
    objc_msgSend(a1, "_calculateMaxRenderingSize", *(double *)&qword_255A27058);
    qword_255A27058 = *(_QWORD *)&result;
  }
  return result;
}

+ (id)_sharedOfflineInkRendererSmallSize
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)qword_255A27048;
  if (!qword_255A27048)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDE33A8]), "initWithSize:scale:", 128.0, 128.0, 1.0);
    v4 = (void *)qword_255A27048;
    qword_255A27048 = v3;

    v2 = (void *)qword_255A27048;
  }
  return v2;
}

+ (id)_createFullSizeRenderer
{
  double v2;

  objc_msgSend(a1, "maxRenderingSize");
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDE33A8]), "initWithSize:scale:", v2, v2, 1.0);
}

+ (double)_calculateMaxRenderingSize
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double result;
  CGRect v17;
  CGRect v18;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v17.origin.x = v7;
  v17.origin.y = v9;
  v17.size.width = v11;
  v17.size.height = v13;
  v14 = v4 * CGRectGetWidth(v17);
  v18.origin.x = v7;
  v18.origin.y = v9;
  v18.size.width = v11;
  v18.size.height = v13;
  v15 = v4 * CGRectGetHeight(v18);
  if (v14 >= v15)
    v15 = v14;
  result = v15 * 1.5;
  if (result > 2048.0)
  {
    NSLog(CFSTR("Asking for a framebuffer larger than sMaxTextureSize. Limiting size to %f. (requested = %f)"), 0x40A0000000000000, *(_QWORD *)&result);
    return 2048.0;
  }
  return result;
}

@end
