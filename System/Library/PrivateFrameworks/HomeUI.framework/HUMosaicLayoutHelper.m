@implementation HUMosaicLayoutHelper

+ (id)fakeFramesForGeometry:(id)a3 inBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isPortrait");
  +[HUMosaicCellSize createMosaicCellSizeForSizeDescription:](HUMosaicCellSize, "createMosaicCellSizeForSizeDescription:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v11);

  +[HUMosaicCellSize createMosaicCellSizeForSizeDescription:](HUMosaicCellSize, "createMosaicCellSizeForSizeDescription:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v12);

  +[HUMosaicCellSize createMosaicCellSizeForSizeDescription:](HUMosaicCellSize, "createMosaicCellSizeForSizeDescription:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v13);

  +[HUMosaicCellSize createMosaicCellSizeForSizeDescription:](HUMosaicCellSize, "createMosaicCellSizeForSizeDescription:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v14);

  if (v10)
  {
    +[HUMosaicCellSize createMosaicCellSizeForSizeDescription:](HUMosaicCellSize, "createMosaicCellSizeForSizeDescription:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v15);

  }
  +[HUMosaicLayoutHelper framesForSizes:withGeometry:inBounds:](HUMosaicLayoutHelper, "framesForSizes:withGeometry:inBounds:", v9, v8, x, y, width, height);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)framesForSizes:(id)a3 withGeometry:(id)a4 inBounds:(CGRect)a5
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v37;
  void *v38;
  double height;
  double v41;
  double width;

  height = a5.size.height;
  width = a5.size.width;
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)objc_msgSend(v6, "count") >= 1)
  {
    v9 = 0;
    LOBYTE(v10) = 1;
    v11 = 0.0;
    v12 = 0.0;
    v13 = 0.0;
    v41 = 0.0;
    v14 = 0.0;
    while (1)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "numRows");
      v17 = objc_msgSend(v15, "numCols");
      objc_msgSend(v7, "cellSize");
      v19 = v18;
      objc_msgSend(v7, "cellSpacing");
      v21 = v20 * (double)(v17 - 1) + v19 * (double)v17;
      objc_msgSend(v7, "cellSize");
      v23 = v22;
      objc_msgSend(v7, "cellSpacing");
      v25 = v24;
      v26 = v11 + v21 - width;
      if (v26 > 0.00000011920929)
      {
        objc_msgSend(v7, "cellSpacing");
        v12 = v14 + v27;
        v28 = v41;
        v29 = v14 + v27 - v41;
        if (v29 > 0.00000011920929)
          v28 = 0.0;
        v41 = v28;
        if (v29 > 0.00000011920929)
          v13 = 0.0;
        v11 = v13;
      }
      v10 = (v9 == 0) & v10;
      v30 = v25 * (double)(v16 - 1) + v23 * (double)v16;
      if (v26 > 0.00000011920929)
        v31 = 1;
      else
        v31 = v10;
      if (v16 >= 2 && v31)
      {
        objc_msgSend(v7, "cellSpacing");
        v13 = v21 + v11 + v32;
        v41 = v30 + v12;
      }
      v33 = v30;
      if ((v31 & 1) == 0)
      {
        objc_msgSend(v7, "cellSize");
        v33 = v34;
      }
      objc_msgSend(v7, "cellSpacing");
      if (v21 - width > 0.00000011920929 || v30 + v12 - height > 0.00000011920929)
        break;
      v14 = v12 + v33;
      v37 = v11 + v21 + v35;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v11, v12, v21, v30);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v38);

      ++v9;
      v11 = v37;
      if (v9 >= (int)objc_msgSend(v6, "count"))
        goto LABEL_23;
    }

  }
LABEL_23:

  return v8;
}

+ (HUGridSize)gridSizeForGeometry:(id)a3 withEmptyCells:(int64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  int64_t v16;
  HUGridSize result;

  v5 = a3;
  v6 = objc_msgSend(v5, "gridSize");
  objc_msgSend(v5, "gridSize");
  v8 = v7 * v6 - a4;
  objc_msgSend(v5, "gridSize");
  v10 = v8 / v9;
  if (v8 / v9 <= 1)
    v11 = 1;
  else
    v11 = v8 / v9;
  if ((objc_msgSend(v5, "isPortrait") & 1) == 0 && v10 <= 1)
  {
    objc_msgSend(v5, "gridSize");
    if (v8 == v12 + 1)
      v11 = 2;
    else
      v11 = 1;
  }
  objc_msgSend(v5, "gridSize");
  v14 = v13;

  v15 = v11;
  v16 = v14;
  result.columnsAcross = v16;
  result.rowsDown = v15;
  return result;
}

@end
