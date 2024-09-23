@implementation CIFaceFeature

- (id)type
{
  return CFSTR("Face");
}

- (CIFaceFeature)initWithBounds:(CGRect)a3 hasLeftEyePosition:(BOOL)a4 leftEyePosition:(CGPoint)a5 hasRightEyePosition:(BOOL)a6 rightEyePosition:(CGPoint)a7 hasMouthPosition:(BOOL)a8 mouthPosition:(CGPoint)a9 hasFaceAngle:(BOOL)a10 faceAngle:(float)a11 hasTrackingID:(BOOL)a12 trackingID:(int)a13 hasTrackingFrameCount:(BOOL)a14 trackingFrameCount:(int)a15 hasSmile:(BOOL)a16 leftEyeClosed:(BOOL)a17 rightEyeClosed:(BOOL)a18 landmarks:(id)a19
{
  _BOOL4 v19;
  char y_low;
  char x_low;
  CGFloat y;
  CGFloat x;
  CGFloat v26;
  CGFloat v27;
  CGFloat height;
  CGFloat width;
  CGFloat v31;
  CGFloat v32;
  CIFaceFeature *v33;
  CIFaceFeature *v34;
  objc_super v36;
  uint64_t v37;

  v19 = a10;
  y_low = LOBYTE(a9.y);
  x_low = LOBYTE(a9.x);
  y = a7.y;
  x = a7.x;
  v26 = a5.y;
  v27 = a5.x;
  height = a3.size.height;
  width = a3.size.width;
  v31 = a3.origin.y;
  v32 = a3.origin.x;
  v36.receiver = self;
  v36.super_class = (Class)CIFaceFeature;
  v33 = -[CIFeature init](&v36, sel_init);
  v34 = v33;
  if (v33)
  {
    v33->bounds.origin.x = v32;
    v33->bounds.origin.y = v31;
    v33->bounds.size.width = width;
    v33->bounds.size.height = height;
    v33->hasLeftEyePosition = a4;
    v33->leftEyePosition.x = v27;
    v33->leftEyePosition.y = v26;
    v33->hasRightEyePosition = a6;
    v33->rightEyePosition.x = x;
    v33->rightEyePosition.y = y;
    v33->hasMouthPosition = a8;
    v33->mouthPosition.x = *(CGFloat *)&a11;
    v33->mouthPosition.y = *(CGFloat *)&a13;
    v33->hasFaceAngle = x_low;
    LODWORD(v33->faceAngle) = a15;
    v33->hasTrackingID = y_low;
    v33->trackingID = v19;
    v33->hasTrackingFrameCount = a16;
    v33->trackingFrameCount = (int)a19;
    *(_WORD *)&v33->hasSmile = WORD2(a19);
    v33->rightEyeClosed = BYTE6(a19);
    v33->landmarks = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", v37, 1);
  }
  return v34;
}

- (id)debugDescription
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__CIFaceFeature_debugDescription__block_invoke;
  v3[3] = &unk_1E2EC2F58;
  v3[4] = self;
  return (id)(id)stream_to_string((uint64_t)v3);
}

uint64_t __33__CIFaceFeature_debugDescription__block_invoke(uint64_t a1, FILE *a2)
{
  const char *v4;
  double x;
  double y;
  double width;
  double height;
  const char *v9;
  size_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  CGRect v14;
  CGRect v15;

  v4 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
  fprintf(a2, "<%s: %p ", v4, *(const void **)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  if (CGRectIsInfinite(v14))
  {
    v9 = "[infinite]";
    v10 = 10;
LABEL_5:
    fwrite(v9, v10, 1uLL, a2);
    goto LABEL_7;
  }
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  if (CGRectIsEmpty(v15))
  {
    v9 = "[empty]";
    v10 = 7;
    goto LABEL_5;
  }
  fprintf(a2, "[%g %g %g %g]", x, y, width, height);
LABEL_7:
  fwrite(">\n", 2uLL, 1uLL, a2);
  v11 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v11 + 40))
  {
    fprintf(a2, "    leftEye: (%g,%g)\n", *(double *)(v11 + 48), *(double *)(v11 + 56));
    v11 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v11 + 64))
  {
    fprintf(a2, "    leftEye: (%g,%g)\n", *(double *)(v11 + 72), *(double *)(v11 + 80));
    v11 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v11 + 88))
  {
    fprintf(a2, "    mouth: (%g,%g)\n", *(double *)(v11 + 96), *(double *)(v11 + 104));
    v11 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v11 + 128))
  {
    fprintf(a2, "    faceAngle: %g\n", *(float *)(v11 + 132));
    v11 = *(_QWORD *)(a1 + 32);
  }
  fprintf(a2, "    hasSmile: %d\n", *(unsigned __int8 *)(v11 + 136));
  fprintf(a2, "    leftEyeClosed: %d\n", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 137));
  result = fprintf(a2, "    rightEyeClosed: %d\n", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 138));
  v13 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v13 + 112))
  {
    result = fprintf(a2, "    trackingID: %d\n", *(_DWORD *)(v13 + 116));
    v13 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v13 + 120))
    return fprintf(a2, "    trackingFrameCount: %d\n", *(_DWORD *)(v13 + 124));
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->landmarks = 0;
  v3.receiver = self;
  v3.super_class = (Class)CIFaceFeature;
  -[CIFaceFeature dealloc](&v3, sel_dealloc);
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->bounds, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)hasLeftEyePosition
{
  return self->hasLeftEyePosition;
}

- (CGPoint)leftEyePosition
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->leftEyePosition, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)hasRightEyePosition
{
  return self->hasRightEyePosition;
}

- (CGPoint)rightEyePosition
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->rightEyePosition, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)hasMouthPosition
{
  return self->hasMouthPosition;
}

- (CGPoint)mouthPosition
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->mouthPosition, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)hasTrackingID
{
  return self->hasTrackingID;
}

- (int)trackingID
{
  return self->trackingID;
}

- (BOOL)hasTrackingFrameCount
{
  return self->hasTrackingFrameCount;
}

- (int)trackingFrameCount
{
  return self->trackingFrameCount;
}

- (BOOL)hasFaceAngle
{
  return self->hasFaceAngle;
}

- (float)faceAngle
{
  return self->faceAngle;
}

- (BOOL)hasSmile
{
  return self->hasSmile;
}

- (BOOL)leftEyeClosed
{
  return self->leftEyeClosed;
}

- (BOOL)rightEyeClosed
{
  return self->rightEyeClosed;
}

- (NSDictionary)landmarks
{
  return self->landmarks;
}

@end
