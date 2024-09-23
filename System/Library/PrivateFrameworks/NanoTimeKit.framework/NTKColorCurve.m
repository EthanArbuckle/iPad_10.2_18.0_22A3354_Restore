@implementation NTKColorCurve

- (NTKColorCurve)initWithColorCurveElements:(id)a3
{
  id v4;
  NTKColorCurve *v5;
  uint64_t v6;
  NSArray *colorCurveElements;
  NTKColorCurve *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKColorCurve;
  v5 = -[NTKColorCurve init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_152);
    v6 = objc_claimAutoreleasedReturnValue();
    colorCurveElements = v5->_colorCurveElements;
    v5->_colorCurveElements = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

uint64_t __44__NTKColorCurve_initWithColorCurveElements___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  float v6;
  float v7;
  float v8;
  uint64_t v9;
  float v10;
  float v11;
  float v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "fraction");
  v7 = v6;
  objc_msgSend(v5, "fraction");
  if (v7 <= v8)
  {
    objc_msgSend(v4, "fraction");
    v11 = v10;
    objc_msgSend(v5, "fraction");
    if (v11 >= v12)
      v9 = 0;
    else
      v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)colorForFraction:(float)a3
{
  NSUInteger v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  NSArray *colorCurveElements;
  void *v11;
  float v12;
  float v13;
  NSArray *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;

  if (-[NSArray count](self->_colorCurveElements, "count"))
  {
    v5 = -[NSArray count](self->_colorCurveElements, "count");
    -[NSArray firstObject](self->_colorCurveElements, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5 != 1)
    {
      objc_msgSend(v6, "fraction");
      v9 = v8;

      colorCurveElements = self->_colorCurveElements;
      if (v9 >= a3)
      {
        -[NSArray firstObject](colorCurveElements, "firstObject");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[NSArray lastObject](colorCurveElements, "lastObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "fraction");
        v13 = v12;

        v14 = self->_colorCurveElements;
        if (v13 > a3)
        {
          -[NSArray objectAtIndex:](v14, "objectAtIndex:", 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray objectAtIndex:](self->_colorCurveElements, "objectAtIndex:", 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSArray count](self->_colorCurveElements, "count") < 2)
          {
LABEL_10:
            v18 = v16;
            v7 = v15;
          }
          else
          {
            v17 = 1;
            while (1)
            {
              -[NSArray objectAtIndexedSubscript:](self->_colorCurveElements, "objectAtIndexedSubscript:", v17 - 1);
              v7 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSArray objectAtIndexedSubscript:](self->_colorCurveElements, "objectAtIndexedSubscript:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "fraction");
              if (v19 <= a3)
              {
                objc_msgSend(v18, "fraction");
                if (v20 >= a3)
                  break;
              }

              if (++v17 >= -[NSArray count](self->_colorCurveElements, "count"))
                goto LABEL_10;
            }

          }
          objc_msgSend(v7, "fraction");
          v22 = a3 - v21;
          objc_msgSend(v18, "fraction");
          v24 = v23;
          objc_msgSend(v7, "fraction");
          v26 = v22 / (float)(v24 - v25);
          objc_msgSend(v18, "timingFunction");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v28 = v26;
          objc_msgSend(v27, "_solveForInput:", v28);

          objc_msgSend(v7, "color");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "color");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          CLKUIInterpolateBetweenColors();
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_17;
        }
        -[NSArray lastObject](v14, "lastObject");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v7 = v6;
    }
    objc_msgSend(v6, "color");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

    return v31;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  return v31;
}

- (NSArray)colorCurveElements
{
  return self->_colorCurveElements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorCurveElements, 0);
}

@end
