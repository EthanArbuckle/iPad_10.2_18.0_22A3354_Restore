@implementation CKVideoTrimController

- (CKVideoTrimController)initWithMediaObject:(id)a3 maxTrimDuration:(double)a4
{
  id v6;
  CKVideoTrimController *v7;
  CKVideoTrimController *v8;
  CKUIVideoEditorController *v9;
  CKUIVideoEditorController *editVideoVC;
  CKUIVideoEditorController *v11;
  void *v12;
  void *v13;
  void *v14;
  CKUIVideoEditorController *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CKVideoTrimController;
  v7 = -[CKVideoTrimController init](&v19, sel_init);
  v8 = v7;
  if (v7)
  {
    -[CKVideoTrimController setOriginalMediaObject:](v7, "setOriginalMediaObject:", v6);
    v9 = objc_alloc_init(CKUIVideoEditorController);
    editVideoVC = v8->_editVideoVC;
    v8->_editVideoVC = v9;

    -[CKUIVideoEditorController setDelegate:](v8->_editVideoVC, "setDelegate:", v8);
    -[UIVideoEditorController setVideoQuality:](v8->_editVideoVC, "setVideoQuality:", 0);
    -[UIVideoEditorController setVideoMaximumDuration:](v8->_editVideoVC, "setVideoMaximumDuration:", a4);
    v11 = v8->_editVideoVC;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVideoEditorController _setValue:forProperty:](v11, "_setValue:forProperty:", v12, *MEMORY[0x1E0CEC070]);

    objc_msgSend(v6, "transcoderUserInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0D37EC0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = v8->_editVideoVC;
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVideoEditorController _setVideoURL:](v15, "_setVideoURL:", v16);
    }
    else
    {
      objc_msgSend(v6, "fileURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVideoEditorController setVideoPath:](v8->_editVideoVC, "setVideoPath:", v17);

    }
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)CKVideoTrimController;
  -[CKVideoTrimController dealloc](&v3, sel_dealloc);
}

- (void)videoEditorController:(id)a3 didTrimVideoWithOptions:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  -[CKVideoTrimController originalMediaObject](self, "originalMediaObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transcoderUserInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "mutableCopy");

  if (!v7)
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  CKTranscoderUserInfoForVideoTrimOptions(v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v8);

  +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKVideoTrimController originalMediaObject](self, "originalMediaObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fileURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediaObjectWithFileURL:filename:transcoderUserInfo:", v11, 0, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKVideoTrimController setTrimmedMediaObject:](self, "setTrimmedMediaObject:", v12);

  -[CKVideoTrimController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKVideoTrimController originalMediaObject](self, "originalMediaObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKVideoTrimController trimmedMediaObject](self, "trimmedMediaObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trimController:didFinishTrimmingMediaObject:withReplacementMediaObject:", self, v14, v15);

}

- (void)videoEditorController:(id)a3 didSaveEditedVideoToPath:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a4;
  objc_msgSend(v5, "stringGUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("trimmed-%@.mov"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "im_randomTemporaryFileURLWithFileName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  LODWORD(v9) = objc_msgSend(v12, "moveItemAtPath:toPath:error:", v6, v11, &v23);

  v13 = v23;
  if ((_DWORD)v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v11, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKVideoTrimController originalMediaObject](self, "originalMediaObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "transcoderUserInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "mediaObjectWithFileURL:filename:transcoderUserInfo:", v14, 0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKVideoTrimController setTrimmedMediaObject:](self, "setTrimmedMediaObject:", v18);

  }
  else
  {
    v22 = v13;
    _IMWarn();
  }
  -[CKVideoTrimController delegate](self, "delegate", v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKVideoTrimController originalMediaObject](self, "originalMediaObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKVideoTrimController trimmedMediaObject](self, "trimmedMediaObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trimController:didFinishTrimmingMediaObject:withReplacementMediaObject:", self, v20, v21);

}

- (void)videoEditorControllerDidCancel:(id)a3
{
  id v4;

  -[CKVideoTrimController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trimControllerDidCancel:", self);

}

- (void)videoEditorController:(id)a3 didFailWithError:(id)a4
{
  id v5;

  -[CKVideoTrimController delegate](self, "delegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trimControllerDidCancel:", self);

}

- (CKMediaObject)originalMediaObject
{
  return self->_originalMediaObject;
}

- (void)setOriginalMediaObject:(id)a3
{
  objc_storeStrong((id *)&self->_originalMediaObject, a3);
}

- (CKMediaObject)trimmedMediaObject
{
  return self->_trimmedMediaObject;
}

- (void)setTrimmedMediaObject:(id)a3
{
  objc_storeStrong((id *)&self->_trimmedMediaObject, a3);
}

- (CKTrimControllerDelegate)delegate
{
  return (CKTrimControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKUIVideoEditorController)editVideoVC
{
  return self->_editVideoVC;
}

- (void)setEditVideoVC:(id)a3
{
  objc_storeStrong((id *)&self->_editVideoVC, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editVideoVC, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trimmedMediaObject, 0);
  objc_storeStrong((id *)&self->_originalMediaObject, 0);
}

@end
