@implementation DEManifest

- (DEManifest)initWithName:(id)a3 contents:(id)a4 summary:(id)a5 dirDownloadType:(unint64_t)a6 version:(id)a7 keyVersion:(id)a8
{
  id v14;
  id v15;
  id v16;
  DEManifest *v17;
  NSURL *publicationURL;
  NSURL *downloadURLPrefix;
  DEManifest *v20;
  id v23;
  id v24;
  objc_super v25;

  v14 = a3;
  v24 = a4;
  v23 = a5;
  v15 = a7;
  v16 = a8;
  v25.receiver = self;
  v25.super_class = (Class)DEManifest;
  v17 = -[DEManifest init](&v25, sel_init);
  if (v17)
  {
    if (!v14)
      +[DELogging debug:](DELogging, "debug:", CFSTR("Creating manifest without name"));
    objc_storeStrong((id *)&v17->_name, a3);
    objc_storeStrong((id *)&v17->_contents, a4);
    objc_storeStrong((id *)&v17->_summary, a5);
    v17->_dirDownloadType = a6;
    objc_storeStrong((id *)&v17->_version, a7);
    objc_storeStrong((id *)&v17->_keyVersion, a8);
    publicationURL = v17->_publicationURL;
    v17->_publicationURL = 0;

    downloadURLPrefix = v17->_downloadURLPrefix;
    v17->_downloadURLPrefix = 0;

    v17->_testOnly = 0;
    v20 = v17;
  }

  return v17;
}

- (DEManifest)initWithName:(id)a3 contents:(id)a4 summary:(id)a5 dirDownloadType:(unint64_t)a6
{
  return -[DEManifest initWithName:contents:summary:dirDownloadType:version:keyVersion:](self, "initWithName:contents:summary:dirDownloadType:version:keyVersion:", a3, a4, a5, a6, 0, 0);
}

- (DEManifest)init
{
  return -[DEManifest initWithName:contents:summary:dirDownloadType:version:keyVersion:](self, "initWithName:contents:summary:dirDownloadType:version:keyVersion:", 0, 0, 0, 3, 0, 0);
}

- (BOOL)writeToURL:(id)a3 keyId:(unint64_t)a4 privateKey:(id)a5
{
  id v7;
  NSString *name;
  char *v9;
  BOOL v10;
  std::string *v11;
  NSDictionary *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  _DWORD *v21;
  uint64_t v22;
  int v23;
  siri::dialogengine::CatUpdater::Asset *v24;
  uint64_t v25;
  NSData *summary;
  void *v27;
  size_t v28;
  unint64_t dirDownloadType;
  unsigned int v30;
  NSURL *publicationURL;
  id v32;
  char *v33;
  std::string *v34;
  NSURL *downloadURLPrefix;
  id v36;
  char *v37;
  std::string *v38;
  std::string *v39;
  std::string::size_type size;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  id v46;
  char v47;
  id v50;
  void *v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  char v58[16];
  int v59;
  google::protobuf::internal::ArenaImpl *v60;
  int v61;
  int v62;
  _DWORD *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  unsigned int v69;
  char v70;
  std::string __p[2];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v50 = a5;
  v51 = v7;
  if (!v7)
  {
    +[DELogging error:](DELogging, "error:", CFSTR("Unexpected nil in Manifest:writeToURL"));
    v10 = 0;
    goto LABEL_70;
  }
  siri::dialogengine::CatUpdater::Manifest::Manifest((siri::dialogengine::CatUpdater::Manifest *)v58);
  name = self->_name;
  if (name)
  {
    v9 = -[NSString UTF8String](name, "UTF8String");
    if (v9)
    {
      v59 |= 2u;
      std::string::basic_string[abi:ne180100]<0>(__p, v9);
    }
    else
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)__p, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DialogEngine/updater/CatUpdater.pb.h", 2100);
      v11 = google::protobuf::internal::LogMessage::operator<<(__p, "CHECK failed: value != nullptr: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v70, (const char **)&v11->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&__p[0].__r_.__value_.__l.__data_);
      v59 |= 2u;
      std::string::basic_string[abi:ne180100]<0>(__p, 0);
    }
    google::protobuf::internal::ArenaStringPtr::SetNoArena(&v65, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, (__n128 *)__p);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p[0].__r_.__value_.__l.__data_);
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v12 = self->_contents;
  v13 = -[NSDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v54, v72, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v55 != v14)
          objc_enumerationMutation(v12);
        v16 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
        -[NSDictionary objectForKey:](self->_contents, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          objc_msgSend(v17, "version");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19 == 0;

          if (!v20)
          {
            v21 = v63;
            if (v63)
            {
              v22 = v61;
              v23 = *v63;
              if (v61 < *v63)
              {
                ++v61;
                v24 = *(siri::dialogengine::CatUpdater::Asset **)&v63[2 * v22 + 2];
LABEL_23:
                +[DEAsset assetToPb:asset:assetPb:](DEAsset, "assetToPb:asset:assetPb:", v16, v18, v24);
                goto LABEL_24;
              }
              if (v23 == v62)
              {
LABEL_21:
                google::protobuf::internal::RepeatedPtrFieldBase::Reserve((unsigned int *)&v60, v23 + 1);
                v21 = v63;
                v23 = *v63;
              }
              *v21 = v23 + 1;
              v24 = google::protobuf::Arena::CreateMaybeMessage<siri::dialogengine::CatUpdater::Asset>(v60);
              v25 = v61++;
              *(_QWORD *)&v63[2 * v25 + 2] = v24;
              goto LABEL_23;
            }
            v23 = v62;
            goto LABEL_21;
          }
        }
LABEL_24:

      }
      v13 = -[NSDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v54, v72, 16);
    }
    while (v13);
  }

  summary = self->_summary;
  if (summary)
  {
    v27 = -[NSData bytes](summary, "bytes");
    v28 = -[NSData length](self->_summary, "length");
    v59 |= 1u;
    std::string::basic_string[abi:ne180100](__p, v27, v28);
    google::protobuf::internal::ArenaStringPtr::SetNoArena(&v64, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, (__n128 *)__p);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p[0].__r_.__value_.__l.__data_);
  }
  dirDownloadType = self->_dirDownloadType;
  v59 |= 0x10u;
  if (dirDownloadType == 3)
  {
    v68 = 0;
  }
  else
  {
    v68 = 1;
    v30 = +[DEAsset downloadTypeToPb:](DEAsset, "downloadTypeToPb:");
    if (v30 >= 3)
      __assert_rtn("_internal_set_dir_download_type", "CatUpdater.pb.h", 2181, "::siri::dialogengine::CatUpdater::Asset_DownloadType_IsValid(value)");
    v59 |= 0x20u;
    v69 = v30;
  }
  publicationURL = self->_publicationURL;
  if (publicationURL)
  {
    -[NSURL absoluteString](publicationURL, "absoluteString");
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v33 = (char *)objc_msgSend(v32, "UTF8String");
    if (v33)
    {
      v59 |= 4u;
      std::string::basic_string[abi:ne180100]<0>(__p, v33);
    }
    else
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)__p, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DialogEngine/updater/CatUpdater.pb.h", 2228);
      v34 = google::protobuf::internal::LogMessage::operator<<(__p, "CHECK failed: value != nullptr: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v70, (const char **)&v34->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&__p[0].__r_.__value_.__l.__data_);
      v59 |= 4u;
      std::string::basic_string[abi:ne180100]<0>(__p, 0);
    }
    google::protobuf::internal::ArenaStringPtr::SetNoArena(&v66, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, (__n128 *)__p);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p[0].__r_.__value_.__l.__data_);

  }
  downloadURLPrefix = self->_downloadURLPrefix;
  if (downloadURLPrefix)
  {
    -[NSURL absoluteString](downloadURLPrefix, "absoluteString");
    v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v37 = (char *)objc_msgSend(v36, "UTF8String");
    if (v37)
    {
      v59 |= 8u;
      std::string::basic_string[abi:ne180100]<0>(__p, v37);
    }
    else
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)__p, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DialogEngine/updater/CatUpdater.pb.h", 2299);
      v38 = google::protobuf::internal::LogMessage::operator<<(__p, "CHECK failed: value != nullptr: ");
      google::protobuf::internal::LogFinisher::operator=((int)&v70, (const char **)&v38->__r_.__value_.__l.__data_);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&__p[0].__r_.__value_.__l.__data_);
      v59 |= 8u;
      std::string::basic_string[abi:ne180100]<0>(__p, 0);
    }
    google::protobuf::internal::ArenaStringPtr::SetNoArena(&v67, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, (__n128 *)__p);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p[0].__r_.__value_.__l.__data_);

  }
  memset(__p, 0, 24);
  if (google::protobuf::MessageLite::SerializeToString(v58, __p))
  {
    if ((__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v39 = __p;
    else
      v39 = (std::string *)__p[0].__r_.__value_.__r.__words[0];
    if ((__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(__p[0].__r_.__value_.__r.__words[2]);
    else
      size = __p[0].__r_.__value_.__l.__size_;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v39, size);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (!a4)
    {
      v53 = 0;
      v47 = objc_msgSend(v41, "writeToURL:options:error:", v51, 0, &v53);
      v46 = v53;
      if ((v47 & 1) != 0)
      {
        v10 = 1;
      }
      else
      {
        +[DELogging error:](DELogging, "error:", CFSTR("Failed to write manifest at \"%@\": %@"), v51, v46);
        v10 = 0;
      }
      goto LABEL_66;
    }
    +[DEEncrypted encrypt:keyId:privateKey:multipart:](DEEncrypted, "encrypt:keyId:privateKey:multipart:", v41, a4, v50, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (v43)
    {
      v52 = 0;
      v45 = objc_msgSend(v43, "writeToURL:options:error:", v51, 0, &v52);
      v46 = v52;
      if ((v45 & 1) != 0)
      {
        v10 = 1;
LABEL_64:

LABEL_66:
        goto LABEL_67;
      }
      +[DELogging error:](DELogging, "error:", CFSTR("Failed to write manifest at \"%@\": %@"), v51, v46);
    }
    else
    {
      v46 = 0;
      +[DELogging error:](DELogging, "error:", CFSTR("Failed to encrypt data to write manifest to \"%@\"), v51);
    }
    v10 = 0;
    goto LABEL_64;
  }
  +[DELogging error:](DELogging, "error:", CFSTR("Failed to serialize data to write manifest to \"%@\"), v51);
  v10 = 0;
LABEL_67:
  if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p[0].__r_.__value_.__l.__data_);
  siri::dialogengine::CatUpdater::Manifest::~Manifest((siri::dialogengine::CatUpdater::Manifest *)v58);
LABEL_70:

  return v10;
}

- (BOOL)writeToURL:(id)a3
{
  return -[DEManifest writeToURL:keyId:privateKey:](self, "writeToURL:keyId:privateKey:", a3, 0, 0);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSDictionary)contents
{
  return self->_contents;
}

- (void)setContents:(id)a3
{
  objc_storeStrong((id *)&self->_contents, a3);
}

- (NSData)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_storeStrong((id *)&self->_summary, a3);
}

- (NSData)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSData)keyVersion
{
  return self->_keyVersion;
}

- (void)setKeyVersion:(id)a3
{
  objc_storeStrong((id *)&self->_keyVersion, a3);
}

- (unint64_t)dirDownloadType
{
  return self->_dirDownloadType;
}

- (void)setDirDownloadType:(unint64_t)a3
{
  self->_dirDownloadType = a3;
}

- (NSURL)publicationURL
{
  return self->_publicationURL;
}

- (void)setPublicationURL:(id)a3
{
  objc_storeStrong((id *)&self->_publicationURL, a3);
}

- (NSURL)downloadURLPrefix
{
  return self->_downloadURLPrefix;
}

- (void)setDownloadURLPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_downloadURLPrefix, a3);
}

- (BOOL)testOnly
{
  return self->_testOnly;
}

- (void)setTestOnly:(BOOL)a3
{
  self->_testOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadURLPrefix, 0);
  objc_storeStrong((id *)&self->_publicationURL, 0);
  objc_storeStrong((id *)&self->_keyVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)manifestWithContentsOfURL:(id)a3 encrypted:(BOOL)a4 allowAllKeys:(BOOL)a5 filter:(id)a6
{
  _BOOL8 v7;
  _BOOL4 v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  DEManifest *v15;
  void *v16;
  id v17;
  int i;
  void *v19;
  uint64_t *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v27;
  id v28;
  void *__p[2];
  char v30;
  _BYTE v31[16];
  char v32;
  uint64_t v33;
  int v34;
  char v35;
  unsigned int v36;
  id v37;
  id v38[2];

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = a6;
  if (v9)
  {
    v38[0] = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v9, 0, v38);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v38[0];
    if (v12 || !v11)
    {
      if (v12)
        +[DELogging error:](DELogging, "error:", CFSTR("Failed to read manifest file at \"%@\": %@"), v9, v12);
      else
        +[DELogging error:](DELogging, "error:", CFSTR("Failed to read manifest file at \"%@\"), v9);
      v15 = 0;
      goto LABEL_41;
    }
    if (v8)
    {
      v37 = 0;
      +[DEEncrypted decrypt:allowAllKeys:keyVersion:](DEEncrypted, "decrypt:allowAllKeys:keyVersion:", v11, v7, &v37);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v37;

      if (!v13)
      {
        +[DELogging error:](DELogging, "error:", CFSTR("Failed decrypt of manifest file at \"%@\"), v9);
        v17 = 0;
        v15 = 0;
LABEL_40:

        v11 = v17;
LABEL_41:

        goto LABEL_42;
      }
      v11 = (void *)v13;
    }
    else
    {
      v14 = 0;
    }
    v16 = (void *)objc_opt_new();
    siri::dialogengine::CatUpdater::Manifest::Manifest((siri::dialogengine::CatUpdater::Manifest *)v31);
    v17 = objc_retainAutorelease(v11);
    std::string::basic_string[abi:ne180100](__p, (void *)objc_msgSend(v17, "bytes"), objc_msgSend(v17, "length"));
    if ((google::protobuf::MessageLite::ParseFromString(v31, __p) & 1) != 0)
    {
      v28 = v14;
      if ((v32 & 2) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[DELogging debug:](DELogging, "debug:", CFSTR("Failed find name in manifest file at \"%@\"), v9);
        v27 = 0;
      }
      if (v34 >= 1)
      {
        for (i = 0; i < v34; ++i)
        {
          v19 = (void *)MEMORY[0x1E0CB3940];
          v20 = *(uint64_t **)(google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<siri::dialogengine::CatUpdater::Asset>::TypeHandler>((uint64_t)&v33, i)+ 24);
          if (*((char *)v20 + 23) < 0)
            v20 = (uint64_t *)*v20;
          objc_msgSend(v19, "stringWithUTF8String:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v10 || (objc_msgSend(v10, "allows:", v21) & 1) != 0)
          {
            +[DEAsset assetFromPb:](DEAsset, "assetFromPb:", google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<siri::dialogengine::CatUpdater::Asset>::TypeHandler>((uint64_t)&v33, i));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKey:", v22, v21);

          }
        }
      }
      if ((v32 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = 0;
      }
      if (v35)
        v24 = +[DEAsset downloadTypeFromPb:](DEAsset, "downloadTypeFromPb:", v36);
      else
        v24 = 3;
      +[DEVersionWriter versionData:](DEVersionWriter, "versionData:", v17);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
        v15 = -[DEManifest initWithName:contents:summary:dirDownloadType:version:keyVersion:]([DEManifest alloc], "initWithName:contents:summary:dirDownloadType:version:keyVersion:", v27, v16, v23, v24, v25, v28);
      else
        v15 = 0;

      v12 = 0;
      v14 = v28;
    }
    else
    {
      v15 = 0;
    }
    if (v30 < 0)
      operator delete(__p[0]);
    siri::dialogengine::CatUpdater::Manifest::~Manifest((siri::dialogengine::CatUpdater::Manifest *)v31);

    goto LABEL_40;
  }
  +[DELogging error:](DELogging, "error:", CFSTR("Unexpected nil src in Manifest:manifestWithContentsOfURL"));
  v15 = 0;
LABEL_42:

  return v15;
}

+ (id)anyManifestWithContentsOfURL:(id)a3 encrypted:(BOOL)a4
{
  +[DEManifest manifestWithContentsOfURL:encrypted:allowAllKeys:filter:](DEManifest, "manifestWithContentsOfURL:encrypted:allowAllKeys:filter:", a3, a4, 1, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)manifestWithContentsOfURL:(id)a3 encrypted:(BOOL)a4 filter:(id)a5
{
  +[DEManifest manifestWithContentsOfURL:encrypted:allowAllKeys:filter:](DEManifest, "manifestWithContentsOfURL:encrypted:allowAllKeys:filter:", a3, a4, 0, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)manifestWithContentsOfURL:(id)a3 encrypted:(BOOL)a4
{
  +[DEManifest manifestWithContentsOfURL:encrypted:allowAllKeys:filter:](DEManifest, "manifestWithContentsOfURL:encrypted:allowAllKeys:filter:", a3, a4, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)manifestWithContentsOfURL:(id)a3 wasEncrypted:(BOOL *)a4 allowAllKeys:(BOOL)a5 filter:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;

  v7 = a5;
  v9 = a3;
  v10 = a6;
  +[DEManifest manifestWithContentsOfURL:encrypted:allowAllKeys:filter:](DEManifest, "manifestWithContentsOfURL:encrypted:allowAllKeys:filter:", v9, 0, v7, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (!v11)
  {
    +[DEManifest manifestWithContentsOfURL:encrypted:allowAllKeys:filter:](DEManifest, "manifestWithContentsOfURL:encrypted:allowAllKeys:filter:", v9, 1, v7, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a4 && v12)
    *a4 = v11 == 0;

  return v12;
}

+ (id)manifestWithContentsOfURL:(id)a3 wasEncrypted:(BOOL *)a4 filter:(id)a5
{
  +[DEManifest manifestWithContentsOfURL:wasEncrypted:allowAllKeys:filter:](DEManifest, "manifestWithContentsOfURL:wasEncrypted:allowAllKeys:filter:", a3, a4, 0, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)anyManifestWithContentsOfURL:(id)a3 wasEncrypted:(BOOL *)a4
{
  +[DEManifest manifestWithContentsOfURL:wasEncrypted:allowAllKeys:filter:](DEManifest, "manifestWithContentsOfURL:wasEncrypted:allowAllKeys:filter:", a3, a4, 1, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)manifestWithContentsOfURL:(id)a3
{
  +[DEManifest manifestWithContentsOfURL:wasEncrypted:allowAllKeys:filter:](DEManifest, "manifestWithContentsOfURL:wasEncrypted:allowAllKeys:filter:", a3, 0, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
