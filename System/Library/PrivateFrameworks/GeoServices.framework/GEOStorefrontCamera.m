@implementation GEOStorefrontCamera

- (GEOStorefrontCamera)init
{
  GEOStorefrontCamera *result;

  result = (GEOStorefrontCamera *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOStorefrontCamera)initWithCameraMetadata:(id)a3
{
  id v4;
  uint64_t v5;
  GEOStorefrontCamera *v6;
  GEOStorefrontCamera *v7;
  int v8;
  void *v9;
  char v10;
  _DWORD *v11;
  int v12;
  double *v13;
  double *v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  id v24;
  unint64_t i;
  void *v26;
  void *v27;
  GEOStorefrontCamera *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSArray *textureIds;
  float v34;
  objc_super v35;

  v4 = a3;
  v5 = (uint64_t)v4;
  if (!v4)
    goto LABEL_15;
  -[GEOPDCameraMetadata _readPosition]((uint64_t)v4);
  if (!*(_QWORD *)(v5 + 48))
    goto LABEL_15;
  -[GEOPDCameraMetadata _readLensProjection](v5);
  if (!*(_QWORD *)(v5 + 40))
    goto LABEL_15;
  v35.receiver = self;
  v35.super_class = (Class)GEOStorefrontCamera;
  v6 = -[GEOStorefrontCamera init](&v35, sel_init);
  v7 = v6;
  if (!v6)
  {
    self = 0;
LABEL_15:
    v28 = 0;
    goto LABEL_19;
  }
  v6->_cameraNumber = *(_DWORD *)(v5 + 68);
  v8 = *(_DWORD *)(v5 + 72);
  v6->_imageSize.width = (double)*(int *)(v5 + 76);
  v6->_imageSize.height = (double)v8;
  -[GEOPDCameraMetadata position]((id *)v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = GEOOrientedPositionFromPDPosition(v9, (uint64_t)&v7->_position);

  if ((v10 & 1) != 0)
  {
    -[GEOPDCameraMetadata lensProjection]((id *)v5);
    v11 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    if (v11)
      v12 = v11[20];
    else
      LOBYTE(v12) = 0;
    v7->_lensType = v12;

    -[GEOPDCameraMetadata lensProjection]((id *)v5);
    v13 = (double *)(id)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13[1];
      v34 = v15;
      v16 = v13[2];
      v17 = v13[3];
      v18 = v13[4];
      v19 = v13[5];
      v20 = v13[6];
      v21 = v13[7];
      v22 = v13[8];
      v23 = v13[9];
    }
    else
    {
      v22 = 0.0;
      v20 = 0.0;
      v18 = 0.0;
      v16 = 0.0;
      v34 = 0.0;
      v17 = 0.0;
      v19 = 0.0;
      v21 = 0.0;
      v23 = 0.0;
    }

    v7->_projection.fovS = v18;
    v7->_projection.fovH = v17;
    v7->_projection.k2 = v19;
    v7->_projection.k3 = v20;
    v7->_projection.k4 = v21;
    v7->_projection.cx = v34;
    v7->_projection.cy = v16;
    v7->_projection.lx = v22;
    v7->_projection.ly = v23;

    v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[GEOPDCameraMetadata _readTextureIds](v5);
    if (*(_QWORD *)(v5 + 24))
    {
      for (i = 0; ; ++i)
      {
        -[GEOPDCameraMetadata _readTextureIds](v5);
        if (i >= *(_QWORD *)(v5 + 24))
          break;
        v26 = (void *)MEMORY[0x1E0CB37E8];
        -[GEOPDCameraMetadata _readTextureIds](v5);
        objc_msgSend(v26, "numberWithUnsignedInteger:", *(unsigned int *)(*(_QWORD *)(v5 + 16) + 4 * i));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v27);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7->_cameraNumber);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObject:", v29);

      if (v7->_cameraNumber == 4)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 5);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v30);

      }
    }
    v31 = objc_msgSend(v24, "copy");
    textureIds = v7->_textureIds;
    v7->_textureIds = (NSArray *)v31;

    self = v7;
    v28 = self;
  }
  else
  {
    v28 = 0;
    self = v7;
  }
LABEL_19:

  return v28;
}

- (int)cameraNumber
{
  return self->_cameraNumber;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (GEOOrientedPosition)position
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].position.y;
  *(_OWORD *)&retstr->position.x = *(_OWORD *)&self->roll;
  *(_OWORD *)&retstr->position.z = v3;
  *(_QWORD *)&retstr->roll = *(_QWORD *)&self[1].yaw;
  return self;
}

- (unsigned)lensType
{
  return self->_lensType;
}

- (GEOLensModel)projection
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].cx;
  *(_OWORD *)&retstr->fovS = *(_OWORD *)&self[2].fovH;
  *(_OWORD *)&retstr->k4 = v3;
  retstr->ly = self[3].fovS;
  return self;
}

- (NSArray)textureIds
{
  return self->_textureIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textureIds, 0);
}

@end
