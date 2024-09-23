@implementation ADDisparityToDepthWorldPointsContainer

- (ADDisparityToDepthWorldPointsContainer)initWithParameters:(id)a3
{
  id v4;
  ADDisparityToDepthWorldPointsContainer *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  WorldPointsContainer *value;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ADDisparityToDepthWorldPointsContainer;
  v5 = -[ADDisparityToDepthWorldPointsContainer init](&v13, sel_init);
  if (v5)
  {
    v6 = operator new();
    v7 = objc_msgSend(v4, "capacity");
    objc_msgSend(v4, "threshold");
    *(_QWORD *)v6 = 0;
    *(_QWORD *)(v6 + 8) = 0;
    *(_QWORD *)(v6 + 16) = 0;
    *(_QWORD *)(v6 + 24) = v7;
    *(_QWORD *)(v6 + 40) = 0;
    *(_QWORD *)(v6 + 48) = 0;
    *(_QWORD *)(v6 + 32) = 0;
    *(_DWORD *)(v6 + 56) = v8;
    value = v5->_worldPoints.__ptr_.__value_;
    v5->_worldPoints.__ptr_.__value_ = (WorldPointsContainer *)v6;
    if (value)
    {
      v10 = (void *)*((_QWORD *)value + 4);
      if (v10)
      {
        *((_QWORD *)value + 5) = v10;
        operator delete(v10);
      }
      v11 = *(void **)value;
      if (*(_QWORD *)value)
      {
        *((_QWORD *)value + 1) = v11;
        operator delete(v11);
      }
      MEMORY[0x20BD36498](value, 0x1020C403903361BLL);
    }
  }

  return v5;
}

- (unint64_t)size
{
  char *v2;
  char *v3;
  char *v5[3];

  DisparityToDepth::WorldPointsContainer::vector((DisparityToDepth::WorldPointsContainer *)self->_worldPoints.__ptr_.__value_, v5);
  v2 = v5[0];
  v3 = v5[1];
  if (v5[0])
    operator delete(v5[0]);
  return (v3 - v2) >> 5;
}

- (void)push:(ADDisparityToDepthFitWorldPoint *)a3 pointCount:(unint64_t)a4
{
  DisparityToDepth::WorldPointsContainer::push((DisparityToDepth::WorldPointsContainer *)self->_worldPoints.__ptr_.__value_, a3, a4);
}

- (ADDisparityToDepthFitWorldPoint)getPointFromContainer:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  char *v6;
  char *v7;
  char *v8;
  __int128 v9;
  char *v10;
  char *v11;

  v5 = v3;
  DisparityToDepth::WorldPointsContainer::vector((DisparityToDepth::WorldPointsContainer *)self->_worldPoints.__ptr_.__value_, &v10);
  v6 = v10;
  v7 = v11;
  if (v10 == v11)
  {
LABEL_5:
    *(_QWORD *)v5 = 0;
    *(_QWORD *)(v5 + 8) = 0;
    *(_QWORD *)(v5 + 16) = 0xFFFFFFFF00000000;
  }
  else
  {
    v8 = v10;
    while (1)
    {
      v9 = *((_OWORD *)v8 + 1);
      *(_OWORD *)v5 = *(_OWORD *)v8;
      *(_OWORD *)(v5 + 16) = v9;
      if (*(_DWORD *)(v5 + 20) == a3)
        break;
      v8 += 32;
      if (v8 == v7)
        goto LABEL_5;
    }
  }
  if (v6)
    operator delete(v6);
  return (ADDisparityToDepthFitWorldPoint)v6;
}

- (void).cxx_destruct
{
  WorldPointsContainer *value;
  void *v3;
  void *v4;

  value = self->_worldPoints.__ptr_.__value_;
  self->_worldPoints.__ptr_.__value_ = 0;
  if (value)
  {
    v3 = (void *)*((_QWORD *)value + 4);
    if (v3)
    {
      *((_QWORD *)value + 5) = v3;
      operator delete(v3);
    }
    v4 = *(void **)value;
    if (*(_QWORD *)value)
    {
      *((_QWORD *)value + 1) = v4;
      operator delete(v4);
    }
    JUMPOUT(0x20BD36498);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
