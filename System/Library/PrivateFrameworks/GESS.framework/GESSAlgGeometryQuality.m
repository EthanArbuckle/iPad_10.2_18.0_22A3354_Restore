@implementation GESSAlgGeometryQuality

- (void)setQualityImpl:(const void *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)a3;
  self->_qualityImpl.faceAngleSD = *((float *)a3 + 4);
  *(_OWORD *)&self->_qualityImpl.avgEdgeLength = v3;
  *(_OWORD *)self[1]._anon_8 = *((_OWORD *)a3 + 2);
  *(_OWORD *)&self[1]._qualityImpl.vertexValenceDeviation = *((_OWORD *)a3 + 3);
}

- (float)averageEdgeLength
{
  return self->_qualityImpl.avgEdgeLength;
}

- (void)setAverageEdgeLength:(float)a3
{
  self->_qualityImpl.avgEdgeLength = a3;
}

- (float)averageVertexValence
{
  return self->_qualityImpl.avgVertexValence;
}

- (void)setAverageVertexValence:(float)a3
{
  self->_qualityImpl.avgVertexValence = a3;
}

- (float)vertexValenceDeviation
{
  return self->_qualityImpl.vertexValenceDeviation;
}

- (void)setVertexValenceDeviation:(float)a3
{
  self->_qualityImpl.vertexValenceDeviation = a3;
}

- (float)edgeLengthStandardDeviation
{
  return self->_qualityImpl.edgeLengthSD;
}

- (void)setEdgeLengthStandardDeviation:(float)a3
{
  self->_qualityImpl.edgeLengthSD = a3;
}

- (float)faceAngleStandardDeviation
{
  return self->_qualityImpl.faceAngleSD;
}

- (void)setFaceAngleStandardDeviation:(float)a3
{
  self->_qualityImpl.faceAngleSD = a3;
}

- (GESSMathAABB)AABB
{
  GESSMathAABB *v3;

  v3 = objc_alloc_init(GESSMathAABB);
  -[GESSMathAABB setBoxImpl:](v3, "setBoxImpl:", self[1]._anon_8);
  return v3;
}

- (void)setAABB:(id)a3
{
  _OWORD *v4;

  v4 = (_OWORD *)objc_msgSend(a3, "boxImpl");
  *(_OWORD *)self[1]._anon_8 = *v4;
  *(_OWORD *)&self[1]._qualityImpl.vertexValenceDeviation = v4[1];
}

- (id)description
{
  void *v2;
  void **v3;
  void *v4;
  void *__p[2];
  char v7;

  v2 = (void *)MEMORY[0x24BDD17C8];
  cv3d::cv::gess::alg::GeometryQuality::Description(__p);
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
  __int128 v2;

  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_DWORD *)self + 8) = 0;
  *(_QWORD *)&v2 = 0x80000000800000;
  *((_QWORD *)&v2 + 1) = 0x80000000800000;
  *((int32x4_t *)self + 3) = vdupq_n_s32(0x7F7FFFFFu);
  *((_OWORD *)self + 4) = v2;
  return self;
}

@end
