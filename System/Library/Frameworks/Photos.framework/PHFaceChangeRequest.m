@implementation PHFaceChangeRequest

- (id)initForNewObject
{
  PHFaceChangeRequest *v2;
  PHChangeRequestHelper *v3;
  PHChangeRequestHelper *helper;
  NSMutableArray *v5;
  NSMutableArray *detectionTraits;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHFaceChangeRequest;
  v2 = -[PHChangeRequest init](&v8, sel_init);
  if (v2)
  {
    v3 = -[PHChangeRequestHelper initForNewObjectWithChangeRequest:]([PHChangeRequestHelper alloc], "initForNewObjectWithChangeRequest:", v2);
    helper = v2->super._helper;
    v2->super._helper = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    detectionTraits = v2->_detectionTraits;
    v2->_detectionTraits = v5;

  }
  return v2;
}

- (PHFaceChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6;
  id v7;
  PHFaceChangeRequest *v8;
  PHChangeRequestHelper *v9;
  PHChangeRequestHelper *helper;
  NSMutableArray *v11;
  NSMutableArray *detectionTraits;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHFaceChangeRequest;
  v8 = -[PHChangeRequest init](&v14, sel_init);
  if (v8)
  {
    v9 = -[PHChangeRequestHelper initWithUUID:objectID:changeRequest:]([PHChangeRequestHelper alloc], "initWithUUID:objectID:changeRequest:", v6, v7, v8);
    helper = v8->super._helper;
    v8->super._helper = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    detectionTraits = v8->_detectionTraits;
    v8->_detectionTraits = v11;

  }
  return v8;
}

- (PHFaceChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  id v9;
  id v10;
  PHFaceChangeRequest *v11;
  PHChangeRequestHelper *v12;
  PHChangeRequestHelper *helper;
  void *v14;
  NSMutableArray *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  PHDetectionTrait *v21;
  NSMutableArray *detectionTraits;
  NSMutableArray *v23;
  void *v24;
  PHFaceprint *v25;
  PHFaceprint *faceprint;
  _BOOL4 v27;
  uint64_t v28;
  NSString *associatedPersonUUID;
  uint64_t v30;
  NSURL *associatedPersonLibraryURL;
  uint64_t v32;
  NSString *gazeRectString;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v40.receiver = self;
  v40.super_class = (Class)PHFaceChangeRequest;
  v11 = -[PHChangeRequest init](&v40, sel_init);
  if (v11)
  {
    v12 = -[PHChangeRequestHelper initWithXPCDict:changeRequest:request:clientAuthorization:]([PHChangeRequestHelper alloc], "initWithXPCDict:changeRequest:request:clientAuthorization:", v8, v11, v9, v10);
    helper = v11->super._helper;
    v11->super._helper = v12;

    if (v12)
    {
      v11->_didSetDetectionTraits = xpc_dictionary_get_BOOL(v8, "didSetDetectionTraits");
      v11->_didSetFaceprint = xpc_dictionary_get_BOOL(v8, "didSetFaceprint");
      v11->_didSetAssociatedPersonUUID = xpc_dictionary_get_BOOL(v8, "didSetAssociatedPersonUUID");
      v11->_didSetGazeRect = xpc_dictionary_get_BOOL(v8, "didSetGazeRect");
      v11->_didSetNameSource = xpc_dictionary_get_BOOL(v8, "didSetNameSource");
      if (v11->_didSetDetectionTraits)
      {
        v35 = v10;
        PLArrayFromXPCDictionary();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count"));
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v16 = v14;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v37;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v37 != v19)
                objc_enumerationMutation(v16);
              v21 = -[PHDetectionTrait initWithPropertyListRepresentation:]([PHDetectionTrait alloc], "initWithPropertyListRepresentation:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
              -[NSMutableArray addObject:](v15, "addObject:", v21);

            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
          }
          while (v18);
        }

        detectionTraits = v11->_detectionTraits;
        v11->_detectionTraits = v15;
        v23 = v15;

        -[PHChangeRequestHelper setMutated:](v11->super._helper, "setMutated:", 1);
        objc_msgSend(v9, "recordUpdateRequest:", v11);

        v10 = v35;
      }
      if (v11->_didSetFaceprint)
      {
        PLDictionaryFromXPCDictionary();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v25 = -[PHFaceprint initWithDictionaryRepresentation:]([PHFaceprint alloc], "initWithDictionaryRepresentation:", v24);
          faceprint = v11->_faceprint;
          v11->_faceprint = v25;

        }
        -[PHChangeRequestHelper setMutated:](v11->super._helper, "setMutated:", 1);
        objc_msgSend(v9, "recordUpdateRequest:", v11);

      }
      v27 = xpc_dictionary_get_BOOL(v8, "shouldClearFaceCropGenerationState");
      v11->_shouldClearFaceCropGenerationState = v27;
      if (v27)
      {
        -[PHChangeRequestHelper setMutated:](v11->super._helper, "setMutated:", 1);
        objc_msgSend(v9, "recordUpdateRequest:", v11);
      }
      if (v11->_didSetAssociatedPersonUUID)
      {
        -[PHChangeRequestHelper setMutated:](v11->super._helper, "setMutated:", 1);
        objc_msgSend(v9, "recordUpdateRequest:", v11);
        PLStringFromXPCDictionary();
        v28 = objc_claimAutoreleasedReturnValue();
        associatedPersonUUID = v11->_associatedPersonUUID;
        v11->_associatedPersonUUID = (NSString *)v28;

        PLURLFromXPCDictionary();
        v30 = objc_claimAutoreleasedReturnValue();
        associatedPersonLibraryURL = v11->_associatedPersonLibraryURL;
        v11->_associatedPersonLibraryURL = (NSURL *)v30;

      }
      if (v11->_didSetGazeRect)
      {
        -[PHChangeRequestHelper setMutated:](v11->super._helper, "setMutated:", 1);
        objc_msgSend(v9, "recordUpdateRequest:", v11);
        PLStringFromXPCDictionary();
        v32 = objc_claimAutoreleasedReturnValue();
        gazeRectString = v11->_gazeRectString;
        v11->_gazeRectString = (NSString *)v32;

      }
      if (v11->_didSetNameSource)
      {
        -[PHChangeRequestHelper setMutated:](v11->super._helper, "setMutated:", 1);
        objc_msgSend(v9, "recordUpdateRequest:", v11);
        v11->_nameSource = xpc_dictionary_get_int64(v8, "nameSource");
      }
    }
  }

  return v11;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  PHFaceprint *faceprint;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeToXPCDict:", v4);

  xpc_dictionary_set_BOOL(v4, "didSetDetectionTraits", self->_didSetDetectionTraits);
  if (self->_didSetDetectionTraits)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_detectionTraits, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = self->_detectionTraits;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "propertyListRepresentation", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    PLXPCDictionarySetArray();
  }
  xpc_dictionary_set_BOOL(v4, "didSetFaceprint", self->_didSetFaceprint);
  if (self->_didSetFaceprint)
  {
    faceprint = self->_faceprint;
    if (faceprint)
    {
      -[PHFaceprint dictionaryRepresentation](faceprint, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PLXPCDictionarySetDictionary();

    }
  }
  xpc_dictionary_set_BOOL(v4, "shouldClearFaceCropGenerationState", self->_shouldClearFaceCropGenerationState);
  xpc_dictionary_set_BOOL(v4, "didSetAssociatedPersonUUID", self->_didSetAssociatedPersonUUID);
  if (self->_didSetAssociatedPersonUUID)
  {
    PLXPCDictionarySetString();
    PLXPCDictionarySetURL();
  }
  xpc_dictionary_set_BOOL(v4, "didSetGazeRect", self->_didSetGazeRect);
  if (self->_didSetGazeRect)
    PLXPCDictionarySetString();
  xpc_dictionary_set_BOOL(v4, "didSetNameSource", self->_didSetNameSource);
  if (self->_didSetNameSource)
    xpc_dictionary_set_int64(v4, "nameSource", self->_nameSource);

}

- (PHObjectPlaceholder)placeholderForCreatedFace
{
  void *v3;
  void *v4;

  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placeholderForCreatedObjectWithClass:changeRequest:", objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHObjectPlaceholder *)v4;
}

- (double)size
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("size"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (void)setSize:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("size"));

}

- (double)centerX
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("centerX"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (void)setCenterX:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("centerX"));

}

- (double)centerY
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("centerY"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (void)setCenterY:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("centerY"));

}

- (double)bodyCenterX
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("bodyCenterX"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (void)setBodyCenterX:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("bodyCenterX"));

}

- (double)bodyCenterY
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("bodyCenterY"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (void)setBodyCenterY:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("bodyCenterY"));

}

- (double)bodyWidth
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("bodyWidth"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (void)setBodyWidth:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("bodyWidth"));

}

- (double)bodyHeight
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("bodyHeight"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (void)setBodyHeight:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("bodyHeight"));

}

- (signed)detectionType
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("detectionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (__int16)v3;
}

- (void)setDetectionType:(signed __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("detectionType"));

}

- (int64_t)sourceWidth
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("sourceWidth"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (int)objc_msgSend(v5, "intValue");
  return v6;
}

- (void)setSourceWidth:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("sourceWidth"));

}

- (int64_t)sourceHeight
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("sourceHeight"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (int)objc_msgSend(v5, "intValue");
  return v6;
}

- (void)setSourceHeight:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("sourceHeight"));

}

- (double)roll
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("roll"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (void)setRoll:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("roll"));

}

- (BOOL)isInVIPModel
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("vipModelType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "BOOLValue");
  return (char)v3;
}

- (void)setIsInVIPModel:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("vipModelType"));

}

- (BOOL)isHidden
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("hidden"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "BOOLValue");
  return (char)v3;
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("hidden"));

}

- (BOOL)isInTrash
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("isInTrash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "BOOLValue");
  return (char)v3;
}

- (void)setInTrash:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("isInTrash"));

}

- (BOOL)manual
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("manual"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "BOOLValue");
  return (char)v3;
}

- (void)setManual:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("manual"));

}

- (BOOL)hasSmile
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("hasSmile"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "BOOLValue");
  return (char)v3;
}

- (void)setHasSmile:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("hasSmile"));

}

- (double)blurScore
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("blurScore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (void)setBlurScore:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("blurScore"));

}

- (BOOL)isLeftEyeClosed
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("isLeftEyeClosed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "BOOLValue");
  return (char)v3;
}

- (void)setLeftEyeClosed:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("isLeftEyeClosed"));

}

- (BOOL)isRightEyeClosed
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("isRightEyeClosed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "BOOLValue");
  return (char)v3;
}

- (void)setRightEyeClosed:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("isRightEyeClosed"));

}

- (double)poseYaw
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("poseYaw"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (void)setPoseYaw:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("poseYaw"));

}

- (int64_t)faceAlgorithmVersion
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("faceAlgorithmVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (int)objc_msgSend(v5, "intValue");
  return v6;
}

- (void)setFaceAlgorithmVersion:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("faceAlgorithmVersion"));

}

- (int64_t)clusterSequenceNumber
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("clusterSequenceNumber"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (int)objc_msgSend(v5, "intValue");
  return v6;
}

- (void)setClusterSequenceNumber:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("clusterSequenceNumber"));

}

- (int64_t)qualityMeasure
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("qualityMeasure"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (int)objc_msgSend(v5, "intValue");
  return v6;
}

- (void)setQualityMeasure:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("qualityMeasure"));

}

- (double)quality
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("quality"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (void)setQuality:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("quality"));

}

- (int64_t)vuObservationID
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("vuObservationID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "integerValue");
  return v6;
}

- (void)setVuObservationID:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("vuObservationID"));

}

- (unsigned)ageType
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("ageType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (unsigned __int16)v3;
}

- (void)setAgeType:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("ageType"));

}

- (unsigned)sexType
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("genderType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (unsigned __int16)v3;
}

- (void)setSexType:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("genderType"));

}

- (unsigned)eyesState
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("eyesState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (unsigned __int16)v3;
}

- (void)setEyesState:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("eyesState"));

}

- (unsigned)smileType
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("smileType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (unsigned __int16)v3;
}

- (void)setSmileType:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("smileType"));

}

- (unsigned)facialHairType
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("facialHairType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (unsigned __int16)v3;
}

- (void)setFacialHairType:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("facialHairType"));

}

- (unsigned)hairColorType
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("hairColorType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (unsigned __int16)v3;
}

- (void)setHairColorType:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("hairColorType"));

}

- (unsigned)glassesType
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("glassesType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (unsigned __int16)v3;
}

- (void)setGlassesType:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("glassesType"));

}

- (unsigned)eyeMakeupType
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("eyeMakeupType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (unsigned __int16)v3;
}

- (void)setEyeMakeupType:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("eyeMakeupType"));

}

- (unsigned)lipMakeupType
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("lipMakeupType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (unsigned __int16)v3;
}

- (void)setLipMakeupType:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("lipMakeupType"));

}

- (unsigned)faceExpressionType
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("faceExpressionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (unsigned __int16)v3;
}

- (void)setFaceExpressionType:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("faceExpressionType"));

}

- (unsigned)headgearType
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("headgearType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (unsigned __int16)v3;
}

- (void)setHeadgearType:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("headgearType"));

}

- (unsigned)hairType
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("hairType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (unsigned __int16)v3;
}

- (void)setHairType:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("hairType"));

}

- (unsigned)poseType
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("poseType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (unsigned __int16)v3;
}

- (void)setPoseType:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("poseType"));

}

- (unsigned)skintoneType
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("skintoneType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (unsigned __int16)v3;
}

- (void)setSkintoneType:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("skintoneType"));

}

- (unsigned)ethnicityType
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("ethnicityType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (unsigned __int16)v3;
}

- (void)setEthnicityType:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("ethnicityType"));

}

- (BOOL)hasFaceMask
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("hasFaceMask"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "BOOLValue");
  return (char)v3;
}

- (void)setHasFaceMask:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("hasFaceMask"));

}

- (unsigned)gazeType
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("gazeType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (unsigned __int16)v3;
}

- (void)setGazeType:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("gazeType"));

}

- (double)gazeCenterX
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("gazeCenterX"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (void)setGazeCenterX:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("gazeCenterX"));

}

- (double)gazeCenterY
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("gazeCenterY"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (void)setGazeCenterY:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("gazeCenterY"));

}

- (float)gazeAngle
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  float v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("gazeAngle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "floatValue");
  v7 = v6;

  return v7;
}

- (void)setGazeAngle:(float)a3
{
  void *v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  *(float *)&v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mutations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("gazeAngle"));

}

- (float)gazeConfidence
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  float v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("gazeConfidence"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "floatValue");
  v7 = v6;

  return v7;
}

- (void)setGazeConfidence:(float)a3
{
  void *v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  *(float *)&v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mutations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("gazeConfidence"));

}

- (double)startTime
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("startTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (void)setStartTime:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("startTime"));

}

- (double)duration
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("duration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (void)setDuration:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("duration"));

}

- (NSString)groupingIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("groupingIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setGroupingIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didMutate");

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v10)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("groupingIdentifier"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("groupingIdentifier"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("groupingIdentifier"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("groupingIdentifier"));
  }

}

- (id)adjustmentVersion
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("adjustmentVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setAdjustmentVersion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didMutate");

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v10)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("adjustmentVersion"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("adjustmentVersion"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("adjustmentVersion"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("adjustmentVersion"));
  }

}

- (NSString)managedEntityName
{
  return (NSString *)CFSTR("DetectedFace");
}

- (BOOL)validateMutationsToManagedObject:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PHChangeRequest helper](self, "helper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v8 = objc_msgSend(v7, "validateMutationsToManagedObject:error:", v6, &v19);

  v9 = v19;
  if (v8)
  {
    -[PHChangeRequest helper](self, "helper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mutations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("detectionType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqual:", &unk_1E3655A98);

    if (!v13)
    {
      v17 = 1;
      goto LABEL_8;
    }
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2938];
    v21[0] = CFSTR("PHDetectionTypePet is not a valid value to assign to DetectedFace.detectionType");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3111, v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v16;
  }
  if (a4)
  {
    v9 = objc_retainAutorelease(v9);
    v17 = 0;
    *a4 = v9;
  }
  else
  {
    v17 = 0;
  }
LABEL_8:

  return v17;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  int v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  id v39;
  BOOL v40;
  void *v41;
  id v43;
  PHFaceChangeRequest *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "nameSource");
  -[PHChangeRequest helper](self, "helper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0;
  v11 = objc_msgSend(v10, "applyMutationsToManagedObject:error:", v7, &v57);
  v12 = v57;

  if (!v11)
  {
    v40 = 0;
    goto LABEL_38;
  }
  if (self->_didSetNameSource)
    objc_msgSend(v7, "setEffectiveNameSource:", self->_nameSource);
  if (objc_msgSend(v7, "effectiveNameSource") == 1 && v9 != 1)
    objc_msgSend(v7, "setConfirmedFaceCropGenerationState:", 1);
  if (self->_didSetDetectionTraits)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v46 = v7;
    objc_msgSend(v7, "detectionTraits");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v54 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(v13, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i));
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      }
      while (v16);
    }
    v43 = v12;
    v45 = v8;

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v44 = self;
    v19 = self->_detectionTraits;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v50 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
          v25 = (void *)MEMORY[0x1E0D716E0];
          v26 = objc_msgSend(v24, "type", v43);
          v27 = objc_msgSend(v24, "value");
          objc_msgSend(v24, "score");
          v29 = v28;
          objc_msgSend(v24, "startTime");
          v31 = v30;
          objc_msgSend(v24, "duration");
          objc_msgSend(v25, "insertIntoManagedObjectContext:type:value:score:startTime:duration:", v13, v26, v27, v29, v31, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "addObject:", v33);

        }
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      }
      while (v21);
    }

    v7 = v46;
    objc_msgSend(v46, "setDetectionTraits:", v47);

    self = v44;
    v8 = v45;
    v12 = v43;
  }
  if (self->_didSetFaceprint)
  {
    objc_msgSend(v7, "removeFaceprint");
    if (self->_faceprint)
    {
      v34 = (void *)MEMORY[0x1E0D716D8];
      objc_msgSend(v7, "managedObjectContext");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "insertInManagedObjectContext:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "setFace:", v7);
      -[PHFaceprint faceprintData](self->_faceprint, "faceprintData");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setData:", v37);

      objc_msgSend(v36, "setFaceprintVersion:", -[PHFaceprint faceprintVersion](self->_faceprint, "faceprintVersion"));
      objc_msgSend(v7, "setFaceprint:", v36);

    }
  }
  if (!self->_didSetAssociatedPersonUUID)
  {
    if (self->_didSetGazeRect)
      objc_msgSend(v7, "setGazeRectString:", self->_gazeRectString);
    goto LABEL_33;
  }
  v48 = v12;
  v38 = -[PHFaceChangeRequest _associateFace:withPersonInPhotoLibrary:error:](self, "_associateFace:withPersonInPhotoLibrary:error:", v7, v8, &v48);
  v39 = v48;

  if (!self->_didSetGazeRect)
  {
    if (v38)
      goto LABEL_29;
LABEL_37:
    v40 = 0;
    v12 = v39;
    goto LABEL_38;
  }
  objc_msgSend(v7, "setGazeRectString:", self->_gazeRectString);
  if (!v38)
    goto LABEL_37;
LABEL_29:
  v12 = v39;
LABEL_33:
  if (self->_shouldClearFaceCropGenerationState)
  {
    objc_msgSend(v7, "setConfirmedFaceCropGenerationState:", 0);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRejectedPersonsNeedingFaceCrops:", v41);

  }
  objc_msgSend(v7, "fixAssetRelationshipsForFaceTorsoOrTemporal", v43);
  objc_msgSend(v7, "fixPersonRelationshipsForFaceTorsoOrTemporal");
  v40 = 1;
LABEL_38:

  return v40;
}

- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  int v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = -[PHFaceChangeRequest detectionType](self, "detectionType", a3);
  v6 = v5;
  if (a4 && v5 == 2)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2938];
    v11[0] = CFSTR("PHDetectionTypePet is not a valid value to assign to PHFace.detectionType");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3111, v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6 != 2;
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0D716C8];
  objc_msgSend(a3, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertInManagedObjectContext:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a4 || v8)
  {
    -[PHChangeRequest uuid](self, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUuid:", v12);

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create face"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)setFaceprint:(id)a3
{
  PHFaceprint *v4;
  PHFaceprint *faceprint;

  v4 = (PHFaceprint *)a3;
  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didSetFaceprint = 1;
  faceprint = self->_faceprint;
  self->_faceprint = v4;

}

- (PHFaceprint)faceprint
{
  return self->_faceprint;
}

- (void)setGazeRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  NSString *v8;
  NSString *gazeRectString;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didSetGazeRect = 1;
  objc_msgSend(MEMORY[0x1E0D716C8], "stringFromGazeRect:", x, y, width, height);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  gazeRectString = self->_gazeRectString;
  self->_gazeRectString = v8;

}

- (CGRect)gazeRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend(MEMORY[0x1E0D716C8], "cgRectFromGazeRectString:", self->_gazeRectString);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setDetectionTraits:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;

  v5 = a3;
  -[PHChangeRequest didMutate](self, "didMutate");
  v4 = (uint64_t)v5;
  self->_didSetDetectionTraits = 1;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (id)v4;
  -[NSMutableArray setArray:](self->_detectionTraits, "setArray:", v4);

}

- (void)setNameSource:(int64_t)a3
{
  int v3;

  v3 = a3;
  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didSetNameSource = 1;
  self->_nameSource = v3;
}

- (int64_t)nameSource
{
  return self->_nameSource;
}

- (void)associateFaceWithPersonUUID:(id)a3
{
  NSString *v4;
  NSString *associatedPersonUUID;

  v4 = (NSString *)a3;
  -[PHChangeRequest didMutate](self, "didMutate");
  self->_didSetAssociatedPersonUUID = 1;
  associatedPersonUUID = self->_associatedPersonUUID;
  self->_associatedPersonUUID = v4;

}

- (BOOL)_associateFace:(id)a3 withPersonInPhotoLibrary:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  NSString *v16;
  BOOL v17;
  NSString *associatedPersonUUID;
  void *v19;
  NSObject *v20;
  id *v21;
  NSString *v22;
  NSString *v23;
  NSObject *v24;
  NSString *v25;
  NSString *v26;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  NSString *v33;
  __int16 v34;
  NSString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHFaceChangeRequest.m"), 422, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PLIsAssetsd()"));

  }
  if (!self->_didSetAssociatedPersonUUID)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHFaceChangeRequest.m"), 423, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_didSetAssociatedPersonUUID"));

  }
  if (self->_associatedPersonUUID)
  {
    objc_msgSend(v10, "managedObjectContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D71940], "personWithUUID:inManagedObjectContext:", self->_associatedPersonUUID, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (id)v12;
      v14 = 0;
    }
    else
    {
      associatedPersonUUID = self->_associatedPersonUUID;
      v31 = 0;
      v13 = -[PHFaceChangeRequest _copyPersonWithPersonUUID:toLibrary:error:](self, "_copyPersonWithPersonUUID:toLibrary:error:", associatedPersonUUID, v10, &v31);
      v14 = v31;
      if (!v13)
      {
LABEL_16:
        PLPhotoKitGetLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v9, "uuid");
          v25 = (NSString *)objc_claimAutoreleasedReturnValue();
          v26 = self->_associatedPersonUUID;
          *(_DWORD *)buf = 138543618;
          v33 = v25;
          v34 = 2114;
          v35 = v26;
          _os_log_impl(&dword_1991EC000, v24, OS_LOG_TYPE_ERROR, "Unable to associate face %{public}@ with target person %{public}@ (person not found)", buf, 0x16u);

        }
        if (a5)
        {
          v14 = objc_retainAutorelease(v14);
          v17 = 0;
          *a5 = v14;
        }
        else
        {
          v17 = 0;
        }
        goto LABEL_22;
      }
    }
    if (objc_msgSend(v13, "verifiedType") == -2)
    {
      objc_msgSend(v13, "mergeTargetPerson");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      PLPhotoKitGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v30 = v10;
        v21 = a5;
        v22 = self->_associatedPersonUUID;
        objc_msgSend(v19, "personUUID");
        v23 = (NSString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v22;
        a5 = v21;
        v10 = v30;
        v34 = 2114;
        v35 = v23;
        _os_log_impl(&dword_1991EC000, v20, OS_LOG_TYPE_INFO, "Attempt to associate a face with a tombstone person %{public}@, will associate with merge target %{public}@", buf, 0x16u);

      }
      if (!v19)
        goto LABEL_16;
    }
    else
    {
      v19 = v13;
    }
    objc_msgSend(v9, "setAssociatedPerson:", v19);

    v17 = 1;
LABEL_22:

    goto LABEL_23;
  }
  PLPhotoKitGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v9, "uuid");
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v33 = v16;
    _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_INFO, "setting person relationship to nil for face %{public}@", buf, 0xCu);

  }
  objc_msgSend(v9, "setAssociatedPerson:", 0);
  v17 = 1;
LABEL_23:

  return v17;
}

- (id)_copyPersonWithPersonUUID:(id)a3 toLibrary:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  NSURL *associatedPersonLibraryURL;
  id v29;
  NSObject *v30;
  NSString *associatedPersonUUID;
  id v33;
  id *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t buf[4];
  NSURL *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_associatedPersonLibraryURL)
  {
    v36 = 0;
    v11 = (id *)&v36;
    v12 = PLCreateShortLivedPhotoLibraryWithPhotoLibraryURL();
  }
  else
  {
    v37 = 0;
    v11 = (id *)&v37;
    v12 = PLCreateShortLivedWellKnownPhotoLibrary();
  }
  v13 = (void *)v12;
  v14 = *v11;
  v15 = v14;
  if (!v13)
  {
    v26 = v14;
    PLPhotoKitGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      associatedPersonLibraryURL = self->_associatedPersonLibraryURL;
      if (!associatedPersonLibraryURL)
        associatedPersonLibraryURL = (NSURL *)CFSTR("SYSTEM");
      *(_DWORD *)buf = 138412290;
      v39 = associatedPersonLibraryURL;
      _os_log_impl(&dword_1991EC000, v27, OS_LOG_TYPE_ERROR, "source photo library (%@) could not be opened", buf, 0xCu);
    }

    v29 = v26;
    goto LABEL_16;
  }
  v33 = v14;
  v34 = a5;
  v16 = v10;
  v17 = (void *)objc_msgSend(MEMORY[0x1E0D717E8], "newTransferOptionsForPersonFromSystemToSyndication");
  objc_msgSend(v17, "setSkipContextSave:", 1);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D717E0]), "initWithSourceLibrary:destinationLibrary:options:", v13, v9, v17);
  v35 = 0;
  v19 = objc_msgSend(v18, "transferPersonWithUuid:error:", v8, &v35);
  v20 = v35;
  v21 = v8;
  v22 = v20;
  if (v19)
  {
    v23 = v21;
    objc_msgSend(MEMORY[0x1E0D71940], "personWithUUID:inManagedObjectContext:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
  }
  else
  {
    v23 = v21;
    v25 = v20;
    PLPhotoKitGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      associatedPersonUUID = self->_associatedPersonUUID;
      *(_DWORD *)buf = 138543618;
      v39 = (NSURL *)associatedPersonUUID;
      v40 = 2112;
      v41 = v25;
      _os_log_impl(&dword_1991EC000, v30, OS_LOG_TYPE_ERROR, "transfer person failed for %{public}@: %@", buf, 0x16u);
    }

    v24 = 0;
  }

  v29 = v25;
  v10 = v16;
  v8 = v23;
  v15 = v33;
  a5 = v34;
  if (!v24)
  {
LABEL_16:
    if (a5)
    {
      v29 = objc_retainAutorelease(v29);
      v24 = 0;
      *a5 = v29;
    }
    else
    {
      v24 = 0;
    }
  }

  return v24;
}

- (void)setShouldClearFaceCropGenerationState:(BOOL)a3
{
  self->_shouldClearFaceCropGenerationState = a3;
  if (a3)
    -[PHChangeRequest didMutate](self, "didMutate");
}

- (BOOL)shouldClearFaceCropGenerationState
{
  return self->_shouldClearFaceCropGenerationState;
}

- (NSURL)associatedPersonLibraryURL
{
  return self->_associatedPersonLibraryURL;
}

- (void)setAssociatedPersonLibraryURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedPersonLibraryURL, 0);
  objc_storeStrong((id *)&self->_gazeRectString, 0);
  objc_storeStrong((id *)&self->_associatedPersonUUID, 0);
  objc_storeStrong((id *)&self->_detectionTraits, 0);
  objc_storeStrong((id *)&self->_faceprint, 0);
}

+ (id)creationRequestForFace
{
  return -[PHFaceChangeRequest initForNewObject]([PHFaceChangeRequest alloc], "initForNewObject");
}

+ (id)changeRequestForFace:(id)a3
{
  if (!a3)
    return 0;
  +[PHChangeRequestHelper changeRequestForObject:](PHChangeRequestHelper, "changeRequestForObject:");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)deleteFaces:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = +[PHObjectDeleteRequest deleteRequestsForObjects:ofType:forSelector:](PHFaceDeleteRequest, "deleteRequestsForObjects:ofType:forSelector:", v5, objc_opt_class(), a2);

}

@end
