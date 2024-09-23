@implementation HMMutableMediaPlaybackAction

- (void)setMediaProfiles:(id)a3
{
  NSSet *v4;
  NSSet *mediaProfiles;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSSet *)objc_msgSend(v6, "copy");
  mediaProfiles = self->super._mediaProfiles;
  self->super._mediaProfiles = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (void)setState:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  self->super._state = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setVolume:(id)a3
{
  NSNumber *v4;
  NSNumber *volume;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSNumber *)objc_msgSend(v6, "copy");
  volume = self->super._volume;
  self->super._volume = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (void)setPlaybackArchive:(id)a3
{
  MPPlaybackArchive *v4;
  MPPlaybackArchive *playbackArchive;

  v4 = (MPPlaybackArchive *)a3;
  os_unfair_lock_lock_with_options();
  playbackArchive = self->super._playbackArchive;
  self->super._playbackArchive = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

@end
