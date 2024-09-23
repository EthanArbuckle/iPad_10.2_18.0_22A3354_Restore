@implementation ML3ItemTable

- (id)name
{
  return CFSTR("item");
}

- (id)columns
{
  NSArray *columns;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *v14;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  ML3ItemTable *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[40];

  v46[38] = *MEMORY[0x1E0C80C00];
  columns = self->_columns;
  if (!columns)
  {
    v35 = self;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("item_pid"), 2, 1, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v45;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("media_type"), 2, 16, &unk_1E5BAB5B0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v44;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("title_order"), 2, 16, &unk_1E5BAB5B0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v43;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("title_order_section"), 2, 16, &unk_1E5BAB5B0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v42;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("item_artist_pid"), 2, 16, &unk_1E5BAB5B0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v46[4] = v41;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("item_artist_order"), 2, 16, &unk_1E5BAB5B0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v46[5] = v40;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("item_artist_order_section"), 2, 16, &unk_1E5BAB5B0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v46[6] = v39;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("series_name_order"), 2, 16, &unk_1E5BAB5B0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v46[7] = v38;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("series_name_order_section"), 2, 16, &unk_1E5BAB5B0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v46[8] = v37;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("album_pid"), 2, 16, &unk_1E5BAB5B0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v46[9] = v36;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("album_order"), 2, 16, &unk_1E5BAB5B0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v46[10] = v34;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("album_order_section"), 2, 16, &unk_1E5BAB5B0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v46[11] = v33;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("album_artist_pid"), 2, 16, &unk_1E5BAB5B0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v46[12] = v32;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("album_artist_order"), 2, 16, &unk_1E5BAB5B0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v46[13] = v31;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("album_artist_order_section"), 2, 16, &unk_1E5BAB5B0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v46[14] = v30;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("composer_pid"), 2, 16, &unk_1E5BAB5B0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v46[15] = v29;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("composer_order"), 2, 16, &unk_1E5BAB5B0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v46[16] = v28;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("composer_order_section"), 2, 16, &unk_1E5BAB5B0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v46[17] = v27;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("genre_id"), 2, 16, &unk_1E5BAB5B0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v46[18] = v26;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("genre_order"), 2, 16, &unk_1E5BAB5B0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v46[19] = v25;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("genre_order_section"), 2, 16, &unk_1E5BAB5B0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v46[20] = v24;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("disc_number"), 2, 16, &unk_1E5BAB5B0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v46[21] = v23;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("track_number"), 2, 16, &unk_1E5BAB5B0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v46[22] = v22;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("episode_sort_id"), 2, 16, &unk_1E5BAB5B0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v46[23] = v21;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("base_location_id"), 2, 16, &unk_1E5BAB5B0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v46[24] = v20;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("remote_location_id"), 2, 16, &unk_1E5BAB5B0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v46[25] = v19;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("exclude_from_shuffle"), 2, 16, &unk_1E5BAB5B0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v46[26] = v18;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("keep_local"), 2, 16, &unk_1E5BAB5B0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v46[27] = v17;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("keep_local_status"), 2, 16, &unk_1E5BAB5B0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v46[28] = v16;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("keep_local_status_reason"), 2, 16, &unk_1E5BAB5B0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v46[29] = v4;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("keep_local_constraints"), 2, 16, &unk_1E5BAB5B0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v46[30] = v5;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("in_my_library"), 2, 16, &unk_1E5BAB5B0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v46[31] = v6;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("is_compilation"), 2, 16, &unk_1E5BAB5B0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v46[32] = v7;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("date_added"), 2, 16, &unk_1E5BAB5B0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v46[33] = v8;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("show_composer"), 2, 16, &unk_1E5BAB5B0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v46[34] = v9;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("is_music_show"), 2, 16, &unk_1E5BAB5B0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v46[35] = v10;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("date_downloaded"), 2, 16, &unk_1E5BAB5B0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v46[36] = v11;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("download_source_container_pid"), 2, 16, &unk_1E5BAB5B0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v46[37] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 38);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v35->_columns;
    v35->_columns = (NSArray *)v13;

    columns = v35->_columns;
  }
  return columns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
}

@end
