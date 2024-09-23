@implementation GEOStorefrontView

- (GEOStorefrontView)init
{
  GEOStorefrontView *result;

  result = (GEOStorefrontView *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOStorefrontView)initWithStorefrontView:(id)a3
{
  id v4;
  void *v5;
  GEOStorefrontView *v6;
  uint64_t v7;
  GEOStorefrontImagery *v8;
  void *v9;
  uint64_t v10;
  GEOStorefrontImagery *imageryInfo;
  void *v12;
  char v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __double2 v21;
  double v22;
  double v23;
  __double2 v24;
  void *v25;
  char v26;
  GEOStorefrontImagery *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double x;
  double y;
  double z;
  double v35;
  double v37;
  double v38;
  double v39;
  objc_super v40;

  v4 = a3;
  v5 = v4;
  if (!v4
    || (objc_msgSend(v4, "hasLookAt") & 1) == 0 && (objc_msgSend(v5, "hasLookAtGeo") & 1) == 0
    || !objc_msgSend(v5, "hasPhotoPosition"))
  {
    goto LABEL_18;
  }
  v40.receiver = self;
  v40.super_class = (Class)GEOStorefrontView;
  v6 = -[GEOStorefrontView init](&v40, sel_init);
  self = v6;
  if (v6)
  {
    if (objc_msgSend(v5, "hasImdataId"))
      v7 = objc_msgSend(v5, "imdataId");
    else
      v7 = 0;
    v6->_identifier = v7;
    if (objc_msgSend(v5, "hasPhotoPosition"))
    {
      v8 = [GEOStorefrontImagery alloc];
      objc_msgSend(v5, "photoPosition");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[GEOStorefrontImagery initWithPhotoPosition:](v8, "initWithPhotoPosition:", v9);
      imageryInfo = v6->_imageryInfo;
      v6->_imageryInfo = (GEOStorefrontImagery *)v10;

      if (!v6->_imageryInfo)
        goto LABEL_18;
    }
    if (objc_msgSend(v5, "hasLookAt"))
    {
      objc_msgSend(v5, "lookAt");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = GEOOrientedPositionFromPDPosition(v12, (uint64_t)&v6->_lookAt);

      if ((v13 & 1) == 0)
        goto LABEL_18;
    }
    else
    {
      if (!objc_msgSend(v5, "hasLookAtGeo"))
      {
LABEL_18:
        v6 = 0;
        goto LABEL_22;
      }
      objc_msgSend(v5, "lookAtGeo");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "latitude");
      v16 = v15;
      objc_msgSend(v14, "longitude");
      v18 = v17;
      objc_msgSend(v14, "altitude");
      v20 = v19;
      v21 = __sincos_stret(v16 * 0.00555555556 * 3.14159265);
      v22 = 6378137.0 / sqrt(v21.__sinval * -0.00669437999 * v21.__sinval + 1.0);
      v23 = v21.__cosval * (v22 + v20);
      v24 = __sincos_stret(v18 * 0.00555555556 * 3.14159265);

      self->_lookAt.position.x = v24.__cosval * v23;
      self->_lookAt.position.y = v24.__sinval * v23;
      self->_lookAt.position.z = v21.__sinval * (v20 + v22 * 0.99330562);

      objc_msgSend(v5, "lookAtGeo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "hasAltitude");

      if ((v26 & 1) == 0)
      {
        v27 = self->_imageryInfo;
        if (v27)
        {
          -[GEOStorefrontImagery position](v27, "position");
          v28 = v37;
          v29 = v38;
          v30 = v39;
        }
        else
        {
          v30 = 0.0;
          v29 = 0.0;
          v28 = 0.0;
        }
        v31 = sqrt(v29 * v29 + v28 * v28 + v30 * v30);
        x = self->_lookAt.position.x;
        y = self->_lookAt.position.y;
        z = self->_lookAt.position.z;
        v35 = v31 / sqrt(y * y + x * x + z * z);
        self->_lookAt.position.x = x * v35;
        self->_lookAt.position.y = y * v35;
        self->_lookAt.position.z = z * v35;
      }
    }
    self = self;
    v6 = self;
  }
LABEL_22:

  return v6;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (GEOStorefrontImagery)imageryInfo
{
  return self->_imageryInfo;
}

- (GEOOrientedPosition)lookAt
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].position.x;
  *(_OWORD *)&retstr->position.x = *(_OWORD *)&self->yaw;
  *(_OWORD *)&retstr->position.z = v3;
  *(double *)&retstr->roll = self[1].position.z;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageryInfo, 0);
}

@end
