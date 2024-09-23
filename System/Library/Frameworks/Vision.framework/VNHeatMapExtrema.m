@implementation VNHeatMapExtrema

- (VNHeatMapExtrema)init
{
  char *v2;
  VNHeatMapExtrema *v3;
  char *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VNHeatMapExtrema;
  v2 = -[VNHeatMapExtrema init](&v6, sel_init);
  v3 = (VNHeatMapExtrema *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 8) = xmmword_1A15FB510;
    *((_QWORD *)v2 + 4) = 0;
    *((_QWORD *)v2 + 5) = 0;
    *((_QWORD *)v2 + 3) = 0xBFF0000000000000;
    *((_OWORD *)v2 + 3) = xmmword_1A15FB510;
    *((_QWORD *)v2 + 8) = 0xBFF0000000000000;
    v4 = v2;
  }

  return v3;
}

- (void)updateExtrema:(float)a3 x:(int)a4 y:(int)a5
{
  double v5;
  double x;
  double v7;
  double v8;
  double y;
  double v10;

  v5 = (double)a4;
  x = self->_extrema[0].x;
  if (x > (double)a4 || x == (double)a4 && self->_extremeValues[0] < a3)
  {
    self->_extrema[0].x = v5;
    self->_extrema[0].y = (double)a5;
    self->_extremeValues[0] = a3;
  }
  v7 = self->_extrema[1].x;
  if (v7 < v5 || v7 == v5 && self->_extremeValues[1] < a3)
  {
    self->_extrema[1].x = v5;
    self->_extrema[1].y = (double)a5;
    self->_extremeValues[1] = a3;
  }
  v8 = (double)a5;
  y = self->_extrema[2].y;
  if (y > (double)a5 || y == (double)a5 && self->_extremeValues[2] < a3)
  {
    self->_extrema[2].x = v5;
    self->_extrema[2].y = v8;
    self->_extremeValues[2] = a3;
  }
  v10 = self->_extrema[3].y;
  if (v10 < v8 || v10 == v8 && self->_extremeValues[3] < a3)
  {
    self->_extrema[3].x = v5;
    self->_extrema[3].y = v8;
    self->_extremeValues[3] = a3;
  }
}

- (CGRect)computeRectFromExtremaUsingThreshold:(float)a3 vImage:(vImage_Buffer *)a4
{
  double x;
  float v7;
  float y;
  char *v10;
  float v11;
  double v12;
  float v13;
  float v15;
  char *v16;
  float v17;
  double v18;
  float v19;
  float v21;
  unsigned int v22;
  size_t rowBytes;
  float v24;
  double v25;
  float v26;
  float v28;
  size_t v29;
  float v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double width;
  double height;
  double v37;
  BOOL IsNull;
  double v39;
  double v40;
  double v41;
  vImagePixelCount v42;
  vImagePixelCount v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  double v49;
  double v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect result;
  CGRect v55;

  x = self->_extrema[0].x;
  v7 = x;
  if (v7 > 0.0 && v7 < 3.4028e38)
  {
    y = self->_extrema[0].y;
    v10 = (char *)a4->data + a4->rowBytes * y;
    v11 = *(float *)&v10[4 * (float)(v7 + -1.0)];
    x = x - (float)(1.0 - (float)((float)(a3 - v11) / (float)(*(float *)&v10[4 * v7] - v11)));
    self->_extrema[0].x = x;
  }
  v12 = self->_extrema[1].x;
  v13 = v12;
  if (v13 > -1.0 && v13 < (float)(a4->width - 1))
  {
    v15 = self->_extrema[1].y;
    v16 = (char *)a4->data + a4->rowBytes * v15;
    v17 = *(float *)&v16[4 * (float)(v13 + 1.0)];
    v12 = v12 + (float)(1.0 - (float)((float)(a3 - v17) / (float)(*(float *)&v16[4 * v13] - v17)));
    self->_extrema[1].x = v12;
  }
  v18 = self->_extrema[2].y;
  v19 = v18;
  if (v19 > 0.0 && v19 < 3.4028e38)
  {
    v21 = self->_extrema[2].x;
    v22 = v21;
    rowBytes = a4->rowBytes;
    v24 = *(float *)((char *)a4->data + 4 * v21 + rowBytes * (float)(v19 + -1.0));
    v18 = v18
        - (float)(1.0
                - (float)((float)(a3 - v24)
                        / (float)(*(float *)((char *)a4->data + 4 * v22 + rowBytes * v19) - v24)));
    self->_extrema[2].y = v18;
  }
  v25 = self->_extrema[3].y;
  v26 = v25;
  if (v26 > -1.0 && v26 < (float)(a4->height - 1))
  {
    v28 = self->_extrema[3].x;
    v29 = a4->rowBytes;
    v30 = *(float *)((char *)a4->data + 4 * v28 + v29 * (float)(v26 + 1.0));
    v25 = v25
        + (float)(1.0
                - (float)((float)(a3 - v30)
                        / (float)(*(float *)((char *)a4->data + 4 * v28 + v29 * v26) - v30)));
    self->_extrema[3].y = v25;
  }
  v31 = v12 - x;
  v32 = v25 - v18;
  v51 = CGRectStandardize(*(CGRect *)&x);
  v52 = CGRectInset(v51, v51.size.width * -0.05, v51.size.height * -0.05);
  v55.size.width = (double)(a4->width - 1);
  v55.size.height = (double)(a4->height - 1);
  v33 = 0.0;
  v55.origin.x = 0.0;
  v55.origin.y = 0.0;
  v53 = CGRectIntersection(v52, v55);
  v34 = v53.origin.x;
  width = v53.size.width;
  height = v53.size.height;
  v37 = (float)a4->height - (v53.origin.y + v53.size.height);
  v53.origin.y = v37;
  IsNull = CGRectIsNull(v53);
  v39 = 1.0;
  v40 = 0.0;
  v41 = 1.0;
  if (!IsNull)
  {
    v42 = a4->height;
    v43 = a4->width;
    v44 = 0.0;
    v45 = 0.0;
    v46 = 0.0;
    if (v43)
    {
      v45 = v34 / (double)v43;
      v46 = width / (double)v43;
    }
    v47 = 0.0;
    if (v42)
    {
      v44 = v37 / (double)v42;
      v47 = height / (double)v42;
    }
    v48 = 0;
    *(CGRect *)(&v40 - 1) = CGRectIntersection(*(CGRect *)(&v40 - 1), *(CGRect *)&v45);
    v33 = v49;
  }
  v50 = v33;
  result.size.height = v41;
  result.size.width = v39;
  result.origin.y = v40;
  result.origin.x = v50;
  return result;
}

@end
