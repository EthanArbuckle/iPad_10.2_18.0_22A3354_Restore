@implementation DKDrawingStroke

- (DKDrawingStroke)init
{
  DKDrawingStroke *v2;
  uint64_t v3;
  NSMutableArray *strokePoints;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DKDrawingStroke;
  v2 = -[DKDrawingStroke init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    strokePoints = v2->_strokePoints;
    v2->_strokePoints = (NSMutableArray *)v3;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = objc_alloc(MEMORY[0x24BDBCEB8]);
  -[DKDrawingStroke strokePoints](self, "strokePoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "initWithArray:copyItems:", v6, 1);
  v8 = (void *)v4[1];
  v4[1] = v7;

  return v4;
}

- (id)encodedBrushStroke
{
  return -[DKDrawingStroke _encodePointsDrawingPointData:](self, "_encodePointsDrawingPointData:", self->_strokePoints);
}

+ (DKDrawingStroke)drawingStrokeWithData:(id)a3 count:(unint64_t)a4
{
  id v5;
  DKDrawingStroke *v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = objc_alloc_init(DKDrawingStroke);
  -[DKDrawingStroke _decodeDKEncodedDrawingPointDataAsArray:count:](v6, "_decodeDKEncodedDrawingPointDataAsArray:count:", v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[DKDrawingStroke strokePoints](v6, "strokePoints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v7);

  return v6;
}

- (id)_encodePointsDrawingPointData:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  v5 = (void *)(32 * v4);
  if (32 * v4)
  {
    v6 = v4;
    v7 = malloc_type_malloc(32 * v4, 0xB1CD9CFCuLL);
    if (v7)
    {
      v8 = v7;
      if (v6 >= 1)
      {
        v9 = 0;
        v10 = v6;
        v11 = v7 + 2;
        do
        {
          objc_msgSend(v3, "objectAtIndex:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "location");
          v14 = v13;
          v16 = v15;
          objc_msgSend(v12, "velocity");
          v18 = v17;
          objc_msgSend(v12, "force");
          *(v11 - 2) = v14;
          *(v11 - 1) = v16;
          *v11 = v18;
          v11[1] = v19;
          v11 += 4;

          ++v9;
        }
        while (v10 != v9);
      }
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v8, v5);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      free(v8);
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (id)_decodeDKEncodedDrawingPointDataAsArray:(id)a3 count:(int64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  double *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  DKDrawingStrokePoint *v13;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "length");
  if (a4 >= 1 && v7)
  {
    v8 = (double *)(objc_msgSend(objc_retainAutorelease(v5), "bytes") + 16);
    do
    {
      v9 = *(v8 - 2);
      v10 = *(v8 - 1);
      v11 = *v8;
      v12 = v8[1];
      v8 += 4;
      v13 = objc_alloc_init(DKDrawingStrokePoint);
      -[DKDrawingStrokePoint setLocation:](v13, "setLocation:", v9, v10);
      -[DKDrawingStrokePoint setVelocity:](v13, "setVelocity:", v11);
      -[DKDrawingStrokePoint setForce:](v13, "setForce:", v12);
      objc_msgSend(v6, "addObject:", v13);

      --a4;
    }
    while (a4);
  }

  return v6;
}

- (NSMutableArray)strokePoints
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokePoints, 0);
}

@end
