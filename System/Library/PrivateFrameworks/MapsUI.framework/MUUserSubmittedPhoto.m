@implementation MUUserSubmittedPhoto

- (MUUserSubmittedPhoto)initWithPhotoURL:(id)a3
{
  id v5;
  MUUserSubmittedPhoto *v6;
  MUUserSubmittedPhoto *v7;
  MUUserSubmittedPhoto *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)MUUserSubmittedPhoto;
    v6 = -[MUUserSubmittedPhoto init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_photoURL, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)configureWithSize:(CGSize)a3 imageProvider:(id)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSURL *photoURL;
  id v13;
  _QWORD v14[4];
  id v15;
  CGFloat v16;
  CGFloat v17;
  uint64_t v18;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "screenScale");
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0CC1750], "sharedImageManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  photoURL = self->_photoURL;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__MUUserSubmittedPhoto_configureWithSize_imageProvider___block_invoke;
  v14[3] = &unk_1E2E02048;
  v15 = v7;
  v16 = width;
  v17 = height;
  v18 = v10;
  v13 = v7;
  objc_msgSend(v11, "loadAppImageAtURL:completionHandler:", photoURL, v14);

}

void __56__MUUserSubmittedPhoto_configureWithSize_imageProvider___block_invoke(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  double v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  char v13;

  if (!a2 || a5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v8 = *(double *)(a1 + 56);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__MUUserSubmittedPhoto_configureWithSize_imageProvider___block_invoke_2;
    v10[3] = &unk_1E2E03148;
    v9 = *(id *)(a1 + 32);
    v11 = 0;
    v12 = v9;
    v13 = a3;
    +[MapsUIUtilities resizeImageIfNeeded:toFrameSize:displayScale:completion:](MapsUIUtilities, "resizeImageIfNeeded:toFrameSize:displayScale:completion:", a2, v10, *(double *)(a1 + 40), *(double *)(a1 + 48), v8);

  }
}

uint64_t __56__MUUserSubmittedPhoto_configureWithSize_imageProvider___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)photoID
{
  return self->_photoID;
}

- (void)setPhotoID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoID, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_photoURL, 0);
}

@end
