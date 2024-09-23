@implementation DKDrawing

- (DKDrawing)init
{
  DKDrawing *v2;
  uint64_t v3;
  NSMutableArray *strokes;
  CGSize v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DKDrawing;
  v2 = -[DKDrawing init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    strokes = v2->_strokes;
    v2->_strokes = (NSMutableArray *)v3;

    v5 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
    v2->_strokesFrame.origin = (CGPoint)*MEMORY[0x24BDBF090];
    v2->_strokesFrame.size = v5;
  }
  return v2;
}

- (void)reset
{
  NSMutableArray *v3;
  NSMutableArray *strokes;
  CGSize v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  strokes = self->_strokes;
  self->_strokes = v3;

  v5 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  self->_strokesFrame.origin = (CGPoint)*MEMORY[0x24BDBF090];
  self->_strokesFrame.size = v5;
}

- (int64_t)totalPoints
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[DKDrawing strokes](self, "strokes", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "strokePoints");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 += objc_msgSend(v8, "count");

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  DKDrawing *v4;
  uint64_t v5;
  NSMutableArray *strokes;
  CGSize size;
  CGSize v8;

  v4 = objc_alloc_init(DKDrawing);
  v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:copyItems:", self->_strokes, 1);
  strokes = v4->_strokes;
  v4->_strokes = (NSMutableArray *)v5;

  size = self->_strokesFrame.size;
  v4->_strokesFrame.origin = self->_strokesFrame.origin;
  v4->_strokesFrame.size = size;
  v8 = self->_canvasBounds.size;
  v4->_canvasBounds.origin = self->_canvasBounds.origin;
  v4->_canvasBounds.size = v8;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DKDrawing)initWithCoder:(id)a3
{
  id v4;
  DKDrawing *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFDictionary *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const __CFDictionary *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSMutableArray *strokes;
  uint64_t v24;
  NSMutableArray *v25;

  v4 = a3;
  v5 = -[DKDrawing init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("sb1"));
    v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    CGRectMakeWithDictionaryRepresentation(v10, &v5->_strokesFrame);
    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("cb1"));
    v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    CGRectMakeWithDictionaryRepresentation(v15, &v5->_canvasBounds);
    v16 = (void *)MEMORY[0x24BDBCF20];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, v18, v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("st1"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v21, "count"));
    v22 = objc_claimAutoreleasedReturnValue();
    strokes = v5->_strokes;
    v5->_strokes = (NSMutableArray *)v22;

    -[DKDrawing decodedBrushStrokesWithArchiverEncodedBrushStrokes:](v5, "decodedBrushStrokesWithArchiverEncodedBrushStrokes:", v21);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v5->_strokes;
    v5->_strokes = (NSMutableArray *)v24;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CFDictionaryRef DictionaryRepresentation;
  CFDictionaryRef v6;
  id v7;

  v4 = a3;
  -[DKDrawing encodeBrushStrokesForArchiving](self, "encodeBrushStrokesForArchiving");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("st1"));
  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(self->_strokesFrame);
  objc_msgSend(v4, "encodeObject:forKey:", DictionaryRepresentation, CFSTR("sb1"));
  v6 = CGRectCreateDictionaryRepresentation(self->_canvasBounds);

  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("cb1"));
}

- (id)encodeBrushStrokesForArchiving
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSMutableArray *obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableArray count](self->_strokes, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = self->_strokes;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v8, "encodedBrushStroke");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "strokePoints");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");

        v20[1] = CFSTR("ct1");
        v21[0] = v9;
        v20[0] = CFSTR("bt1");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v21[1] = v12;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v13);

      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v5);
  }

  return v3;
}

- (id)decodedBrushStrokesWithArchiverEncodedBrushStrokes:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKey:", CFSTR("bt1"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("ct1"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "intValue");

        if (objc_msgSend(v10, "length"))
          v13 = v12 == 0;
        else
          v13 = 1;
        if (v13)
        {
          NSLog(CFSTR("Encoded stroke had unexpected bytes length: %lu and count: %zu"), objc_msgSend(v10, "length"), v12);
        }
        else
        {
          +[DKDrawingStroke drawingStrokeWithData:count:](DKDrawingStroke, "drawingStrokeWithData:count:", v10, v12);
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = (void *)v14;
          if (v14)
            objc_msgSend(v17, "addObject:", v14);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  return v17;
}

- (id)mutableStrokes
{
  return self->_strokes;
}

- (void)addBrushStroke:(id)a3
{
  -[NSMutableArray addObject:](self->_strokes, "addObject:", a3);
}

+ (id)copyOfDrawing:(id)a3 toFitInBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v8;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend((id)objc_opt_class(), "resizeDrawing:toFitInBounds:", v8, x, y, width, height);
  return v8;
}

+ (void)resizeDrawing:(id)a3 toFitInBounds:(CGRect)a4
{
  double height;
  double width;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  height = a4.size.height;
  width = a4.size.width;
  v67 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "strokesFrame");
  v8 = v7;
  objc_msgSend(v6, "strokesFrame");
  v10 = v9;
  objc_msgSend(v6, "strokesFrame");
  v12 = width / v11;
  objc_msgSend(v6, "strokesFrame");
  v59 = 0u;
  v60 = 0u;
  if (v12 >= height / v13)
    v12 = height / v13;
  v61 = 0uLL;
  v62 = 0uLL;
  objc_msgSend(v6, "strokes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v60 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        objc_msgSend(v19, "strokePoints");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v56;
          do
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v56 != v23)
                objc_enumerationMutation(v20);
              v25 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
              objc_msgSend(v25, "location");
              v27 = v26 - v8;
              objc_msgSend(v25, "location");
              objc_msgSend(v25, "setLocation:", v27, v28 - v10);
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
          }
          while (v22);
        }

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
    }
    while (v16);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v6, "strokes");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v52;
    do
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v52 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * k);
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        objc_msgSend(v34, "strokePoints", 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v48;
          do
          {
            for (m = 0; m != v37; ++m)
            {
              if (*(_QWORD *)v48 != v38)
                objc_enumerationMutation(v35);
              v40 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * m);
              objc_msgSend(v40, "location");
              v42 = v12 * v41;
              objc_msgSend(v40, "location");
              objc_msgSend(v40, "setLocation:", v42, v12 * v43);
            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
          }
          while (v37);
        }

      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
    }
    while (v31);
  }

  objc_msgSend(v6, "strokesFrame");
  v45 = v12 * v44;
  objc_msgSend(v6, "strokesFrame");
  objc_msgSend(v6, "setStrokesFrame:", 0.0, 0.0, v45, v12 * v46);

}

- (NSArray)strokes
{
  return &self->_strokes->super;
}

- (void)setStrokes:(id)a3
{
  objc_storeStrong((id *)&self->_strokes, a3);
}

- (CGRect)canvasBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_canvasBounds.origin.x;
  y = self->_canvasBounds.origin.y;
  width = self->_canvasBounds.size.width;
  height = self->_canvasBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCanvasBounds:(CGRect)a3
{
  self->_canvasBounds = a3;
}

- (CGRect)strokesFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_strokesFrame.origin.x;
  y = self->_strokesFrame.origin.y;
  width = self->_strokesFrame.size.width;
  height = self->_strokesFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setStrokesFrame:(CGRect)a3
{
  self->_strokesFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokes, 0);
}

@end
