@implementation AVTAvatarLibraryRecordItem

+ (id)cellIdentifier
{
  return CFSTR("AVTAvatarLibraryCollectionViewCell");
}

- (AVTAvatarLibraryRecordItem)initWithAvatarRecord:(id)a3 environment:(id)a4
{
  id v7;
  id v8;
  AVTAvatarLibraryRecordItem *v9;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AVTAvatarLibraryRecordItem;
  v9 = -[AVTAvatarLibraryRecordItem init](&v11, sel_init);
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v7);
    objc_storeStrong((id *)&v9->_avatarRecord, a3);
    objc_storeStrong((id *)&v9->_environment, a4);
  }

  return v9;
}

- (void)configureCell:(id)a3 imageProvider:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  AVTRenderingScope *v12;
  void *v13;
  _QWORD *v14;
  uint64_t (*v15)(_QWORD *, _QWORD *, uint64_t);
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v6);
  v8 = v6;
  -[AVTAvatarLibraryRecordItem environment](self, "environment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mainScreenScale");
  v11 = v10;

  v12 = -[AVTRenderingScope initWithRenderingType:scale:]([AVTRenderingScope alloc], "initWithRenderingType:scale:", 101, v11);
  -[AVTAvatarLibraryRecordItem avatarRecord](self, "avatarRecord");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "providerForRecord:scope:", v13, v12);
  v14 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __58__AVTAvatarLibraryRecordItem_configureCell_imageProvider___block_invoke;
  v18[3] = &unk_1EA51CDE8;
  v19 = v8;
  v15 = (uint64_t (*)(_QWORD *, _QWORD *, uint64_t))v14[2];
  v16 = v8;
  v17 = (id)v15(v14, v18, 1);

}

uint64_t __58__AVTAvatarLibraryRecordItem_configureCell_imageProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAvatarImage:", a2);
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
}

@end
