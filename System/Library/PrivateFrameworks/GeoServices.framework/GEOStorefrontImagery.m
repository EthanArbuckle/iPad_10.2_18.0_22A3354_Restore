@implementation GEOStorefrontImagery

- (GEOStorefrontImagery)init
{
  GEOStorefrontImagery *result;

  result = (GEOStorefrontImagery *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOStorefrontImagery)initWithPhotoPosition:(id)a3
{
  id v4;
  void *v5;
  _WORD *v6;
  __int16 v7;
  char *v8;
  _DWORD *v9;
  int v10;
  _DWORD *v11;
  int v12;
  _DWORD *v13;
  int v14;
  void *v15;
  char v16;
  GEOStorefrontImagery *v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  double v24;
  float *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  GEOStorefrontCamera *v31;
  uint64_t v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  float64x2_t v41;
  double v42;
  objc_super v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "hasImdataId") & 1) != 0
    && ((objc_msgSend(v5, "hasPosition") & 1) != 0
     || objc_msgSend(v5, "hasTilePosition") && objc_msgSend(v5, "hasParentTile")))
  {
    if (objc_msgSend(v5, "hasBuild"))
    {
      if (objc_msgSend(v5, "hasImageryTimestamp"))
      {
        objc_msgSend(v5, "build");
        v6 = (_WORD *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          v7 = v6[54];

          if ((v7 & 4) != 0)
          {
            v43.receiver = self;
            v43.super_class = (Class)GEOStorefrontImagery;
            v8 = -[GEOStorefrontImagery init](&v43, sel_init);
            if (v8)
            {
              *((_QWORD *)v8 + 1) = objc_msgSend(v5, "imdataId");
              objc_msgSend(v5, "build");
              v9 = (_DWORD *)objc_claimAutoreleasedReturnValue();
              if (v9)
                v10 = v9[20];
              else
                v10 = 0;
              *((_DWORD *)v8 + 4) = v10;

              objc_msgSend(v5, "build");
              v11 = (_DWORD *)objc_claimAutoreleasedReturnValue();
              if (v11)
                v12 = v11[21];
              else
                v12 = 0;
              *((_DWORD *)v8 + 22) = v12;

              objc_msgSend(v5, "build");
              v13 = (_DWORD *)objc_claimAutoreleasedReturnValue();
              if (v13)
                v14 = v13[19];
              else
                LOWORD(v14) = 0;
              *((_WORD *)v8 + 10) = v14;

              if (objc_msgSend(v5, "hasPosition"))
              {
                objc_msgSend(v5, "position");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = GEOOrientedPositionFromPDPosition(v15, (uint64_t)(v8 + 40));

                if ((v16 & 1) == 0)
                {
LABEL_38:
                  v17 = 0;
LABEL_41:
                  self = (GEOStorefrontImagery *)v8;
                  goto LABEL_42;
                }
              }
              else
              {
                if (!objc_msgSend(v5, "hasTilePosition"))
                  goto LABEL_38;
                objc_msgSend(v5, "tilePosition");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "parentTile");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = GEOOrientedPositionFromPDTilePosition(v18, v19, (uint64_t)(v8 + 40));

                if ((v20 & 1) == 0)
                  goto LABEL_38;
              }
              v21 = *((_QWORD *)v8 + 7);
              v39 = *(_OWORD *)(v8 + 40);
              v40 = v21;
              objc_msgSend(v5, "build", geo::Geocentric<double>::toCoordinate3D<geo::Degrees,double>((double *)&v39, &v41));
              v22 = objc_claimAutoreleasedReturnValue();
              v23 = (void *)v22;
              v24 = 3.0;
              if (v22 && (*(_WORD *)(v22 + 108) & 0x10) != 0)
              {
                objc_msgSend(v5, "build");
                v25 = (float *)objc_claimAutoreleasedReturnValue();
                if (v25)
                  v24 = v25[23];
                else
                  v24 = 0.0;

              }
              *((double *)v8 + 4) = v42 - v24;
              *((_QWORD *)v8 + 3) = objc_msgSend(v5, "imageryTimestamp");
              objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "cameraMetadatasCount"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = 0u;
              v38 = 0u;
              v35 = 0u;
              v36 = 0u;
              objc_msgSend(v5, "cameraMetadatas", 0);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
              if (v28)
              {
                v29 = *(_QWORD *)v36;
                while (2)
                {
                  for (i = 0; i != v28; ++i)
                  {
                    if (*(_QWORD *)v36 != v29)
                      objc_enumerationMutation(v27);
                    v31 = -[GEOStorefrontCamera initWithCameraMetadata:]([GEOStorefrontCamera alloc], "initWithCameraMetadata:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
                    if (!v31)
                    {

                      v17 = 0;
                      goto LABEL_40;
                    }
                    objc_msgSend(v26, "addObject:", v31);

                  }
                  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
                  if (v28)
                    continue;
                  break;
                }
              }

              v32 = objc_msgSend(v26, "copy");
              v33 = (void *)*((_QWORD *)v8 + 10);
              *((_QWORD *)v8 + 10) = v32;

              v17 = v8;
LABEL_40:

              goto LABEL_41;
            }
            self = 0;
          }
        }
      }
    }
  }
  v17 = 0;
LABEL_42:

  return v17;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (unsigned)buildId
{
  return self->_buildId;
}

- (unsigned)bucketId
{
  return self->_bucketId;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (double)groundAltitude
{
  return self->_groundAltitude;
}

- (GEOOrientedPosition)position
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].position.z;
  *(_OWORD *)&retstr->position.x = *(_OWORD *)&self[1].position.x;
  *(_OWORD *)&retstr->position.z = v3;
  *(_QWORD *)&retstr->roll = *(_QWORD *)&self[1].roll;
  return self;
}

- (NSArray)cameras
{
  return self->_cameras;
}

- (unsigned)dataFormatVersion
{
  return self->_dataFormatVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameras, 0);
}

@end
