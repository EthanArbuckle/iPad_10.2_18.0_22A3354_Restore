@implementation IMAudioSessionController

+ (void)__setSingleton__im:(id)a3
{
  objc_storeStrong((id *)&qword_2549C1318, a3);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_20D65C4D8;
  block[3] = &unk_24C751508;
  block[4] = a1;
  if (qword_2549C1320 != -1)
    dispatch_once(&qword_2549C1320, block);
  return (id)qword_2549C1318;
}

+ (id)queue
{
  if (qword_2549C1330 != -1)
    dispatch_once(&qword_2549C1330, &unk_24C751048);
  return (id)qword_2549C1328;
}

- (void)activateWithOptions:(unint64_t)a3 completion:(id)a4
{
  MEMORY[0x24BEDD108](self, sel_setActive_options_completion_, 1);
}

- (void)deactivate
{
  MEMORY[0x24BEDD108](self, sel_setActive_options_completion_, 0);
}

- (BOOL)shouldUseSpeaker
{
  uint64_t v2;

  return objc_msgSend_options(self, a2, v2) & 1;
}

- (BOOL)shouldStopPlayingWhenSilent
{
  uint64_t v2;

  return ((unint64_t)objc_msgSend_options(self, a2, v2) >> 1) & 1;
}

- (BOOL)shouldDuckOthers
{
  uint64_t v2;

  return ((unint64_t)objc_msgSend_options(self, a2, v2) >> 2) & 1;
}

- (void)setActive:(BOOL)a3 options:(unint64_t)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  unint64_t v19;
  BOOL v20;
  char v21;
  uint8_t buf[4];
  _BOOL4 v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v6 = a3;
  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  objc_msgSend_audio(IMSharedUILogs, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (void *)MEMORY[0x212BA6170](v8);
    *(_DWORD *)buf = 67109632;
    v23 = v6;
    v24 = 1024;
    v25 = a4 & 1;
    v26 = 2048;
    v27 = v12;
    _os_log_impl(&dword_20D651000, v11, OS_LOG_TYPE_INFO, "setActive:%d shouldUseSpeaker:%d completion:%p", buf, 0x18u);

  }
  objc_msgSend_queue(IMAudioSessionController, v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_20D65C7A0;
  v17[3] = &unk_24C751530;
  v20 = v6;
  v21 = a4 & 1;
  v17[4] = self;
  v18 = v8;
  v19 = a4;
  v16 = v8;
  dispatch_async(v15, v17);

}

- (void)configureAudioSessionWithOptions:(unint64_t)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("IMAudioSessionControllerSessionNotificationOptionsKey");
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v8, (uint64_t)v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_userInfo_(v5, v10, (uint64_t)CFSTR("IMAudioSessionControllerSessionOptionsWillChangeNotification"), self, v9);

}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isDirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

@end
