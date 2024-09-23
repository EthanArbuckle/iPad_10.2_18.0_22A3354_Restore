@implementation AVPlayerConnection

- (AVPlayerConnection)initWithWeakReferenceToPlayer:(id)a3 weakReferenceToPlayerItem:(id)a4
{
  AVPlayerConnection *v7;
  AVPlayerConnection *v8;
  AVPlayerConnection *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  AVPlayerConnection *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)AVPlayerConnection;
  v7 = -[AVPlayerConnection init](&v21, sel_init);
  v8 = v7;
  if (!a3)
  {
    v10 = v7;
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v18 = "playerReference != nil";
    goto LABEL_8;
  }
  if (!a4)
  {
    v19 = v7;
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v18 = "playerItemReference != nil";
LABEL_8:
    v20 = (void *)objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v11, v12, v13, v14, v15, (uint64_t)v18), 0);
    objc_exception_throw(v20);
  }
  if (v7)
  {
    v7->_playerReference = (AVWeakReference *)a3;
    v8->_playerItemReference = (AVWeakReference *)a4;
    v8->_status = 0;
  }
  return v8;
}

- (BOOL)addItemToPlayQueueAfterPlaybackItemOfItem:(id)a3
{
  id v6;
  id v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const void *v14;
  signed int v15;
  int64_t v16;
  const void *v17;
  uint64_t (*v18)(const void *, const void *, id);
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;

  v6 = -[AVPlayerConnection playerItem](self, "playerItem");
  v7 = -[AVPlayerConnection player](self, "player");
  v8 = -[AVPlayerConnection status](self, "status");
  switch(v8)
  {
    case 3:
      v16 = 0;
      return v16 == 1;
    case 1:
      v20 = (void *)MEMORY[0x1E0C99DA0];
      v21 = *MEMORY[0x1E0C99768];
      v22 = CFSTR("Cannot connect a player connection that is already connected");
      goto LABEL_24;
    case 2:
      v20 = (void *)MEMORY[0x1E0C99DA0];
      v21 = *MEMORY[0x1E0C99768];
      v22 = CFSTR("Player connections are one-shot objects.  Cannot connect a player connection that was already disconnected.  To re-connect an AVPlayerItem to an AVPlayer, create a new player AVPlayerConnection object");
LABEL_24:
      v23 = (void *)objc_msgSend(v20, "exceptionWithName:reason:userInfo:", v21, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v22, v9, v10, v11, v12, v13, v24), 0);
      objc_exception_throw(v23);
  }
  v14 = (const void *)objc_msgSend(v6, "_copyFigPlaybackItem");
  if (a3)
    a3 = (id)objc_msgSend(a3, "_copyFigPlaybackItem");
  if (objc_msgSend(v6, "status") == 2)
  {
    v15 = -12780;
    goto LABEL_13;
  }
  objc_msgSend(v6, "_setPlaybackCoordinator:", objc_msgSend(v7, "_playbackCoordinatorWithoutTriggeringFullSetup"));
  v17 = (const void *)objc_msgSend(v7, "_copyFigPlayer");
  v18 = *(uint64_t (**)(const void *, const void *, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
  if (v18)
  {
    v15 = v18(v17, v14, a3);
    if (!v17)
      goto LABEL_12;
    goto LABEL_11;
  }
  v15 = -12782;
  if (v17)
LABEL_11:
    CFRelease(v17);
LABEL_12:
  if (!v15)
  {
    v16 = 1;
    goto LABEL_14;
  }
LABEL_13:
  -[AVPlayerConnection willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("error"));
  self->_error = (NSError *)objc_msgSend((id)AVLocalizedErrorWithUnderlyingOSStatus(v15, 0), "copy");
  -[AVPlayerConnection didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("error"));
  v16 = 3;
LABEL_14:
  -[AVPlayerConnection willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("status"));
  self->_status = v16;
  -[AVPlayerConnection didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("status"));
  if (v14)
    CFRelease(v14);
  if (a3)
    CFRelease(a3);
  return v16 == 1;
}

- (int64_t)status
{
  return self->_status;
}

- (id)player
{
  return -[AVWeakReference referencedObject](self->_playerReference, "referencedObject");
}

- (id)playerItem
{
  return -[AVWeakReference referencedObject](self->_playerItemReference, "referencedObject");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVPlayerConnection;
  -[AVPlayerConnection dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, player = %@, playerItem = %@>"), NSStringFromClass(v4), self, -[AVPlayerConnection player](self, "player"), -[AVPlayerConnection playerItem](self, "playerItem"));
}

- (void)removeItemFromPlayQueue
{
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(const void *, const void *);
  void *v15;
  uint64_t v16;

  v4 = -[AVPlayerConnection status](self, "status");
  switch(v4)
  {
    case 1:
      v12 = objc_msgSend(-[AVPlayerConnection player](self, "player"), "_copyFigPlayer");
      if (!v12)
        return;
      v10 = (const void *)v12;
      v13 = objc_msgSend(-[AVPlayerConnection playerItem](self, "playerItem"), "_copyFigPlaybackItem");
      if (!v13)
      {
LABEL_13:
        CFRelease(v10);
        return;
      }
      v11 = (const void *)v13;
      v14 = *(void (**)(const void *, const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
      if (v14)
        v14(v10, v11);
      objc_msgSend(-[AVPlayerConnection playerItem](self, "playerItem"), "_setPlaybackCoordinator:", 0);
      break;
    case 3:
      return;
    case 2:
      v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot disconnect a player connection that was already disconnected"), v5, v6, v7, v8, v9, v16), 0);
      objc_exception_throw(v15);
    default:
      v10 = 0;
      v11 = 0;
      break;
  }
  -[AVPlayerConnection willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("status"));
  self->_status = 2;
  -[AVPlayerConnection didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("status"));
  if (v11)
    CFRelease(v11);
  if (v10)
    goto LABEL_13;
}

- (id)error
{
  return self->_error;
}

@end
