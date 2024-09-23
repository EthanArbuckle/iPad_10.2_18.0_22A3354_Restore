@implementation ARSCNFaceGeometry

+ (ARSCNFaceGeometry)faceGeometryWithDevice:(id)a3 eyesFilled:(BOOL)a4 mouthFilled:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];

  v5 = a5;
  v6 = a4;
  v31[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (objc_msgSend(MEMORY[0x1E0CF20F8], "isSupported"))
  {
    v8 = objc_alloc(MEMORY[0x1E0CF20E8]);
    v9 = (void *)objc_msgSend(v8, "initWithBlendShapes:", MEMORY[0x1E0C9AA70]);
    v30 = (void *)objc_msgSend(v7, "newBufferWithBytes:length:options:", objc_msgSend(v9, "vertices"), 16 * objc_msgSend(v9, "vertexCount"), 0);
    objc_msgSend(MEMORY[0x1E0CD5988], "geometrySourceWithBuffer:vertexFormat:semantic:vertexCount:dataOffset:dataStride:", v30, 30, *MEMORY[0x1E0CD5A88], objc_msgSend(v9, "vertexCount"), 0, 16);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v7, "newBufferWithBytes:length:options:", objc_msgSend(v9, "textureCoordinates"), 8 * objc_msgSend(v9, "textureCoordinateCount"), 0);
    objc_msgSend(MEMORY[0x1E0CD5988], "geometrySourceWithBuffer:vertexFormat:semantic:vertexCount:dataOffset:dataStride:", v28, 29, *MEMORY[0x1E0CD5A80], objc_msgSend(v9, "textureCoordinateCount"), 0, 8);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v9, "triangleIndices"), 6 * objc_msgSend(v9, "triangleCount"), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD5980], "geometryElementWithData:primitiveType:primitiveCount:bytesPerIndex:", v26, 0, objc_msgSend(v9, "triangleCount"), 2);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v7, "newBufferWithBytes:length:options:", objc_msgSend(v9, "normals"), 16 * objc_msgSend(v9, "normalCount"), 0);
    objc_msgSend(MEMORY[0x1E0CD5988], "geometrySourceWithBuffer:vertexFormat:semantic:vertexCount:dataOffset:dataStride:", v11, 30, *MEMORY[0x1E0CD5A70], objc_msgSend(v9, "vertexCount"), 0, 16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)v10;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", &ar_faceTriangleIndicesLeftEye, 132, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD5980], "geometryElementWithData:primitiveType:primitiveCount:bytesPerIndex:", v14, 0, 22, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", &ar_faceTriangleIndicesRightEye, 132, 0);
      v16 = v5;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD5980], "geometryElementWithData:primitiveType:primitiveCount:bytesPerIndex:", v17, 0, 22, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v15);
      objc_msgSend(v13, "addObject:", v18);

      v5 = v16;
    }
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", &ar_faceTriangleIndicesMouth, 204, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD5980], "geometryElementWithData:primitiveType:primitiveCount:bytesPerIndex:", v19, 0, 34, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v20);

    }
    v31[0] = v29;
    v31[1] = v12;
    v31[2] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v13, "copy");
    +[SCNGeometry geometryWithSources:elements:](ARSCNFaceGeometry, "geometryWithSources:elements:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "setVertexBuffer:", v30);
    objc_msgSend(v23, "setNormalBuffer:", v11);
    objc_msgSend(v23, "setTextureBuffer:", v28);

  }
  else
  {
    v23 = 0;
  }

  return (ARSCNFaceGeometry *)v23;
}

+ (ARSCNFaceGeometry)faceGeometryWithDevice:(id)device
{
  return (ARSCNFaceGeometry *)objc_msgSend(a1, "faceGeometryWithDevice:eyesFilled:mouthFilled:", device, 0, 0);
}

+ (ARSCNFaceGeometry)faceGeometryWithDevice:(id)device fillMesh:(BOOL)fillMesh
{
  return (ARSCNFaceGeometry *)objc_msgSend(a1, "faceGeometryWithDevice:eyesFilled:mouthFilled:", device, fillMesh, fillMesh);
}

- (void)updateFromFaceGeometry:(ARFaceGeometry *)faceGeometry
{
  ARFaceGeometry *v4;
  id v5;
  id v6;
  void *v7;
  const void *v8;
  uint64_t v9;

  v4 = faceGeometry;
  -[ARFaceGeometry vertexCount](v4, "vertexCount");
  kdebug_trace();
  -[ARSCNFaceGeometry vertexBuffer](self, "vertexBuffer");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  memcpy((void *)objc_msgSend(v5, "contents"), -[ARFaceGeometry vertices](v4, "vertices"), 16 * -[ARFaceGeometry vertexCount](v4, "vertexCount"));

  -[ARSCNFaceGeometry normalBuffer](self, "normalBuffer");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (void *)objc_msgSend(v6, "contents");
  v8 = (const void *)-[ARFaceGeometry normals](v4, "normals");
  v9 = -[ARFaceGeometry normalCount](v4, "normalCount");

  memcpy(v7, v8, 16 * v9);
  kdebug_trace();
}

- (MTLBuffer)vertexBuffer
{
  return self->_vertexBuffer;
}

- (MTLBuffer)normalBuffer
{
  return self->_normalBuffer;
}

- (MTLBuffer)textureBuffer
{
  return self->_textureBuffer;
}

- (void)setVertexBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_vertexBuffer, a3);
}

- (void)setNormalBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_normalBuffer, a3);
}

- (void)setTextureBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_textureBuffer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textureBuffer, 0);
  objc_storeStrong((id *)&self->_normalBuffer, 0);
  objc_storeStrong((id *)&self->_vertexBuffer, 0);
}

@end
