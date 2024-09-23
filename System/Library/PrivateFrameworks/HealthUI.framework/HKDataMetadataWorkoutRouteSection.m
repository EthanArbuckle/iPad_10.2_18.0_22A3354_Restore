@implementation HKDataMetadataWorkoutRouteSection

- (HKDataMetadataWorkoutRouteSection)initWithLocationReadings:(id)a3 tableViewSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v8;
  HKDataMetadataWorkoutRouteSection *v9;
  NSCache *v10;
  NSCache *routeImageCache;
  HKDataMetadataWorkoutRouteCell *v12;
  HKDataMetadataWorkoutRouteCell *cell;
  HKDataMetadataWorkoutRouteSection *v14;
  objc_super v16;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKDataMetadataWorkoutRouteSection;
  v9 = -[HKDataMetadataWorkoutRouteSection init](&v16, sel_init);
  if (v9)
  {
    if (!v8 || !objc_msgSend(v8, "count"))
    {
      v14 = 0;
      goto LABEL_7;
    }
    objc_storeStrong((id *)&v9->_locationReadings, a3);
    v9->_tableViewSize.width = width;
    v9->_tableViewSize.height = height;
    v10 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    routeImageCache = v9->_routeImageCache;
    v9->_routeImageCache = v10;

    -[NSCache setCountLimit:](v9->_routeImageCache, "setCountLimit:", 2);
    v12 = objc_alloc_init(HKDataMetadataWorkoutRouteCell);
    cell = v9->_cell;
    v9->_cell = v12;

    -[HKDataMetadataWorkoutRouteCell setDelegate:](v9->_cell, "setDelegate:", v9);
    -[HKDataMetadataWorkoutRouteSection generateRouteImage](v9, "generateRouteImage");
  }
  v14 = v9;
LABEL_7:

  return v14;
}

- (void)setTableViewSize:(CGSize)a3
{
  double width;
  double height;

  width = self->_tableViewSize.width;
  height = self->_tableViewSize.height;
  self->_tableViewSize = a3;
  if (a3.width != width || a3.height != height)
    -[HKDataMetadataWorkoutRouteSection generateRouteImage](self, "generateRouteImage");
}

- (void)generateRouteImage
{
  id v3;

  -[HKDataMetadataWorkoutRouteCell traitCollection](self->_cell, "traitCollection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataWorkoutRouteSection _generateRouteImageForTraitCollection:](self, "_generateRouteImageForTraitCollection:", v3);

}

- (void)_generateRouteImageForTraitCollection:(id)a3
{
  id v4;
  double width;
  NSObject *v6;
  double v7;
  void *v8;
  void *v9;
  NSObject *v10;
  HKRouteMapGenerator *v11;
  HKRouteMapGenerator *generator;
  HKRouteMapGenerator *v13;
  _QWORD v14[4];
  id v15[2];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  width = self->_tableViewSize.width;
  if (width == 0.0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7813000, v6, OS_LOG_TYPE_DEFAULT, "[route] skipping route image snapshot with zero width", buf, 2u);
    }
  }
  else
  {
    v7 = HKUIRoundToScreenScale(width * 0.66);
    v8 = (void *)objc_msgSend(v4, "userInterfaceStyle");
    -[HKDataMetadataWorkoutRouteSection _cachedRouteImageForUserInterfaceStyle:snapshotSize:](self, "_cachedRouteImageForUserInterfaceStyle:snapshotSize:", v8, width, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      _HKInitializeLogging();
      v10 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v17 = v8;
        _os_log_impl(&dword_1D7813000, v10, OS_LOG_TYPE_DEFAULT, "[route] using cached workout route image for interface style: %ld", buf, 0xCu);
      }
      -[HKDataMetadataWorkoutRouteCell setRouteImage:](self->_cell, "setRouteImage:", v9);
    }
    else
    {
      v11 = objc_alloc_init(HKRouteMapGenerator);
      generator = self->_generator;
      self->_generator = v11;

      -[HKRouteMapGenerator setLocationReadings:](self->_generator, "setLocationReadings:", self->_locationReadings);
      objc_initWeak((id *)buf, self);
      v13 = self->_generator;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __75__HKDataMetadataWorkoutRouteSection__generateRouteImageForTraitCollection___block_invoke;
      v14[3] = &unk_1E9C40E38;
      v15[1] = v8;
      objc_copyWeak(v15, (id *)buf);
      -[HKRouteMapGenerator snapshotWithSize:lineWidth:traitCollection:offsets:completion:](v13, "snapshotWithSize:lineWidth:traitCollection:offsets:completion:", v4, v14, width, v7, 5.0, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
      objc_destroyWeak(v15);
      objc_destroyWeak((id *)buf);
    }

  }
}

void __75__HKDataMetadataWorkoutRouteSection__generateRouteImageForTraitCollection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint8_t v15[16];

  v3 = a2;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "cell");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceStyle");

    if (v4 == v8)
    {
      v9 = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(v9, "cell");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setRouteImage:", v3);

    }
    v11 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v11, "routeImageCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v3, v13);

  }
  else
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1D7813000, v14, OS_LOG_TYPE_DEFAULT, "[route] map generator returned nil route image. snapshot may have been canceled or encountered an error.", v15, 2u);
    }
  }

}

- (id)_cachedRouteImageForUserInterfaceStyle:(int64_t)a3 snapshotSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  NSCache *routeImageCache;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  id v15;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  height = a4.height;
  width = a4.width;
  routeImageCache = self->_routeImageCache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](routeImageCache, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_6;
  v17.origin.x = 0.0;
  v17.origin.y = 0.0;
  v17.size.width = width;
  v17.size.height = height;
  v18 = CGRectIntegral(v17);
  v9 = v18.size.width;
  v10 = v18.size.height;
  objc_msgSend(v8, "size", v18.origin.x, v18.origin.y);
  v12 = v11;
  objc_msgSend(v8, "size");
  v19.size.height = v13;
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = v12;
  v20 = CGRectIntegral(v19);
  if (v9 == v20.size.width && v10 == v20.size.height)
    v15 = v8;
  else
LABEL_6:
    v15 = 0;

  return v15;
}

- (void)workoutRouteCell:(id)a3 didUpdateTraitCollection:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[HKDataMetadataWorkoutRouteSection cell](self, "cell");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
    -[HKDataMetadataWorkoutRouteSection _generateRouteImageForTraitCollection:](self, "_generateRouteImageForTraitCollection:", v8);

}

- (id)sectionTitle
{
  void *v2;
  void *v3;

  HKHealthKitFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("WORKOUT_ROUTE_TITLE"), &stru_1E9C4C428, *MEMORY[0x1E0CB5138]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)numberOfRowsInSection
{
  return 1;
}

- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4
{
  return self->_cell;
}

- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  HKWorkoutRouteViewController *v8;
  HKLocationReadings *locationReadings;
  void *v10;
  HKWorkoutRouteViewController *v11;

  v5 = a5;
  v7 = a4;
  v8 = [HKWorkoutRouteViewController alloc];
  locationReadings = self->_locationReadings;
  -[HKDataMetadataWorkoutRouteSection sectionTitle](self, "sectionTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HKWorkoutRouteViewController initWithLocationReadings:title:sharingEnabled:shareText:excludedActivityTypes:](v8, "initWithLocationReadings:title:sharingEnabled:shareText:excludedActivityTypes:", locationReadings, v10, 0, 0, 0);

  objc_msgSend(v7, "pushViewController:animated:", v11, v5);
}

- (CGSize)tableViewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_tableViewSize.width;
  height = self->_tableViewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (HKDataMetadataWorkoutRouteCell)cell
{
  return self->_cell;
}

- (void)setCell:(id)a3
{
  objc_storeStrong((id *)&self->_cell, a3);
}

- (HKLocationReadings)locationReadings
{
  return self->_locationReadings;
}

- (HKLocationFetcher)locationFetcher
{
  return self->_locationFetcher;
}

- (void)setLocationFetcher:(id)a3
{
  objc_storeStrong((id *)&self->_locationFetcher, a3);
}

- (HKRouteMapGenerator)generator
{
  return self->_generator;
}

- (void)setGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_generator, a3);
}

- (NSCache)routeImageCache
{
  return self->_routeImageCache;
}

- (void)setRouteImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_routeImageCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeImageCache, 0);
  objc_storeStrong((id *)&self->_generator, 0);
  objc_storeStrong((id *)&self->_locationFetcher, 0);
  objc_storeStrong((id *)&self->_locationReadings, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
