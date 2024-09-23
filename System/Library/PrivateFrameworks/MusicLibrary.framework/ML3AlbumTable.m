@implementation ML3AlbumTable

- (id)name
{
  return CFSTR("album");
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
  NSArray *v12;
  NSArray *v13;
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
  void *v31;
  void *v32;
  _QWORD v33[28];

  v33[26] = *MEMORY[0x1E0C80C00];
  columns = self->_columns;
  if (!columns)
  {
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("album_pid"), 2, 1, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v32;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("album"), 4, 16, &stru_1E5B66908);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v31;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("sort_album"), 4, 0, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v30;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("album_artist_pid"), 2, 16, &unk_1E5BAB8E0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v29;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("representative_item_pid"), 2, 16, &unk_1E5BAB8E0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33[4] = v28;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("grouping_key"), 5, 0, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v33[5] = v27;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("cloud_status"), 2, 16, &unk_1E5BAB8E0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v33[6] = v26;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("user_rating"), 2, 16, &unk_1E5BAB8E0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v33[7] = v25;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("liked_state"), 2, 16, &unk_1E5BAB8E0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33[8] = v24;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("all_compilations"), 2, 16, &unk_1E5BAB8E0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v33[9] = v23;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("feed_url"), 4, 0, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33[10] = v22;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("season_number"), 2, 16, &unk_1E5BAB8E0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33[11] = v21;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("album_year"), 2, 16, &unk_1E5BAB8E0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33[12] = v20;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("keep_local"), 2, 16, &unk_1E5BAB8E0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33[13] = v19;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("keep_local_status"), 2, 16, &unk_1E5BAB8E0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33[14] = v18;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("keep_local_status_reason"), 2, 16, &unk_1E5BAB8E0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33[15] = v17;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("keep_local_constraints"), 2, 16, &unk_1E5BAB8E0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33[16] = v16;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("app_data"), 5, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v33[17] = v15;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("contains_classical_work"), 2, 16, &unk_1E5BAB8E0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v33[18] = v4;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("date_played_local"), 2, 16, &unk_1E5BAB8E0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v33[19] = v5;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("user_rating_is_derived"), 2, 16, &unk_1E5BAB8E0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v33[20] = v6;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("sync_id"), 2, 16, &unk_1E5BAB8E0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v33[21] = v7;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("classical_experience_available"), 2, 16, &unk_1E5BAB8E0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v33[22] = v8;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("store_id"), 2, 16, &unk_1E5BAB8E0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v33[23] = v9;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("cloud_library_id"), 4, 16, &stru_1E5B66908);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v33[24] = v10;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("liked_state_changed_date"), 2, 16, &unk_1E5BAB8E0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v33[25] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 26);
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v13 = self->_columns;
    self->_columns = v12;

    columns = self->_columns;
  }
  return columns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
}

@end
