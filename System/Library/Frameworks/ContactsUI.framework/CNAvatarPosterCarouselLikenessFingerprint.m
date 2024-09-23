@implementation CNAvatarPosterCarouselLikenessFingerprint

- (CNAvatarPosterCarouselLikenessFingerprint)initWithImpl:(id)a3
{
  id v5;
  CNAvatarPosterCarouselLikenessFingerprint *v6;
  CNAvatarPosterCarouselLikenessFingerprint *v7;
  CNAvatarPosterCarouselLikenessFingerprint *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNAvatarPosterCarouselLikenessFingerprint;
  v6 = -[CNAvatarPosterCarouselLikenessFingerprint init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_impl, a3);
    v8 = v7;
  }

  return v7;
}

- (CNAvatarPosterCarouselLikenessFingerprint)initWithPosterConfigurationData:(id)a3
{
  id v4;
  void *v5;
  _CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl *v6;
  CNAvatarPosterCarouselLikenessFingerprint *v7;

  v4 = a3;
  +[CNPRUISPosterTitleStyleAttributes attributesFromData:error:](CNPRUISPosterTitleStyleAttributes, "attributesFromData:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl initWithPosterConfigurationData:titleStyleAttributes:]([_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl alloc], "initWithPosterConfigurationData:titleStyleAttributes:", v4, v5);

  v7 = -[CNAvatarPosterCarouselLikenessFingerprint initWithImpl:](self, "initWithImpl:", v6);
  return v7;
}

- (CNAvatarPosterCarouselLikenessFingerprint)initWithAvatarVisualFingerprint:(id)a3 sourceType:(int64_t)a4
{
  id v6;
  _CNAvatarPosterCarouselLikenessFingerprintAvatarImpl *v7;
  CNAvatarPosterCarouselLikenessFingerprint *v8;

  v6 = a3;
  v7 = -[_CNAvatarPosterCarouselLikenessFingerprintAvatarImpl initWithVisualFingerprint:sourceType:]([_CNAvatarPosterCarouselLikenessFingerprintAvatarImpl alloc], "initWithVisualFingerprint:sourceType:", v6, a4);

  v8 = -[CNAvatarPosterCarouselLikenessFingerprint initWithImpl:](self, "initWithImpl:", v7);
  return v8;
}

- (CNAvatarPosterCarouselLikenessFingerprint)initWithPosterUUID:(id)a3
{
  id v4;
  _CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl *v5;
  CNAvatarPosterCarouselLikenessFingerprint *v6;

  v4 = a3;
  v5 = -[_CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl initWithPosterUUID:]([_CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl alloc], "initWithPosterUUID:", v4);

  v6 = -[CNAvatarPosterCarouselLikenessFingerprint initWithImpl:](self, "initWithImpl:", v5);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
    v8 = -[_CNAvatarPosterCarouselLikenessFingerprintImpl isEqual:](self->_impl, "isEqual:", v7[1]);
  else
    v8 = 0;

  return v8;
}

- (unint64_t)hash
{
  return -[_CNAvatarPosterCarouselLikenessFingerprintImpl hash](self->_impl, "hash");
}

- (id)description
{
  return (id)-[_CNAvatarPosterCarouselLikenessFingerprintImpl description](self->_impl, "description");
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_impl, CFSTR("impl"));
}

- (CNAvatarPosterCarouselLikenessFingerprint)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  CNAvatarPosterCarouselLikenessFingerprint *v10;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("impl"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[CNAvatarPosterCarouselLikenessFingerprint initWithImpl:](self, "initWithImpl:", v9);
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

+ (id)fingerprintForPosterConfiguration:(id)a3 withConfigurationData:(id)a4
{
  void *v4;
  CNAvatarPosterCarouselLikenessFingerprint *v5;

  +[_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl fingerprintForPosterConfiguration:withConfigurationData:](_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl, "fingerprintForPosterConfiguration:withConfigurationData:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNAvatarPosterCarouselLikenessFingerprint initWithImpl:]([CNAvatarPosterCarouselLikenessFingerprint alloc], "initWithImpl:", v4);

  return v5;
}

+ (id)fingerprintForPosterConfiguration:(id)a3 withUUID:(id)a4
{
  void *v4;
  CNAvatarPosterCarouselLikenessFingerprint *v5;

  +[_CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl fingerprintForPosterConfiguration:](_CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl, "fingerprintForPosterConfiguration:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNAvatarPosterCarouselLikenessFingerprint initWithImpl:]([CNAvatarPosterCarouselLikenessFingerprint alloc], "initWithImpl:", v4);

  return v5;
}

+ (id)fingerprintForPosterConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  void *v12;
  id v13;
  __int16 v15;
  __int16 v16;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C97408], "wallpaperTypeFromConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C97180]))
  {
    if (!+[CNMemojiPosterConfigurationReader canReadConfiguration](_TtC10ContactsUI33CNMemojiPosterConfigurationReader, "canReadConfiguration"))goto LABEL_13;
    objc_msgSend(v3, "loadUserInfoWithError:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNMemojiPosterConfigurationReader memojiPosterConfigurationDataFromUserInfo:](_TtC10ContactsUI33CNMemojiPosterConfigurationReader, "memojiPosterConfigurationDataFromUserInfo:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C97188]))
    {
      objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C97190]);
      goto LABEL_13;
    }
    if (!+[CNMonogramPosterConfigurationReader canReadConfiguration](_TtC10ContactsUI35CNMonogramPosterConfigurationReader, "canReadConfiguration"))goto LABEL_13;
    objc_msgSend(v3, "loadUserInfoWithError:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNMonogramPosterConfigurationReader monogramPosterConfigurationDataFromUserInfo:](_TtC10ContactsUI35CNMonogramPosterConfigurationReader, "monogramPosterConfigurationDataFromUserInfo:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  if (v6)
  {
    +[CNAvatarPosterCarouselLikenessFingerprint fingerprintForPosterConfiguration:withConfigurationData:](CNAvatarPosterCarouselLikenessFingerprint, "fingerprintForPosterConfiguration:withConfigurationData:", v3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      CNUILogPosters();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v16 = 0;
        v10 = "Using visual fingerprint generated from poster configuration data";
        v11 = (uint8_t *)&v16;
LABEL_18:
        _os_log_debug_impl(&dword_18AC56000, v9, OS_LOG_TYPE_DEBUG, v10, v11, 2u);
        goto LABEL_15;
      }
      goto LABEL_15;
    }
  }
  else
  {

  }
LABEL_13:
  objc_msgSend(v3, "serverUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAvatarPosterCarouselLikenessFingerprint fingerprintForPosterConfiguration:withUUID:](CNAvatarPosterCarouselLikenessFingerprint, "fingerprintForPosterConfiguration:withUUID:", v3, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    CNUILogPosters();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v15 = 0;
      v10 = "Using fingerprint generated from poster UUID";
      v11 = (uint8_t *)&v15;
      goto LABEL_18;
    }
LABEL_15:

  }
  v13 = v8;

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)fingerprintFromArchive:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;

  v3 = (objc_class *)MEMORY[0x1E0CB3710];
  v4 = a3;
  v8 = 0;
  v5 = (void *)objc_msgSend([v3 alloc], "initForReadingFromData:error:", v4, &v8);

  objc_msgSend(v5, "setRequiresSecureCoding:", 1);
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("impl"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishDecoding");

  return v6;
}

+ (id)archiveWithFingerprint:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB36F8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initRequiringSecureCoding:", 1);
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("impl"));

  objc_msgSend(v5, "finishEncoding");
  objc_msgSend(v5, "encodedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
