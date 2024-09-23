@implementation ML3ItemVideoTable

- (id)name
{
  return CFSTR("item_video");
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
  void *v35;
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
  ML3ItemVideoTable *v46;
  _QWORD v47[41];

  v47[39] = *MEMORY[0x1E0C80C00];
  columns = self->_columns;
  if (!columns)
  {
    v46 = self;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("item_pid"), 2, 1, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v45;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("video_quality"), 2, 16, &unk_1E5BAB910);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v44;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("is_rental"), 2, 16, &unk_1E5BAB910);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v43;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("has_chapter_data"), 2, 16, &unk_1E5BAB910);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v42;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("season_number"), 2, 16, &unk_1E5BAB910);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v47[4] = v41;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("episode_id"), 4, 16, &stru_1E5B66908);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v47[5] = v40;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("network_name"), 4, 16, &stru_1E5B66908);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v47[6] = v39;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("extended_content_rating"), 4, 16, &stru_1E5B66908);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v47[7] = v38;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("movie_info"), 4, 16, &stru_1E5B66908);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v47[8] = v37;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("has_alternate_audio"), 2, 16, &unk_1E5BAB910);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v47[9] = v36;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("has_subtitles"), 2, 16, &unk_1E5BAB910);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v47[10] = v35;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("audio_language"), 2, 16, &unk_1E5BAB910);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v47[11] = v34;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("audio_track_index"), 2, 16, &unk_1E5BAB910);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v47[12] = v33;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("audio_track_id"), 2, 16, &unk_1E5BAB910);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v47[13] = v32;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("subtitle_language"), 2, 16, &unk_1E5BAB910);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v47[14] = v31;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("subtitle_track_index"), 2, 16, &unk_1E5BAB910);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v47[15] = v30;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("rental_duration"), 2, 16, &unk_1E5BAB910);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v47[16] = v29;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("rental_playback_duration"), 2, 16, &unk_1E5BAB910);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v47[17] = v28;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("rental_playback_date_started"), 2, 16, &unk_1E5BAB910);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v47[18] = v27;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("rental_date_started"), 2, 16, &unk_1E5BAB910);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v47[19] = v26;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("is_demo"), 2, 16, &unk_1E5BAB910);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v47[20] = v25;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("has_hls"), 2, 16, &unk_1E5BAB910);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v47[21] = v24;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("audio_track_locale"), 4, 16, &stru_1E5B66908);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v47[22] = v23;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("show_sort_type"), 2, 16, &unk_1E5BAB910);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v47[23] = v22;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("episode_type"), 2, 16, &unk_1E5BAB910);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v47[24] = v21;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("episode_type_display_name"), 4, 16, &stru_1E5B66908);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v47[25] = v20;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("episode_sub_sort_order"), 2, 16, &unk_1E5BAB910);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v47[26] = v19;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("hls_offline_playback_keys"), 5, 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v47[27] = v18;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("is_premium"), 2, 16, &unk_1E5BAB910);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v47[28] = v17;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("color_capability"), 2, 16, &unk_1E5BAB910);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v47[29] = v16;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("hls_color_capability"), 2, 16, &unk_1E5BAB910);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v47[30] = v4;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("hls_video_quality"), 2, 16, &unk_1E5BAB910);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v47[31] = v5;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("hls_playlist_url"), 4, 16, &stru_1E5B66908);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v47[32] = v6;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("audio_capability"), 2, 16, &unk_1E5BAB910);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v47[33] = v7;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("hls_audio_capability"), 2, 16, &unk_1E5BAB910);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v47[34] = v8;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("hls_asset_traits"), 2, 16, &unk_1E5BAB910);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v47[35] = v9;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("hls_key_server_url"), 4, 16, &stru_1E5B66908);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v47[36] = v10;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("hls_key_cert_url"), 4, 16, &stru_1E5B66908);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v47[37] = v11;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("hls_key_server_protocol"), 4, 16, &stru_1E5B66908);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v47[38] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 39);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v46->_columns;
    v46->_columns = (NSArray *)v13;

    columns = v46->_columns;
  }
  return columns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
}

@end
