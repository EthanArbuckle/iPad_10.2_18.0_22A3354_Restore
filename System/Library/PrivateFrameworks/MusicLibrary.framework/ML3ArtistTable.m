@implementation ML3ArtistTable

- (id)name
{
  return CFSTR("item_artist");
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
  _QWORD v23[18];

  v23[16] = *MEMORY[0x1E0C80C00];
  columns = self->_columns;
  if (!columns)
  {
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("item_artist_pid"), 2, 1, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v22;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("item_artist"), 4, 16, &stru_1E5B66908);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v21;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("sort_item_artist"), 4, 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v20;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("series_name"), 4, 16, &stru_1E5B66908);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v19;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("sort_series_name"), 4, 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[4] = v18;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("grouping_key"), 5, 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[5] = v17;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("cloud_status"), 2, 16, &unk_1E5BAB928);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[6] = v16;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("store_id"), 2, 16, &unk_1E5BAB928);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[7] = v15;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("representative_item_pid"), 2, 16, &unk_1E5BAB928);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[8] = v14;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("keep_local"), 2, 16, &unk_1E5BAB928);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v23[9] = v4;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("keep_local_status"), 2, 16, &unk_1E5BAB928);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v23[10] = v5;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("keep_local_status_reason"), 2, 16, &unk_1E5BAB928);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23[11] = v6;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("keep_local_constraints"), 2, 16, &unk_1E5BAB928);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23[12] = v7;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("app_data"), 5, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23[13] = v8;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("sync_id"), 2, 16, &unk_1E5BAB928);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[14] = v9;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("classical_experience_available"), 2, 16, &unk_1E5BAB928);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[15] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 16);
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
