@implementation SCNMTLBezierCurveDeformer

+ (unint64_t)requiredInputs
{
  return 1;
}

+ (unint64_t)supportedOutputs
{
  return 3;
}

+ (unint64_t)requiredOutputs
{
  return 1;
}

- (SCNMTLBezierCurveDeformer)initWithMeshlessGeometry:(__C3DGeometry *)a3 outputs:(unint64_t)a4 deformDataKind:(unsigned __int8)a5 finalDataKind:(unsigned __int8)a6 resourceManager:(id)a7 computeContext:(id)a8
{
  char *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t BezierCurve;
  unint64_t CurveInfo;
  unint64_t v16;
  unint64_t v17;
  const void *CurveSegmentsControlPointIndices;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  size_t v24;
  size_t v25;
  _QWORD *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  SCNMTLMeshElement *v33;
  SCNMTLMesh *v34;
  id v35;
  id v36;
  id v37;
  unsigned __int16 v39;
  objc_super v40;
  SCNMTLMeshElement *v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v40.receiver = self;
  v40.super_class = (Class)SCNMTLBezierCurveDeformer;
  v10 = -[SCNMTLBezierCurveDeformer init](&v40, sel_init, a3, a4, a5, a6, a7, a8);
  if (!v10)
    return (SCNMTLBezierCurveDeformer *)v10;
  *((__n128 *)v10 + 1) = C3DBezierCurveGeometryGetTransform((__n128 *)a3);
  *((_OWORD *)v10 + 2) = v11;
  *((_OWORD *)v10 + 3) = v12;
  *((_OWORD *)v10 + 4) = v13;
  BezierCurve = C3DBezierCurveGeometryGetBezierCurve((uint64_t)a3);
  CurveInfo = C3DBezierCurveGetCurveInfo(BezierCurve);
  v17 = v16;
  v39 = 0;
  CurveSegmentsControlPointIndices = (const void *)C3DBezierCurveGetCurveSegmentsControlPointIndices(BezierCurve, &v39);
  *((_WORD *)v10 + 40) = WORD2(CurveInfo);
  *((_DWORD *)v10 + 24) = CurveInfo;
  *((_WORD *)v10 + 41) = v17;
  v19 = HIDWORD(v17);
  *((_WORD *)v10 + 42) = WORD2(v17);
  *((_WORD *)v10 + 43) = 14;
  if (HIDWORD(CurveInfo))
  {
    v20 = HIDWORD(CurveInfo) + 14;
    v21 = v17;
    if (!(_DWORD)v17)
      goto LABEL_9;
    if (CurveInfo >= 0xFFF200000000)
      -[SCNMTLBezierCurveDeformer initWithMeshlessGeometry:outputs:deformDataKind:finalDataKind:resourceManager:computeContext:].cold.3();
  }
  else
  {
    v20 = 14;
    v21 = v17;
    if (!(_DWORD)v17)
    {
LABEL_9:
      *((_WORD *)v10 + 44) = v20;
      if (v19)
        goto LABEL_10;
      goto LABEL_8;
    }
  }
  *((_WORD *)v10 + 44) = v20;
  v20 += v21;
  if (v19)
  {
LABEL_10:
    if (v20 >= 0x10000)
      -[SCNMTLBezierCurveDeformer initWithMeshlessGeometry:outputs:deformDataKind:finalDataKind:resourceManager:computeContext:].cold.2();
    *((_WORD *)v10 + 45) = v20;
    v20 += 904 * HIDWORD(v17);
    goto LABEL_12;
  }
LABEL_8:
  *((_WORD *)v10 + 45) = v20;
LABEL_12:
  v22 = (v20 + 1) & 0xFFFFFFFFFFELL;
  if (v22 >= 0x10000)
    -[SCNMTLBezierCurveDeformer initWithMeshlessGeometry:outputs:deformDataKind:finalDataKind:resourceManager:computeContext:].cold.1();
  v23 = v39;
  v24 = 2 * v39;
  *((_WORD *)v10 + 46) = v22;
  v25 = v22 + 2 * v23;
  v26 = malloc_type_malloc(v25, 0xA1D435A5uLL);
  v27 = *((_QWORD *)v10 + 10);
  *(_QWORD *)((char *)v26 + 6) = *(_QWORD *)(v10 + 86);
  *v26 = v27;
  memcpy((char *)v26 + *((unsigned __int16 *)v10 + 46), CurveSegmentsControlPointIndices, v24);
  *((_QWORD *)v10 + 16) = -[SCNMTLResourceManager newBufferWithBytes:length:options:]((uint64_t)a7, (uint64_t)v26, v25, 0);
  free(v26);
  v28 = (void *)objc_msgSend(MEMORY[0x1E0CC6BD8], "vertexDescriptor");
  LODWORD(v24) = SCNMTLVertexFormatGetSize(30);
  LODWORD(v25) = SCNMTLVertexFormatGetSize(29);
  v29 = (void *)objc_msgSend((id)objc_msgSend(v28, "attributes"), "objectAtIndexedSubscript:", 0);
  objc_msgSend(v29, "setFormat:", 30);
  objc_msgSend(v29, "setOffset:", 0);
  objc_msgSend(v29, "setBufferIndex:", 18);
  v30 = (void *)objc_msgSend((id)objc_msgSend(v28, "layouts"), "objectAtIndexedSubscript:", objc_msgSend(v29, "bufferIndex"));
  objc_msgSend(v30, "setStride:", v24);
  objc_msgSend(v30, "setStepFunction:", 1);
  v31 = (void *)objc_msgSend((id)objc_msgSend(v28, "attributes"), "objectAtIndexedSubscript:", 6);
  objc_msgSend(v31, "setFormat:", 29);
  objc_msgSend(v31, "setOffset:", 0);
  objc_msgSend(v31, "setBufferIndex:", 19);
  v32 = (void *)objc_msgSend((id)objc_msgSend(v28, "layouts"), "objectAtIndexedSubscript:", objc_msgSend(v31, "bufferIndex"));
  objc_msgSend(v32, "setStride:", v25);
  objc_msgSend(v32, "setStepFunction:", 1);
  *((_QWORD *)v10 + 15) = -[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)a7, 4 * v25, 32);
  *((_QWORD *)v10 + 14) = -[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)a7, 4 * v24, 32);
  v33 = objc_alloc_init(SCNMTLMeshElement);
  -[SCNMTLMesh setMutabilityTimestamp:]((uint64_t)v33, 4);
  -[SCNMTLMeshElement setPrimitiveRange:](v33, 0, 2);
  v34 = objc_alloc_init(SCNMTLMesh);
  *((_QWORD *)v10 + 13) = v34;
  -[SCNMTLMesh setVertexDescriptor:]((uint64_t)v34, v28);
  v42 = *((_OWORD *)v10 + 7);
  -[SCNMTLMesh setBuffers:](*((void **)v10 + 13), (char *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 2));
  v41 = v33;
  -[SCNMTLMesh setElements:](*((void **)v10 + 13), (char *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1));

  *((_QWORD *)v10 + 18) = (id)objc_msgSend(a7, "computePipelineStateForKernel:", CFSTR("deformer_bezier_build_quad_geometry"));
  if (*((_WORD *)v10 + 40))
    v35 = (id)objc_msgSend(a7, "computePipelineStateForKernel:", CFSTR("deformer_bezier_build_info_linear"));
  else
    v35 = 0;
  *((_QWORD *)v10 + 19) = v35;
  if (*((_WORD *)v10 + 41))
    v36 = (id)objc_msgSend(a7, "computePipelineStateForKernel:", CFSTR("deformer_bezier_build_info_quadratic"));
  else
    v36 = 0;
  *((_QWORD *)v10 + 20) = v36;
  if (*((_WORD *)v10 + 42))
    v37 = (id)objc_msgSend(a7, "computePipelineStateForKernel:", CFSTR("deformer_bezier_build_info_cubic"));
  else
    v37 = 0;
  *((_QWORD *)v10 + 21) = v37;
  return (SCNMTLBezierCurveDeformer *)v10;
}

+ (BOOL)deformsControlPointsForMeshlessGeometry:(__C3DGeometry *)a3
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNMTLBezierCurveDeformer;
  -[SCNMTLBezierCurveDeformer dealloc](&v3, sel_dealloc);
}

- (SCNMTLMesh)finalMesh
{
  return self->_quadMesh;
}

- (id)bufferForCommonProfileArgumentNamed:(id)a3
{
  uint64_t v5;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("scn_bezier_curve_data")) & 1) != 0)
  {
    v5 = 128;
    return *(Class *)((char *)&self->super.isa + v5);
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("scn_bezier_curve_controlPoints")))
  {
    v5 = 136;
    return *(Class *)((char *)&self->super.isa + v5);
  }
  return 0;
}

- (unint64_t)updateWithComputeContext:(id)a3 buffers:(id *)a4
{
  unint64_t v7;
  unint64_t v8;
  MTLBuffer *var1;
  MTLBuffer *var0;
  SCNMTLComputeCommandEncoder *v11;
  int segmentCountLinear;
  int segmentCountQuadratic;
  unsigned int segmentCountCubic;
  MTLBuffer *bezierCurveInfoBuffer;
  unint64_t controlPointIndicesOffset;
  unint64_t segmentInfoOffsetLinear;
  uint64_t v18;
  uint64_t v19;
  MTLBuffer *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  MTLBuffer *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  MTLBuffer *quadPositionsBuffer;
  MTLBuffer *quadTexcoordsBuffer;
  uint64_t v32;
  unsigned int curveControlPointCount;
  unsigned int v35;
  unsigned int v36;
  _DWORD v37[3];

  v7 = objc_msgSend(a3, "currentFrameHash");
  if (self->_currentFrameHash == v7)
    return 0;
  self->_currentFrameHash = v7;
  var0 = (MTLBuffer *)a4->var0;
  var1 = (MTLBuffer *)a4->var1;
  self->_lastDeformedCurveControlPointsBuffer = var1;
  v11 = (SCNMTLComputeCommandEncoder *)objc_msgSend(a3, "currentComputeEncoder");
  bzero(v11, 0x678uLL);
  segmentCountLinear = self->_curveInfo.segmentCountLinear;
  segmentCountQuadratic = self->_curveInfo.segmentCountQuadratic;
  v36 = segmentCountQuadratic;
  v37[0] = segmentCountLinear;
  segmentCountCubic = self->_curveInfo.segmentCountCubic;
  v35 = segmentCountCubic;
  if (var0)
  {
    v11->_buffers[1] = var0;
    v11->_offsets[1] = 0;
    v11->_buffersToBind[0] |= 2uLL;
  }
  if (segmentCountLinear)
  {
    SCNMTLComputeCommandEncoder::setBytes(v11, v37, 4uLL, 0);
    bezierCurveInfoBuffer = self->_bezierCurveInfoBuffer;
    controlPointIndicesOffset = self->_curveInfo.controlPointIndicesOffset;
    if (v11->_buffers[2] == bezierCurveInfoBuffer)
    {
      if (v11->_offsets[2] == controlPointIndicesOffset)
        goto LABEL_10;
    }
    else
    {
      v11->_buffers[2] = bezierCurveInfoBuffer;
    }
    v11->_offsets[2] = controlPointIndicesOffset;
    v11->_buffersToBind[0] |= 4uLL;
    bezierCurveInfoBuffer = self->_bezierCurveInfoBuffer;
LABEL_10:
    segmentInfoOffsetLinear = self->_curveInfo.segmentInfoOffsetLinear;
    if (v11->_buffers[3] == bezierCurveInfoBuffer)
    {
      if (v11->_offsets[3] == segmentInfoOffsetLinear)
      {
LABEL_14:
        v18 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_buildBezierCurveInfoPipelineLinear);
        v19 = v37[0];
        if (v11->_computePipelineState != (MTLComputePipelineState *)v18)
        {
          v11->_computePipelineState = (MTLComputePipelineState *)v18;
          -[MTLComputeCommandEncoder setComputePipelineState:](v11->_encoder, "setComputePipelineState:", v18);
        }
        SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v11, v19);
        segmentCountQuadratic = v36;
        goto LABEL_17;
      }
    }
    else
    {
      v11->_buffers[3] = bezierCurveInfoBuffer;
    }
    v11->_offsets[3] = segmentInfoOffsetLinear;
    v11->_buffersToBind[0] |= 8uLL;
    goto LABEL_14;
  }
LABEL_17:
  if (segmentCountQuadratic < 1)
    goto LABEL_29;
  SCNMTLComputeCommandEncoder::setBytes(v11, &v36, 4uLL, 0);
  v20 = self->_bezierCurveInfoBuffer;
  v21 = self->_curveInfo.controlPointIndicesOffset;
  if (v11->_buffers[2] == v20)
  {
    if (v11->_offsets[2] == v21)
      goto LABEL_22;
  }
  else
  {
    v11->_buffers[2] = v20;
  }
  v11->_offsets[2] = v21;
  v11->_buffersToBind[0] |= 4uLL;
  v20 = self->_bezierCurveInfoBuffer;
LABEL_22:
  v22 = self->_curveInfo.segmentInfoOffsetQuadratic + 4 * v37[0];
  if (v11->_buffers[3] != v20)
  {
    v11->_buffers[3] = v20;
LABEL_25:
    v11->_offsets[3] = v22;
    v11->_buffersToBind[0] |= 8uLL;
    goto LABEL_26;
  }
  if (v11->_offsets[3] != v22)
    goto LABEL_25;
LABEL_26:
  v23 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_buildBezierCurveInfoPipelineQuadratic);
  v24 = v36;
  if (v11->_computePipelineState != (MTLComputePipelineState *)v23)
  {
    v11->_computePipelineState = (MTLComputePipelineState *)v23;
    -[MTLComputeCommandEncoder setComputePipelineState:](v11->_encoder, "setComputePipelineState:", v23);
  }
  SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v11, v24);
LABEL_29:
  if (!segmentCountCubic)
    goto LABEL_41;
  SCNMTLComputeCommandEncoder::setBytes(v11, &v35, 4uLL, 0);
  v25 = self->_bezierCurveInfoBuffer;
  v26 = self->_curveInfo.controlPointIndicesOffset;
  if (v11->_buffers[2] == v25)
  {
    if (v11->_offsets[2] == v26)
      goto LABEL_34;
  }
  else
  {
    v11->_buffers[2] = v25;
  }
  v11->_offsets[2] = v26;
  v11->_buffersToBind[0] |= 4uLL;
  v25 = self->_bezierCurveInfoBuffer;
LABEL_34:
  v27 = self->_curveInfo.segmentInfoOffsetCubic + 2 * (int)(3 * v36 + 2 * v37[0]);
  if (v11->_buffers[3] != v25)
  {
    v11->_buffers[3] = v25;
LABEL_37:
    v11->_offsets[3] = v27;
    v11->_buffersToBind[0] |= 8uLL;
    goto LABEL_38;
  }
  if (v11->_offsets[3] != v27)
    goto LABEL_37;
LABEL_38:
  v28 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_buildBezierCurveInfoPipelineCubic);
  v29 = v35;
  if (v11->_computePipelineState != (MTLComputePipelineState *)v28)
  {
    v11->_computePipelineState = (MTLComputePipelineState *)v28;
    -[MTLComputeCommandEncoder setComputePipelineState:](v11->_encoder, "setComputePipelineState:", v28);
  }
  SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v11, v29);
LABEL_41:
  curveControlPointCount = self->_curveControlPointCount;
  SCNMTLComputeCommandEncoder::setBytes(v11, &curveControlPointCount, 4uLL, 0);
  SCNMTLComputeCommandEncoder::setBytes(v11, self->_anon_10, 0x40uLL, 1uLL);
  if (v11->_buffers[2] == var1)
  {
    if (!v11->_offsets[2])
      goto LABEL_45;
  }
  else
  {
    v11->_buffers[2] = var1;
  }
  v11->_offsets[2] = 0;
  v11->_buffersToBind[0] |= 4uLL;
LABEL_45:
  quadPositionsBuffer = self->_quadPositionsBuffer;
  if (v11->_buffers[3] == quadPositionsBuffer)
  {
    if (!v11->_offsets[3])
      goto LABEL_49;
  }
  else
  {
    v11->_buffers[3] = quadPositionsBuffer;
  }
  v11->_offsets[3] = 0;
  v11->_buffersToBind[0] |= 8uLL;
LABEL_49:
  quadTexcoordsBuffer = self->_quadTexcoordsBuffer;
  if (v11->_buffers[4] != quadTexcoordsBuffer)
  {
    v11->_buffers[4] = quadTexcoordsBuffer;
LABEL_52:
    v11->_offsets[4] = 0;
    v11->_buffersToBind[0] |= 0x10uLL;
    goto LABEL_53;
  }
  if (v11->_offsets[4])
    goto LABEL_52;
LABEL_53:
  v32 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_buildQuadGeometryPipeline);
  if (v11->_computePipelineState != (MTLComputePipelineState *)v32)
  {
    v11->_computePipelineState = (MTLComputePipelineState *)v32;
    -[MTLComputeCommandEncoder setComputePipelineState:](v11->_encoder, "setComputePipelineState:", v32);
  }
  v8 = 1;
  SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v11, 1);
  return v8;
}

- (void)initWithMeshlessGeometry:outputs:deformDataKind:finalDataKind:resourceManager:computeContext:.cold.1()
{
  __assert_rtn("-[SCNMTLBezierCurveDeformer initWithMeshlessGeometry:outputs:deformDataKind:finalDataKind:resourceManager:computeContext:]", "SCNMTLBezierCurveDeformer.mm", 130, "offset <= UINT16_MAX");
}

- (void)initWithMeshlessGeometry:outputs:deformDataKind:finalDataKind:resourceManager:computeContext:.cold.2()
{
  __assert_rtn("-[SCNMTLBezierCurveDeformer initWithMeshlessGeometry:outputs:deformDataKind:finalDataKind:resourceManager:computeContext:]", "SCNMTLBezierCurveDeformer.mm", 122, "offset <= UINT16_MAX");
}

- (void)initWithMeshlessGeometry:outputs:deformDataKind:finalDataKind:resourceManager:computeContext:.cold.3()
{
  __assert_rtn("-[SCNMTLBezierCurveDeformer initWithMeshlessGeometry:outputs:deformDataKind:finalDataKind:resourceManager:computeContext:]", "SCNMTLBezierCurveDeformer.mm", 113, "offset <= UINT16_MAX");
}

@end
