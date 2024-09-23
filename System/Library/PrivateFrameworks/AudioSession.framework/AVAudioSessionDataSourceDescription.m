@implementation AVAudioSessionDataSourceDescription

+ (id)privateCreateArray:(id)a3 portID:(id)a4 sessionID:(unsigned int)a5
{
  uint64_t v5;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  void *v12;
  AVAudioSessionDataSourceDescription *v13;
  id v14;

  v5 = *(_QWORD *)&a5;
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = objc_msgSend(v7, "count");
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v9);
    if (v9)
    {
      for (i = 0; i != v9; ++i)
      {
        objc_msgSend(v7, "objectAtIndex:", i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[AVAudioSessionDataSourceDescription initWithRawSourceDescription:andOwningPortID:andSessionID:]([AVAudioSessionDataSourceDescription alloc], "initWithRawSourceDescription:andOwningPortID:andSessionID:", v12, v8, v5);
        if (v13)
          objc_msgSend(v10, "insertObject:atIndex:", v13, i);

      }
    }
    v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v10);

  }
  else
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  }

  return v14;
}

- (AVAudioSessionDataSourceDescription)initWithRawSourceDescription:(id)a3 andOwningPortID:(id)a4 andSessionID:(unsigned int)a5
{
  id v8;
  id v9;
  AVAudioSessionDataSourceDescription *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSNumber *v20;
  StringUIntValueConverter *LocationValueConverter;
  uint64_t v22;
  void *v23;
  id v24;
  NSNumber *v25;
  StringUIntValueConverter *OrientationValueConverter;
  uint64_t v27;
  void *v28;
  AVAudioSessionDataSourceDescription *v29;
  NSObject *v30;
  objc_super v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v32.receiver = self;
  v32.super_class = (Class)AVAudioSessionDataSourceDescription;
  v10 = -[AVAudioSessionDataSourceDescription init](&v32, sel_init);
  if (!v10)
    goto LABEL_4;
  v11 = operator new();
  *(_DWORD *)v11 = a5;
  *(_OWORD *)(v11 + 8) = 0u;
  *(_OWORD *)(v11 + 24) = 0u;
  *(_OWORD *)(v11 + 40) = 0u;
  *(_OWORD *)(v11 + 56) = 0u;
  v10->_impl = (void *)v11;
  if (v8)
  {
    v12 = -[AVAudioSessionDataSourceDescription privateGetImplementation](v10, "privateGetImplementation");
    objc_storeStrong((id *)(v12 + 64), a4);
    v13 = (id)*MEMORY[0x1E0D49DC0];
    objc_msgSend(v8, "objectForKey:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(v12 + 8);
    *(_QWORD *)(v12 + 8) = v14;

    v16 = (id)*MEMORY[0x1E0D49DE0];
    objc_msgSend(v8, "objectForKey:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(void **)(v12 + 16);
    *(_QWORD *)(v12 + 16) = v17;

    v19 = (id)*MEMORY[0x1E0D49DD8];
    objc_msgSend(v8, "objectForKey:", v19);
    v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();

    LocationValueConverter = (StringUIntValueConverter *)GetLocationValueConverter();
    StringUIntValueConverter::getNSString(LocationValueConverter, v20);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(void **)(v12 + 24);
    *(_QWORD *)(v12 + 24) = v22;

    v24 = (id)*MEMORY[0x1E0D49DC8];
    objc_msgSend(v8, "objectForKey:", v24);
    v25 = (NSNumber *)objc_claimAutoreleasedReturnValue();

    OrientationValueConverter = (StringUIntValueConverter *)GetOrientationValueConverter();
    StringUIntValueConverter::getNSString(OrientationValueConverter, v25);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(void **)(v12 + 32);
    *(_QWORD *)(v12 + 32) = v27;

    -[AVAudioSessionDataSourceDescription configurePolarPatterns:](v10, "configurePolarPatterns:", v8);
LABEL_4:
    v29 = v10;
    goto LABEL_8;
  }
  v30 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog((as::client *)v11));
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "AVAudioSessionDataSourceImpl.mm";
    v35 = 1024;
    v36 = 287;
    _os_log_impl(&dword_19EF50000, v30, OS_LOG_TYPE_ERROR, "%25s:%-5d nil data source description", buf, 0x12u);
  }
  v29 = 0;
LABEL_8:

  return v29;
}

- (void)configurePolarPatterns:(id)a3
{
  id v4;
  DataSourceDescriptionImpl *v5;
  id v6;
  NSNumber *v7;
  StringUIntValueConverter *PolarPatternValueConverter;
  uint64_t v9;
  id var6;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSNumber *v18;
  StringUIntValueConverter *v19;
  void *v20;
  uint64_t v21;
  id var5;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[AVAudioSessionDataSourceDescription privateGetImplementation](self, "privateGetImplementation");
  v6 = (id)*MEMORY[0x1E0D49DE8];
  objc_msgSend(v4, "objectForKey:", v6);
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  PolarPatternValueConverter = (StringUIntValueConverter *)GetPolarPatternValueConverter();
  StringUIntValueConverter::getNSString(PolarPatternValueConverter, v7);
  v9 = objc_claimAutoreleasedReturnValue();
  var6 = v5->var6;
  v5->var6 = (id)v9;

  v11 = (id)*MEMORY[0x1E0D49DD0];
  objc_msgSend(v4, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v24;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v14);
        v18 = *(NSNumber **)(*((_QWORD *)&v23 + 1) + 8 * v17);
        v19 = (StringUIntValueConverter *)GetPolarPatternValueConverter();
        StringUIntValueConverter::getNSString(v19, v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend(v13, "addObject:", v20, (_QWORD)v23);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v15);
  }

  v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v13);
  var5 = v5->var5;
  v5->var5 = (id)v21;

  DataSourceDescriptionImpl::ValidateRequiredFields(v5);
}

- (DataSourceDescriptionImpl)privateGetImplementation
{
  return (DataSourceDescriptionImpl *)self->_impl;
}

- (NSNumber)dataSourceID
{
  return (NSNumber *)*((id *)self->_impl + 1);
}

- (void)dealloc
{
  id *impl;
  objc_super v4;

  impl = (id *)self->_impl;
  if (impl)
  {

    MEMORY[0x1A1AF1C48](impl, 0x1080C406ECF7772);
  }
  self->_impl = 0;
  v4.receiver = self;
  v4.super_class = (Class)AVAudioSessionDataSourceDescription;
  -[AVAudioSessionDataSourceDescription dealloc](&v4, sel_dealloc);
}

- (AVAudioSessionDataSourceDescription)initWithSessionID:(unsigned int)a3
{
  AVAudioSessionDataSourceDescription *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVAudioSessionDataSourceDescription;
  v4 = -[AVAudioSessionDataSourceDescription init](&v7, sel_init);
  if (v4)
  {
    v5 = operator new();
    *(_DWORD *)v5 = a3;
    *(_OWORD *)(v5 + 8) = 0u;
    *(_OWORD *)(v5 + 24) = 0u;
    *(_OWORD *)(v5 + 40) = 0u;
    *(_OWORD *)(v5 + 56) = 0u;
    v4->_impl = (void *)v5;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  AVAudioSessionDataSourceDescription *v4;
  AVAudioSessionDataSourceDescription *v5;
  BOOL v6;

  v4 = (AVAudioSessionDataSourceDescription *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[AVAudioSessionDataSourceDescription isEqualToDataSource:](self, "isEqualToDataSource:", v5);

  return v6;
}

- (BOOL)isEqualToDataSource:(id)a3
{
  AVAudioSessionDataSourceDescription *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  BOOL v25;
  void *v26;

  v4 = (AVAudioSessionDataSourceDescription *)a3;
  if (self == v4)
    goto LABEL_13;
  -[AVAudioSessionDataSourceDescription privateGetOwningPortID](self, "privateGetOwningPortID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAudioSessionDataSourceDescription privateGetOwningPortID](v4, "privateGetOwningPortID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToNumber:", v6);

  if ((v7 & 1) == 0)
    goto LABEL_15;
  -[AVAudioSessionDataSourceDescription dataSourceID](self, "dataSourceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAudioSessionDataSourceDescription dataSourceID](v4, "dataSourceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToNumber:", v9);

  if ((v10 & 1) == 0)
    goto LABEL_15;
  -[AVAudioSessionDataSourceDescription dataSourceName](self, "dataSourceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAudioSessionDataSourceDescription dataSourceName](v4, "dataSourceName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if ((v13 & 1) == 0)
    goto LABEL_15;
  -[AVAudioSessionDataSourceDescription orientation](self, "orientation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[AVAudioSessionDataSourceDescription orientation](v4, "orientation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_15;
    -[AVAudioSessionDataSourceDescription orientation](self, "orientation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAudioSessionDataSourceDescription orientation](v4, "orientation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqualToString:", v17);

    if ((v18 & 1) == 0)
      goto LABEL_15;
  }
  else
  {
    -[AVAudioSessionDataSourceDescription orientation](v4, "orientation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      goto LABEL_15;
  }
  -[AVAudioSessionDataSourceDescription selectedPolarPattern](self, "selectedPolarPattern");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[AVAudioSessionDataSourceDescription selectedPolarPattern](v4, "selectedPolarPattern");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[AVAudioSessionDataSourceDescription selectedPolarPattern](self, "selectedPolarPattern");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVAudioSessionDataSourceDescription selectedPolarPattern](v4, "selectedPolarPattern");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqualToString:", v23);

      if ((v24 & 1) != 0)
        goto LABEL_13;
    }
LABEL_15:
    v25 = 0;
    goto LABEL_16;
  }
  -[AVAudioSessionDataSourceDescription selectedPolarPattern](v4, "selectedPolarPattern");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
    goto LABEL_15;
LABEL_13:
  v25 = 1;
LABEL_16:

  return v25;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[AVAudioSessionDataSourceDescription dataSourceID](self, "dataSourceID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)dataSourceName
{
  return (NSString *)*((id *)self->_impl + 2);
}

- (AVAudioSessionLocation)location
{
  return (AVAudioSessionLocation)*((id *)self->_impl + 3);
}

- (AVAudioSessionOrientation)orientation
{
  return (AVAudioSessionOrientation)*((id *)self->_impl + 4);
}

- (AVAudioSessionPolarPattern)selectedPolarPattern
{
  return (AVAudioSessionPolarPattern)*((id *)self->_impl + 6);
}

- (AVAudioSessionPolarPattern)preferredPolarPattern
{
  copyPolarPatternPreference(*(unsigned int *)self->_impl, *((NSNumber **)self->_impl + 8), *((NSNumber **)self->_impl + 1));
  return (AVAudioSessionPolarPattern)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)supportedPolarPatterns
{
  return (NSArray *)*((id *)self->_impl + 5);
}

- (id)description
{
  _QWORD *impl;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  impl = self->_impl;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p, ID = %@; name = %@>"), v6, self, impl[1], impl[2]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)setPreferredPolarPattern:(AVAudioSessionPolarPattern)pattern error:(NSError *)outError
{
  NSString *v7;
  NSString **impl;
  StringUIntValueConverter *PolarPatternValueConverter;
  unint64_t UInt32;
  char v11;
  StringUIntValueConverter *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  void *v19;
  id v20;
  void *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  as::client::XPCConnection *v31;
  std::__shared_weak_count *v32;
  as::client::XPCConnection *v33;
  std::__shared_weak_count *v34;

  v7 = pattern;
  impl = (NSString **)self->_impl;
  if (v7)
  {
    PolarPatternValueConverter = (StringUIntValueConverter *)GetPolarPatternValueConverter();
    UInt32 = StringUIntValueConverter::getUInt32(PolarPatternValueConverter, v7);
    if ((UInt32 & 1) == 0)
    {
      if (outError)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, 0);
        v11 = 0;
        *outError = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
      goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIDWORD(UInt32));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0C99D80];
    -[AVAudioSessionDataSourceDescription privateGetOwningPortID](self, "privateGetOwningPortID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAudioSessionDataSourceDescription dataSourceID](self, "dataSourceID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryWithObjectsAndKeys:", v15, CFSTR("SelectedRouteDescription_RouteID"), v16, CFSTR("SelectedRouteDescription_DataSourceID"), v13, CFSTR("SelectedRouteDescription_MicrophonePolarPattern"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id *)MEMORY[0x1E0D49AA0];
  }
  else
  {
    v12 = (StringUIntValueConverter *)GetPolarPatternValueConverter();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (unint64_t)StringUIntValueConverter::getUInt32(v12, impl[7]) >> 32);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0C99D80];
    -[AVAudioSessionDataSourceDescription privateGetOwningPortID](self, "privateGetOwningPortID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAudioSessionDataSourceDescription dataSourceID](self, "dataSourceID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v15, CFSTR("SelectedRouteDescription_RouteID"), v16, CFSTR("SelectedRouteDescription_DataSourceID"), v13, CFSTR("SelectedRouteDescription_MicrophonePolarPattern"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id *)MEMORY[0x1E0D49720];
  }

  v20 = *v18;
  objc_storeStrong((id *)impl + 7, pattern);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  AVAudioSessionGetXPCConnection(*(_DWORD *)impl, &v33);
  v31 = v33;
  v32 = v34;
  if (v34)
  {
    p_shared_owners = (unint64_t *)&v34->__shared_owners_;
    do
      v23 = __ldxr(p_shared_owners);
    while (__stxr(v23 + 1, p_shared_owners));
  }
  as::client::api_utils::SetPropertyXPC(&v31, *(unsigned int *)impl, v20, v21, 1);
  v24 = v32;
  if (v32)
  {
    v25 = (unint64_t *)&v32->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  v11 = FormatNSErrorForReturn();
  v27 = v34;
  if (v34)
  {
    v28 = (unint64_t *)&v34->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }

LABEL_21:
  return v11;
}

- (id)privateGetOwningPortID
{
  return *((id *)self->_impl + 8);
}

@end
