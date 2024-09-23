@implementation QLPXSwipeDownTracker

- (QLPXSwipeDownTracker)init
{
  return -[QLPXSwipeDownTracker initWithOptions:](self, "initWithOptions:", 0);
}

- (QLPXSwipeDownTracker)initWithOptions:(unint64_t)a3
{
  QLPXSwipeDownTracker *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLPXSwipeDownTracker;
  result = -[QLPXSwipeDownTracker init](&v5, sel_init);
  if (result)
  {
    result->_options = a3;
    *(_OWORD *)&result->_trackedVelocity.x = QLPXDisplayVelocityZero;
    *(_OWORD *)&result->_trackedVelocity.scale = unk_20D5B1838;
    *(_OWORD *)&result->_finalAnimationDuration = xmmword_20D5B1650;
  }
  return result;
}

- (void)startTrackingCenter:(CGPoint)a3 bounds:(CGRect)a4 transform:(CGAffineTransform *)a5 withInitialGestureLocation:(CGPoint)a6
{
  double height;
  double width;
  double y;
  double x;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[3];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  self->_didStartTracking = 1;
  self->_initialTouchLocation = a6;
  self->_initialCenter = a3;
  self->_initialBounds = a4;
  v12 = *(_OWORD *)&a5->a;
  v13 = *(_OWORD *)&a5->tx;
  *(_OWORD *)&self->_initialTransform.c = *(_OWORD *)&a5->c;
  *(_OWORD *)&self->_initialTransform.tx = v13;
  *(_OWORD *)&self->_initialTransform.a = v12;
  -[QLPXSwipeDownTracker setTrackedCenter:](self, "setTrackedCenter:");
  -[QLPXSwipeDownTracker setTrackedBounds:](self, "setTrackedBounds:", x, y, width, height);
  v14 = *(_OWORD *)&a5->c;
  v15[0] = *(_OWORD *)&a5->a;
  v15[1] = v14;
  v15[2] = *(_OWORD *)&a5->tx;
  -[QLPXSwipeDownTracker setTrackedTransform:](self, "setTrackedTransform:", v15);
}

- (void)trackGestureTranslation:(CGPoint)a3 velocity:(CGPoint)a4
{
  double x;
  double v5;
  double v6;
  char v8;
  QLPXChangeDirectionNumberFilter *v9;
  uint64_t v10;
  QLPXChangeDirectionNumberFilter *v11;
  double v12;
  QLPXInitialHysteresisNumberFilter *v13;
  void (**v14)(void *, __int128 *, uint64_t *, uint64_t *, double, double, double);
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  __int128 v19;
  __int128 v20;
  double v21;
  CGFloat v22;
  void (**v23)(void *, __int128 *, uint64_t *, uint64_t *, double, double, double);
  QLPXInitialHysteresisNumberFilter *v24;
  void (**v25)(void *, __int128 *, uint64_t *, uint64_t *, double, double, double);
  double v26;
  void (**v27)(void *, __int128 *, uint64_t *, uint64_t *, double, double, double);
  QLPXInitialHysteresisNumberFilter *v28;
  double v29;
  void (**v30)(void *, __int128 *, uint64_t *, uint64_t *, double, double, double);
  QLPXInitialHysteresisNumberFilter *v31;
  double v32;
  _BOOL8 v33;
  double v34;
  double v35;
  double v36;
  double height;
  double width;
  double v39;
  double v40;
  double v41;
  double v42;
  double y;
  CGAffineTransform v44;
  _QWORD v45[4];
  QLPXInitialHysteresisNumberFilter *v46;
  void (**v47)(void *, __int128 *, uint64_t *, uint64_t *, double, double, double);
  uint64_t *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  _QWORD v53[4];
  QLPXInitialHysteresisNumberFilter *v54;
  void (**v55)(void *, __int128 *, uint64_t *, uint64_t *, double, double, double);
  uint64_t *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  _QWORD v61[4];
  void (**v62)(void *, __int128 *, uint64_t *, uint64_t *, double, double, double);
  uint64_t *v63;
  double v64;
  double v65;
  double v66;
  _QWORD v67[4];
  QLPXInitialHysteresisNumberFilter *v68;
  void (**v69)(void *, __int128 *, uint64_t *, uint64_t *, double, double, double);
  uint64_t *v70;
  double v71;
  double v72;
  CGAffineTransform v73;
  CGAffineTransform v74;
  uint64_t v75;
  double *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  double *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  double *v84;
  uint64_t v85;
  const char *v86;
  __int128 v87;
  _QWORD v88[6];
  _QWORD aBlock[7];
  char v90;
  _QWORD v91[6];
  _QWORD v92[4];
  QLPXChangeDirectionNumberFilter *v93;

  y = a4.y;
  x = a4.x;
  v5 = a3.y;
  v6 = a3.x;
  v8 = -[QLPXSwipeDownTracker options](self, "options") & 1;
  if (v8)
  {
    x = 0.0;
    v6 = 0.0;
  }
  -[QLPXSwipeDownTracker verticalDirectionFilter](self, "verticalDirectionFilter");
  v9 = (QLPXChangeDirectionNumberFilter *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  if (!v9)
  {
    v11 = objc_alloc_init(QLPXChangeDirectionNumberFilter);
    -[QLPXChangeDirectionNumberFilter setMinimumChange:](v11, "setMinimumChange:", 5.0);
    v92[0] = v10;
    v92[1] = 3221225472;
    v92[2] = __57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke;
    v92[3] = &unk_24C725A90;
    v9 = v11;
    v93 = v9;
    -[QLPXNumberFilter performChanges:](v9, "performChanges:", v92);
    -[QLPXSwipeDownTracker setVerticalDirectionFilter:](self, "setVerticalDirectionFilter:", v9);

  }
  v91[0] = v10;
  v91[1] = 3221225472;
  v91[2] = __57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_2;
  v91[3] = &__block_descriptor_48_e35_v16__0___QLPXMutableNumberFilter__8l;
  *(double *)&v91[4] = v6;
  *(double *)&v91[5] = v5;
  -[QLPXNumberFilter performChanges:](v9, "performChanges:", v91);
  -[QLPXNumberFilter output](v9, "output");
  if (self->_didStartTracking)
  {
    v35 = v12;
    -[QLPXSwipeDownTracker horizontalTranslationFilter](self, "horizontalTranslationFilter");
    v13 = (QLPXInitialHysteresisNumberFilter *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v13 = objc_alloc_init(QLPXInitialHysteresisNumberFilter);
      -[QLPXInitialHysteresisNumberFilter setHysteresis:](v13, "setHysteresis:", 20.0);
      -[QLPXSwipeDownTracker setHorizontalTranslationFilter:](self, "setHorizontalTranslationFilter:", v13);
    }
    aBlock[0] = v10;
    aBlock[1] = 3221225472;
    aBlock[2] = __57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_3;
    aBlock[3] = &unk_24C725AD8;
    v90 = v8;
    aBlock[4] = self;
    *(double *)&aBlock[5] = v6;
    *(double *)&aBlock[6] = v5;
    v14 = (void (**)(void *, __int128 *, uint64_t *, uint64_t *, double, double, double))_Block_copy(aBlock);
    v88[0] = v10;
    v88[1] = 3221225472;
    v88[2] = __57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_5;
    v88[3] = &__block_descriptor_48_e35_v16__0___QLPXMutableNumberFilter__8l;
    *(double *)&v88[4] = v6;
    *(double *)&v88[5] = v5;
    -[QLPXNumberFilter performChanges:](v13, "performChanges:", v88);
    -[QLPXNumberFilter output](v13, "output");
    v16 = v15;
    v83 = 0;
    v84 = (double *)&v83;
    v85 = 0x3010000000;
    v86 = "";
    v87 = *MEMORY[0x24BDBEFB0];
    v79 = 0;
    v80 = (double *)&v79;
    v81 = 0x2020000000;
    v82 = 0x3FF0000000000000;
    v75 = 0;
    v76 = (double *)&v75;
    v77 = 0x2020000000;
    v78 = 0;
    v14[2](v14, &v87, &v82, &v78, v6, v5, v15);
    v17 = self->_initialBounds.origin.x;
    v41 = self->_initialCenter.y;
    v42 = self->_initialCenter.x;
    v18 = self->_initialBounds.origin.y;
    height = self->_initialBounds.size.height;
    width = self->_initialBounds.size.width;
    v19 = *(_OWORD *)&self->_initialTransform.tx;
    v20 = *(_OWORD *)&self->_initialTransform.a;
    *(_OWORD *)&v74.c = *(_OWORD *)&self->_initialTransform.c;
    *(_OWORD *)&v74.tx = v19;
    v39 = v84[4];
    v40 = v84[5];
    v21 = v80[3];
    v22 = v76[3];
    *(_OWORD *)&v73.a = v20;
    *(_OWORD *)&v73.c = *(_OWORD *)&v74.c;
    *(_OWORD *)&v73.tx = *(_OWORD *)&self->_initialTransform.tx;
    *(_OWORD *)&v74.a = v20;
    CGAffineTransformRotate(&v74, &v73, v22);
    v67[0] = v10;
    v67[1] = 3221225472;
    v67[2] = __57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_6;
    v67[3] = &unk_24C725B00;
    v23 = v14;
    v69 = v23;
    v71 = v6;
    v72 = v5;
    v24 = v13;
    v68 = v24;
    v70 = &v83;
    v34 = QLPXDerivative(v67, 0.0);
    v36 = v18;
    v61[0] = v10;
    v61[1] = 3221225472;
    v61[2] = __57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_7;
    v61[3] = &unk_24C725B28;
    v25 = v23;
    v64 = v6;
    v65 = v5;
    v66 = v16;
    v62 = v25;
    v63 = &v83;
    v26 = QLPXDerivative(v61, v5);
    v53[0] = v10;
    v53[1] = 3221225472;
    v53[2] = __57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_8;
    v53[3] = &unk_24C725B50;
    v27 = v25;
    v55 = v27;
    v57 = v6;
    v58 = v5;
    v59 = x;
    v60 = y;
    v28 = v24;
    v54 = v28;
    v56 = &v79;
    v29 = QLPXDerivative(v53, 0.0);
    v45[0] = v10;
    v45[1] = 3221225472;
    v45[2] = __57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_9;
    v45[3] = &unk_24C725B50;
    v30 = v27;
    v47 = v30;
    v49 = v6;
    v50 = v5;
    v51 = x;
    v52 = y;
    v31 = v28;
    v46 = v31;
    v48 = &v75;
    v32 = QLPXDerivative(v45, 0.0);
    -[QLPXSwipeDownTracker setTrackedCenter:](self, "setTrackedCenter:", v42 + v39, v41 + v40);
    -[QLPXSwipeDownTracker setTrackedBounds:](self, "setTrackedBounds:", v17, v36, width * v21, height * v21);
    v44 = v74;
    -[QLPXSwipeDownTracker setTrackedTransform:](self, "setTrackedTransform:", &v44);
    -[QLPXSwipeDownTracker setTrackedVelocity:](self, "setTrackedVelocity:", x * v34, y * v26, v29, v32);

    _Block_object_dispose(&v75, 8);
    _Block_object_dispose(&v79, 8);
    _Block_object_dispose(&v83, 8);

    v12 = v35;
  }
  v33 = v12 >= 0.0;
  -[QLPXSwipeDownTracker setDismissalProgress:](self, "setDismissalProgress:", v5 / 400.0);
  -[QLPXSwipeDownTracker setShouldFinishDismissal:](self, "setShouldFinishDismissal:", v33);

}

void __57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "minimumChange");
  objc_msgSend(v4, "setInput:", v3 + 1.0);

}

uint64_t __57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInput:", *(double *)(a1 + 40));
}

void __57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_3(uint64_t a1, double *a2, double *a3, double *a4, double a5, double a6)
{
  double v9;
  double v12;
  long double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double *v23;
  CGFloat v24;
  CGFloat v25;
  __int128 v26;
  double v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGAffineTransform v30;
  double v31;
  double v32;

  v9 = a6;
  v32 = 1.0;
  if (a6 <= 0.0)
  {
    v12 = 1.0;
    v17 = log(fabs(a5) / 100.0 + 1.0) * 100.0;
    if (a5 >= 0.0)
      v18 = 0.0;
    else
      v18 = -1.0;
    if (a5 > 0.0)
      v18 = 1.0;
    v16 = v18 * v17;
    v19 = log(fabs(v9) / 100.0 + 1.0) * 100.0;
    if (v9 >= 0.0)
      v20 = 0.0;
    else
      v20 = -1.0;
    v9 = v20 * v19;
  }
  else
  {
    v12 = 1.0;
    if (!*(_BYTE *)(a1 + 56))
    {
      v13 = atan(a6 / 200.0);
      v12 = cos(v13) * 0.5 + 0.5;
      v32 = v12;
    }
    v14 = log(fabs(a5) / 100.0 + 1.0) * 100.0;
    v15 = 0.0;
    if (a5 < 0.0)
      v15 = -1.0;
    if (a5 > 0.0)
      v15 = 1.0;
    v16 = v15 * v14;
  }
  v21 = *(double *)(a1 + 48);
  if (v21 == 0.0)
    v22 = 0.0;
  else
    v22 = v9 / v21 * 0.0;
  v31 = v22;
  v23 = *(double **)(a1 + 32);
  v24 = v23[2] - v23[4];
  v25 = v23[3] - v23[5];
  v26 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v30.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v30.c = v26;
  *(_OWORD *)&v30.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  *(_OWORD *)&v29.a = *(_OWORD *)&v30.a;
  *(_OWORD *)&v29.c = v26;
  *(_OWORD *)&v29.tx = *(_OWORD *)&v30.tx;
  CGAffineTransformTranslate(&v30, &v29, v24, v25);
  v28 = v30;
  CGAffineTransformScale(&v29, &v28, v12, v12);
  v30 = v29;
  v28 = v29;
  CGAffineTransformRotate(&v29, &v28, v22);
  v30 = v29;
  v28 = v29;
  CGAffineTransformTranslate(&v29, &v28, -v24, -v25);
  v30 = v29;
  *(_OWORD *)&v28.a = *MEMORY[0x24BDBEFB0];
  QLPXAffineTransformDecomposeTranslationScaleRotation((uint64_t)&v29, &v28, &v32, 0, &v31);
  if (a2)
  {
    v27 = v9 + v28.b;
    *a2 = v16 + v28.a;
    a2[1] = v27;
  }
  if (a3)
    *a3 = v32;
  if (a4)
    *a4 = v31;
}

uint64_t __57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInput:", *(double *)(a1 + 32));
}

double __57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_6(uint64_t a1, double a2)
{
  double v4;
  double v5;
  uint64_t v6;
  double v7;

  v4 = *(double *)(a1 + 64);
  v5 = *(double *)(a1 + 56) + a2;
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "outputDerivative");
  (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD, double, double, double))(v6 + 16))(v6, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32, 0, 0, v5, v4, v7 * a2);
  return *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32);
}

double __57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_7(uint64_t a1, double a2)
{
  (*(void (**)(double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 48), a2, *(double *)(a1 + 64));
  return *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
}

double __57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_8(uint64_t a1, double a2)
{
  double v4;
  double v5;
  uint64_t v6;
  double v7;

  v4 = *(double *)(a1 + 56) + a2 * *(double *)(a1 + 72);
  v5 = *(double *)(a1 + 64) + a2 * *(double *)(a1 + 80);
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "outputDerivative");
  (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD, double, double, double))(v6 + 16))(v6, 0, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24, 0, v4, v5, v7 * a2 * *(double *)(a1 + 72));
  return *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

double __57__QLPXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_9(uint64_t a1, double a2)
{
  double v4;
  double v5;
  uint64_t v6;
  double v7;

  v4 = *(double *)(a1 + 56) + a2 * *(double *)(a1 + 72);
  v5 = *(double *)(a1 + 64) + a2 * *(double *)(a1 + 80);
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "outputDerivative");
  (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t, double, double, double))(v6 + 16))(v6, 0, 0, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24, v4, v5, v7 * a2 * *(double *)(a1 + 72));
  return *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

- (unint64_t)options
{
  return self->_options;
}

- (double)dismissalProgress
{
  return self->_dismissalProgress;
}

- (void)setDismissalProgress:(double)a3
{
  self->_dismissalProgress = a3;
}

- (BOOL)shouldFinishDismissal
{
  return self->_shouldFinishDismissal;
}

- (void)setShouldFinishDismissal:(BOOL)a3
{
  self->_shouldFinishDismissal = a3;
}

- (CGPoint)trackedCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_trackedCenter.x;
  y = self->_trackedCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTrackedCenter:(CGPoint)a3
{
  self->_trackedCenter = a3;
}

- (CGRect)trackedBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_trackedBounds.origin.x;
  y = self->_trackedBounds.origin.y;
  width = self->_trackedBounds.size.width;
  height = self->_trackedBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTrackedBounds:(CGRect)a3
{
  self->_trackedBounds = a3;
}

- (CGAffineTransform)trackedTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[5].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[5].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[6].b;
  return self;
}

- (void)setTrackedTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_trackedTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_trackedTransform.tx = v4;
  *(_OWORD *)&self->_trackedTransform.a = v3;
}

- (QLPXDisplayVelocity)trackedVelocity
{
  double x;
  double y;
  double scale;
  double rotation;
  QLPXDisplayVelocity result;

  x = self->_trackedVelocity.x;
  y = self->_trackedVelocity.y;
  scale = self->_trackedVelocity.scale;
  rotation = self->_trackedVelocity.rotation;
  result.rotation = rotation;
  result.scale = scale;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTrackedVelocity:(QLPXDisplayVelocity)a3
{
  self->_trackedVelocity = a3;
}

- (double)finalAnimationDuration
{
  return self->_finalAnimationDuration;
}

- (double)finalAnimationSpringDamping
{
  return self->_finalAnimationSpringDamping;
}

- (QLPXChangeDirectionNumberFilter)verticalDirectionFilter
{
  return self->_verticalDirectionFilter;
}

- (void)setVerticalDirectionFilter:(id)a3
{
  objc_storeStrong((id *)&self->_verticalDirectionFilter, a3);
}

- (QLPXInitialHysteresisNumberFilter)horizontalTranslationFilter
{
  return self->_horizontalTranslationFilter;
}

- (void)setHorizontalTranslationFilter:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalTranslationFilter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalTranslationFilter, 0);
  objc_storeStrong((id *)&self->_verticalDirectionFilter, 0);
}

@end
