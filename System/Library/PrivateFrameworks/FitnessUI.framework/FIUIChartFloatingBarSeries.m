@implementation FIUIChartFloatingBarSeries

- (void)_loadFromDataSet
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSArray *v13;
  NSArray *barRects;
  NSMutableArray *v15;
  NSMutableArray *barLabelTopPoints;
  NSMutableArray *v17;
  NSMutableArray *barLabelBottomPoints;
  NSMutableArray *v19;
  NSMutableArray *barLabels;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  NSMutableArray *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  unint64_t v55;
  NSArray *v56;
  NSArray *v57;
  void *v58;
  double v59;
  void *v60;
  unint64_t v61;
  void *v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[4];
  id v69;
  double v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  -[FIUIChartFloatingBarSeries cornerRadius](self, "cornerRadius");
  v4 = v3;
  -[FIUIChartSeries maxYValue](self, "maxYValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;
  -[FIUIChartSeries minYValue](self, "minYValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  -[FIUIChartSeries insetBounds](self, "insetBounds");
  v12 = 0.0;
  if (v11 > 2.22044605e-16)
    v12 = (v7 - v10) * (v4 * 3.0 / v11);
  v59 = v12;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  barRects = self->_barRects;
  self->_barRects = v13;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  barLabelTopPoints = self->_barLabelTopPoints;
  self->_barLabelTopPoints = v15;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  barLabelBottomPoints = self->_barLabelBottomPoints;
  self->_barLabelBottomPoints = v17;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v19 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  barLabels = self->_barLabels;
  self->_barLabels = v19;

  -[FIUIChartSeries labelsFromDataSet](self, "labelsFromDataSet");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIChartSeries dataSet](self, "dataSet");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "points");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  if (v23)
  {
    v24 = 0;
    do
    {
      -[FIUIChartSeries dataSet](self, "dataSet");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "points");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndexedSubscript:", v24);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      -[FIUIChartSeries xValueForPointFromChartPoint:](self, "xValueForPointFromChartPoint:", v27);
      v29 = v28;
      objc_msgSend(v27, "yValue");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = MEMORY[0x24BDAC760];
      v68[1] = 3221225472;
      v68[2] = __46__FIUIChartFloatingBarSeries__loadFromDataSet__block_invoke;
      v68[3] = &unk_24CF31D08;
      v32 = v31;
      v69 = v32;
      v70 = v59;
      v62 = v30;
      objc_msgSend(v30, "enumerateRangesUsingBlock:", v68);
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v33 = v32;
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
      if (v34)
      {
        v35 = v34;
        v60 = v27;
        v61 = v24;
        v36 = 0;
        v37 = 0;
        v38 = *(_QWORD *)v65;
        do
        {
          v39 = 0;
          v40 = v37;
          do
          {
            if (*(_QWORD *)v65 != v38)
              objc_enumerationMutation(v33);
            v41 = objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * v39), "rangeValue");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v42 + v41 - 1);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            -[FIUIChartSeries yValueForPointFromChartPointValue:](self, "yValueForPointFromChartPointValue:", v43);
            v45 = v44;

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v41);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            -[FIUIChartSeries yValueForPointFromChartPointValue:](self, "yValueForPointFromChartPointValue:", v46);
            v48 = v47 - v45;

            objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v29 - v4, v45 - v4, v4 + v4, v48 + v4 * 2.0);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "addObject:", v49);

            objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v29, v45 - v4);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v36)
            {
              objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v29, v4 + v45);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
            }
            ++v39;
            v40 = v37;
          }
          while (v35 != v39);
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
        }
        while (v35);

        if (v37)
        {
          v27 = v60;
          v24 = v61;
          if (v61 < objc_msgSend(v58, "count"))
          {
            v50 = self->_barLabels;
            objc_msgSend(v58, "objectAtIndexedSubscript:", v61);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "firstObject");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](v50, "addObject:", v52);

            -[NSMutableArray addObject:](self->_barLabelTopPoints, "addObject:", v37);
            -[NSMutableArray addObject:](self->_barLabelBottomPoints, "addObject:", v36);
          }
        }
        else
        {
          v27 = v60;
          v24 = v61;
        }
      }
      else
      {

        v37 = 0;
        v36 = 0;
      }

      ++v24;
      -[FIUIChartSeries dataSet](self, "dataSet");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "points");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "count");

    }
    while (v24 < v55);
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v63);
  v56 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v57 = self->_barRects;
  self->_barRects = v56;

}

void __46__FIUIChartFloatingBarSeries__loadFromDataSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 32);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", a2, a3);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v7;
LABEL_6:
    v18 = (id)v15;
    objc_msgSend(v16, "addObject:");
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "rangeValue");
  v11 = v10;

  if (*(double *)(a1 + 40) <= (double)(unint64_t)(a2 - (v11 + v9) + 1))
  {
    v17 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", a2, a3);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v17;
    goto LABEL_6;
  }
  v12 = a2 + a3 - v9;
  v13 = *(void **)(a1 + 32);
  v14 = objc_msgSend(v13, "count") - 1;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v9, v12);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "replaceObjectAtIndex:withObject:", v14);
LABEL_7:

}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FIUIChartFloatingBarSeries;
  -[FIUIChartSeries layoutSubviews](&v4, sel_layoutSubviews);
  -[FIUIChartFloatingBarSeries _loadFromDataSet](self, "_loadFromDataSet");
  -[FIUIChartFloatingBarSeries layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsDisplay");

}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  double cornerRadius;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  const CGPath *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  const CGPath *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  UIColor *barColor;
  UIColor *v36;
  UIColor *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v48 = *MEMORY[0x24BDAC8D0];
  UIGraphicsPushContext(a4);
  if (self->_cornerRadius <= 2.22044605e-16)
    cornerRadius = 1.0;
  else
    cornerRadius = self->_cornerRadius;
  if (self->_outlineWidth > 0.0 && self->_outlineColor)
  {
    CGContextSaveGState(a4);
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v7 = self->_barRects;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v43 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "CGRectValue");
          v50 = CGRectInset(v49, -self->_outlineWidth, -self->_outlineWidth);
          v12 = CGPathCreateWithRoundedRect(v50, cornerRadius + self->_outlineWidth, cornerRadius + self->_outlineWidth, 0);
          CGContextAddPath(a4, v12);
          CGPathRelease(v12);
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v9);
    }

    CGContextSetFillColorWithColor(a4, -[UIColor CGColor](self->_outlineColor, "CGColor"));
    CGContextDrawPath(a4, kCGPathFill);
    CGContextRestoreGState(a4);
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v13 = self->_barRects;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v39 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "CGRectValue", (_QWORD)v38);
        v18 = CGPathCreateWithRoundedRect(v51, cornerRadius, cornerRadius, 0);
        CGContextAddPath(a4, v18);
        CGPathRelease(v18);
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v15);
  }

  if (-[NSMutableArray count](self->_barLabels, "count"))
  {
    v19 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_barLabels, "objectAtIndexedSubscript:", v19, (_QWORD)v38);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_barLabelTopPoints, "objectAtIndexedSubscript:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "CGPointValue");
      v23 = v22;
      v25 = v24;

      if (objc_msgSend(v20, "length"))
      {
        objc_msgSend(v20, "boundingRectWithSize:options:attributes:context:", 0, self->_labelAttributes, 0, 1.79769313e308, 1.79769313e308);
        v27 = v26;
        v29 = v25 - v28;
        if (v29 < 0.0)
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_barLabelBottomPoints, "objectAtIndexedSubscript:", v19);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "CGPointValue");
          v29 = v31;

        }
        if (v23 + v27 * -0.5 >= 0.0)
          v32 = v23 + v27 * -0.5;
        else
          v32 = 0.0;
        -[FIUIChartFloatingBarSeries bounds](self, "bounds");
        v34 = v33 - v27;
        if (v32 < v33 - v27)
          v34 = v32;
        objc_msgSend(v20, "drawAtPoint:withAttributes:", self->_labelAttributes, v34, v29);
      }

      ++v19;
    }
    while (v19 < -[NSMutableArray count](self->_barLabels, "count"));
  }
  barColor = self->_barColor;
  if (barColor)
  {
    v36 = barColor;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v36 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v37 = objc_retainAutorelease(v36);
  CGContextSetFillColorWithColor(a4, -[UIColor CGColor](v37, "CGColor"));
  CGContextDrawPath(a4, kCGPathFill);
  UIGraphicsPopContext();

}

- (UIColor)barColor
{
  return self->_barColor;
}

- (void)setBarColor:(id)a3
{
  objc_storeStrong((id *)&self->_barColor, a3);
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (NSDictionary)labelAttributes
{
  return self->_labelAttributes;
}

- (void)setLabelAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_labelAttributes, a3);
}

- (double)outlineWidth
{
  return self->_outlineWidth;
}

- (void)setOutlineWidth:(double)a3
{
  self->_outlineWidth = a3;
}

- (UIColor)outlineColor
{
  return self->_outlineColor;
}

- (void)setOutlineColor:(id)a3
{
  objc_storeStrong((id *)&self->_outlineColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outlineColor, 0);
  objc_storeStrong((id *)&self->_labelAttributes, 0);
  objc_storeStrong((id *)&self->_barColor, 0);
  objc_storeStrong((id *)&self->_barLabels, 0);
  objc_storeStrong((id *)&self->_barLabelBottomPoints, 0);
  objc_storeStrong((id *)&self->_barLabelTopPoints, 0);
  objc_storeStrong((id *)&self->_barRects, 0);
}

@end
