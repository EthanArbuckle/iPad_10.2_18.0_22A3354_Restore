@implementation HKGraphSeriesSecondaryRenderContext

- (HKGraphSeriesSecondaryRenderContext)init
{
  HKGraphSeriesSecondaryRenderContext *v2;
  NSMutableArray *v3;
  NSMutableArray *aboveScreenRegions;
  NSMutableArray *v5;
  NSMutableArray *belowScreenRegions;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKGraphSeriesSecondaryRenderContext;
  v2 = -[HKGraphSeriesSecondaryRenderContext init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    aboveScreenRegions = v2->_aboveScreenRegions;
    v2->_aboveScreenRegions = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    belowScreenRegions = v2->_belowScreenRegions;
    v2->_belowScreenRegions = v5;

  }
  return v2;
}

- (void)addOffScreenRegionWithStartLocation:(double)a3 endLocation:(double)a4 color:(id)a5 aboveScreen:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  uint64_t v11;
  _HKGraphSeriesSecondaryRenderContextOffScreenRegion *v12;

  v6 = a6;
  v10 = a5;
  v12 = objc_alloc_init(_HKGraphSeriesSecondaryRenderContextOffScreenRegion);
  -[_HKGraphSeriesSecondaryRenderContextOffScreenRegion setStart:](v12, "setStart:", a3);
  -[_HKGraphSeriesSecondaryRenderContextOffScreenRegion setEnd:](v12, "setEnd:", a4);
  -[_HKGraphSeriesSecondaryRenderContextOffScreenRegion setColor:](v12, "setColor:", v10);

  v11 = 16;
  if (v6)
    v11 = 8;
  objc_msgSend(*(id *)((char *)&self->super.isa + v11), "addObject:", v12);

}

- (void)addOffScreenRegionAtLocation:(double)a3 color:(id)a4 aboveScreen:(BOOL)a5
{
  -[HKGraphSeriesSecondaryRenderContext addOffScreenRegionWithStartLocation:endLocation:color:aboveScreen:](self, "addOffScreenRegionWithStartLocation:endLocation:color:aboveScreen:", a4, a5, a3 + -5.0, a3 + 5.0);
}

- (void)drawInAxisRect:(CGRect)a3 backgroundColor:(id)a4 renderContext:(CGContext *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  double v12;
  double MinY;
  double v14;
  CGFloat MinX;
  CGFloat v16;
  CGFloat v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  id v41;
  double v42;
  double MaxY;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v54 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  CGContextSaveGState(a5);
  v12 = HKUIOnePixel();
  CGContextSetLineWidth(a5, v12 + v12);
  v55.origin.x = x;
  v55.origin.y = y;
  v55.size.width = width;
  v55.size.height = height;
  MinY = CGRectGetMinY(v55);
  v14 = HKUIOnePixel();
  v56.origin.x = x;
  v56.origin.y = y;
  v56.size.width = width;
  v56.size.height = height;
  MaxY = CGRectGetMaxY(v56);
  v42 = HKUIOnePixel();
  if (v11)
  {
    v57.origin.x = x;
    v57.origin.y = y;
    v57.size.width = width;
    v57.size.height = height;
    MinX = CGRectGetMinX(v57);
    v58.origin.x = x;
    v58.origin.y = y;
    v58.size.width = width;
    v58.size.height = height;
    v16 = CGRectGetWidth(v58);
    v59.origin.x = x;
    v59.origin.y = y;
    v59.size.width = width;
    v59.size.height = height;
    v17 = CGRectGetMinY(v59);
    CGContextSetFillColorWithColor(a5, (CGColorRef)objc_msgSend(objc_retainAutorelease(v11), "CGColor"));
    v60.origin.y = 0.0;
    v60.origin.x = MinX;
    v60.size.width = v16;
    v60.size.height = v17;
    CGContextFillRect(a5, v60);
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v18 = self->_aboveScreenRegions;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v19)
  {
    v20 = v19;
    v21 = MinY - (2.0 - v14);
    v22 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v49 != v22)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v24, "start", *(_QWORD *)&v42);
        v26 = v25;
        objc_msgSend(v24, "end");
        v28 = v27;
        objc_msgSend(v24, "color");
        v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CGContextSetFillColorWithColor(a5, (CGColorRef)objc_msgSend(v29, "CGColor"));

        v61.size.width = v28 - v26;
        v61.size.height = 2.0;
        v61.origin.x = v26;
        v61.origin.y = v21;
        CGContextFillRect(a5, v61);
      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v20);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v30 = self->_belowScreenRegions;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v31)
  {
    v32 = v31;
    v33 = MaxY - v42;
    v34 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v45 != v34)
          objc_enumerationMutation(v30);
        v36 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
        objc_msgSend(v36, "start", *(_QWORD *)&v42);
        v38 = v37;
        objc_msgSend(v36, "end");
        v40 = v39;
        objc_msgSend(v36, "color");
        v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CGContextSetFillColorWithColor(a5, (CGColorRef)objc_msgSend(v41, "CGColor"));

        v62.size.width = v40 - v38;
        v62.size.height = 2.0;
        v62.origin.x = v38;
        v62.origin.y = v33;
        CGContextFillRect(a5, v62);
      }
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v32);
  }

  CGContextRestoreGState(a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_belowScreenRegions, 0);
  objc_storeStrong((id *)&self->_aboveScreenRegions, 0);
}

@end
