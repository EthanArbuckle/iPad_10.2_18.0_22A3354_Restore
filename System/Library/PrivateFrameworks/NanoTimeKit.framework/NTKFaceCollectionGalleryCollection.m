@implementation NTKFaceCollectionGalleryCollection

- (NTKFaceCollectionGalleryCollection)initWithTitle:(id)a3 faceCollection:(id)a4
{
  id v6;
  id v7;
  NTKFaceCollectionGalleryCollection *v8;
  NTKFaceCollectionGalleryCollection *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NTKFaceCollectionGalleryCollection;
  v8 = -[NTKFaceCollectionGalleryCollection init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[NTKGalleryCollection setTitle:](v8, "setTitle:", v6);
    objc_storeStrong((id *)&v9->_faceCollection, a4);
  }

  return v9;
}

- (id)collectionIdentifier
{
  return -[NTKFaceCollection collectionIdentifier](self->_faceCollection, "collectionIdentifier");
}

- (unint64_t)numberOfFaces
{
  return -[NTKFaceCollection numberOfFaces](self->_faceCollection, "numberOfFaces");
}

- (id)faceAtIndex:(unint64_t)a3
{
  return -[NTKFaceCollection faceAtIndex:](self->_faceCollection, "faceAtIndex:", a3);
}

- (unint64_t)indexOfFace:(id)a3
{
  return -[NTKFaceCollection indexOfFace:](self->_faceCollection, "indexOfFace:", a3);
}

- (void)faceCollectionDidLoad:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NTKFaceCollection *faceCollection;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;

  v4 = (void *)MEMORY[0x1E0C944B0];
  -[NTKFaceCollection deviceUUID](self->_faceCollection, "deviceUUID", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceForNRDeviceUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "nrDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  faceCollection = self->_faceCollection;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __60__NTKFaceCollectionGalleryCollection_faceCollectionDidLoad___block_invoke;
  v15 = &unk_1E6BD5A48;
  v16 = v6;
  v17 = v7;
  v9 = v7;
  v10 = v6;
  -[NTKFaceCollection enumerateFacesUsingBlock:](faceCollection, "enumerateFacesUsingBlock:", &v12);
  -[NTKGalleryCollection delegate](self, "delegate", v12, v13, v14, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "galleryCollectionDidChange:shouldUpdateSnaphots:", self, 1);

}

void __60__NTKFaceCollectionGalleryCollection_faceCollectionDidLoad___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  __CFString *v20;
  __int16 v21;
  __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "hasValidConfigurationForDevice:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "valueForProperty:", *MEMORY[0x1E0D51778]);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      v6 = (__CFString *)v4;
    else
      v6 = CFSTR("unknown");
    v7 = v6;

    objc_msgSend(*(id *)(a1 + 40), "valueForProperty:", *MEMORY[0x1E0D51760]);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (__CFString *)v8;
    else
      v10 = CFSTR("unknown");
    v11 = v10;

    _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v3, "description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      v15 = 138413058;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      v19 = 2112;
      v20 = v7;
      v21 = 2112;
      v22 = v11;
      _os_log_fault_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_FAULT, "Edit Option Version Mismatch Exception: Attempted to add a face (%@) with an edit option that does not exist in device (%@)  %@ (%@).", (uint8_t *)&v15, 0x2Au);

    }
  }

}

- (void)faceCollection:(id)a3 didAddFace:(id)a4 atIndex:(unint64_t)a5
{
  id v6;

  -[NTKGalleryCollection delegate](self, "delegate", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "galleryCollectionDidChange:shouldUpdateSnaphots:", self, 1);

}

- (void)faceCollection:(id)a3 didRemoveFace:(id)a4 atIndex:(unint64_t)a5
{
  id v6;

  -[NTKGalleryCollection delegate](self, "delegate", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "galleryCollectionDidChange:shouldUpdateSnaphots:", self, 1);

}

- (void)faceCollectionDidReorderFaces:(id)a3
{
  id v4;

  -[NTKGalleryCollection delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "galleryCollectionDidChange:shouldUpdateSnaphots:", self, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceCollection, 0);
}

@end
