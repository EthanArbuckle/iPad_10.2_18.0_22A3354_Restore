@implementation MNJunctionViewImageLoader

- (MNJunctionViewImageLoader)init
{
  MNJunctionViewImageLoader *v2;
  void *v3;
  MNJunctionViewImageLoader *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MNJunctionViewImageLoader;
  v2 = -[MNJunctionViewImageLoader init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_imageWidth = (double)objc_msgSend(v3, "deviceScreenWidthInPixels");
    v2->_imageHeight = (double)objc_msgSend(v3, "deviceScreenHeightInPixels");
    v4 = v2;

  }
  return v2;
}

- (void)setJunctionViewEvents:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  _MNJunctionViewPreloadEvent *v12;
  NSArray **p_preloadEvents;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  void *v31;
  NSArray *obj;
  uint64_t v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasJunctionView"))
        {
          objc_msgSend(v10, "startValidDistance");
          if (v11 > 0.0)
          {
            v12 = objc_alloc_init(_MNJunctionViewPreloadEvent);
            -[_MNJunctionViewPreloadEvent setJunctionViewEvent:](v12, "setJunctionViewEvent:", v10);
            -[_MNJunctionViewPreloadEvent setNeedsPreload:](v12, "setNeedsPreload:", 1);
            objc_msgSend(v4, "addObject:", v12);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_17);
  p_preloadEvents = &self->_preloadEvents;
  objc_storeStrong((id *)&self->_preloadEvents, v4);
  GEOFindOrCreateLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);

  if (v15)
  {
    v30 = v5;
    v31 = v4;
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Setting %d event(s) to preload:\n"), -[NSArray count](*p_preloadEvents, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = *p_preloadEvents;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    if (v17)
    {
      v18 = v17;
      v33 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v36 != v33)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
          objc_msgSend(v20, "junctionViewEvent");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "uniqueID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "startValidDistance");
          v24 = v23;
          objc_msgSend(v21, "junctionView");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "imageIds");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[MNJunctionViewImageLoader _stringForImageIDs:](self, "_stringForImageIDs:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "appendFormat:", CFSTR("\t%@ | startDistance: %0.1f | images: (%@)"), v22, v24, v27);

          -[NSArray lastObject](self->_preloadEvents, "lastObject");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20 != v28)
            objc_msgSend(v16, "appendFormat:", CFSTR("\n"));

        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      }
      while (v18);
    }

    GEOFindOrCreateLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v16;
      _os_log_impl(&dword_1B0AD7000, v29, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    v5 = v30;
    v4 = v31;
  }

}

uint64_t __51__MNJunctionViewImageLoader_setJunctionViewEvents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "junctionViewEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startValidDistance");
  objc_msgSend(v4, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "junctionViewEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "startValidDistance");
  objc_msgSend(v8, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "compare:", v10);

  return v11;
}

- (void)setJunctionViewImageWidth:(double)a3 height:(double)a4
{
  NSObject *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  double v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (vabdd_f64(self->_imageWidth, a3) >= 0.000001 || vabdd_f64(self->_imageHeight, a4) >= 0.000001)
  {
    self->_imageWidth = a3;
    self->_imageHeight = a4;
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v19 = a3;
      v20 = 2048;
      v21 = a4;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_INFO, "Setting desired junction view image size to [%g x %g]", buf, 0x16u);
    }

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = self->_preloadEvents;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "setNeedsPreload:", 1, (_QWORD)v13);
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (void)updateForLocation:(id)a3 remainingDistanceOnRoute:(double)a4
{
  double v6;
  double v7;
  NSArray *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  double v28;
  __int16 v29;
  double v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  GEOConfigGetDouble();
  v7 = v6;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = self->_preloadEvents;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v24;
    *(_QWORD *)&v10 = 134218240;
    v22 = v10;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v14, "needsPreload", v22, (_QWORD)v23))
        {
          objc_msgSend(v14, "junctionViewEvent");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "endValidDistance");
          if (v16 > a4)
            goto LABEL_12;
          objc_msgSend(v15, "startValidDistance");
          v18 = v7 + v17;
          if (v7 + v17 >= a4)
          {
            GEOFindOrCreateLog();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v22;
              v28 = a4;
              v29 = 2048;
              v30 = v18;
              _os_log_impl(&dword_1B0AD7000, v19, OS_LOG_TYPE_INFO, "Preloading junction view images | remainingDistance: %0.1f | preloadDistance: %0.1f", buf, 0x16u);
            }

            objc_msgSend(v15, "junctionView");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "uniqueID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[MNJunctionViewImageLoader imagesForJunctionView:eventID:handler:](self, "imagesForJunctionView:eventID:handler:", v20, v21, 0);

LABEL_12:
            objc_msgSend(v14, "setNeedsPreload:", 0);
          }

          continue;
        }
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v11);
  }

}

- (void)imagesForJunctionView:(id)a3 eventID:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "imageIds");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__MNJunctionViewImageLoader_imagesForJunctionView_eventID_handler___block_invoke;
  v13[3] = &unk_1E61D3208;
  v14 = v8;
  v15 = v9;
  v11 = v8;
  v12 = v9;
  -[MNJunctionViewImageLoader _imagesForIDs:handler:](self, "_imagesForIDs:handler:", v10, v13);

}

void __67__MNJunctionViewImageLoader_imagesForJunctionView_eventID_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  MNGuidanceJunctionViewInfo *v4;

  if (*(_QWORD *)(a1 + 40))
  {
    v3 = a2;
    v4 = -[MNGuidanceJunctionViewInfo initWithID:images:]([MNGuidanceJunctionViewInfo alloc], "initWithID:images:", *(_QWORD *)(a1 + 32), v3);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)_imagesForIDs:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id location;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0D270F0]);
  v9 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v8, "setImageIds:", v9);

  objc_msgSend(v8, "setWidth:", self->_imageWidth);
  objc_msgSend(v8, "setHeight:", self->_imageHeight);
  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __51__MNJunctionViewImageLoader__imagesForIDs_handler___block_invoke;
  v28[3] = &unk_1E61D3230;
  objc_copyWeak(&v31, &location);
  v11 = v8;
  v29 = v11;
  v12 = v7;
  v30 = v12;
  v13 = (void *)MEMORY[0x1B5E0E364](v28);
  v23 = v10;
  v24 = 3221225472;
  v25 = __51__MNJunctionViewImageLoader__imagesForIDs_handler___block_invoke_2;
  v26 = &unk_1E61D3258;
  v14 = v11;
  v27 = v14;
  v15 = (void *)MEMORY[0x1B5E0E364](&v23);
  GEOFindOrCreateLog();
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = objc_msgSend(v14, "width");
    v18 = objc_msgSend(v14, "height");
    -[MNJunctionViewImageLoader _stringForImageIDs:](self, "_stringForImageIDs:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v34 = v14;
    v35 = 1024;
    v36 = v17;
    v37 = 1024;
    v38 = v18;
    v39 = 2112;
    v40 = v19;
    _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_INFO, "Requesting junction view images (%p) [%u x %u] for IDs: %@", buf, 0x22u);

  }
  objc_msgSend(MEMORY[0x1E0D270F8], "sharedRequester");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C80D38];
  v22 = MEMORY[0x1E0C80D38];
  objc_msgSend(v20, "startImageServiceRequest:auditToken:throttleToken:queue:finished:networkActivity:error:", v14, 0, 0, v21, v13, 0, v15, v23, v24, v25, v26);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

}

void __51__MNJunctionViewImageLoader__imagesForIDs_handler___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;
  id v7;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_imagesForRequest:response:", *(_QWORD *)(a1 + 32), v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);

}

void __51__MNJunctionViewImageLoader__imagesForIDs_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 134218243;
    v7 = v5;
    v8 = 2113;
    v9 = v3;
    _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_ERROR, "Error requesting junction images for request (%p): %{private}@", (uint8_t *)&v6, 0x16u);
  }

}

- (id)_imagesForRequest:(id)a3 response:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  MNGuidanceJunctionViewImage *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "imagesCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(v6, "images");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v13, "imageId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v10);
  }

  v32 = v6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "imagesCount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v33 = v5;
  objc_msgSend(v5, "imageIds");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v35 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        objc_msgSend(v7, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v23 = objc_alloc_init(MNGuidanceJunctionViewImage);
          objc_msgSend(v22, "imageId");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[MNGuidanceJunctionViewImage setImageID:](v23, "setImageID:", objc_msgSend(v24, "_navigation_unsignedIntegerValue"));

          objc_msgSend(v22, "image");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[MNGuidanceJunctionViewImage setImageData:](v23, "setImageData:", v25);

          objc_msgSend(v15, "addObject:", v23);
        }
        else
        {
          GEOFindOrCreateLog();
          v23 = (MNGuidanceJunctionViewImage *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v23->super, OS_LOG_TYPE_ERROR))
          {
            v26 = objc_msgSend(v21, "_navigation_unsignedIntegerValue");
            *(_DWORD *)buf = 134217984;
            v43 = v26;
            _os_log_impl(&dword_1B0AD7000, &v23->super, OS_LOG_TYPE_ERROR, "Requested junction view image (%llu) was not found in response", buf, 0xCu);
          }
        }

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    }
    while (v18);
  }

  GEOFindOrCreateLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v33, "imageIds");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNJunctionViewImageLoader _stringForImageIDs:](self, "_stringForImageIDs:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v43 = (uint64_t)v33;
    v44 = 2112;
    v45 = v29;
    _os_log_impl(&dword_1B0AD7000, v27, OS_LOG_TYPE_INFO, "Received junction view images (%p) for IDs: %@", buf, 0x16u);

  }
  return v15;
}

- (id)_stringForImageIDs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        objc_msgSend(v5, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 == v11)
          v12 = CFSTR("%llu");
        else
          v12 = CFSTR(", %llu");
        v13 = v12;

        objc_msgSend(v4, "appendFormat:", v13, objc_msgSend(v10, "_navigation_unsignedIntegerValue"));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preloadEvents, 0);
}

@end
