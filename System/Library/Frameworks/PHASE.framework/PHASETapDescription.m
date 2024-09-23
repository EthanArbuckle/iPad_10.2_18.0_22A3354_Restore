@implementation PHASETapDescription

- (id)initInternalWithType:(int64_t)a3
{
  PHASETapDescription *v4;
  PHASETapDescription *v5;
  NSMutableString *uidString;
  NSString *sceneIdentifier;
  void *v8;
  uint64_t v9;
  AVAudioFormat *format;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PHASETapDescription;
  v4 = -[PHASETapDescription init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    uidString = v4->_uidString;
    v4->_uidString = 0;

    v5->_type = a3;
    *(_OWORD *)&v5->_binding = xmmword_2166F8020;
    v5->_audioSessionToken = 0;
    sceneIdentifier = v5->_sceneIdentifier;
    v5->_sceneIdentifier = 0;

    v5->_processIdentifier = 0;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB17E8]), "initWithLayoutTag:", 6553601);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDB1818]), "initWithCommonFormat:sampleRate:interleaved:channelLayout:", 1, 0, v8, 48000.0);
    format = v5->_format;
    v5->_format = (AVAudioFormat *)v9;

  }
  return v5;
}

- (id)initSystemTapOfType:(int64_t)a3
{
  id result;

  result = -[PHASETapDescription initInternalWithType:](self, "initInternalWithType:", a3);
  if (result)
    *((_QWORD *)result + 4) = 0;
  return result;
}

- (id)initScreenSharingTapOfType:(int64_t)a3
{
  id result;

  result = -[PHASETapDescription initInternalWithType:](self, "initInternalWithType:", a3);
  if (result)
    *((_QWORD *)result + 4) = 5;
  return result;
}

- (PHASETapDescription)initWithProcessIdentifier:(int)a3 tapType:(int64_t)a4
{
  PHASETapDescription *v5;
  _QWORD *v6;
  PHASETapDescription *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v5 = self;
  v16 = *MEMORY[0x24BDAC8D0];
  if (a3 <= 0)
  {
    v8 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 432));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315650;
      v11 = "PHASETaps.mm";
      v12 = 1024;
      v13 = 124;
      v14 = 1024;
      v15 = a3;
      _os_log_impl(&dword_2164CC000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: tap desc: invalid processIdentifier %d", (uint8_t *)&v10, 0x18u);
    }
    v7 = 0;
  }
  else
  {
    v6 = -[PHASETapDescription initInternalWithType:](self, "initInternalWithType:", a4);
    if (v6)
    {
      v6[4] = 1;
      *((_DWORD *)v6 + 5) = a3;
    }
    v5 = v6;
    v7 = v5;
  }

  return v7;
}

- (PHASETapDescription)initWithAudioSessionToken:(unsigned int)a3 tapType:(int64_t)a4
{
  PHASETapDescription *v5;
  NSObject *v6;
  PHASETapDescription *v7;
  _QWORD *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  unsigned int v15;
  uint64_t v16;

  v5 = self;
  v16 = *MEMORY[0x24BDAC8D0];
  if (a3 + 1 > 1)
  {
    v8 = -[PHASETapDescription initInternalWithType:](self, "initInternalWithType:", a4);
    if (v8)
    {
      v8[4] = 2;
      *((_DWORD *)v8 + 4) = a3;
    }
    v5 = v8;
    v7 = v5;
  }
  else
  {
    v6 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 432));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315650;
      v11 = "PHASETaps.mm";
      v12 = 1024;
      v13 = 141;
      v14 = 1024;
      v15 = a3;
      _os_log_impl(&dword_2164CC000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: tap desc: invalid audioSessionToken 0x%x", (uint8_t *)&v10, 0x18u);
    }
    v7 = 0;
  }

  return v7;
}

- (PHASETapDescription)initWithSceneIdentifier:(id)a3 tapType:(int64_t)a4
{
  Phase::Logger *v7;
  Phase::Logger *v8;
  id *v9;
  id *v10;
  PHASETapDescription *v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = (Phase::Logger *)a3;
  v8 = v7;
  if (v7 && (v7 = (Phase::Logger *)-[Phase::Logger length](v7, "length")) != 0)
  {
    v9 = -[PHASETapDescription initInternalWithType:](self, "initInternalWithType:", a4);
    v10 = v9;
    if (v9)
    {
      v9[4] = (id)3;
      objc_storeStrong(v9 + 6, a3);
    }
    self = v10;
    v11 = self;
  }
  else
  {
    v12 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v7)
                                                                                        + 432)));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315650;
      v15 = "PHASETaps.mm";
      v16 = 1024;
      v17 = 158;
      v18 = 2080;
      v19 = -[Phase::Logger UTF8String](objc_retainAutorelease(v8), "UTF8String");
      _os_log_impl(&dword_2164CC000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: tap desc: invalid sceneIdentifier %s", (uint8_t *)&v14, 0x1Cu);
    }

    v11 = 0;
  }

  return v11;
}

- (PHASETapDescription)initWithStreamType:(int64_t)a3 tapType:(int64_t)a4
{
  PHASETapDescription *v4;
  _OWORD *v5;
  PHASETapDescription *v6;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v4 = self;
  v16 = *MEMORY[0x24BDAC8D0];
  if (a3 == 1)
  {
    v5 = -[PHASETapDescription initInternalWithType:](self, "initInternalWithType:", a4);
    if (v5)
      v5[2] = xmmword_2166F7330;
    v4 = v5;
    v6 = v4;
  }
  else
  {
    v8 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 432));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315650;
      v11 = "PHASETaps.mm";
      v12 = 1024;
      v13 = 175;
      v14 = 2048;
      v15 = a3;
      _os_log_impl(&dword_2164CC000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: tap desc: invalid streamType %ld", (uint8_t *)&v10, 0x1Cu);
    }
    v6 = 0;
  }

  return v6;
}

- (NSString)uidString
{
  NSMutableString *uidString;
  NSMutableString *v4;
  NSMutableString *v5;
  int64_t type;
  const char *v7;
  const char *v8;
  NSMutableString *v9;
  const __CFString *v10;
  uint64_t v12;

  uidString = self->_uidString;
  if (!uidString || !-[NSMutableString length](uidString, "length"))
  {
    v4 = (NSMutableString *)objc_opt_new();
    v5 = self->_uidString;
    self->_uidString = v4;

    type = self->_type;
    v7 = "Default";
    if (type == 1)
      v7 = "PreSpatial_PreSessionVolume";
    if (type)
      v8 = v7;
    else
      v8 = "PreSpatial";
    -[NSMutableString appendFormat:](self->_uidString, "appendFormat:", CFSTR("PhaseTap-%s-"), v8);
    switch(self->_binding)
    {
      case 0:
        v9 = self->_uidString;
        v10 = CFSTR("System");
        goto LABEL_15;
      case 1:
        -[NSMutableString appendFormat:](self->_uidString, "appendFormat:", CFSTR("Process-%d"), self->_processIdentifier);
        break;
      case 2:
        -[NSMutableString appendFormat:](self->_uidString, "appendFormat:", CFSTR("SessionID-0x%x"), self->_audioSessionToken);
        break;
      case 3:
        -[NSMutableString appendFormat:](self->_uidString, "appendFormat:", CFSTR("SceneID-%s"), -[NSString UTF8String](self->_sceneIdentifier, "UTF8String"));
        break;
      case 4:
        -[NSMutableString appendFormat:](self->_uidString, "appendFormat:", CFSTR("Stream-%d"), self->_streamType);
        break;
      case 5:
        v9 = self->_uidString;
        v10 = CFSTR("ScreenSharing");
LABEL_15:
        -[NSMutableString appendFormat:](v9, "appendFormat:", v10, v12);
        break;
      default:
        return (NSString *)(id)-[NSMutableString copy](self->_uidString, "copy");
    }
  }
  return (NSString *)(id)-[NSMutableString copy](self->_uidString, "copy");
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)binding
{
  return self->_binding;
}

- (int64_t)streamType
{
  return self->_streamType;
}

- (unsigned)audioSessionToken
{
  return self->_audioSessionToken;
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (AVAudioFormat)format
{
  return self->_format;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_uidString, 0);
}

@end
