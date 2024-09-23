@implementation PHAssetCameraCaptureDeviceProperties

- (PHAssetCameraCaptureDeviceProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  PHAssetCameraCaptureDeviceProperties *v8;
  const __CFString *v9;
  void *v10;
  __int16 v11;
  BOOL v12;
  objc_super v14;

  v5 = a5;
  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PHAssetCameraCaptureDeviceProperties;
  v8 = -[PHAssetCameraCaptureDeviceProperties init](&v14, sel_init);
  if (v8)
  {
    if (v5)
      v9 = CFSTR("additionalAttributes.cameraCaptureDevice");
    else
      v9 = CFSTR("cameraCaptureDevice");
    objc_msgSend(v7, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    if (v11)
    {
      v12 = v11;
      if (v11 != 1)
        goto LABEL_10;
    }
    else
    {
      v12 = 0;
    }
    v8->_isSelfie = v12;
  }
LABEL_10:

  return v8;
}

- (BOOL)isSelfie
{
  return self->_isSelfie;
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetCameraCaptureDevice");
}

+ (id)keyPathFromPrimaryObject
{
  return CFSTR("additionalAttributes");
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_47;
}

void __57__PHAssetCameraCaptureDeviceProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("cameraCaptureDevice");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_47;
  propertiesToFetch_pl_once_object_47 = v1;

}

@end
