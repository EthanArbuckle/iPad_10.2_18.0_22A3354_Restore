@implementation ML3Container

+ (void)initialize
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[8];

  v26[6] = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() == a1)
  {
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("cloud_is_subscribed"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v2;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("(container.smart_is_folder = 0)"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v3;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("(container.smart_is_genius = 0)"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v4;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("(container.smart_criteria IS NULL)"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v26[3] = v5;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("name_order"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v26[4] = v6;
    +[ML3OrderingTerm orderingTermWithProperty:](ML3OrderingTerm, "orderingTermWithProperty:", CFSTR("container_pid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26[5] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 6);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)ML3ContainerDefaultOrderingTerms;
    ML3ContainerDefaultOrderingTerms = v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", &unk_1E5BAA668, CFSTR("(IFNULL(container.workout_template_id, 0) != 0)"), &unk_1E5BAA680, CFSTR("(container.distinguished_kind = 17)"), &unk_1E5BAA698, CFSTR("(container.distinguished_kind = 32)"), &unk_1E5BAA6B0, CFSTR("((IFNULL(container.smart_is_genius, 0) << 2) | ((container.smart_criteria IS NOT NULL) << 1) | IFNULL(container.is_saveable, 0))"), &unk_1E5BAA6C8, CFSTR("(container.is_container_type_active_target AND container.smart_is_genius)"), &unk_1E5BAA6E0, CFSTR("(container.is_container_type_active_target AND (container.container_type = 2))"), &unk_1E5BAA6F8, CFSTR("(container.distinguished_kind = 19 OR container.distinguished_kind = 20)"), &unk_1E5BAA710, CFSTR("(container.distinguished_kind = 20 AND container.is_container_type_active_target)"), &unk_1E5BAA728,
            CFSTR("(container.distinguished_kind = 71)"),
            &unk_1E5BAA740,
            CFSTR("(container.distinguished_kind = 10000 AND container.is_container_type_active_target)"),
            &unk_1E5BAA758,
            CFSTR("(container.distinguished_kind = 10010 AND container.is_container_type_active_target)"),
            &unk_1E5BAA770,
            CFSTR("(is_src_remote = 0 OR container.distinguished_kind = 0)"),
            &unk_1E5BAA788,
            CFSTR("((container.smart_criteria IS NOT NULL) AND (container.smart_is_dynamic = 1) AND (container.smart_is_limited = 1))"),
            &unk_1E5BAA7A0,
            CFSTR("(container.smart_criteria IS NULL)"),
            &unk_1E5BAA7B8,
            CFSTR("(container.smart_is_genius = 0)"),
            &unk_1E5BAA7D0,
            CFSTR("(container.smart_is_folder = 0)"),
            &unk_1E5BAA7E8,
            CFSTR("(container.distinguished_kind = 0 AND container.is_hidden = 0 AND container.smart_criteria IS NULL AND container.smart_is_genius = 0 AND (container.cloud_is_subscribed = 0 OR container.is_editable = 1))"),
            &unk_1E5BAA800,
            CFSTR("(container.is_src_remote = 1)"),
            &unk_1E5BAA818,
            CFSTR("container_seed.item_pid"),
            &unk_1E5BAA830,
            CFSTR("(IFNULL(container_item.container_pid, 0) != 0 OR smart_criteria IS NOT NULL)"),
            &unk_1E5BAA848,
            CFSTR("best_artwork_token.available_artwork_token AS available_container_artwork_token"),
            &unk_1E5BAA860,
            CFSTR("best_artwork_token.fetchable_artwork_token AS fetchable_item_artwork_token"),
            &unk_1E5BAA878,
            CFSTR("best_artwork_token.fetchable_artwork_source_type AS fetchable_item_artwork_source_type"),
            0);
    v11 = (void *)ML3ContainerJoinsForProperties;
    ML3ContainerJoinsForProperties = v10;

    v12 = objc_alloc_init(MEMORY[0x1E0C99D80]);
    v13 = (void *)ML3ContainerSectionPropertyForProperties;
    ML3ContainerSectionPropertyForProperties = (uint64_t)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("container_seed"), CFSTR("container_seed.item_pid"), CFSTR("best_artwork_token"), CFSTR("best_artwork_token.available_artwork_token AS available_container_artwork_token"), CFSTR("best_artwork_token"), CFSTR("best_artwork_token.fetchable_artwork_token AS fetchable_item_artwork_token"), CFSTR("best_artwork_token"), CFSTR("best_artwork_token.fetchable_artwork_source_type AS fetchable_item_artwork_source_type"), 0);
    v15 = (void *)ML3ContainerForeignDatabaseTableForProperties;
    ML3ContainerForeignDatabaseTableForProperties = v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("item_pid"), CFSTR("container_seed.item_pid"), CFSTR("available_artwork_token"), CFSTR("best_artwork_token.available_artwork_token AS available_container_artwork_token"), CFSTR("fetchable_artwork_token"), CFSTR("best_artwork_token.fetchable_artwork_token AS fetchable_item_artwork_token"), CFSTR("fetchable_artwork_source_type"), CFSTR("best_artwork_token.fetchable_artwork_source_type AS fetchable_item_artwork_source_type"), 0);
    v17 = (void *)ML3ContainerForeignColumnForProperties;
    ML3ContainerForeignColumnForProperties = v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("container_seed"), 0);
    v19 = (void *)ML3ContainerExtraTablesToDelete;
    ML3ContainerExtraTablesToDelete = v18;

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("container_pid"), CFSTR("container_seed"), 0);
    v21 = (void *)ML3ContainerPersistentIDForTable;
    ML3ContainerPersistentIDForTable = v20;

    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("play_count_user"), CFSTR("play_count_recent"), CFSTR("date_played"), CFSTR("date_modified"), CFSTR("liked_state"), CFSTR("keep_local"), CFSTR("keep_local_status"), CFSTR("keep_local_status_reason"), CFSTR("keep_local_constraints"), CFSTR("cloud_user_count"), CFSTR("cloud_global_like_count"), CFSTR("cloud_global_play_count"), CFSTR("date_played_local"), CFSTR("liked_state_changed_date"), 0);
    v23 = (void *)ML3ContainerContentsUnchangingProperties;
    ML3ContainerContentsUnchangingProperties = v22;

    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("play_count_user"), CFSTR("play_count_recent"), 0);
    v25 = (void *)ML3ContainerNoAssistantSyncProperties;
    ML3ContainerNoAssistantSyncProperties = v24;

    bzero(&TrackFieldToML3Info, 0xB80uLL);
    qword_1ED077AA0 = (uint64_t)CFSTR("item_extra.title");
    unk_1ED077AA8 = StringPredicateForCriteriaInfo;
    qword_1ED077AB0 = (uint64_t)CFSTR("album.album");
    unk_1ED077AB8 = StringPredicateForCriteriaInfo;
    qword_1ED077AC0 = (uint64_t)CFSTR("item_artist.item_artist");
    unk_1ED077AC8 = StringPredicateForCriteriaInfo;
    qword_1ED077AD0 = (uint64_t)CFSTR("item_playback.bit_rate");
    unk_1ED077AD8 = NumericPredicateForCriteriaInfo;
    qword_1ED077AE0 = (uint64_t)CFSTR("item_playback.sample_rate");
    unk_1ED077AE8 = NumericPredicateForCriteriaInfo;
    qword_1ED077AF0 = (uint64_t)CFSTR("item_extra.year");
    unk_1ED077AF8 = NumericPredicateForCriteriaInfo;
    qword_1ED077B00 = (uint64_t)CFSTR("genre.genre");
    unk_1ED077B08 = StringPredicateForCriteriaInfo;
    qword_1ED077B10 = (uint64_t)CFSTR("item_extra.location_kind_id");
    unk_1ED077B18 = StringPredicateForCriteriaInfo;
    qword_1ED077B30 = (uint64_t)CFSTR("track_number");
    unk_1ED077B38 = NumericPredicateForCriteriaInfo;
    qword_1ED077B50 = (uint64_t)CFSTR("item_extra.total_time_ms");
    unk_1ED077B58 = NumericPredicateForCriteriaInfo;
    qword_1ED077B60 = (uint64_t)CFSTR("item_extra.comment");
    unk_1ED077B68 = StringPredicateForCriteriaInfo;
    qword_1ED077B90 = (uint64_t)CFSTR("item_playback.eq_preset");
    unk_1ED077B98 = StringPredicateForCriteriaInfo;
    qword_1ED077BA0 = (uint64_t)CFSTR("composer.composer");
    unk_1ED077BA8 = StringPredicateForCriteriaInfo;
    qword_1ED077BC0 = (uint64_t)CFSTR("item_playback.volume_normalization_energy");
    unk_1ED077BC8 = NumericPredicateForCriteriaInfo;
    qword_1ED077C00 = (uint64_t)CFSTR("disc_number");
    unk_1ED077C08 = NumericPredicateForCriteriaInfo;
    qword_1ED077C30 = (uint64_t)CFSTR("ROWID");
    unk_1ED077C38 = NumericPredicateForCriteriaInfo;
    qword_1ED077C40 = (uint64_t)CFSTR("ROWID");
    unk_1ED077C48 = NumericPredicateForCriteriaInfo;
    qword_1ED077C50 = (uint64_t)CFSTR("item_extra.is_user_disabled");
    unk_1ED077C58 = BooleanPredicateForCriteriaInfo;
    qword_1ED077C70 = (uint64_t)CFSTR("is_compilation");
    unk_1ED077C78 = BooleanPredicateForCriteriaInfo;
    qword_1ED077CB0 = (uint64_t)CFSTR("item_extra.bpm");
    qword_1ED077CB8 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1ED077CF0 = (uint64_t)CFSTR("item_extra.grouping");
    qword_1ED077CF8 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1ED077D10 = (uint64_t)CFSTR("item_store.store_item_id");
    qword_1ED077D18 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1ED077D20 = (uint64_t)CFSTR("item_artist.store_id");
    qword_1ED077D28 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1ED077D30 = (uint64_t)CFSTR("item_store.store_playlist_id");
    qword_1ED077D38 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1ED077D40 = (uint64_t)CFSTR("item_store.store_composer_id");
    qword_1ED077D48 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1ED077D50 = (uint64_t)CFSTR("item_store.store_genre_id");
    qword_1ED077D58 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1ED077D90 = (uint64_t)CFSTR("item_extra.disc_count");
    qword_1ED077D98 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1ED077DA0 = (uint64_t)CFSTR("item_playback.start_time_ms");
    qword_1ED077DA8 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1ED077DB0 = (uint64_t)CFSTR("item_playback.stop_time_ms");
    qword_1ED077DB8 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1ED077DC0 = (uint64_t)CFSTR("item_extra.track_count");
    qword_1ED077DC8 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1ED077DD0 = (uint64_t)CFSTR("item_store.storefront_id");
    qword_1ED077DD8 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1ED077DE0 = (uint64_t)CFSTR("item_extra.description");
    qword_1ED077DE8 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1ED077DF0 = (uint64_t)CFSTR("category.category");
    qword_1ED077DF8 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1ED077EF0 = (uint64_t)CFSTR("album_artist.album_artist");
    qword_1ED077EF8 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1ED077F20 = (uint64_t)CFSTR("item_playback.relative_volume");
    qword_1ED077F28 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1ED077F60 = (uint64_t)CFSTR("item_extra.sort_title");
    qword_1ED077F68 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1ED077F70 = (uint64_t)CFSTR("album.sort_album");
    qword_1ED077F78 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1ED077F80 = (uint64_t)CFSTR("item_artist.sort_item_artist");
    qword_1ED077F88 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1ED077F90 = (uint64_t)CFSTR("album_artist.sort_album_artist");
    qword_1ED077F98 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1ED077FA0 = (uint64_t)CFSTR("composer.sort_composer");
    qword_1ED077FA8 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1ED077FB0 = (uint64_t)CFSTR("item_artist.sort_series_name");
    qword_1ED077FB8 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1ED078020 = (uint64_t)CFSTR("album.user_rating");
    qword_1ED078028 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1ED078060 = (uint64_t)CFSTR("item_stats.remember_bookmark");
    qword_1ED078068 = (uint64_t)BooleanPredicateForCriteriaInfo;
    qword_1ED077FE0 = (uint64_t)CFSTR("item_extra.description_long");
    qword_1ED077FE8 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1ED078080 = (uint64_t)CFSTR("item_video.has_alternate_audio");
    qword_1ED078088 = (uint64_t)BooleanPredicateForCriteriaInfo;
    qword_1ED0780A0 = (uint64_t)CFSTR("item_video.audio_language");
    qword_1ED0780A8 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1ED0780B0 = (uint64_t)CFSTR("item_video.audio_track_index");
    qword_1ED0780B8 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1ED0780C0 = (uint64_t)CFSTR("item_video.audio_track_id");
    qword_1ED0780C8 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1ED078170 = (uint64_t)CFSTR("item_extra.genius_id");
    qword_1ED078178 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1ED078180 = (uint64_t)CFSTR("exclude_from_shuffle");
    qword_1ED078188 = (uint64_t)BooleanPredicateForCriteriaInfo;
    qword_1ED078190 = (uint64_t)CFSTR("lyrics.lyrics");
    qword_1ED078198 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1ED0781A0 = (uint64_t)CFSTR("item_store.store_item_id");
    qword_1ED0781A8 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1ED0781D0 = (uint64_t)CFSTR("((item.media_type & 4128)!=0)");
    qword_1ED0781D8 = (uint64_t)BooleanPredicateForCriteriaInfo;
    qword_1ED0781E0 = (uint64_t)CFSTR("((item.media_type & 4128)!=0)");
    qword_1ED0781E8 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1ED078240 = (uint64_t)CFSTR("item_extra.copyright");
    qword_1ED078248 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1ED078250 = (uint64_t)CFSTR("item_extra.is_user_disabled");
    qword_1ED078258 = (uint64_t)BooleanPredicateForCriteriaInfo;
    qword_1ED0781F0 = (uint64_t)CFSTR("item_store.store_xid");
    qword_1ED0781F8 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1ED078260 = (uint64_t)CFSTR("best_artwork_token.available_artwork_token IS NOT NULL");
    qword_1ED078268 = (uint64_t)BooleanPredicateForCriteriaInfo;
    qword_1ED078270 = (uint64_t)CFSTR("item_extra.collection_description");
    qword_1ED078278 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1ED078280 = (uint64_t)CFSTR("item_store.store_flavor");
    qword_1ED078288 = (uint64_t)StringPredicateForCriteriaInfo;
    qword_1ED0782B0 = (uint64_t)CFSTR("item_stats.chosen_by_auto_fill");
    qword_1ED0782B8 = (uint64_t)BooleanPredicateForCriteriaInfo;
    qword_1ED078290 = (uint64_t)CFSTR("item_store.store_saga_id");
    qword_1ED078298 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1ED0782E0 = (uint64_t)CFSTR("item_store.cloud_status");
    qword_1ED0782E8 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1ED077B40 = (uint64_t)CFSTR("item_extra.file_size");
    unk_1ED077B48 = NumericPredicateForCriteriaInfo;
    qword_1ED077B20 = (uint64_t)CFSTR("item_extra.date_modified");
    unk_1ED077B28 = DatePredicateForCriteriaInfo;
    qword_1ED077B80 = (uint64_t)CFSTR("date_added");
    unk_1ED077B88 = DatePredicateForCriteriaInfo;
    qword_1ED077CA0 = (uint64_t)CFSTR("item_store.date_released");
    qword_1ED077CA8 = (uint64_t)DatePredicateForCriteriaInfo;
    qword_1ED077BE0 = (uint64_t)CFSTR("item_stats.play_count_user");
    unk_1ED077BE8 = NumericPredicateForCriteriaInfo;
    qword_1ED077BF0 = (uint64_t)CFSTR("item_stats.date_played");
    unk_1ED077BF8 = DatePredicateForCriteriaInfo;
    qword_1ED077C10 = (uint64_t)CFSTR("item_stats.user_rating");
    unk_1ED077C18 = NumericPredicateForCriteriaInfo;
    qword_1ED077EC0 = (uint64_t)CFSTR("item_stats.skip_count_user");
    qword_1ED077EC8 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1ED077ED0 = (uint64_t)CFSTR("item_stats.date_skipped");
    qword_1ED077ED8 = (uint64_t)DatePredicateForCriteriaInfo;
    qword_1ED078050 = (uint64_t)CFSTR("item_stats.bookmark_time_ms");
    qword_1ED078058 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1ED078070 = (uint64_t)CFSTR("item_stats.has_been_played");
    qword_1ED078078 = (uint64_t)BooleanPredicateForCriteriaInfo;
    qword_1ED0782D0 = (uint64_t)CFSTR("(item.base_location_id >= 250)");
    qword_1ED0782D8 = (uint64_t)BooleanPredicateForCriteriaInfo;
    qword_1ED077CD0 = (uint64_t)CFSTR("best_artwork_token.available_artwork_token IS NOT NULL");
    qword_1ED077CD8 = (uint64_t)BooleanPredicateForCriteriaInfo;
    qword_1ED078420 = (uint64_t)CFSTR("item_stats.liked_state");
    qword_1ED078428 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1ED0785F0 = (uint64_t)CFSTR("item_stats.liked_state_changed_date");
    qword_1ED0785F8 = (uint64_t)DatePredicateForCriteriaInfo;
    qword_1ED078440 = (uint64_t)CFSTR("album.liked_state");
    qword_1ED078448 = (uint64_t)NumericPredicateForCriteriaInfo;
    qword_1ED077E40 = (uint64_t)CFSTR("item_extra.media_kind");
    qword_1ED077E48 = (uint64_t)NumericPredicateForCriteriaInfo;
  }
}

+ (id)defaultFilterPredicates
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  +[ML3ComparisonPredicate predicateWithProperty:equalToValue:](ML3ComparisonPredicate, "predicateWithProperty:equalToValue:", CFSTR("is_ignorable_itunes_playlist"), MEMORY[0x1E0C9AAA0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)libraryContentsChangeForProperty:(id)a3
{
  return objc_msgSend((id)ML3ContainerContentsUnchangingProperties, "containsObject:", a3) ^ 1;
}

+ (id)joinClausesForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend((id)ML3ContainerJoinsForProperties, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___ML3Container;
    objc_msgSendSuper2(&v10, sel_joinClausesForProperty_, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

+ (id)databaseTable
{
  return CFSTR("container");
}

+ (int64_t)revisionTrackingCode
{
  return 1;
}

+ (id)defaultOrderingTerms
{
  return (id)ML3ContainerDefaultOrderingTerms;
}

- (ML3Container)initWithDictionary:(id)a3 inLibrary:(id)a4 cachedNameOrders:(id)a5 usingConnection:(id)a6
{
  void *v6;
  void *v7;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  ML3Container *v46;
  uint64_t v48;
  id v49;
  void *v50;
  objc_super v52;

  v11 = a4;
  v12 = a5;
  v49 = a6;
  v13 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v13, "objectForKey:", CFSTR("ROWID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", ML3CreateIntegerUUID());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("ROWID"));
  }
  v48 = objc_msgSend(v14, "unsignedLongLongValue");
  objc_msgSend(v13, "objectForKey:", CFSTR("container_type"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");
  v50 = v12;
  if (v16 != 3)
  {
    objc_msgSend(v13, "objectForKey:", CFSTR("smart_is_genius"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "integerValue"))
    {
      v17 = 0;
      goto LABEL_8;
    }
  }
  objc_msgSend(v13, "objectForKey:", CFSTR("is_container_type_active_target"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 1;
  if (!objc_msgSend(v6, "integerValue"))
  {
LABEL_8:
    v18 = v17;
    objc_msgSend(v13, "objectForKey:", CFSTR("(container.is_container_type_active_target AND container.smart_is_genius)"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v19, "integerValue") != 0;

    if (!v18)
      goto LABEL_10;
  }

LABEL_10:
  if (v16 != 3)

  objc_msgSend(v13, "objectForKey:", CFSTR("container_type"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "integerValue");
  if (v21 == 3
    && (objc_msgSend(v13, "objectForKey:", CFSTR("is_container_type_active_target")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "integerValue")))
  {
    v22 = 1;
  }
  else
  {
    objc_msgSend(v13, "objectForKey:", CFSTR("(container.is_container_type_active_target AND (container.container_type = 2))"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v23, "integerValue") != 0;

    if (v21 != 3)
      goto LABEL_17;
  }

LABEL_17:
  objc_msgSend(v13, "removeObjectForKey:", CFSTR("(container.is_container_type_active_target AND container.smart_is_genius)"));
  objc_msgSend(v13, "removeObjectForKey:", CFSTR("(container.is_container_type_active_target AND (container.container_type = 2))"));
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v24, CFSTR("is_container_type_active_target"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v25, CFSTR("container_type"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v26, CFSTR("smart_is_genius"));

  }
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v27, CFSTR("is_container_type_active_target"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v28, CFSTR("container_type"));

  }
  objc_msgSend(v13, "objectForKey:", CFSTR("filepath"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {
    v30 = (void *)objc_opt_class();
    if (v17)
      v31 = 3;
    else
      v31 = 2;
    objc_msgSend(v30, "nextFilepathForPlaylistType:withPersistentID:inLibrary:", v31, v48, v11);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKey:", v32, CFSTR("filepath"));

  }
  objc_msgSend(v13, "objectForKey:", CFSTR("date_created"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v33)
  {
    v34 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v34, "numberWithDouble:");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v33, CFSTR("date_created"));
  }
  objc_msgSend(v13, "objectForKey:", CFSTR("date_modified"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v35)
  {
    v36 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v36, "numberWithDouble:");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v35, CFSTR("date_modified"));
  }
  objc_msgSend(v13, "objectForKey:", CFSTR("distinguished_kind"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v37)
  {
    v39 = objc_msgSend(v37, "integerValue");
    if (v39)
    {
      objc_msgSend(v13, "objectForKey:", CFSTR("is_hidden"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "BOOLValue");

      if (v41)
      {
        if ((v39 > 0x20 || ((1 << v39) & 0x100180000) == 0) && v39 != 10000 && v39 != 10010)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setValue:forKey:", v42, CFSTR("is_ignorable_itunes_playlist"));

        }
      }
    }
  }
  objc_msgSend((id)objc_opt_class(), "populateSortOrdersOfPropertyValues:inLibrary:cachedNameOrders:", v13, v11, v50);
  objc_msgSend(v13, "objectForKey:", CFSTR("orig_date_modified"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v43)
  {
    v44 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v44, "numberWithDouble:");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v45, CFSTR("orig_date_modified"));

  }
  v52.receiver = self;
  v52.super_class = (Class)ML3Container;
  v46 = -[ML3Entity initWithDictionary:inLibrary:cachedNameOrders:usingConnection:](&v52, sel_initWithDictionary_inLibrary_cachedNameOrders_usingConnection_, v13, v11, v50, v49);

  return v46;
}

- (void)setValues:(id)a3 forProperties:(id)a4 async:(BOOL)a5 withCompletionBlock:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, uint64_t, _QWORD);
  void *v12;
  void *v13;
  id WeakRetained;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _BOOL4 v26;
  objc_super v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  ML3Container *v34;
  id v35;
  id v36;

  v26 = a5;
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, uint64_t, _QWORD))a6;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  v15 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __66__ML3Container_setValues_forProperties_async_withCompletionBlock___block_invoke;
  v31[3] = &unk_1E5B61D58;
  v16 = v9;
  v32 = v16;
  v17 = WeakRetained;
  v33 = v17;
  v34 = self;
  v18 = v12;
  v35 = v18;
  v19 = v13;
  v36 = v19;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v31);
  if (objc_msgSend(v18, "count") || objc_msgSend(v19, "count"))
  {
    v20 = (void *)objc_msgSend(v10, "mutableCopy");
    v21 = (void *)objc_msgSend(v16, "mutableCopy");
    objc_msgSend(v20, "removeObjectsAtIndexes:", v19);
    objc_msgSend(v21, "removeObjectsAtIndexes:", v19);
    v28[0] = v15;
    v28[1] = 3221225472;
    v28[2] = __66__ML3Container_setValues_forProperties_async_withCompletionBlock___block_invoke_2;
    v28[3] = &unk_1E5B654D8;
    v22 = v20;
    v29 = v22;
    v23 = v21;
    v30 = v23;
    objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v28);
    v24 = v22;

    v25 = v23;
    v10 = v24;
    v16 = v25;
  }
  if (objc_msgSend(v10, "count"))
  {
    v27.receiver = self;
    v27.super_class = (Class)ML3Container;
    -[ML3Entity setValues:forProperties:async:withCompletionBlock:](&v27, sel_setValues_forProperties_async_withCompletionBlock_, v16, v10, v26, v11);
  }
  else if (v11)
  {
    v11[2](v11, 1, 0);
  }

}

- (SearchCriteriaList)importedCriteriaList
{
  void *v3;
  void *v4;
  id v5;
  int v6;
  int v7;
  NSObject *v8;
  int64_t v9;
  SearchCriteriaList *v10;
  SearchCriteriaList *v12;
  uint8_t buf[4];
  ML3Container *v14;
  __int16 v15;
  int64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("smart_criteria"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v12 = 0;
  if (v3)
  {
    v5 = objc_retainAutorelease(v3);
    v6 = MEMORY[0x1AF43C1F8](objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"), &v12);
    if (v6)
    {
      v7 = v6;
      v8 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = -[ML3Entity persistentID](self, "persistentID");
        *(_DWORD *)buf = 134218496;
        v14 = self;
        v15 = 2048;
        v16 = v9;
        v17 = 2048;
        v18 = v7;
        _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_ERROR, "Could not parse search criteria list for playlist %p (pid = %lld): %ld", buf, 0x20u);
      }

    }
  }
  v10 = v12;

  return v10;
}

- (ML3Predicate)smartCriteriaPredicate
{
  SearchCriteriaList *v2;
  void *v3;

  v2 = -[ML3Container importedCriteriaList](self, "importedCriteriaList");
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "predicateForCriteriaList:parentMatchedAny:", v2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    DisposeSearchCriteriaList();
  }
  else
  {
    v3 = 0;
  }
  return (ML3Predicate *)v3;
}

- (BOOL)isEvaluationOrderingDescending
{
  void *v2;
  unsigned int v3;

  -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("smart_evaluation_order"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3 <= 0x1D && ((1 << v3) & 0x2C400000) != 0 || v3 == 112;
}

- (BOOL)isLimitedByCount
{
  void *v2;
  BOOL v3;

  -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("smart_limit_kind"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue") == 2;

  return v3;
}

- (BOOL)isLimitOrderingDescending
{
  void *v3;
  unsigned int v4;
  void *v5;
  int v6;
  BOOL v7;

  -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("smart_limit_order"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("smart_reverse_limit_order"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");
  v7 = v6 != 0;

  if (v4 <= 0x1D && ((1 << v4) & 0x2C400000) != 0 || v4 == 112)
    return v6 == 0;
  return v7;
}

- (NSString)limitingProperty
{
  void *v2;
  int v3;
  __CFString *v4;
  __CFString *v5;

  -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("smart_limit_kind"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  switch(v3)
  {
    case 0:
    case 3:
      v4 = CFSTR("item_extra.total_time_ms");
      goto LABEL_4;
    case 1:
    case 4:
      v4 = CFSTR("item_extra.file_size");
LABEL_4:
      v5 = v4;
      break;
    case 2:
      v4 = CFSTR("1");
      break;
    default:
      v4 = 0;
      break;
  }
  return (NSString *)v4;
}

- (id)evaluationOrderingTerms
{
  void *v3;
  uint64_t v4;

  -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("smart_evaluation_order"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return +[ML3Track orderingTermsForITTGTrackOrder:descending:](ML3Track, "orderingTermsForITTGTrackOrder:descending:", v4, -[ML3Container isEvaluationOrderingDescending](self, "isEvaluationOrderingDescending"));
}

- (NSArray)limitOrderingTerms
{
  void *v3;
  uint64_t v4;

  -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("smart_limit_order"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return (NSArray *)+[ML3Track orderingTermsForITTGTrackOrder:descending:](ML3Track, "orderingTermsForITTGTrackOrder:descending:", v4, -[ML3Container isLimitOrderingDescending](self, "isLimitOrderingDescending"));
}

- (int64_t)limitValue
{
  void *v3;
  int v4;
  void *v5;
  int64_t v6;

  -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("smart_limit_kind"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("smart_limit_value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "longLongValue");

  switch(v4)
  {
    case 0:
      goto LABEL_3;
    case 1:
      goto LABEL_5;
    case 3:
      v6 *= 60;
LABEL_3:
      v6 *= 60000;
      return v6;
    case 4:
      v6 <<= 10;
LABEL_5:
      v6 <<= 20;
      break;
    default:
      return v6;
  }
  return v6;
}

- (NSArray)cloudDisplayOrderingTerms
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("is_reversed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("play_order"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  return (NSArray *)+[ML3Track orderingTermsForITTGTrackOrder:descending:](ML3Track, "orderingTermsForITTGTrackOrder:descending:", v6, v4);
}

- (NSArray)displayOrderingTerms
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  int v14;
  int SearchCriterionInfo;
  int v16;
  NSObject *v17;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("is_reversed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("play_order"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  +[ML3Track orderingTermsForITTGTrackOrder:descending:](ML3Track, "orderingTermsForITTGTrackOrder:descending:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = v7;
  }
  else
  {
    -[ML3Container limitOrderingTerms](self, "limitOrderingTerms");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      v8 = v9;
    }
    else
    {
      -[ML3Container evaluationOrderingTerms](self, "evaluationOrderingTerms");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count"))
      {
        v11 = v10;
      }
      else
      {
        if (-[ML3Container importedCriteriaList](self, "importedCriteriaList"))
        {
          LockSearchCriteriaList();
          v12 = CountSearchCriteria();
          if ((_DWORD)v12)
          {
            v14 = 0;
            *(_QWORD *)&v13 = 67109120;
            v19 = v13;
            do
            {
              SearchCriterionInfo = GetSearchCriterionInfo();
              if (SearchCriterionInfo)
              {
                v16 = SearchCriterionInfo;
                v17 = os_log_create("com.apple.amp.medialibrary", "Default");
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134217984;
                  v21 = v16;
                  _os_log_impl(&dword_1AC149000, v17, OS_LOG_TYPE_ERROR, "Got an error getting search criterion info: %ld", buf, 0xCu);
                }

              }
              ++v14;
            }
            while ((_DWORD)v12 != v14);
            v12 = 0;
          }
          UnlockSearchCriteriaList();
          DisposeSearchCriteriaList();
        }
        else
        {
          v12 = 0;
        }
        +[ML3Track orderingTermsForITTGTrackOrder:descending:](ML3Track, "orderingTermsForITTGTrackOrder:descending:", v12, 0, v19);
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v8 = v11;

    }
  }

  return (NSArray *)v8;
}

- (BOOL)removeAllTracks
{
  id WeakRetained;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__ML3Container_removeAllTracks__block_invoke;
  v5[3] = &unk_1E5B62430;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(WeakRetained, "performDatabaseTransactionWithBlock:", v5);

  LOBYTE(WeakRetained) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)WeakRetained;
}

- (BOOL)setTracksWithPersistentIDs:(id)a3 notify:(BOOL)a4
{
  return -[ML3Container setTracksWithPersistentIDs:andEntryProperties:withAttributionIdentifier:notify:](self, "setTracksWithPersistentIDs:andEntryProperties:withAttributionIdentifier:notify:", a3, MEMORY[0x1E0C9AA70], 0, a4);
}

- (BOOL)setTracksWithPersistentIDs:(id)a3 andEntryProperties:(id)a4 withAttributionIdentifier:(id)a5 notify:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  id WeakRetained;
  id v15;
  id v16;
  id v17;
  char v18;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  BOOL v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!-[ML3Container _supportsOrderedTrackOperations](self, "_supportsOrderedTrackOperations"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3Container.m"), 1686, CFSTR("setTracksWithPersistentIDs:notify: called on unsupported container"));

  }
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __95__ML3Container_setTracksWithPersistentIDs_andEntryProperties_withAttributionIdentifier_notify___block_invoke;
  v21[3] = &unk_1E5B61F70;
  v25 = &v27;
  v21[4] = self;
  v15 = v11;
  v22 = v15;
  v16 = v12;
  v23 = v16;
  v17 = v13;
  v24 = v17;
  v26 = a6;
  objc_msgSend(WeakRetained, "performDatabaseTransactionWithBlock:", v21);

  v18 = *((_BYTE *)v28 + 24);
  _Block_object_dispose(&v27, 8);

  return v18;
}

- (BOOL)appendTracksWithPersistentIDs:(id)a3 notify:(BOOL)a4
{
  return -[ML3Container appendTracksWithPersistentIDs:andEntryProperties:withAttributionIdentifier:notify:](self, "appendTracksWithPersistentIDs:andEntryProperties:withAttributionIdentifier:notify:", a3, MEMORY[0x1E0C9AA70], 0, a4);
}

- (BOOL)appendTracksWithPersistentIDs:(id)a3 andEntryProperties:(id)a4 withAttributionIdentifier:(id)a5 notify:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  id WeakRetained;
  BOOL v17;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  int v25;
  BOOL v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (objc_msgSend(v11, "count"))
  {
    if (!-[ML3Container _supportsOrderedTrackOperations](self, "_supportsOrderedTrackOperations"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3Container.m"), 1705, CFSTR("appendTracksWithPersistentIDs:notify: called on unsupported container"));

    }
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("keep_local"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");

    WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __98__ML3Container_appendTracksWithPersistentIDs_andEntryProperties_withAttributionIdentifier_notify___block_invoke;
    v20[3] = &unk_1E5B61F98;
    v20[4] = self;
    v21 = v13;
    v22 = v11;
    v23 = v12;
    v24 = &v27;
    v25 = v15;
    v26 = a6;
    objc_msgSend(WeakRetained, "performDatabaseTransactionWithBlock:", v20);

    v17 = *((_BYTE *)v28 + 24) != 0;
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    v17 = 1;
  }

  return v17;
}

- (BOOL)moveTrackFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  BOOL v8;
  id WeakRetained;
  void *v11;
  _QWORD v12[8];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  if (!-[ML3Container _supportsOrderedTrackOperations](self, "_supportsOrderedTrackOperations"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3Container.m"), 1774, CFSTR("moveTrackFromIndex:toIndex: called on unsupported container"));

  }
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v8 = 1;
  v16 = 1;
  if (a3 != a4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __43__ML3Container_moveTrackFromIndex_toIndex___block_invoke;
    v12[3] = &unk_1E5B61FC0;
    v12[4] = self;
    v12[5] = &v13;
    v12[6] = a3;
    v12[7] = a4;
    objc_msgSend(WeakRetained, "performDatabaseTransactionWithBlock:", v12);

    v8 = *((_BYTE *)v14 + 24) != 0;
  }
  _Block_object_dispose(&v13, 8);
  return v8;
}

- (BOOL)removeTracksAtIndexes:(id)a3 notify:(BOOL)a4
{
  id v7;
  id WeakRetained;
  char v9;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v7 = a3;
  if (!-[ML3Container _supportsOrderedTrackOperations](self, "_supportsOrderedTrackOperations"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3Container.m"), 1843, CFSTR("removeTracksAtIndexes:notify: called on unsupported container"));

  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  if (objc_msgSend(v7, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__ML3Container_removeTracksAtIndexes_notify___block_invoke;
    v12[3] = &unk_1E5B61FE8;
    v14 = &v16;
    v12[4] = self;
    v13 = v7;
    v15 = a4;
    objc_msgSend(WeakRetained, "performDatabaseTransactionWithBlock:", v12);

  }
  v9 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return v9;
}

- (BOOL)removeFirstTrack
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[ML3Container removeTracksAtIndexes:notify:](self, "removeTracksAtIndexes:notify:", v3, 1);

  return (char)self;
}

- (id)trackPersistentIds
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("container_pid"), self->super._persistentID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3Entity queryWithLibrary:predicate:](ML3ContainerItem, "queryWithLibrary:predicate:", WeakRetained, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = CFSTR("item_pid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __34__ML3Container_trackPersistentIds__block_invoke;
  v10[3] = &unk_1E5B62770;
  v8 = v3;
  v11 = v8;
  objc_msgSend(v6, "enumeratePersistentIDsAndProperties:usingBlock:", v7, v10);

  return v8;
}

- (id)childPlaylistPersistentIds
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->super._persistentID);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("parent_pid"), v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  +[ML3Entity queryWithLibrary:predicate:](ML3Container, "queryWithLibrary:predicate:", WeakRetained, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "countOfEntities"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__ML3Container_childPlaylistPersistentIds__block_invoke;
  v10[3] = &unk_1E5B65960;
  v8 = v7;
  v11 = v8;
  objc_msgSend(v6, "enumeratePersistentIDsUsingBlock:", v10);

  return v8;
}

- (BOOL)isBuiltInSmartPlaylist
{
  void *v2;
  int v3;
  unint64_t v4;
  int *v5;
  int v6;
  int v7;

  -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("distinguished_kind"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longValue");

  v4 = 0;
  v5 = &dword_1E5B5283C;
  do
  {
    v7 = *v5;
    v5 += 6;
    v6 = v7;
    if (v4 > 3)
      break;
    ++v4;
  }
  while (v6 != v3);
  return v6 == v3;
}

- (BOOL)setItemReactionText:(id)a3 onEntryAtPosition:(unint64_t)a4 forUserIdentifier:(id)a5 previousReactionText:(id *)a6
{
  id v10;
  id v11;
  id WeakRetained;
  id v13;
  id v14;
  char v15;
  _QWORD v17[4];
  id v18;
  ML3Container *v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v10 = a3;
  v11 = a5;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__6649;
  v28 = __Block_byref_object_dispose__6650;
  v29 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __93__ML3Container_setItemReactionText_onEntryAtPosition_forUserIdentifier_previousReactionText___block_invoke;
  v17[3] = &unk_1E5B62010;
  v13 = v11;
  v18 = v13;
  v19 = self;
  v23 = a4;
  v21 = &v24;
  v14 = v10;
  v20 = v14;
  v22 = &v30;
  objc_msgSend(WeakRetained, "databaseConnectionAllowingWrites:withBlock:", 1, v17);

  if (a6)
    *a6 = objc_retainAutorelease((id)v25[5]);
  v15 = *((_BYTE *)v31 + 24);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v15;
}

- (int64_t)_maxPositionForTracksUsingConnection:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithLongLong:", -[ML3Entity persistentID](self, "persistentID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executeQuery:withParameters:", CFSTR("SELECT IFNULL(MAX(position), -1) FROM container_item WHERE container_pid = ?"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForFirstRowAndColumn");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  return v10;
}

- (BOOL)_reloadContainedMediaTypes:(BOOL)a3 removedMediaTypes:(id)a4 addedMediaTypes:(id)a5 notify:(BOOL)a6 incrementEntityRevision:(BOOL)a7 usingConnection:(id)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v12;
  ML3MusicLibrary **p_library;
  id v15;
  id v16;
  id v17;
  id WeakRetained;

  v8 = a7;
  v9 = a6;
  v12 = a3;
  p_library = &self->super._library;
  v15 = a8;
  v16 = a5;
  v17 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_library);
  LOBYTE(v8) = +[ML3Container _reloadContainedMediaTypes:removedMediaTypes:addedMediaTypes:notify:incrementEntityRevision:usingLibrary:connection:forContainerPersistentID:](ML3Container, "_reloadContainedMediaTypes:removedMediaTypes:addedMediaTypes:notify:incrementEntityRevision:usingLibrary:connection:forContainerPersistentID:", v12, v17, v16, v9, v8, WeakRetained, v15, -[ML3Entity persistentID](self, "persistentID"));

  return v8;
}

- (BOOL)_removeTracksAtIndexes:(id)a3 notify:(BOOL)a4 usingConnection:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  BOOL v14;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD *v19;
  uint64_t *v20;
  _QWORD *v21;
  SEL v22;
  _QWORD v23[4];
  _QWORD v24[4];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[ML3Entity persistentID](self, "persistentID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__ML3Container__removeTracksAtIndexes_notify_usingConnection___block_invoke;
  v16[3] = &unk_1E5B62060;
  v19 = v24;
  v16[4] = self;
  v22 = a2;
  v20 = &v25;
  v12 = v10;
  v17 = v12;
  v13 = v11;
  v18 = v13;
  v21 = v23;
  objc_msgSend(v9, "enumerateRangesUsingBlock:", v16);
  if (*((_BYTE *)v26 + 24))
  {
    v14 = -[ML3Container _reloadContainedMediaTypes:removedMediaTypes:addedMediaTypes:notify:incrementEntityRevision:usingConnection:](self, "_reloadContainedMediaTypes:removedMediaTypes:addedMediaTypes:notify:incrementEntityRevision:usingConnection:", 1, 0, 0, v6, 1, v12);
    *((_BYTE *)v26 + 24) = v14;
  }
  else
  {
    v14 = 0;
  }

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(&v25, 8);
  return v14;
}

- (void)_setContainerSeedItemPersistentIDValue:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__ML3Container__setContainerSeedItemPersistentIDValue___block_invoke;
  v7[3] = &unk_1E5B642E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(WeakRetained, "databaseConnectionAllowingWrites:withBlock:", 1, v7);

}

- (BOOL)_supportsOrderedTrackOperations
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("distinguished_kind"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4) ^ 1;

  return v5;
}

- (BOOL)_setItemPersistentIDs:(id)a3 andEntryProperties:(id)a4 withAttributionIdentifier:(id)a5 reloadContainedMediaTypes:(BOOL)a6 removedMediaTypes:(id)a7 addedMediaTypes:(id)a8 notify:(BOOL)a9 incrementEntityRevision:(BOOL)a10 usingConnection:(id)a11
{
  uint64_t v13;
  id v17;
  id v18;
  id v19;
  ML3Container *v20;
  id v21;
  uint64_t v22;
  ML3ContainerItemDiffOperation *v23;
  void *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  void *v37;
  char v38;
  id v39;
  void *v40;
  char v41;
  NSObject *v42;
  int v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  ML3Container *v48;
  NSObject *v49;
  void *v50;
  char v51;
  ML3ContainerItemDiffOperation *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  char v56;
  void *v57;
  int v58;
  void *v59;
  __int128 v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  NSObject *v64;
  _BOOL4 v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  char v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  char v94;
  id v95;
  NSObject *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  int v100;
  os_log_t v101;
  NSObject *v102;
  uint64_t v103;
  BOOL v104;
  __int128 v106;
  unsigned int v107;
  id v108;
  ML3ContainerItemDiffOperation *v109;
  ML3Container *v110;
  id v111;
  id v112;
  id v113;
  id v114;
  ML3PersistentIDGenerator *v115;
  ML3PersistentIDGenerator *v116;
  id obj;
  unsigned int v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  id v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  unint64_t v130;
  void *v131;
  id v132;
  id v133;
  id v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  id v139;
  id v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  id v145;
  id v146;
  _QWORD v147[2];
  _QWORD v148[3];
  _QWORD v149[7];
  uint8_t buf[4];
  uint64_t v151;
  __int16 v152;
  uint64_t v153;
  __int16 v154;
  uint64_t v155;
  __int16 v156;
  uint64_t v157;
  _BYTE v158[128];
  id v159;
  _BYTE v160[128];
  uint64_t v161;
  _QWORD v162[4];

  v13 = a6;
  v162[1] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = self;
  v114 = v19;
  v112 = a7;
  v111 = a8;
  v21 = a11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->super._persistentID);
  v22 = objc_claimAutoreleasedReturnValue();
  v131 = v21;
  if (objc_msgSend(v17, "count"))
  {
    v121 = (void *)v22;
    v107 = v13;
    v110 = self;
    v108 = v17;
    v23 = -[ML3ContainerItemDiffOperation initWithContainerPersistentID:updatedItemsPersistentIDs:updatedItemsProperties:connection:]([ML3ContainerItemDiffOperation alloc], "initWithContainerPersistentID:updatedItemsPersistentIDs:updatedItemsProperties:connection:", self->super._persistentID, v17, v18, v21);
    -[ML3ContainerItemDiffOperation start](v23, "start");
    -[ML3ContainerItemDiffOperation waitUntilFinished](v23, "waitUntilFinished");
    v109 = v23;
    -[ML3ContainerItemDiffOperation containerItemsToDelete](v23, "containerItemsToDelete");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v24, "count"));
    v25 = objc_claimAutoreleasedReturnValue();
    v141 = 0u;
    v142 = 0u;
    v143 = 0u;
    v144 = 0u;
    v26 = v24;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v141, v160, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v142;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v142 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v141 + 1) + 8 * i), "persistentID"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v25, "addObject:", v31);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v141, v160, 16);
      }
      while (v28);
    }
    v122 = v18;
    v113 = v26;

    +[ML3DatabaseStatementRenderer defaultRenderer](ML3DatabaseStatementRenderer, "defaultRenderer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = -[NSObject count](v25, "count");
    v33 = 0;
    v124 = v32;
    do
    {
      if (v130 <= v33)
        break;
      if (v130 - v33 >= 0x64)
        v34 = 100;
      else
        v34 = v130 - v33;
      -[NSObject subarrayWithRange:](v25, "subarrayWithRange:", v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v151 = (uint64_t)v35;
        _os_log_impl(&dword_1AC149000, v36, OS_LOG_TYPE_DEFAULT, "Deleting container_item rows with persistent-ids: %{public}@", buf, 0xCu);
      }

      objc_msgSend(v32, "statementWithPrefix:inParameterCount:", CFSTR("DELETE FROM container_item_person WHERE container_item_pid"), v34);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v140 = 0;
      v38 = objc_msgSend(v131, "executeUpdate:withParameters:error:", v37, v35, &v140);
      v39 = v140;
      if ((v38 & 1) != 0)
      {
        objc_msgSend(v32, "statementWithPrefix:inParameterCount:", CFSTR("DELETE FROM container_item WHERE ROWID"), v34);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v139 = 0;
        v41 = objc_msgSend(v131, "executeUpdate:withParameters:error:", v40, v35, &v139);
        v42 = v139;
        if ((v41 & 1) != 0)
        {
          v43 = 0;
        }
        else
        {
          v44 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v151 = (uint64_t)v42;
            _os_log_impl(&dword_1AC149000, v44, OS_LOG_TYPE_ERROR, "Failed to delete container_item rows with error: %{public}@", buf, 0xCu);
          }

          v43 = 5;
        }

      }
      else
      {
        v42 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v151 = (uint64_t)v39;
          _os_log_impl(&dword_1AC149000, v42, OS_LOG_TYPE_ERROR, "Failed to delete container_item_person rows with error: %{public}@", buf, 0xCu);
        }
        v43 = 5;
      }
      v33 += v34;

      v32 = v124;
    }
    while (!v43);
    if (v114)
    {
      v159 = v114;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v159, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "executeQuery:withParameters:", CFSTR("SELECT person_pid FROM person WHERE cloud_id = ?"), v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "int64ValueForFirstRowAndColumn");

      v18 = v122;
      v48 = self;
      v123 = v47;
      if (!v47)
      {
        v49 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v151 = (uint64_t)v114;
          _os_log_impl(&dword_1AC149000, v49, OS_LOG_TYPE_ERROR, "No person entry for cloud ID '%{public}@' - skipping attribution", buf, 0xCu);
        }

        v123 = 0;
      }
    }
    else
    {
      v123 = 0;
      v18 = v122;
      v48 = self;
    }
    -[ML3Entity valueForProperty:](v48, "valueForProperty:", CFSTR("keep_local"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "integerValue");

    -[ML3ContainerItemDiffOperation containerItemsToUpdate](v109, "containerItemsToUpdate");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = -[ML3PersistentIDGenerator initWithDatabaseConnection:tableName:]([ML3PersistentIDGenerator alloc], "initWithDatabaseConnection:tableName:", v131, CFSTR("container_item"));
    v116 = -[ML3PersistentIDGenerator initWithDatabaseConnection:tableName:]([ML3PersistentIDGenerator alloc], "initWithDatabaseConnection:tableName:", v131, CFSTR("container_item_person"));
    v135 = 0u;
    v136 = 0u;
    v137 = 0u;
    v138 = 0u;
    obj = v59;
    v120 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v158, 16);
    if (!v120)
      goto LABEL_79;
    v118 = v58 - 1;
    v119 = *(_QWORD *)v136;
    *(_QWORD *)&v60 = 134218242;
    v106 = v60;
LABEL_42:
    v61 = 0;
    while (1)
    {
      if (*(_QWORD *)v136 != v119)
        objc_enumerationMutation(obj);
      v62 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * v61);
      v63 = objc_msgSend(v62, "persistentID", v106);
      v64 = os_log_create("com.apple.amp.medialibrary", "Default");
      v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT);
      v125 = v61;
      if (v63)
      {
        if (v65)
        {
          v66 = objc_msgSend(v62, "newPosition");
          v67 = objc_msgSend(v62, "persistentID");
          v68 = objc_msgSend(v62, "previousPosition");
          v69 = objc_msgSend(v62, "newPosition");
          *(_DWORD *)buf = 134218752;
          v151 = v66;
          v152 = 2048;
          v153 = v67;
          v154 = 2048;
          v155 = v68;
          v156 = 2048;
          v157 = v69;
          _os_log_impl(&dword_1AC149000, v64, OS_LOG_TYPE_DEFAULT, "Mapped item at position %lld to existing container_item with pid %lld (update position: %lld -> %lld)", buf, 0x2Au);
        }

      }
      else
      {
        if (v65)
        {
          v70 = objc_msgSend(v62, "newPosition");
          *(_DWORD *)buf = 134217984;
          v151 = v70;
          _os_log_impl(&dword_1AC149000, v64, OS_LOG_TYPE_DEFAULT, "Creating new container_item for item at position %lld", buf, 0xCu);
        }

        objc_msgSend(v62, "setPersistentID:", -[ML3PersistentIDGenerator nextPersistentID](v115, "nextPersistentID"));
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v62, "itemPersistentID"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("uuid"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v73;
      if (v73)
      {
        v75 = v73;
      }
      else
      {
        objc_msgSend(v62, "uuid");
        v75 = (id)objc_claimAutoreleasedReturnValue();
      }
      v76 = v75;

      objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("position_uuid"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v77;
      v129 = v72;
      if (v77)
      {
        v79 = v77;
      }
      else
      {
        objc_msgSend(v62, "positionUUID");
        v79 = (id)objc_claimAutoreleasedReturnValue();
      }
      v80 = v79;

      objc_msgSend(v62, "occurrenceID");
      v81 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v62, "persistentID"));
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v149[0] = v82;
      v149[1] = v121;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v62, "itemPersistentID"));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v149[2] = v83;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v62, "newPosition"));
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v149[3] = v84;
      v127 = (void *)v81;
      v128 = v76;
      v149[4] = v76;
      v126 = v80;
      v149[5] = v80;
      v149[6] = v81;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v149, 7);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v134 = 0;
      v86 = objc_msgSend(v131, "executeUpdate:withParameters:error:", CFSTR("INSERT OR REPLACE INTO container_item (container_item_pid, container_pid, item_pid, position, uuid, position_uuid, occurrence_id) VALUES (?, ?, ?, ?, ?, ?, ?)"), v85, &v134);
      v87 = v134;

      if ((v86 & 1) == 0)
        break;
      v88 = v63;
      if (!v63 && v123)
      {
        v89 = -[ML3PersistentIDGenerator nextPersistentID](v116, "nextPersistentID");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v89);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v148[0] = v90;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v62, "persistentID"));
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v148[1] = v91;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v123);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v148[2] = v92;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v148, 3);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v133 = 0;
        v94 = objc_msgSend(v131, "executeUpdate:withParameters:error:", CFSTR("INSERT OR REPLACE INTO container_item_person (container_item_person_pid, container_item_pid, person_pid) VALUES (?, ?, ?)"), v93, &v133);
        v95 = v133;

        if ((v94 & 1) == 0)
        {
          v96 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
          {
            v97 = objc_msgSend(v62, "itemPersistentID");
            *(_DWORD *)buf = v106;
            v151 = v97;
            v152 = 2114;
            v153 = (uint64_t)v95;
            _os_log_impl(&dword_1AC149000, v96, OS_LOG_TYPE_ERROR, "Failed to add container_item_person for track %lld. err = %{public}@", buf, 0x16u);
          }

        }
        v88 = 0;
      }
      if (!v88 && v118 <= 1)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v62, "itemPersistentID"));
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v147[0] = v98;
        v147[1] = &unk_1E5BAAF68;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v147, 2);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v132 = 0;
        v100 = objc_msgSend(v131, "executeUpdate:withParameters:error:", CFSTR("UPDATE item set keep_local=0 WHERE (item_pid=? AND keep_local<?);"),
                 v99,
                 &v132);
        v101 = (os_log_t)v132;

        if (!v100)
        {
          v102 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
          {
            v103 = objc_msgSend(v62, "persistentID");
            *(_DWORD *)buf = v106;
            v151 = v103;
            v152 = 2114;
            v153 = (uint64_t)v101;
            _os_log_impl(&dword_1AC149000, v102, OS_LOG_TYPE_ERROR, "Failed to clear keep_local for track %lld - error: %{public}@", buf, 0x16u);
          }

LABEL_78:
          v18 = v122;
          goto LABEL_79;
        }

      }
      v61 = v125 + 1;
      v18 = v122;
      if (v120 == v125 + 1)
      {
        v120 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v158, 16);
        if (v120)
          goto LABEL_42;
LABEL_79:

        v52 = v109;
        v20 = v110;
        v53 = v121;
LABEL_80:

        v17 = v108;
        v13 = v107;
        goto LABEL_81;
      }
    }
    v101 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v151 = (uint64_t)v87;
      _os_log_impl(&dword_1AC149000, v101, OS_LOG_TYPE_ERROR, "Failed to insert container_item with error: %{public}@", buf, 0xCu);
    }
    goto LABEL_78;
  }
  v162[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v162, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = 0;
  v51 = objc_msgSend(v21, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM container_item_person WHERE container_item_pid in (SELECT container_item_pid from container_item where container_pid=?)"), v50, &v146);
  v52 = (ML3ContainerItemDiffOperation *)v146;

  v53 = (void *)v22;
  if ((v51 & 1) == 0)
  {
    v54 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v151 = (uint64_t)v52;
      _os_log_impl(&dword_1AC149000, v54, OS_LOG_TYPE_ERROR, "Failed to delete from container_item_persons with error: %{public}@", buf, 0xCu);
    }

  }
  v161 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v161, 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = 0;
  v56 = objc_msgSend(v131, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM container_item WHERE container_pid = ?"), v55, &v145);
  v113 = v145;

  if ((v56 & 1) == 0)
  {
    v107 = v13;
    v108 = v17;
    v25 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v151 = (uint64_t)v113;
      _os_log_impl(&dword_1AC149000, v25, OS_LOG_TYPE_ERROR, "Failed to delete all existing container_item rows with error: %{public}@", buf, 0xCu);
    }
    goto LABEL_80;
  }
LABEL_81:

  v104 = -[ML3Container _reloadContainedMediaTypes:removedMediaTypes:addedMediaTypes:notify:incrementEntityRevision:usingConnection:](v20, "_reloadContainedMediaTypes:removedMediaTypes:addedMediaTypes:notify:incrementEntityRevision:usingConnection:", v13, v112, v111, a9, a10, v131);
  return v104;
}

void __55__ML3Container__setContainerSeedItemPersistentIDValue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__ML3Container__setContainerSeedItemPersistentIDValue___block_invoke_2;
  v7[3] = &unk_1E5B62088;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  objc_msgSend(v6, "performTransactionWithBlock:", v7);

}

uint64_t __55__ML3Container__setContainerSeedItemPersistentIDValue___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[2];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1[5] + 16));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM container_seed WHERE container_pid = ?;"),
                  v4,
                  0);

  if (!(_DWORD)v2)
    return 0;
  v5 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1[5] + 16));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[6];
  v11[0] = v6;
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "executeUpdate:withParameters:error:", CFSTR("INSERT INTO container_seed (container_pid, item_pid) VALUES (?, ?);"),
         v8,
         0);

  return v9;
}

void __62__ML3Container__removeTracksAtIndexes_notify_usingConnection___block_invoke(_QWORD *a1, unint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  unint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  id v33;
  id v34;
  id v35;
  _QWORD v36[3];
  _QWORD v37[3];
  uint8_t buf[4];
  id v39;
  _QWORD v40[4];

  v40[3] = *MEMORY[0x1E0C80C00];
  v7 = *(_QWORD *)(a1[7] + 8);
  v8 = *(_QWORD *)(v7 + 24);
  if (v8)
    v9 = a2 > v8;
  else
    v9 = 1;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a1[10], a1[4], CFSTR("ML3Container.m"), 2129, CFSTR("[NSIndexSet enumerateRangesUsingBlock:] is not enumerating ranges in order!"));

    v7 = *(_QWORD *)(a1[7] + 8);
  }
  *(_QWORD *)(v7 + 24) = a2;
  v10 = (void *)a1[5];
  v40[0] = a1[6];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2 - *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2 + a3 + ~*(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v14 = objc_msgSend(v10, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM container_item_person WHERE container_item_pid in (SELECT container_item_pid from container_item where container_pid = ? AND position BETWEEN ? AND ?)"), v13, &v35);
  v15 = v35;
  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = v14;

  if ((v14 & 1) == 0)
  {
    v16 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v39 = v15;
      _os_log_impl(&dword_1AC149000, v16, OS_LOG_TYPE_ERROR, "Failed to delete from container_item_persons with error: %{public}@", buf, 0xCu);
    }

  }
  v17 = (void *)a1[5];
  v37[0] = a1[6];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2 - *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2 + a3 + ~*(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v21 = objc_msgSend(v17, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM container_item WHERE container_pid = ? AND position BETWEEN ? AND ?"), v20, &v34);
  v22 = v34;
  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = v21;

  if (*(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24))
  {
    v23 = (void *)a1[5];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = a1[6];
    v36[0] = v24;
    v36[1] = v25;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2 - *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    LOBYTE(v23) = objc_msgSend(v23, "executeUpdate:withParameters:error:", CFSTR("UPDATE container_item SET position = (position - ?) WHERE container_pid = ? AND position >= ?"), v27, &v33);
    v28 = v33;
    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = (_BYTE)v23;

    if (!*(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24))
    {
      v29 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v39 = v28;
        _os_log_impl(&dword_1AC149000, v29, OS_LOG_TYPE_ERROR, "Failed to update container_item position(s) with error: %{public}@", buf, 0xCu);
      }

      *a4 = 1;
    }

  }
  else
  {
    v30 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v39 = v22;
      _os_log_impl(&dword_1AC149000, v30, OS_LOG_TYPE_ERROR, "Failed to delete existing container_item row(s) with error: %{public}@", buf, 0xCu);
    }

    *a4 = 1;
  }
  *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24) += a3;

}

void __93__ML3Container_setItemReactionText_onEntryAtPosition_forUserIdentifier_previousReactionText___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  ML3PersistentIDGenerator *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  id v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[6];
  id v33;
  void *v34;
  void *v35;
  _QWORD v36[6];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[5];
  _QWORD v42[2];
  ML3PersistentIDGenerator *v43;
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[3];

  v46[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1[4])
  {
    v46[0] = a1[4];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "executeQuery:withParameters:", CFSTR("SELECT person_pid FROM person WHERE cloud_id = ?"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "int64ValueForFirstRowAndColumn");

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1[5] + 16));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[9]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executeQuery:withParameters:", CFSTR("SELECT container_item_pid FROM container_item WHERE container_pid = ? AND position = ?"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "int64ValueForFirstRowAndColumn");

  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executeQuery:withParameters:", CFSTR("SELECT container_item_reaction_pid, reaction FROM container_item_reaction WHERE person_pid = ? AND container_item_pid = ?"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __93__ML3Container_setItemReactionText_onEntryAtPosition_forUserIdentifier_previousReactionText___block_invoke_2;
  v36[3] = &unk_1E5B65040;
  v16 = a1[7];
  v36[4] = &v37;
  v36[5] = v16;
  objc_msgSend(v15, "enumerateRowsWithBlock:", v36);

  if (v38[3])
  {
    if (a1[6])
    {
      v42[0] = a1[6];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
      v17 = (ML3PersistentIDGenerator *)objc_claimAutoreleasedReturnValue();
      v42[1] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0;
      v19 = objc_msgSend(v3, "executeUpdate:withParameters:error:", CFSTR("UPDATE container_item_reaction SET reaction = ? WHERE container_item_reaction_pid = ?"), v18, &v34);
      v20 = v34;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
      v17 = (ML3PersistentIDGenerator *)objc_claimAutoreleasedReturnValue();
      v43 = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      v19 = objc_msgSend(v3, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM container_item_reaction WHERE container_item_reaction_pid = ?"), v18, &v35);
      v20 = v35;
    }
    v29 = v20;
    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = v19;
  }
  else
  {
    v17 = -[ML3PersistentIDGenerator initWithDatabaseConnection:tableName:]([ML3PersistentIDGenerator alloc], "initWithDatabaseConnection:tableName:", v3, CFSTR("container_item_reaction"));
    v21 = -[ML3PersistentIDGenerator nextPersistentID](v17, "nextPersistentID");
    v38[3] = v21;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v18;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v11);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v31;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = a1[6];
    v41[2] = v22;
    v41[3] = v23;
    v24 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "timeIntervalSince1970");
    objc_msgSend(v24, "numberWithDouble:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v41[4] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v28 = objc_msgSend(v3, "executeUpdate:withParameters:error:", CFSTR("INSERT INTO container_item_reaction (container_item_reaction_pid, container_item_pid, person_pid, reaction, date) VALUES (?, ?, ?, ?, ?)"), v27, &v33);
    v29 = v33;
    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = v28;

  }
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __93__ML3Container_setItemReactionText_onEntryAtPosition_forUserIdentifier_previousReactionText___block_invoke_3;
  v32[3] = &unk_1E5B637A0;
  v30 = a1[8];
  v32[4] = a1[5];
  v32[5] = v30;
  objc_msgSend(v3, "enqueueBlockForTransactionCommit:", v32);

  _Block_object_dispose(&v37, 8);
}

void __93__ML3Container_setItemReactionText_onEntryAtPosition_forUserIdentifier_previousReactionText___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "int64ForColumnIndex:", 0);
  objc_msgSend(v3, "stringForColumnIndex:", 1);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __93__ML3Container_setItemReactionText_onEntryAtPosition_forUserIdentifier_previousReactionText___block_invoke_3(uint64_t a1, int a2)
{
  BOOL v2;
  id WeakRetained;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v2 = a2 == 0;
  else
    v2 = 1;
  if (!v2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(WeakRetained, "notifyDisplayValuesPropertyDidChange");

  }
}

void __42__ML3Container_childPlaylistPersistentIds__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __34__ML3Container_trackPersistentIds__block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", *a3);
}

uint64_t __45__ML3Container_removeTracksAtIndexes_notify___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_removeTracksAtIndexes:notify:usingConnection:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), a2);
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

BOOL __43__ML3Container_moveTrackFromIndex_toIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  _QWORD *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  _BOOL8 v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  id v31;
  NSObject *v32;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[8];
  uint8_t buf[4];
  id v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "persistentID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "_maxPositionForTracksUsingConnection:", v3);
  if (v5 == -1)
  {
    v6 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 134218240;
      v39 = v7;
      v40 = 2048;
      v41 = objc_msgSend(v7, "persistentID");
      _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_ERROR, "No tracks in container %p (pid = %lld)", buf, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  v8 = (_QWORD *)(a1 + 48);
  if (*(_QWORD *)(a1 + 48) > v5)
  {
    v9 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(void **)(a1 + 48);
      v11 = *(void **)(a1 + 32);
      v12 = objc_msgSend(v11, "persistentID");
      *(_DWORD *)buf = 134218752;
      v39 = v10;
      v40 = 2048;
      v41 = v5;
      v42 = 2048;
      v43 = v11;
      v44 = 2048;
      v45 = v12;
      _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_ERROR, "From index (%lu) out of bounds (%ld) of %p (pid = %lld)", buf, 0x2Au);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  v13 = (_QWORD *)(a1 + 56);
  if (*(_QWORD *)(a1 + 56) > v5)
  {
    v14 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = *(void **)(a1 + 56);
      v16 = *(void **)(a1 + 32);
      v17 = objc_msgSend(v16, "persistentID");
      *(_DWORD *)buf = 134218752;
      v39 = v15;
      v40 = 2048;
      v41 = v5;
      v42 = 2048;
      v43 = v16;
      v44 = 2048;
      v45 = v17;
      _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_ERROR, "To index (%lu) out of bounds (%ld) of %p (pid = %lld)", buf, 0x2Au);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v35 = v4;
    if (*v8 >= *v13)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *v8 - 1);
      v19 = objc_claimAutoreleasedReturnValue();
      v21 = (_QWORD *)(a1 + 56);
      v13 = (_QWORD *)(a1 + 48);
      v20 = &unk_1E5BAAF68;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *v8 + 1);
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *v13);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = &unk_1E5BAAF98;
      v21 = (_QWORD *)(a1 + 48);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *v21);
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *v13);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v25;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v26;
    v37[2] = v18;
    v27 = (void *)v18;
    v34 = (void *)v19;
    v37[3] = v19;
    v37[4] = v20;
    v28 = (void *)v23;
    v37[5] = v35;
    v37[6] = v23;
    v37[7] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v30 = objc_msgSend(v3, "executeUpdate:withParameters:error:", CFSTR("UPDATE container_item SET position = (CASE WHEN position = ? THEN ? ELSE CASE WHEN position BETWEEN ? AND ? THEN position + ? END END) WHERE container_pid = ? AND position BETWEEN ? AND ?"), v29, &v36);
    v31 = v36;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v30;

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_reloadContainedMediaTypes:removedMediaTypes:addedMediaTypes:notify:incrementEntityRevision:usingConnection:", 0, 0, 0, 1, 1, v3);
    }
    else
    {
      v32 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v39 = v31;
        _os_log_impl(&dword_1AC149000, v32, OS_LOG_TYPE_ERROR, "Failed to update positions in container_item with error: %{public}@", buf, 0xCu);
      }

    }
    v4 = v35;

    v22 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

BOOL __98__ML3Container_appendTracksWithPersistentIDs_andEntryProperties_withAttributionIdentifier_notify___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  __int128 v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  id v35;
  NSObject *v36;
  void *v37;
  char v38;
  NSObject *v39;
  NSObject *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _BOOL8 v49;
  __int128 v51;
  id obj;
  ML3PersistentIDGenerator *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  ML3PersistentIDGenerator *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  __CFString *v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  const __CFString *v73;
  void *v74;
  uint8_t buf[4];
  _BYTE v76[24];
  _QWORD v77[2];
  _QWORD v78[3];
  _QWORD v79[6];
  _BYTE v80[128];
  _QWORD v81[3];

  v81[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v57 = objc_msgSend(*(id *)(a1 + 32), "_maxPositionForTracksUsingConnection:", v3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "persistentID"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = -[ML3PersistentIDGenerator initWithDatabaseConnection:tableName:]([ML3PersistentIDGenerator alloc], "initWithDatabaseConnection:tableName:", v3, CFSTR("container_item"));
  v53 = -[ML3PersistentIDGenerator initWithDatabaseConnection:tableName:]([ML3PersistentIDGenerator alloc], "initWithDatabaseConnection:tableName:", v3, CFSTR("container_item_person"));
  if (!*(_QWORD *)(a1 + 40))
  {
LABEL_6:
    v62 = 0;
    goto LABEL_7;
  }
  v81[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executeQuery:withParameters:", CFSTR("SELECT person_pid FROM person WHERE cloud_id = ?"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "int64ValueForFirstRowAndColumn");

  v62 = v6;
  if (!v6)
  {
    v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v76 = v8;
      _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_ERROR, "No person entry for cloud ID '%{public}@' - skipping attribution", buf, 0xCu);
    }

    goto LABEL_6;
  }
LABEL_7:
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = *(id *)(a1 + 48);
  v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
  v10 = 0;
  if (!v55)
    goto LABEL_39;
  v54 = *(_QWORD *)v70;
  *(_QWORD *)&v9 = 138543618;
  v51 = v9;
  v61 = v3;
  v56 = a1;
  v11 = a1;
  while (2)
  {
    v12 = 0;
    v13 = v10;
    do
    {
      if (*(_QWORD *)v70 != v54)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v12);
      objc_msgSend(*(id *)(v11 + 56), "objectForKeyedSubscript:", v14, v51);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("uuid"));
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v16)
        v18 = (__CFString *)v16;
      else
        v18 = &stru_1E5B66908;
      v19 = v18;

      v64 = v15;
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("position_uuid"));
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      if (v20)
        v22 = (__CFString *)v20;
      else
        v22 = &stru_1E5B66908;
      v23 = v22;

      v24 = -[ML3PersistentIDGenerator nextPersistentID](v58, "nextPersistentID");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v79[0] = v25;
      v79[1] = v59;
      v60 = v14;
      v79[2] = v14;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v57 + v12 + 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v79[3] = v26;
      v79[4] = v19;
      v63 = v19;
      v79[5] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 6);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v13;
      v3 = v61;
      v28 = objc_msgSend(v61, "executeUpdate:withParameters:error:", CFSTR("INSERT INTO container_item (container_item_pid, container_pid, item_pid, position, uuid, position_uuid) VALUES (?, ?, ?, ?, ?, ?)"), v27, &v68);
      v65 = v68;

      a1 = v11;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v11 + 64) + 8) + 24) = v28;

      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v11 + 64) + 8) + 24))
      {
        v39 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          goto LABEL_37;
        *(_DWORD *)buf = 138543362;
        v10 = v65;
        *(_QWORD *)v76 = v65;
        _os_log_impl(&dword_1AC149000, v39, OS_LOG_TYPE_ERROR, "Failed to insert container_item with error: %{public}@", buf, 0xCu);
LABEL_38:

        goto LABEL_39;
      }
      if (v62)
      {
        v29 = -[ML3PersistentIDGenerator nextPersistentID](v53, "nextPersistentID");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v78[0] = v30;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v24);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v78[1] = v31;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v62);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v78[2] = v32;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 3);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = 0;
        v34 = objc_msgSend(v61, "executeUpdate:withParameters:error:", CFSTR("INSERT INTO container_item_person (container_item_person_pid, container_item_pid, person_pid) VALUES (?, ?, ?)"), v33, &v67);
        v35 = v67;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v11 + 64) + 8) + 24) = v34;

        if ((v34 & 1) == 0)
        {
          v36 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v51;
            *(_QWORD *)v76 = v60;
            *(_WORD *)&v76[8] = 2114;
            *(_QWORD *)&v76[10] = v35;
            _os_log_impl(&dword_1AC149000, v36, OS_LOG_TYPE_ERROR, "Failed to add container_item_person for track %{public}@. err = %{public}@", buf, 0x16u);
          }

        }
        v3 = v61;
      }
      v10 = v65;
      if ((*(_DWORD *)(v11 + 72) - 1) <= 1)
      {
        v77[0] = v60;
        v77[1] = &unk_1E5BAAF68;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 2);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = 0;
        v38 = objc_msgSend(v3, "executeUpdate:withParameters:error:", CFSTR("UPDATE item set keep_local=0 WHERE (item_pid=? AND keep_local<?);"),
                v37,
                &v66);
        v39 = v66;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v11 + 64) + 8) + 24) = v38;

        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v11 + 64) + 8) + 24))
        {

          goto LABEL_28;
        }
        v40 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          v41 = *(_DWORD *)(v11 + 72);
          v42 = objc_msgSend(v60, "longLongValue");
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v76 = v41;
          *(_WORD *)&v76[4] = 2048;
          *(_QWORD *)&v76[6] = v42;
          *(_WORD *)&v76[14] = 2114;
          *(_QWORD *)&v76[16] = v39;
          _os_log_impl(&dword_1AC149000, v40, OS_LOG_TYPE_ERROR, "Could not set keep_local to %d for track %lld - error: %{public}@", buf, 0x1Cu);
        }

LABEL_37:
        v10 = v65;
        goto LABEL_38;
      }
LABEL_28:

      ++v12;
      v13 = v65;
    }
    while (v55 != v12);
    v57 += v12;
    a1 = v56;
    v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
    if (v55)
      continue;
    break;
  }
LABEL_39:

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v43 = *(void **)(a1 + 32);
    v44 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v44, "numberWithDouble:");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = CFSTR("date_modified");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setValues:forProperties:usingConnection:", v46, v47, v3);

    +[ML3Container _mediaTypesForTracksWithPersistentIDs:usingConnection:](ML3Container, "_mediaTypesForTracksWithPersistentIDs:usingConnection:", *(_QWORD *)(a1 + 48), v3);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_reloadContainedMediaTypes:removedMediaTypes:addedMediaTypes:notify:incrementEntityRevision:usingConnection:", objc_msgSend(v48, "count") == 0, 0, v48, *(unsigned __int8 *)(a1 + 76), 1, v3);

    v49 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) != 0;
  }
  else
  {
    v49 = 0;
  }

  return v49;
}

uint64_t __95__ML3Container_setTracksWithPersistentIDs_andEntryProperties_withAttributionIdentifier_notify___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  BYTE1(v4) = 1;
  LOBYTE(v4) = *(_BYTE *)(a1 + 72);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_setItemPersistentIDs:andEntryProperties:withAttributionIdentifier:reloadContainedMediaTypes:removedMediaTypes:addedMediaTypes:notify:incrementEntityRevision:usingConnection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 1, 0, 0, v4, a2);
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
}

uint64_t __31__ML3Container_removeAllTracks__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  LOWORD(v4) = 257;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_setItemPersistentIDs:andEntryProperties:withAttributionIdentifier:reloadContainedMediaTypes:removedMediaTypes:addedMediaTypes:notify:incrementEntityRevision:usingConnection:", 0, MEMORY[0x1E0C9AA70], 0, 1, 0, 0, v4, a2);
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __66__ML3Container_setValues_forProperties_async_withCompletionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  if (objc_msgSend(v13, "isEqual:", CFSTR("name")))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 40), "nameOrderForString:", v5);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 8));
      v9 = objc_msgSend(WeakRetained, "insertStringIntoSortMapNoTransaction:", v5);

    }
    else
    {
      v9 = v6;
    }
    v11 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("name_order"));

    goto LABEL_8;
  }
  if (objc_msgSend(v13, "isEqual:", CFSTR("container_seed.item_pid")))
  {
    objc_msgSend(*(id *)(a1 + 64), "addIndex:", a3);
    v10 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setContainerSeedItemPersistentIDValue:", v5);
LABEL_8:

  }
}

void __66__ML3Container_setValues_forProperties_async_withCompletionBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "addObject:", a2);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

+ (id)sectionPropertyForProperty:(id)a3
{
  return (id)objc_msgSend((id)ML3ContainerSectionPropertyForProperties, "objectForKey:", a3);
}

+ (id)foreignDatabaseTableForProperty:(id)a3
{
  return (id)objc_msgSend((id)ML3ContainerForeignDatabaseTableForProperties, "objectForKey:", a3);
}

+ (id)foreignColumnForProperty:(id)a3
{
  return (id)objc_msgSend((id)ML3ContainerForeignColumnForProperties, "objectForKey:", a3);
}

+ (id)extraTablesToDelete
{
  return (id)ML3ContainerExtraTablesToDelete;
}

+ (id)persistentIDColumnForTable:(id)a3
{
  return (id)objc_msgSend((id)ML3ContainerPersistentIDForTable, "objectForKey:", a3);
}

+ (BOOL)libraryDynamicChangeForProperty:(id)a3
{
  return objc_msgSend((id)ML3ContainerContentsUnchangingProperties, "containsObject:", a3);
}

+ (BOOL)assistantLibraryContentsChangeForProperty:(id)a3
{
  return objc_msgSend((id)ML3ContainerNoAssistantSyncProperties, "containsObject:", a3) ^ 1;
}

+ (id)nextFilepathForPlaylistType:(int)a3 withPersistentID:(unint64_t)a4 inLibrary:(id)a5
{
  id v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v16;
  void *v17;
  id v18;

  v9 = a5;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ML3Container.m"), 744, CFSTR("persistentID must be specified since it is part of the filename format."));

  }
  if (a3 == 3)
    v10 = 6;
  else
    v10 = 7;
  if (a3 == 2)
    v11 = 4;
  else
    v11 = v10;
  +[ML3MusicLibrary pathForResourceFileOrFolder:](ML3MusicLibrary, "pathForResourceFileOrFolder:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%llu"), &v18, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v18;
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ML3Container.m"), 762, CFSTR("Encountered error validating format. pathFormat=%@ error=%@"), v12, v14);

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)smartCriteriaCanBeEvaluated:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  NSObject *v9;
  int v10;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a3)
    goto LABEL_8;
  v12 = 0;
  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  v7 = MEMORY[0x1AF43C1F8](v5, v6, &v12);
  if (v7)
  {
    v8 = v7;
    v9 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v14 = v8;
      _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_ERROR, "Could not parse search criteria list for playlist with error %ld", buf, 0xCu);
    }

  }
  if (v12)
  {
    v10 = objc_msgSend(a1, "hasCriterionInCriteriaList:forITDBTrackField:", v12, 40) ^ 1;
    DisposeSearchCriteriaList();
  }
  else
  {
LABEL_8:
    LOBYTE(v10) = 0;
  }
  return v10;
}

+ (void)populateSortOrdersOfPropertyValues:(id)a3 inLibrary:(id)a4 cachedNameOrders:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__ML3Container_populateSortOrdersOfPropertyValues_inLibrary_cachedNameOrders___block_invoke;
  v14[3] = &unk_1E5B61D30;
  v15 = v7;
  v16 = v9;
  v17 = v8;
  v10 = v8;
  v11 = v9;
  v12 = v7;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1AF43CDE0](v14);
  ((void (**)(_QWORD, const __CFString *, const __CFString *))v13)[2](v13, CFSTR("name_order"), CFSTR("name"));

}

+ (BOOL)hasCriterionInCriteriaList:(SearchCriteriaList *)a3 forITDBTrackField:(int)a4
{
  unsigned int v4;
  unsigned int v5;
  unsigned int i;
  int SearchCriterionInfo;
  int v8;
  NSObject *v9;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  LockSearchCriteriaList();
  GetSearchCriteriaListOptions();
  v4 = CountSearchCriteria();
  if (v4)
  {
    v5 = v4;
    for (i = 1; ; ++i)
    {
      SearchCriterionInfo = GetSearchCriterionInfo();
      if (SearchCriterionInfo)
      {
        v8 = SearchCriterionInfo;
        v9 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v12 = v8;
          _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_ERROR, "Got an error getting search criterion info: %ld", buf, 0xCu);
        }

      }
      if (i >= v5)
        break;
    }
  }
  UnlockSearchCriteriaList();
  return 0;
}

+ (id)predicateForCriteriaList:(SearchCriteriaList *)a3 parentMatchedAny:(BOOL)a4
{
  id v5;
  int v6;
  int v7;
  int v8;
  _BOOL8 v9;
  int SearchCriterionInfo;
  int v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  uint32_t v15;
  uint64_t v16;
  void (*v17)(__int128 *, _QWORD);
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __int128 v24;
  __int128 v25;
  int v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  LockSearchCriteriaList();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = 0;
  GetSearchCriteriaListOptions();
  v6 = CountSearchCriteria();
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = a4;
    while (1)
    {
      v24 = 0u;
      v25 = 0u;
      SearchCriterionInfo = GetSearchCriterionInfo();
      if (SearchCriterionInfo)
        break;
      if (BYTE9(v24))
      {
        if (BYTE8(v24))
        {
          objc_msgSend(a1, "predicateForCriteriaList:parentMatchedAny:", (_QWORD)v25, v9);
          v16 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v24 > 0xB8)
          {
            v12 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v28) = v24;
              v13 = v12;
              v14 = "unhandled match type: unknown type %d";
              v15 = 8;
LABEL_6:
              _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_ERROR, v14, buf, v15);
            }
LABEL_12:

            goto LABEL_13;
          }
          v17 = (void (*)(__int128 *, _QWORD))TrackFieldToML3Info[2 * v24 + 1];
          if (!v17)
          {
            if ((_DWORD)v24 == 40)
              goto LABEL_13;
            v12 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              NSStringFromITDBTrackField(v24);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v28 = v18;
              _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_DEBUG, "unhandled match type: unfilterable type %{public}@", buf, 0xCu);

            }
            goto LABEL_12;
          }
          v17(&v24, TrackFieldToML3Info[2 * v24]);
          v16 = objc_claimAutoreleasedReturnValue();
        }
        v12 = v16;
        if (v16)
        {
          objc_msgSend(v5, "addObject:", v16);
          goto LABEL_12;
        }
      }
LABEL_13:
      if (v7 == ++v8)
        goto LABEL_23;
    }
    v11 = SearchCriterionInfo;
    v12 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v28 = (void *)v11;
      v13 = v12;
      v14 = "Got an error getting search criterion info: %ld";
      v15 = 12;
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_23:
  UnlockSearchCriteriaList();
  v19 = (void *)objc_opt_class();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v19, "predicateMatchingPredicates:", v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  if ((v26 & 2) != 0)
  {
    +[ML3UnaryPredicate predicateWithPredicate:](ML3NegationPredicate, "predicateWithPredicate:", v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v21;
  }

  return v20;
}

+ (BOOL)updateBuiltInSmartPlaylistNamesForCurrentLanguageInLibrary:(id)a3
{
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v11 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 120; i += 24)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", *(_QWORD *)((char *)&builtInCriteriaInfo + i), &stru_1E5B66908, CFSTR("MLLocalizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)((char *)&builtInCriteriaInfo + i + 20));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, v7);

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__ML3Container_updateBuiltInSmartPlaylistNamesForCurrentLanguageInLibrary___block_invoke;
  v12[3] = &unk_1E5B62EB8;
  v13 = v3;
  v14 = v11;
  v8 = v11;
  v9 = v3;
  objc_msgSend(v8, "performDatabaseTransactionWithBlock:", v12);

  return 1;
}

+ (id)autoCreatedBuiltInSmartPlaylistsPIDs:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  _QWORD v15[4];
  id v16;

  v3 = a3;
  objc_msgSend(v3, "valueForDatabaseProperty:", CFSTR("createdBuiltInSmartPlaylists"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 120; i += 24)
    {
      +[ML3ComparisonPredicate predicateWithProperty:equalToInteger:](ML3ComparisonPredicate, "predicateWithProperty:equalToInteger:", CFSTR("distinguished_kind"), *(unsigned int *)((char *)&builtInCriteriaInfo + i + 20));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v9);

    }
    +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AnyCompoundPredicate, "predicateMatchingPredicates:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3Entity queryWithLibrary:predicate:](ML3Container, "queryWithLibrary:predicate:", v3, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForDatabaseProperty:", CFSTR("autoCreatedSmartPlaylistsDeleted"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    if ((v13 & 1) == 0)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __53__ML3Container_autoCreatedBuiltInSmartPlaylistsPIDs___block_invoke;
      v15[3] = &unk_1E5B65960;
      v16 = v6;
      objc_msgSend(v11, "enumeratePersistentIDsUsingBlock:", v15);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)deleteAutoCreatedBuiltInSmartPlaylistsPIDs:(id)a3 inLibrary:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__ML3Container_deleteAutoCreatedBuiltInSmartPlaylistsPIDs_inLibrary___block_invoke;
    v7[3] = &unk_1E5B642E8;
    v8 = v5;
    v9 = v6;
    objc_msgSend(v9, "databaseConnectionAllowingWrites:withBlock:", 1, v7);

  }
}

+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6
{
  id v10;
  void *v11;
  BOOL v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  unint64_t v17;
  const int64_t *v18;
  id v19;
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v10 = a3;
  v11 = v10;
  v12 = 1;
  if (a6)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 1;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __67__ML3Container_deleteFromLibrary_deletionType_persistentIDs_count___block_invoke;
    v14[3] = &unk_1E5B61E80;
    v17 = a6;
    v18 = a5;
    v19 = a1;
    v20 = a4;
    v15 = v10;
    v16 = &v21;
    objc_msgSend(v15, "performDatabaseTransactionWithBlock:", v14);
    v12 = *((_BYTE *)v22 + 24) != 0;

    _Block_object_dispose(&v21, 8);
  }

  return v12;
}

+ (void)_updateContainedMediaTypeInContainerWithPersistentID:(int64_t)a3 connection:(id)a4 itemUpdateBlock:(id)a5
{
  id v7;
  _QWORD v8[4];
  id v9;
  int64_t v10;

  v7 = a4;
  if ((*((unsigned int (**)(id))a5 + 2))(a5))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __96__ML3Container__updateContainedMediaTypeInContainerWithPersistentID_connection_itemUpdateBlock___block_invoke;
    v8[3] = &unk_1E5B61EA8;
    v9 = v7;
    v10 = a3;
    objc_msgSend(v9, "performTransactionWithBlock:", v8);

  }
}

+ (id)_mediaTypesForTracksWithPersistentIDs:(id)a3 usingConnection:(id)a4
{
  id v5;
  id v6;
  MLMediaTypeCountedSet *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  MLMediaTypeCountedSet *v19;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MLMediaTypeCountedSet);
  +[ML3DatabaseStatementRenderer defaultRenderer](ML3DatabaseStatementRenderer, "defaultRenderer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "count");
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    do
    {
      if (v10 - v12 >= 0x64)
        v13 = 100;
      else
        v13 = v10 - v12;
      objc_msgSend(v5, "subarrayWithRange:", v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 += v13;
      objc_msgSend(v8, "statementWithPrefix:inParameterCount:", CFSTR("SELECT media_type, COUNT(media_type) FROM item WHERE item_pid"), v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "stringByAppendingString:", CFSTR(" GROUP BY media_type"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "executeQuery:withParameters:", v11, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __70__ML3Container__mediaTypesForTracksWithPersistentIDs_usingConnection___block_invoke;
      v18[3] = &unk_1E5B65EE0;
      v19 = v7;
      objc_msgSend(v16, "enumerateRowsWithBlock:", v18);

    }
    while (v12 < v10);

  }
  return v7;
}

+ (id)_mediaTypesForTracksInContainerWithPersistentID:(int64_t)a3 connection:(id)a4
{
  id v5;
  MLMediaTypeCountedSet *v6;
  void *v7;
  void *v8;
  void *v9;
  MLMediaTypeCountedSet *v10;
  _QWORD v12[4];
  MLMediaTypeCountedSet *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc_init(MLMediaTypeCountedSet);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executeQuery:withParameters:", CFSTR("SELECT media_type, COUNT(media_type) FROM item JOIN container_item USING (item_pid) WHERE container_pid = ? GROUP BY media_type"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__ML3Container__mediaTypesForTracksInContainerWithPersistentID_connection___block_invoke;
  v12[3] = &unk_1E5B65EE0;
  v10 = v6;
  v13 = v10;
  objc_msgSend(v9, "enumerateRowsWithBlock:", v12);

  return v10;
}

+ (void)_clearContainerMediaTypeInContainerWithPersistentID:(int64_t)a3 connection:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  int64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__ML3Container__clearContainerMediaTypeInContainerWithPersistentID_connection___block_invoke;
  v8[3] = &unk_1E5B61EA8;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  objc_msgSend(a1, "_updateContainedMediaTypeInContainerWithPersistentID:connection:itemUpdateBlock:", a3, v7, v8);

}

+ (void)_addMediaTypesToContainerWithPersistentID:(int64_t)a3 mediaTypes:(id)a4 connection:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  int64_t v13;

  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __80__ML3Container__addMediaTypesToContainerWithPersistentID_mediaTypes_connection___block_invoke;
    v10[3] = &unk_1E5B61F20;
    v11 = v9;
    v12 = v8;
    v13 = a3;
    objc_msgSend(a1, "_updateContainedMediaTypeInContainerWithPersistentID:connection:itemUpdateBlock:", a3, v11, v10);

  }
}

+ (void)_removeMediaTypesFromContainerWithPersistentID:(int64_t)a3 mediaTypes:(id)a4 connection:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  int64_t v14;

  v7 = a4;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__ML3Container__removeMediaTypesFromContainerWithPersistentID_mediaTypes_connection___block_invoke;
  v11[3] = &unk_1E5B61F20;
  v12 = v7;
  v13 = v8;
  v14 = a3;
  v9 = v8;
  v10 = v7;
  +[ML3Container _updateContainedMediaTypeInContainerWithPersistentID:connection:itemUpdateBlock:](ML3Container, "_updateContainedMediaTypeInContainerWithPersistentID:connection:itemUpdateBlock:", a3, v9, v11);

}

+ (void)populateMediaTypesOfStaticContainersInLibrary:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__ML3Container_populateMediaTypesOfStaticContainersInLibrary___block_invoke;
  v7[3] = &unk_1E5B642E8;
  v8 = v3;
  v9 = v4;
  v5 = v4;
  v6 = v3;
  objc_msgSend(v6, "databaseConnectionAllowingWrites:withBlock:", 0, v7);

}

+ (void)removeAnyNonLibraryItemsInPersistentIDs:(id)a3 fromContainersInLibrary:(id)a4 usingConnection:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v21 = a3;
  v20 = a4;
  v7 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3DatabaseStatementRenderer defaultRenderer](ML3DatabaseStatementRenderer, "defaultRenderer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v21, "count");
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    do
    {
      if (v11 - v12 >= 0x64)
        v13 = 100;
      else
        v13 = v11 - v12;
      objc_msgSend(v21, "subarrayWithRange:", v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 += v13;
      objc_msgSend(v9, "statementWithPrefix:inParameterCount:", CFSTR("SELECT IFNULL(in_my_library, 0), container_pid, position FROM container_item LEFT OUTER JOIN item USING (item_pid) JOIN container USING (container_pid) WHERE distinguished_kind IN (0, 19, 20) AND smart_criteria IS NULL AND is_hidden = 0 AND cloud_is_subscribed = 0 AND cloud_is_curator_playlist = 0 AND (item.item_pid IS NULL OR container_item.item_pid"), v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByAppendingString:", CFSTR(")"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "executeQuery:withParameters:", v16, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __96__ML3Container_removeAnyNonLibraryItemsInPersistentIDs_fromContainersInLibrary_usingConnection___block_invoke;
      v25[3] = &unk_1E5B65EE0;
      v26 = v8;
      objc_msgSend(v17, "enumerateRowsWithBlock:", v25);

    }
    while (v12 < v11);
  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __96__ML3Container_removeAnyNonLibraryItemsInPersistentIDs_fromContainersInLibrary_usingConnection___block_invoke_2;
  v22[3] = &unk_1E5B62038;
  v23 = v20;
  v24 = v7;
  v18 = v7;
  v19 = v20;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v22);

}

+ (void)removeNonLibraryItemsFromContainersInLibrary:(id)a3 usingConnection:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "_allStaticItemContainersInLibrary:usingConnection:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(a1, "removeNonLibraryItemsFromContainer:usingConnection:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), v6);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

+ (void)removeNonLibraryItemsFromContainer:(id)a3 usingConnection:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3788];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "indexSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v7, "persistentID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeQuery:withParameters:", CFSTR("SELECT position FROM container_item LEFT OUTER JOIN item USING (item_pid) WHERE NOT IFNULL(in_my_library, 0) AND container_pid = ?"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__ML3Container_removeNonLibraryItemsFromContainer_usingConnection___block_invoke;
  v13[3] = &unk_1E5B65EE0;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "enumerateRowsWithBlock:", v13);
  objc_msgSend(v7, "_removeTracksAtIndexes:notify:usingConnection:", v12, 1, v6);

}

+ (void)reloadContainedMediaTypesForContainerWithPersistID:(int64_t)a3 usingConnection:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  +[ML3Container _clearContainerMediaTypeInContainerWithPersistentID:connection:](ML3Container, "_clearContainerMediaTypeInContainerWithPersistentID:connection:", a3, v5);
  +[ML3Container _mediaTypesForTracksInContainerWithPersistentID:connection:](ML3Container, "_mediaTypesForTracksInContainerWithPersistentID:connection:", a3, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[ML3Container _addMediaTypesToContainerWithPersistentID:mediaTypes:connection:](ML3Container, "_addMediaTypesToContainerWithPersistentID:mediaTypes:connection:", a3, v6, v5);

}

+ (id)currentDeviceFavoritesPlaylistInLibrary:(id)a3 usingConnection:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  objc_msgSend(a4, "executeQuery:withParameters:", CFSTR("SELECT container_pid FROM container WHERE distinguished_kind=?"), &unk_1E5BAA890);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "int64ValueForFirstRowAndColumn");
  if (v7)
    v8 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Container, "newWithPersistentID:inLibrary:", v7, v5);
  else
    v8 = 0;

  return v8;
}

+ (id)_allStaticItemContainersInLibrary:(id)a3 usingConnection:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99DE8];
  v7 = a4;
  objc_msgSend(v6, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "executeQuery:", CFSTR("SELECT container.container_pid FROM container JOIN container_item ON (container.container_pid = container_item.container_pid AND position = 0) WHERE distinguished_kind = 0 AND smart_criteria IS NULL AND is_hidden = 0 AND cloud_is_subscribed = 0 AND cloud_is_curator_playlist = 0"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__ML3Container__allStaticItemContainersInLibrary_usingConnection___block_invoke;
  v15[3] = &unk_1E5B639C0;
  v16 = v5;
  v10 = v8;
  v17 = v10;
  v11 = v5;
  objc_msgSend(v9, "enumerateRowsWithBlock:", v15);
  v12 = v17;
  v13 = v10;

  return v13;
}

+ (void)_insertNewSmartPlaylist:(id)a3 criteriaBlob:(id)a4 evaluationOrder:(unsigned int)a5 limited:(BOOL)a6 trackOrder:(unsigned int)a7 distinguishedKind:(int)a8 inLibrary:(id)a9 cachedNameOrders:(id)a10
{
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v28;
  _QWORD v29[17];
  _QWORD v30[19];

  v10 = *(_QWORD *)&a8;
  v11 = *(_QWORD *)&a7;
  v12 = a6;
  v30[17] = *MEMORY[0x1E0C80C00];
  v30[0] = a3;
  v29[0] = CFSTR("name");
  v29[1] = CFSTR("distinguished_kind");
  v15 = (void *)MEMORY[0x1E0CB37E8];
  v16 = a10;
  v17 = a9;
  v18 = a4;
  v28 = a3;
  objc_msgSend(v15, "numberWithUnsignedInt:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v19;
  v29[2] = CFSTR("date_created");
  v20 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v20, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v21;
  v30[3] = &unk_1E5BAAFC8;
  v29[3] = CFSTR("parent_pid");
  v29[4] = CFSTR("is_hidden");
  v30[4] = &unk_1E5BAAFC8;
  v30[5] = &unk_1E5BAAFC8;
  v29[5] = CFSTR("smart_is_folder");
  v29[6] = CFSTR("smart_criteria");
  v30[6] = v18;
  v30[7] = &unk_1E5BAAF68;
  v29[7] = CFSTR("smart_is_dynamic");
  v29[8] = CFSTR("smart_is_filtered");
  v30[8] = &unk_1E5BAAF68;
  v30[9] = &unk_1E5BAAFC8;
  v29[9] = CFSTR("smart_is_genius");
  v29[10] = CFSTR("smart_is_limited");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[10] = v22;
  v29[11] = CFSTR("smart_limit_order");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[11] = v23;
  v29[12] = CFSTR("smart_evaluation_order");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[12] = v24;
  v30[13] = &unk_1E5BAAFE0;
  v29[13] = CFSTR("smart_limit_value");
  v29[14] = CFSTR("smart_limit_kind");
  v30[14] = &unk_1E5BAAFF8;
  v30[15] = &unk_1E5BAAF68;
  v29[15] = CFSTR("is_ignored_syncing");
  v29[16] = CFSTR("contained_media_type");
  v30[16] = &unk_1E5BAAFC8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 17);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = +[ML3Entity newWithDictionary:inLibrary:cachedNameOrders:](ML3Container, "newWithDictionary:inLibrary:cachedNameOrders:", v25, v17, v16);
}

+ (BOOL)_reloadContainedMediaTypes:(BOOL)a3 removedMediaTypes:(id)a4 addedMediaTypes:(id)a5 notify:(BOOL)a6 incrementEntityRevision:(BOOL)a7 usingLibrary:(id)a8 connection:(id)a9 forContainerPersistentID:(int64_t)a10
{
  _BOOL4 v11;
  _BOOL4 v12;
  int v14;
  id v17;
  id v18;
  id v19;
  id v20;
  int v21;
  char v22;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, int);
  void *v28;
  id v29;
  int64_t v30;

  v11 = a7;
  v12 = a6;
  v14 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a8;
  v20 = a9;
  if ((v14 & 1) != 0 || objc_msgSend(v18, "count") || objc_msgSend(v17, "count"))
  {
    v21 = objc_msgSend(v18, "count") || objc_msgSend(v17, "count") != 0;
    if (v21 == v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ML3Container.m"), 2075, CFSTR("Only one of reloadContainedMediaTypes, and removedMediaTypes/addedMediaTypes can be used"));

    }
  }
  if (objc_msgSend(v17, "count"))
    +[ML3Container _removeMediaTypesFromContainerWithPersistentID:mediaTypes:connection:](ML3Container, "_removeMediaTypesFromContainerWithPersistentID:mediaTypes:connection:", a10, v17, v20);
  if (objc_msgSend(v18, "count"))
    +[ML3Container _addMediaTypesToContainerWithPersistentID:mediaTypes:connection:](ML3Container, "_addMediaTypesToContainerWithPersistentID:mediaTypes:connection:", a10, v18, v20);
  if (v12)
  {
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __157__ML3Container__reloadContainedMediaTypes_removedMediaTypes_addedMediaTypes_notify_incrementEntityRevision_usingLibrary_connection_forContainerPersistentID___block_invoke;
    v28 = &unk_1E5B65008;
    v30 = a10;
    v29 = v19;
    objc_msgSend(v20, "enqueueBlockForTransactionCommit:", &v25);

  }
  if (v11)
  {
    v22 = objc_msgSend((id)objc_opt_class(), "incrementRevisionWithLibrary:persistentID:deletionType:revisionType:usingConnection:", v19, a10, 0, 0, v20);
    if (!v14)
      goto LABEL_20;
    goto LABEL_19;
  }
  v22 = 1;
  if (v14)
LABEL_19:
    +[ML3Container reloadContainedMediaTypesForContainerWithPersistID:usingConnection:](ML3Container, "reloadContainedMediaTypesForContainerWithPersistID:usingConnection:", a10, v20, v25, v26, v27, v28);
LABEL_20:

  return v22;
}

void __157__ML3Container__reloadContainedMediaTypes_removedMediaTypes_addedMediaTypes_notify_incrementEntityRevision_usingLibrary_connection_forContainerPersistentID___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  int v4;
  void *v5;
  ML3Container *v6;

  if (a2)
  {
    v6 = -[ML3Entity initWithPersistentID:inLibrary:]([ML3Container alloc], "initWithPersistentID:inLibrary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    -[ML3Entity valueForProperty:](v6, "valueForProperty:", CFSTR("is_hidden"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLValue");

    v5 = *(void **)(a1 + 32);
    if (v4)
    {
      objc_msgSend(v5, "notifyNonContentsPropertyDidChange");
    }
    else
    {
      objc_msgSend(v5, "notifyEntitiesAddedOrRemoved");
      objc_msgSend(*(id *)(a1 + 32), "notifyContentsDidChange");
    }

  }
}

void __66__ML3Container__allStaticItemContainersInLibrary_usingConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Container, "newWithPersistentID:inLibrary:", objc_msgSend(a2, "int64ForColumnIndex:", 0), *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

uint64_t __67__ML3Container_removeNonLibraryItemsFromContainer_usingConnection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(a2, "int64ForColumnIndex:", 0));
}

void __96__ML3Container_removeAnyNonLibraryItemsInPersistentIDs_fromContainersInLibrary_usingConnection___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = objc_msgSend(v9, "intForColumnIndex:", 0);
  v4 = v9;
  if (!v3)
  {
    objc_msgSend(v9, "numberForColumnIndex:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "int64ForColumnIndex:", 2);
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v7, "addIndex:", v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v8, v5);
    }

    v4 = v9;
  }

}

void __96__ML3Container_removeAnyNonLibraryItemsInPersistentIDs_fromContainersInLibrary_usingConnection___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Container, "newWithPersistentID:inLibrary:", objc_msgSend(a2, "longLongValue"), *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "_removeTracksAtIndexes:notify:usingConnection:", v5, 1, *(_QWORD *)(a1 + 40));

}

void __62__ML3Container_populateMediaTypesOfStaticContainersInLibrary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(v3, "executeQuery:", CFSTR("SELECT ROWID FROM container WHERE smart_is_dynamic = 0 AND is_hidden = 0"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__ML3Container_populateMediaTypesOfStaticContainersInLibrary___block_invoke_2;
  v10[3] = &unk_1E5B639C0;
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v7, "enumerateRowsWithBlock:", v10);
  v5 = *(void **)(a1 + 40);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __62__ML3Container_populateMediaTypesOfStaticContainersInLibrary___block_invoke_3;
  v8[3] = &unk_1E5B61F48;
  v9 = v3;
  v6 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

}

void __62__ML3Container_populateMediaTypesOfStaticContainersInLibrary___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Container, "newWithPersistentID:inLibrary:", objc_msgSend(a2, "int64ForColumnIndex:", 0), *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

uint64_t __62__ML3Container_populateMediaTypesOfStaticContainersInLibrary___block_invoke_3(uint64_t a1, void *a2)
{
  return +[ML3Container reloadContainedMediaTypesForContainerWithPersistID:usingConnection:](ML3Container, "reloadContainedMediaTypesForContainerWithPersistID:usingConnection:", objc_msgSend(a2, "persistentID"), *(_QWORD *)(a1 + 32));
}

uint64_t __85__ML3Container__removeMediaTypesFromContainerWithPersistentID_mediaTypes_connection___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__ML3Container__removeMediaTypesFromContainerWithPersistentID_mediaTypes_connection___block_invoke_2;
  v7[3] = &unk_1E5B61ED0;
  v9 = &v11;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v8 = v3;
  v10 = v4;
  objc_msgSend(v2, "enumerateMediaTypesWithBlock:", v7);
  v5 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v5;
}

void __85__ML3Container__removeMediaTypesFromContainerWithPersistentID_mediaTypes_connection___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v7 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[6], v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v7, "executeUpdate:withParameters:error:", CFSTR("UPDATE container_item_media_type SET count = count - ? WHERE container_pid = ? AND media_type = ?"), v11, 0);

  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    *a4 = 1;
}

uint64_t __80__ML3Container__addMediaTypesToContainerWithPersistentID_mediaTypes_connection___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__ML3Container__addMediaTypesToContainerWithPersistentID_mediaTypes_connection___block_invoke_2;
  v7[3] = &unk_1E5B61EF8;
  v2 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v10 = &v12;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v9 = v3;
  v11 = v4;
  objc_msgSend(v2, "performTransactionWithBlock:", v7);
  v5 = *((unsigned __int8 *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v5;
}

uint64_t __80__ML3Container__addMediaTypesToContainerWithPersistentID_mediaTypes_connection___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;

  v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__ML3Container__addMediaTypesToContainerWithPersistentID_mediaTypes_connection___block_invoke_3;
  v7[3] = &unk_1E5B61ED0;
  v6 = *(_OWORD *)(a1 + 40);
  v3 = (id)v6;
  v8 = v6;
  v9 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "enumerateMediaTypesWithBlock:", v7);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

  return v4;
}

void __80__ML3Container__addMediaTypesToContainerWithPersistentID_mediaTypes_connection___block_invoke_3(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[3];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v8 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[6]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v8, "executeUpdate:withParameters:error:", CFSTR("INSERT OR IGNORE INTO container_item_media_type (container_pid, media_type) VALUES(?, ?)"), v11, 0);

  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    goto LABEL_3;
  v12 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1[6], v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v12, "executeUpdate:withParameters:error:", CFSTR("UPDATE container_item_media_type SET count = count + ? WHERE container_pid = ? AND media_type = ?"), v16, 0);

  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
LABEL_3:
    *a4 = 1;
}

uint64_t __79__ML3Container__clearContainerMediaTypeInContainerWithPersistentID_connection___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v1, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM container_item_media_type WHERE container_pid = ?"), v3, 0);

  return v4;
}

uint64_t __75__ML3Container__mediaTypesForTracksInContainerWithPersistentID_connection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "numberForColumnIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  objc_msgSend(v3, "numberForColumnIndex:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "integerValue");
  return objc_msgSend(*(id *)(a1 + 32), "addMediaType:count:", v5, v7);
}

void __70__ML3Container__mediaTypesForTracksWithPersistentIDs_usingConnection___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "numberForColumnIndex:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v6, "integerValue");
  objc_msgSend(v3, "numberForColumnIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addMediaType:count:", v4, objc_msgSend(v5, "integerValue"));
}

uint64_t __96__ML3Container__updateContainedMediaTypeInContainerWithPersistentID_connection_itemUpdateBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;
  _QWORD v17[2];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery:withParameters:", CFSTR("SELECT media_type FROM container_item_media_type WHERE container_pid = ? AND count > 0"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __96__ML3Container__updateContainedMediaTypeInContainerWithPersistentID_connection_itemUpdateBlock___block_invoke_2;
  v12[3] = &unk_1E5B65200;
  v12[4] = &v13;
  objc_msgSend(v5, "enumerateRowsWithBlock:", v12);
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)v14 + 6));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "executeUpdate:withParameters:error:", CFSTR("UPDATE container SET contained_media_type = ? WHERE container_pid = ?"), v9, 0);

  _Block_object_dispose(&v13, 8);
  return v10;
}

void __96__ML3Container__updateContainedMediaTypeInContainerWithPersistentID_connection_itemUpdateBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  int v4;

  objc_msgSend(a2, "numberForColumnIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if (v4 != 0xFFFFFF)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= v4;
}

BOOL __67__ML3Container_deleteFromLibrary_deletionType_persistentIDs_count___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  void *v18;
  char v19;
  id v20;
  NSObject *v21;
  void *v22;
  char v23;
  id v24;
  NSObject *v25;
  void *v26;
  char v27;
  id v28;
  NSObject *v29;
  void *v30;
  char v31;
  id v32;
  NSObject *v33;
  char v34;
  id v35;
  NSObject *v36;
  _BOOL8 v37;
  void *v39;
  void *v40;
  void *v41;
  id obj;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  objc_super v55;
  _QWORD v56[6];
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  void *v60;
  _QWORD v61[2];
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint8_t v66[128];
  __int128 buf;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", *(_QWORD *)(a1 + 48));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 48))
  {
    v4 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v4));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addObject:", v5);

      ++v4;
    }
    while (v4 < *(_QWORD *)(a1 + 48));
  }
  +[ML3ContainmentPredicate predicateWithProperty:values:](ML3ContainmentPredicate, "predicateWithProperty:values:", CFSTR("parent_pid"), v41);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3Entity queryWithLibrary:predicate:orderingTerms:](ML3Container, "queryWithLibrary:predicate:orderingTerms:", *(_QWORD *)(a1 + 32), v39, MEMORY[0x1E0C9AA60]);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v40, "countOfEntities");
  if (v6)
  {
    v7 = v6;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v68 = 0x2020000000;
    v69 = 0;
    v57 = 0;
    v58 = &v57;
    v59 = 0x2020000000;
    v60 = 0;
    v60 = malloc_type_malloc(8 * v6, 0x100004000313F17uLL);
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __67__ML3Container_deleteFromLibrary_deletionType_persistentIDs_count___block_invoke_2;
    v56[3] = &unk_1E5B61E58;
    v56[4] = &v57;
    v56[5] = &buf;
    objc_msgSend(v40, "enumeratePersistentIDsUsingBlock:", v56);
    objc_msgSend(*(id *)(a1 + 64), "deleteFromLibrary:deletionType:persistentIDs:count:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 72), v58[3], v7);
    free((void *)v58[3]);
    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(&buf, 8);
  }
  v8 = *(_QWORD *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(unsigned int *)(a1 + 72);
  v11 = *(_QWORD *)(a1 + 48);
  v55.receiver = *(id *)(a1 + 64);
  v55.super_class = (Class)&OBJC_METACLASS___ML3Container;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSendSuper2(&v55, sel_deleteFromLibrary_deletionType_persistentIDs_count_, v9, v10, v8, v11);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = v41;
    v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v66, 16);
    if (v44)
    {
      v43 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v52 != v43)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
          v65 = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = 0;
          v15 = objc_msgSend(v3, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM container_item_person WHERE container_item_pid in (SELECT container_item_pid from container_item where container_pid = ?)"), v14, &v50);
          v16 = v50;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v15;

          if ((v15 & 1) == 0)
          {
            v17 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138543362;
              *(_QWORD *)((char *)&buf + 4) = v16;
              _os_log_impl(&dword_1AC149000, v17, OS_LOG_TYPE_ERROR, "Failed to delete from container_item_persons with error: %{public}@", (uint8_t *)&buf, 0xCu);
            }

          }
          v64 = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v16;
          v19 = objc_msgSend(v3, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM container_item_reaction WHERE container_item_pid IN (SELECT container_item_pid FROM container_item WHERE container_pid = ?)"), v18, &v49);
          v20 = v49;

          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v19;
          if ((v19 & 1) == 0)
          {
            v21 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138543362;
              *(_QWORD *)((char *)&buf + 4) = v20;
              _os_log_impl(&dword_1AC149000, v21, OS_LOG_TYPE_ERROR, "Failed to delete from container_item with error: %{public}@", (uint8_t *)&buf, 0xCu);
            }

          }
          v63 = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v20;
          v23 = objc_msgSend(v3, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM container_item WHERE container_pid = ?"), v22, &v48);
          v24 = v48;

          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v23;
          if ((v23 & 1) == 0)
          {
            v25 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138543362;
              *(_QWORD *)((char *)&buf + 4) = v24;
              _os_log_impl(&dword_1AC149000, v25, OS_LOG_TYPE_ERROR, "Failed to delete from container_item with error: %{public}@", (uint8_t *)&buf, 0xCu);
            }

          }
          v62 = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v24;
          v27 = objc_msgSend(v3, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM container_author WHERE container_pid = ?"), v26, &v47);
          v28 = v47;

          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v27;
          if ((v27 & 1) == 0)
          {
            v29 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138543362;
              *(_QWORD *)((char *)&buf + 4) = v28;
              _os_log_impl(&dword_1AC149000, v29, OS_LOG_TYPE_ERROR, "Failed to delete from container_author with error: %{public}@", (uint8_t *)&buf, 0xCu);
            }

          }
          v61[0] = v13;
          v61[1] = &unk_1E5BAAF80;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v28;
          v31 = objc_msgSend(v3, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM artwork_token WHERE entity_pid = ? AND entity_type = ?"), v30, &v46);
          v32 = v46;

          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v31;
          if ((v31 & 1) == 0)
          {
            v33 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138543362;
              *(_QWORD *)((char *)&buf + 4) = v32;
              _os_log_impl(&dword_1AC149000, v33, OS_LOG_TYPE_ERROR, "Failed to delete from artwork_token with error: %{public}@", (uint8_t *)&buf, 0xCu);
            }

          }
          v45 = v32;
          v34 = objc_msgSend(v3, "executeUpdate:withParameters:error:", CFSTR("DELETE FROM best_artwork_token WHERE entity_pid = ? AND entity_type = ?"), v30, &v45);
          v35 = v45;

          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v34;
          if ((v34 & 1) == 0)
          {
            v36 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138543362;
              *(_QWORD *)((char *)&buf + 4) = v35;
              _os_log_impl(&dword_1AC149000, v36, OS_LOG_TYPE_ERROR, "Failed to delete from best_artwork_token with error: %{public}@", (uint8_t *)&buf, 0xCu);
            }

          }
        }
        v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v66, 16);
      }
      while (v44);
    }

    v37 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

uint64_t __67__ML3Container_deleteFromLibrary_deletionType_persistentIDs_count___block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  v3 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  v4 = *(_QWORD *)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v4 + 1;
  *(_QWORD *)(v2 + 8 * v4) = a2;
  return result;
}

void __69__ML3Container_deleteAutoCreatedBuiltInSmartPlaylistsPIDs_inLibrary___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__ML3Container_deleteAutoCreatedBuiltInSmartPlaylistsPIDs_inLibrary___block_invoke_2;
  v4[3] = &unk_1E5B61E30;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "performTransactionWithBlock:", v4);

}

uint64_t __69__ML3Container_deleteAutoCreatedBuiltInSmartPlaylistsPIDs_inLibrary___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__ML3Container_deleteAutoCreatedBuiltInSmartPlaylistsPIDs_inLibrary___block_invoke_3;
  v6[3] = &unk_1E5B61E08;
  v2 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v6);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forDatabaseProperty:", v4, CFSTR("autoCreatedSmartPlaylistsDeleted"));

  return 1;
}

void __69__ML3Container_deleteAutoCreatedBuiltInSmartPlaylistsPIDs_inLibrary___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  ML3Container *v4;
  uint64_t v5;
  ML3Container *v6;

  v3 = a2;
  v4 = [ML3Container alloc];
  v5 = objc_msgSend(v3, "longLongValue");

  v6 = -[ML3Entity initWithPersistentID:inLibrary:](v4, "initWithPersistentID:inLibrary:", v5, *(_QWORD *)(a1 + 32));
  -[ML3Entity deleteFromLibrary](v6, "deleteFromLibrary");

}

void __53__ML3Container_autoCreatedBuiltInSmartPlaylistsPIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __75__ML3Container_updateBuiltInSmartPlaylistNamesForCurrentLanguageInLibrary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  const __CFString *v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3ContainsPredicate predicateWithProperty:values:](ML3ContainsPredicate, "predicateWithProperty:values:", CFSTR("distinguished_kind"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", CFSTR("is_src_remote"), &unk_1E5BAAF68, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 40);
  v23[0] = v5;
  v23[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3CompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3Entity queryWithLibrary:predicate:](ML3Container, "queryWithLibrary:predicate:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = CFSTR("distinguished_kind");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __75__ML3Container_updateBuiltInSmartPlaylistNamesForCurrentLanguageInLibrary___block_invoke_337;
  v19[3] = &unk_1E5B61DB8;
  v20 = *(id *)(a1 + 32);
  v21 = v7;
  v14 = v7;
  objc_msgSend(v11, "enumeratePersistentIDsAndProperties:ordered:usingBlock:", v12, 0, v19);

  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __75__ML3Container_updateBuiltInSmartPlaylistNamesForCurrentLanguageInLibrary___block_invoke_2;
  v17[3] = &unk_1E5B61DE0;
  v18 = v3;
  v15 = v3;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v17);

  return 1;
}

void __75__ML3Container_updateBuiltInSmartPlaylistNamesForCurrentLanguageInLibrary___block_invoke_337(uint64_t a1, uint64_t a2, id *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = *a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v5, v7);

  }
}

void __75__ML3Container_updateBuiltInSmartPlaylistNamesForCurrentLanguageInLibrary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v17[0] = v6;
  v17[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v9 = objc_msgSend(v7, "executeUpdate:withParameters:error:", CFSTR("UPDATE container SET name = ? WHERE container_pid = ?"), v8, &v12);
  v10 = v12;

  if ((v9 & 1) == 0)
  {
    v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v14 = v5;
      v15 = 2114;
      v16 = v6;
      _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_ERROR, "Failed to update name of built-in smart playlist %{public}@ (%{public}@)", buf, 0x16u);
    }

  }
}

void __78__ML3Container_populateSortOrdersOfPropertyValues_inLibrary_cachedNameOrders___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  id v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(a1[4], "objectForKey:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(a1[5], "objectForKey:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
        v12 = objc_msgSend(v10, "ML3NameOrderValue");
      else
        v12 = objc_msgSend(a1[6], "nameOrderForString:", v9);
      v14 = v12;
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (a1[5])
        {
          v15 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v16 = a1[5];
            v18 = 138543874;
            v19 = v5;
            v20 = 2114;
            v21 = v9;
            v22 = 2114;
            v23 = v16;
            _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_ERROR, "Could not find sort order for %{public}@ of %{public}@ in %{public}@", (uint8_t *)&v18, 0x20u);
          }
          goto LABEL_12;
        }
        v14 = objc_msgSend(a1[6], "insertStringIntoSortMapNoTransaction:", v9);
      }
      v17 = a1[4];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKey:", v15, v5);
LABEL_12:

    }
  }

}

- (id)multiverseIdentifier
{
  MIPMultiverseIdentifier *v3;
  id WeakRetained;
  MIPLibraryIdentifier *v5;
  void *v6;
  MIPMultiverseIdentifier *v7;
  MIPMultiverseIdentifier *v8;
  MIPMultiverseIdentifier *v9;
  _QWORD v11[4];
  __CFString *v12;
  ML3Container *v13;
  MIPMultiverseIdentifier *v14;

  v3 = objc_alloc_init(MIPMultiverseIdentifier);
  -[MIPMultiverseIdentifier setMediaObjectType:](v3, "setMediaObjectType:", 7);
  WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  v5 = objc_alloc_init(MIPLibraryIdentifier);
  -[MIPLibraryIdentifier setLibraryId:](v5, "setLibraryId:", self->super._persistentID);
  objc_msgSend(WeakRetained, "libraryUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPLibraryIdentifier setLibraryName:](v5, "setLibraryName:", v6);

  -[MIPMultiverseIdentifier addLibraryIdentifiers:](v3, "addLibraryIdentifiers:", v5);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__ML3Container_MLProtocol__multiverseIdentifier__block_invoke;
  v11[3] = &unk_1E5B642B8;
  v12 = CFSTR("SELECT container.name, container.store_cloud_id, container.cloud_universal_library_id FROM container WHERE container.ROWID = ?");
  v13 = self;
  v7 = v3;
  v14 = v7;
  objc_msgSend(WeakRetained, "databaseConnectionAllowingWrites:withBlock:", 0, v11);
  v8 = v14;
  v9 = v7;

  return v9;
}

- (id)protocolItemForDynamicUpdate
{
  MIPPlaylist *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MIPPlaylist *v9;
  id v10;
  MIPPlaylist *v11;
  MIPPlaylist *v12;
  _QWORD v14[4];
  id v15;
  ML3Container *v16;
  MIPPlaylist *v17;

  v3 = objc_alloc_init(MIPPlaylist);
  if (protocolItemForDynamicUpdate_onceToken_41 != -1)
    dispatch_once(&protocolItemForDynamicUpdate_onceToken_41, &__block_literal_global_16266);
  WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  v5 = (void *)objc_opt_class();
  +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("ROWID"), self->super._persistentID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:", WeakRetained, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "selectPersistentIDsSQLAndProperties:ordered:", protocolItemForDynamicUpdate___playlistProperties, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__ML3Container_MLProtocol__protocolItemForDynamicUpdate__block_invoke_2;
  v14[3] = &unk_1E5B642B8;
  v15 = v8;
  v16 = self;
  v9 = v3;
  v17 = v9;
  v10 = v8;
  objc_msgSend(WeakRetained, "databaseConnectionAllowingWrites:withBlock:", 0, v14);
  v11 = v17;
  v12 = v9;

  return v12;
}

- (id)protocolItem
{
  MIPPlaylist *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MIPPlaylist *v9;
  id v10;
  id v11;
  MIPPlaylist *v12;
  MIPPlaylist *v13;
  _QWORD v15[4];
  id v16;
  ML3Container *v17;
  id v18;
  MIPPlaylist *v19;

  v3 = objc_alloc_init(MIPPlaylist);
  if (protocolItem_onceToken_42[0] != -1)
    dispatch_once(protocolItem_onceToken_42, &__block_literal_global_43);
  WeakRetained = objc_loadWeakRetained((id *)&self->super._library);
  v5 = (void *)objc_opt_class();
  +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("ROWID"), self->super._persistentID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:", WeakRetained, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "selectPersistentIDsSQLAndProperties:ordered:", protocolItem___playlistProperties, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __40__ML3Container_MLProtocol__protocolItem__block_invoke_2;
  v15[3] = &unk_1E5B64590;
  v16 = v8;
  v17 = self;
  v18 = WeakRetained;
  v9 = v3;
  v19 = v9;
  v10 = WeakRetained;
  v11 = v8;
  objc_msgSend(v10, "databaseConnectionAllowingWrites:withBlock:", 0, v15);
  v12 = v19;
  v13 = v9;

  return v13;
}

void __40__ML3Container_MLProtocol__protocolItem__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v16[0] = MEMORY[0x1E0C9AAA0];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
  v6 = a2;
  objc_msgSend(v3, "numberWithLongLong:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeQuery:withParameters:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__ML3Container_MLProtocol__protocolItem__block_invoke_3;
  v12[3] = &unk_1E5B64290;
  v13 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 40);
  v14 = v10;
  v15 = v11;
  objc_msgSend(v9, "enumerateRowsWithBlock:", v12);

}

void __40__ML3Container_MLProtocol__protocolItem__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  int v32;
  MIPSmartPlaylistInfo *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  ML3Container *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  void *v55;
  ML3Track *v56;
  void *v57;
  uint64_t v58;
  int v59;
  int v60;
  int v61;
  unsigned int v62;
  unsigned int v63;
  uint64_t v64;
  void *v65;
  int v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  int v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v68 = a3;
  v6 = objc_msgSend(v5, "int64ForColumnIndex:", 16);
  v64 = objc_msgSend(v5, "int64ForColumnIndex:", 2);
  objc_msgSend(v5, "stringForColumnIndex:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "intForColumnIndex:", 3);
  v71 = objc_msgSend(v5, "intForColumnIndex:", 4);
  v60 = objc_msgSend(v5, "intForColumnIndex:", 5);
  objc_msgSend(v5, "dataForColumnIndex:", 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v5, "intForColumnIndex:", 18);
  v62 = objc_msgSend(v5, "intForColumnIndex:", 19);
  v61 = objc_msgSend(v5, "intForColumnIndex:", 20);
  objc_msgSend(v5, "stringForColumnIndex:", 21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringForColumnIndex:", 52);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v5, "intForColumnIndex:", 53);
  objc_msgSend(v5, "stringForColumnIndex:", 54);
  v12 = objc_claimAutoreleasedReturnValue();
  v69 = v11;
  v70 = (void *)v12;
  if (v6)
  {
    v59 = v8;
    v13 = *(_QWORD *)(a1 + 32);
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("container_pid"), v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3Entity anyInLibrary:predicate:](ML3Container, "anyInLibrary:predicate:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v15, "multiverseIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setParentIdentifier:", v16);

    }
    v11 = v69;
    v8 = v59;
  }
  if (v64)
    objc_msgSend(*(id *)(a1 + 40), "setStoreId:");
  if (objc_msgSend(v7, "length"))
    objc_msgSend(*(id *)(a1 + 40), "setName:", v7);
  if (v8)
    objc_msgSend(*(id *)(a1 + 40), "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 40), "setDistinguishedKind:", v63);
  objc_msgSend(*(id *)(a1 + 40), "setSortType:", +[ML3Container protocolSortTypeFromTrackOrder:](ML3Container, "protocolSortTypeFromTrackOrder:", v62));
  objc_msgSend(*(id *)(a1 + 40), "setReversedSorting:", v61 != 0);
  if (v10)
    objc_msgSend(*(id *)(a1 + 40), "setCloudGlobalId:", v10);
  objc_msgSend(*(id *)(a1 + 40), "setCloudIsSubscribed:", objc_msgSend(v5, "intForColumnIndex:", 22) != 0);
  objc_msgSend(*(id *)(a1 + 40), "setCloudIsCuratorPlaylist:", objc_msgSend(v5, "intForColumnIndex:", 23) != 0);
  objc_msgSend(v5, "stringForColumnIndex:", 24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setExternalVendorIdentifier:", v17);

  objc_msgSend(v5, "stringForColumnIndex:", 25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setExternalVendorDisplayName:", v18);

  objc_msgSend(v5, "stringForColumnIndex:", 26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setExternalVendorTag:", v19);

  objc_msgSend(*(id *)(a1 + 40), "setExternalVendorPlaylist:", objc_msgSend(v5, "intForColumnIndex:", 27) != 0);
  objc_msgSend(*(id *)(a1 + 40), "setCreationDateTime:", objc_msgSend(v5, "int64ForColumnIndex:", 28));
  objc_msgSend(*(id *)(a1 + 40), "setModificationDateTime:", objc_msgSend(v5, "int64ForColumnIndex:", 29));
  objc_msgSend(*(id *)(a1 + 40), "setLastPlayedDateTime:", objc_msgSend(v5, "int64ForColumnIndex:", 30));
  objc_msgSend(*(id *)(a1 + 40), "setCloudIsSharingDisabled:", objc_msgSend(v5, "intForColumnIndex:", 31) != 0);
  objc_msgSend(v5, "stringForColumnIndex:", 32);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setCloudVersionHash:", v20);

  objc_msgSend(v5, "stringForColumnIndex:", 33);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setArtworkId:", v21);

  objc_msgSend(*(id *)(a1 + 40), "setLikedState:", objc_msgSend(v5, "intForColumnIndex:", 34));
  objc_msgSend(*(id *)(a1 + 40), "setRemoteSourceType:", objc_msgSend(v5, "intForColumnIndex:", 35));
  objc_msgSend(*(id *)(a1 + 40), "setOwner:", objc_msgSend(v5, "intForColumnIndex:", 36) != 0);
  objc_msgSend(*(id *)(a1 + 40), "setEditable:", objc_msgSend(v5, "intForColumnIndex:", 37) != 0);
  objc_msgSend(*(id *)(a1 + 40), "setPlayCount:", objc_msgSend(v5, "intForColumnIndex:", 38));
  objc_msgSend(*(id *)(a1 + 40), "setShared:", objc_msgSend(v5, "intForColumnIndex:", 39) != 0);
  objc_msgSend(*(id *)(a1 + 40), "setVisible:", objc_msgSend(v5, "intForColumnIndex:", 40) != 0);
  objc_msgSend(*(id *)(a1 + 40), "setAuthorStoreId:", (int)objc_msgSend(v5, "intForColumnIndex:", 41));
  objc_msgSend(v5, "stringForColumnIndex:", 42);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setAuthorDisplayName:", v22);

  objc_msgSend(v5, "stringForColumnIndex:", 43);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setAuthorStoreURL:", v23);

  objc_msgSend(v5, "stringForColumnIndex:", 44);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setAuthorHandle:", v24);

  objc_msgSend(*(id *)(a1 + 40), "setMinRefreshInterval:", objc_msgSend(v5, "int64ForColumnIndex:", 45));
  objc_msgSend(*(id *)(a1 + 40), "setCloudLastUpdateTime:", objc_msgSend(v5, "int64ForColumnIndex:", 46));
  objc_msgSend(*(id *)(a1 + 40), "setSubscriberCount:", objc_msgSend(v5, "intForColumnIndex:", 47));
  objc_msgSend(*(id *)(a1 + 40), "setSubscriberPlayCount:", objc_msgSend(v5, "intForColumnIndex:", 48));
  objc_msgSend(*(id *)(a1 + 40), "setSubscriberLikedCount:", objc_msgSend(v5, "intForColumnIndex:", 49));
  objc_msgSend(v5, "stringForColumnIndex:", 50);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setSubscriberURL:", v25);

  objc_msgSend(v5, "stringForColumnIndex:", 51);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setPlaylistDescription:", v26);

  objc_msgSend(*(id *)(a1 + 40), "setPlaylistCategoryTypeMask:", objc_msgSend(v5, "intForColumnIndex:", 55));
  objc_msgSend(v5, "stringForColumnIndex:", 56);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setPlaylistGroupingSortKey:", v27);

  objc_msgSend(*(id *)(a1 + 40), "setTraits:", objc_msgSend(v5, "intForColumnIndex:", 57));
  objc_msgSend(*(id *)(a1 + 40), "setLikedStateChangedDate:", (int)objc_msgSend(v5, "intForColumnIndex:", 58));
  objc_msgSend(v5, "stringForColumnIndex:", 59);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setCoverArtworkRecipe:", v28);

  objc_msgSend(*(id *)(a1 + 40), "setIsCollaborative:", objc_msgSend(v5, "intForColumnIndex:", 60) != 0);
  objc_msgSend(*(id *)(a1 + 40), "setCollaborationMode:", objc_msgSend(v5, "intForColumnIndex:", 61));
  objc_msgSend(v5, "stringForColumnIndex:", 62);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setCollaborationInvitationURL:", v29);

  objc_msgSend(*(id *)(a1 + 40), "setCollaborationInvitationURLExpirationDate:", objc_msgSend(v5, "int64ForColumnIndex:", 63));
  objc_msgSend(*(id *)(a1 + 40), "setCollaborationJoinRequestPending:", objc_msgSend(v5, "intForColumnIndex:", 64) != 0);
  objc_msgSend(*(id *)(a1 + 40), "setCollaboratorStatus:", objc_msgSend(v5, "intForColumnIndex:", 65));
  if (v11)
    objc_msgSend(*(id *)(a1 + 40), "setCloudUniversalLibraryId:", v11);
  if (v12)
    objc_msgSend(*(id *)(a1 + 40), "setSecondaryArtworkId:", v12);
  if (v66)
    objc_msgSend(*(id *)(a1 + 40), "setSecondaryArtworkSourceType:");
  if (v71)
  {
    v30 = *(void **)(a1 + 40);
    v31 = 4;
LABEL_21:
    objc_msgSend(v30, "setType:", v31);
    goto LABEL_22;
  }
  if (!v60)
  {
    v58 = objc_msgSend(v9, "length");
    v30 = *(void **)(a1 + 40);
    if (v58)
      v31 = 2;
    else
      v31 = 1;
    goto LABEL_21;
  }
  objc_msgSend(*(id *)(a1 + 40), "setType:", 3);
  v43 = objc_msgSend(v5, "int64ForColumnIndex:", 17);
  if (v43)
  {
    v44 = *(_QWORD *)(a1 + 32);
    +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", CFSTR("ROWID"), v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3Entity anyInLibrary:predicate:](ML3Track, "anyInLibrary:predicate:", v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      objc_msgSend(v46, "multiverseIdentifierLibraryOnly:", 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setGeniusSeedTrackIdentifier:", v47);

    }
  }
LABEL_22:
  v32 = objc_msgSend(v5, "intForColumnIndex:", 11);
  if (objc_msgSend(v9, "length"))
  {
    v33 = objc_alloc_init(MIPSmartPlaylistInfo);
    -[MIPSmartPlaylistInfo setEvaluationOrder:](v33, "setEvaluationOrder:", objc_msgSend(v5, "intForColumnIndex:", 7));
    -[MIPSmartPlaylistInfo setLimitKind:](v33, "setLimitKind:", objc_msgSend(v5, "intForColumnIndex:", 8));
    -[MIPSmartPlaylistInfo setLimitOrder:](v33, "setLimitOrder:", objc_msgSend(v5, "intForColumnIndex:", 9));
    -[MIPSmartPlaylistInfo setLimitValue:](v33, "setLimitValue:", objc_msgSend(v5, "intForColumnIndex:", 10));
    -[MIPSmartPlaylistInfo setSmartCriteria:](v33, "setSmartCriteria:", v9);
    -[MIPSmartPlaylistInfo setDynamic:](v33, "setDynamic:", v32 != 0);
    -[MIPSmartPlaylistInfo setEnabledItemsOnly:](v33, "setEnabledItemsOnly:", objc_msgSend(v5, "intForColumnIndex:", 12) != 0);
    -[MIPSmartPlaylistInfo setFiltered:](v33, "setFiltered:", objc_msgSend(v5, "intForColumnIndex:", 13) != 0);
    -[MIPSmartPlaylistInfo setGenius:](v33, "setGenius:", objc_msgSend(v5, "intForColumnIndex:", 5) != 0);
    -[MIPSmartPlaylistInfo setLimited:](v33, "setLimited:", objc_msgSend(v5, "intForColumnIndex:", 14) != 0);
    -[MIPSmartPlaylistInfo setReverseLimitOrder:](v33, "setReverseLimitOrder:", objc_msgSend(v5, "intForColumnIndex:", 15) != 0);
    objc_msgSend(*(id *)(a1 + 40), "setSmartPlaylistInfo:", v33);

  }
  if (v71)
  {
    objc_msgSend(*(id *)(a1 + 48), "childPlaylistPersistentIds");
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v34 = (id)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
    if (v35)
    {
      v36 = v35;
      v65 = v10;
      v67 = v9;
      v72 = v7;
      v37 = *(_QWORD *)v78;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v78 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
          v40 = (void *)MEMORY[0x1AF43CC0C]();
          v41 = -[ML3Entity initWithPersistentID:inLibrary:]([ML3Container alloc], "initWithPersistentID:inLibrary:", objc_msgSend(v39, "longLongValue"), *(_QWORD *)(a1 + 32));
          -[ML3Container multiverseIdentifier](v41, "multiverseIdentifier");
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (v42)
            objc_msgSend(*(id *)(a1 + 40), "addChildIdentifiers:", v42);

          objc_autoreleasePoolPop(v40);
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
      }
      while (v36);
LABEL_51:
      v7 = v72;
      v10 = v65;
      v9 = v67;
      v11 = v69;
      goto LABEL_52;
    }
    goto LABEL_52;
  }
  v48 = objc_msgSend(*(id *)(a1 + 40), "type");
  v49 = v70;
  if (v48 == 1 || !v32)
  {
    objc_msgSend(*(id *)(a1 + 48), "trackPersistentIds");
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v34 = (id)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
    if (v50)
    {
      v51 = v50;
      v65 = v10;
      v67 = v9;
      v72 = v7;
      v52 = *(_QWORD *)v74;
      do
      {
        for (j = 0; j != v51; ++j)
        {
          if (*(_QWORD *)v74 != v52)
            objc_enumerationMutation(v34);
          v54 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
          v55 = (void *)MEMORY[0x1AF43CC0C]();
          v56 = -[ML3Entity initWithPersistentID:inLibrary:]([ML3Track alloc], "initWithPersistentID:inLibrary:", objc_msgSend(v54, "longLongValue"), *(_QWORD *)(a1 + 32));
          -[ML3Track multiverseIdentifier](v56, "multiverseIdentifier");
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          if (v57)
            objc_msgSend(*(id *)(a1 + 40), "addItems:", v57);

          objc_autoreleasePoolPop(v55);
        }
        v51 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
      }
      while (v51);
      goto LABEL_51;
    }
LABEL_52:

    v49 = v70;
  }

}

void __40__ML3Container_MLProtocol__protocolItem__block_invoke()
{
  __CFString *v0;
  __CFString *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  __CFString *v34;
  __CFString *v35;
  __CFString *v36;
  __CFString *v37;
  __CFString *v38;
  __CFString *v39;
  __CFString *v40;
  __CFString *v41;
  __CFString *v42;
  __CFString *v43;
  __CFString *v44;
  __CFString *v45;
  __CFString *v46;
  __CFString *v47;
  __CFString *v48;
  __CFString *v49;
  __CFString *v50;
  __CFString *v51;
  __CFString *v52;
  __CFString *v53;
  __CFString *v54;
  __CFString *v55;
  __CFString *v56;
  __CFString *v57;
  __CFString *v58;
  __CFString *v59;
  __CFString *v60;
  __CFString *v61;
  __CFString *v62;
  __CFString *v63;
  __CFString *v64;
  uint64_t v65;
  void *v66;
  uint64_t i;
  _QWORD v68[66];

  v68[65] = *MEMORY[0x1E0C80C00];
  v0 = CFSTR("name");
  v68[0] = CFSTR("name");
  v1 = CFSTR("store_cloud_id");
  v68[1] = CFSTR("store_cloud_id");
  v2 = CFSTR("is_hidden");
  v68[2] = CFSTR("is_hidden");
  v3 = CFSTR("smart_is_folder");
  v68[3] = CFSTR("smart_is_folder");
  v4 = CFSTR("smart_is_genius");
  v68[4] = CFSTR("smart_is_genius");
  v5 = CFSTR("smart_criteria");
  v68[5] = CFSTR("smart_criteria");
  v6 = CFSTR("smart_evaluation_order");
  v68[6] = CFSTR("smart_evaluation_order");
  v7 = CFSTR("smart_limit_kind");
  v68[7] = CFSTR("smart_limit_kind");
  v8 = CFSTR("smart_limit_order");
  v68[8] = CFSTR("smart_limit_order");
  v9 = CFSTR("smart_limit_value");
  v68[9] = CFSTR("smart_limit_value");
  v10 = CFSTR("smart_is_dynamic");
  v68[10] = CFSTR("smart_is_dynamic");
  v11 = CFSTR("smart_enabled_only");
  v68[11] = CFSTR("smart_enabled_only");
  v12 = CFSTR("smart_is_filtered");
  v68[12] = CFSTR("smart_is_filtered");
  v13 = CFSTR("smart_is_limited");
  v68[13] = CFSTR("smart_is_limited");
  v14 = CFSTR("smart_reverse_limit_order");
  v68[14] = CFSTR("smart_reverse_limit_order");
  v15 = CFSTR("parent_pid");
  v68[15] = CFSTR("parent_pid");
  v16 = CFSTR("container_seed.item_pid");
  v68[16] = CFSTR("container_seed.item_pid");
  v17 = CFSTR("distinguished_kind");
  v68[17] = CFSTR("distinguished_kind");
  v18 = CFSTR("play_order");
  v68[18] = CFSTR("play_order");
  v19 = CFSTR("is_reversed");
  v68[19] = CFSTR("is_reversed");
  v20 = CFSTR("cloud_global_id");
  v68[20] = CFSTR("cloud_global_id");
  v21 = CFSTR("cloud_is_subscribed");
  v68[21] = CFSTR("cloud_is_subscribed");
  v22 = CFSTR("cloud_is_curator_playlist");
  v68[22] = CFSTR("cloud_is_curator_playlist");
  v23 = CFSTR("external_vendor_identifier");
  v68[23] = CFSTR("external_vendor_identifier");
  v24 = CFSTR("external_vendor_display_name");
  v68[24] = CFSTR("external_vendor_display_name");
  v25 = CFSTR("external_vendor_container_tag");
  v68[25] = CFSTR("external_vendor_container_tag");
  v26 = CFSTR("is_external_vendor_playlist");
  v68[26] = CFSTR("is_external_vendor_playlist");
  v27 = CFSTR("date_created");
  v68[27] = CFSTR("date_created");
  v28 = CFSTR("date_modified");
  v68[28] = CFSTR("date_modified");
  v29 = CFSTR("date_played");
  v68[29] = CFSTR("date_played");
  v30 = CFSTR("cloud_is_sharing_disabled");
  v68[30] = CFSTR("cloud_is_sharing_disabled");
  v31 = CFSTR("cloud_version_hash");
  v68[31] = CFSTR("cloud_version_hash");
  v32 = CFSTR("best_artwork_token.available_artwork_token AS available_container_artwork_token");
  v68[32] = CFSTR("best_artwork_token.available_artwork_token AS available_container_artwork_token");
  v33 = CFSTR("liked_state");
  v68[33] = CFSTR("liked_state");
  v34 = CFSTR("is_src_remote");
  v68[34] = CFSTR("is_src_remote");
  v35 = CFSTR("is_owner");
  v68[35] = CFSTR("is_owner");
  v36 = CFSTR("is_editable");
  v68[36] = CFSTR("is_editable");
  v37 = CFSTR("play_count_user");
  v68[37] = CFSTR("play_count_user");
  v38 = CFSTR("cloud_is_public");
  v68[38] = CFSTR("cloud_is_public");
  v39 = CFSTR("cloud_is_visible");
  v68[39] = CFSTR("cloud_is_visible");
  v40 = CFSTR("cloud_author_store_id");
  v68[40] = CFSTR("cloud_author_store_id");
  v41 = CFSTR("cloud_author_display_name");
  v68[41] = CFSTR("cloud_author_display_name");
  v42 = CFSTR("cloud_author_store_url");
  v68[42] = CFSTR("cloud_author_store_url");
  v43 = CFSTR("cloud_author_handle");
  v68[43] = CFSTR("cloud_author_handle");
  v44 = CFSTR("cloud_min_refresh_interval");
  v68[44] = CFSTR("cloud_min_refresh_interval");
  v45 = CFSTR("cloud_last_update_time");
  v68[45] = CFSTR("cloud_last_update_time");
  v46 = CFSTR("cloud_user_count");
  v68[46] = CFSTR("cloud_user_count");
  v47 = CFSTR("cloud_global_play_count");
  v68[47] = CFSTR("cloud_global_play_count");
  v48 = CFSTR("cloud_global_like_count");
  v68[48] = CFSTR("cloud_global_like_count");
  v49 = CFSTR("cloud_share_url");
  v68[49] = CFSTR("cloud_share_url");
  v50 = CFSTR("description");
  v68[50] = CFSTR("description");
  v51 = CFSTR("cloud_universal_library_id");
  v68[51] = CFSTR("cloud_universal_library_id");
  v52 = CFSTR("best_artwork_token.fetchable_artwork_source_type AS fetchable_item_artwork_source_type");
  v68[52] = CFSTR("best_artwork_token.fetchable_artwork_source_type AS fetchable_item_artwork_source_type");
  v53 = CFSTR("best_artwork_token.fetchable_artwork_token AS fetchable_item_artwork_token");
  v68[53] = CFSTR("best_artwork_token.fetchable_artwork_token AS fetchable_item_artwork_token");
  v54 = CFSTR("category_type_mask");
  v68[54] = CFSTR("category_type_mask");
  v55 = CFSTR("grouping_sort_key");
  v68[55] = CFSTR("grouping_sort_key");
  v56 = CFSTR("traits");
  v68[56] = CFSTR("traits");
  v57 = CFSTR("liked_state_changed_date");
  v68[57] = CFSTR("liked_state_changed_date");
  v58 = CFSTR("cover_artwork_recipe");
  v68[58] = CFSTR("cover_artwork_recipe");
  v59 = CFSTR("is_collaborative");
  v68[59] = CFSTR("is_collaborative");
  v60 = CFSTR("collaborator_invite_options");
  v68[60] = CFSTR("collaborator_invite_options");
  v61 = CFSTR("collaboration_invitation_link");
  v68[61] = CFSTR("collaboration_invitation_link");
  v62 = CFSTR("collaboration_invitation_url_expiration_date");
  v68[62] = CFSTR("collaboration_invitation_url_expiration_date");
  v63 = CFSTR("collaboration_join_request_pending");
  v68[63] = CFSTR("collaboration_join_request_pending");
  v64 = CFSTR("collaborator_status");
  v68[64] = CFSTR("collaborator_status");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 65);
  v65 = objc_claimAutoreleasedReturnValue();
  v66 = (void *)protocolItem___playlistProperties;
  protocolItem___playlistProperties = v65;

  for (i = 64; i != -1; --i)
}

void __56__ML3Container_MLProtocol__protocolItemForDynamicUpdate__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v12[0] = MEMORY[0x1E0C9AAA0];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
  v6 = a2;
  objc_msgSend(v3, "numberWithLongLong:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeQuery:withParameters:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__ML3Container_MLProtocol__protocolItemForDynamicUpdate__block_invoke_3;
  v10[3] = &unk_1E5B65EE0;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v9, "enumerateRowsWithBlock:", v10);

}

void __56__ML3Container_MLProtocol__protocolItemForDynamicUpdate__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "int64ForColumnIndex:", 2);
  objc_msgSend(v6, "stringForColumnIndex:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringForColumnIndex:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setStoreId:", v3);
  if (objc_msgSend(v4, "length"))
    objc_msgSend(*(id *)(a1 + 32), "setName:", v4);
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setCloudGlobalId:", v5);
  objc_msgSend(*(id *)(a1 + 32), "setLikedState:", objc_msgSend(v6, "intForColumnIndex:", 4));
  objc_msgSend(*(id *)(a1 + 32), "setLikedStateChangedDate:", (int)objc_msgSend(v6, "intForColumnIndex:", 5));

}

void __56__ML3Container_MLProtocol__protocolItemForDynamicUpdate__block_invoke()
{
  __CFString *v0;
  __CFString *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v0 = CFSTR("name");
  v8[0] = CFSTR("name");
  v1 = CFSTR("store_cloud_id");
  v8[1] = CFSTR("store_cloud_id");
  v2 = CFSTR("cloud_global_id");
  v8[2] = CFSTR("cloud_global_id");
  v3 = CFSTR("liked_state");
  v8[3] = CFSTR("liked_state");
  v4 = CFSTR("liked_state_changed_date");
  v8[4] = CFSTR("liked_state_changed_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)protocolItemForDynamicUpdate___playlistProperties;
  protocolItemForDynamicUpdate___playlistProperties = v5;

  for (i = 4; i != -1; --i)
}

void __48__ML3Container_MLProtocol__multiverseIdentifier__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
  v6 = a2;
  objc_msgSend(v3, "numberWithLongLong:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeQuery:withParameters:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__ML3Container_MLProtocol__multiverseIdentifier__block_invoke_2;
  v10[3] = &unk_1E5B65EE0;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v9, "enumerateRowsWithBlock:", v10);

}

void __48__ML3Container_MLProtocol__multiverseIdentifier__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "stringForColumnIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setName:", v4);

  v5 = objc_msgSend(v3, "int64ForColumnIndex:", 1);
  objc_msgSend(v3, "stringForColumnIndex:", 2);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 >= 1)
    objc_msgSend(*(id *)(a1 + 32), "setStoreId:", v5);
  v6 = v7;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCloudUniversalLibraryId:", v7);
    v6 = v7;
  }

}

+ (unsigned)trackOrderFromProtocolSortType:(int)a3
{
  if ((a3 - 1) > 0x49)
    return 1;
  else
    return *(_DWORD *)&asc_1AC3D9724[4 * (a3 - 1)];
}

+ (int)protocolSortTypeFromTrackOrder:(unsigned int)a3
{
  if (a3 - 1 > 0x4B)
    return 0;
  else
    return dword_1AC3D984C[a3 - 1];
}

- (id)criteriaListDescription
{
  void *v3;
  id v4;
  __CFString *v5;
  uint64_t v7;

  -[ML3Entity valueForProperty:](self, "valueForProperty:", CFSTR("smart_criteria"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_retainAutorelease(v3);
    MEMORY[0x1AF43C1F8](objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"), &v7);
    -[ML3Container _criteriaListDescription:level:](self, "_criteriaListDescription:level:", v7, 0);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("No smart playlist criteria");
  }

  return v5;
}

- (id)_criteriaListDescription:(SearchCriteriaList *)a3 level:(int64_t)a4
{
  int v4;
  void *v5;
  int v6;
  int i;
  int SearchCriterionInfo;
  int v9;
  NSObject *v10;
  uint8_t buf[16];
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  LockSearchCriteriaList();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%*c"), (3 * v4), 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GetSearchCriteriaListOptions();
  v6 = CountSearchCriteria();
  objc_msgSend(v5, "appendString:", CFSTR("&&\n"));
  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      SearchCriterionInfo = GetSearchCriterionInfo();
      if (SearchCriterionInfo)
      {
        v9 = SearchCriterionInfo;
        v10 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v9;
          _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_ERROR, "Got an error getting search criterion info: %ld", buf, 0xCu);
        }

      }
    }
  }
  UnlockSearchCriteriaList();
  return v5;
}

- (id)_addUnitesForCriterionInfo:(id *)a3
{
  const __CFString *v3;
  unsigned int var0;
  const __CFString *v5;

  v3 = CFSTR("MB");
  var0 = a3->var0;
  v5 = &stru_1E5B66908;
  if (a3->var0 == 6)
    v5 = CFSTR("Hz");
  if (var0 != 12)
    v3 = v5;
  if (var0 == 5)
    return CFSTR("kbps");
  else
    return (id)v3;
}

- (id)_BOOLeanStringForCriteriaInfo:(id *)a3
{
  unint64_t v3;
  char var1_high;
  const __CFString *v5;
  const __CFString *v6;
  BOOL v7;

  HIDWORD(v3) = a3->var0 - 29;
  LODWORD(v3) = HIDWORD(v3);
  switch((v3 >> 1))
  {
    case 0u:
    case 4u:
    case 6u:
      var1_high = HIBYTE(a3->var1);
      v5 = CFSTR("true");
      v6 = CFSTR("false");
      goto LABEL_4;
    case 1u:
      var1_high = HIBYTE(a3->var1);
      v5 = CFSTR("false");
      v6 = CFSTR("true");
LABEL_4:
      v7 = (var1_high & 2) == 0;
      break;
    default:
      if (a3->var0 == 133 && (a3->var1 & 0x400) != 0)
        GetSearchCriterionInfoNumericValue();
      GetSearchCriterionInfoBooleanValue();
      v5 = CFSTR("true");
      v6 = CFSTR("false");
      v7 = 1;
      break;
  }
  if (v7)
    return (id)v6;
  else
    return (id)v5;
}

- (id)_dateStringForCriteriaInfo:(id *)a3
{
  unsigned int var1;
  const __CFTimeZone *v5;
  double *v6;
  CFAbsoluteTime v7;
  uint64_t v8;
  CFAbsoluteTime v9;
  CFAbsoluteTime v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;

  if (_dateStringForCriteriaInfo__onceToken != -1)
    dispatch_once(&_dateStringForCriteriaInfo__onceToken, &__block_literal_global_21835);
  var1 = a3->var1;
  GetSearchCriterionInfoValueRange();
  v5 = CFTimeZoneCopySystem();
  v6 = (double *)MEMORY[0x1E0C9ADE8];
  v7 = (double)(GetValueRangeCriteriaStartValue() - (uint64_t)*v6);
  v8 = (uint64_t)(v7 - CFTimeZoneGetSecondsFromGMT(v5, v7));
  v9 = (double)(GetValueRangeCriteriaEndValue() - (uint64_t)*v6);
  v10 = v9 - CFTimeZoneGetSecondsFromGMT(v5, v9);
  CFRelease(v5);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)(uint64_t)v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_dateStringForCriteriaInfo__formatter, "stringFromDate:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_dateStringForCriteriaInfo__formatter, "stringFromDate:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((var1 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) to (%@)"), v13, v14);
  }
  else if ((var1 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) and (%@)"), v13, v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v13, v17);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_nonzeroStringForCriteriaInfo:(id *)a3
{
  $A480A5A2413FC6D588229CFB6A5B6D7D var6;
  _OWORD v5[2];

  var6 = a3->var6;
  v5[0] = *(_OWORD *)&a3->var0;
  v5[1] = var6;
  -[ML3Container _BOOLeanStringForCriteriaInfo:](self, "_BOOLeanStringForCriteriaInfo:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_numericStringForCriteriaInfo:(id *)a3
{
  unsigned int var1;
  uint64_t ValueRangeCriteriaStartValue;
  uint64_t ValueRangeCriteriaEndValue;
  uint64_t var0;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;

  var1 = a3->var1;
  LODWORD(v15) = 0;
  GetSearchCriterionInfoValueRange();
  ValueRangeCriteriaStartValue = GetValueRangeCriteriaStartValue();
  ValueRangeCriteriaEndValue = GetValueRangeCriteriaEndValue();
  var0 = a3->var0;
  if ((int)var0 > 89)
  {
    if ((_DWORD)var0 != 90)
    {
      if ((_DWORD)var0 == 134)
      {
        -[ML3Container _stringForTrackFieldCloudStatus:](self, "_stringForTrackFieldCloudStatus:", ValueRangeCriteriaStartValue);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 0;
        goto LABEL_11;
      }
      goto LABEL_9;
    }
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld (%d stars)"), ValueRangeCriteriaStartValue, ValueRangeCriteriaStartValue / 20, 0, 0, 0, 0, 0, 0, 0, 0, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld (%d stars)"), ValueRangeCriteriaEndValue, ValueRangeCriteriaEndValue / 20);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if ((_DWORD)var0 == 25)
    goto LABEL_8;
  if ((_DWORD)var0 != 60)
  {
LABEL_9:
    -[ML3Container _convertNumericValueFromCriterionMatchKey:criteriaValue:](self, "_convertNumericValueFromCriterionMatchKey:criteriaValue:", var0, ValueRangeCriteriaStartValue);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3Container _convertNumericValueFromCriterionMatchKey:criteriaValue:](self, "_convertNumericValueFromCriterionMatchKey:criteriaValue:", a3->var0, ValueRangeCriteriaEndValue);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  -[ML3Container _stringForTrackFieldMediaKind:](self, "_stringForTrackFieldMediaKind:", ValueRangeCriteriaStartValue);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3Container _stringForTrackFieldMediaKind:](self, "_stringForTrackFieldMediaKind:", ValueRangeCriteriaEndValue);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v11 = (void *)v10;
LABEL_11:
  if ((var1 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ to %@"), v9, v11);
  }
  else if ((var1 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ and %@"), v9, v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v9, v14);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_convertNumericValueFromCriterionMatchKey:(unsigned int)a3 criteriaValue:(int64_t)a4
{
  void *v4;

  if (a3 == 13)
  {
    -[ML3Container _formatTime:](self, "_formatTime:", a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 == 12)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), a4 / 0x100000);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_formatTime:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02lld:%02lld.%03lld"), a3 / 60000 % 60, a3 / 1000 % 60, a3 % 1000);
}

- (id)_stringForCriterionBuffer:(id *)a3
{
  $A480A5A2413FC6D588229CFB6A5B6D7D v3;
  void *v4;
  $A480A5A2413FC6D588229CFB6A5B6D7D var6;
  $A480A5A2413FC6D588229CFB6A5B6D7D v6;
  $A480A5A2413FC6D588229CFB6A5B6D7D v7;
  $A480A5A2413FC6D588229CFB6A5B6D7D v9;
  __int128 v10;
  $A480A5A2413FC6D588229CFB6A5B6D7D v11;

  switch(a3->var0)
  {
    case 2u:
    case 3u:
    case 4u:
    case 8u:
    case 9u:
    case 0xEu:
    case 0x11u:
    case 0x12u:
    case 0x27u:
    case 0x36u:
    case 0x37u:
    case 0x3Eu:
    case 0x40u:
    case 0x41u:
    case 0x42u:
    case 0x47u:
    case 0x4Eu:
    case 0x4Fu:
    case 0x50u:
    case 0x51u:
    case 0x52u:
    case 0x53u:
    case 0x56u:
    case 0x57u:
    case 0x71u:
    case 0x7Cu:
    case 0x7Fu:
    case 0x80u:
      var6 = a3->var6;
      v10 = *(_OWORD *)&a3->var0;
      v11 = var6;
      -[ML3Container _stringStringForCriteriaInfo:](self, "_stringStringForCriteriaInfo:", &v10);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5u:
    case 6u:
    case 7u:
    case 0xBu:
    case 0xCu:
    case 0xDu:
    case 0x14u:
    case 0x16u:
    case 0x18u:
    case 0x19u:
    case 0x1Bu:
    case 0x1Cu:
    case 0x23u:
    case 0x28u:
    case 0x2Au:
    case 0x2Bu:
    case 0x2Cu:
    case 0x2Du:
    case 0x31u:
    case 0x32u:
    case 0x33u:
    case 0x34u:
    case 0x35u:
    case 0x3Cu:
    case 0x3Fu:
    case 0x44u:
    case 0x4Au:
    case 0x5Au:
    case 0x5Du:
    case 0x62u:
    case 0x63u:
    case 0x64u:
    case 0x65u:
    case 0x66u:
    case 0x6Fu:
    case 0x72u:
    case 0x76u:
    case 0x77u:
    case 0x81u:
    case 0x86u:
    case 0x9Au:
      v3 = a3->var6;
      v10 = *(_OWORD *)&a3->var0;
      v11 = v3;
      -[ML3Container _numericStringForCriteriaInfo:](self, "_numericStringForCriteriaInfo:", &v10);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 0xAu:
    case 0x10u:
    case 0x17u:
    case 0x22u:
    case 0x45u:
    case 0xB7u:
      v7 = a3->var6;
      v10 = *(_OWORD *)&a3->var0;
      v11 = v7;
      -[ML3Container _dateStringForCriteriaInfo:](self, "_dateStringForCriteriaInfo:", &v10);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 0x1Du:
    case 0x1Fu:
    case 0x25u:
    case 0x29u:
    case 0x39u:
    case 0x5Eu:
    case 0x5Fu:
    case 0x60u:
    case 0x61u:
    case 0x70u:
    case 0x75u:
    case 0x7Du:
    case 0x83u:
    case 0x85u:
      v6 = a3->var6;
      v10 = *(_OWORD *)&a3->var0;
      v11 = v6;
      -[ML3Container _BOOLeanStringForCriteriaInfo:](self, "_BOOLeanStringForCriteriaInfo:", &v10);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 0x7Eu:
      v9 = a3->var6;
      v10 = *(_OWORD *)&a3->var0;
      v11 = v9;
      -[ML3Container _nonzeroStringForCriteriaInfo:](self, "_nonzeroStringForCriteriaInfo:", &v10);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unsupported: %d)"), a3->var0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v4;
}

- (id)_stringForCriterionMatchKey:(id *)a3
{
  void *v4;
  unsigned int var0;
  const __CFString *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unsupported: %d)"), a3->var0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  var0 = a3->var0;
  v6 = CFSTR("Invalid");
  switch(var0)
  {
    case 0u:
      goto LABEL_136;
    case 1u:
      v6 = CFSTR("Play Status");
      goto LABEL_136;
    case 2u:
      v6 = CFSTR("Name");
      goto LABEL_136;
    case 3u:
      v6 = CFSTR("Album");
      goto LABEL_136;
    case 4u:
      v6 = CFSTR("Artist");
      goto LABEL_136;
    case 5u:
      v6 = CFSTR("Bit Rate");
      goto LABEL_136;
    case 6u:
      v6 = CFSTR("Sample Rate");
      goto LABEL_136;
    case 7u:
      v6 = CFSTR("Year");
      goto LABEL_136;
    case 8u:
      v6 = CFSTR("Genre");
      goto LABEL_136;
    case 9u:
      v6 = CFSTR("Kind");
      goto LABEL_136;
    case 0xAu:
      v6 = CFSTR("Date Modified");
      goto LABEL_136;
    case 0xBu:
      v6 = CFSTR("Track Number");
      goto LABEL_136;
    case 0xCu:
      v6 = CFSTR("Size");
      goto LABEL_136;
    case 0xDu:
      v6 = CFSTR("Total Time");
      goto LABEL_136;
    case 0xEu:
      v6 = CFSTR("Comment");
      goto LABEL_136;
    case 0xFu:
      v6 = CFSTR("Location");
      goto LABEL_136;
    case 0x10u:
      v6 = CFSTR("Date Added");
      goto LABEL_136;
    case 0x11u:
      v6 = CFSTR("EQ Preset");
      goto LABEL_136;
    case 0x12u:
      v6 = CFSTR("Composer");
      goto LABEL_136;
    case 0x13u:
      v6 = CFSTR("Obsolete Display Artist");
      goto LABEL_136;
    case 0x14u:
      v6 = CFSTR("Volume");
      goto LABEL_136;
    case 0x15u:
      v6 = CFSTR("Stream Status");
      goto LABEL_136;
    case 0x16u:
      v6 = CFSTR("User Play Count");
      goto LABEL_136;
    case 0x17u:
      v6 = CFSTR("Play Date");
      goto LABEL_136;
    case 0x18u:
      v6 = CFSTR("Disc Number");
      goto LABEL_136;
    case 0x19u:
      v6 = CFSTR("Track Rating");
      goto LABEL_136;
    case 0x1Au:
      v6 = CFSTR("Price");
      goto LABEL_136;
    case 0x1Bu:
      v6 = CFSTR("Object ID");
      goto LABEL_136;
    case 0x1Cu:
      v6 = CFSTR("Persistent ID");
      goto LABEL_136;
    case 0x1Du:
      v6 = CFSTR("Checked");
      goto LABEL_136;
    case 0x1Eu:
      v6 = CFSTR("Playlist Item ID");
      goto LABEL_136;
    case 0x1Fu:
      v6 = CFSTR("Compilation");
      goto LABEL_136;
    case 0x20u:
      v6 = CFSTR("Purchase Date");
      goto LABEL_136;
    case 0x21u:
      v6 = CFSTR("Relevance");
      goto LABEL_136;
    case 0x22u:
      v6 = CFSTR("Release Date");
      goto LABEL_136;
    case 0x23u:
      v6 = CFSTR("Beat Per Minute");
      goto LABEL_136;
    case 0x24u:
      v6 = CFSTR("Parent Container ID");
      goto LABEL_136;
    case 0x25u:
      v6 = CFSTR("Artwork");
      goto LABEL_136;
    case 0x26u:
      v6 = CFSTR("Popuarity");
      goto LABEL_136;
    case 0x27u:
      v6 = CFSTR("Grouping");
      goto LABEL_136;
    case 0x28u:
      v6 = CFSTR("Playlist");
      goto LABEL_136;
    case 0x29u:
      v6 = CFSTR("Purchased");
      goto LABEL_136;
    case 0x2Au:
      v6 = CFSTR("Artist ID");
      goto LABEL_136;
    case 0x2Bu:
      v6 = CFSTR("Playlist ID");
      goto LABEL_136;
    case 0x2Cu:
      v6 = CFSTR("Composer ID");
      goto LABEL_136;
    case 0x2Du:
      v6 = CFSTR("Genre ID");
      goto LABEL_136;
    case 0x2Eu:
      v6 = CFSTR("Codec Type");
      goto LABEL_136;
    case 0x2Fu:
      v6 = CFSTR("Codec Sub-Type");
      goto LABEL_136;
    case 0x30u:
      v6 = CFSTR("Song Data Kind");
      goto LABEL_136;
    case 0x31u:
      v6 = CFSTR("Disc Count");
      goto LABEL_136;
    case 0x32u:
      v6 = CFSTR("Start Time");
      goto LABEL_136;
    case 0x33u:
      v6 = CFSTR("Stop Time");
      goto LABEL_136;
    case 0x34u:
      v6 = CFSTR("Track Count");
      goto LABEL_136;
    case 0x35u:
      v6 = CFSTR("Store Front ID");
      goto LABEL_136;
    case 0x36u:
      v6 = CFSTR("Description");
      goto LABEL_136;
    case 0x37u:
      v6 = CFSTR("Category");
      goto LABEL_136;
    case 0x38u:
      v6 = CFSTR("Keywords");
      goto LABEL_136;
    case 0x39u:
      v6 = CFSTR("Podcast");
      goto LABEL_136;
    case 0x3Au:
      v6 = CFSTR("Cloud Match State");
      goto LABEL_136;
    case 0x3Bu:
      v6 = CFSTR("Has Lyrics");
      goto LABEL_136;
    case 0x3Cu:
      v6 = CFSTR("Media Kind");
      goto LABEL_136;
    case 0x3Eu:
      v6 = CFSTR("Series Name");
      goto LABEL_136;
    case 0x3Fu:
      v6 = CFSTR("Season Number");
      goto LABEL_136;
    case 0x40u:
      v6 = CFSTR("Epsisode ID");
      goto LABEL_136;
    case 0x41u:
      v6 = CFSTR("Episode Sort ID");
      goto LABEL_136;
    case 0x42u:
      v6 = CFSTR("Network Name");
      goto LABEL_136;
    case 0x43u:
      v6 = CFSTR("Last Backup Date");
      goto LABEL_136;
    case 0x44u:
      v6 = CFSTR("Skips");
      goto LABEL_136;
    case 0x45u:
      v6 = CFSTR("Skip Date");
      goto LABEL_136;
    case 0x46u:
      v6 = CFSTR("Gapless Album");
      goto LABEL_136;
    case 0x47u:
      v6 = CFSTR("Album Artist");
      goto LABEL_136;
    case 0x48u:
      v6 = CFSTR("Shuffle ID");
      goto LABEL_136;
    case 0x49u:
      v6 = CFSTR("Track ID");
      goto LABEL_136;
    case 0x4Au:
      v6 = CFSTR("Relative Volumne");
      goto LABEL_136;
    case 0x4Bu:
      v6 = CFSTR("Attributes");
      goto LABEL_136;
    case 0x4Cu:
    case 0x60u:
      v6 = CFSTR("Private");
      goto LABEL_136;
    case 0x4Du:
      v6 = CFSTR("Album Info");
      goto LABEL_136;
    case 0x4Eu:
      v6 = CFSTR("Sort Name");
      goto LABEL_136;
    case 0x4Fu:
      v6 = CFSTR("Sort Album");
      goto LABEL_136;
    case 0x50u:
      v6 = CFSTR("Sort Artist");
      goto LABEL_136;
    case 0x51u:
      v6 = CFSTR("Sort Album Artist");
      goto LABEL_136;
    case 0x52u:
      v6 = CFSTR("Sort Composer");
      goto LABEL_136;
    case 0x53u:
      v6 = CFSTR("Sort Series Name");
      goto LABEL_136;
    case 0x54u:
      v6 = CFSTR("Moive Info");
      goto LABEL_136;
    case 0x55u:
      v6 = CFSTR("Poscast URL");
      goto LABEL_136;
    case 0x56u:
      v6 = CFSTR("Long Description");
      goto LABEL_136;
    case 0x57u:
      v6 = CFSTR("Exernal GUID");
      goto LABEL_136;
    case 0x58u:
      v6 = CFSTR("Chapter Data");
      goto LABEL_136;
    case 0x59u:
      v6 = CFSTR("Video Rating");
      goto LABEL_136;
    case 0x5Au:
      v6 = CFSTR("Album Rating");
      goto LABEL_136;
    case 0x5Bu:
      v6 = CFSTR("Rental Expiration Date");
      goto LABEL_136;
    case 0x5Cu:
      v6 = CFSTR("Obsolere Ringtone Status");
      goto LABEL_136;
    case 0x5Du:
      v6 = CFSTR("Bookmark Time");
      goto LABEL_136;
    case 0x5Eu:
      v6 = CFSTR("Remember Bookmark");
      goto LABEL_136;
    case 0x5Fu:
      v6 = CFSTR("Has Been Played");
      goto LABEL_136;
    case 0x61u:
      v6 = CFSTR("Has Subtitles");
      goto LABEL_136;
    case 0x62u:
      v6 = CFSTR("Audio Language");
      goto LABEL_136;
    case 0x63u:
      v6 = CFSTR("Audio Track Index");
      goto LABEL_136;
    case 0x64u:
      v6 = CFSTR("Audio Track ID");
      goto LABEL_136;
    case 0x65u:
      v6 = CFSTR("Subtitle Language");
      goto LABEL_136;
    case 0x66u:
      v6 = CFSTR("Subtitle Track Index");
      goto LABEL_136;
    case 0x67u:
      v6 = CFSTR("Subtitle Track ID");
      goto LABEL_136;
    case 0x68u:
      v6 = CFSTR("Studio");
      goto LABEL_136;
    case 0x69u:
      v6 = CFSTR("Reserved 1");
      goto LABEL_136;
    case 0x6Au:
      v6 = CFSTR("Reserved 2");
      goto LABEL_136;
    case 0x6Bu:
      v6 = CFSTR("Reserved 3");
      goto LABEL_136;
    case 0x6Cu:
      v6 = CFSTR("Reserved 4");
      goto LABEL_136;
    case 0x6Du:
      v6 = CFSTR("Reserved 5");
      goto LABEL_136;
    case 0x6Eu:
      v6 = CFSTR("Gpaless Info");
      goto LABEL_136;
    case 0x6Fu:
      v6 = CFSTR("Genius ID");
      goto LABEL_136;
    case 0x70u:
      v6 = CFSTR("Exclude From Shuffle");
      goto LABEL_136;
    case 0x71u:
      v6 = CFSTR("Lyrics");
      goto LABEL_136;
    case 0x72u:
      v6 = CFSTR("Store Persistent ID");
      goto LABEL_136;
    case 0x73u:
      v6 = CFSTR("Jukebox Votes");
      goto LABEL_136;
    case 0x74u:
      v6 = CFSTR("Voice Over Language");
      goto LABEL_136;
    case 0x75u:
      v6 = CFSTR("iTunes U");
      goto LABEL_136;
    case 0x76u:
      v6 = CFSTR("Uncompressed Size");
      goto LABEL_136;
    case 0x77u:
      v6 = CFSTR("XID");
      goto LABEL_136;
    case 0x78u:
      v6 = CFSTR("Game GUID");
      goto LABEL_136;
    case 0x79u:
      v6 = CFSTR("App Identifier");
      goto LABEL_136;
    case 0x7Au:
      v6 = CFSTR("Obsolete Track Kind");
      goto LABEL_136;
    case 0x7Bu:
      v6 = CFSTR("Version");
      goto LABEL_136;
    case 0x7Cu:
      v6 = CFSTR("Copyright");
      goto LABEL_136;
    case 0x7Du:
      v6 = CFSTR("User Disabled");
      goto LABEL_136;
    case 0x7Eu:
      v6 = CFSTR("Album Artwork");
      goto LABEL_136;
    case 0x7Fu:
      v6 = CFSTR("Collection Description");
      goto LABEL_136;
    case 0x80u:
      v6 = CFSTR("Flavor");
      goto LABEL_136;
    case 0x81u:
      v6 = CFSTR("Cloud ID");
      goto LABEL_136;
    case 0x82u:
      v6 = CFSTR("Cloud Download");
      goto LABEL_136;
    case 0x83u:
      v6 = CFSTR("Chosen By Auto Fill");
      goto LABEL_136;
    case 0x84u:
      v6 = CFSTR("Cloud User ID");
      goto LABEL_136;
    case 0x85u:
      v6 = CFSTR("Location (Track Kinds)");
      goto LABEL_136;
    case 0x86u:
      v6 = CFSTR("iCloud Type");
      goto LABEL_136;
    case 0x9Au:
      v6 = CFSTR("Liked State");
      goto LABEL_136;
    case 0xB7u:
      v6 = CFSTR("Liked State Changed Date");
LABEL_136:

      v4 = (void *)v6;
      break;
    default:
      return v4;
  }
  return v4;
}

- (id)_stringForCriterionMatchType:(id *)a3
{
  unsigned int v3;
  unint64_t v4;
  unsigned int var1;
  int v6;
  __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  __CFString *v11;

  HIDWORD(v4) = a3->var0 - 29;
  LODWORD(v4) = HIDWORD(v4);
  v3 = v4 >> 1;
  if (v3 < 7 && ((0x53u >> v3) & 1) != 0)
    return CFSTR("is equal to");
  var1 = a3->var1;
  v6 = var1 & 0xFFFFFF;
  v7 = &stru_1E5B66908;
  if ((var1 & 0xFFFFFF) <= 0x1F)
  {
    switch(v6)
    {
      case 0:
        return CFSTR("invalid");
      case 1:
        v8 = CFSTR("is not equal to");
        v9 = CFSTR("is equal to");
        goto LABEL_28;
      case 2:
        v8 = CFSTR("does not contain");
        v9 = CFSTR("contains");
        goto LABEL_28;
      case 3:
      case 5:
      case 6:
      case 7:
        return v7;
      case 4:
        v8 = CFSTR("does not start with");
        v9 = CFSTR("starts with");
        goto LABEL_28;
      case 8:
        v8 = CFSTR("does not end with");
        v9 = CFSTR("ends with");
        goto LABEL_28;
      default:
        if (v6 != 16)
          return v7;
        v8 = CFSTR("is not greater than");
        v9 = CFSTR("is greater than");
        goto LABEL_28;
    }
  }
  if ((var1 & 0xFFFFFF) <= 0xFF)
  {
    switch(v6)
    {
      case 32:
        v8 = CFSTR("is not greater than or equal");
        v9 = CFSTR("is greater than or equal");
        goto LABEL_28;
      case 64:
        v8 = CFSTR("is not less than");
        v9 = CFSTR("is less than");
        goto LABEL_28;
      case 128:
        v8 = CFSTR("is not less than or equal");
        v9 = CFSTR("is less than or equal");
        goto LABEL_28;
    }
  }
  else if ((var1 & 0xFFFFFF) > 0x3FF)
  {
    if (v6 == 1024 || v6 == 2048)
    {
      v8 = CFSTR("is not");
      v9 = CFSTR("is");
      goto LABEL_28;
    }
  }
  else
  {
    if (v6 == 256)
    {
      v8 = CFSTR("is not in range");
      v9 = CFSTR("is in range");
      goto LABEL_28;
    }
    if (v6 == 512)
    {
      v8 = CFSTR("is not between");
      v9 = CFSTR("is between");
LABEL_28:
      if ((var1 & 0x2000000) != 0)
        v11 = (__CFString *)v8;
      else
        v11 = (__CFString *)v9;
      v7 = v11;
    }
  }
  return v7;
}

- (id)_stringForTrackFieldCloudStatus:(int64_t)a3
{
  if ((unint64_t)a3 > 7)
    return CFSTR("invalid");
  else
    return off_1E5B65C48[a3];
}

- (id)_stringForTrackFieldMediaKind:(int64_t)a3
{
  id result;

  if (a3 > 4095)
  {
    if (a3 < 0x40000)
    {
      if (a3 >= 0x8000)
      {
        switch(a3)
        {
          case 0x8000:
            return CFSTR("rental");
          case 0x10000:
            return CFSTR("digital booklet");
          case 0x20000:
            return CFSTR("software application");
        }
      }
      else
      {
        switch(a3)
        {
          case 0x1000:
            return CFSTR("software package");
          case 0x2000:
            return CFSTR("forced music playlist");
          case 0x4000:
            return CFSTR("ringtone");
        }
      }
    }
    else if (a3 < 0x200000)
    {
      switch(a3)
      {
        case 0x40000:
          return CFSTR("software game");
        case 0x80000:
          return CFSTR("audio pass");
        case 0x100000:
          return CFSTR("voice memo");
      }
    }
    else if (a3 >= 0x800000)
    {
      if (a3 == 0x800000)
        return CFSTR("PDF book");
      if (a3 == 0x1000000)
        return CFSTR("alert tone");
    }
    else
    {
      if (a3 == 0x200000)
        return CFSTR("iTunes U");
      if (a3 == 0x400000)
        return CFSTR("book");
    }
    return CFSTR("invalid");
  }
  if (a3 > 31)
  {
    if (a3 <= 255)
    {
      switch(a3)
      {
        case 32:
          return CFSTR("music video");
        case 64:
          return CFSTR("TV show");
        case 128:
          return CFSTR("interactive booklet");
      }
    }
    else if (a3 > 1023)
    {
      if (a3 == 1024)
        return CFSTR("home video");
      if (a3 == 2048)
        return CFSTR("future video 3");
    }
    else
    {
      if (a3 == 256)
        return CFSTR("coached audio");
      if (a3 == 512)
        return CFSTR("video pass");
    }
    return CFSTR("invalid");
  }
  result = CFSTR("unknown");
  switch(a3)
  {
    case 0:
      return result;
    case 1:
      result = CFSTR("music");
      break;
    case 2:
      result = CFSTR("movie");
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      return CFSTR("invalid");
    case 4:
      result = CFSTR("podcast");
      break;
    case 8:
      result = CFSTR("audiobook");
      break;
    default:
      if (a3 != 16)
        return CFSTR("invalid");
      result = CFSTR("PDF booklet");
      break;
  }
  return result;
}

- (id)_stringStringForCriteriaInfo:(id *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", a3->var6.var0.var0, (unint64_t)a3->var6.var0.var1 >> 1);
}

uint64_t __63__ML3Container_SmartPlaylistDebug___dateStringForCriteriaInfo___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_dateStringForCriteriaInfo__formatter;
  _dateStringForCriteriaInfo__formatter = (uint64_t)v0;

  return objc_msgSend((id)_dateStringForCriteriaInfo__formatter, "setDateFormat:", CFSTR("MM/dd/yyyy HH:mm"));
}

@end
