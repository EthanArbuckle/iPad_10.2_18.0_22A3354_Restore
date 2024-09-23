@implementation MNRouteDivergenceFinderBoundingSection

- (BOOL)isLeaf
{
  return !self->_left && self->_right == 0;
}

- (id)leafSectionsIntersectingSection:(id)a3 paddingMapPoints:(double)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  _QWORD v13[9];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  objc_msgSend(v6, "boundingRect");
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__10;
  v18 = __Block_byref_object_dispose__10;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__MNRouteDivergenceFinderBoundingSection_leafSectionsIntersectingSection_paddingMapPoints___block_invoke;
  v13[3] = &unk_1E61D71B8;
  *(double *)&v13[5] = v7 - a4;
  *(double *)&v13[6] = v8 - a4;
  *(double *)&v13[7] = v9 + a4 * 2.0;
  *(double *)&v13[8] = v10 + a4 * 2.0;
  v13[4] = &v14;
  -[MNRouteDivergenceFinderBoundingSection traverseWithHandler:](self, "traverseWithHandler:", v13);
  v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __91__MNRouteDivergenceFinderBoundingSection_leafSectionsIntersectingSection_paddingMapPoints___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "boundingRect");
  if (GEOMapRectIntersectsRect())
  {
    if (objc_msgSend(v9, "isLeaf"))
    {
      v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      if (!v5)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v8 = *(void **)(v7 + 40);
        *(_QWORD *)(v7 + 40) = v6;

        v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      }
      objc_msgSend(v5, "addObject:", v9);
    }
  }
  else
  {
    *a3 = 0;
  }

}

- (void)traverseWithHandler:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = 1;
    (*((void (**)(id, MNRouteDivergenceFinderBoundingSection *, char *))v4 + 2))(v4, self, &v6);
    if (v6)
    {
      -[MNRouteDivergenceFinderBoundingSection traverseWithHandler:](self->_left, "traverseWithHandler:", v5);
      -[MNRouteDivergenceFinderBoundingSection traverseWithHandler:](self->_right, "traverseWithHandler:", v5);
    }
  }

}

- (BOOL)containsCoordinate:(id)a3
{
  GEOMapPointForCoordinate();
  return GEOMapRectContainsPoint();
}

- (id)treeDescription
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNRouteDivergenceFinderBoundingSection _appendDescription:indent:](self, "_appendDescription:indent:", v3, 0);
  return v3;
}

- (id)boundsDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  GEOCoordinate2DForMapPoint();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%f, %f\n"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  GEOCoordinate2DForMapPoint();
  objc_msgSend(v4, "appendFormat:", CFSTR("%f, %f\n"), v5, v6);
  GEOCoordinate2DForMapPoint();
  objc_msgSend(v4, "appendFormat:", CFSTR("%f, %f\n"), v7, v8);
  GEOCoordinate2DForMapPoint();
  objc_msgSend(v4, "appendFormat:", CFSTR("%f, %f"), v9, v10);
  return v4;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;

  GEOCoordinate2DForMapPoint();
  v4 = v3;
  v6 = v5;
  GEOCoordinate2DForMapPoint();
  v8 = v7;
  v10 = v9;
  if (-[MNRouteDivergenceFinderBoundingSection isLeaf](self, "isLeaf"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", leafIndex: %d"), self->_leafIndex);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &stru_1E61D9090;
  }
  v12 = (void *)MEMORY[0x1E0CB3940];
  GEOPolylineCoordinateRangeAsString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("[%@] (%f, %f) (%f, %f) %d meters%@\n"), v13, v4, v6, v8, v10, (int)self->_length, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)_appendDescription:(id)a3 indent:(unint64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  -[MNRouteDivergenceFinderBoundingSection description](self, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("%*s%@"), (2 * a4), ", v6);

  -[MNRouteDivergenceFinderBoundingSection _appendDescription:indent:](self->_left, "_appendDescription:indent:", v7, ++a4);
  -[MNRouteDivergenceFinderBoundingSection _appendDescription:indent:](self->_right, "_appendDescription:indent:", v7, a4);

}

- (GEOPolylineCoordinateRange)range
{
  PolylineCoordinate end;
  PolylineCoordinate start;
  GEOPolylineCoordinateRange result;

  end = self->_range.end;
  start = self->_range.start;
  result.end = end;
  result.start = start;
  return result;
}

- (void)setRange:(GEOPolylineCoordinateRange)a3
{
  self->_range = a3;
}

- ($DA1BCF6CE077296A0BBD1E939DD7545D)boundingRect
{
  double x;
  double y;
  double width;
  double height;
  $DA1BCF6CE077296A0BBD1E939DD7545D result;

  x = self->_boundingRect.origin.x;
  y = self->_boundingRect.origin.y;
  width = self->_boundingRect.size.width;
  height = self->_boundingRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (void)setBoundingRect:(id)a3
{
  self->_boundingRect = ($38331481AFF9933D7B41DAD29E7F60CE)a3;
}

- (MNRouteDivergenceFinderBoundingSection)left
{
  return self->_left;
}

- (void)setLeft:(id)a3
{
  objc_storeStrong((id *)&self->_left, a3);
}

- (MNRouteDivergenceFinderBoundingSection)right
{
  return self->_right;
}

- (void)setRight:(id)a3
{
  objc_storeStrong((id *)&self->_right, a3);
}

- (unint64_t)leafIndex
{
  return self->_leafIndex;
}

- (void)setLeafIndex:(unint64_t)a3
{
  self->_leafIndex = a3;
}

- (double)length
{
  return self->_length;
}

- (void)setLength:(double)a3
{
  self->_length = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_right, 0);
  objc_storeStrong((id *)&self->_left, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0xBF80000000000000;
  *((_QWORD *)self + 6) = 0xBF80000000000000;
  return self;
}

@end
