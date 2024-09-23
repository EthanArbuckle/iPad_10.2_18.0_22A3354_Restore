@implementation CKAssociatedMessageChatItem

+ (CATransform3D)transformForImageViewWithGeometryDescriptor:(SEL)a3 shouldScale:(IMAssociatedMessageGeometryDescriptor *)a4 parentSize:(BOOL)a5
{
  double width;
  double scale;
  double parentPreviewWidth;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  double rotation;
  CATransform3D v17;
  CATransform3D v18;

  width = a6.width;
  scale = 1.0;
  if (a5)
  {
    if (a4->layoutIntent == 12)
    {
      scale = a4->scale;
    }
    else
    {
      parentPreviewWidth = a4->parentPreviewWidth;
      if (parentPreviewWidth > 0.0)
        scale = width / parentPreviewWidth;
    }
    if (scale < 0.100000001)
      scale = 0.100000001;
  }
  v11 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&v18.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&v18.m33 = v11;
  v12 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  *(_OWORD *)&v18.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  *(_OWORD *)&v18.m43 = v12;
  v13 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  *(_OWORD *)&v18.m11 = *MEMORY[0x1E0CD2610];
  *(_OWORD *)&v18.m13 = v13;
  v14 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  *(_OWORD *)&v18.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  *(_OWORD *)&v18.m23 = v14;
  *(_OWORD *)&v17.m31 = *(_OWORD *)&v18.m31;
  *(_OWORD *)&v17.m33 = v11;
  *(_OWORD *)&v17.m41 = *(_OWORD *)&v18.m41;
  *(_OWORD *)&v17.m43 = v12;
  *(_OWORD *)&v17.m11 = *(_OWORD *)&v18.m11;
  *(_OWORD *)&v17.m13 = v13;
  *(_OWORD *)&v17.m21 = *(_OWORD *)&v18.m21;
  *(_OWORD *)&v17.m23 = v14;
  CATransform3DScale(&v18, &v17, scale, scale, 1.0);
  rotation = a4->rotation;
  v17 = v18;
  return CATransform3DRotate(retstr, &v17, rotation, 0.0, 0.0, 1.0);
}

+ (double)verticalOriginForAssociatedMessageItemSize:(CGSize)a3 parentFrame:(CGRect)a4 geometryDescriptor:(IMAssociatedMessageGeometryDescriptor *)a5
{
  double height;
  double y;
  double v7;
  double yScalar;
  double v9;

  height = a4.size.height;
  y = a4.origin.y;
  v7 = a3.height;
  yScalar = a5->yScalar;
  if (CKMainScreenScale_once_32 != -1)
    dispatch_once(&CKMainScreenScale_once_32, &__block_literal_global_76_1);
  v9 = *(double *)&CKMainScreenScale_sMainScreenScale_32;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_32 == 0.0)
    v9 = 1.0;
  return round((y + height * yScalar + v7 * -0.5) * v9) / v9;
}

+ (double)horizontalOriginForAssociatedMessageItemSize:(CGSize)a3 parentFrame:(CGRect)a4 geometryDescriptor:(IMAssociatedMessageGeometryDescriptor *)a5
{
  double width;
  double x;
  double v7;
  double xScalar;
  double v9;

  width = a4.size.width;
  x = a4.origin.x;
  v7 = a3.width;
  xScalar = a5->xScalar;
  if (CKMainScreenScale_once_32 != -1)
    dispatch_once(&CKMainScreenScale_once_32, &__block_literal_global_76_1);
  v9 = *(double *)&CKMainScreenScale_sMainScreenScale_32;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_32 == 0.0)
    v9 = 1.0;
  return round((x + width * xScalar + v7 * -0.5) * v9) / v9;
}

+ (CGRect)frameForAssociatedMessageItemSize:(CGSize)a3 parentFrame:(CGRect)a4 geometryDescriptor:(IMAssociatedMessageGeometryDescriptor *)a5
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  __int128 v13;
  double v14;
  double v15;
  __int128 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  double rotation;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.height;
  v11 = a3.width;
  v13 = *(_OWORD *)&a5->parentPreviewWidth;
  v21 = *(_OWORD *)&a5->layoutIntent;
  v22 = v13;
  v23 = *(_OWORD *)&a5->yScalar;
  rotation = a5->rotation;
  objc_msgSend(a1, "verticalOriginForAssociatedMessageItemSize:parentFrame:geometryDescriptor:", &v21, a3.width, v10);
  v15 = v14;
  v16 = *(_OWORD *)&a5->parentPreviewWidth;
  v21 = *(_OWORD *)&a5->layoutIntent;
  v22 = v16;
  v23 = *(_OWORD *)&a5->yScalar;
  rotation = a5->rotation;
  objc_msgSend(a1, "horizontalOriginForAssociatedMessageItemSize:parentFrame:geometryDescriptor:", &v21, v11, v10, x, y, width, height);
  v18 = v15;
  v19 = v11;
  v20 = v10;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)frameRelativeToParentFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _BYTE v25[56];
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_opt_class();
  -[CKChatItem size](self, "size");
  v10 = v9;
  v12 = v11;
  -[CKAssociatedMessageChatItem adjustedParentFrameForPositioning:](self, "adjustedParentFrameForPositioning:", x, y, width, height);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[CKAssociatedMessageChatItem geometryDescriptor](self, "geometryDescriptor");
  objc_msgSend(v8, "frameForAssociatedMessageItemSize:parentFrame:geometryDescriptor:", v25, v10, v12, v14, v16, v18, v20);
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (double)verticalOriginRelativeToParentFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double result;
  _BYTE v22[56];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_opt_class();
  -[CKChatItem size](self, "size");
  v10 = v9;
  v12 = v11;
  -[CKAssociatedMessageChatItem adjustedParentFrameForPositioning:](self, "adjustedParentFrameForPositioning:", x, y, width, height);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[CKAssociatedMessageChatItem geometryDescriptor](self, "geometryDescriptor");
  objc_msgSend(v8, "verticalOriginForAssociatedMessageItemSize:parentFrame:geometryDescriptor:", v22, v10, v12, v14, v16, v18, v20);
  return result;
}

- (double)horizonalOriginRelativeToParentFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double result;
  _BYTE v22[56];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_opt_class();
  -[CKChatItem size](self, "size");
  v10 = v9;
  v12 = v11;
  -[CKAssociatedMessageChatItem adjustedParentFrameForPositioning:](self, "adjustedParentFrameForPositioning:", x, y, width, height);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[CKAssociatedMessageChatItem geometryDescriptor](self, "geometryDescriptor");
  objc_msgSend(v8, "horizontalOriginForAssociatedMessageItemSize:parentFrame:geometryDescriptor:", v22, v10, v12, v14, v16, v18, v20);
  return result;
}

- (CATransform3D)transformForImageViewWithParentSize:(SEL)a3 shouldScale:(CGSize)a4
{
  _BOOL8 v5;
  double height;
  double width;
  void *v10;
  CATransform3D *result;
  _BYTE v12[56];

  v5 = a5;
  height = a4.height;
  width = a4.width;
  v10 = (void *)objc_opt_class();
  result = -[CKAssociatedMessageChatItem geometryDescriptor](self, "geometryDescriptor");
  if (v10)
    return (CATransform3D *)objc_msgSend(v10, "transformForImageViewWithGeometryDescriptor:shouldScale:parentSize:", v12, v5, width, height);
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  return result;
}

- (CGRect)adjustedParentFrameForPositioning:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_opt_class();
  -[CKChatItem size](self, "size");
  objc_msgSend(v8, "adjustedParentFrameForPositioning:forItemSize:", x, y, width, height, v9, v10);
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)adjustContentAlignmentRect:(CGRect)a3 forChatItemSize:(CGSize)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  objc_msgSend((id)objc_opt_class(), "adjustContentAlignmentRect:forChatItemSize:transcriptOrientation:", -[CKAssociatedMessageChatItem transcriptOrientation](self, "transcriptOrientation"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.width, a4.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (CGRect)adjustContentAlignmentRect:(CGRect)a3 forChatItemSize:(CGSize)a4 transcriptOrientation:(char)a5
{
  int v5;
  double width;
  CGFloat height;
  CGFloat v8;
  CGFloat y;
  double x;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v15;
  CGRect result;

  v5 = a5;
  width = a4.width;
  height = a3.size.height;
  v8 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (adjustContentAlignmentRect_forChatItemSize_transcriptOrientation__onceToken != -1)
    dispatch_once(&adjustContentAlignmentRect_forChatItemSize_transcriptOrientation__onceToken, &__block_literal_global_71);
  if (v5 == 2)
  {
    v15.origin.x = x;
    v15.origin.y = y;
    v15.size.width = v8;
    v15.size.height = height;
    x = CGRectGetMaxX(v15)
      - width
      + *(double *)&adjustContentAlignmentRect_forChatItemSize_transcriptOrientation__sTailWidth;
  }
  else if (!v5)
  {
    x = x - *(double *)&adjustContentAlignmentRect_forChatItemSize_transcriptOrientation__sTailWidth;
  }
  v11 = x;
  v12 = y;
  v13 = width;
  v14 = height;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

void __114__CKAssociatedMessageChatItem_TranscriptLayout__adjustContentAlignmentRect_forChatItemSize_transcriptOrientation___block_invoke()
{
  uint64_t v0;
  id v1;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "balloonMaskTailSizeForTailShape:", 1);
  adjustContentAlignmentRect_forChatItemSize_transcriptOrientation__sTailWidth = v0;

}

+ (void)applyTransformToView:(id)a3 viewFrame:(CGRect)a4 parentSize:(CGSize)a5 forGeometryDescriptor:(IMAssociatedMessageGeometryDescriptor *)a6
{
  double height;
  double width;
  double *v9;
  uint64_t v10;
  id v11;
  double v12;
  float64x2_t v13;
  float64x2_t v14;
  double v20;
  double v21;
  _BOOL8 v22;
  __int128 v23;
  void *v24;
  float64x2_t v25;
  CGPoint origin;
  CGFloat y;
  double v28;
  double v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;

  height = a5.height;
  width = a5.width;
  v28 = a4.size.width;
  v29 = a4.size.height;
  origin = a4.origin;
  y = a4.origin.y;
  v9 = (double *)MEMORY[0x1E0C9D648];
  v25 = *(float64x2_t *)(MEMORY[0x1E0C9D648] + 16);
  v10 = CKMainScreenScale_once_32;
  v11 = a3;
  if (v10 != -1)
    dispatch_once(&CKMainScreenScale_once_32, &__block_literal_global_76_1);
  v12 = *(double *)&CKMainScreenScale_sMainScreenScale_32;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_32 == 0.0)
    v12 = 1.0;
  v13.f64[0] = origin.x;
  v13.f64[1] = y;
  v14 = vmulq_n_f64(v13, v12);
  v13.f64[0] = v28;
  v13.f64[1] = v29;
  __asm { FMOV            V2.2D, #0.5 }
  v20 = *v9;
  v21 = v9[1];
  objc_msgSend(v11, "setCenter:", vmulq_n_f64(vaddq_f64(v14, vrndmq_f64(vmulq_f64(vsubq_f64(vmulq_n_f64(v13, v12), vmulq_n_f64(v25, v12)), _Q2))), 1.0 / v12), *(_OWORD *)&v25, origin);
  objc_msgSend(v11, "setBounds:", v20, v21, v28, v29);
  v22 = a6->layoutIntent - 12 < 0xFFFFFFFFFFFFFFF5;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v23 = *(_OWORD *)&a6->parentPreviewWidth;
  v30 = *(_OWORD *)&a6->layoutIntent;
  v31 = v23;
  v32 = *(_OWORD *)&a6->yScalar;
  *(double *)&v33 = a6->rotation;
  +[CKAssociatedMessageChatItem transformForImageViewWithGeometryDescriptor:shouldScale:parentSize:](CKAssociatedMessageChatItem, "transformForImageViewWithGeometryDescriptor:shouldScale:parentSize:", &v30, v22, width, height);
  objc_msgSend(v11, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = v42;
  v35 = v43;
  v36 = v44;
  v37 = v45;
  v30 = v38;
  v31 = v39;
  v32 = v40;
  v33 = v41;
  objc_msgSend(v24, "setTransform:", &v30);

}

+ (CGPoint)locationForStickerReactionWithParentFrame:(CGRect)a3 reactionIndex:(int64_t)a4 parentIsFromMe:(BOOL)a5 insets:(UIEdgeInsets)a6
{
  double right;
  double bottom;
  double left;
  double top;
  _BOOL4 v10;
  double height;
  double width;
  double y;
  double x;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGPoint result;

  right = a6.right;
  bottom = a6.bottom;
  left = a6.left;
  top = a6.top;
  v10 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CKMainScreenScale_once_32 != -1)
    dispatch_once(&CKMainScreenScale_once_32, &__block_literal_global_76_1);
  v16 = *(double *)&CKMainScreenScale_sMainScreenScale_32;
  v17 = 1.0;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_32 == 0.0)
    v16 = 1.0;
  v18 = floor(x * v16) / v16;
  v19 = floor(y * v16) / v16;
  v20 = *(double *)&CKMainScreenScale_sMainScreenScale_32;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_32 == 0.0)
    v20 = 1.0;
  v21 = floor(width * v20) / v20;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_32 != 0.0)
    v17 = *(double *)&CKMainScreenScale_sMainScreenScale_32;
  v22 = floor(height * v17) / v17;
  v23 = left + v18;
  v24 = top + v19;
  v25 = v21 - (left + right);
  v26 = v22 - (top + bottom);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stickerReactionSize");
  +[CKStickerReactionLayoutHelper stickerCenterForIndex:inFrame:alignLeft:stickerSize:](CKStickerReactionLayoutHelper, "stickerCenterForIndex:inFrame:alignLeft:stickerSize:", a4, !v10, v23, v24, v25, v26, v28, v29);
  v31 = v30;
  v33 = v32;

  v34 = v31;
  v35 = v33;
  result.y = v35;
  result.x = v34;
  return result;
}

+ (double)rotationForGUIDHash:(int64_t)a3
{
  int64_t v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  if (a3 >= 0)
    v3 = a3;
  else
    v3 = -a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maxStickerReactionRotation");
  v6 = v5;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minStickerReactionRotation");
  v9 = v8;

  v10 = v9 + (double)(v3 % (uint64_t)(v6 - v9));
  if ((v3 & 1) == 0)
    v10 = -v10;
  return v10 * 3.14159265 / 180.0;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  return 0;
}

- (NSString)guid
{
  void *v2;
  void *v3;

  -[CKAssociatedMessageChatItem IMAssociatedMessageChatItem](self, "IMAssociatedMessageChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "guid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)associatedChatItemGUID
{
  void *v2;
  void *v3;
  void *v4;

  -[CKAssociatedMessageChatItem IMAssociatedMessageChatItem](self, "IMAssociatedMessageChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "associatedMessageGUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IMAssociatedMessageDecodeGUID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)associatedMessageGUID
{
  void *v2;
  void *v3;

  -[CKAssociatedMessageChatItem IMAssociatedMessageChatItem](self, "IMAssociatedMessageChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "associatedMessageGUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)parentMessageIsFromMe
{
  void *v2;
  char v3;

  -[CKAssociatedMessageChatItem IMAssociatedMessageChatItem](self, "IMAssociatedMessageChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "parentMessageIsFromMe");

  return v3;
}

- (unint64_t)stickerPositionVersion
{
  void *v2;
  unint64_t v3;

  -[CKAssociatedMessageChatItem IMAssociatedMessageChatItem](self, "IMAssociatedMessageChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "stickerPositionVersion");

  return v3;
}

- (char)transcriptOrientation
{
  if (-[CKChatItem isFromMe](self, "isFromMe"))
    return 0;
  else
    return 2;
}

- (BOOL)failed
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[CKChatItem isFromMe](self, "isFromMe");
  if (v3)
  {
    -[CKAssociatedMessageChatItem IMAssociatedMessageChatItem](self, "IMAssociatedMessageChatItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "failed");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (IMAssociatedMessageGeometryDescriptor)geometryDescriptor
{
  void *v4;
  IMAssociatedMessageGeometryDescriptor *result;
  void *v6;

  -[CKAssociatedMessageChatItem IMAssociatedMessageChatItem](self, "IMAssociatedMessageChatItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "geometryDescriptor");
    v4 = v6;
  }
  else
  {
    retstr->rotation = 0.0;
    *(_OWORD *)&retstr->parentPreviewWidth = 0u;
    *(_OWORD *)&retstr->yScalar = 0u;
    *(_OWORD *)&retstr->layoutIntent = 0u;
  }

  return result;
}

- (id)loadTranscriptDrawerText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timestampDateFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "drawerTranscriptTextAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, v7);
  else
    v8 = 0;

  return v8;
}

- (NSString)timestampString
{
  NSString *timestampString;
  void *v4;
  NSString *v5;
  NSString *v6;

  timestampString = self->_timestampString;
  if (!timestampString)
  {
    -[CKAssociatedMessageChatItem loadTimestampString](self, "loadTimestampString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSString *)objc_msgSend(v4, "copy");
    v6 = self->_timestampString;
    self->_timestampString = v5;

    timestampString = self->_timestampString;
  }
  return timestampString;
}

- (NSDate)time
{
  void *v2;
  void *v3;

  -[CKAssociatedMessageChatItem IMAssociatedMessageChatItem](self, "IMAssociatedMessageChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "time");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (id)sender
{
  void *v2;
  void *v3;

  -[CKAssociatedMessageChatItem IMAssociatedMessageChatItem](self, "IMAssociatedMessageChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (_NSRange)associatedMessageRange
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[CKAssociatedMessageChatItem IMAssociatedMessageChatItem](self, "IMAssociatedMessageChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "associatedMessageRange");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (int64_t)associatedMessageType
{
  void *v2;
  int64_t v3;

  -[CKAssociatedMessageChatItem IMAssociatedMessageChatItem](self, "IMAssociatedMessageChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "associatedMessageType");

  return v3;
}

- (id)loadTimestampString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CKAssociatedMessageChatItem time](self, "time");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKDateUtilities relativeDateFormatterFromDate:toDate:](CKDateUtilities, "relativeDateFormatterFromDate:toDate:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)wantsDrawerLayout
{
  return 1;
}

- (UIImage)attributionImage
{
  return 0;
}

- (UIColor)attributionImageTintColor
{
  return 0;
}

- (void)setTimestampString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestampString, 0);
}

@end
