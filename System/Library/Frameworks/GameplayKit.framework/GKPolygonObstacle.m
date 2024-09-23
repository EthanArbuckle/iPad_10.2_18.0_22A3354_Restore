@implementation GKPolygonObstacle

- (void)setCPolygonObstacle:(void *)a3
{
  self->_cPolygonObstacle = a3;
}

- (void)cPolygonObstacle
{
  return self->_cPolygonObstacle;
}

- (GKPolygonObstacle)init
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("initWithPoints: is the destignated initialize for GKPolygonObstacle.  Use that instead"));
  return -[GKPolygonObstacle initWithPoints:count:](self, "initWithPoints:count:", 0, 0);
}

+ (GKPolygonObstacle)obstacleWithPoints:(vector_float2 *)points count:(size_t)numPoints
{
  return -[GKPolygonObstacle initWithPoints:count:]([GKPolygonObstacle alloc], "initWithPoints:count:", points, numPoints);
}

- (GKPolygonObstacle)initWithPoints:(vector_float2 *)points count:(size_t)numPoints
{
  GKPolygonObstacle *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GKPolygonObstacle;
  v6 = -[GKPolygonObstacle init](&v9, sel_init);
  if (v6)
  {
    v7 = operator new();
    GKCPolygonObstacle::GKCPolygonObstacle(v7, points, numPoints);
    v6->_cPolygonObstacle = (void *)v7;
    *(_QWORD *)(v7 + 64) = v6;
  }
  return v6;
}

- (void)dealloc
{
  void *cPolygonObstacle;
  objc_super v4;

  cPolygonObstacle = self->_cPolygonObstacle;
  if (cPolygonObstacle)
    (*(void (**)(void *, SEL))(*(_QWORD *)cPolygonObstacle + 8))(cPolygonObstacle, a2);
  v4.receiver = self;
  v4.super_class = (Class)GKPolygonObstacle;
  -[GKPolygonObstacle dealloc](&v4, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (vector_float2)vertexAtIndex:(NSUInteger)index
{
  return *(vector_float2 *)(*((_QWORD *)self->_cPolygonObstacle + 1) + 8 * index);
}

- (NSUInteger)vertexCount
{
  return (uint64_t)(*((_QWORD *)self->_cPolygonObstacle + 2) - *((_QWORD *)self->_cPolygonObstacle + 1)) >> 3;
}

- (Obstacle)obstacle
{
  return (Obstacle *)((char *)self->_cPolygonObstacle + 32);
}

- (GKPolygonObstacle)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  GKPolygonObstacle *v8;
  id v10;
  id v11;
  unint64_t v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("numVertices"));
  if ((v5 & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Serialization error!  Value (%i) for key 'numVertices' can not be negative."), v5);
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], objc_claimAutoreleasedReturnValue(), 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  v12 = 0;
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("vertices"), &v12);
  if (v12 < 8 * (unint64_t)v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Serialization error!  Expected to decode %zu bytes for key 'vertices'.  Got %zu."), 8 * v5, v12);
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], objc_claimAutoreleasedReturnValue(), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  v8 = -[GKPolygonObstacle initWithPoints:count:](self, "initWithPoints:count:", v7, v5);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", (uint64_t)(*((_QWORD *)self->_cPolygonObstacle + 2) - *((_QWORD *)self->_cPolygonObstacle + 1)) >> 3, CFSTR("numVertices"));
  objc_msgSend(v4, "encodeBytes:length:forKey:", *((_QWORD *)self->_cPolygonObstacle + 1), *((_QWORD *)self->_cPolygonObstacle + 2) - *((_QWORD *)self->_cPolygonObstacle + 1), CFSTR("vertices"));

}

@end
