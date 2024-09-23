@implementation CNAvatarStickerGeneratorProvider

- (CNAvatarStickerGeneratorProvider)initWithAvatarRecord:(id)a3
{
  id v5;
  CNAvatarStickerGeneratorProvider *v6;
  CNAvatarStickerGeneratorProvider *v7;
  CNAvatarStickerGeneratorProvider *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNAvatarStickerGeneratorProvider;
  v6 = -[CNAvatarStickerGeneratorProvider init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_avatarRecord, a3);
    v8 = v7;
  }

  return v7;
}

- (AVTStickerGenerator)generator
{
  AVTStickerGenerator *generator;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  AVTStickerGenerator *v10;
  AVTStickerGenerator *v11;
  uint64_t v13;
  uint64_t v14;
  Class (*v15)(uint64_t);
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  generator = self->_generator;
  if (!generator)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2050000000;
    v4 = (void *)getAVTAvatarRecordRenderingClass_softClass_28942;
    v21 = getAVTAvatarRecordRenderingClass_softClass_28942;
    if (!getAVTAvatarRecordRenderingClass_softClass_28942)
    {
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __getAVTAvatarRecordRenderingClass_block_invoke_28943;
      v16 = &unk_1E204EBC0;
      v17 = &v18;
      __getAVTAvatarRecordRenderingClass_block_invoke_28943((uint64_t)&v13);
      v4 = (void *)v19[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v18, 8);
    -[CNAvatarStickerGeneratorProvider avatarRecord](self, "avatarRecord");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "avatarForRecord:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0;
    v19 = &v18;
    v20 = 0x2050000000;
    v8 = (void *)getAVTStickerGeneratorClass_softClass_28944;
    v21 = getAVTStickerGeneratorClass_softClass_28944;
    if (!getAVTStickerGeneratorClass_softClass_28944)
    {
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __getAVTStickerGeneratorClass_block_invoke_28945;
      v16 = &unk_1E204EBC0;
      v17 = &v18;
      __getAVTStickerGeneratorClass_block_invoke_28945((uint64_t)&v13);
      v8 = (void *)v19[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v18, 8);
    v10 = (AVTStickerGenerator *)objc_msgSend([v9 alloc], "initWithAvatar:", v7);
    v11 = self->_generator;
    self->_generator = v10;

    generator = self->_generator;
  }
  return generator;
}

- (void)setGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_generator, a3);
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setAvatarRecord:(id)a3
{
  objc_storeStrong((id *)&self->_avatarRecord, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_generator, 0);
}

@end
