@implementation GESSAlgTopologyQuality

- (void)setQualityImpl:(const TopologyQuality *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->nVertices;
  *(_OWORD *)&self->_qualityImpl.nFaces = *(_OWORD *)&a3->nFaces;
  *(_OWORD *)&self->_qualityImpl.nVertices = v3;
}

- (unsigned)numberOfVertices
{
  return self->_qualityImpl.nVertices;
}

- (void)setNumberOfVertices:(unsigned int)a3
{
  self->_qualityImpl.nVertices = a3;
}

- (unsigned)numberOfHalfEdges
{
  return self->_qualityImpl.nHalfEdges;
}

- (void)setNumberOfHalfEdges:(unsigned int)a3
{
  self->_qualityImpl.nHalfEdges = a3;
}

- (unsigned)numberOfBoundaryHalfEdges
{
  return self->_qualityImpl.nBoundaryHalfEdges;
}

- (void)setNumberOfBoundaryHalfEdges:(unsigned int)a3
{
  self->_qualityImpl.nBoundaryHalfEdges = a3;
}

- (unsigned)numberOfEdges
{
  return self->_qualityImpl.nEdges;
}

- (void)setNumberOfEdges:(unsigned int)a3
{
  self->_qualityImpl.nEdges = a3;
}

- (unsigned)numberOfFaces
{
  return self->_qualityImpl.nFaces;
}

- (void)setNumberOfFaces:(unsigned int)a3
{
  self->_qualityImpl.nFaces = a3;
}

- (unsigned)numberOfBoundaryLoops
{
  return self->_qualityImpl.nBoundaryLoops;
}

- (void)setNumberOfBoundaryLoops:(unsigned int)a3
{
  self->_qualityImpl.nBoundaryLoops = a3;
}

- (unsigned)numberOfGenus
{
  return self->_qualityImpl.nGenus;
}

- (void)setNumberOfGenus:(unsigned int)a3
{
  self->_qualityImpl.nGenus = a3;
}

- (unsigned)numberOfComponents
{
  return self->_qualityImpl.nComponents;
}

- (void)setNumberOfComponents:(unsigned int)a3
{
  self->_qualityImpl.nComponents = a3;
}

- (BOOL)equal:(id)a3
{
  return cv3d::cv::gess::alg::operator==(&self->_qualityImpl.nVertices, (_QWORD *)a3 + 1);
}

- (id)description
{
  void *v2;
  void **v3;
  void *v4;
  void *__p[2];
  char v7;

  v2 = (void *)MEMORY[0x24BDD17C8];
  cv3d::cv::gess::alg::TopologyQuality::Description(__p);
  if (v7 >= 0)
    v3 = __p;
  else
    v3 = (void **)__p[0];
  objc_msgSend(v2, "stringWithUTF8String:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 < 0)
    operator delete(__p[0]);
  return v4;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
