@implementation SUUIPlayButtonImageCache

+ (id)imageCacheForStyle:(int64_t)a3
{
  void *v4;
  SUUIPlayButtonImageCache *v5;

  if (imageCacheForStyle__onceToken != -1)
    dispatch_once(&imageCacheForStyle__onceToken, &__block_literal_global_66);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)imageCacheForStyle__sharedCaches, "objectForKey:", v4);
  v5 = (SUUIPlayButtonImageCache *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[SUUIPlayButtonImageCache initWithStyle:]([SUUIPlayButtonImageCache alloc], "initWithStyle:", a3);
    objc_msgSend((id)imageCacheForStyle__sharedCaches, "setObject:forKey:", v5, v4);
  }

  return v5;
}

uint64_t __47__SUUIPlayButtonImageCache_imageCacheForStyle___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE40]);
  v1 = (void *)imageCacheForStyle__sharedCaches;
  imageCacheForStyle__sharedCaches = (uint64_t)v0;

  return objc_msgSend((id)imageCacheForStyle__sharedCaches, "setName:", CFSTR("com.apple.iTunesStoreUI.SUUIPlayButtonImageCache.imageCacheForStyle"));
}

- (SUUIPlayButtonImageCache)initWithStyle:(int64_t)a3
{
  SUUIPlayButtonImageCache *v4;
  SUUIPlayButtonImageCache *v5;
  uint64_t v6;
  NSBundle *bundle;
  NSString *playImageName;
  const __CFString *v9;
  NSString *pauseImageName;
  const __CFString *v11;
  NSString *v12;
  NSString *stopImageName;
  uint64_t v14;
  UIImage *playImage;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SUUIPlayButtonImageCache;
  v4 = -[SUUIPlayButtonImageCache init](&v17, sel_init);
  v5 = v4;
  if (!v4)
    return v5;
  v4->_imageLock._os_unfair_lock_opaque = 0;
  SUUIBundle();
  v6 = objc_claimAutoreleasedReturnValue();
  bundle = v5->_bundle;
  v5->_bundle = (NSBundle *)v6;

  if (a3 == 2)
  {
    playImageName = v5->_playImageName;
    v9 = CFSTR("UniversalRadioButtonPlayIcon");
  }
  else
  {
    if (a3 == 1)
    {
      v12 = v5->_playImageName;
      v5->_playImageName = (NSString *)CFSTR("UniversaliPadPlayButtonPlayIcon");

      pauseImageName = v5->_pauseImageName;
      v11 = CFSTR("UniversaliPadPlayButtonPauseIcon");
      goto LABEL_9;
    }
    if (a3)
      goto LABEL_10;
    playImageName = v5->_playImageName;
    v9 = CFSTR("UniversalEncapsulatedPlayButtonPlayIcon");
  }
  v5->_playImageName = &v9->isa;

  pauseImageName = v5->_pauseImageName;
  v11 = CFSTR("UniversalPlayButtonPauseIcon");
LABEL_9:
  v5->_pauseImageName = &v11->isa;

  stopImageName = v5->_stopImageName;
  v5->_stopImageName = (NSString *)CFSTR("UniversalPlayButtonStopIcon");

LABEL_10:
  if (!v5->_playImage)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", v5->_playImageName, v5->_bundle);
    v14 = objc_claimAutoreleasedReturnValue();
    playImage = v5->_playImage;
    v5->_playImage = (UIImage *)v14;

  }
  return v5;
}

- (UIImage)playImage
{
  UIImage *playImage;
  UIImage *v4;
  UIImage *v5;

  playImage = self->_playImage;
  if (!playImage)
  {
    os_unfair_lock_lock(&self->_imageLock);
    if (!self->_playImage)
    {
      objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", self->_playImageName, self->_bundle);
      v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v5 = self->_playImage;
      self->_playImage = v4;

    }
    os_unfair_lock_unlock(&self->_imageLock);
    playImage = self->_playImage;
  }
  return playImage;
}

- (UIImage)pauseImage
{
  UIImage *pauseImage;
  UIImage *v4;
  UIImage *v5;

  pauseImage = self->_pauseImage;
  if (!pauseImage)
  {
    os_unfair_lock_lock(&self->_imageLock);
    if (!self->_pauseImage)
    {
      objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", self->_pauseImageName, self->_bundle);
      v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v5 = self->_pauseImage;
      self->_pauseImage = v4;

    }
    os_unfair_lock_unlock(&self->_imageLock);
    pauseImage = self->_pauseImage;
  }
  return pauseImage;
}

- (UIImage)stopImage
{
  UIImage *stopImage;
  UIImage *v4;
  UIImage *v5;

  stopImage = self->_stopImage;
  if (!stopImage)
  {
    os_unfair_lock_lock(&self->_imageLock);
    if (!self->_stopImage)
    {
      objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", self->_stopImageName, self->_bundle);
      v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v5 = self->_stopImage;
      self->_stopImage = v4;

    }
    os_unfair_lock_unlock(&self->_imageLock);
    stopImage = self->_stopImage;
  }
  return stopImage;
}

- (void)preloadImages
{
  os_unfair_lock_s *p_imageLock;
  UIImage *v4;
  UIImage *playImage;
  UIImage *v6;
  UIImage *pauseImage;
  UIImage *v8;
  UIImage *stopImage;

  p_imageLock = &self->_imageLock;
  os_unfair_lock_lock(&self->_imageLock);
  if (!self->_playImage)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", self->_playImageName, self->_bundle);
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    playImage = self->_playImage;
    self->_playImage = v4;

  }
  if (!self->_pauseImage)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", self->_pauseImageName, self->_bundle);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    pauseImage = self->_pauseImage;
    self->_pauseImage = v6;

  }
  if (!self->_stopImage)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", self->_stopImageName, self->_bundle);
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
    stopImage = self->_stopImage;
    self->_stopImage = v8;

  }
  os_unfair_lock_unlock(p_imageLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopImage, 0);
  objc_storeStrong((id *)&self->_stopImageName, 0);
  objc_storeStrong((id *)&self->_pauseImage, 0);
  objc_storeStrong((id *)&self->_pauseImageName, 0);
  objc_storeStrong((id *)&self->_playImage, 0);
  objc_storeStrong((id *)&self->_playImageName, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end
