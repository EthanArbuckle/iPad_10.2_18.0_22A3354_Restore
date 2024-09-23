@implementation HMIFaceCrop

- (HMIFaceCrop)initWithUUID:(id)a3 dataRepresentation:(id)a4 dateCreated:(id)a5 faceBoundingBox:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  id v14;
  id v15;
  void *v16;
  HMIFaceCrop *v17;
  uint64_t v18;
  NSUUID *UUID;
  uint64_t v20;
  NSData *dataRepresentation;
  uint64_t v22;
  NSDate *dateCreated;
  void *v25;
  SEL v26;
  id v27;
  objc_super v28;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (!v13)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v14)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v16 = v15;
  if (!v15)
  {
LABEL_9:
    v25 = (void *)_HMFPreconditionFailure();
    return (HMIFaceCrop *)+[HMIFaceCrop faceCropFromPhotosFaceCropImageData:](v25, v26, v27);
  }
  v28.receiver = self;
  v28.super_class = (Class)HMIFaceCrop;
  v17 = -[HMIFaceCrop init](&v28, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v13, "copy");
    UUID = v17->_UUID;
    v17->_UUID = (NSUUID *)v18;

    v20 = objc_msgSend(v14, "copy");
    dataRepresentation = v17->_dataRepresentation;
    v17->_dataRepresentation = (NSData *)v20;

    v22 = objc_msgSend(v16, "copy");
    dateCreated = v17->_dateCreated;
    v17->_dateCreated = (NSDate *)v22;

    v17->_faceBoundingBox.origin.x = x;
    v17->_faceBoundingBox.origin.y = y;
    v17->_faceBoundingBox.size.width = width;
    v17->_faceBoundingBox.size.height = height;
  }

  return v17;
}

+ (id)faceCropFromPhotosFaceCropImageData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double x;
  double v14;
  double y;
  double v16;
  double width;
  double v18;
  double height;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  HMIFaceCrop *v24;
  void *v25;
  void *v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  HMIFaceCrop *v43;
  void *v44;
  void *v45;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;
  CGRect v53;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v47 = 0;
  +[HMIFaceDetectorVision detectFacesInImageData:error:](HMIFaceDetectorVision, "detectFacesInImageData:error:", v4, &v47);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v47;
  if (v5 && objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unalignedBoundingBox");
    HMICGRectFlipCoordinateSpaceNormalized(v8, v9, v10, v11);
    x = v12;
    y = v14;
    width = v16;
    height = v18;

LABEL_19:
    v43 = [HMIFaceCrop alloc];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[HMIFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:](v43, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:", v44, v4, v45, x, y, width, height);

    goto LABEL_20;
  }
  +[HMIFaceUtilities faceBoundingBoxFromPhotosFaceCropData:](HMIFaceUtilities, "faceBoundingBoxFromPhotosFaceCropData:", v4);
  x = v53.origin.x;
  y = v53.origin.y;
  width = v53.size.width;
  height = v53.size.height;
  if (!CGRectIsNull(v53))
  {
    if (v5 && objc_msgSend(v5, "count"))
    {
      objc_msgSend((id)objc_opt_class(), "selectBestObservation:faceBoundingBoxFromPhotos:", v5, x, y, width, height);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25)
      {
        objc_msgSend(v25, "unalignedBoundingBox");
        HMICGRectFlipCoordinateSpaceNormalized(v27, v28, v29, v30);
        x = v31;
        y = v32;
        width = v33;
        height = v34;
      }
      else
      {
        v39 = (void *)MEMORY[0x220735570]();
        v40 = a1;
        HMFGetOSLogHandle();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v49 = v42;
          _os_log_impl(&dword_219D45000, v41, OS_LOG_TYPE_ERROR, "%{public}@No detected box overlaps with photos bounding box, falling back to photos bounding box", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v39);
      }

    }
    else
    {
      v35 = (void *)MEMORY[0x220735570]();
      v36 = a1;
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v38;
        v50 = 2112;
        v51 = v6;
        _os_log_impl(&dword_219D45000, v37, OS_LOG_TYPE_ERROR, "%{public}@Error while detecting face in Photos face crop, error: %@, or no box detected, falling back to photos bounding box", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v35);
    }
    goto LABEL_19;
  }
  v20 = (void *)MEMORY[0x220735570]();
  v21 = a1;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v49 = v23;
    _os_log_impl(&dword_219D45000, v22, OS_LOG_TYPE_ERROR, "%{public}@Error, couldn't get face box from photos data, ignoring face crop", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v20);
  v24 = 0;
LABEL_20:

  return v24;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  NSRect v18;

  v17[4] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIFaceCrop UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("UUID"), v4);
  v17[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIFaceCrop dataRepresentation](self, "dataRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Data Representation"), v7);
  v17[1] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIFaceCrop dateCreated](self, "dateCreated");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Date Created"), v10);
  v17[2] = v11;
  v12 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMIFaceCrop faceBoundingBox](self, "faceBoundingBox");
  NSStringFromRect(v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Face Bounding Box"), v13);
  v17[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)selectBestObservation:(id)a3 faceBoundingBoxFromPhotos:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float v24;
  double v25;
  id v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v29;
    v13 = 0.0;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v15, "unalignedBoundingBox");
        HMICGRectFlipCoordinateSpaceNormalized(v16, v17, v18, v19);
        HMICGRectIntersectionOverUnion(v20, v21, v22, v23, x, y, width, height);
        v25 = v24;
        if (v13 < v24)
        {
          v26 = v15;

          v11 = v26;
          v13 = v25;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  BOOL v25;
  CGRect v27;
  CGRect v28;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMIFaceCrop UUID](self, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[HMIFaceCrop dataRepresentation](self, "dataRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dataRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToData:", v10))
      {
        -[HMIFaceCrop dateCreated](self, "dateCreated");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dateCreated");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToDate:", v12))
        {
          -[HMIFaceCrop faceBoundingBox](self, "faceBoundingBox");
          v14 = v13;
          v16 = v15;
          v18 = v17;
          v20 = v19;
          objc_msgSend(v6, "faceBoundingBox");
          v28.origin.x = v21;
          v28.origin.y = v22;
          v28.size.width = v23;
          v28.size.height = v24;
          v27.origin.x = v14;
          v27.origin.y = v16;
          v27.size.width = v18;
          v27.size.height = v20;
          v25 = CGRectEqualToRect(v27, v28);
        }
        else
        {
          v25 = 0;
        }

      }
      else
      {
        v25 = 0;
      }

    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMIFaceCrop UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HMIFaceCrop UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("HMIFC.ck.u"));

  -[HMIFaceCrop dataRepresentation](self, "dataRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("HMIFC.ck.dr"));

  -[HMIFaceCrop dateCreated](self, "dateCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("HMIFC.ck.dc"));

  -[HMIFaceCrop faceBoundingBox](self, "faceBoundingBox");
  objc_msgSend(v7, "encodeRect:forKey:", CFSTR("HMIFC.ck.fbb"));

}

- (HMIFaceCrop)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v11;
  NSObject *v12;
  void *v13;
  HMIFaceCrop *v14;
  HMIFaceCrop *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIFC.ck.u"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIFC.ck.dr"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMIFC.ck.dc"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeRectForKey:", CFSTR("HMIFC.ck.fbb"));
  if (v5)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9 || v7 == 0)
  {
    v11 = (void *)MEMORY[0x220735570](v8);
    v14 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544130;
      v18 = v13;
      v19 = 2112;
      v20 = v5;
      v21 = 2112;
      v22 = v6;
      v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_219D45000, v12, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded UUID: %@ dataRepresentation: %@ dateCreated: %@", (uint8_t *)&v17, 0x2Au);

    }
    objc_autoreleasePoolPop(v11);
    v15 = 0;
  }
  else
  {
    v14 = -[HMIFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:](self, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:", v5, v6, v7);
    v15 = v14;
  }

  return v15;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)dataRepresentation
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSDate)dateCreated
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (CGRect)faceBoundingBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_faceBoundingBox, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_dataRepresentation, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
