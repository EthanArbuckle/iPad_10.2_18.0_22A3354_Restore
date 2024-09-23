@implementation CNAvatarPosterCarouselEditingContext

- (CNAvatarPosterCarouselEditingContext)initWithExistingPoster:(id)a3 existingAvatar:(id)a4
{
  id v7;
  id v8;
  CNAvatarPosterCarouselEditingContext *v9;
  CNAvatarPosterCarouselEditingContext *v10;
  CNAvatarPosterCarouselEditingContext *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNAvatarPosterCarouselEditingContext;
  v9 = -[CNAvatarPosterCarouselEditingContext init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_isEditingExisting = 1;
    objc_storeStrong((id *)&v9->_existingAvatar, a4);
    objc_storeStrong((id *)&v10->_existingPoster, a3);
    v11 = v10;
  }

  return v10;
}

- (void)setPendingPosterEdit:(id)a3
{
  CNFuture *v5;
  CNFuture *pendingWallpaperFuture;
  CNAvatarPosterCarouselPendingPosterEdit *v7;

  v7 = (CNAvatarPosterCarouselPendingPosterEdit *)a3;
  if (self->_pendingPosterEdit != v7)
  {
    objc_storeStrong((id *)&self->_pendingPosterEdit, a3);
    -[CNAvatarPosterCarouselPendingPosterEdit pendingWallpaper](v7, "pendingWallpaper");
    v5 = (CNFuture *)objc_claimAutoreleasedReturnValue();
    pendingWallpaperFuture = self->_pendingWallpaperFuture;
    self->_pendingWallpaperFuture = v5;

  }
}

- (BOOL)isEditingExisting
{
  return self->_isEditingExisting;
}

- (CNContactPoster)existingPoster
{
  return self->_existingPoster;
}

- (void)setExistingPoster:(id)a3
{
  objc_storeStrong((id *)&self->_existingPoster, a3);
}

- (CNAvatarPosterCarouselPendingPosterEdit)pendingPosterEdit
{
  return self->_pendingPosterEdit;
}

- (CNFuture)pendingWallpaperFuture
{
  return self->_pendingWallpaperFuture;
}

- (void)setPendingWallpaperFuture:(id)a3
{
  objc_storeStrong((id *)&self->_pendingWallpaperFuture, a3);
}

- (CNContactImage)existingAvatar
{
  return self->_existingAvatar;
}

- (void)setExistingAvatar:(id)a3
{
  objc_storeStrong((id *)&self->_existingAvatar, a3);
}

- (CNContactImage)updatedAvatar
{
  return self->_updatedAvatar;
}

- (void)setUpdatedAvatar:(id)a3
{
  objc_storeStrong((id *)&self->_updatedAvatar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedAvatar, 0);
  objc_storeStrong((id *)&self->_existingAvatar, 0);
  objc_storeStrong((id *)&self->_pendingWallpaperFuture, 0);
  objc_storeStrong((id *)&self->_pendingPosterEdit, 0);
  objc_storeStrong((id *)&self->_existingPoster, 0);
}

+ (CNAvatarPosterCarouselEditingContext)contextWithExistingPoster:(id)a3 existingAvatar:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithExistingPoster:existingAvatar:", v7, v6);

  return (CNAvatarPosterCarouselEditingContext *)v8;
}

+ (id)contextForCreateNew
{
  return objc_alloc_init((Class)a1);
}

@end
