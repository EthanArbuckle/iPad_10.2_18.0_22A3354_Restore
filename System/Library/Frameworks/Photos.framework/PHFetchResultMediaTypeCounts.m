@implementation PHFetchResultMediaTypeCounts

+ (PHFetchResultMediaTypeCounts)mediaTypeCountsWithPhotosCount:(unint64_t)a3 videosCount:(unint64_t)a4 audiosCount:(unint64_t)a5
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL && a4 == 0x7FFFFFFFFFFFFFFFLL && a5 == 0x7FFFFFFFFFFFFFFFLL)
    return (PHFetchResultMediaTypeCounts *)0;
  else
    return (PHFetchResultMediaTypeCounts *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithPhotosCount:videosCount:audiosCount:", a3, a4, a5);
}

- (PHFetchResultMediaTypeCounts)initWithPhotosCount:(unint64_t)a3 videosCount:(unint64_t)a4 audiosCount:(unint64_t)a5
{
  PHFetchResultMediaTypeCounts *v10;
  PHFetchResultMediaTypeCounts *v11;
  PHFetchResultMediaTypeCounts *v12;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHFetchResultMediaTypeCounts.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photosCount != NSNotFound"));

  }
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHFetchResultMediaTypeCounts.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("videosCount != NSNotFound"));

  }
  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHFetchResultMediaTypeCounts.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("audiosCount != NSNotFound"));

  }
  v17.receiver = self;
  v17.super_class = (Class)PHFetchResultMediaTypeCounts;
  v10 = -[PHFetchResultMediaTypeCounts init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_photosCount = a3;
    v10->_videosCount = a4;
    v10->_audiosCount = a5;
    v12 = v10;
  }

  return v11;
}

- (unint64_t)photosCount
{
  return self->_photosCount;
}

- (unint64_t)videosCount
{
  return self->_videosCount;
}

- (unint64_t)audiosCount
{
  return self->_audiosCount;
}

@end
