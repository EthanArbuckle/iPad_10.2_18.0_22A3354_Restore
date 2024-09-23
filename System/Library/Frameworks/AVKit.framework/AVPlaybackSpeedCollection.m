@implementation AVPlaybackSpeedCollection

+ (id)defaultSpeedFromList:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  float v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
      objc_msgSend(v8, "rate", (_QWORD)v12);
      if (v9 == 1.0)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v10 = v8;

    if (v10)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  objc_msgSend(v3, "firstObject", (_QWORD)v12);
  v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v10;
}

- (void)setDelegate:(id)a3
{
  AVPlaybackSpeedCollectionDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    v6 = obj;
  }

}

+ (AVPlaybackSpeedCollection)collectionWithSpeeds:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initInternalWithSpeeds:", v4);

  return (AVPlaybackSpeedCollection *)v5;
}

- (id)_initInternalWithSpeeds:(id)a3
{
  id v5;
  AVPlaybackSpeedCollection *v6;
  AVPlaybackSpeedCollection *v7;
  uint64_t v8;
  AVPlaybackSpeed *activeSpeed;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVPlaybackSpeedCollection;
  v6 = -[AVPlaybackSpeedCollection init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_speeds, a3);
    +[AVPlaybackSpeedCollection defaultSpeedFromList:](AVPlaybackSpeedCollection, "defaultSpeedFromList:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    activeSpeed = v7->_activeSpeed;
    v7->_activeSpeed = (AVPlaybackSpeed *)v8;

  }
  return v7;
}

- (id)activeSpeed
{
  return self->_activeSpeed;
}

- (id)displaySpeeds
{
  void *v3;
  uint64_t v4;

  -[AVPlaybackSpeedCollection speeds](self, "speeds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsObject:", self->_activeSpeed) & 1) == 0)
  {
    objc_msgSend(v3, "arrayByAddingObject:", self->_activeSpeed);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (NSArray)speeds
{
  return self->_speeds;
}

+ (id)keyPathsForValuesAffectingSelectedSpeed
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("activeSpeed"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSpeed, 0);
  objc_storeStrong((id *)&self->_speeds, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (AVPlaybackSpeed)selectedSpeed
{
  AVPlaybackSpeed *v3;
  AVPlaybackSpeed *v4;
  void *v5;
  int v6;
  AVPlaybackSpeed *v7;

  v3 = self->_activeSpeed;
  v4 = v3;
  if (!self || !v3)
  {

LABEL_7:
    v7 = 0;
    return v7;
  }
  -[AVPlaybackSpeedCollection speeds](self, "speeds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (!v6 || -[AVPlaybackSpeed isSynthesized](self->_activeSpeed, "isSynthesized"))
    goto LABEL_7;
  v7 = self->_activeSpeed;
  return v7;
}

- (void)selectSpeed:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[NSArray containsObject:](self->_speeds, "containsObject:"))
  {
    -[AVPlaybackSpeedCollection selectedSpeed](self, "selectedSpeed");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (v4 != v6)
    {
      -[AVPlaybackSpeedCollection setActiveSpeed:](self, "setActiveSpeed:", v6);
      -[AVPlaybackSpeedCollection delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "playbackSpeedCollection:selectedPlaybackSpeedDidChangeTo:", self, v6);

    }
  }

}

- (void)selectNextPlaybackSpeed:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[AVPlaybackSpeedCollection speeds](self, "speeds", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlaybackSpeedCollection selectedSpeed](self, "selectedSpeed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(v4, "indexOfObject:", v5);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_7;
    objc_msgSend(v4, "objectAtIndex:", (v6 + 1) % (unint64_t)objc_msgSend(v4, "count"));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  if (v7)
  {
    -[AVPlaybackSpeedCollection selectSpeed:](self, "selectSpeed:", v7);
    goto LABEL_9;
  }
LABEL_7:
  _AVLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPlaybackSpeedCollection description](self, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v9;
    v13 = 2112;
    v14 = v10;
    _os_log_error_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_ERROR, "Error: Internal inconsistency. Selected speed was not found in playback speed collection.\n%@\n%@", (uint8_t *)&v11, 0x16u);

  }
LABEL_9:

}

- (void)setActiveSpeed:(id)a3
{
  AVPlaybackSpeed *v5;
  AVPlaybackSpeed **p_activeSpeed;
  AVPlaybackSpeed *activeSpeed;
  AVPlaybackSpeed *v8;

  v5 = (AVPlaybackSpeed *)a3;
  activeSpeed = self->_activeSpeed;
  p_activeSpeed = &self->_activeSpeed;
  if (activeSpeed != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_activeSpeed, a3);
    v5 = v8;
  }

}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)internalDescription
{
  return -[AVPlaybackSpeedCollection _descriptionWithInternalState:](self, 1);
}

- (id)debugDescription
{
  return -[AVPlaybackSpeedCollection _descriptionWithInternalState:](self, 0);
}

- (id)description
{
  return -[AVPlaybackSpeedCollection _descriptionWithInternalState:](self, 0);
}

- (id)_descriptionWithInternalState:(void *)a1
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (a2)
    objc_msgSend(a1, "displaySpeeds");
  else
    objc_msgSend(a1, "speeds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = a1;
  v23.super_class = (Class)AVPlaybackSpeedCollection;
  objc_msgSendSuper2(&v23, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(" [\n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      v11 = v6;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
        if (a2)
          objc_msgSend(v12, "internalDescription");
        else
          objc_msgSend(v12, "description");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "activeSpeed");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 == v14)
          v15 = CFSTR("\t%@ - active\n");
        else
          v15 = CFSTR("\t%@\n");
        objc_msgSend(v11, "stringByAppendingFormat:", v15, v13);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        ++v10;
        v11 = v6;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v8);
  }

  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("]"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)keyPathsForValuesAffectingDisplaySpeeds
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("speeds"), CFSTR("activeSpeed"), 0);
}

@end
