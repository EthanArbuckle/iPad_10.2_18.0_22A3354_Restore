@implementation CNAvatarPosterCarouselPendingPosterEdit

- (CNAvatarPosterCarouselPendingPosterEdit)initWithContactPoster:(id)a3 posterConfiguration:(id)a4
{
  id v7;
  id v8;
  CNAvatarPosterCarouselPendingPosterEdit *v9;
  id *p_isa;
  NSObject *v11;
  CNAvatarPosterCarouselPendingPosterEdit *v12;
  uint8_t v14[16];
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNAvatarPosterCarouselPendingPosterEdit;
  v9 = -[CNAvatarPosterCarouselPendingPosterEdit init](&v15, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    if (!v7 || !v8)
    {
      objc_storeStrong((id *)&v9->_contactPoster, a3);
      objc_storeStrong(p_isa + 2, a4);
      v12 = p_isa;
      goto LABEL_9;
    }
    CNUILogPosters();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_error_impl(&dword_18AC56000, v11, OS_LOG_TYPE_ERROR, "Pending poster edit cannot be backed by both contact poster and configuration", v14, 2u);
    }

  }
  v12 = 0;
LABEL_9:

  return v12;
}

- (CNFuture)pendingWallpaper
{
  CNFuture *pendingWallpaper;
  CNFuture **p_pendingWallpaper;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  p_pendingWallpaper = &self->_pendingWallpaper;
  pendingWallpaper = self->_pendingWallpaper;
  if (pendingWallpaper)
    return pendingWallpaper;
  -[CNAvatarPosterCarouselPendingPosterEdit contactPoster](self, "contactPoster");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        -[CNAvatarPosterCarouselPendingPosterEdit posterConfiguration](self, "posterConfiguration"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    -[CNAvatarPosterCarouselPendingPosterEdit contactPoster](self, "contactPoster");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[CNAvatarPosterCarouselPendingPosterEdit pendingWallpaperFromContactPoster](self, "pendingWallpaperFromContactPoster");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CNAvatarPosterCarouselPendingPosterEdit posterConfiguration](self, "posterConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        CNUILogPosters();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v15 = 0;
          _os_log_error_impl(&dword_18AC56000, v14, OS_LOG_TYPE_ERROR, "Invalid pending poster edit, both contact poster and configuration are nil", v15, 2u);
        }

        v13 = 0;
        goto LABEL_13;
      }
      -[CNAvatarPosterCarouselPendingPosterEdit pendingWallpaperFromPosterConfiguration](self, "pendingWallpaperFromPosterConfiguration");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)v11;
LABEL_13:
    objc_storeStrong((id *)p_pendingWallpaper, v13);
    return (CNFuture *)v13;
  }
  CNUILogPosters();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_18AC56000, v9, OS_LOG_TYPE_ERROR, "Invalid pending poster edit, cannot be backed by both contact poster and configuration", buf, 2u);
  }

  return (CNFuture *)0;
}

- (id)pendingWallpaperFromContactPoster
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v10[4];
  id v11;
  id location[2];

  -[CNAvatarPosterCarouselPendingPosterEdit contactPoster](self, "contactPoster");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_initWeak(location, self);
    v4 = (void *)MEMORY[0x1E0D13A68];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __76__CNAvatarPosterCarouselPendingPosterEdit_pendingWallpaperFromContactPoster__block_invoke;
    v10[3] = &unk_1E2048190;
    objc_copyWeak(&v11, location);
    objc_msgSend(MEMORY[0x1E0D13B70], "defaultProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backgroundScheduler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "futureWithBlock:scheduler:", v10, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v11);
    objc_destroyWeak(location);
  }
  else
  {
    CNUILogPosters();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_18AC56000, v8, OS_LOG_TYPE_ERROR, "Failed to create wallpaper future, nil contact poster", (uint8_t *)location, 2u);
    }

    v7 = 0;
  }
  return v7;
}

- (id)pendingWallpaperFromPosterConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v10[4];
  id v11;
  id location[2];

  -[CNAvatarPosterCarouselPendingPosterEdit posterConfiguration](self, "posterConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_initWeak(location, self);
    v4 = (void *)MEMORY[0x1E0D13A68];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __82__CNAvatarPosterCarouselPendingPosterEdit_pendingWallpaperFromPosterConfiguration__block_invoke;
    v10[3] = &unk_1E2048190;
    objc_copyWeak(&v11, location);
    objc_msgSend(MEMORY[0x1E0D13B70], "defaultProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backgroundScheduler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "futureWithBlock:scheduler:", v10, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v11);
    objc_destroyWeak(location);
  }
  else
  {
    CNUILogPosters();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_18AC56000, v8, OS_LOG_TYPE_ERROR, "Failed to create wallpaper future, nil poster configuration", (uint8_t *)location, 2u);
    }

    v7 = 0;
  }
  return v7;
}

- (CNContactPoster)contactPoster
{
  return self->_contactPoster;
}

- (void)setContactPoster:(id)a3
{
  objc_storeStrong((id *)&self->_contactPoster, a3);
}

- (CNPRSPosterConfiguration)posterConfiguration
{
  return self->_posterConfiguration;
}

- (void)setPosterConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_posterConfiguration, a3);
}

- (void)setPendingWallpaper:(id)a3
{
  objc_storeStrong((id *)&self->_pendingWallpaper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingWallpaper, 0);
  objc_storeStrong((id *)&self->_posterConfiguration, 0);
  objc_storeStrong((id *)&self->_contactPoster, 0);
}

id __82__CNAvatarPosterCarouselPendingPosterEdit_pendingWallpaperFromPosterConfiguration__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "posterConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  +[CNPRSPosterArchiver archiveCNConfiguration:error:](CNPRSPosterArchiver, "archiveCNConfiguration:error:", v2, &v20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v20;

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13818] + 16))())
    {
      CNUILogPosters();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18AC56000, v6, OS_LOG_TYPE_ERROR, "Poster archive data from poster editor configuration is empty.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v4;
      v10 = objc_msgSend(v9, "removeItemAtURL:error:", v3, &v19);
      v11 = v19;

      if ((v10 & 1) == 0)
      {
        CNUILogPosters();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v22 = v3;
          _os_log_debug_impl(&dword_18AC56000, v12, OS_LOG_TYPE_DEBUG, "Failed to clean up archive poster at URL %@", buf, 0xCu);
        }

      }
      objc_msgSend(WeakRetained, "posterConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNAvatarPosterCarouselLikenessFingerprint fingerprintForPosterConfiguration:](CNAvatarPosterCarouselLikenessFingerprint, "fingerprintForPosterConfiguration:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x1E0C97408];
      objc_msgSend(WeakRetained, "posterConfiguration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "wallpaperWithPosterArchiveData:metadataFromConfiguration:visualFingerprint:contentIsSensitive:", v5, v16, v14, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v11;
    }

  }
  else
  {
    CNUILogPosters();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "localizedDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v18;
      _os_log_error_impl(&dword_18AC56000, v8, OS_LOG_TYPE_ERROR, "Failed to archive poster configuration %@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

id __76__CNAvatarPosterCarouselPendingPosterEdit_pendingWallpaperFromContactPoster__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "contactPoster");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "posterData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  +[CNPRSPosterArchiver unarchiveCNConfigurationFromData:error:](CNPRSPosterArchiver, "unarchiveCNConfigurationFromData:error:", v3, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;

  if (v4)
  {
    +[CNAvatarPosterCarouselLikenessFingerprint fingerprintForPosterConfiguration:](CNAvatarPosterCarouselLikenessFingerprint, "fingerprintForPosterConfiguration:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0C97408];
    objc_msgSend(WeakRetained, "contactPoster");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "posterData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "contactPoster");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "wallpaperWithPosterArchiveData:metadataFromConfiguration:visualFingerprint:contentIsSensitive:", v9, v4, v6, objc_msgSend(v10, "contentIsSensitive"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    CNUILogPosters();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v14;
      _os_log_error_impl(&dword_18AC56000, v12, OS_LOG_TYPE_ERROR, "Failed to unarchive poster configuration %@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (id)pendingEditFromContactPoster:(id)a3
{
  id v3;
  CNAvatarPosterCarouselPendingPosterEdit *v4;

  v3 = a3;
  v4 = -[CNAvatarPosterCarouselPendingPosterEdit initWithContactPoster:posterConfiguration:]([CNAvatarPosterCarouselPendingPosterEdit alloc], "initWithContactPoster:posterConfiguration:", v3, 0);

  return v4;
}

+ (id)pendingEditFromPosterConfiguration:(id)a3
{
  id v3;
  CNAvatarPosterCarouselPendingPosterEdit *v4;

  v3 = a3;
  v4 = -[CNAvatarPosterCarouselPendingPosterEdit initWithContactPoster:posterConfiguration:]([CNAvatarPosterCarouselPendingPosterEdit alloc], "initWithContactPoster:posterConfiguration:", 0, v3);

  return v4;
}

@end
