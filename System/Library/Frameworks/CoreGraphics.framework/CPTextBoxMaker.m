@implementation CPTextBoxMaker

- (void)makeBoxesWith:(id)a3 parent:(id)a4
{
  int v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t i;
  CPTextBox *v11;
  CPTextBox *v12;
  uint64_t v13;
  CPLayoutArea *v14;
  CPColumn *v15;

  v6 = objc_msgSend(a4, "hasRotatedCharacters");
  v7 = 0.0;
  if (v6)
  {
    objc_msgSend(a4, "rotationAngle");
    v7 = v8;
  }
  v9 = objc_msgSend(a3, "count");
  if (v9)
  {
    for (i = 0; i != v9; ++i)
    {
      v11 = objc_alloc_init(CPTextBox);
      v12 = v11;
      if (v6)
        -[CPTextBox setRotationAngle:](v11, "setRotationAngle:", v7);
      objc_msgSend(a4, "add:", v12);

      v13 = objc_msgSend(a3, "objectAtIndex:", i);
      v14 = objc_alloc_init(CPLayoutArea);
      -[CPChunk add:](v12, "add:", v14);

      v15 = objc_alloc_init(CPColumn);
      -[CPChunk add:](v14, "add:", v15);

      -[CPChunk add:](v15, "add:", v13);
    }
  }
}

- (void)rotateTextBox:(id)a3
{
  double v4;
  double v5;
  void *v6;
  int v7;
  int v8;
  __double2 v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  float64x2_t v16;
  float64x2_t v17;

  objc_msgSend(a3, "rotationAngle");
  v5 = v4;
  if (fabs(v4) > 2.0)
  {
    v6 = (void *)objc_msgSend(a3, "firstChild");
    v7 = objc_msgSend(v6, "count");
    if (v7 >= 1)
    {
      v8 = v7;
      v9 = __sincos_stret(v5);
      v10 = 0;
      v16 = vmlaq_n_f64(vmulq_n_f64((float64x2_t)xmmword_185004A20, v9.__sinval), (float64x2_t)xmmword_185004990, v9.__cosval);
      v17 = vmlsq_lane_f64(vmulq_n_f64((float64x2_t)xmmword_185004A20, v9.__cosval), (float64x2_t)xmmword_185004990, v9.__sinval, 0);
      v11 = v16.f64[1];
      v12 = v17.f64[1];
      do
      {
        v13 = (void *)objc_msgSend(v6, "childAtIndex:", v10, *(_OWORD *)&v16, *(_OWORD *)&v17);
        objc_msgSend(v13, "bounds");
        objc_msgSend(v13, "setBounds:", v14 * v17.f64[0] + v16.f64[0] * v15 + 0.0, v14 * v12 + v11 * v15 + 0.0);
        v10 = (v10 + 1);
      }
      while (v8 != (_DWORD)v10);
    }
  }
}

- (void)rotate:(id)a3
{
  objc_msgSend(a3, "map:target:childrenOfClass:", sel_rotateTextBox_, self, objc_opt_class());
}

- (BOOL)layoutIsSliced:(id)a3
{
  int v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  uint64_t i;
  void *v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v4 = objc_msgSend(a3, "count");
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "firstChild");
    v6 = objc_msgSend(v5, "zOrder");
    v7 = objc_msgSend(a3, "zOrder");
    if (v6 >= v7)
      v8 = v7;
    else
      v8 = v6;
    if (v6 <= v7)
      v9 = v7;
    else
      v9 = v6;
    v10 = (void *)objc_msgSend((id)objc_msgSend(v5, "page"), "graphicsOnPage");
    v11 = objc_msgSend(v10, "count");
    v12 = v11;
    if (v11 < 1)
    {
      LODWORD(v13) = 0;
      v15 = 0;
    }
    else
    {
      v13 = 0;
      v14 = v11;
      while (1)
      {
        v15 = objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", v13), "zOrder");
        if (v8 < v15)
          break;
        if (v14 == ++v13)
        {
          LODWORD(v13) = v12;
          break;
        }
      }
    }
    if (v15 <= v9)
    {
      objc_msgSend(a3, "bounds");
      v41 = v17;
      v42 = v16;
      v39 = v19;
      v40 = v18;
      objc_msgSend(v5, "bounds");
      if ((int)v13 < v12)
      {
        v24 = v20;
        v25 = v21;
        v26 = v22;
        v27 = v23;
        for (i = 0; (int)v13 + (int)i < v12; ++i)
        {
          v29 = (void *)objc_msgSend(v10, "objectAtIndex:", v13 + i);
          if (v9 < (int)objc_msgSend(v29, "zOrder"))
            break;
          objc_msgSend(v29, "bounds");
          v31 = v30;
          v33 = v32;
          v35 = v34;
          v37 = v36;
          v43.origin.x = v24;
          v43.origin.y = v25;
          v43.size.width = v26;
          v43.size.height = v27;
          v45.origin.x = v31;
          v45.origin.y = v33;
          v45.size.width = v35;
          v45.size.height = v37;
          if (CGRectIntersectsRect(v43, v45))
          {
            v44.origin.y = v41;
            v44.origin.x = v42;
            v44.size.height = v39;
            v44.size.width = v40;
            v46.origin.x = v31;
            v46.origin.y = v33;
            v46.size.width = v35;
            v46.size.height = v37;
            if (CGRectIntersectsRect(v44, v46))
            {
              LOBYTE(v4) = 1;
              return v4;
            }
          }
        }
      }
    }
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)promoteLayoutsInCertainRegions:(id)a3
{
  void *v5;
  CPTextBox *v6;

  if (objc_msgSend(a3, "isGraphicalRegion"))
  {
    objc_msgSend(a3, "firstChild");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (void *)objc_msgSend(a3, "firstChild");
      if (objc_msgSend(v5, "count"))
      {
        if (!objc_msgSend(v5, "isUprightRectangle")
          || -[CPTextBoxMaker layoutIsSliced:](self, "layoutIsSliced:", v5))
        {
          v6 = objc_alloc_init(CPTextBox);
          -[CPChunk addChildrenOf:](v6, "addChildrenOf:", v5);
          -[CPChunk add:](self->bodyZone, "add:", v6);

        }
      }
    }
  }
}

- (void)promoteLayoutsIn:(id)a3
{
  self->bodyZone = (CPBody *)a3;
  objc_msgSend(a3, "map:target:childrenOfClass:", sel_promoteLayoutsInCertainRegions_, self, objc_opt_class());
}

- (void)boxLayout:(id)a3
{
  CPTextBox *v5;

  v5 = objc_alloc_init(CPTextBox);
  if (-[CPZone hasRotatedCharacters](self->mainZone, "hasRotatedCharacters"))
  {
    -[CPZone rotationAngle](self->mainZone, "rotationAngle");
    -[CPTextBox setRotationAngle:](v5, "setRotationAngle:");
  }
  -[CPChunk add:](v5, "add:", a3);
  -[CPChunk add:](self->mainZone, "add:", v5);

}

- (void)boxLayoutsIn:(id)a3
{
  self->mainZone = (CPZone *)a3;
  objc_msgSend(a3, "mapSafely:target:childrenOfClass:", sel_boxLayout_, self, objc_opt_class());
}

+ (void)promoteLayoutsIn:(id)a3
{
  CPTextBoxMaker *v4;

  v4 = objc_alloc_init(CPTextBoxMaker);
  -[CPTextBoxMaker promoteLayoutsIn:](v4, "promoteLayoutsIn:", a3);

}

+ (void)boxLayoutsIn:(id)a3
{
  CPTextBoxMaker *v4;

  v4 = objc_alloc_init(CPTextBoxMaker);
  -[CPTextBoxMaker boxLayoutsIn:](v4, "boxLayoutsIn:", a3);

}

@end
