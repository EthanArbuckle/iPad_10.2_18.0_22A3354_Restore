@implementation BSStateCaptureInvalidator

- (void)invalidate
{
  void *v3;
  void *v4;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    if (self->_handle)
    {
      os_state_remove_handler();
      os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_32);
      v3 = (void *)qword_1ECD39AD0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_handle);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeObjectForKey:", v4);

      os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_32);
    }
  }
}

@end
