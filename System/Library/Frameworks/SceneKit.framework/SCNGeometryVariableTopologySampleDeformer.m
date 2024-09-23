@implementation SCNGeometryVariableTopologySampleDeformer

- (SCNGeometryVariableTopologySampleDeformer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNGeometryVariableTopologySampleDeformer;
  return -[SCNGeometryVariableTopologySampleDeformer init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SCNGeometryVariableTopologySampleDeformer;
  -[SCNGeometryVariableTopologySampleDeformer dealloc](&v2, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNGeometryVariableTopologySampleDeformer;
  -[SCNGeometryDeformer encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (SCNGeometryVariableTopologySampleDeformer)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCNGeometryVariableTopologySampleDeformer;
  return -[SCNGeometryDeformer initWithCoder:](&v4, sel_initWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)requiredInputs
{
  return 1;
}

- (unint64_t)supportedOutputs
{
  return 1;
}

- (unint64_t)requiredOutputs
{
  return 513;
}

- (BOOL)deformedMeshReliesOnTransforms
{
  return 1;
}

- (id)newDeformerInstanceForNode:(id)a3 outputs:(unint64_t)a4 computeVertexCount:(unint64_t)a5 context:(id)a6
{
  SCNGeometryVariableTopologySampleDeformerInstance *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = [SCNGeometryVariableTopologySampleDeformerInstance alloc];
  return -[SCNGeometryVariableTopologySampleDeformerInstance initWithNode:deformer:outputs:computeVertexCount:context:](v8, a3, v9, v10, v11, a6);
}

@end
