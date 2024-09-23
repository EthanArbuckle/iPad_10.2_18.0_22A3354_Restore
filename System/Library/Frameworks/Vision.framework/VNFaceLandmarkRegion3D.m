@implementation VNFaceLandmarkRegion3D

- (VNFaceLandmarkRegion3D)initWithOriginatingRequestSpecifier:(id)a3 faceBoundingBox:(CGRect)a4
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("[VNFaceLandmarkRegion3D -initWithRequestRevision:faceBoundingBox:] is not available, use class designated initializers"), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v5);
}

- (VNFaceLandmarkRegion3D)initWithOriginatingRequestSpecifier:(VNFaceLandmarkRegion3D *)self faceBoundingBox:(SEL)a2 points:(id)a3 pointCount:(CGRect)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  VNFaceLandmarkRegion3D *v7;
  VNFaceLandmarkRegion3D *v8;
  VNFaceLandmarkRegion3D *v9;
  objc_super v11;

  v6 = v4;
  v11.receiver = self;
  v11.super_class = (Class)VNFaceLandmarkRegion3D;
  v7 = -[VNFaceLandmarkRegion initWithOriginatingRequestSpecifier:faceBoundingBox:pointCount:](&v11, sel_initWithOriginatingRequestSpecifier_faceBoundingBox_pointCount_, a3, v5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v8 = v7;
  if (v7)
  {
    *(_QWORD *)v7->_points = v6;
    v9 = v7;
  }

  return v8;
}

- (VNFaceLandmarkRegion3D)initWithCoder:(id)a3
{
  id v4;
  VNFaceLandmarkRegion3D *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  size_t v9;
  size_t v10;
  void *v11;
  id v12;
  VNFaceLandmarkRegion3D *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VNFaceLandmarkRegion3D;
  v5 = -[VNFaceLandmarkRegion initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_8;
  v6 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("VNFaceLandmarkRegion3D"));
  if ((_DWORD)v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to unarchive VNFaceLandmarkRegion3D object due to coding version mismatch: Currently supported: %u; encoded: %u"),
                   0,
                   v6);
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v8);
LABEL_7:

LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  v9 = -[VNFaceLandmarkRegion pointCount](v5, "pointCount");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FLMReg3D_PtsData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "length");
  if (v10 != 16 * v9)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to unarchive VNFaceLandmarkRegion3D object. Error: points buffer size mismatch (data size: %lu; expected: %lu)"),
                   v10,
                   16 * v9);
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v14);

    goto LABEL_7;
  }
  v11 = malloc_type_calloc(v9, 0x10uLL, 0x1000040451B5BE8uLL);
  *(_QWORD *)v5->_points = v11;
  v12 = objc_retainAutorelease(v7);
  memcpy(v11, (const void *)objc_msgSend(v12, "bytes"), v10);

  v13 = v5;
LABEL_9:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VNFaceLandmarkRegion3D;
  -[VNFaceLandmarkRegion encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt32:forKey:", 0, CFSTR("VNFaceLandmarkRegion3D"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", -[VNFaceLandmarkRegion3D points](self, "points"), 16 * -[VNFaceLandmarkRegion pointCount](self, "pointCount"), 0);
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("FLMReg3D_PtsData"));

}

- (__n128)pointAtIndex:(unint64_t)a3
{
  unint64_t v5;
  __n128 result;

  v5 = objc_msgSend(a1, "pointCount");
  result.n128_u64[0] = 0;
  if (v5 <= a3)
    return *(__n128 *)(a1[7] + 16 * a3);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  free(*(void **)self->_points);
  v3.receiver = self;
  v3.super_class = (Class)VNFaceLandmarkRegion3D;
  -[VNFaceLandmarkRegion3D dealloc](&v3, sel_dealloc);
}

- (uint64_t)points
{
  return *(_QWORD *)(a1 + 56);
}

- (void)setPoints:(VNFaceLandmarkRegion3D *)self
{
  uint64_t v2;

  *(_QWORD *)self->_points = v2;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return CFSTR("VNDetectFace3DLandmarksRequest");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
