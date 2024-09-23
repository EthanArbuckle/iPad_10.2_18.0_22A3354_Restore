@implementation MKURLSerializer

- (id)urlForOpeningMapItems:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v5, "count"));
  if (v7)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "containsObject:", v13) & 1) == 0)
      {
        objc_msgSend(v9, "addObject:", v13);
        if (v11 & 1 | ((objc_msgSend(v13, "isCurrentLocation") & 1) == 0))
        {
          objc_msgSend(v13, "place");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v13, "place");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v15);

          }
        }
        else
        {
          v11 = 1;
          v12 = v10;
        }
      }

      ++v10;
    }
    while (v7 != v10);
    if (v6)
      goto LABEL_10;
  }
  else
  {
    v12 = 0;
    v11 = 0;
    if (v6)
    {
LABEL_10:
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27660]), "initWithLaunchOptions:", v6);
      goto LABEL_13;
    }
  }
  v16 = 0;
LABEL_13:
  if ((v11 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0D27330], "_urlToShowCurrentLocationAndPlaces:currentLocationIndex:options:", v8, v12, v16);
  else
    objc_msgSend(MEMORY[0x1E0D27330], "_urlToShowPlaces:options:", v8, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)urlForDirectionsFromMapItem:(id)a3 toMapItem:(id)a4 transportType:(unint64_t)a5 options:(id)a6
{
  id v10;
  id v11;
  objc_class *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v10 = a3;
  v11 = a4;
  v12 = (objc_class *)MEMORY[0x1E0C99DE8];
  v13 = a6;
  v14 = (void *)objc_msgSend([v12 alloc], "initWithCapacity:", 2);
  v15 = v14;
  if (v10)
    objc_msgSend(v14, "addObject:", v10);
  if (v11)
    objc_msgSend(v15, "addObject:", v11);
  v16 = (void *)objc_msgSend(v15, "copy");
  -[MKURLSerializer urlForDirectionsWithMapItems:transportType:options:](self, "urlForDirectionsWithMapItems:transportType:options:", v16, a5, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)urlForDirectionsWithMapItems:(id)a3 transportType:(unint64_t)a4 options:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __70__MKURLSerializer_urlForDirectionsWithMapItems_transportType_options___block_invoke;
    v27[3] = &unk_1E20DEEB0;
    v10 = v7;
    v28 = v10;
    v29 = &v30;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v27);
    if (*((_BYTE *)v31 + 24))
    {
      v9 = 0;
LABEL_29:

      _Block_object_dispose(&v30, 8);
      goto LABEL_30;
    }
    if (v8)
      v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D27660]), "initWithLaunchOptions:", v8);
    else
      v11 = 0;
    if (a4 - 1 > 7)
    {
      v12 = 4;
      if (!v11)
LABEL_12:
        v11 = objc_alloc_init(MEMORY[0x1E0D27660]);
    }
    else
    {
      v12 = dword_18B2AF594[a4 - 1];
      if (!v11)
        goto LABEL_12;
    }
    if ((objc_msgSend(v11, "hasTransportType") & 1) == 0)
      objc_msgSend(v11, "setTransportType:", v12);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
    v22 = v11;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (objc_msgSend(v18, "isCurrentLocation"))
          {
            objc_msgSend(MEMORY[0x1E0D27330], "_urlRepresentationForCurrentLocation");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v19);
          }
          else
          {
            objc_msgSend(v18, "place");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v20)
            {

              v9 = 0;
              goto LABEL_28;
            }
            objc_msgSend(v18, "place");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v19);
          }

        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
        if (v15)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x1E0D27330], "_urlForDirectionsWithWaypoints:options:", v13, v22);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:

    goto LABEL_29;
  }
  v9 = 0;
LABEL_30:

  return v9;
}

void __70__MKURLSerializer_urlForDirectionsWithMapItems_transportType_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  if (a3)
  {
    v6 = *(void **)(a1 + 32);
    v7 = a3 - 1;
    v8 = a2;
    objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v8, "_isEquivalentURLRepresentationTo:");

    if ((_DWORD)v6)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }

  }
}

- (id)mapItemsFromUrl:(id)a3 options:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  MKMapItem *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  MKMapItem *v24;
  id *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  id v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v43 = 0;
  v44 = 0;
  objc_msgSend(MEMORY[0x1E0D271F8], "mapItemsFromURL:currentLocationIndices:options:", v5, &v44, &v43);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v44;
  v8 = v43;
  if (v6)
  {
    v27 = v5;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count") + 1);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v40 != v13)
            objc_enumerationMutation(v10);
          v15 = -[MKMapItem initWithGeoMapItem:isPlaceHolderPlace:]([MKMapItem alloc], "initWithGeoMapItem:isPlaceHolderPlace:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i), 0);
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      }
      while (v12);
    }

    if (objc_msgSend(v7, "count"))
    {
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __43__MKURLSerializer_mapItemsFromUrl_options___block_invoke;
      v37[3] = &unk_1E20DEED8;
      v38 = v9;
      objc_msgSend(v7, "enumerateIndexesUsingBlock:", v37);

    }
    v5 = v27;
    if (a4)
    {
      objc_msgSend(v8, "launchOptions");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v7;
    v17 = v8;
  }
  else
  {
    v35 = v8;
    v36 = v7;
    objc_msgSend(MEMORY[0x1E0D27330], "_placesFromURL:currentLocationIndices:options:", v5, &v36, &v35);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v36;

    v17 = v35;
    if (v18)
    {
      v26 = a4;
      v28 = v5;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v18, "count") + 1);
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v19 = v18;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v32;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v32 != v22)
              objc_enumerationMutation(v19);
            v24 = -[MKMapItem initWithPlace:]([MKMapItem alloc], "initWithPlace:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j));
            objc_msgSend(v9, "addObject:", v24);

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
        }
        while (v21);
      }

      if (objc_msgSend(v16, "count"))
      {
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __43__MKURLSerializer_mapItemsFromUrl_options___block_invoke_2;
        v29[3] = &unk_1E20DEED8;
        v30 = v9;
        objc_msgSend(v16, "enumerateIndexesUsingBlock:", v29);

      }
      if (v26)
      {
        objc_msgSend(v17, "launchOptions");
        *v26 = (id)objc_claimAutoreleasedReturnValue();
      }
      v5 = v28;
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

void __43__MKURLSerializer_mapItemsFromUrl_options___block_invoke(uint64_t a1, unint64_t a2, _BYTE *a3)
{
  void *v6;
  id v7;

  if (objc_msgSend(*(id *)(a1 + 32), "count") >= a2)
  {
    v6 = *(void **)(a1 + 32);
    +[MKMapItem mapItemForCurrentLocation](MKMapItem, "mapItemForCurrentLocation");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertObject:atIndex:", v7, a2);

  }
  else
  {
    *a3 = 1;
  }
}

void __43__MKURLSerializer_mapItemsFromUrl_options___block_invoke_2(uint64_t a1, unint64_t a2, _BYTE *a3)
{
  void *v6;
  id v7;

  if (objc_msgSend(*(id *)(a1 + 32), "count") >= a2)
  {
    v6 = *(void **)(a1 + 32);
    +[MKMapItem mapItemForCurrentLocation](MKMapItem, "mapItemForCurrentLocation");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertObject:atIndex:", v7, a2);

  }
  else
  {
    *a3 = 1;
  }
}

+ (id)stringForMapType:(unint64_t)a3
{
  id result;
  __CFString *v4;

  result = CFSTR("k");
  switch(a3)
  {
    case 1uLL:
    case 3uLL:
      return result;
    case 2uLL:
    case 4uLL:
      result = CFSTR("h");
      break;
    default:
      v4 = CFSTR("r");
      if (a3 != 104)
        v4 = CFSTR("m");
      if (a3 == 101)
        result = CFSTR("t");
      else
        result = v4;
      break;
  }
  return result;
}

+ (id)stringForDirectionsType:(unint64_t)a3
{
  if (a3 - 1 > 7)
    return CFSTR("p");
  else
    return off_1E20DEF18[a3 - 1];
}

@end
