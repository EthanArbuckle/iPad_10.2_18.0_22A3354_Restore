@implementation NTKFacesArrayGalleryCollection

- (unint64_t)numberOfFaces
{
  return -[NSArray count](self->_faces, "count");
}

- (id)faceAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_faces, "objectAtIndexedSubscript:", a3);
}

- (unint64_t)indexOfFace:(id)a3
{
  return -[NSArray indexOfObject:](self->_faces, "indexOfObject:", a3);
}

- (void)setFaces:(id)a3
{
  NSArray *v4;
  NSArray *faces;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  NTKFacesArrayGalleryCollection *v10;
  __int16 v11;
  NTKFacesArrayGalleryCollection *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_faces != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    faces = self->_faces;
    self->_faces = v4;

    _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[NTKGalleryCollection delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = self;
      v11 = 2048;
      v12 = self;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "Faces updated for %@ (%p). Notifying delegate %@", (uint8_t *)&v9, 0x20u);

    }
    -[NTKGalleryCollection delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "galleryCollectionDidChange:shouldUpdateSnaphots:", self, 1);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faces, 0);
}

@end
