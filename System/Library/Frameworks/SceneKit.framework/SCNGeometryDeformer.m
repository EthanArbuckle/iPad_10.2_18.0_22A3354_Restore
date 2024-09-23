@implementation SCNGeometryDeformer

- (SCNGeometryDeformer)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCNGeometryDeformer;
  return -[SCNGeometryDeformer init](&v4, sel_init, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)requiredInputs
{
  return 0;
}

- (unint64_t)supportedOutputs
{
  return 1;
}

- (unint64_t)requiredOutputs
{
  return 1;
}

- (BOOL)deformedMeshReliesOnTransforms
{
  return 0;
}

- (BOOL)deformedMeshReliesOnFrustum
{
  return 0;
}

- (BOOL)_getDeformedMeshBoundingBox:(id *)a3
{
  return 0;
}

- (id)meshForDeformedTopology
{
  -[SCNGeometryDeformer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)dependencyNodeAtIndex:(unint64_t)a3
{
  return 0;
}

- (void)_enumerateDependencyNodesUsingBlock:(id)a3
{
  unint64_t v5;
  char v6;

  v6 = 0;
  v5 = -[SCNGeometryDeformer requiredInputs](self, "requiredInputs");
  if ((v5 & 0x38) != 0)
    (*((void (**)(id, _QWORD, id, unint64_t, char *))a3 + 2))(a3, 0, -[SCNGeometryDeformer dependencyNodeAtIndex:](self, "dependencyNodeAtIndex:", 0), v5, &v6);
  if ((v5 & 0x1C0) != 0)
    (*((void (**)(id, uint64_t, id, unint64_t, char *))a3 + 2))(a3, 1, -[SCNGeometryDeformer dependencyNodeAtIndex:](self, "dependencyNodeAtIndex:", 1), v5, &v6);
}

- (id)newDeformerInstanceForNode:(id)a3 outputs:(unint64_t)a4 computeVertexCount:(unint64_t)a5 context:(id)a6
{
  -[SCNGeometryDeformer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
  return 0;
}

@end
