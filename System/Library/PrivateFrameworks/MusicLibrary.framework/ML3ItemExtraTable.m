@implementation ML3ItemExtraTable

- (id)name
{
  return CFSTR("item_extra");
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
  ML3ItemExtraTable *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[36];

  v42[34] = *MEMORY[0x1E0C80C00];
  columns = self->_columns;
  if (!columns)
  {
    v32 = self;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("item_pid"), 2, 1, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v41;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("title"), 4, 16, &stru_1E5B66908);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v40;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("sort_title"), 4, 0, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2] = v39;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("disc_count"), 2, 16, &unk_1E5BAAAD0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v42[3] = v38;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("track_count"), 2, 16, &unk_1E5BAAAD0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v42[4] = v37;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("total_time_ms"), 3, 16, &unk_1E5BAAAD0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v42[5] = v36;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("year"), 2, 16, &unk_1E5BAAAD0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v42[6] = v35;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("location"), 4, 16, &stru_1E5B66908);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v42[7] = v34;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("file_size"), 2, 16, &unk_1E5BAAAD0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v42[8] = v33;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("integrity"), 5, 0, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v42[9] = v31;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("is_audible_audio_book"), 2, 16, &unk_1E5BAAAD0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v42[10] = v30;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("date_modified"), 2, 16, &unk_1E5BAAAD0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v42[11] = v29;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("media_kind"), 2, 16, &unk_1E5BAAAD0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v42[12] = v28;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("content_rating"), 2, 16, &unk_1E5BAAAD0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v42[13] = v27;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("content_rating_level"), 2, 16, &unk_1E5BAAAD0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v42[14] = v26;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("is_user_disabled"), 2, 16, &unk_1E5BAAAD0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v42[15] = v25;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("bpm"), 2, 16, &unk_1E5BAAAD0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v42[16] = v24;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("genius_id"), 2, 16, &unk_1E5BAAAD0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v42[17] = v23;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("comment"), 4, 0, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v42[18] = v22;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("grouping"), 4, 0, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v42[19] = v21;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("description"), 4, 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v42[20] = v20;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("description_long"), 4, 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v42[21] = v19;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("collection_description"), 4, 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v42[22] = v18;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("copyright"), 4, 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v42[23] = v17;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("pending_genius_checksum"), 2, 16, &unk_1E5BAAAD0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v42[24] = v16;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("category_id"), 2, 16, &unk_1E5BAAAD0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v42[25] = v4;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("location_kind_id"), 2, 16, &unk_1E5BAAAD0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v42[26] = v5;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("version"), 4, 16, &stru_1E5B66908);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v42[27] = v6;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("display_version"), 4, 16, &stru_1E5B66908);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v42[28] = v7;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("classical_work"), 4, 16, &stru_1E5B66908);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v42[29] = v8;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("classical_movement"), 4, 16, &stru_1E5B66908);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v42[30] = v9;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("classical_movement_count"), 2, 16, &unk_1E5BAAAD0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v42[31] = v10;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("classical_movement_number"), 2, 16, &unk_1E5BAAAD0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v42[32] = v11;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("is_preorder"), 2, 16, &unk_1E5BAAAD0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v42[33] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 34);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v32->_columns;
    v32->_columns = (NSArray *)v13;

    columns = v32->_columns;
  }
  return columns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
}

@end
