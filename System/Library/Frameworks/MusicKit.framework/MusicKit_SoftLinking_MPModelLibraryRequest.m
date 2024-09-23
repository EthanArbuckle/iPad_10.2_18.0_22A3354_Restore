@implementation MusicKit_SoftLinking_MPModelLibraryRequest

- (void)performWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if ((MRMediaRemoteIsMusicAppInstalled() & 1) != 0)
  {
    -[MusicKit_SoftLinking_MPModelRequest _underlyingRequest](self, "_underlyingRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __75__MusicKit_SoftLinking_MPModelLibraryRequest_performWithCompletionHandler___block_invoke;
    v7[3] = &unk_24CD1D048;
    v8 = v4;
    objc_msgSend(v5, "performWithResponseHandler:", v7);

  }
  else
  {
    MusicKit_Logging_Library();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MusicKit_SoftLinking_MPModelLibraryRequest performWithCompletionHandler:].cold.1(v6);

    objc_msgSend(MEMORY[0x24BDD1540], "musicKit_defaultLibraryError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionFilterText, 0);
  objc_storeStrong((id *)&self->_itemFilterText, 0);
  objc_storeStrong((id *)&self->_sectionSortDescriptors, 0);
  objc_storeStrong((id *)&self->_itemSortDescriptors, 0);
  objc_storeStrong((id *)&self->_scopedContainers, 0);
  objc_storeStrong((id *)&self->_allowedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_allowedItemIdentifiers, 0);
}

- (MusicKit_SoftLinking_MPModelLibraryRequest)initWithLegacyModelObjectType:(int64_t)a3 sectionLegacyModelObjectType:(int64_t)a4 itemKind:(id)a5 sectionKind:(id)a6 allowedItemIdentifiers:(id)a7 allowedSectionIdentifiers:(id)a8 allowedItemIdentifierSets:(id)a9 allowedSectionIdentifierSets:(id)a10 scopedContainers:(id)a11 itemSortDescriptors:(id)a12 sectionSortDescriptors:(id)a13 itemFilterText:(id)a14 sectionFilterText:(id)a15 itemPropertyFilters:(id)a16 sectionPropertyFilters:(id)a17 range:(_NSRange)a18 filteringOptions:(id)a19 mediaLibrary:(id)a20
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  MusicKit_SoftLinking_MPModelLibraryRequest *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  int64_t v39;
  NSUInteger length;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64x2_t v60;
  int8x16_t v61;
  id *v62;
  void *v63;
  MusicKit_SoftLinking_MPModelLibraryRequest *v64;
  uint64_t v65;
  NSArray *scopedContainers;
  uint64_t v67;
  NSArray *itemSortDescriptors;
  uint64_t v69;
  NSArray *sectionSortDescriptors;
  uint64_t v71;
  NSString *itemFilterText;
  uint64_t v73;
  NSString *sectionFilterText;
  void *v76;
  void *v77;
  id obj;
  id obja;
  id v80;
  id v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v88;
  void *v89;
  void *v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  void *v97;
  objc_super v98;
  _QWORD v99[4];
  id v100;
  int64_t v101;
  _QWORD v102[4];
  id v103;
  int64_t v104;

  v92 = a5;
  v23 = a6;
  obj = a7;
  v96 = a7;
  v80 = a8;
  v95 = a8;
  v24 = a11;
  v82 = a12;
  v93 = a13;
  v25 = a14;
  v94 = a15;
  v26 = a20;
  v27 = a17;
  v28 = a16;
  v29 = a10;
  v30 = a9;
  v31 = objc_alloc_init((Class)getMPModelLibraryRequestClass());
  v89 = v23;
  v83 = v28;
  v84 = v27;
  v97 = v25;
  if (v23)
    objc_msgSend(v23, "_underlyingKind", obj, v80);
  else
    +[MusicKit_SoftLinking_MPModelKind _modelKindForModelObjectType:](MusicKit_SoftLinking_MPModelKind, "_modelKindForModelObjectType:", a4, obj, v80);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[MusicKit_SoftLinking_MPModelKind _sanitizeKind:](MusicKit_SoftLinking_MPModelKind, "_sanitizeKind:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setSectionKind:", v33);

  v34 = self;
  objc_msgSend((id)objc_opt_class(), "_supportedPropertiesForModelObjectType:", a4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setSectionProperties:", v35);

  objc_msgSend(v31, "setSectionSortDescriptors:", v93);
  objc_msgSend(v31, "setSectionFilterText:", v94);
  v102[0] = MEMORY[0x24BDAC760];
  v102[1] = 3221225472;
  v102[2] = __402__MusicKit_SoftLinking_MPModelLibraryRequest_initWithLegacyModelObjectType_sectionLegacyModelObjectType_itemKind_sectionKind_allowedItemIdentifiers_allowedSectionIdentifiers_allowedItemIdentifierSets_allowedSectionIdentifierSets_scopedContainers_itemSortDescriptors_sectionSortDescriptors_itemFilterText_sectionFilterText_itemPropertyFilters_sectionPropertyFilters_range_filteringOptions_mediaLibrary___block_invoke;
  v102[3] = &unk_24CD1CFC0;
  v104 = a4;
  v36 = v26;
  v103 = v36;
  objc_msgSend(v95, "msv_map:", v102);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "mutableCopy");

  objc_msgSend(v38, "addObjectsFromArray:", v29);
  objc_msgSend(v31, "setAllowedSectionIdentifiers:", v38);
  v85 = v38;
  if (a4 == 19)
  {
    v41 = v24;
    if (objc_msgSend(v24, "count"))
      objc_msgSend(v31, "setSectionKind:", 0);
    objc_msgSend(v92, "_underlyingKind");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    +[MusicKit_SoftLinking_MPModelKind _sanitizeKind:](MusicKit_SoftLinking_MPModelKind, "_sanitizeKind:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setItemKind:", v47);

    v34 = self;
    goto LABEL_15;
  }
  if (a4 != 15)
  {
    v41 = v24;
    objc_msgSend(v92, "_underlyingKind");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    +[MusicKit_SoftLinking_MPModelKind _sanitizeKind:](MusicKit_SoftLinking_MPModelKind, "_sanitizeKind:", v46);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setItemKind:", v48);

LABEL_15:
    objc_msgSend((id)objc_opt_class(), "_supportedPropertiesForModelObjectType:", a3);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setItemProperties:", v49);

    v39 = a3;
    v43 = v82;
    length = a18.length;
    goto LABEL_25;
  }
  v39 = a3;
  length = a18.length;
  if (a3 > 25)
  {
    if (a3 == 26)
    {
      v41 = v24;
      +[MusicKit_SoftLinking_MPModelKind _defaultPlaylistEntryKindForSongs](MusicKit_SoftLinking_MPModelKind, "_defaultPlaylistEntryKindForSongs");
      v50 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 != 30)
        goto LABEL_28;
      v41 = v24;
      +[MusicKit_SoftLinking_MPModelKind _defaultPlaylistEntryKindForTracks](MusicKit_SoftLinking_MPModelKind, "_defaultPlaylistEntryKindForTracks");
      v50 = objc_claimAutoreleasedReturnValue();
    }
    v51 = (void *)v50;
    +[MusicKit_SoftLinking_MPModelKind _sanitizeKind:](MusicKit_SoftLinking_MPModelKind, "_sanitizeKind:", v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setItemKind:", v52);

    v39 = a3;
LABEL_22:
    v43 = v82;

    goto LABEL_23;
  }
  if (a3 == 14)
  {
    v41 = v24;
    +[MusicKit_SoftLinking_MPModelKind _defaultPlaylistEntryKindForMusicVideos](MusicKit_SoftLinking_MPModelKind, "_defaultPlaylistEntryKindForMusicVideos");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setItemKind:", v51);
    goto LABEL_22;
  }
  if (a3 != 19)
  {
LABEL_28:
    v41 = v24;
    objc_msgSend(v92, "_underlyingKind");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    +[MusicKit_SoftLinking_MPModelKind _sanitizeKind:](MusicKit_SoftLinking_MPModelKind, "_sanitizeKind:", v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setItemKind:", v77);

    v39 = a3;
    v43 = v82;
    if ((unint64_t)a3 > 0x23 || ((1 << a3) & 0xC80002000) == 0)
      goto LABEL_10;
LABEL_23:
    v34 = self;
    v44 = (void *)objc_opt_class();
    v45 = 17;
    goto LABEL_24;
  }
  v41 = v24;
  objc_msgSend(v31, "setSectionKind:", 0);
  objc_msgSend(v92, "_underlyingKind");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setItemKind:", v42);

  v43 = v82;
LABEL_10:
  v34 = self;
  v44 = (void *)objc_opt_class();
  v45 = v39;
LABEL_24:
  objc_msgSend(v44, "_supportedPropertiesForModelObjectType:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setItemProperties:", v46);
LABEL_25:

  v91 = v41;
  objc_msgSend(v41, "msv_map:", &__block_literal_global_2);
  v53 = objc_claimAutoreleasedReturnValue();
  v99[0] = MEMORY[0x24BDAC760];
  v99[1] = 3221225472;
  v99[2] = __402__MusicKit_SoftLinking_MPModelLibraryRequest_initWithLegacyModelObjectType_sectionLegacyModelObjectType_itemKind_sectionKind_allowedItemIdentifiers_allowedSectionIdentifiers_allowedItemIdentifierSets_allowedSectionIdentifierSets_scopedContainers_itemSortDescriptors_sectionSortDescriptors_itemFilterText_sectionFilterText_itemPropertyFilters_sectionPropertyFilters_range_filteringOptions_mediaLibrary___block_invoke_3;
  v99[3] = &unk_24CD1CFC0;
  v101 = v39;
  v54 = v36;
  v100 = v54;
  objc_msgSend(v96, "msv_map:", v99);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)objc_msgSend(v55, "mutableCopy");

  objc_msgSend(v56, "addObjectsFromArray:", v30);
  objc_msgSend(v31, "setItemSortDescriptors:", v43);
  objc_msgSend(v31, "setFilterText:", v97);
  objc_msgSend(v31, "setAllowedItemIdentifiers:", v56);
  v88 = (void *)v53;
  objc_msgSend(v31, "setScopedContainers:", v53);
  objc_msgSend(v31, "setContentRange:", a18.location, length);
  objc_msgSend(v31, "setWantsDetailedKeepLocalRequestableResponse:", (*(unint64_t *)&a19 >> 8) & 1);
  objc_msgSend(v54, "_underlyingMediaLibrary");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setMediaLibrary:", v57);

  objc_msgSend(v83, "msv_map:", &__block_literal_global_4);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v84, "msv_map:", &__block_literal_global_5);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "setItemPropertyFilters:", v58);
  objc_msgSend(v31, "setSectionPropertyFilters:", v59);
  v60 = (uint64x2_t)vdupq_n_s64(*(_QWORD *)&a19);
  v61 = vorrq_s8(vandq_s8((int8x16_t)vshlq_u64(v60, (uint64x2_t)xmmword_212060FE0), (int8x16_t)xmmword_212061010), vandq_s8((int8x16_t)vshlq_u64(v60, (uint64x2_t)xmmword_212060FF0), (int8x16_t)xmmword_212061000));
  objc_msgSend(v31, "setFilteringOptions:", *(_QWORD *)&vorr_s8(*(int8x8_t *)v61.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v61, v61, 8uLL)) | (2 * a19.var0) | (*(unint64_t *)&a19 >> 9) & 0x800000 | (*(unint64_t *)&a19 >> 16) & 0x1000000);
  v98.receiver = v34;
  v98.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryRequest;
  v62 = -[MusicKit_SoftLinking_MPModelRequest _initWithUnderlyingRequest:](&v98, sel__initWithUnderlyingRequest_, v31);
  v63 = v43;
  v64 = (MusicKit_SoftLinking_MPModelLibraryRequest *)v62;
  if (v62)
  {
    objc_storeStrong(v62 + 3, obja);
    objc_storeStrong((id *)&v64->_allowedSectionIdentifiers, v81);
    v65 = objc_msgSend(v91, "copy");
    scopedContainers = v64->_scopedContainers;
    v64->_scopedContainers = (NSArray *)v65;

    v67 = objc_msgSend(v63, "copy");
    itemSortDescriptors = v64->_itemSortDescriptors;
    v64->_itemSortDescriptors = (NSArray *)v67;

    v69 = objc_msgSend(v93, "copy");
    sectionSortDescriptors = v64->_sectionSortDescriptors;
    v64->_sectionSortDescriptors = (NSArray *)v69;

    v71 = objc_msgSend(v97, "copy");
    itemFilterText = v64->_itemFilterText;
    v64->_itemFilterText = (NSString *)v71;

    v73 = objc_msgSend(v94, "copy");
    sectionFilterText = v64->_sectionFilterText;
    v64->_sectionFilterText = (NSString *)v73;

    v64->_range = a18;
    v64->_wantsDetailedKeepLocalRequestableResponse = (unsigned __int16)(*(_WORD *)&a19.var0 & 0x100) >> 8;
  }

  return v64;
}

- (MusicKit_SoftLinking_MPModelLibraryRequest)initWithLegacyModelObjectType:(int64_t)a3 itemKind:(id)a4 allowedItemIdentifiers:(id)a5 allowedItemIdentifierSets:(id)a6 itemSortDescriptors:(id)a7 itemFilterText:(id)a8 itemPropertyFilters:(id)a9 range:(_NSRange)a10 filteringOptions:(id)a11 mediaLibrary:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64x2_t v30;
  int8x16_t v31;
  id *v32;
  MusicKit_SoftLinking_MPModelLibraryRequest *v33;
  uint64_t v34;
  NSArray *itemSortDescriptors;
  id v38;
  id v39;
  id v40;
  id v42;
  objc_super v43;
  _QWORD v44[4];
  id v45;
  int64_t v46;

  v17 = a5;
  v38 = a8;
  v39 = a7;
  v40 = a8;
  v18 = a12;
  v42 = a9;
  v19 = a6;
  v20 = a4;
  v21 = objc_alloc_init((Class)getMPModelLibraryRequestClass());
  objc_msgSend(v21, "setSectionKind:", 0);
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __225__MusicKit_SoftLinking_MPModelLibraryRequest_initWithLegacyModelObjectType_itemKind_allowedItemIdentifiers_allowedItemIdentifierSets_itemSortDescriptors_itemFilterText_itemPropertyFilters_range_filteringOptions_mediaLibrary___block_invoke;
  v44[3] = &unk_24CD1CFC0;
  v46 = a3;
  v22 = v18;
  v45 = v22;
  objc_msgSend(v17, "msv_map:", v44);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "mutableCopy");

  objc_msgSend(v24, "addObjectsFromArray:", v19);
  objc_msgSend(v20, "_underlyingKind");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  +[MusicKit_SoftLinking_MPModelKind _sanitizeKind:](MusicKit_SoftLinking_MPModelKind, "_sanitizeKind:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setItemKind:", v26);

  objc_msgSend((id)objc_opt_class(), "_supportedPropertiesForModelObjectType:", a3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setItemProperties:", v27);

  objc_msgSend(v21, "setItemSortDescriptors:", v39);
  objc_msgSend(v21, "setFilterText:", v40);
  objc_msgSend(v21, "setAllowedItemIdentifiers:", v24);
  objc_msgSend(v21, "setContentRange:", a10.location, a10.length);
  objc_msgSend(v21, "setWantsDetailedKeepLocalRequestableResponse:", (*(unint64_t *)&a11 >> 8) & 1);
  objc_msgSend(v22, "_underlyingMediaLibrary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setMediaLibrary:", v28);

  objc_msgSend(v42, "msv_map:", &__block_literal_global_6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setItemPropertyFilters:", v29);
  v30 = (uint64x2_t)vdupq_n_s64(*(_QWORD *)&a11);
  v31 = vorrq_s8(vandq_s8((int8x16_t)vshlq_u64(v30, (uint64x2_t)xmmword_212060FE0), (int8x16_t)xmmword_212061010), vandq_s8((int8x16_t)vshlq_u64(v30, (uint64x2_t)xmmword_212060FF0), (int8x16_t)xmmword_212061000));
  objc_msgSend(v21, "setFilteringOptions:", *(_QWORD *)&vorr_s8(*(int8x8_t *)v31.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v31, v31, 8uLL)) | (2 * a11.var0) | (*(unint64_t *)&a11 >> 9) & 0x800000 | (*(unint64_t *)&a11 >> 16) & 0x1000000);
  v43.receiver = self;
  v43.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryRequest;
  v32 = -[MusicKit_SoftLinking_MPModelRequest _initWithUnderlyingRequest:](&v43, sel__initWithUnderlyingRequest_, v21);
  v33 = (MusicKit_SoftLinking_MPModelLibraryRequest *)v32;
  if (v32)
  {
    objc_storeStrong(v32 + 3, a5);
    v34 = objc_msgSend(v39, "copy");
    itemSortDescriptors = v33->_itemSortDescriptors;
    v33->_itemSortDescriptors = (NSArray *)v34;

    objc_storeStrong((id *)&v33->_itemFilterText, v38);
    v33->_range = a10;
    v33->_wantsDetailedKeepLocalRequestableResponse = (unsigned __int16)(*(_WORD *)&a11.var0 & 0x100) >> 8;
  }

  return v33;
}

- (MusicKit_SoftLinking_MPModelLibraryRequest)initWithLegacyModelObject:(id)a3 itemType:(int64_t)a4 properties:(id)a5 relationships:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  MusicKit_SoftLinking_MPModelLibraryRequest *v22;
  objc_super v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = objc_alloc_init((Class)getMPModelLibraryRequestClass());
  objc_msgSend(v13, "setSectionKind:", 0);
  +[MusicKit_SoftLinking_MPModelKind _modelKindForModelObjectType:](MusicKit_SoftLinking_MPModelKind, "_modelKindForModelObjectType:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setItemKind:", v14);

  objc_msgSend(v10, "_underlyingModelObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setAllowedItemIdentifiers:", v17);
  +[MusicKit_SoftLinking_MPModelRequest _propertySetForRawProperties:relationships:](MusicKit_SoftLinking_MPModelRequest, "_propertySetForRawProperties:relationships:", v11, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setItemProperties:", v18);

  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v19 = (void *)getMPMediaLibraryClass_softClass;
  v29 = getMPMediaLibraryClass_softClass;
  if (!getMPMediaLibraryClass_softClass)
  {
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __getMPMediaLibraryClass_block_invoke;
    v25[3] = &unk_24CD1CC68;
    v25[4] = &v26;
    __getMPMediaLibraryClass_block_invoke((uint64_t)v25);
    v19 = (void *)v27[3];
  }
  v20 = objc_retainAutorelease(v19);
  _Block_object_dispose(&v26, 8);
  objc_msgSend(v20, "deviceMediaLibrary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMediaLibrary:", v21);

  v24.receiver = self;
  v24.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryRequest;
  v22 = -[MusicKit_SoftLinking_MPModelRequest _initWithUnderlyingRequest:](&v24, sel__initWithUnderlyingRequest_, v13);

  return v22;
}

- (NSArray)allowedItemIdentifiers
{
  return self->_allowedItemIdentifiers;
}

- (void)setAllowedItemIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)allowedSectionIdentifiers
{
  return self->_allowedSectionIdentifiers;
}

- (void)setAllowedSectionIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)scopedContainers
{
  return self->_scopedContainers;
}

- (void)setScopedContainers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)itemSortDescriptors
{
  return self->_itemSortDescriptors;
}

- (void)setItemSortDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)sectionSortDescriptors
{
  return self->_sectionSortDescriptors;
}

- (void)setSectionSortDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)itemFilterText
{
  return self->_itemFilterText;
}

- (void)setItemFilterText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)sectionFilterText
{
  return self->_sectionFilterText;
}

- (void)setSectionFilterText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (_NSRange)range
{
  _NSRange *p_range;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_range = &self->_range;
  location = self->_range.location;
  length = p_range->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (BOOL)wantsDetailedKeepLocalRequestableResponse
{
  return self->_wantsDetailedKeepLocalRequestableResponse;
}

- (void)setWantsDetailedKeepLocalRequestableResponse:(BOOL)a3
{
  self->_wantsDetailedKeepLocalRequestableResponse = a3;
}

- (void)setUnderlyingRequest:(id)a3
{
  self->_underlyingRequest = a3;
}

- (void)performWithCompletionHandler:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_211B26000, log, OS_LOG_TYPE_ERROR, "Failed to perform MusicKit library request because the Music application is not installed.", v1, 2u);
}

@end
