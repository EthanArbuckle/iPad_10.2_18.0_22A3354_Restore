@implementation VCPFaceGeometry

- (VCPFaceGeometry)initWithVertices:(VCPFaceGeometry *)self vertexCount:(SEL)a2
{
  const void *v2;
  unint64_t v3;
  unint64_t v4;
  const void *v5;
  VCPFaceGeometry *v6;
  VCPFaceGeometry *v7;
  void *v9;
  VCPFaceGeometry *v10;
  VCPFaceGeometry *v11;
  objc_super v13;

  v4 = v3;
  v5 = v2;
  v13.receiver = self;
  v13.super_class = (Class)VCPFaceGeometry;
  v6 = -[VCPFaceGeometry init](&v13, sel_init);
  v7 = v6;
  if (v4 - 5001 < 0xFFFFFFFFFFFFEC78 || v6 == 0)
  {
    v10 = 0;
  }
  else
  {
    v6->_vertexCount = v4;
    v9 = (void *)operator new[]();
    *(_QWORD *)v7->_vertices = v9;
    memcpy(v9, v5, 16 * v7->_vertexCount);
    v10 = v7;
  }
  v11 = v10;

  return v11;
}

- (uint64_t)vertices
{
  return *(_QWORD *)(a1 + 8);
}

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  v3 = *(_QWORD *)self->_vertices;
  if (v3)
    MEMORY[0x1BCCA128C](v3, 0x1000C80451B5BE8);
  v4.receiver = self;
  v4.super_class = (Class)VCPFaceGeometry;
  -[VCPFaceGeometry dealloc](&v4, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *(_QWORD *)self->_vertices, 16 * self->_vertexCount);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("vertices"));

}

- (VCPFaceGeometry)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  VCPFaceGeometry *v7;
  uint8_t v9[16];

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vertices"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  if (v6 > 0xF)
  {
    self = -[VCPFaceGeometry initWithVertices:vertexCount:](self, "initWithVertices:vertexCount:", objc_msgSend(objc_retainAutorelease(v5), "bytes"), v6 >> 4);
    v7 = self;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPFaceGeometry initWithCoder - vertices data missing", v9, 2u);
    }
    v7 = 0;
  }

  return v7;
}

- (unint64_t)vertexCount
{
  return self->_vertexCount;
}

@end
