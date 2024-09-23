@implementation MIOOutputSettingsFactory

+ (id)outputSettingsWithConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  __objc2_class **v15;
  void *v16;
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t v20[16];
  uint8_t v21[16];
  uint8_t buf[16];

  v7 = a7;
  v8 = a6;
  v11 = a3;
  objc_msgSend(v11, "objectForKey:", CFSTR("StreamEncoderType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");

  if (+[MIOMiscStreamOutputSettings supportsEncoderType:](MIOMiscStreamOutputSettings, "supportsEncoderType:", v13))
  {
    if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210675000, v14, OS_LOG_TYPE_DEBUG, "'Other' encoder does not support high performance profile.", buf, 2u);
      }
      v15 = off_24CA43B88;
LABEL_29:

      goto LABEL_30;
    }
    v15 = off_24CA43B88;
  }
  else if (+[MIOProResStreamOutputSettings supportsEncoderType:](MIOProResStreamOutputSettings, "supportsEncoderType:", v13))
  {
    if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_210675000, v14, OS_LOG_TYPE_DEBUG, "'ProRes' encoder does not support high performance profile.", v21, 2u);
      }
      v15 = off_24CA43BC8;
      goto LABEL_29;
    }
    v15 = off_24CA43BC8;
  }
  else if (+[MIOSlimStreamOutputSettings supportsEncoderType:](MIOSlimStreamOutputSettings, "supportsEncoderType:", v13))
  {
    if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_210675000, v14, OS_LOG_TYPE_DEBUG, "'Slim' encoder does not support high performance profile.", v20, 2u);
      }
      v15 = off_24CA43BE0;
      goto LABEL_29;
    }
    v15 = off_24CA43BE0;
  }
  else
  {
    if (+[MIOYzipStreamOutputSettings supportsEncoderType:](MIOYzipStreamOutputSettings, "supportsEncoderType:", v13))
    {
      if (!+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
      {
        v15 = off_24CA43C38;
        goto LABEL_30;
      }
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_210675000, v14, OS_LOG_TYPE_DEBUG, "'Yzip' encoder does not support high performance profile.", v19, 2u);
      }
      v15 = off_24CA43C38;
      goto LABEL_29;
    }
    if (+[MIOJPEGStreamOutputSettings supportsEncoderType:](MIOJPEGStreamOutputSettings, "supportsEncoderType:", v13))
    {
      if (!+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
      {
        v15 = off_24CA43B60;
        goto LABEL_30;
      }
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_210675000, v14, OS_LOG_TYPE_DEBUG, "'JPEG' encoder does not support high performance profile.", v18, 2u);
      }
      v15 = off_24CA43B60;
      goto LABEL_29;
    }
    if (+[MIOH264StreamOutputSettings supportsEncoderType:](MIOH264StreamOutputSettings, "supportsEncoderType:", v13))
    {
      v15 = off_24CA43B48;
    }
    else if (+[MIOHEVCAlphaStreamOutputSettings supportsEncoderType:](MIOHEVCAlphaStreamOutputSettings, "supportsEncoderType:", v13))
    {
      v15 = off_24CA43B50;
    }
    else
    {
      if (!+[MIOHEVCStreamOutputSettings supportsEncoderType:](MIOHEVCStreamOutputSettings, "supportsEncoderType:", v13))
      {
        v16 = 0;
        goto LABEL_31;
      }
      v15 = off_24CA43B58;
    }
  }
LABEL_30:
  -[__objc2_class outputSettingsWithConfig:formatDescription:defaultFrameRate:preferEncoderConfig:enableAVEHighPerformanceProfile:](*v15, "outputSettingsWithConfig:formatDescription:defaultFrameRate:preferEncoderConfig:enableAVEHighPerformanceProfile:", v11, a4, v8, v7, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:

  return v16;
}

@end
