@implementation JFXARMetadata

- (BOOL)hasTrackedFace
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[JFXARMetadata faceAnchor](self, "faceAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[JFXARMetadata arFrame](self, "arFrame", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "anchors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v7 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v6);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v9, "isTracked") & 1) != 0)
          {
            LOBYTE(v4) = 1;
            goto LABEL_14;
          }
        }
        v4 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_14:

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (JFXARMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  JFXARMetadata *v16;
  uint64_t v17;
  ARFrame *arFrame;
  uint64_t v19;
  JFXFaceAnchor *faceAnchor;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  double v32[3];
  _QWORD v33[5];

  v33[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v31 = 0u;
  *(_OWORD *)v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kJFXAnchorTransformKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getBytes:length:", &v29, 64);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kJFXCameraTransformKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "getBytes:length:", &v25, 64);
  v23 = 0u;
  v24 = 0u;
  v22 = 0u;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kJFXCameraIntrinsicsKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "getBytes:length:", &v22, 48);
  objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("kJFXImageResolutionKey"));
  v9 = v8;
  v11 = v10;
  v12 = (void *)MEMORY[0x24BDBCF20];
  v33[0] = objc_opt_class();
  v33[1] = objc_opt_class();
  v33[2] = objc_opt_class();
  v33[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("kJFXAnimojiPhysicsBlendShapesKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[JFXARMetadata initWithAnchorTransform:cameraTransform:cameraIntrinsics:cameraImageResolution:](self, "initWithAnchorTransform:cameraTransform:cameraIntrinsics:cameraImageResolution:", *(double *)&v29, *(double *)&v30, *(double *)&v31, v32[0], *(double *)&v25, *(double *)&v26, *(double *)&v27, *(double *)&v28, v22, v23, v24, v9, v11);
  if (v16)
  {
    v16->_pvTransformOrientation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kJFXTransformOrientationKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kJFXARFrameKey"));
    v17 = objc_claimAutoreleasedReturnValue();
    arFrame = v16->_arFrame;
    v16->_arFrame = (ARFrame *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kJFXFaceAnchorKey"));
    v19 = objc_claimAutoreleasedReturnValue();
    faceAnchor = v16->_faceAnchor;
    v16->_faceAnchor = (JFXFaceAnchor *)v19;

    objc_storeStrong((id *)&v16->_animojiPhysicsBlendShapes, v15);
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[JFXARMetadata arFrame](self, "arFrame");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kJFXARFrameKey"));

  -[JFXARMetadata faceAnchor](self, "faceAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kJFXFaceAnchorKey"));

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", self->_anon_70, 64);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kJFXAnchorTransformKey"));

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &self[1], 64);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("kJFXCameraTransformKey"));

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", self->_anon_40, 48);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("kJFXCameraIntrinsicsKey"));

  objc_msgSend(v4, "encodeCGSize:forKey:", CFSTR("kJFXImageResolutionKey"), self->_imageResolution.width, self->_imageResolution.height);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_pvTransformOrientation, CFSTR("kJFXTransformOrientationKey"));
  -[JFXARMetadata animojiPhysicsBlendShapes](self, "animojiPhysicsBlendShapes");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("kJFXAnimojiPhysicsBlendShapesKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  JFXARMetadata *v3;
  JFXARMetadata *v4;
  uint64_t v5;
  ARFrame *arFrame;
  uint64_t v7;
  JFXFaceAnchor *faceAnchor;
  objc_super v10;

  v3 = self;
  v10.receiver = v3;
  v10.super_class = (Class)JFXARMetadata;
  v4 = -[JFXARMetadata init](&v10, sel_init);
  -[JFXARMetadata arFrame](v3, "arFrame");
  v5 = objc_claimAutoreleasedReturnValue();
  arFrame = v4->_arFrame;
  v4->_arFrame = (ARFrame *)v5;

  -[JFXARMetadata faceAnchor](v3, "faceAnchor");
  v7 = objc_claimAutoreleasedReturnValue();
  faceAnchor = v4->_faceAnchor;
  v4->_faceAnchor = (JFXFaceAnchor *)v7;

  return v4;
}

- (double)initWithAnchorTransform:(__n128)a3 cameraTransform:(__n128)a4 cameraIntrinsics:(__n128)a5 cameraImageResolution:(__n128)a6
{
  JFXARMetadata *v21;
  double result;
  objc_super v31;

  v31.receiver = a1;
  v31.super_class = (Class)JFXARMetadata;
  v21 = -[JFXARMetadata init](&v31, sel_init);
  if (v21)
  {
    result = a21;
    *(__n128 *)&v21->_anon_70[16] = a3;
    *(__n128 *)&v21->_anon_70[32] = a4;
    *(__n128 *)&v21->_anon_70[48] = a5;
    *(__n128 *)&v21[1].super.isa = a6;
    *(__n128 *)&v21[1]._faceAnchor = a7;
    *(__n128 *)&v21[1]._pvTransformOrientation = a8;
    *(__n128 *)&v21[1]._imageResolution.height = a9;
    *(_OWORD *)v21->_anon_40 = a17;
    *(_OWORD *)&v21->_anon_40[16] = a18;
    *(_OWORD *)&v21->_anon_40[32] = a19;
    *(__n128 *)v21->_anon_70 = a2;
    v21->_imageResolution.width = a20;
    v21->_imageResolution.height = a21;
    v21->_pvTransformOrientation = 3;
  }
  return result;
}

- (JFXARMetadata)initWithARFrame:(id)a3 faceAnchor:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  JFXARMetadata *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "anchors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transform");
  v38 = v12;
  v39 = v11;
  v36 = v14;
  v37 = v13;
  objc_msgSend(v7, "camera");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "transform");
  v34 = v17;
  v35 = v16;
  v32 = v19;
  v33 = v18;
  objc_msgSend(v7, "camera");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "intrinsics");
  v30 = v22;
  v31 = v21;
  v29 = v23;
  objc_msgSend(v7, "camera");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "imageResolution");
  v27 = -[JFXARMetadata initWithAnchorTransform:cameraTransform:cameraIntrinsics:cameraImageResolution:](self, "initWithAnchorTransform:cameraTransform:cameraIntrinsics:cameraImageResolution:", v39, v38, v37, v36, v35, v34, v33, v32, v31, v30, v29, v25, v26);

  if (v27)
  {
    objc_storeStrong((id *)&v27->_arFrame, a3);
    objc_storeStrong((id *)&v27->_faceAnchor, a4);
    v27->_pvTransformOrientation = 3;
  }

  return v27;
}

- (uint64_t)initWithFaceAnchor:(__n128)a3 cameraIntrinsics:(__n128)a4
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;

  v8 = a6;
  objc_msgSend(v8, "transform");
  v28 = v10;
  v29 = v9;
  v27 = v11;
  v26 = v12;
  objc_msgSend(v8, "cameraTransform");
  v24 = v14;
  v25 = v13;
  v22 = v16;
  v23 = v15;
  objc_msgSend(v8, "imageResolution");
  v19 = objc_msgSend(a1, "initWithAnchorTransform:cameraTransform:cameraIntrinsics:cameraImageResolution:", v29, v28, v27, v26, v25, v24, v23, v22, *(_OWORD *)&a2, *(_OWORD *)&a3, *(_OWORD *)&a4, v17, v18);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)(v19 + 16), a6);
    *(_QWORD *)(v20 + 32) = objc_msgSend(v8, "preferredAnchorOrientation");
  }

  return v20;
}

- (uint64_t)cameraProjectionForOutputSize:(void *)a1 interfaceOrientation:zNear:zFar:
{
  objc_msgSend(a1, "pvTransformOrientation");
  objc_msgSend(a1, "cameraIntrinsics");
  objc_msgSend(a1, "imageResolution");
  return pv_simd_matrix_make_perspective();
}

- (uint64_t)cameraTransformForInterfaceOrientation:(void *)a1
{
  objc_msgSend(a1, "pvTransformOrientation");
  objc_msgSend(a1, "cameraTransform");
  return pv_adjust_transform_orientation();
}

- (ARFrame)arFrame
{
  return self->_arFrame;
}

- (JFXFaceAnchor)faceAnchor
{
  return self->_faceAnchor;
}

- (__n128)anchorTransform
{
  return a1[7];
}

- (NSDictionary)animojiPhysicsBlendShapes
{
  return self->_animojiPhysicsBlendShapes;
}

- (void)setAnimojiPhysicsBlendShapes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CGSize)imageResolution
{
  double width;
  double height;
  CGSize result;

  width = self->_imageResolution.width;
  height = self->_imageResolution.height;
  result.height = height;
  result.width = width;
  return result;
}

- (__n128)cameraTransform
{
  return a1[11];
}

- (__n128)cameraIntrinsics
{
  return a1[4];
}

- (int64_t)pvTransformOrientation
{
  return self->_pvTransformOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animojiPhysicsBlendShapes, 0);
  objc_storeStrong((id *)&self->_faceAnchor, 0);
  objc_storeStrong((id *)&self->_arFrame, 0);
}

@end
