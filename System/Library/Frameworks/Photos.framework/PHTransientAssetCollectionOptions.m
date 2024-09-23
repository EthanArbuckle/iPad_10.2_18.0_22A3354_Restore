@implementation PHTransientAssetCollectionOptions

- (id)_init
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHTransientAssetCollectionOptions;
  result = -[PHTransientAssetCollectionOptions init](&v3, sel_init);
  if (result)
    *(_OWORD *)((char *)result + 8) = xmmword_19944AD30;
  return result;
}

- (PHTransientAssetCollectionOptions)initWithPhotoLibrary:(id)a3
{
  id v5;
  id *v6;
  PHTransientAssetCollectionOptions *v7;

  v5 = a3;
  v6 = -[PHTransientAssetCollectionOptions _init](self, "_init");
  v7 = (PHTransientAssetCollectionOptions *)v6;
  if (v6)
    objc_storeStrong(v6 + 12, a3);

  return v7;
}

- (PHTransientAssetCollectionOptions)initWithAssetFetchResult:(id)a3
{
  id v5;
  id *v6;
  PHTransientAssetCollectionOptions *v7;
  uint64_t v8;
  PHPhotoLibrary *photoLibrary;

  v5 = a3;
  v6 = -[PHTransientAssetCollectionOptions _init](self, "_init");
  v7 = (PHTransientAssetCollectionOptions *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 10, a3);
    objc_msgSend(v5, "photoLibrary");
    v8 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v7->_photoLibrary;
    v7->_photoLibrary = (PHPhotoLibrary *)v8;

  }
  return v7;
}

- (PHTransientAssetCollectionOptions)initWithFetchOptions:(id)a3
{
  id v4;
  PHTransientAssetCollectionOptions *v5;
  uint64_t v6;
  PHQuery *query;

  v4 = a3;
  v5 = -[PHTransientAssetCollectionOptions _init](self, "_init");
  if (v5)
  {
    +[PHQuery queryForAssetsWithOptions:](PHQuery, "queryForAssetsWithOptions:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    query = v5->_query;
    v5->_query = (PHQuery *)v6;

  }
  return v5;
}

- (PHTransientAssetCollectionOptions)init
{
  PHTransientAssetCollectionOptions *v2;
  id v3;

  v2 = self;
  PLMethodNotImplementedException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(int64_t)a3
{
  self->_subtype = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)titleFontName
{
  return self->_titleFontName;
}

- (void)setTitleFontName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)keyAssetsPosition
{
  return self->_keyAssetsPosition;
}

- (void)setKeyAssetsPosition:(int64_t)a3
{
  self->_keyAssetsPosition = a3;
}

- (PHFetchResult)fetchResult
{
  return self->_fetchResult;
}

- (PHQuery)query
{
  return self->_query;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_titleFontName, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
