@implementation _PHPhotoLibraryValidator

- (_PHPhotoLibraryValidator)initWithPhotoLibrary:(id)a3
{
  id v4;
  _PHPhotoLibraryValidator *v5;
  _PHPhotoLibraryValidator *v6;

  v4 = a3;
  v5 = -[_PHPhotoLibraryValidator init](self, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_photoLibrary, v4);

  return v6;
}

- (BOOL)isValidImagePathExtension:(id)a3
{
  return objc_msgSend(MEMORY[0x1E0D719A8], "isImageFileExtension:", a3);
}

- (BOOL)isValidVideoPathExtension:(id)a3
{
  return objc_msgSend(MEMORY[0x1E0D719A8], "isVideoFileExtension:", a3);
}

- (PLPhotoLibrary)photoLibrary
{
  return (PLPhotoLibrary *)objc_loadWeakRetained((id *)&self->_photoLibrary);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_photoLibrary);
}

@end
