@implementation MPStoreModelMovieMediaClipBuilder

+ (id)allSupportedProperties
{
  MPPropertySet *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MPPropertySet *v7;
  _QWORD v9[4];
  const __CFString *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v2 = [MPPropertySet alloc];
  v12[0] = CFSTR("MPModelPropertyMediaClipPreviewArtwork");
  v12[1] = CFSTR("MPModelPropertyMediaClipTitle");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("MPModelPropertyStaticAssetDuration");
  v9[1] = CFSTR("MPModelPropertyStaticAssetFlavorType");
  v9[2] = CFSTR("MPModelPropertyStaticAssetMediaType");
  v9[3] = CFSTR("MPModelPropertyStaticAssetURL");
  v10 = CFSTR("MPModelRelationshipMediaClipStaticAssets");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MPPropertySet initWithProperties:relationships:](v2, "initWithProperties:relationships:", v3, v6);

  return v7;
}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  return 0;
}

- (id)mediaClipWithStoreItemMetadata:(id)a3 storeItemMovieClip:(id)a4
{
  id v6;
  $F8EE4B9928F98236007347D67FDF2592 *p_requestedClipProperties;
  void *v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  char v16;
  char v17;
  char v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  MPModelMediaClip *v31;
  MPIdentifierSet *v32;
  void *v33;
  uint64_t v34;
  MPIdentifierSet *v35;
  MPModelMediaClip *v36;
  id v38;
  _QWORD v39[5];
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v6 = a4;
  p_requestedClipProperties = &self->_requestedClipProperties;
  if ((*(_BYTE *)&self->_requestedClipProperties & 1) == 0)
  {
    -[MPStoreModelObjectBuilder requestedPropertySet](self, "requestedPropertySet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "properties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "containsObject:", CFSTR("MPModelPropertyMediaClipTitle")))
      v10 = 2;
    else
      v10 = 0;
    *(_BYTE *)p_requestedClipProperties = *(_BYTE *)p_requestedClipProperties & 0xFD | v10;
    if (objc_msgSend(v9, "containsObject:", CFSTR("MPModelPropertyMediaClipPreviewArtwork")))
      v11 = 4;
    else
      v11 = 0;
    *(_BYTE *)p_requestedClipProperties = *(_BYTE *)p_requestedClipProperties & 0xFB | v11;
    objc_msgSend(v8, "relationships");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("MPModelRelationshipMediaClipStaticAssets"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      *(_BYTE *)&self->_requestedClipProperties.staticAssets |= 1u;
      objc_msgSend(v13, "properties");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertyStaticAssetDuration")))
        v15 = 2;
      else
        v15 = 0;
      *(_BYTE *)&self->_requestedClipProperties.staticAssets = *(_BYTE *)&self->_requestedClipProperties.staticAssets & 0xFD | v15;
      if (objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertyStaticAssetURL")))
        v16 = 16;
      else
        v16 = 0;
      *(_BYTE *)&self->_requestedClipProperties.staticAssets = *(_BYTE *)&self->_requestedClipProperties.staticAssets & 0xEF | v16;
      if (objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertyStaticAssetMediaType")))
        v17 = 8;
      else
        v17 = 0;
      *(_BYTE *)&self->_requestedClipProperties.staticAssets = *(_BYTE *)&self->_requestedClipProperties.staticAssets & 0xF7 | v17;
      if (objc_msgSend(v14, "containsObject:", CFSTR("MPModelPropertyStaticAssetFlavorType")))
        v18 = 4;
      else
        v18 = 0;
      *(_BYTE *)&self->_requestedClipProperties.staticAssets = *(_BYTE *)&self->_requestedClipProperties.staticAssets & 0xFB | v18;

    }
    *(_BYTE *)p_requestedClipProperties |= 1u;

  }
  objc_msgSend(v6, "assets");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v23 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v45 != v23)
          objc_enumerationMutation(v19);
        v25 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v25, "url");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          if (!v22)
            v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v19, "count"));
          objc_msgSend(v22, "addObject:", v25);
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v21);
  }
  else
  {
    v22 = 0;
  }
  objc_msgSend(v22, "sortedArrayUsingComparator:", &__block_literal_global_15034);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "firstObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "url");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "absoluteString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v31 = [MPModelMediaClip alloc];
    v32 = [MPIdentifierSet alloc];
    +[MPModelMediaClipKind identityKind](MPModelMediaClipKind, "identityKind");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = MEMORY[0x1E0C809B0];
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke_2;
    v42[3] = &unk_1E3163A58;
    v43 = v30;
    v35 = -[MPIdentifierSet initWithSource:modelKind:block:](v32, "initWithSource:modelKind:block:", CFSTR("StorePlatform"), v33, v42);
    v39[0] = v34;
    v39[1] = 3221225472;
    v39[2] = __87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke_4;
    v39[3] = &unk_1E3156AA0;
    v39[4] = self;
    v40 = v6;
    v41 = v27;
    v36 = -[MPModelObject initWithIdentifiers:block:](v31, "initWithIdentifiers:block:", v35, v39);

  }
  else
  {
    v36 = 0;
  }

  return v36;
}

void __87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke_3;
  v3[3] = &unk_1E3163A30;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "setUniversalStoreIdentifiersWithBlock:", v3);

}

void __87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  char v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  MPModelStaticAsset *v18;
  MPIdentifierSet *v19;
  void *v20;
  MPIdentifierSet *v21;
  MPModelStaticAsset *v22;
  void *v23;
  id obj;
  uint64_t v25;
  _QWORD v26[6];
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_BYTE *)(v4 + 24);
  if ((v5 & 2) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitle:", v6);

    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_BYTE *)(v4 + 24);
  }
  if ((v5 & 4) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "previewArtworkRequestToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke_5;
    v33[3] = &unk_1E3156A50;
    v34 = v7;
    v8 = v7;
    objc_msgSend(v3, "setPreviewArtworkCatalogBlock:", v33);

    v4 = *(_QWORD *)(a1 + 32);
  }
  if ((*(_BYTE *)(v4 + 28) & 1) != 0)
  {
    v23 = v3;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = *(id *)(a1 + 48);
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v9)
    {
      v10 = v9;
      v25 = a1;
      v11 = 0;
      v12 = *(_QWORD *)v30;
      v13 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v15, "url", v23);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "absoluteString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            v18 = [MPModelStaticAsset alloc];
            v19 = [MPIdentifierSet alloc];
            +[MPModelStaticAssetKind identityKind](MPModelStaticAssetKind, "identityKind");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v27[0] = v13;
            v27[1] = 3221225472;
            v27[2] = __87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke_6;
            v27[3] = &unk_1E3163A58;
            v28 = v17;
            v21 = -[MPIdentifierSet initWithSource:modelKind:block:](v19, "initWithSource:modelKind:block:", CFSTR("StorePlatform"), v20, v27);
            v26[0] = v13;
            v26[1] = 3221225472;
            v26[2] = __87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke_8;
            v26[3] = &unk_1E3156A78;
            v26[4] = *(_QWORD *)(v25 + 32);
            v26[5] = v15;
            v22 = -[MPModelObject initWithIdentifiers:block:](v18, "initWithIdentifiers:block:", v21, v26);

            if (!v11)
              v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(v25 + 48), "count"));
            objc_msgSend(v11, "addObject:", v22);

          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }

    v3 = v23;
    objc_msgSend(v23, "setStaticAssets:", v11);

  }
}

MPArtworkCatalog *__87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke_5(uint64_t a1)
{
  MPArtworkCatalog *v2;
  void *v3;
  void *v4;
  MPArtworkCatalog *v5;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = [MPArtworkCatalog alloc];
    v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    +[MPStoreArtworkDataSource sharedStoreArtworkDataSource](MPStoreArtworkDataSource, "sharedStoreArtworkDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MPArtworkCatalog initWithToken:dataSource:](v2, "initWithToken:dataSource:", v3, v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

void __87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke_6(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke_7;
  v3[3] = &unk_1E3163A30;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "setUniversalStoreIdentifiersWithBlock:", v3);

}

void __87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke_8(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v3 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 28);
  if ((v3 & 2) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "duration");
    objc_msgSend(v7, "setDuration:");
    v3 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 28);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 0x10) == 0)
        goto LABEL_4;
LABEL_8:
      objc_msgSend(*(id *)(a1 + 40), "url");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setUrl:", v4);

      if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) & 4) == 0)
        goto LABEL_13;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v7, "setMediaType:", 2);
  v3 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 28);
  if ((v3 & 0x10) != 0)
    goto LABEL_8;
LABEL_4:
  if ((v3 & 4) == 0)
    goto LABEL_13;
LABEL_9:
  objc_msgSend(*(id *)(a1 + 40), "flavor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", MPStoreItemMovieClipAssetFlavorSD480PVideo) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", MPStoreItemMovieClipAssetFlavorSDVideo) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", MPStoreItemMovieClipAssetFlavorHD720PVideo) & 1) != 0)
  {
    v6 = 2;
  }
  else if (objc_msgSend(v5, "isEqualToString:", MPStoreItemMovieClipAssetFlavorHD1080PVideo))
  {
    v6 = 3;
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v7, "setFlavorType:", v6);

LABEL_13:
}

uint64_t __87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInformalStaticAssetID:", *(_QWORD *)(a1 + 32));
}

uint64_t __87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInformalMediaClipID:", *(_QWORD *)(a1 + 32));
}

uint64_t __87__MPStoreModelMovieMediaClipBuilder_mediaClipWithStoreItemMetadata_storeItemMovieClip___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);

  return v9;
}

@end
