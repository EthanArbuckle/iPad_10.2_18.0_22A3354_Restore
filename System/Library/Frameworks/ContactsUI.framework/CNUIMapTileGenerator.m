@implementation CNUIMapTileGenerator

id __40__CNUIMapTileGenerator_tilesForAddress___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "mapTileImagesForPlacemark:snapshotterProvider:scheduler:", v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)mapTileImagesForPlacemark:(id)a3 snapshotterProvider:(id)a4 scheduler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0D13AE8];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__CNUIMapTileGenerator_mapTileImagesForPlacemark_snapshotterProvider_scheduler___block_invoke;
  v16[3] = &unk_1E2048410;
  v17 = v9;
  v18 = v7;
  v19 = v8;
  v11 = v8;
  v12 = v7;
  v13 = v9;
  objc_msgSend(v10, "observableWithBlock:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)tilesForAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNUIMapTileGenerator geocoderProvider](self, "geocoderProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIMapTileGenerator snapshotterProvider](self, "snapshotterProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIMapTileGenerator workQueue](self, "workQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIMapTileGenerator schedulerProvider](self, "schedulerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "placemarkForAddress:geocoderProvider:scheduler:", v4, v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __40__CNUIMapTileGenerator_tilesForAddress___block_invoke;
  v24[3] = &unk_1E2048348;
  v25 = v7;
  v26 = v6;
  v24[4] = self;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "flatMap:schedulerProvider:", v24, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0D13AE8];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "observableWithResult:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "onError:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNUIMapTileGenerator schedulerProvider](self, "schedulerProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "backgroundScheduler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "subscribeOn:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "defaultImage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "startWith:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNScheduler)workQueue
{
  return self->_workQueue;
}

- (id)snapshotterProvider
{
  return self->_snapshotterProvider;
}

- (CNUIMapTileGenerator)init
{
  void *v3;
  void *v4;
  CNUIMapTileGenerator *v5;

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultSchedulerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNUIMapTileGenerator initWithGeocoderProvider:snapshotterProvider:schedulerProvider:](self, "initWithGeocoderProvider:snapshotterProvider:schedulerProvider:", &__block_literal_global_3180, &__block_literal_global_3, v4);

  return v5;
}

- (CNUIMapTileGenerator)initWithGeocoderProvider:(id)a3 snapshotterProvider:(id)a4 schedulerProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNUIMapTileGenerator *v11;
  uint64_t v12;
  id geocoderProvider;
  uint64_t v14;
  id snapshotterProvider;
  uint64_t v16;
  CNScheduler *workQueue;
  CNUIMapTileGenerator *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CNUIMapTileGenerator;
  v11 = -[CNUIMapTileGenerator init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    geocoderProvider = v11->_geocoderProvider;
    v11->_geocoderProvider = (id)v12;

    v14 = objc_msgSend(v9, "copy");
    snapshotterProvider = v11->_snapshotterProvider;
    v11->_snapshotterProvider = (id)v14;

    v16 = objc_msgSend(v10, "newSerialSchedulerWithName:", CFSTR("com.apple.contacts.ContactsUI.CNUIMapTileGenerator"));
    workQueue = v11->_workQueue;
    v11->_workQueue = (CNScheduler *)v16;

    objc_storeStrong((id *)&v11->_schedulerProvider, a5);
    v18 = v11;
  }

  return v11;
}

- (id)geocoderProvider
{
  return self->_geocoderProvider;
}

+ (id)placemarkForAddress:(id)a3 geocoderProvider:(id)a4 scheduler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0D13AE8];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __71__CNUIMapTileGenerator_placemarkForAddress_geocoderProvider_scheduler___block_invoke;
  v16[3] = &unk_1E2048410;
  v18 = v7;
  v19 = v8;
  v17 = v9;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  objc_msgSend(v10, "observableWithBlock:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)defaultImage
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3870], "cnui_imageNamed:", CFSTR("MapTilePlaceholder"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_snapshotterProvider, 0);
  objc_storeStrong(&self->_geocoderProvider, 0);
}

id __80__CNUIMapTileGenerator_mapTileImagesForPlacemark_snapshotterProvider_scheduler___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__CNUIMapTileGenerator_mapTileImagesForPlacemark_snapshotterProvider_scheduler___block_invoke_2;
  v8[3] = &unk_1E20483E8;
  v4 = a1[4];
  v9 = a1[5];
  v12 = a1[6];
  v10 = a1[4];
  v11 = v3;
  v5 = v3;
  objc_msgSend(v4, "performCancelableBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __71__CNUIMapTileGenerator_placemarkForAddress_geocoderProvider_scheduler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__CNUIMapTileGenerator_placemarkForAddress_geocoderProvider_scheduler___block_invoke_5;
  v11[3] = &unk_1E2048370;
  v12 = v5;
  v13 = v6;
  v7 = *(void **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "performCancelableBlock:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "addCancelable:", v10);

}

id __71__CNUIMapTileGenerator_placemarkForAddress_geocoderProvider_scheduler___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  v4 = a1[4];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__CNUIMapTileGenerator_placemarkForAddress_geocoderProvider_scheduler___block_invoke_2;
  v8[3] = &unk_1E20483E8;
  v12 = a1[6];
  v9 = a1[5];
  v10 = a1[4];
  v11 = v3;
  v5 = v3;
  objc_msgSend(v4, "performCancelableBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __71__CNUIMapTileGenerator_placemarkForAddress_geocoderProvider_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __71__CNUIMapTileGenerator_placemarkForAddress_geocoderProvider_scheduler___block_invoke_3;
  v17[3] = &unk_1E204F648;
  v18 = v4;
  v6 = v4;
  objc_msgSend(v3, "addCancelationBlock:", v17);
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNUIMapTileGenerator.m", 93, 7, CFSTR("Geocoding %@…"), v7, v8, v9, v10, *(_QWORD *)(a1 + 32));
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __71__CNUIMapTileGenerator_placemarkForAddress_geocoderProvider_scheduler___block_invoke_4;
  v13[3] = &unk_1E2048398;
  v11 = *(_QWORD *)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  v16 = v3;
  v12 = v3;
  objc_msgSend(v6, "geocodePostalAddress:completionHandler:", v11, v13);

}

void __80__CNUIMapTileGenerator_mapTileImagesForPlacemark_snapshotterProvider_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coordinate");
  v6 = v5;
  v8 = v7;

  v9 = objc_alloc_init((Class)getMKMapSnapshotOptionsClass[0]());
  objc_msgSend(v9, "setRegion:", v6, v8, 0.0075, 0.0075);
  objc_msgSend(v9, "setSize:", 91.0, 91.0);
  v10 = objc_alloc((Class)getMKMapSnapshotFeatureAnnotationClass[0]());
  objc_msgSend(*(id *)(a1 + 32), "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "coordinate");
  v12 = (void *)objc_msgSend(v10, "initWithCoordinate:title:representation:", 0, 1);

  v29[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setCustomFeatureAnnotations:", v13);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __80__CNUIMapTileGenerator_mapTileImagesForPlacemark_snapshotterProvider_scheduler___block_invoke_3;
  v26[3] = &unk_1E2050400;
  v27 = *(id *)(a1 + 40);
  v28 = v14;
  v16 = v14;
  objc_msgSend(v3, "addCancelationBlock:", v26);
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNUIMapTileGenerator.m", 133, 7, CFSTR("Snapshotting %@…"), v17, v18, v19, v20, *(_QWORD *)(a1 + 32));
  v22[0] = v15;
  v22[1] = 3221225472;
  v22[2] = __80__CNUIMapTileGenerator_mapTileImagesForPlacemark_snapshotterProvider_scheduler___block_invoke_5;
  v22[3] = &unk_1E20483C0;
  v23 = *(id *)(a1 + 40);
  v24 = *(id *)(a1 + 48);
  v25 = v3;
  v21 = v3;
  objc_msgSend(v16, "startWithCompletionHandler:", v22);

}

id __28__CNUIMapTileGenerator_init__block_invoke_2(uint64_t a1, void *a2)
{
  Class (__cdecl *v2)();
  id v3;
  void *v4;

  v2 = (Class (__cdecl *)())getMKMapSnapshotterClass[0];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(v2()), "initWithOptions:", v3);

  return v4;
}

id __28__CNUIMapTileGenerator_init__block_invoke()
{
  return objc_alloc_init((Class)getCLGeocoderClass[0]());
}

void __71__CNUIMapTileGenerator_placemarkForAddress_geocoderProvider_scheduler___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  v3 = *(_QWORD *)(a1 + 40);
  if (!v2)
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNUIContactsUIErrorDomain"), 301, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_5:
    v13 = *MEMORY[0x1E0CB3388];
    v14[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("CNUIContactsUIErrorDomain"), 301, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
    objc_msgSend(*(id *)(a1 + 48), "observerDidFailWithError:", v6);

    return;
  }
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNUIMapTileGenerator.m", 98, 7, CFSTR("Geocoding: got placemark %@!"), v7, v8, v9, v10, (uint64_t)v12);
  v11 = (void *)objc_msgSend(objc_alloc((Class)getMKPlacemarkClass[0]()), "initWithPlacemark:", v12);
  objc_msgSend(*(id *)(a1 + 48), "observerDidReceiveResult:", v11);

}

+ (double)defaultTileSize
{
  return 91.0;
}

void __80__CNUIMapTileGenerator_mapTileImagesForPlacemark_snapshotterProvider_scheduler___block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __80__CNUIMapTileGenerator_mapTileImagesForPlacemark_snapshotterProvider_scheduler___block_invoke_4;
  v2[3] = &unk_1E204F648;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "performBlock:", v2);

}

void __80__CNUIMapTileGenerator_mapTileImagesForPlacemark_snapshotterProvider_scheduler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__CNUIMapTileGenerator_mapTileImagesForPlacemark_snapshotterProvider_scheduler___block_invoke_6;
  v11[3] = &unk_1E2048370;
  v12 = v5;
  v13 = v6;
  v7 = *(void **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "performCancelableBlock:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "addCancelable:", v10);

}

void __80__CNUIMapTileGenerator_mapTileImagesForPlacemark_snapshotterProvider_scheduler___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v8;
  void *v10;
  id v11;

  if (*(_QWORD *)(a1 + 32))
    v8 = *(_QWORD *)(a1 + 40) == 0;
  else
    v8 = 0;
  if (v8)
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNUIMapTileGenerator.m", 137, 7, CFSTR("Got a tile image!"), a5, a6, a7, a8, 0);
    v10 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "image");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "observerDidReceiveResult:", v11);

  }
  else
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNUIMapTileGenerator.m", 140, 3, CFSTR("Error generating a snapshot: %@"), a5, a6, a7, a8, *(_QWORD *)(a1 + 40));
  }
}

uint64_t __80__CNUIMapTileGenerator_mapTileImagesForPlacemark_snapshotterProvider_scheduler___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

uint64_t __71__CNUIMapTileGenerator_placemarkForAddress_geocoderProvider_scheduler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelGeocode");
}

@end
