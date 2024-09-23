@implementation _MNMapPointsArray

- (void)points
{
  return self->_mapPoints;
}

- (_MNMapPointsArray)initWithCapacity:(unint64_t)a3
{
  _MNMapPointsArray *v4;
  _MNMapPointsArray *v5;
  _MNMapPointsArray *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MNMapPointsArray;
  v4 = -[_MNMapPointsArray init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_count = a3;
    v4->_mapPoints = ($F24F406B2B787EFB06265DBA3D28CBD5 *)malloc_type_malloc(16 * a3, 0x1000040451B5BE8uLL);
    v6 = v5;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_mapPoints);
  v3.receiver = self;
  v3.super_class = (Class)_MNMapPointsArray;
  -[_MNMapPointsArray dealloc](&v3, sel_dealloc);
}

- (unint64_t)count
{
  return self->_count;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)mapPoints
{
  return self->_mapPoints;
}

@end
