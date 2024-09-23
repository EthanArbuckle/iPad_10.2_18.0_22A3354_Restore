@implementation _FEFocusMapRect

- (_FEFocusMapRect)initWithFrame:(CGRect)a3 coordinateSpace:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  _FEFocusMapRect *v10;
  _FEFocusMapRect *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_FEFocusMapRect;
  v10 = -[_FEFocusMapRect init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_frame.origin.x = x;
    v10->_frame.origin.y = y;
    v10->_frame.size.width = width;
    v10->_frame.size.height = height;
    objc_storeWeak((id *)&v10->_coordinateSpace, v9);
  }

  return v11;
}

- (BOOL)intersectsRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  BOOL v25;
  CGFloat v26;
  CGFloat v27;
  BOOL v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_FEFocusMapRect frame](self, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  if (CGRectIsNull(v32))
    return 0;
  v33.origin.x = v8;
  v33.origin.y = v10;
  v33.size.width = v12;
  v33.size.height = v14;
  if (CGRectIsNull(v33))
    return 0;
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  v35 = CGRectStandardize(v34);
  v16 = v35.origin.x;
  v17 = v35.origin.y;
  v18 = v35.size.width;
  v19 = v35.size.height;
  v35.origin.x = v8;
  v35.origin.y = v10;
  v35.size.width = v12;
  v35.size.height = v14;
  v36 = CGRectStandardize(v35);
  v20 = v36.origin.x;
  v21 = v36.origin.y;
  v22 = v36.size.width;
  v23 = v36.size.height;
  v30 = v17;
  v31 = v16;
  v36.origin.x = v16;
  v36.origin.y = v17;
  v36.size.width = v18;
  v36.size.height = v19;
  v24 = CGRectGetMinX(v36) + 0.0001;
  v37.origin.x = v20;
  v37.origin.y = v21;
  v37.size.width = v22;
  v37.size.height = v23;
  if (v24 <= CGRectGetMaxX(v37))
  {
    v38.origin.y = v30;
    v38.origin.x = v16;
    v38.size.width = v18;
    v38.size.height = v19;
    v26 = CGRectGetMaxX(v38) + -0.0001;
    v39.origin.x = v20;
    v39.origin.y = v21;
    v39.size.width = v22;
    v39.size.height = v23;
    v25 = v26 >= CGRectGetMinX(v39);
  }
  else
  {
    v25 = 0;
  }
  v40.origin.x = v16;
  v40.origin.y = v30;
  v40.size.width = v18;
  v40.size.height = v19;
  v27 = CGRectGetMinY(v40) + 0.0001;
  v41.origin.x = v20;
  v41.origin.y = v21;
  v41.size.width = v22;
  v41.size.height = v23;
  if (v27 <= CGRectGetMaxY(v41))
  {
    v42.origin.x = v31;
    v42.origin.y = v30;
    v42.size.width = v18;
    v42.size.height = v19;
    v29 = CGRectGetMaxY(v42) + -0.0001;
    v43.origin.x = v20;
    v43.origin.y = v21;
    v43.size.width = v22;
    v43.size.height = v23;
    v28 = v29 >= CGRectGetMinY(v43);
  }
  else
  {
    v28 = 0;
  }
  return v25 && v28;
}

- (BOOL)intersectsRegion:(id)a3 inSnapshot:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;
  void *v14;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "coordinateSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_FEFocusMapRect coordinateSpace](self, "coordinateSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusMapArea.m"), 40, CFSTR("Focus: unable to compare intersecting regions from a snapshot using a different coordinate space than the map area's coordinate space. This is a UIKit bug."));

  }
  objc_msgSend(v8, "snapshotFrameForRegion:", v7);
  v12 = -[_FEFocusMapRect intersectsRect:](self, "intersectsRect:");

  return v12;
}

- (id)intersectionWithRegion:(id)a3 inSnapshot:(id)a4
{
  id v6;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double x;
  double y;
  double width;
  double height;
  id v24;
  void *v25;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "snapshotFrameForRegion:", v6);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[_FEFocusMapRect frame](self, "frame");
  v32.origin.x = v16;
  v32.origin.y = v17;
  v32.size.width = v18;
  v32.size.height = v19;
  v27.origin.x = v9;
  v27.origin.y = v11;
  v27.size.width = v13;
  v27.size.height = v15;
  v28 = CGRectIntersection(v27, v32);
  x = v28.origin.x;
  y = v28.origin.y;
  width = v28.size.width;
  height = v28.size.height;
  v28.origin.x = v9;
  v28.origin.y = v11;
  v28.size.width = v13;
  v28.size.height = v15;
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  if (CGRectEqualToRect(v28, v33))
  {
    v24 = v6;
  }
  else
  {
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    if (CGRectIsNull(v29))
      goto LABEL_7;
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    if (fabs(CGRectGetWidth(v30)) < 0.0001
      || (v31.origin.x = x,
          v31.origin.y = y,
          v31.size.width = width,
          v31.size.height = height,
          fabs(CGRectGetHeight(v31)) < 0.0001))
    {
LABEL_7:
      v25 = 0;
      goto LABEL_8;
    }
    +[_FEFocusRegionEvaluator subregionFromRegion:withSnapshotFrame:inSnapshot:](_FEFocusRegionEvaluator, "subregionFromRegion:withSnapshotFrame:inSnapshot:", v6, v7, x, y, width, height);
    v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  v25 = v24;
LABEL_8:

  return v25;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  id WeakRetained;
  id v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BE08]), "initWithObject:", self);
  _FEStringFromCGRect(self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("frame"));

  WeakRetained = objc_loadWeakRetained((id *)&self->_coordinateSpace);
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", WeakRetained, CFSTR("coordinateSpace"));

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (_FECoordinateSpace)coordinateSpace
{
  return (_FECoordinateSpace *)objc_loadWeakRetained((id *)&self->_coordinateSpace);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coordinateSpace);
}

@end
