@implementation ATAudioSessionPropertyManager

- (ATAudioSessionPropertyManager)initWithATAudioSessionClientImpl:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  ATAudioSessionPropertyManager *v7;
  ATAudioSessionPropertyManager *v8;
  ATAudioSessionPropertyManager *v9;
  id v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (kAudioSessionClientLogSubsystem)
  {
    v5 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "ATAudioSessionPropertyManager.mm";
    v15 = 1024;
    v16 = 40;
    _os_log_impl(&dword_1A0F4D000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d Creating ATAudioSessionPropertyManager", buf, 0x12u);
  }

LABEL_8:
  v12.receiver = self;
  v12.super_class = (Class)ATAudioSessionPropertyManager;
  v7 = -[ATAudioSessionPropertyManager init](&v12, sel_init);
  v8 = v7;
  if (!v7)
  {
LABEL_18:
    v9 = 0;
    goto LABEL_19;
  }
  if (!v4)
  {
    if (kAudioSessionClientLogSubsystem)
    {
      v9 = (ATAudioSessionPropertyManager *)*(id *)kAudioSessionClientLogSubsystem;
      if (!v9)
        goto LABEL_19;
    }
    else
    {
      v9 = (ATAudioSessionPropertyManager *)MEMORY[0x1E0C81028];
      v10 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "ATAudioSessionPropertyManager.mm";
      v15 = 1024;
      v16 = 46;
      _os_log_impl(&dword_1A0F4D000, &v9->super, OS_LOG_TYPE_ERROR, "%25s:%-5d Passing nil ATAudioSessionClientImpl", buf, 0x12u);
    }

    goto LABEL_18;
  }
  objc_storeWeak((id *)&v7->mAsClientImpl, v4);
  v9 = v8;
LABEL_19:

  return v9;
}

- (int)GetProperty:(unsigned int)a3 size:(unsigned int *)a4 data:(void *)a5
{
  uint64_t v7;
  NSObject *v9;
  id v10;
  const CALog::Scope *v11;
  int v12;
  NSObject *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  id v17;
  const char *v18;
  id v19;
  int v21;
  int v22;
  int v23;
  NSObject *v24;
  int v25;
  unsigned int v26;
  void *v27;
  unint64_t v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  int v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  _DWORD aSelector[6];
  uint64_t v44;

  v7 = *(_QWORD *)&a3;
  v44 = *MEMORY[0x1E0C80C00];
  if (kAudioSessionClientLogSubsystem)
  {
    v9 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v41 = "ATAudioSessionPropertyManager.mm";
    v42 = 1024;
    aSelector[0] = 60;
    LOWORD(aSelector[1]) = 1024;
    *(_DWORD *)((char *)&aSelector[1] + 2) = v7;
    _os_log_impl(&dword_1A0F4D000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d GetProperty %d from AVAudioSession", buf, 0x18u);
  }

LABEL_8:
  asPropertyInfo::GetPropertyInfo((char *)buf, v7);
  if ((buf[0] & 2) != 0)
  {
    if (*a4 != (_DWORD)v41)
    {
      v12 = 561211770;
      if (kAudioSessionClientLogSubsystem)
      {
        v13 = *(id *)kAudioSessionClientLogSubsystem;
        if (!v13)
          return v12;
      }
      else
      {
        v13 = MEMORY[0x1E0C81028];
        v19 = MEMORY[0x1E0C81028];
      }
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_34;
      v34 = 136315650;
      v35 = "ATAudioSessionPropertyManager.mm";
      v36 = 1024;
      v37 = 71;
      v38 = 1024;
      v39 = v7;
      v18 = "%25s:%-5d Invalid input size for property %d";
      goto LABEL_33;
    }
    if (*(_QWORD *)((char *)aSelector + 2))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->mAsClientImpl);
      objc_msgSend(WeakRetained, "avas");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        v13 = 0;
        v12 = 560557673;
        goto LABEL_34;
      }
      NSStringFromSelector(*(SEL *)((char *)aSelector + 2));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "valueForKey:", v16);
      v13 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }
    v12 = 0;
    if ((int)v7 > 1684431724)
    {
      if ((int)v7 <= 1836016740)
      {
        if ((int)v7 <= 1768382837)
        {
          if ((int)v7 <= 1685414762)
          {
            if ((_DWORD)v7 != 1684431725)
            {
              if ((_DWORD)v7 != 1685288051)
                goto LABEL_34;
              goto LABEL_92;
            }
            goto LABEL_89;
          }
          if ((_DWORD)v7 != 1685414763)
          {
            if ((_DWORD)v7 != 1752658802)
              goto LABEL_34;
            goto LABEL_91;
          }
LABEL_85:
          v28 = +[ATAudioSessionUtils getCategoryOptionFromPropertyID:](ATAudioSessionUtils, "getCategoryOptionFromPropertyID:", v7);
          v12 = 0;
          *(_DWORD *)a5 = (-[NSObject unsignedLongValue](v13, "unsignedLongValue") & v28) != 0;
          goto LABEL_34;
        }
        if ((int)v7 <= 1768907363)
        {
          if ((_DWORD)v7 != 1768382838)
          {
            v21 = 1768387427;
LABEL_69:
            if ((_DWORD)v7 != v21)
              goto LABEL_34;
LABEL_70:
            -[NSObject floatValue](v13, "floatValue");
            v12 = 0;
            *(_DWORD *)a5 = v25;
            goto LABEL_34;
          }
          goto LABEL_74;
        }
        if ((_DWORD)v7 == 1768907364)
          goto LABEL_70;
        v22 = 1769173603;
LABEL_80:
        if ((_DWORD)v7 != v22)
          goto LABEL_34;
        v12 = 0;
        v27 = &unk_1E4527208;
LABEL_93:
        *(_QWORD *)a5 = v27;
        goto LABEL_34;
      }
      if ((int)v7 <= 1919907187)
      {
        if ((int)v7 <= 1869899889)
        {
          if ((_DWORD)v7 == 1836016741)
          {
LABEL_89:
            if (*a4 == (_DWORD)v41)
            {
              v26 = +[ATAudioSessionUtils getAudioSessionMode:](ATAudioSessionUtils, "getAudioSessionMode:", v13);
              goto LABEL_103;
            }
            CALog::LogObjIfEnabled((CALog *)1, kAudioSessionClientLogSubsystem, v11);
            v31 = objc_claimAutoreleasedReturnValue();
            v32 = v31;
            if (v31 && os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              v34 = 136315650;
              v35 = "ATAudioSessionPropertyManager.mm";
              v36 = 1024;
              v37 = 109;
              v38 = 1024;
              v39 = v7;
              _os_log_impl(&dword_1A0F4D000, v32, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid input size for property %d", (uint8_t *)&v34, 0x18u);
            }
LABEL_107:

            v12 = 561211770;
            goto LABEL_34;
          }
          v22 = 1868854132;
          goto LABEL_80;
        }
        if ((_DWORD)v7 != 1869899890)
        {
          if ((_DWORD)v7 != 1886546287)
            goto LABEL_34;
          goto LABEL_73;
        }
LABEL_74:
        v26 = -[NSObject BOOLValue](v13, "BOOLValue");
        goto LABEL_103;
      }
      if ((int)v7 > 1936876402)
      {
        if ((_DWORD)v7 != 1936876403)
        {
          if ((_DWORD)v7 == 1954115685)
          {
            v29 = objc_loadWeakRetained((id *)&self->mAsClientImpl);
            *(_DWORD *)a5 = objc_msgSend(v29, "interruptionType");

            v12 = 0;
          }
          goto LABEL_34;
        }
LABEL_92:
        v12 = 0;
        v27 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_93;
      }
      if ((_DWORD)v7 == 1919907188)
      {
        v24 = v13;
        v13 = v24;
      }
      else
      {
        if ((_DWORD)v7 != 1920166244)
          goto LABEL_34;
        v24 = -[NSObject longLongValue](v13, "longLongValue");
      }
LABEL_96:
      v12 = 0;
      *(_QWORD *)a5 = v24;
      goto LABEL_34;
    }
    if ((int)v7 <= 1667788642)
    {
      if ((int)v7 <= 1634956147)
      {
        if ((_DWORD)v7 == 1633902964)
        {
          if (*a4 == (_DWORD)v41)
          {
            v26 = +[ATAudioSessionUtils getAudioSessionCategory:](ATAudioSessionUtils, "getAudioSessionCategory:", v13);
            goto LABEL_103;
          }
          CALog::LogObjIfEnabled((CALog *)1, kAudioSessionClientLogSubsystem, v11);
          v33 = objc_claimAutoreleasedReturnValue();
          v32 = v33;
          if (v33 && os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            v34 = 136315650;
            v35 = "ATAudioSessionPropertyManager.mm";
            v36 = 1024;
            v37 = 100;
            v38 = 1024;
            v39 = 1633902964;
            _os_log_impl(&dword_1A0F4D000, v32, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid input size for property %d", (uint8_t *)&v34, 0x18u);
          }
          goto LABEL_107;
        }
        if ((_DWORD)v7 != 1633907830 && (_DWORD)v7 != 1634296182)
          goto LABEL_34;
        goto LABEL_74;
      }
      if ((int)v7 > 1667785315)
      {
        if ((_DWORD)v7 == 1667785316)
          goto LABEL_70;
        if ((_DWORD)v7 != 1667787107)
          goto LABEL_34;
        goto LABEL_73;
      }
      if ((_DWORD)v7 == 1634956148)
      {
LABEL_73:
        v26 = -[NSObject unsignedIntValue](v13, "unsignedIntValue");
LABEL_103:
        v12 = 0;
        *(_DWORD *)a5 = v26;
        goto LABEL_34;
      }
      v23 = 1667394677;
    }
    else
    {
      if ((int)v7 <= 1668114807)
      {
        if ((int)v7 > 1667789681)
        {
          if ((_DWORD)v7 == 1667789682)
          {
LABEL_91:
            -[NSObject doubleValue](v13, "doubleValue");
            v12 = 0;
            *(_QWORD *)a5 = v30;
            goto LABEL_34;
          }
          v21 = 1667853428;
          goto LABEL_69;
        }
        if ((_DWORD)v7 != 1667788643)
        {
          v21 = 1667788662;
          goto LABEL_69;
        }
        goto LABEL_73;
      }
      if ((int)v7 <= 1668440433)
      {
        if ((_DWORD)v7 == 1668114808)
          goto LABEL_85;
        v21 = 1668246644;
        goto LABEL_69;
      }
      if ((_DWORD)v7 == 1668440434)
      {
        +[ATAudioSessionUtils getRouteDescriptionFromAVASRouteDescription:](ATAudioSessionUtils, "getRouteDescriptionFromAVASRouteDescription:", v13);
        v24 = objc_claimAutoreleasedReturnValue();
        goto LABEL_96;
      }
      v23 = 1668509803;
    }
    if ((_DWORD)v7 != v23)
      goto LABEL_34;
    goto LABEL_85;
  }
  v12 = 1886681407;
  if (kAudioSessionClientLogSubsystem)
  {
    v13 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v13)
      return v12;
  }
  else
  {
    v13 = MEMORY[0x1E0C81028];
    v17 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v34 = 136315650;
    v35 = "ATAudioSessionPropertyManager.mm";
    v36 = 1024;
    v37 = 67;
    v38 = 1024;
    v39 = v7;
    v18 = "%25s:%-5d Invalid property request: property %d is not a read property";
LABEL_33:
    _os_log_impl(&dword_1A0F4D000, v13, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v34, 0x18u);
  }
LABEL_34:

  return v12;
}

- (int)SetProperty:(unsigned int)a3 size:(unsigned int)a4 data:(const void *)a5
{
  uint64_t v7;
  NSObject *v9;
  id v10;
  int v11;
  NSObject *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  const char *v19;
  id v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  id v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const CALog::Scope *v28;
  uint64_t v29;
  const CALog::Scope *v30;
  const CALog::Scope *v31;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  id v38;
  id *v39;
  id v40;
  char v41[4];
  int v42;
  uint64_t v43;
  _BYTE buf[12];
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v7 = *(_QWORD *)&a3;
  v51 = *MEMORY[0x1E0C80C00];
  if (kAudioSessionClientLogSubsystem)
  {
    v9 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "ATAudioSessionPropertyManager.mm";
    v45 = 1024;
    v46 = 219;
    v47 = 1024;
    v48 = v7;
    _os_log_impl(&dword_1A0F4D000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d SetProperty %d on AVAudioSession", buf, 0x18u);
  }

LABEL_8:
  asPropertyInfo::GetPropertyInfo(v41, v7);
  if ((v41[0] & 4) != 0)
  {
    if (v42 != a4)
    {
      v11 = 561211770;
      if (kAudioSessionClientLogSubsystem)
      {
        v12 = *(id *)kAudioSessionClientLogSubsystem;
        if (!v12)
          return v11;
      }
      else
      {
        v12 = MEMORY[0x1E0C81028];
        v20 = MEMORY[0x1E0C81028];
      }
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_79;
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "ATAudioSessionPropertyManager.mm";
      v45 = 1024;
      v46 = 230;
      v47 = 1024;
      v48 = v7;
      v19 = "%25s:%-5d Invalid input size for property %d";
      goto LABEL_30;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->mAsClientImpl);
    objc_msgSend(WeakRetained, "avas");
    v12 = objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v11 = 560557673;
      goto LABEL_79;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v14 = (void *)MEMORY[0x1E0C99DB8];
      -[NSObject methodSignatureForSelector:](v12, "methodSignatureForSelector:", v43);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "invocationWithMethodSignature:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v16, "setSelector:", v43);
        objc_msgSend(v16, "setTarget:", v12);
        v39 = &v40;
        v40 = 0;
        if ((int)v7 <= 1752658801)
        {
          if ((int)v7 > 1668114807)
          {
            if ((int)v7 <= 1684431724)
            {
              if ((_DWORD)v7 == 1668114808)
              {
LABEL_63:
                v25 = +[ATAudioSessionUtils getCategoryOptionFromPropertyID:](ATAudioSessionUtils, "getCategoryOptionFromPropertyID:", v7);
                if (*(_DWORD *)a5)
                  v26 = -[NSObject categoryOptions](v12, "categoryOptions") | v25;
                else
                  v26 = -[NSObject categoryOptions](v12, "categoryOptions") & ~v25;
                *(_QWORD *)buf = v26;
                -[NSObject category](v12, "category");
                v38 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "setArgument:atIndex:", &v38, 2);
                objc_msgSend(v16, "setArgument:atIndex:", buf, 3);
                objc_msgSend(v16, "setArgument:atIndex:", &v39, 4);

                goto LABEL_76;
              }
              v17 = 1668509803;
              goto LABEL_62;
            }
            if ((_DWORD)v7 != 1684431725)
            {
              v17 = 1685414763;
LABEL_62:
              if ((_DWORD)v7 == v17)
                goto LABEL_63;
LABEL_76:
              objc_msgSend(v16, "invoke");
              LOBYTE(v38) = 0;
              objc_msgSend(v16, "getReturnValue:", &v38);
              if ((_BYTE)v38)
              {
                v11 = 0;
              }
              else
              {
                CALog::LogObjIfEnabled((CALog *)1, kAudioSessionClientLogSubsystem, v31);
                v33 = objc_claimAutoreleasedReturnValue();
                v34 = v33;
                if (v33 && os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315906;
                  *(_QWORD *)&buf[4] = "ATAudioSessionPropertyManager.mm";
                  v45 = 1024;
                  v46 = 363;
                  v47 = 1024;
                  v48 = v7;
                  v49 = 2112;
                  v50 = v40;
                  _os_log_impl(&dword_1A0F4D000, v34, OS_LOG_TYPE_ERROR, "%25s:%-5d FAILED to set property %d on AVAudioSession with error %@", buf, 0x22u);
                }

                v11 = 2003329396;
                if (v39 && objc_msgSend(v40, "code"))
                  v11 = objc_msgSend(v40, "code");
              }

              goto LABEL_79;
            }
            goto LABEL_68;
          }
          if ((_DWORD)v7 == 1633902964)
          {
            v29 = *(unsigned int *)a5;
            +[ATAudioSessionUtils getAVASCategory:](ATAudioSessionUtils, "getAVASCategory:", v29);
            v38 = (id)objc_claimAutoreleasedReturnValue();
            if (v38)
              goto LABEL_69;
            CALog::LogObjIfEnabled((CALog *)1, kAudioSessionClientLogSubsystem, v30);
            v37 = objc_claimAutoreleasedReturnValue();
            v36 = v37;
            if (v37 && os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              *(_QWORD *)&buf[4] = "ATAudioSessionPropertyManager.mm";
              v45 = 1024;
              v46 = 282;
              v47 = 1024;
              v48 = v29;
              _os_log_impl(&dword_1A0F4D000, v36, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid category %u", buf, 0x18u);
            }
            goto LABEL_94;
          }
          if ((_DWORD)v7 != 1634956148)
          {
            v17 = 1667394677;
            goto LABEL_62;
          }
          goto LABEL_70;
        }
        if ((int)v7 <= 1836016740)
        {
          if ((_DWORD)v7 != 1752658802)
          {
            if ((_DWORD)v7 == 1768387427 || (_DWORD)v7 == 1768907364)
            {
              *(double *)buf = *(float *)a5;
              objc_msgSend(v16, "setArgument:atIndex:", buf, 2);
              objc_msgSend(v16, "setArgument:atIndex:", &v39, 3);
            }
            goto LABEL_76;
          }
        }
        else
        {
          if ((int)v7 <= 1886546286)
          {
            if ((_DWORD)v7 != 1836016741)
            {
              if ((_DWORD)v7 == 1870033508)
              {
                v23 = 1936747378;
                if (!*(_DWORD *)a5)
                  v23 = 0;
                *(_QWORD *)buf = v23;
                objc_msgSend(v16, "setArgument:atIndex:", buf, 2);
                objc_msgSend(v16, "setArgument:atIndex:", &v39, 3);
              }
              goto LABEL_76;
            }
LABEL_68:
            v27 = *(unsigned int *)a5;
            +[ATAudioSessionUtils getAVASMode:](ATAudioSessionUtils, "getAVASMode:", v27);
            v38 = (id)objc_claimAutoreleasedReturnValue();
            if (v38)
            {
LABEL_69:
              objc_msgSend(v16, "setArgument:atIndex:", &v38, 2);
              objc_msgSend(v16, "setArgument:atIndex:", &v39, 3);

              goto LABEL_76;
            }
            CALog::LogObjIfEnabled((CALog *)1, kAudioSessionClientLogSubsystem, v28);
            v35 = objc_claimAutoreleasedReturnValue();
            v36 = v35;
            if (v35 && os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              *(_QWORD *)&buf[4] = "ATAudioSessionPropertyManager.mm";
              v45 = 1024;
              v46 = 298;
              v47 = 1024;
              v48 = v27;
              _os_log_impl(&dword_1A0F4D000, v36, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid mode %u", buf, 0x18u);
            }
LABEL_94:

            v11 = -50;
            goto LABEL_79;
          }
          if ((_DWORD)v7 == 1886546287)
          {
LABEL_70:
            *(_DWORD *)buf = *(_DWORD *)a5;
            objc_msgSend(v16, "setArgument:atIndex:", buf, 2);
            objc_msgSend(v16, "setArgument:atIndex:", &v39, 3);
            goto LABEL_76;
          }
          if ((_DWORD)v7 != 1920166244)
            goto LABEL_76;
        }
        *(_QWORD *)buf = *(_QWORD *)a5;
        objc_msgSend(v16, "setArgument:atIndex:", buf, 2);
        objc_msgSend(v16, "setArgument:atIndex:", &v39, 3);
        goto LABEL_76;
      }
      v11 = 2003329396;
      if (kAudioSessionClientLogSubsystem)
      {
        v21 = *(id *)kAudioSessionClientLogSubsystem;
        if (!v21)
          goto LABEL_79;
      }
      else
      {
        v21 = MEMORY[0x1E0C81028];
        v24 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "ATAudioSessionPropertyManager.mm";
        v45 = 1024;
        v46 = 241;
        v47 = 1024;
        v48 = v7;
        _os_log_impl(&dword_1A0F4D000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d Error while setting property %d", buf, 0x18u);
      }
    }
    else
    {
      v11 = 2003329396;
      if (kAudioSessionClientLogSubsystem)
      {
        v21 = *(id *)kAudioSessionClientLogSubsystem;
        if (!v21)
          goto LABEL_79;
      }
      else
      {
        v21 = MEMORY[0x1E0C81028];
        v22 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "ATAudioSessionPropertyManager.mm";
        v45 = 1024;
        v46 = 373;
        v47 = 1024;
        v48 = v7;
        _os_log_impl(&dword_1A0F4D000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d Un-Supported property request to set: %d on AVAudioSession", buf, 0x18u);
      }
    }

    goto LABEL_79;
  }
  v11 = 1886681407;
  if (kAudioSessionClientLogSubsystem)
  {
    v12 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v12)
      return v11;
  }
  else
  {
    v12 = MEMORY[0x1E0C81028];
    v18 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "ATAudioSessionPropertyManager.mm";
    v45 = 1024;
    v46 = 226;
    v47 = 1024;
    v48 = v7;
    v19 = "%25s:%-5d Invalid property request: property %d is not a write property";
LABEL_30:
    _os_log_impl(&dword_1A0F4D000, v12, OS_LOG_TYPE_ERROR, v19, buf, 0x18u);
  }
LABEL_79:

  return v11;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mAsClientImpl);
}

@end
