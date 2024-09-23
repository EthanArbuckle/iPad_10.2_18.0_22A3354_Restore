@implementation NTKCompanionRemoteComplicationDataSource

- (NTKCompanionRemoteComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  NTKCompanionRemoteComplicationDataSource *v5;
  void *v6;
  uint64_t v7;
  NTKCompanionAppLibrary *appLibrary;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKCompanionRemoteComplicationDataSource;
  v5 = -[CLKCComplicationDataSource initWithComplication:family:forDevice:](&v10, sel_initWithComplication_family_forDevice_, a3, a4, a5);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel__activeDeviceChanged, *MEMORY[0x1E0C93E48], 0);

    -[NTKCompanionRemoteComplicationDataSource _loadCollection](v5, "_loadCollection");
    +[NTKCompanionAppLibrary sharedAppLibrary](NTKCompanionAppLibrary, "sharedAppLibrary");
    v7 = objc_claimAutoreleasedReturnValue();
    appLibrary = v5->_appLibrary;
    v5->_appLibrary = (NTKCompanionAppLibrary *)v7;

    -[NTKCompanionAppLibrary addObserver:](v5->_appLibrary, "addObserver:", v5);
  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C93E48], 0);

  -[NTKComplicationCollection removeObserver:](self->_complicationCollection, "removeObserver:", self);
  -[NTKCompanionAppLibrary removeObserver:](self->_appLibrary, "removeObserver:", self);
  v4.receiver = self;
  v4.super_class = (Class)NTKCompanionRemoteComplicationDataSource;
  -[NTKCompanionRemoteComplicationDataSource dealloc](&v4, sel_dealloc);
}

- (void)_loadCollection
{
  void *v3;
  NTKComplicationCollection *v4;
  NTKComplicationCollection *complicationCollection;

  -[NTKComplicationCollection removeObserver:](self->_complicationCollection, "removeObserver:", self);
  -[CLKCComplicationDataSource device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKCompanionComplicationCollectionManager sharedComplicationCollectionForDevice:](NTKCompanionComplicationCollectionManager, "sharedComplicationCollectionForDevice:", v3);
  v4 = (NTKComplicationCollection *)objc_claimAutoreleasedReturnValue();
  complicationCollection = self->_complicationCollection;
  self->_complicationCollection = v4;

  -[NTKComplicationCollection addObserver:](self->_complicationCollection, "addObserver:", self);
}

- (void)_activeDeviceChanged
{
  -[NTKCompanionRemoteComplicationDataSource _loadCollection](self, "_loadCollection");
  -[NTKCompanionRemoteComplicationDataSource _invalidate](self, "_invalidate");
}

+ (BOOL)acceptsComplicationType:(unint64_t)a3 withFamily:(int64_t)a4 forDevice:(id)a5
{
  if (a3 == 31)
    return NTKComplicationFamilyIsPublic(a4);
  else
    return 0;
}

- (id)currentSwitcherTemplate
{
  NTKCompanionRemoteComplicationDataSource *v2;
  CLKComplicationTemplate *complicationTemplate;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  CLKComplicationTemplate *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  CLKComplicationTemplate *v25;
  NTKComplicationCollection *complicationCollection;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  CLKComplicationTemplate *v31;
  NTKCompanionRemoteComplicationDataSource *v33;
  uint64_t v34;
  int v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v2 = self;
  v41 = *MEMORY[0x1E0C80C00];
  complicationTemplate = self->_complicationTemplate;
  if (!complicationTemplate)
  {
    -[CLKCComplicationDataSource complication](v2, "complication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NTKCompanionRemoteComplicationDataSource _remoteIsCompanion](v2, "_remoteIsCompanion"))
    {
      -[CLKCComplicationDataSource complication](v2, "complication");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "app");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKCompanionRemoteComplicationDataSource _templateFromApp:](v2, "_templateFromApp:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v2->_complicationTemplate;
      v2->_complicationTemplate = (CLKComplicationTemplate *)v7;

    }
    if (!v2->_complicationTemplate)
    {
      v33 = v2;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      +[NTKCompanionAppLibrary sharedAppLibrary](NTKCompanionAppLibrary, "sharedAppLibrary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "thirdPartyApps");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v37;
        do
        {
          v14 = 0;
          v34 = v12;
          do
          {
            if (*(_QWORD *)v37 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v14);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = v15;
              objc_msgSend(v16, "complicationClientIdentifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "clientIdentifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v17, "isEqualToString:", v18) & 1) != 0)
              {
                objc_msgSend(v16, "watchApplicationIdentifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "appBundleIdentifier");
                v20 = v13;
                v21 = v10;
                v22 = v4;
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = objc_msgSend(v19, "isEqualToString:", v23);

                v4 = v22;
                v10 = v21;
                v13 = v20;

                v12 = v34;
                if (v35)
                {
                  -[NTKCompanionRemoteComplicationDataSource _templateFromApp:](v33, "_templateFromApp:", v16);
                  v24 = objc_claimAutoreleasedReturnValue();
                  v25 = v33->_complicationTemplate;
                  v33->_complicationTemplate = (CLKComplicationTemplate *)v24;

                  goto LABEL_18;
                }
              }
              else
              {

              }
            }
            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        }
        while (v12);
      }
LABEL_18:

      v2 = v33;
      if (!v33->_complicationTemplate)
      {
        complicationCollection = v33->_complicationCollection;
        objc_msgSend(v4, "clientIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "complicationDescriptor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appBundleIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKComplicationCollection sampleTemplateForClientIdentifier:descriptor:applicationID:family:](complicationCollection, "sampleTemplateForClientIdentifier:descriptor:applicationID:family:", v27, v28, v29, -[CLKCComplicationDataSource family](v33, "family"));
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = v33->_complicationTemplate;
        v33->_complicationTemplate = (CLKComplicationTemplate *)v30;

      }
    }

    complicationTemplate = v2->_complicationTemplate;
  }
  return complicationTemplate;
}

- (void)complicationCollection:(id)a3 didUpdateSampleTemplateForClient:(id)a4
{
  id v5;
  void *v6;
  int v7;
  id v8;

  v5 = a4;
  -[CLKCComplicationDataSource complication](self, "complication");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
    -[NTKCompanionRemoteComplicationDataSource _invalidate](self, "_invalidate");

}

- (void)complicationCollection:(id)a3 didRemoveSampleTemplatesForClient:(id)a4
{
  id v5;
  void *v6;
  int v7;
  id v8;

  v5 = a4;
  -[CLKCComplicationDataSource complication](self, "complication");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
    -[NTKCompanionRemoteComplicationDataSource _invalidate](self, "_invalidate");

}

- (void)appLibrary:(id)a3 didAddApp:(id)a4
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;

  v5 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__NTKCompanionRemoteComplicationDataSource_appLibrary_didAddApp___block_invoke;
  block[3] = &unk_1E6BCD778;
  block[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_sync(MEMORY[0x1E0C80D38], block);

}

uint64_t __65__NTKCompanionRemoteComplicationDataSource_appLibrary_didAddApp___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateIfComplicationCorrespondsToApp:", *(_QWORD *)(a1 + 40));
}

- (void)appLibrary:(id)a3 didUpdateApp:(id)a4
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;

  v5 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__NTKCompanionRemoteComplicationDataSource_appLibrary_didUpdateApp___block_invoke;
  block[3] = &unk_1E6BCD778;
  block[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_sync(MEMORY[0x1E0C80D38], block);

}

uint64_t __68__NTKCompanionRemoteComplicationDataSource_appLibrary_didUpdateApp___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateIfComplicationCorrespondsToApp:", *(_QWORD *)(a1 + 40));
}

- (void)_invalidateIfComplicationCorrespondsToApp:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a3;
  -[CLKCComplicationDataSource complication](self, "complication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v11;
    objc_msgSend(v5, "complicationClientIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", v7) & 1) != 0)
    {
      objc_msgSend(v5, "watchApplicationIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appBundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

      if (v10)
        -[NTKCompanionRemoteComplicationDataSource _invalidate](self, "_invalidate");
    }
    else
    {

    }
  }

}

- (id)_templateFromApp:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "urlToComplicationBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKComplicationBundleHelper localizedComplicationTemplateForFamily:bundle:localization:](NTKComplicationBundleHelper, "localizedComplicationTemplateForFamily:bundle:localization:", -[CLKCComplicationDataSource family](self, "family"), v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_remoteIsCompanion
{
  void *v2;
  char isKindOfClass;

  -[CLKCComplicationDataSource complication](self, "complication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_invalidate
{
  CLKComplicationTemplate *complicationTemplate;
  id v4;

  complicationTemplate = self->_complicationTemplate;
  self->_complicationTemplate = 0;

  -[CLKCComplicationDataSource delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateSwitcherTemplate");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_stocksDataSource, 0);
  objc_storeStrong((id *)&self->_complicationCollection, 0);
  objc_storeStrong((id *)&self->_complicationTemplate, 0);
}

@end
