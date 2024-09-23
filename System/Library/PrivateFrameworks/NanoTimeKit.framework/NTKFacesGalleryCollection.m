@implementation NTKFacesGalleryCollection

- (NTKFacesGalleryCollection)initWithDevice:(id)a3 title:(id)a4 faceDescriptors:(id)a5
{
  id v9;
  id v10;
  NTKFacesGalleryCollection *v11;
  NTKFacesGalleryCollection *v12;
  uint64_t v13;
  NSArray *faceDescriptors;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)NTKFacesGalleryCollection;
  v11 = -[NTKDeviceSpecificFacesArrayGalleryCollection initWithDevice:](&v16, sel_initWithDevice_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, a4);
    v13 = objc_msgSend(v10, "copy");
    faceDescriptors = v12->_faceDescriptors;
    v12->_faceDescriptors = (NSArray *)v13;

    -[NTKGalleryCollection setCalloutName:](v12, "setCalloutName:", &__block_literal_global_69);
  }

  return v12;
}

uint64_t __66__NTKFacesGalleryCollection_initWithDevice_title_faceDescriptors___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_faceGalleryCalloutName");
}

- (id)title
{
  return self->_title;
}

- (id)facesForDevice:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_faceDescriptors;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        +[NTKFace defaultFaceFromFaceDescriptor:forDevice:](NTKFace, "defaultFaceFromFaceDescriptor:forDevice:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), v4, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_faceDescriptors, 0);
}

@end
