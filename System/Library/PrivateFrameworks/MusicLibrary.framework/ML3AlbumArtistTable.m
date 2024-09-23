@implementation ML3AlbumArtistTable

- (id)name
{
  return CFSTR("album_artist");
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
  NSArray *v11;
  NSArray *v12;
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
  _QWORD v26[21];

  v26[19] = *MEMORY[0x1E0C80C00];
  columns = self->_columns;
  if (!columns)
  {
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("album_artist_pid"), 2, 1, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v25;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("album_artist"), 4, 16, &stru_1E5B66908);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v24;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("sort_album_artist"), 4, 0, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v23;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("grouping_key"), 5, 0, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[3] = v22;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("cloud_status"), 2, 16, &unk_1E5BAAB60);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[4] = v21;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("store_id"), 2, 16, &unk_1E5BAAB60);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[5] = v20;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("representative_item_pid"), 2, 16, &unk_1E5BAAB60);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26[6] = v19;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("keep_local"), 2, 16, &unk_1E5BAAB60);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26[7] = v18;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("keep_local_status"), 2, 16, &unk_1E5BAAB60);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[8] = v17;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("keep_local_status_reason"), 2, 16, &unk_1E5BAAB60);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26[9] = v16;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("keep_local_constraints"), 2, 16, &unk_1E5BAAB60);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[10] = v15;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("app_data"), 5, 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26[11] = v14;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("sync_id"), 2, 16, &unk_1E5BAAB60);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v26[12] = v4;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("cloud_universal_library_id"), 4, 16, &stru_1E5B66908);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v26[13] = v5;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("classical_experience_available"), 2, 16, &unk_1E5BAAB60);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v26[14] = v6;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("liked_state"), 2, 16, &unk_1E5BAAB60);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26[15] = v7;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("liked_state_changed_date"), 2, 16, &unk_1E5BAAB60);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26[16] = v8;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("sort_order"), 2, 16, &unk_1E5BAAB60);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26[17] = v9;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("sort_order_section"), 2, 16, &unk_1E5BAAB60);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26[18] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 19);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v12 = self->_columns;
    self->_columns = v11;

    columns = self->_columns;
  }
  return columns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
}

@end
