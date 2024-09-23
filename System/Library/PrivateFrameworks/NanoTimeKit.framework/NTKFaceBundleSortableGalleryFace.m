@implementation NTKFaceBundleSortableGalleryFace

- (NTKFaceBundleSortableGalleryFace)initWithFace:(id)a3 priority:(unint64_t)a4
{
  id v7;
  NTKFaceBundleSortableGalleryFace *v8;
  NTKFaceBundleSortableGalleryFace *v9;
  NTKFaceBundleSortableGalleryFace *v10;
  objc_super v12;

  v7 = a3;
  if (v7)
  {
    v12.receiver = self;
    v12.super_class = (Class)NTKFaceBundleSortableGalleryFace;
    v8 = -[NTKFaceBundleSortableGalleryFace init](&v12, sel_init);
    v9 = v8;
    if (v8)
    {
      v8->_priority = a4;
      objc_storeStrong((id *)&v8->_face, a3);
    }
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)compare:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  int64_t v16;
  unint64_t v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[NTKFaceBundleSortableGalleryFace priority](self, "priority");
    if (objc_msgSend(v4, "priority") == v5)
    {
      -[NTKFaceBundleSortableGalleryFace face](self, "face");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "face");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v8)
        v10 = (__CFString *)v8;
      else
        v10 = &stru_1E6BDC918;
      v11 = v10;

      objc_msgSend(v7, "name");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v12)
        v14 = (__CFString *)v12;
      else
        v14 = &stru_1E6BDC918;
      v15 = v14;

      v16 = -[__CFString localizedCaseInsensitiveCompare:](v11, "localizedCaseInsensitiveCompare:", v15);
    }
    else
    {
      v17 = objc_msgSend(v4, "priority");
      if (v17 < -[NTKFaceBundleSortableGalleryFace priority](self, "priority"))
        v16 = -1;
      else
        v16 = 1;
    }
  }
  else
  {
    v16 = -1;
  }

  return v16;
}

- (NTKFace)face
{
  return self->_face;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_face, 0);
}

@end
