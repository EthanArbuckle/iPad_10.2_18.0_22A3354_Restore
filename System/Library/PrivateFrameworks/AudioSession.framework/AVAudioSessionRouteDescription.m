@implementation AVAudioSessionRouteDescription

- (AVAudioSessionRouteDescription)initWithRawDescription:(id)a3 owningSession:(id)a4
{
  id v6;
  id v7;
  AVAudioSessionRouteDescription *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  __CFString *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  AVAudioSessionRouteDescription *v30;
  AVAudioSessionRouteDescription *v31;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  objc_super v37;

  v6 = a3;
  v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)AVAudioSessionRouteDescription;
  v8 = -[AVAudioSessionRouteDescription init](&v37, sel_init);
  if (!v8)
    goto LABEL_13;
  v9 = operator new();
  v10 = 1936289391;
  *(_QWORD *)v9 = 0;
  *(_QWORD *)(v9 + 8) = 0;
  *(_QWORD *)(v9 + 16) = 0;
  *(_QWORD *)(v9 + 24) = 1936289391;
  *(_WORD *)(v9 + 32) = 0;
  v8->_impl = (void *)v9;
  v11 = -[AVAudioSessionRouteDescription privateGetImplementation](v8, "privateGetImplementation");
  if (!v6)
  {
    v13 = 0;
    v15 = 0;
LABEL_6:
    v17 = &stru_1E4250BD8;
    goto LABEL_7;
  }
  v12 = (id)*MEMORY[0x1E0D49E90];
  objc_msgSend(v6, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (id)*MEMORY[0x1E0D49EB0];
  objc_msgSend(v6, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (id)*MEMORY[0x1E0D49EC8];
  objc_msgSend(v6, "objectForKey:", v16);
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v17)
    goto LABEL_6;
LABEL_7:
  v18 = +[AVAudioSessionPortDescription privateCreateArray:owningSession:](AVAudioSessionPortDescription, "privateCreateArray:owningSession:", v13, v7);
  v19 = *(void **)v11;
  *(_QWORD *)v11 = v18;

  v20 = +[AVAudioSessionPortDescription privateCreateArray:owningSession:](AVAudioSessionPortDescription, "privateCreateArray:owningSession:", v15, v7);
  v21 = *(void **)(v11 + 8);
  *(_QWORD *)(v11 + 8) = v20;

  objc_storeStrong((id *)(v11 + 16), v17);
  if (v6)
  {
    v34 = v15;
    v22 = (id)*MEMORY[0x1E0D49ED0];
    v36 = (id)*MEMORY[0x1E0D49ED8];
    v23 = (id)*MEMORY[0x1E0D49EE0];
    v24 = (id)*MEMORY[0x1E0CFF318];
    v33 = v22;
    v35 = v13;
    objc_msgSend(v6, "objectForKey:", v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
      v10 = objc_msgSend(v25, "unsignedIntegerValue");
    *(_QWORD *)(v11 + 24) = v10;
    objc_msgSend(v6, "objectForKey:", v36);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(v11 + 33) = objc_msgSend(v27, "BOOLValue");
    objc_msgSend(v6, "objectForKey:", v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(v11 + 32) = objc_msgSend(v28, "BOOLValue");
    objc_msgSend(v6, "objectForKey:", v24);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAudioSessionRouteDescription updateOutputPortsWithSpatialAudioStatus:](v8, "updateOutputPortsWithSpatialAudioStatus:", objc_msgSend(v29, "BOOLValue"));
    v30 = v8;

    v15 = v34;
    v13 = v35;
  }
  else
  {
    v31 = v8;
  }

LABEL_13:
  return v8;
}

- (RouteDescriptionImpl)privateGetImplementation
{
  return (RouteDescriptionImpl *)self->_impl;
}

- (void)updateOutputPortsWithSpatialAudioStatus:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = (id)-[AVAudioSessionRouteDescription privateGetImplementation](self, "privateGetImplementation")[8];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setSupportsSpatialAudio:", v3, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (NSArray)outputs
{
  AVAudioSessionRouteDescription *v2;
  id v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = *((id *)v2->_impl + 1);
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)dealloc
{
  id *impl;
  objc_super v4;

  impl = (id *)self->_impl;
  if (impl)
  {

    MEMORY[0x1A1AF1C48](impl, 0x1080C40F59D5452);
  }
  self->_impl = 0;
  v4.receiver = self;
  v4.super_class = (Class)AVAudioSessionRouteDescription;
  -[AVAudioSessionRouteDescription dealloc](&v4, sel_dealloc);
}

- (AVAudioSessionRouteDescription)init
{
  AVAudioSessionRouteDescription *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVAudioSessionRouteDescription;
  v2 = -[AVAudioSessionRouteDescription init](&v11, sel_init);
  if (v2)
  {
    v3 = operator new();
    *(_QWORD *)v3 = 0;
    *(_QWORD *)(v3 + 8) = 0;
    *(_QWORD *)(v3 + 16) = 0;
    *(_QWORD *)(v3 + 24) = 1936289391;
    *(_WORD *)(v3 + 32) = 0;
    v2->_impl = (void *)v3;
    v4 = objc_opt_new();
    v5 = *(void **)v3;
    *(_QWORD *)v3 = v4;

    v6 = objc_opt_new();
    v7 = *(void **)(v3 + 8);
    *(_QWORD *)(v3 + 8) = v6;

    v8 = objc_opt_new();
    v9 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = v8;

  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  AVAudioSessionRouteDescription *v4;
  AVAudioSessionRouteDescription *v5;
  BOOL v6;

  v4 = (AVAudioSessionRouteDescription *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[AVAudioSessionRouteDescription isEqualToRoute:](self, "isEqualToRoute:", v5);

  return v6;
}

- (BOOL)isEqualToRoute:(id)a3
{
  AVAudioSessionRouteDescription *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (AVAudioSessionRouteDescription *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    -[AVAudioSessionRouteDescription inputs](self, "inputs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAudioSessionRouteDescription inputs](v4, "inputs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToArray:", v6);

    if ((v7 & 1) != 0)
    {
      -[AVAudioSessionRouteDescription outputs](self, "outputs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVAudioSessionRouteDescription outputs](v4, "outputs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToArray:", v9);

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (NSArray)inputs
{
  AVAudioSessionRouteDescription *v2;
  id v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = *(id *)v2->_impl;
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (id)description
{
  _QWORD *impl;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  impl = self->_impl;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p, \ninputs = %@; \noutputs = %@>"), v6, self, *impl, impl[1]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)siriRemoteInputIdentifier
{
  AVAudioSessionRouteDescription *v2;
  id v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = *((id *)v2->_impl + 2);
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (unint64_t)siriInputSource
{
  AVAudioSessionRouteDescription *v2;
  unint64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = *((_QWORD *)v2->_impl + 3);
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)supportsDoAP
{
  AVAudioSessionRouteDescription *v2;
  char v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = *((_BYTE *)v2->_impl + 33);
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)supportsSoftwareVolume
{
  AVAudioSessionRouteDescription *v2;
  char v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = *((_BYTE *)v2->_impl + 32);
  objc_sync_exit(v2);

  return v3;
}

@end
