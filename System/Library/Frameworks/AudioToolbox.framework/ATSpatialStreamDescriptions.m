@implementation ATSpatialStreamDescriptions

- (id)description
{
  id v3;
  unint64_t i;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<ATSpatialStreamDescriptions@%p: format=%@, streams=["), self, self->_flatFormat);
  for (i = 0; -[NSMutableArray count](self->_streamParameters, "count") > i; ++i)
  {
    -[NSMutableArray objectAtIndex:](self->_streamParameters, "objectAtIndex:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEnabled"))
    {
      objc_msgSend(v5, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v6);

    }
    else
    {
      objc_msgSend(v3, "appendFormat:", CFSTR("d"));
    }
    if (-[NSMutableArray count](self->_streamParameters, "count") - 1 > i)
      objc_msgSend(v3, "appendFormat:", CFSTR(", "));

  }
  objc_msgSend(v3, "appendString:", CFSTR("]>"));
  return v3;
}

- (ATSpatialStreamDescriptions)init
{
  -[ATSpatialStreamDescriptions doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ATSpatialStreamDescriptions)initWithFlatIOFormat:(id)a3 type:(int64_t)a4
{
  id v7;
  ATSpatialStreamDescriptions *v8;
  ATSpatialStreamDescriptions *v9;
  id *p_flatFormat;
  uint64_t v11;
  NSMutableArray *streamParameters;
  int64_t type;
  NSObject *v14;
  int v15;
  int64_t v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  unsigned int v22;
  unsigned int v23;
  AVAudioFormat *v24;
  AVAudioFormat *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  AVAudioFormat *streamFormat;
  int v32;
  id v33;
  void *v34;
  void *v35;
  char v36;
  NSObject *p_super;
  int v38;
  id v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  NSObject *v43;
  int v44;
  id v45;
  uint64_t v46;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  objc_super v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  _BYTE buf[44];
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  int v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v51.receiver = self;
  v51.super_class = (Class)ATSpatialStreamDescriptions;
  v8 = -[ATSpatialStreamDescriptions init](&v51, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_44;
  v8->_type = a4;
  p_flatFormat = (id *)&v8->_flatFormat;
  objc_storeStrong((id *)&v8->_flatFormat, a3);
  v11 = objc_opt_new();
  streamParameters = v9->_streamParameters;
  v9->_streamParameters = (NSMutableArray *)v11;

  type = v9->_type;
  if (!type)
  {
    objc_storeStrong((id *)&v9->_streamFormat, v9->_flatFormat);
    v15 = 1;
    goto LABEL_30;
  }
  if (type != 1)
  {
    sATSpatialStreamLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = v9->_type;
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "ATSpatialParameters.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 234;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v16;
      _os_log_impl(&dword_1A0F4D000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: invalid stream type %d!", buf, 0x18u);
    }
    goto LABEL_8;
  }
  if (objc_msgSend(*p_flatFormat, "channelCount") >= 2
    && objc_msgSend(*p_flatFormat, "isInterleaved"))
  {
    sATSpatialStreamLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "ATSpatialParameters.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 207;
      _os_log_impl(&dword_1A0F4D000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Expect a deinterleaved format for multi-stream type!", buf, 0x12u);
    }
LABEL_8:

LABEL_42:
    p_super = &v9->super;
    v9 = 0;
    goto LABEL_43;
  }
  v17 = objc_msgSend(*p_flatFormat, "channelCount");
  v18 = v17;
  if (v17 <= 1)
    v15 = 1;
  else
    v15 = v17;
  if (v15 <= 0)
  {
LABEL_49:
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  v19 = objc_msgSend(*p_flatFormat, "streamDescription");
  v20 = *(_OWORD *)v19;
  v21 = *(_OWORD *)(v19 + 16);
  v50 = *(_QWORD *)(v19 + 32);
  v48 = v20;
  v49 = v21;
  if (v18 >= 2)
  {
    if ((BYTE12(v48) & 0x20) != 0)
    {
      v22 = 1;
    }
    else
    {
      v22 = HIDWORD(v49);
      if (!HIDWORD(v49))
      {
        v23 = (v50 + 7) >> 3;
LABEL_24:
        *((_QWORD *)&v49 + 1) = v23 | 0x100000000;
        *(_QWORD *)&v49 = *((_QWORD *)&v49 + 1);
        v52 = 0;
        v53 = &v52;
        v54 = 0x2050000000;
        v26 = (void *)getAVAudioChannelLayoutClass::softClass;
        v55 = getAVAudioChannelLayoutClass::softClass;
        if (!getAVAudioChannelLayoutClass::softClass)
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __getAVAudioChannelLayoutClass_block_invoke;
          *(_QWORD *)&buf[24] = &unk_1E4519C48;
          *(_QWORD *)&buf[32] = &v52;
          __getAVAudioChannelLayoutClass_block_invoke((uint64_t)buf);
          v26 = (void *)v53[3];
        }
        v27 = v26;
        _Block_object_dispose(&v52, 8);
        v25 = (AVAudioFormat *)objc_msgSend(objc_alloc((Class)v27), "initWithLayoutTag:", 6553601, v48, v49);
        v52 = 0;
        v53 = &v52;
        v54 = 0x2050000000;
        v28 = (void *)getAVAudioFormatClass::softClass;
        v55 = getAVAudioFormatClass::softClass;
        if (!getAVAudioFormatClass::softClass)
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __getAVAudioFormatClass_block_invoke;
          *(_QWORD *)&buf[24] = &unk_1E4519C48;
          *(_QWORD *)&buf[32] = &v52;
          __getAVAudioFormatClass_block_invoke((uint64_t)buf);
          v28 = (void *)v53[3];
        }
        v29 = v28;
        _Block_object_dispose(&v52, 8);
        v30 = objc_msgSend(objc_alloc((Class)v29), "initWithStreamDescription:channelLayout:", &v48, v25);
        streamFormat = v9->_streamFormat;
        v9->_streamFormat = (AVAudioFormat *)v30;

        goto LABEL_29;
      }
    }
    v23 = DWORD2(v49) / v22;
    goto LABEL_24;
  }
  v24 = v9->_flatFormat;
  v25 = v9->_streamFormat;
  v9->_streamFormat = v24;
LABEL_29:

LABEL_30:
  if (!v9->_streamFormat)
  {
LABEL_47:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_48;
  }
  v32 = v15;
  do
  {
    v33 = -[ATSpatialStreamParameters initInternalWithFormat:]([ATSpatialStreamParameters alloc], "initInternalWithFormat:", v9->_streamFormat);
    v34 = v33;
    if (!v33)
    {
      sATSpatialStreamLog();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v44 = v9->_type;
        -[AVAudioFormat description](v9->_streamFormat, "description");
        v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v46 = objc_msgSend(v45, "UTF8String");
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "ATSpatialParameters.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 254;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v44;
        *(_WORD *)&buf[24] = 2080;
        *(_QWORD *)&buf[26] = v46;
        _os_log_impl(&dword_1A0F4D000, v43, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: could not create stream params for type %d, format %s!", buf, 0x22u);

      }
      goto LABEL_42;
    }
    if (objc_msgSend(v33, "isEnabled"))
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
LABEL_46:
      _os_assert_log();
      _os_crash();
      __break(1u);
      goto LABEL_47;
    }
    objc_msgSend(v34, "format");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "isEqual:", v9->_streamFormat);

    if ((v36 & 1) == 0)
      goto LABEL_46;
    -[NSMutableArray addObject:](v9->_streamParameters, "addObject:", v34);

    --v32;
  }
  while (v32);
  if (-[NSMutableArray count](v9->_streamParameters, "count") != v15)
  {
LABEL_48:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_49;
  }
  sATSpatialStreamLog();
  p_super = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
  {
    v38 = v9->_type;
    -[AVAudioFormat description](v9->_flatFormat, "description");
    v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v40 = objc_msgSend(v39, "UTF8String");
    -[AVAudioFormat description](v9->_streamFormat, "description");
    v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v42 = objc_msgSend(v41, "UTF8String");
    *(_DWORD *)buf = 136316674;
    *(_QWORD *)&buf[4] = "ATSpatialParameters.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 269;
    *(_WORD *)&buf[18] = 2048;
    *(_QWORD *)&buf[20] = v9;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = v38;
    *(_WORD *)&buf[34] = 2080;
    *(_QWORD *)&buf[36] = v40;
    v57 = 2080;
    v58 = v42;
    v59 = 1024;
    v60 = v15;
    _os_log_impl(&dword_1A0F4D000, p_super, OS_LOG_TYPE_DEBUG, "%25s:%-5d streamdescs@%p: type %d, flat format %s, stream format %s, #streams %d", buf, 0x3Cu);

  }
LABEL_43:

LABEL_44:
  return v9;
}

- (NSArray)streamParameters
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_streamParameters, "copy");
}

- (int64_t)type
{
  return self->_type;
}

- (AVAudioFormat)flatFormat
{
  return self->_flatFormat;
}

- (AVAudioFormat)streamFormat
{
  return self->_streamFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamParameters, 0);
  objc_storeStrong((id *)&self->_streamFormat, 0);
  objc_storeStrong((id *)&self->_flatFormat, 0);
}

@end
