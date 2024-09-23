@implementation ML3ItemPlaybackTable

- (id)name
{
  return CFSTR("item_playback");
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
  void *v26;
  void *v27;
  _QWORD v28[23];

  v28[21] = *MEMORY[0x1E0C80C00];
  columns = self->_columns;
  if (!columns)
  {
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("item_pid"), 2, 1, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v27;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("audio_format"), 2, 16, &unk_1E5BAC498);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v26;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("bit_rate"), 2, 16, &unk_1E5BAC498);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v25;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("codec_type"), 2, 16, &unk_1E5BAC498);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = v24;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("codec_subtype"), 2, 16, &unk_1E5BAC498);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28[4] = v23;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("data_kind"), 2, 16, &unk_1E5BAC498);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[5] = v22;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("data_url"), 4, 0, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[6] = v21;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("duration"), 2, 16, &unk_1E5BAC498);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[7] = v20;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("eq_preset"), 4, 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28[8] = v19;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("format"), 4, 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[9] = v18;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("gapless_heuristic_info"), 2, 16, &unk_1E5BAC498);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28[10] = v17;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("gapless_encoding_delay"), 2, 16, &unk_1E5BAC498);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[11] = v16;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("gapless_encoding_drain"), 2, 16, &unk_1E5BAC498);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[12] = v15;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("gapless_last_frame_resynch"), 2, 16, &unk_1E5BAC498);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28[13] = v14;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("has_video"), 2, 16, &unk_1E5BAC498);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v28[14] = v4;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("relative_volume"), 2, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v28[15] = v5;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("sample_rate"), 3, 16, &unk_1E5BAC498);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v28[16] = v6;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("start_time_ms"), 3, 16, &unk_1E5BAC498);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v28[17] = v7;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("stop_time_ms"), 3, 16, &unk_1E5BAC498);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v28[18] = v8;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("volume_normalization_energy"), 2, 16, &unk_1E5BAC498);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28[19] = v9;
    +[ML3DatabaseColumn columnWithName:datatype:constraints:defaultValue:](ML3DatabaseColumn, "columnWithName:datatype:constraints:defaultValue:", CFSTR("progression_direction"), 2, 16, &unk_1E5BAC498);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28[20] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 21);
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
