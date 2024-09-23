@implementation _HKBaseBlockCoordinateList

- (_HKBaseBlockCoordinateList)initWithCoordinates:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4
{
  id v7;
  _HKBaseBlockCoordinateList *v8;
  _HKBaseBlockCoordinateList *v9;
  int64_t resolution;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_HKBaseBlockCoordinateList;
  v8 = -[_HKBaseBlockCoordinateList init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    resolution = a4->resolution;
    *(_OWORD *)&v8->_blockPath.index = *(_OWORD *)&a4->index;
    v8->_blockPath.resolution = resolution;
    objc_storeStrong((id *)&v8->_coordinates, a3);
  }

  return v9;
}

- (void)_enumerateCoordinatesWithTransform:(CGAffineTransform *)a3 chartableValueRange:(id)a4 roundToViewScale:(BOOL)a5 block:(id)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSArray *coordinates;
  __int128 v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _HKBaseBlockCoordinateList *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  BOOL v35;

  v11 = a6;
  v12 = a4;
  objc_msgSend(v12, "minValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "maxValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "doubleValue");
  v16 = v15;
  objc_msgSend(v14, "doubleValue");
  v18 = v17;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKGraphSeriesBlockCoordinate.m"), 163, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != NULL"));

  }
  coordinates = self->_coordinates;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __108___HKBaseBlockCoordinateList__enumerateCoordinatesWithTransform_chartableValueRange_roundToViewScale_block___block_invoke;
  v25[3] = &unk_1E9C43DE0;
  v26 = v13;
  v27 = v14;
  v30 = v18;
  v31 = v16;
  v20 = *(_OWORD *)&a3->c;
  v32 = *(_OWORD *)&a3->a;
  v33 = v20;
  v34 = *(_OWORD *)&a3->tx;
  v35 = a5;
  v28 = self;
  v29 = v11;
  v21 = v11;
  v22 = v14;
  v24 = v13;
  -[NSArray enumerateObjectsUsingBlock:](coordinates, "enumerateObjectsUsingBlock:", v25);

}

- (HKGraphSeriesDataBlockPath)blockPathStart
{
  *retstr = *(HKGraphSeriesDataBlockPath *)&self->resolution;
  return self;
}

- (HKGraphSeriesDataBlockPath)blockPathEnd
{
  *retstr = *(HKGraphSeriesDataBlockPath *)&self->resolution;
  return self;
}

- (id)coordinates
{
  return -[_HKBaseBlockCoordinateList _coordinatesInChartableRange:](self, "_coordinatesInChartableRange:", 0);
}

- (id)_coordinatesInChartableRange:(id)a3
{
  NSArray *v5;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  __int128 v10;
  NSArray *v11;
  _OWORD v13[3];
  _QWORD v14[4];
  id v15;

  v5 = self->_coordinates;
  if (a3)
  {
    v6 = (objc_class *)MEMORY[0x1E0C99DE8];
    v7 = a3;
    v8 = objc_alloc_init(v6);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59___HKBaseBlockCoordinateList__coordinatesInChartableRange___block_invoke;
    v14[3] = &unk_1E9C43E08;
    v9 = v8;
    v15 = v9;
    v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v13[0] = *MEMORY[0x1E0C9BAA8];
    v13[1] = v10;
    v13[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[_HKBaseBlockCoordinateList _enumerateCoordinatesWithTransform:chartableValueRange:roundToViewScale:block:](self, "_enumerateCoordinatesWithTransform:chartableValueRange:roundToViewScale:block:", v13, v7, 0, v14);

    v11 = (NSArray *)v9;
    v5 = v11;
  }
  return v5;
}

- (int64_t)numCoordinates
{
  return -[NSArray count](self->_coordinates, "count");
}

- (int64_t)_numCoordinatesInChartableRange:(id)a3
{
  id v4;
  __int128 v5;
  int64_t v6;
  _OWORD v8[3];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62___HKBaseBlockCoordinateList__numCoordinatesInChartableRange___block_invoke;
    v9[3] = &unk_1E9C43E30;
    v9[4] = &v10;
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v8[0] = *MEMORY[0x1E0C9BAA8];
    v8[1] = v5;
    v8[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[_HKBaseBlockCoordinateList _enumerateCoordinatesWithTransform:chartableValueRange:roundToViewScale:block:](self, "_enumerateCoordinatesWithTransform:chartableValueRange:roundToViewScale:block:", v8, v4, 0, v9);
    v6 = v11[3];
  }
  else
  {
    v6 = -[NSArray count](self->_coordinates, "count");
    v11[3] = v6;
  }
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)firstCoordinateWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  __int128 v7;
  void *v8;
  _OWORD v10[3];

  v4 = a4;
  -[NSArray firstObject](self->_coordinates, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)&a3->c;
  v10[0] = *(_OWORD *)&a3->a;
  v10[1] = v7;
  v10[2] = *(_OWORD *)&a3->tx;
  v8 = (void *)objc_msgSend(v6, "copyWithTransform:roundToViewScale:", v10, v4);

  return v8;
}

- (id)lastCoordinateWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  __int128 v7;
  void *v8;
  _OWORD v10[3];

  v4 = a4;
  -[NSArray lastObject](self->_coordinates, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)&a3->c;
  v10[0] = *(_OWORD *)&a3->a;
  v10[1] = v7;
  v10[2] = *(_OWORD *)&a3->tx;
  v8 = (void *)objc_msgSend(v6, "copyWithTransform:roundToViewScale:", v10, v4);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinates, 0);
}

@end
