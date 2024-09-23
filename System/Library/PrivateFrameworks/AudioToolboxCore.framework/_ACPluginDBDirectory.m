@implementation _ACPluginDBDirectory

- (void)dealloc
{
  __FSEventStream *mFSMonitor;
  objc_super v4;

  mFSMonitor = self->mFSMonitor;
  if (mFSMonitor)
  {
    FSEventStreamInvalidate(mFSMonitor);
    CFRelease(self->mFSMonitor);
  }
  v4.receiver = self;
  v4.super_class = (Class)_ACPluginDBDirectory;
  -[_ACPluginDBDirectory dealloc](&v4, sel_dealloc);
}

- (_ACPluginDBDirectory)initWithPath:(id)a3 priority:(int)a4
{
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *mBundlesByName;
  NSMutableArray *v10;
  NSMutableArray *mChangedBundlePaths;

  v7 = a3;
  objc_storeStrong((id *)&self->mFullPath, a3);
  self->mPriority = a4;
  v8 = (NSMutableDictionary *)objc_opt_new();
  mBundlesByName = self->mBundlesByName;
  self->mBundlesByName = v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  mChangedBundlePaths = self->mChangedBundlePaths;
  self->mChangedBundlePaths = v10;

  self->mNrOfPathsChanged = 0;
  self->mShouldRescan = 0;
  -[_ACPluginDBDirectory refreshModificationDate](self, "refreshModificationDate");

  return self;
}

- (_ACPluginDBDirectory)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *mFullPath;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *mBundlesByName;
  NSMutableArray *v13;
  NSMutableArray *mChangedBundlePaths;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  mFullPath = self->mFullPath;
  self->mFullPath = v5;

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("modDate"));
  self->mModificationDate = v7;
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("bundles"));
  v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  mBundlesByName = self->mBundlesByName;
  self->mBundlesByName = v11;

  self->mPriority = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("priority"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  mChangedBundlePaths = self->mChangedBundlePaths;
  self->mChangedBundlePaths = v13;

  self->mNrOfPathsChanged = 0;
  self->mShouldRescan = 0;
  -[_ACPluginDBDirectory refreshModificationDate](self, "refreshModificationDate");

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->mFullPath, CFSTR("path"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("modDate"), self->mModificationDate);
  objc_msgSend(v4, "encodeObject:forKey:", self->mBundlesByName, CFSTR("bundles"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->mPriority, CFSTR("priority"));

}

- (BOOL)refreshModificationDate
{
  double v3;

  v3 = modDate(self->mFullPath);
  self->mCurrentModificationDate = v3;
  return self->mModificationDate != v3;
}

- (void)bundlesChanged:(id)a3 shouldRescan:(BOOL)a4
{
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  os_log_t v9;
  _QWORD *v10;
  NSObject *v11;
  NSUInteger v12;
  os_log_t v13;
  NSUInteger v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  _BYTE *v20;
  char v21;
  _QWORD *v22;
  NSObject *v23;
  NSString *mFullPath;
  BOOL *v25;
  uint64_t v26;
  BOOL *v27;
  void *f;
  _BOOL4 v29;
  id obj;
  uint64_t v31;
  AudioComponentVector v32;
  AudioComponentVector v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  AudioComponentVector v38;
  AudioComponentVector v39;
  AudioComponentVector *v40;
  _BYTE buf[38];
  _BYTE v42[128];
  uint64_t v43;

  v29 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!self->mDB)
    __assert_rtn("-[_ACPluginDBDirectory bundlesChanged:shouldRescan:]", "AudioComponentPluginScanner.mm", 324, "mDB != nil");
  memset(&v39, 0, 24);
  v39.mSorted = 1;
  memset(&v38, 0, 24);
  v38.mSorted = 1;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v6)
  {
    v31 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v35 != v31)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (gAudioComponentLogCategory)
        {
          v9 = *(os_log_t *)gAudioComponentLogCategory;
        }
        else
        {
          v10 = (_QWORD *)operator new();
          v10[1] = 0;
          v9 = os_log_create("com.apple.coreaudio", "audiocomp");
          *v10 = v9;
          gAudioComponentLogCategory = (uint64_t)v10;
        }
        v11 = objc_retainAutorelease(v9);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "AudioComponentPluginScanner.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 328;
          *(_WORD *)&buf[18] = 2112;
          *(_QWORD *)&buf[20] = v8;
          _os_log_impl(&dword_18EE07000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %@ changed", buf, 0x1Cu);
        }
        v12 = -[NSString length](self->mFullPath, "length");
        if (objc_msgSend(v8, "compare:options:range:", self->mFullPath, 0, 0, v12))
        {
          if (gAudioComponentLogCategory)
          {
            v13 = *(os_log_t *)gAudioComponentLogCategory;
          }
          else
          {
            v22 = (_QWORD *)operator new();
            v22[1] = 0;
            v13 = os_log_create("com.apple.coreaudio", "audiocomp");
            *v22 = v13;
            gAudioComponentLogCategory = (uint64_t)v22;
          }
          v23 = objc_retainAutorelease(v13);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            mFullPath = self->mFullPath;
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = "AudioComponentPluginScanner.mm";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 331;
            *(_WORD *)&buf[18] = 2112;
            *(_QWORD *)&buf[20] = v8;
            *(_WORD *)&buf[28] = 2112;
            *(_QWORD *)&buf[30] = mFullPath;
            _os_log_impl(&dword_18EE07000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %@ doesn't start with %@", buf, 0x26u);
          }
          continue;
        }
        if (objc_msgSend(v8, "characterAtIndex:", v12) == 47)
          v14 = v12 + 1;
        else
          v14 = v12;
        objc_msgSend(v8, "substringFromIndex:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "pathComponents");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = access((const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), 5);
        -[NSMutableDictionary objectForKeyedSubscript:](self->mBundlesByName, "objectForKeyedSubscript:", v17);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (_BYTE *)v19;
        if (v19)
        {
          memset(buf, 0, 24);
          std::vector<std::shared_ptr<APComponent>>::__init_with_size[abi:ne180100]<std::shared_ptr<APComponent>*,std::shared_ptr<APComponent>*>(buf, *(_QWORD **)(v19 + 32), *(_QWORD **)(v19 + 40), (uint64_t)(*(_QWORD *)(v19 + 40) - *(_QWORD *)(v19 + 32)) >> 4);
          v21 = v20[56];
        }
        else
        {
          memset(buf, 0, 32);
          v21 = 1;
        }
        v25 = 0;
        buf[24] = v21;
        memset(&v33, 0, 24);
        v33.mSorted = 1;
        if (v18)
        {
          if (!v20)
            goto LABEL_31;
        }
        else
        {
          -[_ACPluginDBDirectory scanBundle:loadable:](self, "scanBundle:loadable:", v17, self->mComponentsLoadable);
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (BOOL *)v26;
          if (&v33 != (AudioComponentVector *)(v26 + 32))
            std::vector<std::shared_ptr<APComponent>>::__assign_with_size[abi:ne180100]<std::shared_ptr<APComponent>*,std::shared_ptr<APComponent>*>((uint64_t)&v33, *(uint64_t **)(v26 + 32), *(uint64_t **)(v26 + 40), (uint64_t)(*(_QWORD *)(v26 + 40) - *(_QWORD *)(v26 + 32)) >> 4);
          v33.mSorted = v27[56];
          v25 = v27;
          if (!v20)
            goto LABEL_31;
        }
        AudioComponentVector::subtract(&v32, (AudioComponentVector *)buf, &v33);
        AudioComponentVector::append(&v38, (AudioComponentVector *)v32.__begin_, (const AudioComponentVector *)v32.__end_);
        v40 = &v32;
        std::vector<std::shared_ptr<AudioMetadataTimeline::Node<AudioMetadataStreamFormat,AudioMetadataTimeline::Node<AudioMetadataTrackFormat,AudioMetadataTimeline::Node<AudioMetadataTrackUID,AudioMetadataTimeline::Node<AudioMetadataObject,AudioMetadataTimeline::Node<AudioMetadataContent,AudioMetadataTimeline::Node<AudioMetadataProgramme,AudioMetadataTimeline::Node<AudioMetadataFormatExtended,decltype(nullptr)>>>>>>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v40);
        AudioComponentVector::showAll(&v38, "removals from prevBundle");
LABEL_31:
        if (v25)
        {
          AudioComponentVector::subtract(&v32, &v33, (AudioComponentVector *)buf);
          AudioComponentVector::append(&v39, (AudioComponentVector *)v32.__begin_, (const AudioComponentVector *)v32.__end_);
          v40 = &v32;
          std::vector<std::shared_ptr<AudioMetadataTimeline::Node<AudioMetadataStreamFormat,AudioMetadataTimeline::Node<AudioMetadataTrackFormat,AudioMetadataTimeline::Node<AudioMetadataTrackUID,AudioMetadataTimeline::Node<AudioMetadataObject,AudioMetadataTimeline::Node<AudioMetadataContent,AudioMetadataTimeline::Node<AudioMetadataProgramme,AudioMetadataTimeline::Node<AudioMetadataFormatExtended,decltype(nullptr)>>>>>>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v40);
          AudioComponentVector::showAll(&v39, "additions from newBundle");
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->mBundlesByName, "setObject:forKeyedSubscript:", v25, v17);
        self->mDB->mDirty = 1;
        v32.__begin_ = &v33;
        std::vector<std::shared_ptr<AudioMetadataTimeline::Node<AudioMetadataStreamFormat,AudioMetadataTimeline::Node<AudioMetadataTrackFormat,AudioMetadataTimeline::Node<AudioMetadataTrackUID,AudioMetadataTimeline::Node<AudioMetadataObject,AudioMetadataTimeline::Node<AudioMetadataContent,AudioMetadataTimeline::Node<AudioMetadataProgramme,AudioMetadataTimeline::Node<AudioMetadataFormatExtended,decltype(nullptr)>>>>>>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v32);
        v33.__begin_ = buf;
        std::vector<std::shared_ptr<AudioMetadataTimeline::Node<AudioMetadataStreamFormat,AudioMetadataTimeline::Node<AudioMetadataTrackFormat,AudioMetadataTimeline::Node<AudioMetadataTrackUID,AudioMetadataTimeline::Node<AudioMetadataObject,AudioMetadataTimeline::Node<AudioMetadataContent,AudioMetadataTimeline::Node<AudioMetadataProgramme,AudioMetadataTimeline::Node<AudioMetadataFormatExtended,decltype(nullptr)>>>>>>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v33);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v6);
  }

  if (v29)
  {
    memset(buf, 0, 24);
    buf[24] = 1;
    memset(&v33, 0, 24);
    v33.mSorted = 1;
    -[_ACPluginDBDirectory loadAllComponents:](self, "loadAllComponents:", buf);
    -[_ACPluginDBDirectory scanDirectory](self, "scanDirectory");
    -[_ACPluginDBDirectory loadAllComponents:](self, "loadAllComponents:", &v33);
    AudioComponentVector::subtract(&v32, &v33, (AudioComponentVector *)buf);
    std::vector<std::shared_ptr<APComponent>>::__vdeallocate(&v39.__begin_);
    v39 = v32;
    memset(&v32, 0, 24);
    v40 = &v32;
    std::vector<std::shared_ptr<AudioMetadataTimeline::Node<AudioMetadataStreamFormat,AudioMetadataTimeline::Node<AudioMetadataTrackFormat,AudioMetadataTimeline::Node<AudioMetadataTrackUID,AudioMetadataTimeline::Node<AudioMetadataObject,AudioMetadataTimeline::Node<AudioMetadataContent,AudioMetadataTimeline::Node<AudioMetadataProgramme,AudioMetadataTimeline::Node<AudioMetadataFormatExtended,decltype(nullptr)>>>>>>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v40);
    AudioComponentVector::subtract(&v32, (AudioComponentVector *)buf, &v33);
    std::vector<std::shared_ptr<APComponent>>::__vdeallocate(&v38.__begin_);
    v38 = v32;
    memset(&v32, 0, 24);
    v40 = &v32;
    std::vector<std::shared_ptr<AudioMetadataTimeline::Node<AudioMetadataStreamFormat,AudioMetadataTimeline::Node<AudioMetadataTrackFormat,AudioMetadataTimeline::Node<AudioMetadataTrackUID,AudioMetadataTimeline::Node<AudioMetadataObject,AudioMetadataTimeline::Node<AudioMetadataContent,AudioMetadataTimeline::Node<AudioMetadataProgramme,AudioMetadataTimeline::Node<AudioMetadataFormatExtended,decltype(nullptr)>>>>>>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v40);
    v32.__begin_ = &v33;
    std::vector<std::shared_ptr<AudioMetadataTimeline::Node<AudioMetadataStreamFormat,AudioMetadataTimeline::Node<AudioMetadataTrackFormat,AudioMetadataTimeline::Node<AudioMetadataTrackUID,AudioMetadataTimeline::Node<AudioMetadataObject,AudioMetadataTimeline::Node<AudioMetadataContent,AudioMetadataTimeline::Node<AudioMetadataProgramme,AudioMetadataTimeline::Node<AudioMetadataFormatExtended,decltype(nullptr)>>>>>>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v32);
    v33.__begin_ = buf;
    std::vector<std::shared_ptr<AudioMetadataTimeline::Node<AudioMetadataStreamFormat,AudioMetadataTimeline::Node<AudioMetadataTrackFormat,AudioMetadataTimeline::Node<AudioMetadataTrackUID,AudioMetadataTimeline::Node<AudioMetadataObject,AudioMetadataTimeline::Node<AudioMetadataContent,AudioMetadataTimeline::Node<AudioMetadataProgramme,AudioMetadataTimeline::Node<AudioMetadataFormatExtended,decltype(nullptr)>>>>>>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v33);
  }
  if (-[_ACPluginDBDirectory refreshModificationDate](self, "refreshModificationDate"))
  {
    self->mModificationDate = self->mCurrentModificationDate;
    self->mDB->mDirty = 1;
  }
  if (v39.__begin_ != v39.__end_ || v38.__begin_ != v38.__end_)
  {
    f = self->mDB->mNotificationCallback.__f_.__f_;
    if (!f)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(void *, AudioComponentVector *, AudioComponentVector *))(*(_QWORD *)f + 48))(f, &v39, &v38);
  }
  -[_ACPluginDB writeIfDirty](self->mDB, "writeIfDirty");
  *(_QWORD *)buf = &v38;
  std::vector<std::shared_ptr<AudioMetadataTimeline::Node<AudioMetadataStreamFormat,AudioMetadataTimeline::Node<AudioMetadataTrackFormat,AudioMetadataTimeline::Node<AudioMetadataTrackUID,AudioMetadataTimeline::Node<AudioMetadataObject,AudioMetadataTimeline::Node<AudioMetadataContent,AudioMetadataTimeline::Node<AudioMetadataProgramme,AudioMetadataTimeline::Node<AudioMetadataFormatExtended,decltype(nullptr)>>>>>>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  *(_QWORD *)buf = &v39;
  std::vector<std::shared_ptr<AudioMetadataTimeline::Node<AudioMetadataStreamFormat,AudioMetadataTimeline::Node<AudioMetadataTrackFormat,AudioMetadataTimeline::Node<AudioMetadataTrackUID,AudioMetadataTimeline::Node<AudioMetadataObject,AudioMetadataTimeline::Node<AudioMetadataContent,AudioMetadataTimeline::Node<AudioMetadataProgramme,AudioMetadataTimeline::Node<AudioMetadataFormatExtended,decltype(nullptr)>>>>>>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);

}

- (void)eventStreamCallback:(id)a3 flags:(const unsigned int *)a4
{
  id v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  const unsigned int *v11;
  void *v12;
  void *v13;
  unint64_t mNrOfPathsChanged;
  dispatch_time_t v15;
  NSObject *mDispatchQueue;
  id v17;
  const unsigned int *v18;
  int v19;
  _QWORD block[6];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  self->mNrOfPathsChanged += objc_msgSend(v17, "count");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v17;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = 0;
    v9 = *(_QWORD *)v22;
    v18 = a4;
    while (2)
    {
      v10 = 0;
      v11 = &a4[v8];
      v19 = v7 + v8;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        if ((v11[v10] & 0x20) != 0)
        {
          self->mShouldRescan = 1;
          goto LABEL_14;
        }
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
        objc_msgSend(v12, "pathExtension");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "isEqualToString:", CFSTR("audiocomp")) & 1) != 0
          || objc_msgSend(v13, "isEqualToString:", CFSTR("component")))
        {
          -[NSMutableArray addObject:](self->mChangedBundlePaths, "addObject:", v12);
        }

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      a4 = v18;
      v8 = v19;
      if (v7)
        continue;
      break;
    }
  }
LABEL_14:

  mNrOfPathsChanged = self->mNrOfPathsChanged;
  v15 = dispatch_time(0, 2000000000);
  mDispatchQueue = self->mDB->mDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50___ACPluginDBDirectory_eventStreamCallback_flags___block_invoke;
  block[3] = &unk_1E2922060;
  block[4] = self;
  block[5] = mNrOfPathsChanged;
  dispatch_after(v15, mDispatchQueue, block);

}

- (void)monitorDirectory
{
  __FSEventStream *v3;
  FSEventStreamContext v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (self->mDB)
  {
    v4.version = 0;
    memset(&v4.retain, 0, 24);
    v4.info = self;
    v5[0] = self->mFullPath;
    v3 = FSEventStreamCreate(0, (FSEventStreamCallback)eventStreamCallback, &v4, (CFArrayRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1, 0, self, 0, 0, 0), 0xFFFFFFFFFFFFFFFFLL, 2.0, 0x15u);
    self->mFSMonitor = v3;
    FSEventStreamSetDispatchQueue(v3, (dispatch_queue_t)self->mDB->mDispatchQueue);
    FSEventStreamStart(self->mFSMonitor);
  }
}

- (void)loadAllComponents:(void *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableDictionary allValues](self->mBundlesByName, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "loadAllComponents:", a3);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)scanDirectory
{
  os_log_t v3;
  _QWORD *v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *mBundlesByName;
  NSMutableDictionary *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v17 = (NSMutableDictionary *)objc_opt_new();
  if (gAudioComponentLogCategory)
  {
    v3 = *(os_log_t *)gAudioComponentLogCategory;
  }
  else
  {
    v4 = (_QWORD *)operator new();
    v4[1] = 0;
    v3 = os_log_create("com.apple.coreaudio", "audiocomp");
    *v4 = v3;
    gAudioComponentLogCategory = (uint64_t)v4;
  }
  v5 = objc_retainAutorelease(v3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = -[NSString UTF8String](self->mFullPath, "UTF8String");
    *(_DWORD *)buf = 136315650;
    v24 = "AudioComponentPluginScanner.mm";
    v25 = 1024;
    v26 = 465;
    v27 = 2080;
    v28 = v6;
    _os_log_impl(&dword_18EE07000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d ACPL: Scanning %s", buf, 0x1Cu);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", self->mFullPath, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "pathExtension");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "isEqualToString:", CFSTR("audiocomp")) & 1) != 0
          || objc_msgSend(v14, "isEqualToString:", CFSTR("component")))
        {
          -[_ACPluginDBDirectory scanBundle:loadable:](self, "scanBundle:loadable:", v13, self->mComponentsLoadable);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v15, v13);

        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  mBundlesByName = self->mBundlesByName;
  self->mBundlesByName = v17;

  self->mModificationDate = self->mCurrentModificationDate;
}

- (id)scanBundle:(id)a3 loadable:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSString *v8;
  double v9;
  uint64_t v10;
  _ACPluginDBBundle *v11;
  _ACPluginDB *mDB;
  _ACPluginDBBundle *v13;

  v4 = a4;
  v6 = a3;
  -[NSString stringByAppendingPathComponent:](self->mFullPath, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("Info.plist"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = modDate(v8);
  -[NSMutableDictionary objectForKeyedSubscript:](self->mBundlesByName, "objectForKeyedSubscript:", v6);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (_ACPluginDBBundle *)v10;
  if (v10)
  {
    if (*(double *)(v10 + 16) == v9)
    {
      *(_QWORD *)(v10 + 24) = 0;
      goto LABEL_9;
    }
    *(double *)(v10 + 16) = v9;
    *(_QWORD *)(v10 + 24) = 0;
  }
  else
  {
    v11 = -[_ACPluginDBBundle initWithPath:infoPlistModDate:rsrcModDate:]([_ACPluginDBBundle alloc], "initWithPath:infoPlistModDate:rsrcModDate:", v7, v9, 0.0);
  }
  mDB = self->mDB;
  if (mDB)
    mDB->mDirty = 1;
  -[_ACPluginDBBundle scanWithPriority:loadable:infoPlistPath:](v11, "scanWithPriority:loadable:infoPlistPath:", self->mPriority, v4, v8);
LABEL_9:
  v13 = v11;

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mChangedBundlePaths, 0);
  objc_storeStrong((id *)&self->mCarbonComponentHash, 0);
  objc_storeStrong((id *)&self->mBundlesByName, 0);
  objc_storeStrong((id *)&self->mFullPath, 0);
  objc_storeStrong((id *)&self->mDB, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
