@implementation DEAsset

- (NSData)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSData)encryptedVersion
{
  return self->_encryptedVersion;
}

- (void)setEncryptedVersion:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedVersion, a3);
}

- (unint64_t)downloadType
{
  return self->_downloadType;
}

- (void)setDownloadType:(unint64_t)a3
{
  self->_downloadType = a3;
}

- (unint64_t)encryptedSize
{
  return self->_encryptedSize;
}

- (void)setEncryptedSize:(unint64_t)a3
{
  self->_encryptedSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

+ (int)downloadTypeToPb:(unint64_t)a3
{
  int v3;

  if (a3 == 1)
    v3 = 1;
  else
    v3 = 2;
  if (a3)
    return v3;
  else
    return 0;
}

+ (unint64_t)downloadTypeFromPb:(int)a3
{
  if (a3 >= 3)
    return 3;
  else
    return a3;
}

+ (id)assetFromPb:(const void *)a3
{
  __int128 *v4;
  __int128 v5;
  __int128 *v6;
  __int128 v7;
  void *v8;
  std::string *v9;
  std::string::size_type size;
  void *v11;
  std::string *p_p;
  std::string::size_type v13;
  void *v14;
  std::string __p;
  std::string v17;

  v4 = (__int128 *)*((_QWORD *)a3 + 4);
  if (*((char *)v4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v17, *(const std::string::value_type **)v4, *((_QWORD *)v4 + 1));
  }
  else
  {
    v5 = *v4;
    v17.__r_.__value_.__r.__words[2] = *((_QWORD *)v4 + 2);
    *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v5;
  }
  v6 = (__int128 *)*((_QWORD *)a3 + 5);
  if (*((char *)v6 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v6, *((_QWORD *)v6 + 1));
  }
  else
  {
    v7 = *v6;
    __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v6 + 2);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v7;
  }
  v8 = (void *)objc_opt_new();
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v9 = &v17;
  else
    v9 = (std::string *)v17.__r_.__value_.__r.__words[0];
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v17.__r_.__value_.__r.__words[2]);
  else
    size = v17.__r_.__value_.__l.__size_;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v9, size, __p.__r_.__value_.__r.__words[0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVersion:", v11);

  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v13 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v13 = __p.__r_.__value_.__l.__size_;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", p_p, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEncryptedVersion:", v14);

  objc_msgSend(v8, "setDownloadType:", +[DEAsset downloadTypeFromPb:](DEAsset, "downloadTypeFromPb:", *((unsigned int *)a3 + 14)));
  objc_msgSend(v8, "setEncryptedSize:", *((int *)a3 + 12));
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__r_.__value_.__l.__data_);
  return v8;
}

+ (void)assetToPb:(id)a3 asset:(id)a4 assetPb:(void *)a5
{
  id v7;
  id v8;
  id v9;
  char *v10;
  std::string *v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  size_t v16;
  id v17;
  void *v18;
  void *v19;
  size_t v20;
  unsigned int v21;
  uint64_t v22;
  char v23;
  std::string __p[2];

  v7 = a3;
  v8 = a4;
  v9 = objc_retainAutorelease(v7);
  v10 = (char *)objc_msgSend(v9, "UTF8String");
  if (v10)
  {
    *((_DWORD *)a5 + 4) |= 1u;
    std::string::basic_string[abi:ne180100]<0>(__p, v10);
  }
  else
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)__p, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DialogEngine/updater/CatUpdater.pb.h", 1716);
    v11 = google::protobuf::internal::LogMessage::operator<<(__p, "CHECK failed: value != nullptr: ");
    google::protobuf::internal::LogFinisher::operator=((int)&v23, (const char **)&v11->__r_.__value_.__l.__data_);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&__p[0].__r_.__value_.__l.__data_);
    *((_DWORD *)a5 + 4) |= 1u;
    std::string::basic_string[abi:ne180100]<0>(__p, 0);
  }
  *(_QWORD *)&v12 = google::protobuf::internal::ArenaStringPtr::SetNoArena((uint64_t *)a5 + 3, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, (__n128 *)__p).n128_u64[0];
  if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p[0].__r_.__value_.__l.__data_);
  objc_msgSend(v8, "version", v12);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = (void *)objc_msgSend(v13, "bytes");
  objc_msgSend(v8, "version");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");
  *((_DWORD *)a5 + 4) |= 2u;
  std::string::basic_string[abi:ne180100](__p, v14, v16);
  google::protobuf::internal::ArenaStringPtr::SetNoArena((uint64_t *)a5 + 4, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, (__n128 *)__p);
  if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p[0].__r_.__value_.__l.__data_);

  objc_msgSend(v8, "encryptedVersion");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = (void *)objc_msgSend(v17, "bytes");
  objc_msgSend(v8, "encryptedVersion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "length");
  *((_DWORD *)a5 + 4) |= 4u;
  std::string::basic_string[abi:ne180100](__p, v18, v20);
  google::protobuf::internal::ArenaStringPtr::SetNoArena((uint64_t *)a5 + 5, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, (__n128 *)__p);
  if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p[0].__r_.__value_.__l.__data_);

  v21 = +[DEAsset downloadTypeToPb:](DEAsset, "downloadTypeToPb:", objc_msgSend(v8, "downloadType"));
  if (v21 >= 3)
    __assert_rtn("_internal_set_download_type", "CatUpdater.pb.h", 1840, "::siri::dialogengine::CatUpdater::Asset_DownloadType_IsValid(value)");
  *((_DWORD *)a5 + 4) |= 0x10u;
  *((_DWORD *)a5 + 14) = v21;
  v22 = objc_msgSend(v8, "encryptedSize");
  *((_DWORD *)a5 + 4) |= 8u;
  *((_QWORD *)a5 + 6) = v22;

}

@end
